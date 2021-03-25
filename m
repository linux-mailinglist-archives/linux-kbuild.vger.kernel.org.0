Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03933499C4
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 19:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhCYSzH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 14:55:07 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:40401 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhCYSyh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 14:54:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 12PIsD6X025746;
        Fri, 26 Mar 2021 03:54:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 12PIsD6X025746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616698455;
        bh=CkmzuG6UHxRu3hG4QdZRDkz3f/FNuz3s7LYEFdfrRzc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TrunQzTmMD0jCMkHTe/DCWMei7geXFU77bI4q8AZhqJ90MwkWRckT9yMi7fDArYUP
         OSGZba7GlniiOKPdNJv9gHzJ2RM0MRJZzrrHxLE1wxEKIEn3NlXibaeBNy8dptsByj
         MlDZmOlKaphPaQuarXWEizXx0rJA+IIVeZhvfv1PUjrLVVVDPSu3gWkNKY9u5ja6Sh
         /DIjshvKDMD5Zx4tB9ilKHUwFELKM2Ol+frZWBL+B0QPJA6ORvsiwsaGWn7KfTdmtW
         WwhQO4VwVTpFEbtqpL0gCr4xXXKjErs16FOlxjFiw0TWO3okCjCI1lW9YKaqVfHOBl
         mg4zb+rzEG8JQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 3/3] kbuild: fix false-positive modpost warning when all symbols are trimmed
Date:   Fri, 26 Mar 2021 03:54:11 +0900
Message-Id: <20210325185412.2352951-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210325185412.2352951-1-masahiroy@kernel.org>
References: <20210325185412.2352951-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nathan reports that the mips defconfig emits the following warning:

  WARNING: modpost: Symbol info of vmlinux is missing. Unresolved symbol check will be entirely skipped.

This false-positive happens under the following combination:

 - CONFIG_TRIM_UNUSED_KSYMS=y
 - CONFIG_MODULES=y
 - No CONFIG option is set to 'm'

Commit a0590473c5e6 ("nfs: fix PNFS_FLEXFILE_LAYOUT Kconfig default")
turned the last 'm' into 'y' for the mips defconfig, and uncovered
this issue.

In this case, the module feature itself is enabled, but we have no
module. As a result, CONFIG_TRIM_UNUSED_KSYMS drops all the instances
of EXPORT_SYMBOL. Then, modpost wrongly assumes vmlinux is missing
because vmlinux.symvers is empty. (Or, you can create a module that
does not use any symbol of vmlinux).

The current behavior is to entirely suppress the unresolved symbol
warnings when vmlinux is missing just because there are too many.
I found the origin of this code in the historical git tree. [1]

If this is a matter of noisiness, I think modpost can display the
first 10 warnings, and the number of suppressed warnings at the end.

You will get a bit noisier logs when you run 'make modules' without
vmlinux, but such warnings are better to show because you never know
the resulting modules are actually loadable or not.

This commit changes as follows:

 - If any of input *.symver files is missing, pass -w option to let
   the module build keep going with warnings instead of errors.

 - If there are too many (10+) unresolved symbol warnings, show only
   the first 10, and also the number of suppressed warnings.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=1cc0e0529569bf6a94f6d49770aa6d4b599d2c46

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost |  7 +++++--
 scripts/mod/modpost.c    | 25 ++++++++++++-------------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index b3e08fb1fd56..c383ba33d837 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -98,9 +98,11 @@ output-symdump := $(KBUILD_EXTMOD)/Module.symvers
 
 endif
 
+existing-input-symdump := $(wildcard $(input-symdump))
+
 # modpost options for modules (both in-kernel and external)
 MODPOST += \
-	$(addprefix -i ,$(wildcard $(input-symdump))) \
+	$(addprefix -i ,$(existing-input-symdump)) \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS)) \
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
 
@@ -114,6 +116,7 @@ VPATH :=
 $(input-symdump):
 	@echo >&2 'WARNING: Symbol version dump "$@" is missing.'
 	@echo >&2 '         Modules may not have dependencies or modversions.'
+	@echo >&2 '         You may get many unresolved symbol warnings.'
 
 ifdef CONFIG_LTO_CLANG
 # With CONFIG_LTO_CLANG, .o files might be LLVM bitcode, so we need to run
@@ -134,7 +137,7 @@ endif
 modules := $(sort $(shell cat $(MODORDER)))
 
 # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined symbols
-ifneq ($(KBUILD_MODPOST_WARN),)
+ifneq ($(KBUILD_MODPOST_WARN)$(filter-out $(existing-input-symdump), $(input-symdump)),)
 MODPOST += -w
 endif
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 10c3fba26f03..7c6bec78fa34 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -23,8 +23,6 @@
 
 /* Are we using CONFIG_MODVERSIONS? */
 static int modversions = 0;
-/* Warn about undefined symbols? (do so if we have vmlinux) */
-static int have_vmlinux = 0;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static int all_versions = 0;
 /* If we are modposting external module set to 1 */
@@ -41,6 +39,13 @@ static int allow_missing_ns_imports;
 
 static bool error_occurred;
 
+/*
+ * Cut off the warnings when there are too many. This typically occurs when
+ * vmlinux is missing. ('make modules' without building vmlinux.)
+ */
+#define MAX_UNRESOLVED_REPORTS	10
+static unsigned int nr_unresolved;
+
 enum export {
 	export_plain,
 	export_gpl,
@@ -177,9 +182,6 @@ static struct module *new_module(const char *modname)
 	mod->next = modules;
 	modules = mod;
 
-	if (mod->is_vmlinux)
-		have_vmlinux = 1;
-
 	return mod;
 }
 
@@ -2141,7 +2143,7 @@ static void check_exports(struct module *mod)
 		const char *basename;
 		exp = find_symbol(s->name);
 		if (!exp || exp->module == mod) {
-			if (have_vmlinux && !s->weak)
+			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
 				modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
 					    "\"%s\" [%s.ko] undefined!\n",
 					    s->name, mod->name);
@@ -2545,13 +2547,6 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
-	/*
-	 * When there's no vmlinux, don't print warnings about
-	 * unresolved symbols (since there'll be too many ;)
-	 */
-	if (!have_vmlinux)
-		warn("Symbol info of vmlinux is missing. Unresolved symbol check will be entirely skipped.\n");
-
 	for (mod = modules; mod; mod = mod->next) {
 		char fname[PATH_MAX];
 
@@ -2595,6 +2590,10 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (nr_unresolved > MAX_UNRESOLVED_REPORTS)
+		warn("suppressed %u unresolved symbol warnings because there were too many)\n",
+		     nr_unresolved - MAX_UNRESOLVED_REPORTS);
+
 	free(buf.p);
 
 	return error_occurred ? 1 : 0;
-- 
2.27.0

