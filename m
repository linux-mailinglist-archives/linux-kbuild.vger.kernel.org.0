Return-Path: <linux-kbuild+bounces-2953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1894F01C
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 16:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2A0FB24F25
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 14:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15A94D8CB;
	Mon, 12 Aug 2024 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWZt5HpA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FFD1E877;
	Mon, 12 Aug 2024 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473947; cv=none; b=iYNJlVJJ95bQ1CxVffEabjcN4D32i+urG7mEZYOqVMDgiHy/JUJaAYET8q2pIZGwz5IvY6ItVgcUrpVAQzE3BRXe9OwFnjMMhL59PJ15AmBGdj+EDsa9acKimGZTSlc3ORTKqAYm5yuYKej+T3ZvBR6LzN6sF21ApsTMKchOFOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473947; c=relaxed/simple;
	bh=yPmf+a/ePUDb6SgtLI0vLj0iLKy/uXLIz5HlrA/9GMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJI4AjpaBh91Uzet9mWLSIYqQc2hLWJswmJkuUjzdoQBN568fAsOdLQrHUesHo/tAYwoX6KkoOAxtbFgHYMdmGNpsHEOK5Bo0p+QQQuVDQvGOrKEDpuNC2KyaDrv8S/gL997I9a4mXer0Tngv24aQ09tSJ+JvuIPYY0RPEnOK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWZt5HpA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1885EC4AF0D;
	Mon, 12 Aug 2024 14:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723473947;
	bh=yPmf+a/ePUDb6SgtLI0vLj0iLKy/uXLIz5HlrA/9GMg=;
	h=From:To:Cc:Subject:Date:From;
	b=uWZt5HpAzDqVdquUGawxZMpmtgQ+pVXj87oAPOtRvxzkhZvTa6JDrfgn+YaiUwauk
	 DnBoFkQ0vOe2Dk5V5/Sh1kmAUbOAp8++x3Ifp4vTi6SCNQK8BpjGJ5VvdBO75tZ22Q
	 jnijIakeDdWpeMKTyrm7wHeCcttocxgmDfPqTjWzBEKzkhRCHuk4CFewnXXKntXtIF
	 wFrpaATQoKW2XV5FL5zUX9h3JowfJVhAZjJt3ySvauQUs4ZRHJ7cxr3vnjdoGwkII0
	 T9uce7PAC/+oBXEtLPu8Ar8/yKXwkBsT/fYixjdIMT1XFa6IaKwmizjwOMRY6yI9ls
	 1X0J/T+eM0A1Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] modpost: simplify modpost_log()
Date: Mon, 12 Aug 2024 23:45:39 +0900
Message-ID: <20240812144542.2121342-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit cda5f94e88b4 ("modpost: avoid using the alias attribute"),
only two log levels remain: LOG_WARN and LOG_ERROR. Simplify this by
making it a boolean variable.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 17 ++++++-----------
 scripts/mod/modpost.h | 11 +++--------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d0f138803207..c896872862dc 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -67,20 +67,15 @@ static unsigned int nr_unresolved;
 
 #define MODULE_NAME_LEN (64 - sizeof(Elf_Addr))
 
-void modpost_log(enum loglevel loglevel, const char *fmt, ...)
+void modpost_log(bool is_error, const char *fmt, ...)
 {
 	va_list arglist;
 
-	switch (loglevel) {
-	case LOG_WARN:
-		fprintf(stderr, "WARNING: ");
-		break;
-	case LOG_ERROR:
+	if (is_error) {
 		fprintf(stderr, "ERROR: ");
 		error_occurred = true;
-		break;
-	default: /* invalid loglevel, ignore */
-		break;
+	} else {
+		fprintf(stderr, "WARNING: ");
 	}
 
 	fprintf(stderr, "modpost: ");
@@ -1692,7 +1687,7 @@ static void check_exports(struct module *mod)
 		exp = find_symbol(s->name);
 		if (!exp) {
 			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
-				modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
+				modpost_log(warn_unresolved,
 					    "\"%s\" [%s.ko] undefined!\n",
 					    s->name, mod->name);
 			continue;
@@ -1715,7 +1710,7 @@ static void check_exports(struct module *mod)
 			basename = mod->name;
 
 		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
-			modpost_log(allow_missing_ns_imports ? LOG_WARN : LOG_ERROR,
+			modpost_log(allow_missing_ns_imports,
 				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
 				    basename, exp->name, exp->namespace);
 			add_namespace(&mod->missing_namespaces, exp->namespace);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index f756e6578b9e..6f418f0afd04 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -184,13 +184,8 @@ char *read_text_file(const char *filename);
 char *get_line(char **stringp);
 void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
 
-enum loglevel {
-	LOG_WARN,
-	LOG_ERROR,
-};
-
 void __attribute__((format(printf, 2, 3)))
-modpost_log(enum loglevel loglevel, const char *fmt, ...);
+modpost_log(bool is_error, const char *fmt, ...);
 
 /*
  * warn - show the given message, then let modpost continue running, still
@@ -205,6 +200,6 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...);
  * fatal - show the given message, and bail out immediately. This should be
  *         used when there is no point to continue running modpost.
  */
-#define warn(fmt, args...)	modpost_log(LOG_WARN, fmt, ##args)
-#define error(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
+#define warn(fmt, args...)	modpost_log(false, fmt, ##args)
+#define error(fmt, args...)	modpost_log(true, fmt, ##args)
 #define fatal(fmt, args...)	do { error(fmt, ##args); exit(1); } while (1)
-- 
2.43.0


