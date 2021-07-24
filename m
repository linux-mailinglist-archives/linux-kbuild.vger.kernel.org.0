Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7CE3D47F3
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jul 2021 15:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhGXNGl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Jul 2021 09:06:41 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36023 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhGXNGh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jul 2021 09:06:37 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 16ODkfnA024963;
        Sat, 24 Jul 2021 22:46:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 16ODkfnA024963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627134402;
        bh=xIH/ltmFtWJmcRQmRg8PWr+q47o4O2EpTM1yT4rZrmI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EbqaBoyOEep+aRck6WDXQ8xcyqFY0pHcZo9qObQiyzIvekMZ6Erf+fKq8BxQSIFi9
         kbRlgmAphBoSWRVbkmhnKFAyNn5wBoRN8fWf3/NZJXE/HbEtFz4MZE0yDRLKTNKmUZ
         ZXujegaMA2NLj4g6rvQVgoV3imYjCvqv1tv67H9ivUS0rF6+CNKAhCflm+xyFmns4B
         cmzV6LCIB3oq4MI2nY0OeHf+7BWS18ZTHjI3QWbt8mVaPyIKjai9YbZjLdXQNdK72t
         cIOVhoQzbWU2mceldKJFi+7+FcJjQivauis6o8PHy6h8OrAJIDuCztUBYZApt9oEJj
         meYD7a5ZDwASA==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id i1so6367784plr.9;
        Sat, 24 Jul 2021 06:46:41 -0700 (PDT)
X-Gm-Message-State: AOAM530ZZS9pg3sXnUWmBvlmqmUloaGcVaPczTMeBmnfQCJ0YAy6Aqw7
        mpzptlQIivOSUc7Xk/UvSolPKoSI2tE4mx8Aok4=
X-Google-Smtp-Source: ABdhPJwzBx6PuThiVpsvzU+dyvbWRChWN9xv7GsNFlcN5NVApjydszOkLt/Jzms/Uaj3pa+GqUfGGFzJkPrzWii75VM=
X-Received: by 2002:a65:609a:: with SMTP id t26mr9654545pgu.175.1627134400955;
 Sat, 24 Jul 2021 06:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
 <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com> <CAMuHMdXJBqrpzaSNDJgic14ESiHV6cCcb_5E-st6iniXdmm9_g@mail.gmail.com>
In-Reply-To: <CAMuHMdXJBqrpzaSNDJgic14ESiHV6cCcb_5E-st6iniXdmm9_g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 24 Jul 2021 22:46:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrP3jAbRxOr1F+k=Ho__s1+iqCtvrn4hH7uJ_sRvkO3A@mail.gmail.com>
Message-ID: <CAK7LNARrP3jAbRxOr1F+k=Ho__s1+iqCtvrn4hH7uJ_sRvkO3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Sat, Jul 24, 2021 at 4:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yamada-san,
>
> On Wed, Jul 21, 2021 at 6:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > We do most of the other heavy lifting in this area in Kconfig anyway,
> > > > why not add that compiler choice?
> > > >
> > > > Obviously it would be gated by the tests to see which compilers are
> > > > _installed_ (and that they are valid versions), so that it doesn't ask
> > > > stupid things ("do you want gcc or clang" when only one of them is
> > > > installed and/or viable).
> > >
> > > I don't see a good way of making Kconfig options both select the
> > > compiler and defining variables based on the compiler, since that
> > > would mean teaching Kconfig about re-evaluating all compiler
> > > dependent settings whenever the first option changes.
> > >
> > > I do have another idea that I think would work though.
> > >
> > > > Hmm? So then any "LLVM=1" thing would be about the "make config"
> > > > stage, not the actual build stage.
> > > >
> > > > (It has annoyed me for years that if you want to cross-compile, you
> > > > first have to do "make ARCH=xyz config" and then remember to do "make
> > > > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> > > > never really cared).
> > >
> > > The best thing that I have come up with is a pre-configure step, where
> > > an object tree gets seeded with a makefile fragment that gets included
> > > for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
> > > 'CC=' and possibly any other option that gets passed to 'make' as
> > > a variable and has to exist before calling 'make *config'.
> >
> >
> > There is no need to add a hook to include such makefile fragment(s).
> >
> > Quite opposite, you can put your Makefile (in a different filename)
> > that includes the top Makefile.
> >
> >
> > I think this is what people are already doing:
> >
> >
> > GNU Make looks for 'GNUmakefile', 'makefile', and 'Makefile'
> > in this order.
>
> Exactly. I only have a few source repositories, but lots of build directories
> (I never build in a repo directory). Each build directory has a GNUmakefile:
>
>     build/linux-riscv-starlight$ cat GNUmakefile
>     MAKEARGS = ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
>
>     include ~/linux/default.mk
>     build/linux-riscv-starlight$ cat ~/linux/default.mk
>     MAKEFLAGS += --no-print-directory
>
>     .PHONY: all $(MAKECMDGOALS)
>
>     all := $(filter-out all Makefile,$(MAKECMDGOALS))
>
>     all:
>             @$(MAKE) $(MAKEARGS) $(all) -f Makefile
>
>     Makefile:;
>
>     $(all): all
>             @:
>
>     %/: all
>             @:
>     build/linux-riscv-starlight$
>
> Perhaps we could have a "make setup ARCH=foo CROSS_COMPILE=bar" target,
> which creates such a GNUmakefile?

No, I do not think so.

Your GNUmakefile is customized in your way.
Other people implement GNUmakefile in their own way.

Upstream is not a place to merge everybody's local tools.








> P.S. I put the extra logic in ~/linux/default.mk, so I don't have to update all
>      GNUmakefiles when I want to make a change to the main logic.
>
>      For build dirs where I want to track a specific config, I have a slightly
>      different version:
>
>          build/linux-m68k-allmodconfig-sun3$ cat GNUmakefile
>          MAKEARGS = ARCH=m68k KCONFIG_ALLCONFIG=1
>          DEFCONFIG = allmodconfig
>
>          include ~/linux/override-oldconfig.mk
>          build/linux-m68k-allmodconfig-sun3$ cat ~/linux/override-oldconfig.mk
>          MAKEFLAGS += --no-print-directory
>
>          .PHONY: all oldconfig realoldconfig $(MAKECMDGOALS)
>
>          all := $(filter-out all oldconfig realoldconfig
> Makefile,$(MAKECMDGOALS))
>
>          all:
>                  @$(MAKE) $(MAKEARGS) $(all) -f Makefile
>
>          # Replace oldconfig by $(DEFCONFIG)
>          oldconfig:
>                  @$(MAKE) $(MAKEARGS) $(DEFCONFIG) -f Makefile
>
>          realoldconfig:
>                  @$(MAKE) $(MAKEARGS) oldconfig -f Makefile
>
>          Makefile:;
>
>          $(all): all
>                  @:
>
>          %/: all
>                  @:
>          build/linux-m68k-allmodconfig-sun3$
>
>      That way I can always just type "make oldconfig", and it will do what
>      I want.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAMuHMdXJBqrpzaSNDJgic14ESiHV6cCcb_5E-st6iniXdmm9_g%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
