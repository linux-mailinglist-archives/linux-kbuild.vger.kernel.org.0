Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C16E1AD74C
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 12:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729369AbfIIKxn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 06:53:43 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:54371 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729342AbfIIKxm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 06:53:42 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x89ArI1M010864;
        Mon, 9 Sep 2019 19:53:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x89ArI1M010864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568026399;
        bh=TPeYKnTEdhTSobLdVu97GXYNke2Sz7pzo6o03rxMrF8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EyHKJvqAnMJPsStPeeSPGtTcYtAW8I8GPAqQrIO3Mue5DpnJA5t9UTUaMgF6VLA5N
         80apDHEZgfWGdQI+8qKe/6/m8EvFKM7nNPE+qRyUdVFZZ9sZxIB9lBm4yDS5bgnkPY
         Pmu9LReTTNraDcA4z7F5IpA44ZK3xEKdQib7bgBtiWV5QLpNC1DkEuTqmN+QPkvlkG
         700n/RyJ5GBNAUL8HTRPJYyuiEAvYUFZG4AqNNy9fsVxCkzLeue49Vfap5QWSqNfU2
         OXmxEu5XU7B59rwPY5UuX+IGQ1OiSQA9IQNhKe1f/0xfTZKIJt+2CcUz2CPQivQkli
         P53suwAxUT7fA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] export.h, genksyms: do not make genksyms calculate CRC of trimmed symbols
Date:   Mon,  9 Sep 2019 19:53:17 +0900
Message-Id: <20190909105317.20473-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909105317.20473-1-yamada.masahiro@socionext.com>
References: <20190909105317.20473-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Arnd Bergmann reported false-positive modpost warnings detected by
his randconfig testing of linux-next:

  https://lkml.org/lkml/2019/9/6/619

