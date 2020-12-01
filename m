Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498A12C9FE9
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 11:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgLAKfj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 05:35:39 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:24193 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgLAKfd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 05:35:33 -0500
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 0B1AYKHe001992;
        Tue, 1 Dec 2020 19:34:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 0B1AYKHe001992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606818862;
        bh=i37+zqZSzrwcTNUz41QeVDNOiK6gezcrp96I/UStGaI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AFyV7ComY4FoubsXkgkIycOQzS9VGhCO7ys9CNWPvpwTFcNpwVjMA5KelTClnfhF5
         wH+srY63LjP175r+8C/xxfb8zZwbcfJIZiX2K2xkcCr0kmJ1rpt87sr88tHu4NmziR
         NiK51tuj8HJW9bOBqbDslzOl5eUpsytvpjSz4M436A8fuwbEiZYeoCdtAV2hWIYY9n
         BOCuIFQD0Px4btvv9XsYW1fmooHblnuZXWnKn6Ri+WuAExkzea3nNtd6qcvkdrZw7x
         /YQGZefkvB6XDDNRKKEH0UHot2YZEAUskIGJ0GQ3cncDlEU4WE7/+/mt9AGAK/A4HG
         BwlKwIHKV25Uw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Quentin Perret <qperret@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] modpost: refactor error handling and clarify error/fatal difference
Date:   Tue,  1 Dec 2020 19:34:15 +0900
Message-Id: <20201201103418.675850-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201103418.675850-1-masahiroy@kernel.org>
References: <20201201103418.675850-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We have 3 log functions. fatal() is special because it lets modpost bail
out immediately. The difference between warn() and error() is the only
prefix parts ("WARNING:" vs "ERROR:").

The intended usage of error() is probably to propagate the return code
from the function to the exit code of modpost, as check_exports() etc.
already does. This is a good manner because we should display as many
issues as possible in a single run of modpost.

What is annoying about fatal() is that it kills modpost at the first
error. People would need to run Kbuild again and again until they fix
all errors.

But, unfortunately, people tend to do:
"This case should not be allowed. Let's replace warn() with fatal()."

One of the reasons is probably it is tedious to manually carry the error
code back to the main() function.

This commit refactors error() so any single call for it automatically
makes modpost return the error code.

I also added comments in modpost.h for warn(), error(), and fatal().

Again, please use fatal() only when you have a strong reason to do so.
For example:

  - Memory shortage (i.e. malloc() etc. has failed)
  - The ELF file is broken, and there is no point to continue parsing
  - Something really odd has happened

For general coding errors, please use error().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 43 ++++++++++++++-----------------------------
 scripts/mod/modpost.h | 13 +++++++++++++
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 337f6ca4bda3..43e00867623a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -40,6 +40,8 @@ static int ignore_missing_files;
 /* If set to 1, only warn (instead of error) about missing ns imports */
 static int allow_missing_ns_imports;
 
+static bool error_occurred;
+
 enum export {
 	export_plain,      export_unused,     export_gpl,
 	export_unused_gpl, export_gpl_future, export_unknown
@@ -78,6 +80,8 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...)
 
 	if (loglevel == LOG_FATAL)
 		exit(1);
+	if (loglevel == LOG_ERROR)
+		error_occurred = true;
 }
 
 static inline bool strends(const char *str, const char *postfix)
@@ -2174,22 +2178,18 @@ static void check_for_unused(enum export exp, const char *m, const char *s)
 	}
 }
 
-static int check_exports(struct module *mod)
+static void check_exports(struct module *mod)
 {
 	struct symbol *s, *exp;
-	int err = 0;
 
 	for (s = mod->unres; s; s = s->next) {
 		const char *basename;
 		exp = find_symbol(s->name);
 		if (!exp || exp->module == mod) {
-			if (have_vmlinux && !s->weak) {
+			if (have_vmlinux && !s->weak)
 				modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
 					    "\"%s\" [%s.ko] undefined!\n",
 					    s->name, mod->name);
-				if (!warn_unresolved)
-					err = 1;
-			}
 			continue;
 		}
 		basename = strrchr(mod->name, '/');
@@ -2203,8 +2203,6 @@ static int check_exports(struct module *mod)
 			modpost_log(allow_missing_ns_imports ? LOG_WARN : LOG_ERROR,
 				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
 				    basename, exp->name, exp->namespace);
-			if (!allow_missing_ns_imports)
-				err = 1;
 			add_namespace(&mod->missing_namespaces, exp->namespace);
 		}
 
