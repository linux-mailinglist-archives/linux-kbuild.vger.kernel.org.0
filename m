Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0DB341120
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Mar 2021 00:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhCRXhl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Mar 2021 19:37:41 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:31198 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbhCRXhb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Mar 2021 19:37:31 -0400
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 12INbEOw032265;
        Fri, 19 Mar 2021 08:37:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 12INbEOw032265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616110635;
        bh=BorSmzfSs4sk7r1fb9KF3rTwV8KPs5mBIwG9r5NUREA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=v9gZpgpbfrBgA61EfXVBbMGeWdVbgz+I03U4NBLwMkPah56NgR2Hs1Zv96zRfD6/R
         MAGzB4sX0HaFhIukPoxIO+2eGln1REr6Mcme2+zivHAJPnnoDl9otle7xsz9SKQlNB
         Z2eHFOrgr9WvAdTEkrL6dgNyc5tP2aq02dK+H8060OXFn6cDu4vaVKzBLdAFXTQoAc
         yLhPvMeCcy74JXIr6CrLHnDksE1fB7GrwF0f77l9obClYfUfv8Dby1yYqEGc0rrFsH
         y9P1O7QMzDm2vKAQyuHRNbOQUhSzuctIV/U05sXH96ECbwfRvHI0gSyZ7XjMVDO+ly
         ITOlw6qUgHRcQ==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id c204so4580801pfc.4;
        Thu, 18 Mar 2021 16:37:14 -0700 (PDT)
X-Gm-Message-State: AOAM530pU5eh/pxtolJqo6P1b3m5XRlzfmJXhg0XiRiH3RR/R3ouY6Gf
        qOPhLLZ4rFxSMK9DNUt5REua0M5/ijX/QFsq7PE=
X-Google-Smtp-Source: ABdhPJzqBAc/3jnDYfrVF4MlvtNVGoSEnMlF1RCVXd83TcSfhCHlCK98PyErViR7nNIr+t1Gkzyoqk5Vq5VhizQE5m4=
X-Received: by 2002:a65:41c6:: with SMTP id b6mr8817344pgq.7.1616110633882;
 Thu, 18 Mar 2021 16:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210228061028.239459-1-masahiroy@kernel.org> <20210228061028.239459-4-masahiroy@kernel.org>
 <20210318211356.nxr4wx24srjtjdqm@archlinux-ax161>
In-Reply-To: <20210318211356.nxr4wx24srjtjdqm@archlinux-ax161>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 19 Mar 2021 08:36:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATsoT0u2u90o8a_o6nOiUtnWzgJdwbam6vW9FMbifdJ4w@mail.gmail.com>
Message-ID: <CAK7LNATsoT0u2u90o8a_o6nOiUtnWzgJdwbam6vW9FMbifdJ4w@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: include Makefile.compiler only when compiler
 is required
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(CC: Will and ARM ML)


On Fri, Mar 19, 2021 at 6:14 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Sun, Feb 28, 2021 at 03:10:28PM +0900, Masahiro Yamada wrote:
> > Since commit f2f02ebd8f38 ("kbuild: improve cc-option to clean up all
> > temporary files"), running 'make kernelversion' in a read-only source
> > tree emits a bunch of warnings:
> >
> >   mkdir: cannot create directory '.tmp_12345': Permission denied
> >
> > Non-build targets such as kernelversion, clean, help, etc. do not
> > need to evaluate $(call cc-option,) and friends. Do not include
> > Makefile.compiler so $(call cc-option,) becomes no-op.
> >
> > This not only fix the warnings, but also runs non-build targets much
> > faster.
> >
> > Basically, all installation targets should also be non-build targets.
> > Unfortunately, vdso_install requires the compiler because it builds
> > vdso before installtion. This is a problem that must be fixed by a
> > separate patch.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > I am not adding Reported-by for now because a reporter sent me
> > an email privately.
> >
> > If he allows me to add Reported-by, I will add it to record
> > the credit.
> >
> > (Perhaps, another person might have reported a similar issue
> > somewhere, but my memory is obsure. I cannot recall it.)
> >
> >
> >  Makefile | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index eec7a94f5c33..20724711dc71 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -263,6 +263,10 @@ no-dot-config-targets := $(clean-targets) \
> >                        $(version_h) headers headers_% archheaders archscripts \
> >                        %asm-generic kernelversion %src-pkg dt_binding_check \
> >                        outputmakefile
> > +# Installation targets should not require compiler. Unfortunately, vdso_install
> > +# is an exception where build artifacts may be updated. This must be fixed.
> > +no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
> > +                     headers_install modules_install kernelrelease image_name
> >  no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease \
> >                         image_name
> >  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> > @@ -270,6 +274,7 @@ single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> >  config-build :=
> >  mixed-build  :=
> >  need-config  := 1
> > +need-compiler        := 1
> >  may-sync-config      := 1
> >  single-build :=
> >
> > @@ -279,6 +284,12 @@ ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
> >       endif
> >  endif
> >
> > +ifneq ($(filter $(no-compiler-targets), $(MAKECMDGOALS)),)
> > +     ifeq ($(filter-out $(no-compiler-targets), $(MAKECMDGOALS)),)
> > +             need-compiler :=
> > +     endif
> > +endif
> > +
> >  ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
> >       ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
> >               may-sync-config :=
> > @@ -584,7 +595,9 @@ endif
> >
> >  # Include this also for config targets because some architectures need
> >  # cc-cross-prefix to determine CROSS_COMPILE.
> > +ifdef need-compiler
> >  include $(srctree)/scripts/Makefile.compiler
> > +endif
> >
> >  ifdef config-build
> >  # ===========================================================================
> > --
> > 2.27.0
> >
>
> Hi Masahiro,
>
> I see a new warning in my builds on arm64 now when running
> 'modules_install' or 'dtbs_install' because ld-option evaluates to
> nothing, which triggers the warning in arch/arm64/Makefile:
>
> $ make -skj"$(nproc)" \
> ARCH=arm64 \
> CROSS_COMPILE=aarch64-linux- \
> INSTALL_DTBS_PATH=rootfs \
> INSTALL_MOD_PATH=rootfs \
> O=build/arm64 \
> distclean defconfig all modules_install dtbs_install
> ...
> /home/nathan/cbl/src/linux-next/arch/arm64/Makefile:25: ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum
> /home/nathan/cbl/src/linux-next/arch/arm64/Makefile:25: ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum
>
> $ sed -n '23,29p' arch/arm64/Makefile
> ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
>   ifeq ($(call ld-option, --fix-cortex-a53-843419),)
> $(warning ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum)
>   else
> LDFLAGS_vmlinux += --fix-cortex-a53-843419
>   endif
> endif
>
> I am not sure how this should be resolved, hence just the report.
>
> Cheers,
> Nathan


I see this a few lines below:

ifeq ($(CONFIG_ARM64_USE_LSE_ATOMICS), y)
  ifneq ($(CONFIG_ARM64_LSE_ATOMICS), y)
$(warning LSE atomics not supported by binutils)
  endif
endif


We can move ld-option evaluation to Kconfig.

ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
  ifneq ($(CONFIG_ARM64_LD_HAS_FIX_ERRATUM_843419,y))
$(warning ld does not support --fix-cortex-a53-843419; kernel may be
susceptible to erratum)
  else
LDFLAGS_vmlinux += --fix-cortex-a53-843419
  endif
endif


I do not know what CONFIG name is preferred.



-- 
Best Regards
Masahiro Yamada
