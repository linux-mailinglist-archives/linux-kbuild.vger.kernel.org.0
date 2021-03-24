Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4213484E6
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 23:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233768AbhCXWtE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 18:49:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231246AbhCXWtA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 18:49:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B852561A0A;
        Wed, 24 Mar 2021 22:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1616626140;
        bh=/2JN7xPIvupL7Dhrc68JtcoNj5OcggfcovxjyrRYVn4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nq2n5Hk6CTzOMvCgcJoeRwkkcUV7MvInTRScZwWsWdhAwZ8szan6kVzSgBNAfjs+8
         Sk/DnI7P6nvdkFDJSHlFahtgQadHFZlWe830VjnLhd4He1FMM6z7Y+7s2SkaRE0Wy5
         81gFW9WCq/zSSwqpQj1zuPpXtF2P6Da31gQdvx18=
Date:   Wed, 24 Mar 2021 15:48:59 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Marco Elver <elver@google.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] kasan: fix hwasan build for gcc
Message-Id: <20210324154859.4de61fdafd1b4ea85bec869f@linux-foundation.org>
In-Reply-To: <CANpmjNM8D+yp==DmKP0aa+g6=P38o0v6gd7y5iV52yyDUv91qw@mail.gmail.com>
References: <20210323124112.1229772-1-arnd@kernel.org>
        <CANpmjNM8D+yp==DmKP0aa+g6=P38o0v6gd7y5iV52yyDUv91qw@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 23 Mar 2021 13:51:32 +0100 Marco Elver <elver@google.com> wrote:

> On Tue, 23 Mar 2021 at 13:41, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > gcc-11 adds support for -fsanitize=kernel-hwaddress, so it becomes
> > possible to enable CONFIG_KASAN_SW_TAGS.
> >
> > Unfortunately this fails to build at the moment, because the
> > corresponding command line arguments use llvm specific syntax.
> >
> > Change it to use the cc-param macro instead, which works on both
> > clang and gcc.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Marco Elver <elver@google.com>
> 
> Although I think you need to rebase against either -mm or -next,
> because there have been changes to the CONFIG_KASAN_STACK variable.

This fix is applicable to 5.12, so it's better than the 5.13 patches in
-mm be changed to accomodate this patch.

afaict the only needed change was to update
kasan-remove-redundant-config-option.patch as below.  The
scripts/Makefile.kasan part was changed:

@@ -42,7 +48,7 @@ else
 endif
 
 CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
-		$(call cc-param,hwasan-instrument-stack=$(CONFIG_KASAN_STACK)) \
+		$(call cc-param,hwasan-instrument-stack=$(stack_enable)) \
 		$(call cc-param,hwasan-use-short-granules=0) \
 		$(instrumentation_flags)
 


Whole patch:

--- a/arch/arm64/kernel/sleep.S~kasan-remove-redundant-config-option
+++ a/arch/arm64/kernel/sleep.S
@@ -134,7 +134,7 @@ SYM_FUNC_START(_cpu_resume)
 	 */
 	bl	cpu_do_resume
 
-#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
 	mov	x0, sp
 	bl	kasan_unpoison_task_stack_below
 #endif
--- a/arch/x86/kernel/acpi/wakeup_64.S~kasan-remove-redundant-config-option
+++ a/arch/x86/kernel/acpi/wakeup_64.S
@@ -115,7 +115,7 @@ SYM_FUNC_START(do_suspend_lowlevel)
 	movq	pt_regs_r14(%rax), %r14
 	movq	pt_regs_r15(%rax), %r15
 
-#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
 	/*
 	 * The suspend path may have poisoned some areas deeper in the stack,
 	 * which we now need to unpoison.
--- a/include/linux/kasan.h~kasan-remove-redundant-config-option
+++ a/include/linux/kasan.h
@@ -330,7 +330,7 @@ static inline bool kasan_check_byte(cons
 
 #endif /* CONFIG_KASAN */
 
-#if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN) && defined(CONFIG_KASAN_STACK)
 void kasan_unpoison_task_stack(struct task_struct *task);
 #else
 static inline void kasan_unpoison_task_stack(struct task_struct *task) {}
--- a/lib/Kconfig.kasan~kasan-remove-redundant-config-option
+++ a/lib/Kconfig.kasan
@@ -138,9 +138,10 @@ config KASAN_INLINE
 
 endchoice
 
