Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C96204751
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2020 04:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731434AbgFWCez (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jun 2020 22:34:55 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64796 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731312AbgFWCez (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jun 2020 22:34:55 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 05N2YUDW002966;
        Tue, 23 Jun 2020 11:34:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 05N2YUDW002966
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592879671;
        bh=1lLcYF/LZ8H1nk/8LWvCWpU+7OhJmGJjbhPMbdNSNjM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KD5WvljvJ/VSCYEfLYq/eXK4KdYBFYX3lGLWLv7E72p2xaTzFfnIhbBDOjp4nfOmt
         ZXuwuykiGeeYQ6AfcALtoZbgvsLXKZjz0VSZgsmS9RAPWbjFZTeO5BmOPitUBgQLiZ
         h9JuJHLHRiv9KzVuu3vBJwNZ3tFlMv6gwD7D11jYrq1EFp2JjmWE4dCr1rrYm4iqqI
         eKz3PrOuGhb9ONPnzQP+RGW40Hl1Qq9Q77mlqgz2ivCOEGG831y9LbXpKJGb7dq78H
         GK0zG8ETHt6rQEmv/Nvp+IiSHwFJIsGMmb8W9HB4L6TfasOqz0uLlVHWHhEdA1uHFZ
         u/ahAJGhspCvQ==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id h190so1829636vkh.6;
        Mon, 22 Jun 2020 19:34:30 -0700 (PDT)
X-Gm-Message-State: AOAM533uRRhKfs7Ij27eOTS16+0DNgLz3lf6hY5MJF5Ak3zbWjBjMIsY
        fJXPZQAPE/3UmfxKGfFAKHjewjxTX5cWUZciJ0s=
X-Google-Smtp-Source: ABdhPJzLme3JzQktv3O54XSU7arBkwLIhxipoyWUg+gtZndRoAHQqt3RnmD9gpQ6HyR5IRzDj51Zq47HLNs37weLKwo=
X-Received: by 2002:a1f:a8d0:: with SMTP id r199mr17161979vke.26.1592879669325;
 Mon, 22 Jun 2020 19:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <202006221201.3641ED037E@keescook>
In-Reply-To: <202006221201.3641ED037E@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 23 Jun 2020 11:33:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQL=XF+xvsRNTEGXtY7J-fx5FJKpMuScoxLt8SDKGB3_Q@mail.gmail.com>
Message-ID: <CAK7LNAQL=XF+xvsRNTEGXtY7J-fx5FJKpMuScoxLt8SDKGB3_Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Provide way to actually disable stack protector
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, X86 ML <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 23, 2020 at 4:02 AM Kees Cook <keescook@chromium.org> wrote:
>
> Some builds of GCC enable stack protector by default. Simply removing
> the arguments is not sufficient to disable stack protector, as the stack
> protector for those GCC builds must be explicitly disabled. (Removing the
> arguments is left as-is just to be sure there are no ordering problems. If
> -fno-stack-protector ended up _before_ -fstack-protector, it would not
> disable it: GCC uses whichever -f... comes last on the command line.)
>
> Fixes: 20355e5f73a7 ("x86/entry: Exclude low level entry code from sanitizing")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  Makefile                          | 4 +++-
>  arch/Kconfig                      | 3 ---
>  arch/arm/boot/compressed/Makefile | 4 ++--
>  arch/x86/entry/Makefile           | 3 +++
>  4 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ac2c61c37a73..b46e91bf0b0e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -762,7 +762,9 @@ ifneq ($(CONFIG_FRAME_WARN),0)
>  KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
>  endif
>
> -stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> +DISABLE_STACKPROTECTOR := $(call cc-option,-fno-stack-protector)
> +export DISABLE_STACKPROTECTOR
> +stackp-flags-y                                    := $(DISABLE_STACKPROTECTOR)
>  stackp-flags-$(CONFIG_STACKPROTECTOR)             := -fstack-protector
>  stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 8cc35dc556c7..1ea61290900a 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -478,9 +478,6 @@ config HAVE_STACKPROTECTOR
>           An arch should select this symbol if:
>           - it has implemented a stack canary (e.g. __stack_chk_guard)
>
> -config CC_HAS_STACKPROTECTOR_NONE
> -       def_bool $(cc-option,-fno-stack-protector)
> -
>  config STACKPROTECTOR
>         bool "Stack Protector buffer overflow detection"
>         depends on HAVE_STACKPROTECTOR
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index 00602a6fba04..3693bac525d2 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -84,9 +84,9 @@ endif
>
>  # -fstack-protector-strong triggers protection checks in this code,
>  # but it is being used too early to link to meaningful stack_chk logic.
> -nossp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
>  $(foreach o, $(libfdt_objs) atags_to_fdt.o, \
> -       $(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt $(nossp-flags-y)))
> +       $(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt \
> +                             $(DISABLE_STACKPROTECTOR)))
>
>  # These were previously generated C files. When you are building the kernel
>  # with O=, make sure to remove the stale files in the output tree. Otherwise,
> diff --git a/arch/x86/entry/Makefile b/arch/x86/entry/Makefile
> index b7a5790d8d63..79902decc3d1 100644
> --- a/arch/x86/entry/Makefile
> +++ b/arch/x86/entry/Makefile
> @@ -10,6 +10,9 @@ KCOV_INSTRUMENT := n
>  CFLAGS_REMOVE_common.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
>  CFLAGS_REMOVE_syscall_32.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
>  CFLAGS_REMOVE_syscall_64.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
> +CFLAGS_common.o += $(DISABLE_STACKPROTECTOR)
> +CFLAGS_syscall_32.o += $(DISABLE_STACKPROTECTOR)
> +CFLAGS_syscall_64.o += $(DISABLE_STACKPROTECTOR)

There is one more c file in this directory.

Is it OK to not patch syscall_x32.c ?


>
>  CFLAGS_syscall_64.o            += $(call cc-option,-Wno-override-init,)
>  CFLAGS_syscall_32.o            += $(call cc-option,-Wno-override-init,)




This patch is ugly.

I'd rather want to fix this by one-liner.




diff --git a/arch/x86/entry/Makefile b/arch/x86/entry/Makefile
index b7a5790d8d63..0d41eb91aaea 100644
--- a/arch/x86/entry/Makefile
+++ b/arch/x86/entry/Makefile
@@ -11,6 +11,8 @@ CFLAGS_REMOVE_common.o = $(CC_FLAGS_FTRACE)
-fstack-protector -fstack-protector-
 CFLAGS_REMOVE_syscall_32.o = $(CC_FLAGS_FTRACE) -fstack-protector
-fstack-protector-strong
 CFLAGS_REMOVE_syscall_64.o = $(CC_FLAGS_FTRACE) -fstack-protector
-fstack-protector-strong

+ccflags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) += -fno-stack-protector
+
 CFLAGS_syscall_64.o            += $(call cc-option,-Wno-override-init,)
 CFLAGS_syscall_32.o            += $(call cc-option,-Wno-override-init,)
 obj-y                          := entry_$(BITS).o thunk_$(BITS).o
syscall_$(BITS).o




-- 
Best Regards
Masahiro Yamada