Actually, this happens under the combination of CONFIG_MODVERSIONS=y
and CONFIG_TRIM_UNUSED_KSYMS=y since commit 15bfc2348d54 ("modpost:
check for static EXPORT_SYMBOL* functions").

For example, arch/arm/config/multi_v7_defconfig + CONFIG_MODVERSIONS=y
+ CONFIG_TRIM_UNUSED_KSYMS=y produces the following false-positives:

WARNING: "__lshrdi3" [vmlinux] is a static (unknown)
WARNING: "__ashrdi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_lasr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_llsr" [vmlinux] is a static (unknown)
WARNING: "ftrace_set_clr_event" [vmlinux] is a static (unknown)
WARNING: "__muldi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown)
WARNING: "__ucmpdi2" [vmlinux] is a static (unknown)
WARNING: "__aeabi_lmul" [vmlinux] is a static (unknown)
WARNING: "__bswapsi2" [vmlinux] is a static (unknown)
WARNING: "__bswapdi2" [vmlinux] is a static (unknown)
WARNING: "__ashldi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_llsl" [vmlinux] is a static (unknown)

The root cause of the problem is not in the modpost, but in the
implementation of CONFIG_TRIM_UNUSED_KSYMS.

If there is at least one untrimmed symbol in the file, genksyms is
invoked to calculate CRC of *all* the symbols in that file even if
some of them have been trimmed due to no caller existing.

As a result, .tmp_*.ver files contain CRC of trimmed symbols, thus
unneeded __crc* symbols are added to objects. It has been harmless
until recently.

Since commit 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL*
functions"), it is harmful because the bogus __crc* symbols make
modpost call sym_update_crc(), and then new_symbol(), but there is
no one that clears the ->is_static member.

I gave Fixes to the first commit that uncovered the issue, but the
potential problem has long existed since commit f235541699bc
("export.h: allow for per-symbol configurable EXPORT_SYMBOL()").

Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/export.h      | 42 ++++++++++++++-----------------------
 scripts/genksyms/keywords.c |  6 +-----
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index cdd98a0d918c..7d8c112a8b61 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -18,9 +18,6 @@ extern struct module __this_module;
 #define THIS_MODULE ((struct module *)0)
 #endif
 
-#ifdef CONFIG_MODULES
-
-#if !defined(__GENKSYMS__)
 #ifdef CONFIG_MODVERSIONS
 /* Mark the CRC weak since genksyms apparently decides not to
  * generate a checksums for some symbols */
@@ -74,6 +71,12 @@ struct kernel_symbol {
 };
 #endif
 
+#ifdef __GENKSYMS__
+
+#define ___EXPORT_SYMBOL(sym, sec)	__GENKSYMS_EXPORT_SYMBOL(sym)
+
+#else
+
 /* For every exported symbol, place a struct in the __ksymtab section */
 #define ___EXPORT_SYMBOL(sym, sec)					\
 	extern typeof(sym) sym;						\
@@ -83,7 +86,9 @@ struct kernel_symbol {
 	= #sym;								\
 	__KSYMTAB_ENTRY(sym, sec)
 
-#if defined(__DISABLE_EXPORTS)
+#endif
+
+#if !defined(CONFIG_MODULES) || defined(__DISABLE_EXPORTS)
 
 /*
  * Allow symbol exports to be disabled completely so that C code may
@@ -117,37 +122,22 @@ struct kernel_symbol {
 #define __cond_export_sym_0(sym, sec) /* nothing */
 
 #else
-#define __EXPORT_SYMBOL ___EXPORT_SYMBOL
-#endif
 
-#define EXPORT_SYMBOL(sym)					\
-	__EXPORT_SYMBOL(sym, "")
+#define __EXPORT_SYMBOL(sym, sec)	___EXPORT_SYMBOL(sym, sec)
 
-#define EXPORT_SYMBOL_GPL(sym)					\
-	__EXPORT_SYMBOL(sym, "_gpl")
-
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)				\
-	__EXPORT_SYMBOL(sym, "_gpl_future")
+#endif /* CONFIG_MODULES */
 
+#define EXPORT_SYMBOL(sym)		__EXPORT_SYMBOL(sym, "")
+#define EXPORT_SYMBOL_GPL(sym)		__EXPORT_SYMBOL(sym, "_gpl")
+#define EXPORT_SYMBOL_GPL_FUTURE(sym)	__EXPORT_SYMBOL(sym, "_gpl_future")
 #ifdef CONFIG_UNUSED_SYMBOLS
-#define EXPORT_UNUSED_SYMBOL(sym) __EXPORT_SYMBOL(sym, "_unused")
-#define EXPORT_UNUSED_SYMBOL_GPL(sym) __EXPORT_SYMBOL(sym, "_unused_gpl")
+#define EXPORT_UNUSED_SYMBOL(sym)	__EXPORT_SYMBOL(sym, "_unused")
+#define EXPORT_UNUSED_SYMBOL_GPL(sym)	__EXPORT_SYMBOL(sym, "_unused_gpl")
 #else
 #define EXPORT_UNUSED_SYMBOL(sym)
 #define EXPORT_UNUSED_SYMBOL_GPL(sym)
 #endif
 
-#endif	/* __GENKSYMS__ */
-
-#else /* !CONFIG_MODULES... */
-
-#define EXPORT_SYMBOL(sym)
-#define EXPORT_SYMBOL_GPL(sym)
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)
-#define EXPORT_UNUSED_SYMBOL(sym)
-#define EXPORT_UNUSED_SYMBOL_GPL(sym)
-
-#endif /* CONFIG_MODULES */
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _LINUX_EXPORT_H */
diff --git a/scripts/genksyms/keywords.c b/scripts/genksyms/keywords.c
index c586d32dd2c3..7a85c4e21175 100644
--- a/scripts/genksyms/keywords.c
+++ b/scripts/genksyms/keywords.c
@@ -3,11 +3,7 @@ static struct resword {
 	const char *name;
 	int token;
 } keywords[] = {
-	{ "EXPORT_SYMBOL", EXPORT_SYMBOL_KEYW },
-	{ "EXPORT_SYMBOL_GPL", EXPORT_SYMBOL_KEYW },
-	{ "EXPORT_SYMBOL_GPL_FUTURE", EXPORT_SYMBOL_KEYW },
-	{ "EXPORT_UNUSED_SYMBOL", EXPORT_SYMBOL_KEYW },
-	{ "EXPORT_UNUSED_SYMBOL_GPL", EXPORT_SYMBOL_KEYW },
+	{ "__GENKSYMS_EXPORT_SYMBOL", EXPORT_SYMBOL_KEYW },
 	{ "__asm", ASM_KEYW },
 	{ "__asm__", ASM_KEYW },
 	{ "__attribute", ATTRIBUTE_KEYW },
-- 
2.17.1

