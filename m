Return-Path: <linux-kbuild+bounces-9336-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD69C208BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Oct 2025 15:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CECA1189656C
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Oct 2025 14:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78E8230BCB;
	Thu, 30 Oct 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8+jUNmL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAB223E35B
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Oct 2025 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833693; cv=none; b=C1m/H6O37URLIz1NtukYsY1R0RyBYJTWD4maT6WHuV+nRTitTjWRtbzeS5MNMopxRdGj3ZuM0epzsjaYSitNo+TTvIc1WIz00dy0FuMzLDlziOHgYmpCeV3i/tu0q+2fJHaV+jXx0KD91eGndIzOYHbsmCg6FPW5SJFOXoWTxHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833693; c=relaxed/simple;
	bh=NBSZfQOQeo5QQm7Pq65PYSg33DFXgSRSunN0mAnwpM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZS4UbRZ3Wb0AkzaffqXqaL3lB/9JvRQ2MfMRDBOwhWZGYvKTf2PWoCilcI+6kfyQmU1oXR9V528nzmE8ilhbgiq0EYEj86JED79/4qE4fcqvWAehy/EUIHm5skVk6a+YbBWptB0LDpocPIeOvUUmdIFcFCX5p/KrxEAZAA0PYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8+jUNmL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4270491e9easo966933f8f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Oct 2025 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761833689; x=1762438489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxKxYqiLTK7t2bCp0y6z+rFpGm3ik9uID1Dpz7V6kdw=;
        b=O8+jUNmLmDIHwf5JV7fGWM5gkiAEQi6GJcUwI2Pahy1m/OzdfPSiaoLClq79HJrzmG
         lV2EnmLp5DN3bU7wzlllWxIFoSM3dBHtp/HbstbAKkYXJ8A9b/9NXcBhtGVuLMingQit
         62N4jMSCIUxOn1UoHg1AZRljxC4mgdMKRwmWhvmaZmuzeTWHIb3T6/d4+N2LK4KsO6td
         8YsgIpzKfwPg4q/XEhgzmCXfxUhP17X4OuTZIxm5DkNpmDxexTsaetQUpBiyFakYGyEQ
         cz7lzIBEAuKIoYCB+nyuMlWAKrMEmjB1UM8K5PchBpD/BwH834B7ExhqISKyPofg60bd
         /dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833689; x=1762438489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxKxYqiLTK7t2bCp0y6z+rFpGm3ik9uID1Dpz7V6kdw=;
        b=nBuJTO/WkXrPdHLPBVfJEezyvW0dExvmu5bldu7ujWt8d+zaGTKaRmijXev9CIrLZ/
         NTdA7dzfswc2iURYTXP5kmbynyx5jVm2jXlMwsyI/cqprGV7bvD+6PGho0PilE7ffob+
         KCYURmd4506LZgjxoBNlzF1RvPcbLfrSGiIkMFnXQZM2gmcLdDsfdBj1shCGzffO7S4G
         bFZsjzFn2CZcUlbVPGPoyO0a+dxTTkOkRGCvdeQ1XWfFrzECJ33gr8M3rLrN13osSZ3a
         5I/hQPOKjCoT8jjB+53BUjKRBdXSi1CTwFMzpJVL/F8mKDT7Cj16loGauc/sGyMJf0Zc
         6woQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRmQ5Cvbyf4HGJsQaxwwcuP7NbEX69omgLfG1GaqtcMIMdgecIYx+kohqBcdnaJU+5D43Yjav+wbt5uTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaRC4HirS+kS51GiXtbCM81VMMk//QHt77/YZ5uHuhmhyd9OwW
	C8ZRWL0Jm5gMknq/JpaMt6B2W4wBuW/J5cRjUYk25Wq0UtgjF/Y5Uo1S
