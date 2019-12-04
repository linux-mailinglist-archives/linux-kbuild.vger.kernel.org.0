Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B887B113807
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2019 00:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbfLDXST (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Dec 2019 18:18:19 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35160 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbfLDXSS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 18:18:18 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so385525plp.2
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Dec 2019 15:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bMFgfwVDLyNfP+n9tPTAj8QY4bC2HsMSOAGKRA9gakw=;
        b=MtSlA/OgS15E0uba3TIek4yo6Dv72Ih5Vz8TtayNLcYj9ko9Y5pcJja4pXlDi+U5B2
         OzrIhaayNaSUVeiGvMc3+qo1sSa3EgJ+AupbHkkOI9WA9YMvGRb8L6EbA1y0nROXEUzq
         DLekXMbit5LGIAikGGF/a6V21GXdqB1vVViqVj9DWbn3bDTmE1RQTdmSpi3ceBVwG8X4
         +RdlDSRJZH67fNHiUDPIpFR2b9qTJvdcCugWSM4lang0P7FFhrNPfmnNSsvwOGYMAa/t
         Da8KmVghIDsNP9WG/dmjuj/U+HPlXUbXm2G7PwKgGY8EAOc1R7+MLdFwE4WaevwUll23
         YYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMFgfwVDLyNfP+n9tPTAj8QY4bC2HsMSOAGKRA9gakw=;
        b=sfAQ/lVBadI6N5UhHhTQSwVJ4EVV6vPuygnRHdVpQj4GQafckTzZVFwoyHxaUcDAdq
         Fi4aXhYpzEIQk8WVI5Tkv+KDeWJmdIq4RbWk6L2Moz+dhT7CiRNInoJe9E885zFKh/Pz
         +v4q14NWn4wnZbOiCTEawq2Mn6IVuVhseHYlqWJNU5e6nDqbAOkbgPu0H0c+UGBw/qVm
         0HV9umcUtvRvjQVhCee+qCC7bl3Xj3HbV8ZWDGcWv9fiSkE5zyHrQLlPTKQmgqVkPhPg
         lJddzKgZOGsJ0LonHRqpsy19BnofDYbFtf8m5mBtPwafp5fFsCv32Nlv8KhiArNC6KY3
         rgpQ==
X-Gm-Message-State: APjAAAW9H9CO8BbaWL9EEsbnfMj8vEmOoLNemQfF0pTRfd9iP7+ivFh8
        fvu8AdZxMGv5/TZJxTY2H67EwJ6i/Bw7r5GyfcYbDw==
X-Google-Smtp-Source: APXvYqxyypwjL3djnDA4vB8jmSAsCckKucoAckitJOpn/REINR7zthvw1tWILnDJLcTdY3b7XdQhBRvlBPMCVLzrJ40=
X-Received: by 2002:a17:902:8216:: with SMTP id x22mr5812405pln.179.1575501497559;
 Wed, 04 Dec 2019 15:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20191204225446.202981-1-dima@golovin.in>
In-Reply-To: <20191204225446.202981-1-dima@golovin.in>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 4 Dec 2019 15:18:05 -0800
Message-ID: <CAKwvOdm-bhuJMRRN3tyNdb88+_TFd4m3b-7gX0-91VG4djzp+Q@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: kbuild: allow readelf executable to be specified
To:     Dmitry Golovin <dima@golovin.in>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Ross Philipson <ross.philipson@oracle.com>,
        Ross Burton <ross.burton@intel.com>,
        Chao Fan <fanc.fnst@cn.fujitsu.com>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        tony.luck@intel.com, fenghua.yu@intel.com,
        linux-ia64@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 4, 2019 at 2:55 PM Dmitry Golovin <dima@golovin.in> wrote:
>
> Introduce a new READELF variable to top-level Makefile, so the name of
> readelf binary can be specified.

Thanks for the patch!

This is a general cleanup that should improve cross compilation
(readelf should be treated as ever binary in the list like
objcopy/objdump/etc), and allow us to use binutils substitutes for
readelf that aren't called `readelf` (ie. `llvm-readelf`).

>
> Before this change the name of the binary was hardcoded to
> "$(CROSS_COMPILE)readelf" which might not be present for every
> toolchain.
>
> This allows to build with LLVM Object Reader by using make parameter
> READELF=llvm-readelf.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/771
> Signed-off-by: Dmitry Golovin <dima@golovin.in>
> Cc: Nick Desaulniers <ndesaulniers@google.com>

No need to explicitly CC me; I monitor our list like a hawk.

> ---
>  Makefile                          | 3 ++-
>  arch/x86/boot/compressed/Makefile | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 999a197d67d2..612a55d25442 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -414,6 +414,7 @@ STRIP               = $(CROSS_COMPILE)strip
>  OBJCOPY                = $(CROSS_COMPILE)objcopy
>  OBJDUMP                = $(CROSS_COMPILE)objdump
>  OBJSIZE                = $(CROSS_COMPILE)size
> +READELF                = $(CROSS_COMPILE)readelf
>  PAHOLE         = pahole
>  LEX            = flex
>  YACC           = bison
> @@ -472,7 +473,7 @@ GCC_PLUGINS_CFLAGS :=
>  CLANG_FLAGS :=
>
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
> -export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE PAHOLE LEX YACC AWK INSTALLKERNEL
> +export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index aa976adb7094..1dac210f7d44 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -103,7 +103,7 @@ vmlinux-objs-$(CONFIG_EFI_MIXED) += $(obj)/efi_thunk_$(BITS).o
>  quiet_cmd_check_data_rel = DATAREL $@
>  define cmd_check_data_rel
>         for obj in $(filter %.o,$^); do \
> -               ${CROSS_COMPILE}readelf -S $$obj | grep -qF .rel.local && { \
> +               $(READELF) -S $$obj | grep -qF .rel.local && { \

Grepping the kernel sources for `READELF`, it looks like
arch/ia64/Makefile makes the same mistake. Would you mind fixing both
cases in the same patch (v2)?  I'm also curious about it's use in
arch/ia64/scripts/unwcheck.py, and scripts/faddr2line. +ia64
maintainers and list.

I think if you simply remove the assignment on line 17 of
arch/ia64/Makefile you should be fine.

>                         echo "error: $$obj has data relocations!" >&2; \
>                         exit 1; \
>                 } || true; \
> --
> 2.23.0
>


-- 
Thanks,
~Nick Desaulniers