-config KASAN_STACK_ENABLE
+config KASAN_STACK
 	bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
+	default y if CC_IS_GCC
 	help
 	  The LLVM stack address sanitizer has a know problem that
 	  causes excessive stack usage in a lot of functions, see
@@ -155,7 +156,7 @@ config KASAN_STACK_ENABLE
 	  to use and enabled by default.
 
 config KASAN_STACK
-	int
+	bool
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
 	default 1 if KASAN_STACK_ENABLE || CC_IS_GCC
 	default 0
--- a/mm/kasan/common.c~kasan-remove-redundant-config-option
+++ a/mm/kasan/common.c
@@ -63,7 +63,7 @@ void __kasan_unpoison_range(const void *
 	kasan_unpoison(address, size);
 }
 
-#if CONFIG_KASAN_STACK
+#ifdef CONFIG_KASAN_STACK
 /* Unpoison the entire stack for a task. */
 void kasan_unpoison_task_stack(struct task_struct *task)
 {
--- a/mm/kasan/kasan.h~kasan-remove-redundant-config-option
+++ a/mm/kasan/kasan.h
@@ -231,7 +231,7 @@ void *kasan_find_first_bad_addr(void *ad
 const char *kasan_get_bug_type(struct kasan_access_info *info);
 void kasan_metadata_fetch_row(char *buffer, void *row);
 
-#if defined(CONFIG_KASAN_GENERIC) && CONFIG_KASAN_STACK
+#if defined(CONFIG_KASAN_GENERIC) && defined(CONFIG_KASAN_STACK)
 void kasan_print_address_stack_frame(const void *addr);
 #else
 static inline void kasan_print_address_stack_frame(const void *addr) { }
--- a/mm/kasan/report_generic.c~kasan-remove-redundant-config-option
+++ a/mm/kasan/report_generic.c
@@ -128,7 +128,7 @@ void kasan_metadata_fetch_row(char *buff
 	memcpy(buffer, kasan_mem_to_shadow(row), META_BYTES_PER_ROW);
 }
 
-#if CONFIG_KASAN_STACK
+#ifdef CONFIG_KASAN_STACK
 static bool __must_check tokenize_frame_descr(const char **frame_descr,
 					      char *token, size_t max_tok_len,
 					      unsigned long *value)
--- a/scripts/Makefile.kasan~kasan-remove-redundant-config-option
+++ a/scripts/Makefile.kasan
@@ -2,6 +2,12 @@
 CFLAGS_KASAN_NOSANITIZE := -fno-builtin
 KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
 
+ifdef CONFIG_KASAN_STACK
+	stack_enable := 1
+else
+	stack_enable := 0
+endif
+
 ifdef CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_INLINE
@@ -27,7 +33,7 @@ else
 	CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
 	 $(call cc-param,asan-globals=1) \
 	 $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
-	 $(call cc-param,asan-stack=$(CONFIG_KASAN_STACK)) \
+	 $(call cc-param,asan-stack=$(stack_enable)) \
 	 $(call cc-param,asan-instrument-allocas=1)
 endif
 
@@ -42,7 +48,7 @@ else
 endif
 
 CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
-		$(call cc-param,hwasan-instrument-stack=$(CONFIG_KASAN_STACK)) \
+		$(call cc-param,hwasan-instrument-stack=$(stack_enable)) \
 		$(call cc-param,hwasan-use-short-granules=0) \
 		$(instrumentation_flags)
 
--- a/security/Kconfig.hardening~kasan-remove-redundant-config-option
+++ a/security/Kconfig.hardening
@@ -64,7 +64,7 @@ choice
 	config GCC_PLUGIN_STRUCTLEAK_BYREF
 		bool "zero-init structs passed by reference (strong)"
 		depends on GCC_PLUGINS
-		depends on !(KASAN && KASAN_STACK=1)
+		depends on !(KASAN && KASAN_STACK)
 		select GCC_PLUGIN_STRUCTLEAK
 		help
 		  Zero-initialize any structures on the stack that may
@@ -82,7 +82,7 @@ choice
 	config GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
 		bool "zero-init anything passed by reference (very strong)"
 		depends on GCC_PLUGINS
-		depends on !(KASAN && KASAN_STACK=1)
+		depends on !(KASAN && KASAN_STACK)
 		select GCC_PLUGIN_STRUCTLEAK
 		help
 		  Zero-initialize any stack variables that may be passed
_