X-Gm-Gg: ASbGncuKYyRy5PYFnY6yMCcUPidNy0CKanHhlBjpXIUPENoZvXAFSIv3llOglWbS/bz
	ilOAiOBsNYXL+r6tO1oYoOSMPT0Z1uNWaYAIzi0hWJiIdtT31RmGgY9lpB9si2JOJFhgv4JiiTA
	W44Ikn3/BxT6d0bTwvb1/jvN5c8qhhQRbjJ4TuxNhAcYXyPlI1Z4tzZqnSCowWjRqcLG78rFDx1
	N2Skj9LTw5Reuy71BZB2Htii57mOPUCUWnmnoyiS4rLt2EAMhIGTZT2Hb5hp3lvGsPtjU8QvYyQ
	dRUzwtca0tIN86LDUPeN8XlVBdql8XLqDFudmqYm5RPLU9LDwbfAOp9lk33+OrOfNeAPyRmwoGt
	nXC8SGzI9WdRtcpU0zmbAF4b4kYM0tJKhtXEwQV4oBULOV10IQPiGx6ng0hFd/X/96uBZMJ/krF
	RXoF0svQGwmBTRqfHgocwtQP6iscXjg4ugvl90JJzw0C9V3/g=
X-Google-Smtp-Source: AGHT+IEnl67/K1bu5GFYYZB8fGCna0mNgkidnyqtuBzjRQ64AlCfSKEvT71FANNAaXAiNyIGoyuwwQ==
X-Received: by 2002:a05:6000:310d:b0:425:7c3c:82cf with SMTP id ffacd0b85a97d-429b4c72e7cmr3181074f8f.11.1761833688836;
        Thu, 30 Oct 2025 07:14:48 -0700 (PDT)
