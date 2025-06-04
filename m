Return-Path: <linux-kbuild+bounces-7369-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C5ACE468
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 20:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3011A17771F
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 18:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6826220B207;
	Wed,  4 Jun 2025 18:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwpdvfsP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DEB17548
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Jun 2025 18:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749062194; cv=none; b=swQ8HPVeS5GQF2jR472Fd1X/A0Js1IScmfE4Hb0naJkgtdW5S48zf2NNp3g8WcMK2x0OjMCPxj2qCdrgQkbeTyNyqbmOaGQ8oRYnI7Tb6K3p1qxMDYamd3+cEOUKX4cZzhaZhpcWz8jMlC+Ef7+nqKMSWExz4omeBuO24xIPGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749062194; c=relaxed/simple;
	bh=fXps86kGdqv/qLAtGZ2XUnWS+06rZx+E3eI3JcFa9Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F2jNDIbtiHsSnxCPThcoQWV3xuCxS/an5F8of4+CFdipPYrNspjmlY36HKlkhReZepq0mEWSow5JCPfWuUbCUpGA+wfVzro1ZH7FGZDflfdkGaT2UI+b7u4jb20PgtsOVpsbhpwnjFOo9i82JTnTcW4L2lQK6eLImwTd7hMe5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwpdvfsP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad88105874aso23181366b.1
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Jun 2025 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749062190; x=1749666990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qkEWIPkuZ7m6TDjb5mnY6N79i4ECrcr8DSqB7iMpSrs=;
        b=EwpdvfsPhUXSIy0zAuGbV4mAvOyS0NqvkoV26Z09znVY+18sGxAJORdbNe97gkuWXf
         2hk8M27fLIV+DWijI0WGHWcJ5vwF5RGKklaHZrf3bWJxKHpB5m1/6lPAl9aQZO+/Q7pP
         c2zvOpN4x1bWqsQIPmXllty5VSDR1noppHF7ItepJqPparLcMvtg5r5VlAXf/L27hRl4
         sLclUZG3sxVibXCxQg8mNrdX6x0xrlL0MYkKbEjcXp6rBgahejy/meoC+2OYEQoRkL+y
         mr/dGJ5p/W4vjwSZFbpFCPg5nw402lCI6D4WwsjkdOTO9wMd3J3NvAyOxhVvbe5h62zw
         QgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749062190; x=1749666990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkEWIPkuZ7m6TDjb5mnY6N79i4ECrcr8DSqB7iMpSrs=;
        b=iqfbPGbpUdG4O4uizVjY2N8RdP4sP8XSLWh4cuFvAlo7KgudPxOIvTzXtsKgik+mgC
         AznZQ5Ioo1Z/c4jnZU/lzpsw0Hf9BYiXIueWeqAeFmF26OcX1JHLFG2CB0/myH2t1t49
         NmDMRhbNS4xOvubVWgJKWp/Utv6aS9ERNxfHCaCnOiPSW999xkL3Ko/EoPg0I6obOSga
         mkwaw1qCo2n0D4GJIhsj8d0h+506Rug+FXM6vqoZn+RIM/mW28MLiul6q78rOzUtTfla
         WPbef+PCfimM4dqmp9a6jh7aVBhB8SqLfPVb4wkJ1fZimbWkDH93XPy6+VuB9Deyxs/2
         I31Q==
X-Gm-Message-State: AOJu0YxWgnZT7+SlYhZEZLUkzfZPb9pc9DQAxO7ggjIaC8GGixST1uov
	G7aK6pnfg6LiGYY/SUMfIcDVirZe+pMrKxEvf3+UYTAY7t9PEeV/7NuyuKw54TgM
