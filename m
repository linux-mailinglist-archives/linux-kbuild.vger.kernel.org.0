Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3339D41CF92
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Sep 2021 00:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347283AbhI2XAn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Sep 2021 19:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345988AbhI2XAn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Sep 2021 19:00:43 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78851C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 15:59:01 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id b20-20020ac87fd4000000b002a69ee90efbso10244333qtk.11
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 15:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Y0fyPdUie1iSxIBYtbb4DeMpLSWx01C9hO67e6l3dr0=;
        b=nu9TcOGaSlq3xlUF2IUW3fpIATmfengtbYq6jTg23D+ETIyP5m/nduYBm7l/vJpGYr
         8DzmfaTt5faVWB1feuN6nBQ1cOHlBRiyZ9CCTX3nUcR0hhK/wtStvbCAK3z3o9pNIb5r
         DhhT5vtCfDC99AnWqpTgyAJ6dazpMq79FoXjZMFdZvxAJKyCNo7aTegex/7BEoFii9lH
         WnZSnMPzxmndP/NYhtA/Acdi7WmJj2LPrge0l60K2BmT7yYyIXvt+0MM/vpzIiNC/VOD
         cQ6g41MV4dyMjOlHx4iN207wQBcD5ghOBKN3dJeblTcpP0VStzlFHy9Wh43tHS9FBpRo
         EauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Y0fyPdUie1iSxIBYtbb4DeMpLSWx01C9hO67e6l3dr0=;
        b=Ijw5WR5C0G7v49jrmvm2O2qn7uTu+pGlj79kqRKIbQ67pNH41V55dH6fyZeZx9+enw
         Ul/6uOZpatzo/Kn2BVaME7YkfyCMf57hS3lRlvv++9zWLBNe3zebXS1uyhxo0UpkuSGX
         PZ0tYL09sPp4w7FAcMROBF5KwUVAQIf0dtrRwyfSrHIKv3BMRoceknsxtRqwwn52a211
         epY922dL9/QBTDjiHPjp8RZOl7jB/SWyZZZ7jB6pzJEbMv77J2My2lg4u3duvXTrS/hS
         0WWeim7d0bG6UWK2izXuvbFLlTy9dKQU+mgeCAO07yi6QQ/RPqnfalSn1w858+CPvhwt
         snvw==
X-Gm-Message-State: AOAM532HwAw4+MkJsDlrcX9PxgoXbqwEdcfTGGtkbUOyt8jFLsq7Z7V7
        v+6LheT0ZVvf1YlFe+lNePYwrNWieCpeay6kVfs=
X-Google-Smtp-Source: ABdhPJzsGtOgTGzcZeycB3hzn+zehXj8IMbUcTiceRrok8CcxB5CYI/qNsX46VPtqvOX/Y8MYnDtlPJx1tqGeu9QqUI=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:da31:1dfd:2e69:dc82])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:1022:: with SMTP id
 k2mr916562qvr.53.1632956340603; Wed, 29 Sep 2021 15:59:00 -0700 (PDT)
Date:   Wed, 29 Sep 2021 15:58:50 -0700
Message-Id: <20210929225850.3889950-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH] modpost: add allow list for llvm IPSCCP
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Modpost validation of calls from .text to .init sections relies on GCC's
constant propagation renaming specialized functions being renamed to
have .constprop.* suffixes. See the comment on Pattern 5 in
scripts/mod/modpost.c:

  GCC may optimize static inlines when fed constant arg(s) resulting
  in functions like cpumask_empty() -- generating an associated symbol
  cpumask_empty.constprop.3 that appears in the audit.  If the const that
  is passed in comes from __init, like say nmi_ipi_mask, we get a
  meaningless section warning.

LLVM does similar optimizations (inter-procedural sparse conditional
constant propagation; IPSCCP), but doesn't rename the specialized
functions, so we still observe modpost warnings.

Add checks in modpost to check if the .comment section contains that
string "clang" (ie. was the object file built with clang?), and if so
additionally check an allow list.

Fixes the following modpost warnings observed on clang-13+:

allmodconfig:
WARNING: modpost: vmlinux.o(.text+0x*): Section mismatch in reference
from the function
  test_bit() to the variable .init.data:numa_nodes_parsed
  __first_node() to the variable .init.data:numa_nodes_parsed
  __next_node() to the variable .init.data:numa_nodes_parsed
  __nodes_weight() to the variable .init.data:numa_nodes_parsed
  early_get_smp_config() to the variable .init.data:x86_init
defconfig:
  __nodes_weight() to the variable .init.data:numa_nodes_parsed

Link: https://github.com/ClangBuiltLinux/linux/issues/1302
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/mod/modpost.c | 56 ++++++++++++++++++++++++++++++++++++++-----
 scripts/mod/modpost.h |  2 ++
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index cb8ab7d91d30..c3d0395315ef 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -865,6 +865,29 @@ static int match(const char *sym, const char * const pat[])
 	return 0;
 }
 