@@ -2212,11 +2210,9 @@ static int check_exports(struct module *mod)
 			check_for_gpl_usage(exp->export, basename, exp->name);
 		check_for_unused(exp->export, basename, exp->name);
 	}
-
-	return err;
 }
 
-static int check_modname_len(struct module *mod)
+static void check_modname_len(struct module *mod)
 {
 	const char *mod_name;
 
@@ -2225,12 +2221,8 @@ static int check_modname_len(struct module *mod)
 		mod_name = mod->name;
 	else
 		mod_name++;
-	if (strlen(mod_name) >= MODULE_NAME_LEN) {
+	if (strlen(mod_name) >= MODULE_NAME_LEN)
 		error("module name is too long [%s.ko]\n", mod->name);
-		return 1;
-	}
-
-	return 0;
 }
 
 /**
@@ -2289,10 +2281,9 @@ static void add_staging_flag(struct buffer *b, const char *name)
 /**
  * Record CRCs for unresolved symbols
  **/
-static int add_versions(struct buffer *b, struct module *mod)
+static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s, *exp;
-	int err = 0;
 
 	for (s = mod->unres; s; s = s->next) {
 		exp = find_symbol(s->name);
@@ -2304,7 +2295,7 @@ static int add_versions(struct buffer *b, struct module *mod)
 	}
 
 	if (!modversions)
-		return err;
+		return;
 
 	buf_printf(b, "\n");
 	buf_printf(b, "static const struct modversion_info ____versions[]\n");
@@ -2321,7 +2312,6 @@ static int add_versions(struct buffer *b, struct module *mod)
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
 			error("too long symbol \"%s\" [%s.ko]\n",
 			      s->name, mod->name);
-			err = 1;
 			break;
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
@@ -2329,8 +2319,6 @@ static int add_versions(struct buffer *b, struct module *mod)
 	}
 
 	buf_printf(b, "};\n");
-
-	return err;
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
@@ -2554,7 +2542,6 @@ int main(int argc, char **argv)
 	char *missing_namespace_deps = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
-	int err;
 	int n;
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
@@ -2624,8 +2611,6 @@ int main(int argc, char **argv)
 	if (!have_vmlinux)
 		warn("Symbol info of vmlinux is missing. Unresolved symbol check will be entirely skipped.\n");
 
-	err = 0;
-
 	for (mod = modules; mod; mod = mod->next) {
 		char fname[PATH_MAX];
 
@@ -2634,14 +2619,14 @@ int main(int argc, char **argv)
 
 		buf.pos = 0;
 
-		err |= check_modname_len(mod);
-		err |= check_exports(mod);
+		check_modname_len(mod);
+		check_exports(mod);
 
 		add_header(&buf, mod);
 		add_intree_flag(&buf, !external_module);
 		add_retpoline(&buf);
 		add_staging_flag(&buf, mod->name);
-		err |= add_versions(&buf, mod);
+		add_versions(&buf, mod);
 		add_depends(&buf, mod);
 		add_moddevtable(&buf, mod);
 		add_srcversion(&buf, mod);
@@ -2671,5 +2656,5 @@ int main(int argc, char **argv)
 
 	free(buf.p);
 
-	return err;
+	return error_occurred ? 1 : 0;
 }
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index f453504ad4df..e6f46eee0af0 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -201,6 +201,19 @@ enum loglevel {
 
 void modpost_log(enum loglevel loglevel, const char *fmt, ...);
 
+/*
+ * warn - show the given message, then let modpost continue running, still
+ *        allowing modpost to exit successfully. This should be used when
+ *        we still allow to generate vmlinux and modules.
+ *
+ * error - show the given message, then let modpost continue running, but fail
+ *         in the end. This should be used when we should stop building vmlinux
+ *         or modules, but we can continue running modpost to catch as many
+ *         issues as possible.
+ *
+ * fatal - show the given message, and bail out immediately. This should be
+ *         used when there is no point to continue running modpost.
+ */
 #define warn(fmt, args...)	modpost_log(LOG_WARN, fmt, ##args)
 #define error(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
 #define fatal(fmt, args...)	modpost_log(LOG_FATAL, fmt, ##args)
-- 
2.27.0