Received: from itek.frank67.it (mob-5-90-140-35.net.vodafone.it. [5.90.140.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm32350410f8f.4.2025.10.30.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:14:48 -0700 (PDT)
From: Franco Martelli <martellif67@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rdunlap@infradead.org,
	corbet@lwn.net,
	linux-kbuild@vger.kernel.org,
	Franco Martelli <martellif67@gmail.com>
Subject: [PATCH 1/1] Kconfig: Added compare capabilities for mconf
Date: Thu, 30 Oct 2025 15:13:42 +0100
Message-ID: <20251030141342.159994-2-martellif67@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251030141342.159994-1-martellif67@gmail.com>
References: <20251030141342.159994-1-martellif67@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allows to compare the tristate value of two .config files
inline, symbol by symbol, in mconf (make menuconfig) only. It can be
really useful when customizing the .config file.

When a new stable release of a distribution is available, in the Linux
kernel many things has changed, this patch comes in help in this
situations, it allows to easily compare the customized .config file
built for the previous version of the distribution, with the one
provided by the new software distribution, used as reference.
Generally it can be helpful when the differences between .config files
are huge, because you can navigate across them in the menu window.

The patch has a limitation, it only show the tristate value (Y/N/M) not
differences for symbol with a value (string), but it also marks with a
"#" the symbol missing in the loaded .config, meaning therefore the
symbol as a new feature.

o I've also added support for the more canonical <F1> key to show inline
  help window, in addition to <?> and <h> keys.

o By pressing the <F2> or <D> key you will get a view with all the
  symbol differences listed.

o By pressing the <F4> or <F> key you'll save to a file the differences.

o Added help text that it describes the new features.

This software is under GPL-2.0 license.

Changelog:
----------

scripts/kconfig/confdata.c:
---------------------------

Silenced a warning emitted when parsing the .config file to compare.

Skipping empty sym when parsing the .config file to compare.

Added sym_get_comp_tristate_char() to return the tristate's chars
for the .config file to compare, possible values: Y/N/M/#

Added sym_name_comp() that return an int, it is used by qsort()
function to provide comparison between the two members "name" of the
"Symbol" structure.

Added comp_get_list_diff() that return a char pointer to the
allocated list of differences between the current .config file and
the one to compare. The list is sorted alphabetically.

Added conf_write_comp() that return boolean value whether saving to
file the list of differences succeed or not.

scripts/kconfig/expr.h:
-----------------------

Added the item "S_DEF_COMP" to the "enum" values used as index to
the symbol.def[] array defined in the symbol "struct".

Added boolean "comp_is_avail" member to the symbol "struct" that
is "true" when the symbol is present in the compared .config, "false"
if it's missing in the compared .config, meaning therefore a new
feature.

Defined macro SYMBOL_DEF_COMP. Unused but necessary for the logical
structure of the program.

scripts/kconfig/lkc.h:
----------------------

Added <stdbool.h> header to make available boolean type for files
that include the lkc.h header: confdata.c mconf.c etc.

Added "static inline" functions to retrieve value from the symbol
structure, so the compiler can optimize the code.

scripts/kconfig/lkc_proto.h:
----------------------------

Added some functions prototype.

scripts/kconfig/lxdialog/menubox.c:
-----------------------------------

Added "Compare" button to the menu bar, and adjusted the code
to get selected when arrow keys are used.

Added support for the key F1 to display the online help window.

Added support for the key F2 to display a view with the
differences between .config files listed.

Added support for the key F4 to save to a file differences
between .config files.

Adjust the locations of the menuconfig commands so that the
new "Compare" command fits inside an 80-column-wide terminal.
(Code written by Randy Dunlap <rdunlap@infradead.org>)

Added shortcuts for the new F2 (add 'D') and F4 (add 'F') keys
in case function keys are intercepted by some other software
layer. (Code written by Randy Dunlap <rdunlap@infradead.org>)

scripts/kconfig/mconf.c:
------------------------

Added/Edited various char array storing help messages at the
beginning of the file used in many dialog window.

Added boolean variable "has_comp_file" to keep track whether a
.config file for comparison purpose is loaded.

Edited set_config_filename(...) and added comp_set_backtitle()
to notify when "Comparison Mode" is active, changing the
back-title accordingly.

Edited build_conf(...) that de facto builds the interface of the
main window of mconf. The changes concern item_make(...) added
variable that has the "tristate" value of the compared .config
file.

Added comp_show_list_diff() that return void to display a view
that contains differences between the current .config file and
the one to compare.

Added conf_load_comp() that return void useful to load the
.config file to compare by displaying an input dialog window.

Added conf_save_comp() that return void useful to save to file
the differences between the current .config file and the one
to compare.

Edited conf(...), added "Comparison Mode" string to the title
of the dialog menu window when comparison mode is active.
Added to the "switch" construct the "case" items to handle
events to: display differences, load .config file to compare
and save differences to a file.

Signed-off-by: Franco Martelli <martellif67@gmail.com>
---
v4:
- Rewritten comp_get_list_diff(void) to obtain a lexicographically
  sorted array. Simplified the dynamic reallocation code.
- Dropped masked_xrealloc() function.
v3:
- In comparison mode, menu items without differences left untouched.
- Added commit description to the patch body.
- Link to v3: https://lore.kernel.org/all/20250624191402.268266-1-martellif67@gmail.com/
v2:
- Fixed typos per Randy Dunlap's suggestion and added changelog
  per Miguel Ojeda's suggestion.
- Link to v2: https://lore.kernel.org/all/20250604183539.425053-1-martellif67@gmail.com/

v1: https://lore.kernel.org/all/20250601184049.368419-2-martellif67@gmail.com/

 scripts/kconfig/confdata.c         | 189 ++++++++++++++++++++++-
 scripts/kconfig/expr.h             |   9 ++
 scripts/kconfig/lkc.h              |  11 ++
 scripts/kconfig/lkc_proto.h        |   4 +
 scripts/kconfig/lxdialog/menubox.c |  29 +++-
 scripts/kconfig/mconf.c            | 240 ++++++++++++++++++++++++++---
 6 files changed, 452 insertions(+), 30 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 9599a0408862..adb336feebc3 100644
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
 
@@ -529,6 +535,113 @@ int conf_read(const char *name)
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
+static int sym_name_comp(const void *p1, const void *p2)
+{
+	const struct symbol *const *s1 = p1, *const *s2 = p2;
+
+	return strcmp((*s1)->name, (*s2)->name);
+}
+
+#define LINE_LENGTH	(SYMBOL_MAXLENGTH + 32)
+
+char *comp_get_list_diff(void)
+{
+	char *line, *l_rst, *list = NULL, ch_comp;
+	size_t idx, size, cnt_sym;
+	struct symbol *sym, **sym_arr = NULL;
+	tristate tri_val, tri_comp_val;
+
+	idx = size = 0;
+
+	for_all_symbols(sym) {
+		if (!sym->name)
+			continue;
+		if (idx == size) {
+			size += 32;
+			sym_arr = xrealloc(sym_arr, size * sizeof(*sym_arr));
+		}
+		tri_val = sym_get_tristate_value(sym);
+		tri_comp_val = sym_get_comp_tristate_value(sym);
+
+		if (tri_val != tri_comp_val)
+			sym_arr[idx++] = sym;
+	}
+	cnt_sym = idx;
+	if (cnt_sym > 1)
+		qsort(sym_arr, cnt_sym, sizeof(*sym_arr), sym_name_comp);
+
+	l_rst = line = xmalloc(LINE_LENGTH);
+	idx = size = 0;
+
+	for (size_t i = 0; i < cnt_sym; ++i) {
+		tri_val = sym_get_tristate_value(sym_arr[i]);
+		ch_comp = sym_get_comp_tristate_char(sym_arr[i]);
+
+		switch (tri_val) {
+		case yes:
+			snprintf(line, LINE_LENGTH, "%s%s=y --- %c\n",
+				 CONFIG_, (sym_arr[i])->name, ch_comp);
+			break;
+		case mod:
+			snprintf(line, LINE_LENGTH, "%s%s=m --- %c\n",
+				 CONFIG_, (sym_arr[i])->name, ch_comp);
+			break;
+		case no:
+			snprintf(line, LINE_LENGTH, "# %s%s is not set --- %c\n",
+				 CONFIG_, (sym_arr[i])->name, ch_comp);
+			break;
+		}
+
+		for (; *line; ++idx) {
+			if (idx == size) {
+				size += LINE_LENGTH;
+				list = xrealloc(list, size * sizeof(*list));
+			}
+			list[idx] = *line++;
+		}
+		line = l_rst;
+	}
+	free(line);
+	free(sym_arr);
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
@@ -801,6 +914,80 @@ int conf_write_defconfig(const char *filename)
 	return 0;
 }
 
+bool conf_write_comp(const char *name)
+{
+	FILE *fptemp, *fplist;
+	char *list = NULL, f_old[PATH_MAX],  tmpfile[] = "file_XXXXXX";
+	int ch;
+
+	if (!name)
+		return false;
+
+	if (is_present(name)) {
+		if (is_dir(name))
+			return false;
+		snprintf(f_old, sizeof(f_old), "%s.old", name);
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
index 5f900d18dae0..b1cd6d6e6a5c 100644
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
@@ -157,6 +165,7 @@ struct symbol {
 #define SYMBOL_DEF_AUTO   0x20000  /* symbol.def[S_DEF_AUTO] is valid */
 #define SYMBOL_DEF3       0x40000  /* symbol.def[S_DEF_3] is valid */
 #define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
+#define SYMBOL_DEF_COMP	  0x100000 /* symbol.def[S_DEF_COMP] is valid */
 
 #define SYMBOL_MAXLENGTH	256
 
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 56548efc14d7..40fb829be089 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -9,6 +9,7 @@
 #include <assert.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <stdbool.h>
 
 #include "expr.h"
 
@@ -131,6 +132,16 @@ static inline bool sym_has_value(const struct symbol *sym)
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
index d4c19b7beebb..16d86aaaeac7 100644
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
index 84ea9215c0a7..df9629271996 100644
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
@@ -129,6 +129,21 @@ static const char mconf_readme[] =
 "settings, you may use the <Load> button to restore your previously\n"
 "saved settings from \".config\" without restarting Menuconfig.\n"
 "\n"
+"Compare\n"
+"-------\n"
+"With the \"Compare\" button you can load an alternate \".config\" file for\n"
+"comparison purpose. Once loaded, four characters separated by spaces will\n"
+"be displayed for each menu item only for items that have differences.\n"
+"Menu entries without differences will be left untouched. The character can\n"
+"be: *: for a symbol built-in, _: for a symbol excluded, M: for a symbol as\n"
+"module and #: for a symbol absent in the loaded \".config\" file, meaning\n"
+"therefore a new feature.\n"
+"\n"
+"Once loaded the .config file to compare, using the <F2> or 'D' key a view\n"
+"will be displayed listing the differences between the two .config files\n"
+"sorted alphabetically, using the <F4> or 'F' key instead, you can save to\n"
+"a file these differences.\n"
+"\n"
 "Other information\n"
 "-----------------\n"
 "If you use Menuconfig in an XTERM window, make sure you have your\n"
@@ -187,12 +202,13 @@ menu_instructions[] =
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
@@ -210,6 +226,9 @@ load_config_text[] =
 	"Enter the name of the configuration file you wish to load.  "
 	"Accept the name shown to restore the configuration you "
 	"last retrieved.  Leave blank to abort.",
+load_config_comp_text[] =
+	"Enter the name of the configuration file you wish to load for comparison purpose.  "
+	"Leave blank to abort and to quit \"Comparison Mode\".",
 load_config_help[] =
 	"\n"
 	"For various reasons, one may wish to keep several different\n"
@@ -221,6 +240,43 @@ load_config_help[] =
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
+	"each menu item only for items that have differences.\n"
+	"Menu entries without differences will be left untouched. The character can\n"
+	"be: *: for a symbol built-in, _: for a symbol excluded, M: for a symbol as\n"
+	"module and #: for a symbol absent in the loaded \".config\" file, meaning\n"
+	"therefore a new feature.\n"
+	"\n"
+	"In addition, using the <F2> or 'D' key a view will be displayed listing the\n"
+	"differences between the two .config files sorted alphabetically, using\n"
+	"the <F4> or 'F' key instead, you can save to a file these differences.\n"
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
@@ -289,16 +345,25 @@ static int single_menu_mode;
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
 {
-	static char menu_backtitle[PATH_MAX+128];
+	static char menu_backtitle[PATH_MAX + 128];
+
+	if (has_comp_file)
+		snprintf(menu_backtitle, sizeof(menu_backtitle), "%s - %s - %s",
+			 config_filename, rootmenu.prompt->text, "Comparison Mode");
+	else
+		snprintf(menu_backtitle, sizeof(menu_backtitle), "%s - %s",
+			 config_filename, rootmenu.prompt->text);
 
-	snprintf(menu_backtitle, sizeof(menu_backtitle), "%s - %s",
-		 config_filename, rootmenu.prompt->text);
 	set_dialog_backtitle(menu_backtitle);
 
 	snprintf(filename, sizeof(filename), "%s", config_filename);
@@ -457,8 +522,8 @@ static void build_conf(struct menu *menu)
 	struct property *prop;
 	struct menu *child;
 	int type, tmp, doint = 2;
-	tristate val;
-	char ch;
+	tristate val, val_comp;
+	char ch, ch_comp;
 	bool visible;
 
 	/*
@@ -541,12 +606,22 @@ static void build_conf(struct menu *menu)
 		}
 		child_count++;
 		val = sym_get_tristate_value(sym);
+		val_comp = sym_get_comp_tristate_value(sym);
+		ch_comp = sym_get_comp_tristate_char(sym);
+
 		switch (type) {
 		case S_BOOLEAN:
-			if (sym_is_changeable(sym))
-				item_make("[%c]", val == no ? ' ' : '*');
-			else
-				item_make("-%c-", val == no ? ' ' : '*');
+			if (sym_is_changeable(sym)) {
+				if (has_comp_file && (val != val_comp || ch_comp == '#'))
+					item_make("[%c] %c", val == no ? ' ' : '*', ch_comp);
+				else
+					item_make("[%c]", val == no ? ' ' : '*');
+			} else {
+				if (has_comp_file && (val != val_comp || ch_comp == '#'))
+					item_make("-%c- %c", val == no ? ' ' : '*', ch_comp);
+				else
+					item_make("-%c-", val == no ? ' ' : '*');
+			}
 			item_set_tag('t');
 			item_set_data(menu);
 			break;
@@ -557,12 +632,22 @@ static void build_conf(struct menu *menu)
 			default:  ch = ' '; break;
 			}
 			if (sym_is_changeable(sym)) {
-				if (sym->rev_dep.tri == mod)
-					item_make("{%c}", ch);
-				else
-					item_make("<%c>", ch);
+				if (sym->rev_dep.tri == mod) {
+					if (has_comp_file && (val != val_comp || ch_comp == '#'))
+						item_make("{%c} %c", ch, ch_comp);
+					else
+						item_make("{%c}", ch);
+				} else {
+					if (has_comp_file && (val != val_comp || ch_comp == '#'))
+						item_make("<%c> %c", ch, ch_comp);
+					else
+						item_make("<%c>", ch);
+				}
 			} else
-				item_make("-%c-", ch);
+				if (has_comp_file && (val != val_comp || ch_comp == '#'))
+					item_make("-%c- %c", ch, ch_comp);
+				else
+					item_make("-%c-", ch);
 			item_set_tag('t');
 			item_set_data(menu);
 			break;
@@ -696,6 +781,98 @@ static void conf_string(struct menu *menu)
 	}
 }
 
+static void comp_set_backtitle(void)
+{
+	static char menu_backtitle[PATH_MAX + 128];
+
+	if (has_comp_file)
+		snprintf(menu_backtitle, sizeof(menu_backtitle), "%s - %s - %s",
+			filename, rootmenu.prompt->text, "Comparison Mode");
+	else
+		snprintf(menu_backtitle, sizeof(menu_backtitle), "%s - %s",
+			filename, rootmenu.prompt->text);
+
+	set_dialog_backtitle(menu_backtitle);
+}
+
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
+				comp_set_backtitle();
+				return;
+			}
+			if (!conf_read_comp(dialog_input_result)) {
+				has_comp_file = true;
+				comp_set_backtitle();
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
 
@@ -754,6 +931,7 @@ static void conf(struct menu *menu, struct menu *active_menu)
 {
 	struct menu *submenu;
 	const char *prompt = menu_get_prompt(menu);
+	char comp_prompt[PATH_MAX + 128];
 	struct subtitle_part stpart;
 	struct symbol *sym;
 	int res;
@@ -773,9 +951,17 @@ static void conf(struct menu *menu, struct menu *active_menu)
 			break;
 		set_subtitle();
 		dialog_clear();
-		res = dialog_menu(prompt ? prompt : "Main Menu",
-				  menu_instructions,
-				  active_menu, &s_scroll);
+		if (has_comp_file) {
+			snprintf(comp_prompt, sizeof(comp_prompt), "%s - %s",
+				prompt ? prompt : "Main Menu", "Comparison Mode");
+			res = dialog_menu(comp_prompt,
+					  menu_instructions,
+					  active_menu, &s_scroll);
+		} else
+			res = dialog_menu(prompt ? prompt : "Main Menu",
+					  menu_instructions,
+					  active_menu, &s_scroll);
+
 		if (res == 1 || res == KEY_ESC || res == -ERRDISPLAYTOOSMALL)
 			break;
 		if (item_count() != 0) {
@@ -855,6 +1041,18 @@ static void conf(struct menu *menu, struct menu *active_menu)
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
2.47.3