X-Gm-Gg: ASbGncuCCqNdyfKYyBQn+S7Kv6LP+MGtTXe43GupYg3PPdiNmABflwvgbKBuFjvUUL5
	zFDs+hNHgeLbxXRs60a0s8FdZ6SCgf8VxHJXnEZY6LorTp/+MAX04daMvZxwN5wd5/VHXV9wwMc
	89uQYdYUMCzms94yo8N1Z+mHsfofsetM4rbwWR6v1bu5RVGxnOrhVUXmW94WD+zKXWdwapO3Xet
	WemQwhNRo7X2kv8rqd4C7GzosajW5NJQlZqlFbCIVJgQMXakyQK8/bFazhH6E76VG0w6jSA0R2O
	YJZU/BfSOLxEhJ8uHg/SAxByCn0cAJ6A4SXt1C77Fnm0N1EmgSyLmghRL1O0zZ9zrQgyep5ZmJn
	F6J5kWgjDLI45KA==
X-Google-Smtp-Source: AGHT+IG2uwYWj7By/5eubrlWXJRsu/YcfqRhOmNdY9PkTPft0o9/JzLXoZGywXK49vkhdrGhMM1GXw==
X-Received: by 2002:a17:907:724c:b0:add:ede0:b9c4 with SMTP id a640c23a62f3a-addf8fa54c3mr346718766b.42.1749062189479;
        Wed, 04 Jun 2025 11:36:29 -0700 (PDT)
Received: from itek.frank67.it. (mob-5-90-28-160.net.vodafone.it. [5.90.28.160])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad395dfsm1124206266b.127.2025.06.04.11.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 11:36:28 -0700 (PDT)
From: Franco Martelli <martellif67@gmail.com>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Franco Martelli <martellif67@gmail.com>
Subject: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
Date: Wed,  4 Jun 2025 20:35:39 +0200
Message-Id: <20250604183539.425053-1-martellif67@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Franco Martelli <martellif67@gmail.com>
---

Dear Linux hacker,

I've written a patch that allows to compare the tristate value of two
.config files inline, symbol by symbol, in mconf (make menuconfig) only.
It can be useful when customizing the .config file, personally I use it
to compare my .config file with the one provided by the software
distribution.

A screenshot of the new mconf view is available here:
https://i.is.cc/2cpIXxoP.jpg

The patch was originally written on Linux 6.1 amd64 series tested on
6.1.137 kernel version.

The patch has a limitation, it only show the tristate value (Y/N/M) not
differences for symbol with a value (string), but it also marks with a
"#" the symbol missing in the loaded .config, meaning therefore the
symbol as a new feature.

o I've also added support for the more canonical <F1> key to show inline
help window, in addition to <?> and <h> keys.

o By pressing the <F2> key you will get a view with all the symbol
differences listed.

o By pressing the <F4> key you'll save to a file the differences.

o Added help text that it describes the new features.

If you like this patch, it would be nice that other kconfig GUI client
such as nconf, gconf and qconf be patched in order to have compare
capability for them too.
This software is under GPL-2.0 license.

Changelog:
----------

scripts/kconfig/confdata.c:
---------------------------

Silenced a warning emitted when parsing the .config file to compare.

Skipping empty sym when parsing the .config file to compare.

Add function to return the tristate's chars for the .config file
to compare, possible values: Y/N/M/#

Add function that masks xrealloc() in order to reallocate the
char pointer every SYMBOL_MAXLENGTH size.

Add function that return a char pointer to the allocated list
of differences between the current .config file and the one to
compare.

Add function that return boolean value whether saving to file
the list of differences succeed or not.

scripts/kconfig/expr.h:
-----------------------

Add the item "S_DEF_COMP" to the "enum" values used as index
to the symbol.def[] array defined in the symbol "struct".

Add boolean "comp_is_avail" variable to the symbol "struct"
that is "true" when the symbol is present in the compared
.config, "false" if it's missing in the compared .config,
meaning therefore a new feature.

Defined macro SYMBOL_DEF_COMP. Unused but necessary for the
logical structure of the program.

scripts/kconfig/lkc.h:
----------------------

Add <stdbool.h> header to make available boolean type for
files that include the lkc.h header: confdata.c mconf.c etc.

Add "static inline" functions to retrieve value from the
symbol structure, so the compiler can optimize the code.

scripts/kconfig/lkc_proto.h:
----------------------------

Add some functions prototype.

