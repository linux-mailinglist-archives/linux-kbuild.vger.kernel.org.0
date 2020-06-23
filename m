Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0236B204947
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2020 07:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730238AbgFWFhg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Jun 2020 01:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728729AbgFWFhe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jun 2020 01:37:34 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEE9C061573
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2020 22:37:33 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r18so9329301pgk.11
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jun 2020 22:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=idedKaXt1EJFqWab4yasy7BPJ92ugrTuHXvdVtqL0wg=;
        b=fqnGnbPb9SPh8EMXOIobo9sfxLPtDxuZFEq2L6MiBDgwhqpQTkM3AJR/USACgKv0NX
         Gl19Qe0JAX7KBeJ9krymloYkeQwJvEOMBmtuEvbnkL4IXo1dcr3TPfO4/S6MMoQ/bTUo
         OOIzHHltloaWwiEvC1WdaHifhluYV9TlguO7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=idedKaXt1EJFqWab4yasy7BPJ92ugrTuHXvdVtqL0wg=;
        b=ms6fv4YON8gAeezZkuvVVeiRjeoGcLAGEWBBlksE6eymTD8Ap18sKOZfwbbulbGm2v
         vNSxPVjiiNqKftRwklQRATA7cjWOmkl+KZkex1TUC3V0HC2ylLPKGv28wm0vmnIJuYhc
         CmILzcAIrmDIJ95dqNXM4zeX2XFefn54Td5U5jen7gciLn5rqJnIDTsmXxF8q5S39yub
         dHkHsODU4Nd8WqZ3y35EWm7QAaJRgPJJxvYNxndb+OD47BjoNVjgY0K8GNcA4ikqZIEp
         4qV0U6szN3CquDGJiR4g8DETNauRYz8sCvvO4mMhVctjp/RdFOz3L7QdNudOZ9MNVUHy
         WFpA==
X-Gm-Message-State: AOAM533WbVw0baMF53VtMkzGedqirNdTVO3HA6/EcanlCAFVd4QQg9ul
        yRueguhBr1zVmnaXxjL8Tp8+fA==
X-Google-Smtp-Source: ABdhPJzx51qqbC2f/8K0gqCqsK4+Jp2SnJmJqntXZ7xT8RoOfJ4QNbG0GcPKmh9VLmdp02IWXvYZsQ==
X-Received: by 2002:a63:fc09:: with SMTP id j9mr14328858pgi.308.1592890651969;
        Mon, 22 Jun 2020 22:37:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r7sm10730405pfc.183.2020.06.22.22.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 22:37:30 -0700 (PDT)
Date:   Mon, 22 Jun 2020 22:37:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, X86 ML <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: Provide way to actually disable stack protector
Message-ID: <202006222234.FBCEAD7F@keescook>
References: <202006221201.3641ED037E@keescook>
 <CAK7LNAQL=XF+xvsRNTEGXtY7J-fx5FJKpMuScoxLt8SDKGB3_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQL=XF+xvsRNTEGXtY7J-fx5FJKpMuScoxLt8SDKGB3_Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 23, 2020 at 11:33:53AM +0900, Masahiro Yamada wrote:
