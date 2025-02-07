Return-Path: <linux-kbuild+bounces-5662-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BCA2CA87
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 18:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDAB9165105
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 17:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C6B191F62;
	Fri,  7 Feb 2025 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHXpM+O6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7B78479;
	Fri,  7 Feb 2025 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950650; cv=none; b=YBtpFeNI8htBWYLeETykEinwyTlYOdZtjOrXOTHDakUSp2LjbVL26ek5QZYocJzmALZirT7EuNprKMTEO2zvxb02Vq7t/wna0hEsiw5rwy45kkafvxiPml8udNVwcfzi6hl7IQC5ZqIz0IZEmeVcgeXlSz8gEOKOshV3/qcKp18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950650; c=relaxed/simple;
	bh=t+IItAz6EBV9wYDZ5I/qgGInlietaD3wt1uQZCadlBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ah3erjLWLq+rx+j6iFld9nu0E9GKED7abe540XapGqtAaJTECV5B44Kms0tKH2/V4Ba/Q0rT48opOFq9qUcDQNNwN173FRuViRoy1W5ciRgTPzabiwmjO2Db3WdmZYc4tKFiwQjB5m7Enl5uew7KqXn6nrL8zRiPY8m/kxgvuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHXpM+O6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F9BC4CED1;
	Fri,  7 Feb 2025 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738950649;
	bh=t+IItAz6EBV9wYDZ5I/qgGInlietaD3wt1uQZCadlBU=;
	h=From:To:Cc:Subject:Date:From;
	b=CHXpM+O67PSn0hU0FPVpAtVecL/cK0fYcDNMtFNPRDLYoDBUmOh2JmkF73NWccWb1
	 6H39lQbCCSseJYkrQs7Mbq5pUUqv7b4enfaQA+IF0U3A+eeDLknOzda9LlhklmuAdN
	 o9PyaF7Kh0JTPNl0E3PY6ZT0WC3n48eiYkQqieImnQOOqUBn+CN58+NamHNUn3JOKZ
	 5uunry3qb9yKBfukeHifTRYN9jRWrKNkJpZW1N4Pfvyq5lH39tXeKcbdXNyE5qgfFS
	 ZWjUCb907deXmCtpLnqMXfnNzuxuBXwGHXUg2zvMnKUzIXH8x4ZYKlhGXXINFiGXaB
	 skmGA9dsCBOGA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] modpost: introduce get_basename() helper
Date: Sat,  8 Feb 2025 02:50:13 +0900
Message-ID: <20250207175024.412054-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic to retrieve the basename appears multiple times.
Factor out the common pattern into a helper function.

I copied kbasename() from include/linux/string.h and renamed it
to get_basename().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c    | 41 ++++++++++++++++++----------------------
 scripts/mod/modpost.h    |  1 +
 scripts/mod/sumversion.c | 13 ++++---------
 3 files changed, 23 insertions(+), 32 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e18ae7dc8140..b81b623e1853 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -98,6 +98,18 @@ static inline bool strends(const char *str, const char *postfix)
 	return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
 }
 
+/**
+ * get_basename - return the last part of a pathname.
+ *
+ * @path: path to extract the filename from.
+ */
+const char *get_basename(const char *path)
+{
+	const char *tail = strrchr(path, '/');
+
+	return tail ? tail + 1 : path;
+}
+
 char *read_text_file(const char *filename)
 {
 	struct stat st;
@@ -1458,14 +1470,8 @@ static void extract_crcs_for_object(const char *object, struct module *mod)
 	const char *base;
 	int dirlen, ret;
 
-	base = strrchr(object, '/');
-	if (base) {
-		base++;
-		dirlen = base - object;
-	} else {
-		dirlen = 0;
-		base = object;
-	}
+	base = get_basename(object);
+	dirlen = base - object;
 
 	ret = snprintf(cmd_file, sizeof(cmd_file), "%.*s.%s.cmd",
 		       dirlen, object, base);
@@ -1692,11 +1698,7 @@ static void check_exports(struct module *mod)
 		s->crc_valid = exp->crc_valid;
 		s->crc = exp->crc;
 
-		basename = strrchr(mod->name, '/');
-		if (basename)
-			basename++;
-		else
-			basename = mod->name;
+		basename = get_basename(mod->name);
 
 		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
 			modpost_log(!allow_missing_ns_imports,
@@ -1732,11 +1734,8 @@ static void check_modname_len(struct module *mod)
 {
 	const char *mod_name;
 
-	mod_name = strrchr(mod->name, '/');
-	if (mod_name == NULL)
-		mod_name = mod->name;
-	else
-		mod_name++;
+	mod_name = get_basename(mod->name);
+
 	if (strlen(mod_name) >= MODULE_NAME_LEN)
 		error("module name is too long [%s.ko]\n", mod->name);
 }
@@ -1913,11 +1912,7 @@ static void add_depends(struct buffer *b, struct module *mod)
 			continue;
 
 		s->module->seen = true;
-		p = strrchr(s->module->name, '/');
-		if (p)
-			p++;
-		else
-			p = s->module->name;
+		p = get_basename(s->module->name);
 		buf_printf(b, "%s%s", first ? "" : ",", p);
 		first = 0;
 	}
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index ffd0a52a606e..af2aca51bedb 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -210,6 +210,7 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen);
 /* from modpost.c */
 extern bool target_is_big_endian;
 extern bool host_is_big_endian;
+const char *get_basename(const char *path);
 char *read_text_file(const char *filename);
 char *get_line(char **stringp);
 void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 6de9af17599d..e79fc40d852f 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -309,15 +309,10 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 
 	cmd = xmalloc(strlen(objfile) + sizeof("..cmd"));
 
-	base = strrchr(objfile, '/');
-	if (base) {
-		base++;
-		dirlen = base - objfile;
-		sprintf(cmd, "%.*s.%s.cmd", dirlen, objfile, base);
-	} else {
-		dirlen = 0;
-		sprintf(cmd, ".%s.cmd", objfile);
-	}
+	base = get_basename(objfile);
+	dirlen = base - objfile;
+	sprintf(cmd, "%.*s.%s.cmd", dirlen, objfile, base);
+
 	dir = xmalloc(dirlen + 1);
 	strncpy(dir, objfile, dirlen);
 	dir[dirlen] = '\0';
-- 
2.43.0