scripts/kconfig/lxdialog/menubox.c:
-----------------------------------

Add "Compare" button to the menu bar, and adjusted the code
to get selected when arrow keys are used.

Add support for the key F1 to display the online help window.

Add support for the key F2 to display a view with the
differences between .config files listed.

Add support for the key F4 to save to file differences
between .config files.

Adjust the locations of the menuconfig commands so that the
new "Compare" command fits inside an 80-column-wide terminal.
(Code written by Randy Dunlap <rdunlap@infradead.org>)

Add shortcuts for the new F2 (add 'D') and F4 (add 'F') keys
in case function keys are intercepted by some other software
layer. (Code written by Randy Dunlap <rdunlap@infradead.org>)

scripts/kconfig/mconf.c:
------------------------

Add/Edit various char array storing help messages at the
beginning of the file useful in many dialog window.

Add boolean variable "has_comp_file" to keep tracks whether
a .config file for comparison purpose is loaded.

Edited the build_conf(...) function, that de facto builds the
interface of the main window of mconf. The changes inherits
the function item_make(...) add variable that maps the
"tristate" value of the compared .config file.

Add function comp_show_list_diff(void) that return void to
display a view that contains differences between the current
.config file and the one to compare.

Add function conf_load_comp(void) that return void useful
to load the .config file to compare by displaying an input
dialog window.

Add function conf_save_comp(void) that return void useful
to save to file the differences between the current .config
file and the one to compare.

Edited the conf(...) function, adding to the "switch"
construct the "case" items to handle events to display
differences, load .config file to compare and save
differences to a file.

 scripts/kconfig/confdata.c         | 175 +++++++++++++++++++++++++-
 scripts/kconfig/expr.h             |   9 ++
 scripts/kconfig/lkc.h              |  11 ++
 scripts/kconfig/lkc_proto.h        |   4 +
 scripts/kconfig/lxdialog/menubox.c |  29 +++--
 scripts/kconfig/mconf.c            | 193 ++++++++++++++++++++++++++---
 6 files changed, 398 insertions(+), 23 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index ac95661a1c9d..2ad816df8404 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -257,7 +257,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			sym->flags |= def_flags;
 			break;
 		}
-		if (def != S_DEF_AUTO)
+		if (def != S_DEF_AUTO && def != S_DEF_COMP)
 			conf_warning("symbol value '%s' invalid for %s",
 				     p, sym->name);
 		return 1;