> On Tue, Jun 23, 2020 at 4:02 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Some builds of GCC enable stack protector by default. Simply removing
> > the arguments is not sufficient to disable stack protector, as the stack
> > protector for those GCC builds must be explicitly disabled. (Removing the
> > arguments is left as-is just to be sure there are no ordering problems. If
> > -fno-stack-protector ended up _before_ -fstack-protector, it would not
> > disable it: GCC uses whichever -f... comes last on the command line.)
> >
> > Fixes: 20355e5f73a7 ("x86/entry: Exclude low level entry code from sanitizing")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  Makefile                          | 4 +++-
> >  arch/Kconfig                      | 3 ---
> >  arch/arm/boot/compressed/Makefile | 4 ++--
> >  arch/x86/entry/Makefile           | 3 +++
> >  4 files changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index ac2c61c37a73..b46e91bf0b0e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -762,7 +762,9 @@ ifneq ($(CONFIG_FRAME_WARN),0)
> >  KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
> >  endif
> >
> > -stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> > +DISABLE_STACKPROTECTOR := $(call cc-option,-fno-stack-protector)
> > +export DISABLE_STACKPROTECTOR
> > +stackp-flags-y                                    := $(DISABLE_STACKPROTECTOR)
> >  stackp-flags-$(CONFIG_STACKPROTECTOR)             := -fstack-protector
> >  stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
> >
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 8cc35dc556c7..1ea61290900a 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -478,9 +478,6 @@ config HAVE_STACKPROTECTOR
> >           An arch should select this symbol if:
> >           - it has implemented a stack canary (e.g. __stack_chk_guard)
> >
> > -config CC_HAS_STACKPROTECTOR_NONE
> > -       def_bool $(cc-option,-fno-stack-protector)
> > -
> >  config STACKPROTECTOR
> >         bool "Stack Protector buffer overflow detection"
> >         depends on HAVE_STACKPROTECTOR
> > diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> > index 00602a6fba04..3693bac525d2 100644
> > --- a/arch/arm/boot/compressed/Makefile
> > +++ b/arch/arm/boot/compressed/Makefile
> > @@ -84,9 +84,9 @@ endif
> >
> >  # -fstack-protector-strong triggers protection checks in this code,
> >  # but it is being used too early to link to meaningful stack_chk logic.
> > -nossp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> >  $(foreach o, $(libfdt_objs) atags_to_fdt.o, \
> > -       $(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt $(nossp-flags-y)))
> > +       $(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt \
> > +                             $(DISABLE_STACKPROTECTOR)))
> >
> >  # These were previously generated C files. When you are building the kernel
> >  # with O=, make sure to remove the stale files in the output tree. Otherwise,
> > diff --git a/arch/x86/entry/Makefile b/arch/x86/entry/Makefile
> > index b7a5790d8d63..79902decc3d1 100644
> > --- a/arch/x86/entry/Makefile
> > +++ b/arch/x86/entry/Makefile
> > @@ -10,6 +10,9 @@ KCOV_INSTRUMENT := n
> >  CFLAGS_REMOVE_common.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
> >  CFLAGS_REMOVE_syscall_32.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
> >  CFLAGS_REMOVE_syscall_64.o = $(CC_FLAGS_FTRACE) -fstack-protector -fstack-protector-strong
> > +CFLAGS_common.o += $(DISABLE_STACKPROTECTOR)
> > +CFLAGS_syscall_32.o += $(DISABLE_STACKPROTECTOR)
> > +CFLAGS_syscall_64.o += $(DISABLE_STACKPROTECTOR)
> 
> There is one more c file in this directory.
> 
> Is it OK to not patch syscall_x32.c ?

Good question. Peter? (It seems all the syscall_*.c files are just a
table, not code -- why do they need any instrumentation changes?)

> 
> 
> >
> >  CFLAGS_syscall_64.o            += $(call cc-option,-Wno-override-init,)
> >  CFLAGS_syscall_32.o            += $(call cc-option,-Wno-override-init,)
> 
> 
> 
> 
> This patch is ugly.
> 
> I'd rather want to fix this by one-liner.

Why not a global export to assist? This isn't the only place it's needed
(see the arm64 chunk...)

> 
> 
> 
> 
> diff --git a/arch/x86/entry/Makefile b/arch/x86/entry/Makefile
> index b7a5790d8d63..0d41eb91aaea 100644
> --- a/arch/x86/entry/Makefile
> +++ b/arch/x86/entry/Makefile
> @@ -11,6 +11,8 @@ CFLAGS_REMOVE_common.o = $(CC_FLAGS_FTRACE)
> -fstack-protector -fstack-protector-
>  CFLAGS_REMOVE_syscall_32.o = $(CC_FLAGS_FTRACE) -fstack-protector
> -fstack-protector-strong
>  CFLAGS_REMOVE_syscall_64.o = $(CC_FLAGS_FTRACE) -fstack-protector
> -fstack-protector-strong
> 
> +ccflags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) += -fno-stack-protector
> +

Order matters here -- when is ccflags-y applied?

>  CFLAGS_syscall_64.o            += $(call cc-option,-Wno-override-init,)
>  CFLAGS_syscall_32.o            += $(call cc-option,-Wno-override-init,)
>  obj-y                          := entry_$(BITS).o thunk_$(BITS).o
> syscall_$(BITS).o
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Kees Cook
