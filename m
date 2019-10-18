Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 029BADC0FD
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2019 11:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436467AbfJRJcL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Oct 2019 05:32:11 -0400
Received: from mail-wm1-f73.google.com ([209.85.128.73]:58278 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409764AbfJRJcK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Oct 2019 05:32:10 -0400
Received: by mail-wm1-f73.google.com with SMTP id f63so2067337wma.7
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Oct 2019 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=EOYWaebnqr4bdUqKvgBWQLBw0XpiuWDYFAjzzlBAHXY=;
        b=VgaN/EjjJ85pJq5V+xPnf3AOGr/QfT1iM0/jlK0dSJoItGhBWsWhzIFcqEY/u0i/9x
         awSAtQHqMl/iOBnMdxMfMKgVXKC/m39wwV57T8tUa/Es6L/K/e08chH6nPqxD/IZaY7M
         mUp9ZOsrrK4QM/Lm5vQMczb5WL5D+ZXERDhcgM1qjd5Y0KArxl4vQoESEav579SLCNNy
         F2To6rGvBRx0ubGt1TRtBhVi5/nmS1ih67ezlMrw8YMmzoazbOjeYERv3NZwgKG1fkki
         sPjlOsyHG9egqd8X820ueQzBSmb8hJbrII0K2jaPaapTbstXVdtnCk7+wKOh9jgj6nFH
         hg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EOYWaebnqr4bdUqKvgBWQLBw0XpiuWDYFAjzzlBAHXY=;
        b=D93MN3fFNTABKTGlF0/6IrTtkWYOPYBp+InCjmJf8QoFGLUB8/tlPeiWG5kIH+nffV
         JYSRorRqXcTZCnje99w3tvVinkvF44SiqhNkLitXVduSiGb5EHkCBMZ4s3o7+ok9Qm1W
         jt8DPp/r5ZPPvA9oRsk6WtrYH4eYS2lyjIMRz7wu57oD3LD9i4X5U3DkTz9rt/yhH3B8
         wP4oiHtF0sDyRLVNjdbRii7adKFK7ahvIYW9IrFz9RiTpkrzIN6pTbtanwt0iekYZEdS
         YoCdNf7YZy/lDinS8ZFLO4d/hR07SBf/rY40gsHKHTJxwFi9c2tQauj6c6rXyJXDvH2Z
         7fMg==
X-Gm-Message-State: APjAAAVqd0bGlXUEBdvzBNumjXck1MvYyAVFZ2YU77o4SPkncj/xfJp6
        b2V48eSnbqL7vR9nL3ecwtLtx3YLMYlz2A==
X-Google-Smtp-Source: APXvYqzV1MEOz6axUddoEVlXVgpVxUdOImVrI2s3/ru+G9PNxije8sd8fJb3N8JtJ6Z6C2Ks4dOOxo6KZfdllw==
X-Received: by 2002:adf:ed02:: with SMTP id a2mr6764291wro.11.1571391127786;
 Fri, 18 Oct 2019 02:32:07 -0700 (PDT)
Date:   Fri, 18 Oct 2019 10:31:43 +0100
In-Reply-To: <20191018093143.15997-1-maennich@google.com>
Message-Id: <20191018093143.15997-5-maennich@google.com>
Mime-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191018093143.15997-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH v2 4/4] export: avoid code duplication in include/linux/export.h
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

include/linux/export.h has lots of code duplication between
EXPORT_SYMBOL and EXPORT_SYMBOL_NS.

To improve the maintainability and readability, unify the
implementation.

When the symbol has no namespace, pass the empty string "" to
the 'ns' parameter.

The drawback of this change is, it grows the code size.
When the symbol has no namespace, sym->namespace was previously
NULL, but it is now an empty string "". So, it increases 1 byte
for every no namespace EXPORT_SYMBOL.

A typical kernel configuration has 10K exported symbols, so it
increases 10KB in rough estimation.

I did not come up with a good idea to refactor it without increasing
the code size.

I am not sure how big a deal it is, but at least include/linux/export.h
looks nicer.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
[maennich: rebase on top of 3 fixes for the namespace feature]
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 include/linux/export.h | 91 +++++++++++++-----------------------------
 kernel/module.c        |  2 +-
 2 files changed, 29 insertions(+), 64 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 941d075f03d6..201262793369 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -46,7 +46,7 @@ extern struct module __this_module;
  * absolute relocations that require runtime processing on relocatable
  * kernels.
  */
