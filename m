Return-Path: <linux-kbuild+bounces-3045-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56093954B4C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 15:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3EF1F23716
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 13:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD77C1BC9EA;
	Fri, 16 Aug 2024 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWHRfwej"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28381BC9E8;
	Fri, 16 Aug 2024 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723815889; cv=none; b=o84jGA/QnzFevCRNYHoc7ewZbMf/MVH3PvzJPo5/1tfUPqzE6RUaJJxvWX6IuUTFRkaJ2fyBED52bpYeL+Iftz83UQvrIIVlPn91qyHUeQVudPN927X18TT8100GNP4FJqiEOKy2IEzRJ2WnW7cAf1heGDmIZTPrEd/qHajG4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723815889; c=relaxed/simple;
	bh=L1zRPNrewR6nWkkOFa8fOC54Dv8FueJIHTIsvnxdFYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aHQrVvLAAnw6kOn1sWrx1EKyxawUUyjqF/UJtuSDaF+g5WeftoBqGQtZcryzbMjFCyOJpLK+O+BPqr5T88+Fx7mcA8/Y128qKia5jels5KFjuHLKX6q45wt8kuj6zMP94j5TPpDjMuJlfQuJoTFzASnZoHmrin4pgVqF5rFN9E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWHRfwej; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CE3C4AF09;
	Fri, 16 Aug 2024 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723815889;
	bh=L1zRPNrewR6nWkkOFa8fOC54Dv8FueJIHTIsvnxdFYU=;
	h=From:To:Cc:Subject:Date:From;
	b=uWHRfwejGJgXrscO3kx2/bojCT8zGBqoiEXqn/3e2eHIWJaV02LzV7naLqTH9CHXR
	 tfPE9L5eLZA9I35u4BXdBMC9SrNTdrd5HBATU9N1jFthNdjBqYRAuVL8NlTczZ8fI+
	 SzIG8PU7OxLXvqoeDQ50H8d2k7hSB0VWONidD2xnrSXcDAD9YAGWLWQuAW73Y6Bnm+
	 /sCHyZF+SL1vULJ6odnYS1dLX9n3ZHhbauzYcxgcGaMDEUNz9tnzy1GKr1UE6o+Zc/
	 f1jR/OX32mSv/aTQlEAviA1NmGrO+NJ5Q9ut0wt6DvA80Yd5Kry9DB6Vlpyg9CMvI5
	 ffDl4/QhJVc6w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2] modpost: simplify modpost_log()
Date: Fri, 16 Aug 2024 22:44:29 +0900
Message-ID: <20240816134443.1183732-1-masahiroy@kernel.org>
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

Changes in v2:
 - Fix reversed logics

 scripts/mod/modpost.c | 17 ++++++-----------
 scripts/mod/modpost.h | 11 +++--------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3e474291258c..a27d1b5ce3c6 100644
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
@@ -1697,7 +1692,7 @@ static void check_exports(struct module *mod)
 		exp = find_symbol(s->name);
 		if (!exp) {
 			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
-				modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
+				modpost_log(!warn_unresolved,
 					    "\"%s\" [%s.ko] undefined!\n",
 					    s->name, mod->name);
 			continue;
@@ -1720,7 +1715,7 @@ static void check_exports(struct module *mod)
 			basename = mod->name;
 
 		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
-			modpost_log(allow_missing_ns_imports ? LOG_WARN : LOG_ERROR,
+			modpost_log(!allow_missing_ns_imports,
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


