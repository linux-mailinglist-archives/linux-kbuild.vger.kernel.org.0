Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727403D412A
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jul 2021 21:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhGWTNu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Jul 2021 15:13:50 -0400
Received: from mail-vk1-f182.google.com ([209.85.221.182]:37458 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhGWTNu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jul 2021 15:13:50 -0400
Received: by mail-vk1-f182.google.com with SMTP id d16so632227vkp.4;
        Fri, 23 Jul 2021 12:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WCrKf5Iw2o5+shGh2ncn5iHfAc+hQCz5PyiUxBmUVl8=;
        b=pi3uGul0dxI0whGTeI91bwsidGjZmI3OrYj5YfPI0STB/b6LedxPA9rGnkJEdDtkIz
         CKW6j0mJpDa1o6FLpk68qqTh4Fy4UXSVZQovSQeYNvCUWGfxujjLrIpdDAHn9DJi7Dbf
         GrIhPk52MNTFF4Ki/14FT4Od3yeDgU2G/IgkI3MPP7byJpa/otMufbibrFdhaLgyRbdb
         /2dLfP/L23Rw1MeVX9yNX1p8OhqSeuTk4pyb3/BMR+vGlsF+TZ40i45LAQNuGFx6xnro
         MPMIcMXMrj6V4RHxno5RHUy8vBRacfSirK9C2oZd9Mq6Sv+fB574kTrldPEsjJXf6OVv
         Aelg==
X-Gm-Message-State: AOAM530MtPOLAsDEDO9sZdYj2KInS/IaIbD3c010+NPEkwjOJ9N2d8HF
        lGxkOsn1CHx6CjGy2sp+i7xxilbmMZV5ht8/h4E=
X-Google-Smtp-Source: ABdhPJy7yL/c/PrB/qgOazP2a0kVPM0D75VBNd4uc3fh/YhPMfft5NwOTFf/CwNczJQK8qIofi9Vcu4MS/fwvRdW1Ho=
X-Received: by 2002:a05:6122:a12:: with SMTP id 18mr5316680vkn.1.1627070062009;
 Fri, 23 Jul 2021 12:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com> <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
In-Reply-To: <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Jul 2021 21:54:10 +0200
Message-ID: <CAMuHMdXJBqrpzaSNDJgic14ESiHV6cCcb_5E-st6iniXdmm9_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Wed, Jul 21, 2021 at 6:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > We do most of the other heavy lifting in this area in Kconfig anyway,
> > > why not add that compiler choice?
> > >
> > > Obviously it would be gated by the tests to see which compilers are
> > > _installed_ (and that they are valid versions), so that it doesn't ask
> > > stupid things ("do you want gcc or clang" when only one of them is
> > > installed and/or viable).
> >
> > I don't see a good way of making Kconfig options both select the
> > compiler and defining variables based on the compiler, since that
> > would mean teaching Kconfig about re-evaluating all compiler
> > dependent settings whenever the first option changes.
> >
> > I do have another idea that I think would work though.
> >
> > > Hmm? So then any "LLVM=1" thing would be about the "make config"
> > > stage, not the actual build stage.
> > >
> > > (It has annoyed me for years that if you want to cross-compile, you
> > > first have to do "make ARCH=xyz config" and then remember to do "make
> > > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> > > never really cared).
> >
> > The best thing that I have come up with is a pre-configure step, where
> > an object tree gets seeded with a makefile fragment that gets included
> > for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
> > 'CC=' and possibly any other option that gets passed to 'make' as
> > a variable and has to exist before calling 'make *config'.
>
>
> There is no need to add a hook to include such makefile fragment(s).
>
> Quite opposite, you can put your Makefile (in a different filename)
> that includes the top Makefile.
>
>
> I think this is what people are already doing:
>
>
> GNU Make looks for 'GNUmakefile', 'makefile', and 'Makefile'
> in this order.

Exactly. I only have a few source repositories, but lots of build directories
(I never build in a repo directory). Each build directory has a GNUmakefile:

    build/linux-riscv-starlight$ cat GNUmakefile
    MAKEARGS = ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-

    include ~/linux/default.mk
    build/linux-riscv-starlight$ cat ~/linux/default.mk
    MAKEFLAGS += --no-print-directory

    .PHONY: all $(MAKECMDGOALS)

    all := $(filter-out all Makefile,$(MAKECMDGOALS))

    all:
            @$(MAKE) $(MAKEARGS) $(all) -f Makefile

    Makefile:;

    $(all): all
            @:

    %/: all
            @:
    build/linux-riscv-starlight$

Perhaps we could have a "make setup ARCH=foo CROSS_COMPILE=bar" target,
which creates such a GNUmakefile?

P.S. I put the extra logic in ~/linux/default.mk, so I don't have to update all
     GNUmakefiles when I want to make a change to the main logic.

     For build dirs where I want to track a specific config, I have a slightly
     different version:

         build/linux-m68k-allmodconfig-sun3$ cat GNUmakefile
         MAKEARGS = ARCH=m68k KCONFIG_ALLCONFIG=1
         DEFCONFIG = allmodconfig

         include ~/linux/override-oldconfig.mk
         build/linux-m68k-allmodconfig-sun3$ cat ~/linux/override-oldconfig.mk
         MAKEFLAGS += --no-print-directory

         .PHONY: all oldconfig realoldconfig $(MAKECMDGOALS)

         all := $(filter-out all oldconfig realoldconfig
Makefile,$(MAKECMDGOALS))

         all:
                 @$(MAKE) $(MAKEARGS) $(all) -f Makefile

         # Replace oldconfig by $(DEFCONFIG)
         oldconfig:
                 @$(MAKE) $(MAKEARGS) $(DEFCONFIG) -f Makefile

         realoldconfig:
                 @$(MAKE) $(MAKEARGS) oldconfig -f Makefile

         Makefile:;

         $(all): all
                 @:

         %/: all
                 @:
         build/linux-m68k-allmodconfig-sun3$

     That way I can always just type "make oldconfig", and it will do what
     I want.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