-#define __KSYMTAB_ENTRY_NS(sym, sec)					\
+#define __KSYMTAB_ENTRY(sym, sec)					\
 	__ADDRESSABLE(sym)						\
 	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
 	    "	.balign	4					\n"	\
@@ -56,33 +56,17 @@ extern struct module __this_module;
 	    "	.long	__kstrtabns_" #sym "- .			\n"	\
 	    "	.previous					\n")
 
-#define __KSYMTAB_ENTRY(sym, sec)					\
-	__ADDRESSABLE(sym)						\
-	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
-	    "	.balign 4					\n"	\
-	    "__ksymtab_" #sym ":				\n"	\
-	    "	.long	" #sym "- .				\n"	\
-	    "	.long	__kstrtab_" #sym "- .			\n"	\
-	    "	.long	0					\n"	\
-	    "	.previous					\n")
-
 struct kernel_symbol {
 	int value_offset;
 	int name_offset;
 	int namespace_offset;
 };
 #else
-#define __KSYMTAB_ENTRY_NS(sym, sec)					\
-	static const struct kernel_symbol __ksymtab_##sym		\
-	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
-	__aligned(sizeof(void *))					\
-	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtabns_##sym }
-
 #define __KSYMTAB_ENTRY(sym, sec)					\
 	static const struct kernel_symbol __ksymtab_##sym		\
 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
 	__aligned(sizeof(void *))					\