@@ -386,6 +386,7 @@ int conf_read_simple(const char *name, int def)
 	def_flags = SYMBOL_DEF << def;
 	for_all_symbols(sym) {
 		sym->flags &= ~def_flags;
+		sym->comp_is_avail = false;
 		switch (sym->type) {
 		case S_INT:
 		case S_HEX:
@@ -445,6 +446,8 @@ int conf_read_simple(const char *name, int def)
 
 		sym = sym_find(sym_name);
 		if (!sym) {
+			if (def == S_DEF_COMP)
+				continue;
 			if (def == S_DEF_AUTO) {
 				/*
 				 * Reading from include/config/auto.conf.
@@ -462,6 +465,9 @@ int conf_read_simple(const char *name, int def)
 			continue;
 		}
 
+		if (def == S_DEF_COMP)
+			sym->comp_is_avail = true;
+
 		if (sym->flags & def_flags)
 			conf_warning("override: reassigning to symbol %s", sym->name);
 
@@ -529,6 +535,99 @@ int conf_read(const char *name)
 	return 0;
 }
 
+const char sym_get_comp_tristate_char(struct symbol *sym)
+{
+	char ch = '#';
+
+	if (sym_get_comp_is_avail(sym))
+		switch (sym_get_comp_tristate_value(sym)) {
+		case yes:
+			ch = '*';
+			break;
+		case mod:
+			ch = 'M';
+			break;
+		case no:
+			ch = '_';
+			break;
+		}
+
+	return ch;
+}
+
+static char *masked_xrealloc(char *s, size_t len, size_t *size)
+{
+	char *ls = s;
+
+	if (s == NULL)
+		*size = 0;
+	if (len > *size)
+		ls = xrealloc(s, (*size = ((len / SYMBOL_MAXLENGTH) + 1) * SYMBOL_MAXLENGTH));
+
+	return ls;
+}
+
+#define LINE_LENGTH	(SYMBOL_MAXLENGTH + 32)
+
+char *comp_get_list_diff(void)
+{
+	char *line, *l_rst, *list = NULL, ch_comp;
+	size_t idx = 0, szs;
+	struct symbol *sym;
+	tristate tri_val, tri_comp_val;
+
+	l_rst = line = xmalloc(LINE_LENGTH);
+
+	for_all_symbols(sym) {
+		if (!sym->name)
+			continue;
+		tri_val = sym_get_tristate_value(sym);
+		tri_comp_val = sym_get_comp_tristate_value(sym);
+
+		if (tri_val != tri_comp_val) {
+			ch_comp = sym_get_comp_tristate_char(sym);
+			switch (tri_val) {
+			case yes:
+				snprintf(line, LINE_LENGTH, "%s%s=y --- %c\n",
+					 CONFIG_, sym->name, ch_comp);
+				break;
+			case mod:
+				snprintf(line, LINE_LENGTH, "%s%s=m --- %c\n",
+					 CONFIG_, sym->name, ch_comp);
+				break;
+			case no:
+				snprintf(line, LINE_LENGTH, "# %s%s is not set --- %c\n",
+					 CONFIG_, sym->name, ch_comp);
+				break;
+			}
+
+			for (; *line; ++idx) {
+				list = masked_xrealloc(list, idx + 2, &szs);
+				list[idx] = *line++;
+			}
+			line = l_rst;
+		}
+	}
+	free(line);
+
+	if (list)
+		list[idx] = '\0';
+	else {
+		list = xmalloc(32);
+		snprintf(list, 32, "No differences found.");
+	}
+
+	return list;
+}
+
+bool conf_read_comp(const char *name)
+{
+	if (conf_read_simple(name, S_DEF_COMP))
+		return true;
+
+	return false;
+}
+
 struct comment_style {
 	const char *decoration;
 	const char *prefix;
@@ -801,6 +900,80 @@ int conf_write_defconfig(const char *filename)
 	return 0;
 }
 
+bool conf_write_comp(const char *name)
+{
+	FILE *fptemp, *fplist;
+	char *list = NULL, f_old[PATH_MAX + 1],  tmpfile[] = "file_XXXXXX";
+	int ch;
+
+	if (!name)
+		return false;
+
+	if (is_present(name)) {
+		if (is_dir(name))
+			return false;
+		snprintf(f_old, PATH_MAX, "%s.old", name);
+		if (rename(name, f_old)) {
+			fprintf(stderr, "Failed to rename file: %s to %s\n", name, f_old);
+			return false;
+		}
+	}
+
+	list = comp_get_list_diff();
+	int tmpfd = mkstemp(tmpfile);
+
+	if (tmpfd < 0) {
+		fprintf(stderr, "Failed to create temporary file.\n");
+		return false;
+	}
+
+	fptemp = fdopen(tmpfd, "w");
+	if (!fptemp) {
+		remove(tmpfile);
+		fprintf(stderr, "Failed to open a stream for the temporary file: %s\n", tmpfile);
+		return false;
+	}
+
+	fplist = fmemopen(list, strlen(list), "r");
+	if (!fplist) {
+		fclose(fptemp);
+		remove(tmpfile);
+		fprintf(stderr, "Failed to open a stream for fplist.\n");
+		if (list)
+			free(list);
+		return false;
+	}
+
+	while ((ch = fgetc(fplist)) != EOF)
+		fputc(ch, fptemp);
+
+	if (ferror(fptemp)) {		/* checks whether fputc has encountered errors */
+		fclose(fptemp);		/*  while writing the file */
+		fclose(fplist);
+		if (list)
+			free(list);
+		fprintf(stderr, "An error occurred when writing the file: %s", tmpfile);
+		return false;
+	}
+
+	if (rename(tmpfile, name)) {
+		fprintf(stderr, "Failed to rename file: %s to %s\n", tmpfile, name);
+		fclose(fptemp);
+		fclose(fplist);
+		if (list)
+			free(list);
+		remove(tmpfile);
+		return false;
+	}
+
+	fclose(fptemp);
+	fclose(fplist);
+	if (list)
+		free(list);
+
+	return true;
+}
+
 int conf_write(const char *name)
 {
 	FILE *out;
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 21578dcd4292..89b5d1cde63d 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -76,6 +76,7 @@ enum {
 	S_DEF_AUTO,		/* values read from auto.conf */
 	S_DEF_DEF3,		/* Reserved for UI usage */
 	S_DEF_DEF4,		/* Reserved for UI usage */
+	S_DEF_COMP,		/* values for comparison purposes */
 	S_DEF_COUNT
 };
 
@@ -140,6 +141,13 @@ struct symbol {
 	 * "Weak" reverse dependencies through being implied by other symbols
 	 */
 	struct expr_value implied;
+
+	/*
+	 * Used by comparison code. "true" when the symbol is present in the compared
+	 * .config, "false" if it's missing in the compared .config, meaning
+	 * therefore a new feature.
+	 */
+	bool comp_is_avail;
 };
 
 #define SYMBOL_CONST      0x0001  /* symbol is const */
@@ -156,6 +164,7 @@ struct symbol {
 #define SYMBOL_DEF_AUTO   0x20000  /* symbol.def[S_DEF_AUTO] is valid */
 #define SYMBOL_DEF3       0x40000  /* symbol.def[S_DEF_3] is valid */
 #define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
+#define SYMBOL_DEF_COMP	  0x100000 /* symbol.def[S_DEF_COMP] is valid */
 
 #define SYMBOL_MAXLENGTH	256
 
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index b8ebc3094a23..0ddf142ec7e8 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -9,6 +9,7 @@
 #include <assert.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <stdbool.h>
 
 #include "expr.h"
 
@@ -129,6 +130,16 @@ static inline bool sym_has_value(const struct symbol *sym)
 	return sym->flags & SYMBOL_DEF_USER ? true : false;
 }
 
+static inline bool sym_get_comp_is_avail(struct symbol *sym)
+{
+	return sym->comp_is_avail;
+}
+
+static inline tristate sym_get_comp_tristate_value(struct symbol *sym)
+{
+	return sym->def[S_DEF_COMP].tri;
+}
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 8914b4e8f2a8..6e27ad1e7970 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -7,6 +7,10 @@
 /* confdata.c */
 void conf_parse(const char *name);
 int conf_read(const char *name);
+bool conf_read_comp(const char *name);
+bool conf_write_comp(const char *name);
+const char sym_get_comp_tristate_char(struct symbol *sym);
+char *comp_get_list_diff(void);
 int conf_read_simple(const char *name, int);
 int conf_write_defconfig(const char *name);
 int conf_write(const char *name);
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 6e6244df0c56..37c57de5247a 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -133,14 +133,15 @@ static void print_arrows(WINDOW * win, int item_no, int scroll, int y, int x,
  */
 static void print_buttons(WINDOW * win, int height, int width, int selected)
 {
-	int x = width / 2 - 28;
+	int x = width / 2 - 30;
 	int y = height - 2;
 
 	print_button(win, "Select", y, x, selected == 0);
-	print_button(win, " Exit ", y, x + 12, selected == 1);
-	print_button(win, " Help ", y, x + 24, selected == 2);
-	print_button(win, " Save ", y, x + 36, selected == 3);
-	print_button(win, " Load ", y, x + 48, selected == 4);
+	print_button(win, " Exit ", y, x + 10, selected == 1);
+	print_button(win, " Help ", y, x + 20, selected == 2);
+	print_button(win, " Save ", y, x + 30, selected == 3);
+	print_button(win, " Load ", y, x + 40, selected == 4);
+	print_button(win, "Compare", y, x + 50, selected == 5);
 
 	wmove(win, y, x + 1 + 12 * selected);
 	wrefresh(win);
@@ -354,14 +355,19 @@ int dialog_menu(const char *title, const char *prompt,
 		case TAB:
 		case KEY_RIGHT:
 			button = ((key == KEY_LEFT ? --button : ++button) < 0)
-			    ? 4 : (button > 4 ? 0 : button);
+			    ? 5 : (button > 5 ? 0 : button);
 
 			print_buttons(dialog, height, width, button);
 			wrefresh(menu);
 			break;
+		case KEY_F(1):
+		case KEY_F(2):
+		case KEY_F(4):
 		case ' ':
 		case 's':
 		case 'y':
+		case 'd':
+		case 'f':
 		case 'n':
 		case 'm':
 		case '/':
@@ -376,6 +382,7 @@ int dialog_menu(const char *title, const char *prompt,
 			item_set(scroll + choice);
 			item_set_selected(1);
 			switch (key) {
+			case KEY_F(1):
 			case 'h':
 			case '?':
 				return 2;
@@ -392,9 +399,15 @@ int dialog_menu(const char *title, const char *prompt,
 				return 9;
 			case 'z':
 				return 10;
+			case KEY_F(2):		/* Differences between .config files view */
+			case 'd':
+				return 40;
+			case KEY_F(4):		/* Save to file differences between .config files */
+			case 'f':
+				return 60;
 			case '\n':
-				return button;
-			}
+				return button == 5 ? 50 : button; /* Workaround for */
+			}					  /* Compare button */
 			return 0;
 		case 'e':
 		case 'x':
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 84ea9215c0a7..83cb1b350a2f 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -73,7 +73,7 @@ static const char mconf_readme[] =
 "o  To get help with an item, use the cursor keys to highlight <Help>\n"
 "   and press <ENTER>.\n"
 "\n"
-"   Shortcut: Press <H> or <?>.\n"
+"   Shortcut: Press <F1>, <H> or <?>.\n"
 "\n"
 "o  To toggle the display of hidden options, press <Z>.\n"
 "\n"
@@ -89,7 +89,7 @@ static const char mconf_readme[] =
 "o  To see available help for the item, use the cursor keys to highlight\n"
 "   <Help> and Press <ENTER>.\n"
 "\n"
-"   Shortcut: Press <H> or <?>.\n"
+"   Shortcut: Press <F1>, <H> or <?>.\n"
 "\n"
 "   Also, the <TAB> and cursor keys will cycle between <Select> and\n"
 "   <Help>\n"
@@ -129,6 +129,18 @@ static const char mconf_readme[] =
 "settings, you may use the <Load> button to restore your previously\n"
 "saved settings from \".config\" without restarting Menuconfig.\n"
 "\n"
+"Compare\n"
+"-------\n"
+"With the \"Compare\" button you can load an alternate \".config\" file for\n"
+"comparison purpose. Once loaded, four characters separated by spaces will\n"
+"be displayed for each menu item. The character can be: *: for a symbol\n"
+"built-in, _: for a symbol excluded, M: for a symbol as module and #: for\n"
+"a symbol absent in the loaded \".config\" file, meaning therefore a new feature.\n"
+"\n"
+"Once loaded the .config file to compare, using the <F2> or 'D' key a view will\n"
+"be displayed listing the differences between the two .config files, using\n"
+"the <F4> or 'F' key instead, you can save to a file these differences.\n"
+"\n"
 "Other information\n"
 "-----------------\n"
 "If you use Menuconfig in an XTERM window, make sure you have your\n"
@@ -187,12 +199,13 @@ menu_instructions[] =
 	"Highlighted letters are hotkeys.  "
 	"Pressing <Y> includes, <N> excludes, <M> modularizes features.  "
 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
-	"Legend: [*] built-in  [ ] excluded  <M> module  < > module capable",
+	"Legend: [*] built-in  [ ] excluded  <M> module  "
+	"for compare: * built-in _ excluded M module # absent (new feature)",
 radiolist_instructions[] =
 	"Use the arrow keys to navigate this window or "
 	"press the hotkey of the item you wish to select "
 	"followed by the <SPACE BAR>. "
-	"Press <?> for additional information about this option.",
+	"Press <F1> for additional information about this option.",
 inputbox_instructions_int[] =
 	"Please enter a decimal value. "
 	"Fractions will not be accepted.  "
@@ -210,6 +223,9 @@ load_config_text[] =
 	"Enter the name of the configuration file you wish to load.  "
 	"Accept the name shown to restore the configuration you "
 	"last retrieved.  Leave blank to abort.",
+load_config_comp_text[] =
+	"Enter the name of the configuration file you wish to load for comparison purpose.  "
+	"Leave blank to abort and return to .config single mode view.",
 load_config_help[] =
 	"\n"
 	"For various reasons, one may wish to keep several different\n"
@@ -221,6 +237,44 @@ load_config_help[] =
 	"\n"
 	"If you are uncertain, then you have probably never used alternate\n"
 	"configuration files. You should therefore leave this blank to abort.\n",
+load_config_comp_help[] =
+	"\n"
+	"For various reasons, one may wish to keep several different\n"
+	"configurations available on a single machine.\n"
+	"\n"
+	"If you have another configuration file other than the default one,\n"
+	"entering its name here will allow you to compare the items (symbols)\n"
+	"of this file with the current configuration loaded.\n"
+	"\n"
+	"Once loaded, four characters separated by spaces will be displayed for\n"
+	"each menu item. The character can be: *: for a symbol built-in, _: for a\n"
+	"symbol excluded, M: for a symbol as module and #: for a symbol absent in\n"
+	"the loaded \".config\" file, meaning therefore a new feature.\n"
+	"\n"
+	"In addition, using the <F2> key a view will be displayed listing the\n"
+	"differences between the two .config files, using the <F4> key instead,\n"
+	"you can save to a file these differences.\n"
+	"\n"
+	"If you are uncertain, then you probably don't want to compare two\n"
+	"configuration files. You should therefore leave this blank to abort.\n",
+load_comp_diff_msg[] =
+	"Please load a .config file to compare\nusing the \"Compare\" button.",
+save_config_diff_text[] =
+	"Enter a filename to which the differences between two .config be saved.  "
+	"Leave blank to abort.",
+save_config_diff_help[] =
+	"\n"
+	"For various reasons, one may wish to compare different configurations\n"
+	"files available on a single machine.\n"
+	"\n"
+	"Entering a file name here will allow you to later retrieve the list\n"
+	"of symbol differences between the current configuration file and that\n"
+	"loaded using the \"Compare\" button.\n"
+	"If the entered filename exists, a backup copy will be made adding the\n"
+	"\".old\" extension.\n"
+	"\n"
+	"If you are uncertain what all this means then you should probably\n"
+	"leave this blank to abort.\n",
 save_config_text[] =
 	"Enter a filename to which this configuration should be saved "
 	"as an alternate.  Leave blank to abort.",
@@ -289,8 +343,12 @@ static int single_menu_mode;
 static int show_all_options;
 static int save_and_exit;
 static int silent;
+static bool has_comp_file;
 
 static void conf(struct menu *menu, struct menu *active_menu);
+static void conf_load_comp(void);
+static void conf_save_comp(void);
+static void comp_show_list_diff(void);
 
 static char filename[PATH_MAX+1];
 static void set_config_filename(const char *config_filename)
@@ -458,7 +516,7 @@ static void build_conf(struct menu *menu)
 	struct menu *child;
 	int type, tmp, doint = 2;
 	tristate val;
-	char ch;
+	char ch, ch_comp;
 	bool visible;
 
 	/*
@@ -541,12 +599,21 @@ static void build_conf(struct menu *menu)
 		}
 		child_count++;
 		val = sym_get_tristate_value(sym);
+		ch_comp = sym_get_comp_tristate_char(sym);
+
 		switch (type) {
 		case S_BOOLEAN:
-			if (sym_is_changeable(sym))
-				item_make("[%c]", val == no ? ' ' : '*');
-			else
-				item_make("-%c-", val == no ? ' ' : '*');
+			if (sym_is_changeable(sym)) {
+				if (has_comp_file)
+					item_make("[%c] %c ", val == no ? ' ' : '*', ch_comp);
+				else
+					item_make("[%c]", val == no ? ' ' : '*');
+			} else {
+				if (has_comp_file)
+					item_make("-%c- %c ", val == no ? ' ' : '*', ch_comp);
+				else
+					item_make("-%c-", val == no ? ' ' : '*');
+			}
 			item_set_tag('t');
 			item_set_data(menu);
 			break;
@@ -557,12 +624,22 @@ static void build_conf(struct menu *menu)
 			default:  ch = ' '; break;
 			}
 			if (sym_is_changeable(sym)) {
-				if (sym->rev_dep.tri == mod)
-					item_make("{%c}", ch);
-				else
-					item_make("<%c>", ch);
+				if (sym->rev_dep.tri == mod) {
+					if (has_comp_file)
+						item_make("{%c} %c ", ch, ch_comp);
+					else
+						item_make("{%c}", ch);
+				} else {
+					if (has_comp_file)
+						item_make("<%c> %c ", ch, ch_comp);
+					else
+						item_make("<%c>", ch);
+				}
 			} else
-				item_make("-%c-", ch);
+				if (has_comp_file)
+					item_make("-%c- %c ", ch, ch_comp);
+				else
+					item_make("-%c-", ch);
 			item_set_tag('t');
 			item_set_data(menu);
 			break;
@@ -696,6 +773,82 @@ static void conf_string(struct menu *menu)
 	}
 }
 
+static void comp_show_list_diff(void)
+{
+	if (!has_comp_file)
+		show_textbox(NULL, load_comp_diff_msg, 6, 44);
+	else {
+		char *list = comp_get_list_diff();
+
+		show_textbox("COMPARE", list, 0, 0);
+		free(list);
+	}
+}
+
+static void conf_load_comp(void)
+{
+	while (1) {
+		int res;
+
+		dialog_clear();
+		res = dialog_inputbox(NULL, load_config_comp_text,
+				      11, 55, filename);
+		switch (res) {
+		case 0:
+			if (!dialog_input_result[0]) {
+				has_comp_file = false;
+				return;
+			}
+			if (!conf_read_comp(dialog_input_result)) {
+				has_comp_file = true;
+				return;
+			}
+
+			show_textbox(NULL, "File does not exist!", 5, 38);
+			break;
+		case 1:
+			show_helptext("Load Configuration to Compare", load_config_comp_help);
+			break;
+		case KEY_ESC:
+			return;
+		}
+	}
+}
+
+static void conf_save_comp(void)
+{
+	if (!has_comp_file) {
+		show_textbox(NULL, load_comp_diff_msg, 6, 44);
+		return;
+	}
+
+	char fn_diff[PATH_MAX + 8];
+
+	snprintf(fn_diff, PATH_MAX + 8, "%s.diff", filename);
+
+	while (1) {
+		int res;
+
+		dialog_clear();
+		res = dialog_inputbox(NULL, save_config_diff_text,
+				      11, 55, fn_diff);
+		switch (res) {
+		case 0:
+			if (!dialog_input_result[0])
+				return;
+			if (conf_write_comp(dialog_input_result))
+				return;
+			show_textbox(NULL, "Can't create file!", 5, 60);
+			break;
+		case 1:
+			show_helptext("Save Differences", save_config_diff_help);
+			break;
+		case KEY_ESC:
+			return;
+		}
+	}
+}
+
 static void conf_load(void)
 {
 
@@ -855,6 +1008,18 @@ static void conf(struct menu *menu, struct menu *active_menu)
 		case 10:
 			show_all_options = !show_all_options;
 			break;
+		case 40:
+			reset_subtitle();
+			comp_show_list_diff();
+			break;
+		case 50:
+			reset_subtitle();
+			conf_load_comp();
+			break;
+		case 60:
+			reset_subtitle();
+			conf_save_comp();
+			break;
 		}
 	}
 
-- 
2.39.5