+struct secref_exception {
+	const char * const fromsym, * const tosym;
+};
+
+static const struct secref_exception secref_allowlist[] = {
+	{ .fromsym = "__first_node", .tosym = "numa_nodes_parsed" },
+	{ .fromsym = "__next_node", .tosym = "numa_nodes_parsed" },
+	{ .fromsym = "__nodes_weight", .tosym = "numa_nodes_parsed" },
+	{ .fromsym = "early_get_smp_config", .tosym = "x86_init" },
+	{ .fromsym = "test_bit", .tosym = "numa_nodes_parsed" },
+};
+
+static int match_allowlist(const char *fromsym, const char *tosym)
+{
+	int i = 0, e = ARRAY_SIZE(secref_allowlist);
+
+	for (; i != e; ++i)
+		if (!strcmp(secref_allowlist[i].fromsym, fromsym) &&
+		    !strcmp(secref_allowlist[i].tosym, tosym))
+			return 1;
+	return 0;
+}
+
 /* sections that we do not want to do full section mismatch check on */
 static const char *const section_white_list[] =
 {
@@ -1204,6 +1227,8 @@ static const struct sectioncheck *section_mismatch(
  *   tosec   = init section
  *   fromsec = text section
  *   refsymname = *.constprop.*
+ *   LLVM will do similar constant propagation, but it will not rename the
+ *   transformed callee.
  *
  * Pattern 6:
  *   Hide section mismatch warnings for ELF local symbols.  The goal
@@ -1216,7 +1241,8 @@ static const struct sectioncheck *section_mismatch(
  **/
 static int secref_whitelist(const struct sectioncheck *mismatch,
 			    const char *fromsec, const char *fromsym,
-			    const char *tosec, const char *tosym)
+			    const char *tosec, const char *tosym,
+			    _Bool isclang)
 {
 	/* Check for pattern 1 */
 	if (match(tosec, init_data_sections) &&
@@ -1247,9 +1273,10 @@ static int secref_whitelist(const struct sectioncheck *mismatch,
 
 	/* Check for pattern 5 */
 	if (match(fromsec, text_sections) &&
-	    match(tosec, init_sections) &&
-	    match(fromsym, optim_symbols))
-		return 0;
+	    match(tosec, init_sections))
+		if (match(fromsym, optim_symbols) ||
+		    (isclang && match_allowlist(fromsym, tosym)))
+			return 0;
 
 	/* Check for pattern 6 */
 	if (strstarts(fromsym, ".L"))
@@ -1573,6 +1600,21 @@ static void report_sec_mismatch(const char *modname,
 	fprintf(stderr, "\n");
 }
 
+static _Bool is_clang(struct elf_info *elf)
+{
+	Elf_Sym *sym;
+
+	for (sym = elf->symtab_start; sym < elf->symtab_stop; sym++) {
+		if (is_shndx_special(sym->st_shndx))
+			continue;
+		if (strcmp(sec_name(elf, get_secindex(elf, sym)), ".comment") != 0)
+			continue;
+		return strstr(sym_get_data(elf, sym), "clang") != NULL;
+	}
+
+	return false;
+}
+
 static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 				     const struct sectioncheck* const mismatch,
 				     Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
@@ -1582,6 +1624,7 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 	Elf_Sym *from;
 	const char *tosym;
 	const char *fromsym;
+	_Bool isclang;
 
 	from = find_elf_symbol2(elf, r->r_offset, fromsec);
 	fromsym = sym_name(elf, from);
@@ -1592,10 +1635,11 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 	tosec = sec_name(elf, get_secindex(elf, sym));
 	to = find_elf_symbol(elf, r->r_addend, sym);
 	tosym = sym_name(elf, to);
+	isclang = is_clang(elf);
 
 	/* check whitelist - we may ignore it */
-	if (secref_whitelist(mismatch,
-			     fromsec, fromsym, tosec, tosym)) {
+	if (secref_whitelist(mismatch, fromsec, fromsym, tosec, tosym,
+			     isclang)) {
 		report_sec_mismatch(modname, mismatch,
 				    fromsec, r->r_offset, fromsym,
 				    is_function(from), tosec, tosym,
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 0c47ff95c0e2..d8afc912fd92 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -214,3 +214,5 @@ void modpost_log(enum loglevel loglevel, const char *fmt, ...);
 #define warn(fmt, args...)	modpost_log(LOG_WARN, fmt, ##args)
 #define error(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
 #define fatal(fmt, args...)	modpost_log(LOG_FATAL, fmt, ##args)
+
+#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
-- 
2.33.0.685.g46640cef36-goog