-	= { (unsigned long)&sym, __kstrtab_##sym, NULL }
+	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtabns_##sym }
 
 struct kernel_symbol {
 	unsigned long value;
@@ -93,28 +77,20 @@ struct kernel_symbol {
 
 #ifdef __GENKSYMS__
 
-#define ___EXPORT_SYMBOL(sym,sec)	__GENKSYMS_EXPORT_SYMBOL(sym)
-#define ___EXPORT_SYMBOL_NS(sym,sec,ns)	__GENKSYMS_EXPORT_SYMBOL(sym)
+#define ___EXPORT_SYMBOL(sym, sec, ns)	__GENKSYMS_EXPORT_SYMBOL(sym)
 
 #else
 
-#define ___export_symbol_common(sym, sec)				\
+/* For every exported symbol, place a struct in the __ksymtab section */
+#define ___EXPORT_SYMBOL(sym, sec, ns)					\
 	extern typeof(sym) sym;						\
 	__CRC_SYMBOL(sym, sec);						\
 	static const char __kstrtab_##sym[]				\
 	__attribute__((section("__ksymtab_strings"), used, aligned(1)))	\
-	= #sym								\
-
-/* For every exported symbol, place a struct in the __ksymtab section */
-#define ___EXPORT_SYMBOL_NS(sym, sec, ns)				\
-	___export_symbol_common(sym, sec);				\
+	= #sym;								\
 	static const char __kstrtabns_##sym[]				\
 	__attribute__((section("__ksymtab_strings"), used, aligned(1)))	\
-	= #ns;								\
-	__KSYMTAB_ENTRY_NS(sym, sec)
-
-#define ___EXPORT_SYMBOL(sym, sec)					\
-	___export_symbol_common(sym, sec);				\
+	= ns;								\
 	__KSYMTAB_ENTRY(sym, sec)
 
 #endif
@@ -126,8 +102,7 @@ struct kernel_symbol {
  * be reused in other execution contexts such as the UEFI stub or the
  * decompressor.
  */
-#define __EXPORT_SYMBOL_NS(sym, sec, ns)
-#define __EXPORT_SYMBOL(sym, sec)
+#define __EXPORT_SYMBOL(sym, sec, ns)
 
 #elif defined(CONFIG_TRIM_UNUSED_KSYMS)
 
@@ -143,48 +118,38 @@ struct kernel_symbol {
 #define __ksym_marker(sym)	\
 	static int __ksym_marker_##sym[0] __section(".discard.ksym") __used
 
-#define __EXPORT_SYMBOL(sym, sec)				\
-	__ksym_marker(sym);					\
-	__cond_export_sym(sym, sec, __is_defined(__KSYM_##sym))
-#define __cond_export_sym(sym, sec, conf)			\
-	___cond_export_sym(sym, sec, conf)
-#define ___cond_export_sym(sym, sec, enabled)			\
-	__cond_export_sym_##enabled(sym, sec)
-#define __cond_export_sym_1(sym, sec) ___EXPORT_SYMBOL(sym, sec)
-#define __cond_export_sym_0(sym, sec) /* nothing */
-
-#define __EXPORT_SYMBOL_NS(sym, sec, ns)				\
+#define __EXPORT_SYMBOL(sym, sec, ns)					\
 	__ksym_marker(sym);						\
-	__cond_export_ns_sym(sym, sec, ns, __is_defined(__KSYM_##sym))
-#define __cond_export_ns_sym(sym, sec, ns, conf)			\
-	___cond_export_ns_sym(sym, sec, ns, conf)
-#define ___cond_export_ns_sym(sym, sec, ns, enabled)			\
-	__cond_export_ns_sym_##enabled(sym, sec, ns)
-#define __cond_export_ns_sym_1(sym, sec, ns) ___EXPORT_SYMBOL_NS(sym, sec, ns)
-#define __cond_export_ns_sym_0(sym, sec, ns) /* nothing */
+	__cond_export_sym(sym, sec, ns, __is_defined(__KSYM_##sym))
+#define __cond_export_sym(sym, sec, ns, conf)				\
+	___cond_export_sym(sym, sec, ns, conf)
+#define ___cond_export_sym(sym, sec, ns, enabled)			\
+	__cond_export_sym_##enabled(sym, sec, ns)
+#define __cond_export_sym_1(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
+#define __cond_export_sym_0(sym, sec, ns) /* nothing */
 
 #else
 
-#define __EXPORT_SYMBOL_NS(sym,sec,ns)	___EXPORT_SYMBOL_NS(sym,sec,ns)
-#define __EXPORT_SYMBOL(sym,sec)	___EXPORT_SYMBOL(sym,sec)
+#define __EXPORT_SYMBOL(sym, sec, ns)	___EXPORT_SYMBOL(sym, sec, ns)
 
 #endif /* CONFIG_MODULES */
 
 #ifdef DEFAULT_SYMBOL_NAMESPACE
-#undef __EXPORT_SYMBOL
-#define __EXPORT_SYMBOL(sym, sec)				\
-	__EXPORT_SYMBOL_NS(sym, sec, DEFAULT_SYMBOL_NAMESPACE)
+#include <linux/stringify.h>
+#define _EXPORT_SYMBOL(sym, sec)	__EXPORT_SYMBOL(sym, sec, __stringify(DEFAULT_SYMBOL_NAMESPACE))
+#else
+#define _EXPORT_SYMBOL(sym, sec)	__EXPORT_SYMBOL(sym, sec, "")
 #endif
 
-#define EXPORT_SYMBOL(sym)		__EXPORT_SYMBOL(sym, "")
-#define EXPORT_SYMBOL_GPL(sym)		__EXPORT_SYMBOL(sym, "_gpl")
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)	__EXPORT_SYMBOL(sym, "_gpl_future")
-#define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL_NS(sym, "", ns)
-#define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL_NS(sym, "_gpl", ns)
+#define EXPORT_SYMBOL(sym)		_EXPORT_SYMBOL(sym, "")
+#define EXPORT_SYMBOL_GPL(sym)		_EXPORT_SYMBOL(sym, "_gpl")
+#define EXPORT_SYMBOL_GPL_FUTURE(sym)	_EXPORT_SYMBOL(sym, "_gpl_future")
+#define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", #ns)
+#define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "_gpl", #ns)
 
 #ifdef CONFIG_UNUSED_SYMBOLS
-#define EXPORT_UNUSED_SYMBOL(sym)	__EXPORT_SYMBOL(sym, "_unused")
-#define EXPORT_UNUSED_SYMBOL_GPL(sym)	__EXPORT_SYMBOL(sym, "_unused_gpl")
+#define EXPORT_UNUSED_SYMBOL(sym)	_EXPORT_SYMBOL(sym, "_unused")
+#define EXPORT_UNUSED_SYMBOL_GPL(sym)	_EXPORT_SYMBOL(sym, "_unused_gpl")
 #else
 #define EXPORT_UNUSED_SYMBOL(sym)
 #define EXPORT_UNUSED_SYMBOL_GPL(sym)
diff --git a/kernel/module.c b/kernel/module.c
index ff2d7359a418..26c13173da3d 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1400,7 +1400,7 @@ static int verify_namespace_is_imported(const struct load_info *info,
 	char *imported_namespace;
 
 	namespace = kernel_symbol_namespace(sym);
-	if (namespace) {
+	if (namespace && namespace[0]) {
 		imported_namespace = get_modinfo(info, "import_ns");
 		while (imported_namespace) {
 			if (strcmp(namespace, imported_namespace) == 0)
-- 
2.23.0.866.gb869b98d4c-goog

