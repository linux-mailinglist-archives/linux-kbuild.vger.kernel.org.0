Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9662D3D98F0
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jul 2021 00:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhG1WcK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Jul 2021 18:32:10 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:34434 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbhG1WcJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Jul 2021 18:32:09 -0400
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 16SMVfq4017859;
        Thu, 29 Jul 2021 07:31:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 16SMVfq4017859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627511502;
        bh=wAswa070vEKRoyVc6FZv3d3dc7yd9+nXOyHmSmKAIkE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XxBChTB0xtEJ7/3xf1RI5d7M1NeQI9lFBgeuYDFObL3hvyJF6sd8it/t+tVZdkGze
         zFPvYsi5syFmTq6yzstxGkN0FwwqerLE55X3OtD2ORHGFMVHtSRM1KYkA2Op2N+Wxo
         8Uhqf2voVbE3pLGf8RksCXm/xCChXsiJfaRuidzHRanO3XqsWMoWfDiXE5entZE192
         IqfeLM2rgKoLw/gIdGpRwF8NbjuysqYviPTRos9wjf9C3DC1QV+AGn/2lKPi8D69c9
         LCnnH7jPvuPvZ0k3OBziPluDjUBb7PR2KtOiW/3flwOBlfc7f8tUECIPKo7HK33b88
         1ThLUkvX9wA7A==
X-Nifty-SrcIP: [209.85.216.49]
Received: by mail-pj1-f49.google.com with SMTP id mt6so7408224pjb.1;
        Wed, 28 Jul 2021 15:31:41 -0700 (PDT)
X-Gm-Message-State: AOAM5312psqpzOdoZXIZK420VtQNzZVrU7CgPK+1KaU82FIg1q9waW8D
        eszZzdYK9HcbVikivKltCrtc7BSWWUflQXFx3V8=
X-Google-Smtp-Source: ABdhPJw8ua+Q/dLtyBbcz85em397uyo6W9C7I+fwUpnfOqhZTwNAUaU/ICrzuQR5MToSmd0udC8x9nNClmsVRSOzGgo=
X-Received: by 2002:a17:902:e28a:b029:12c:13e9:1166 with SMTP id
 o10-20020a170902e28ab029012c13e91166mr1788249plc.47.1627511500998; Wed, 28
 Jul 2021 15:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
 <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
 <87r1fkizxl.fsf@disp2133> <CAK7LNAS8Fz_kcwqzJD834QrSuWkkorHm4OZoGUhYsbKvJV=fJQ@mail.gmail.com>
 <87v94vg7vi.fsf@disp2133> <CAK7LNASbegX=9yBDktuK5iXhhB=wNP_kbdh4dnJMXSmV=XwHOw@mail.gmail.com>
 <87lf5rfvdc.fsf@disp2133>
In-Reply-To: <87lf5rfvdc.fsf@disp2133>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 29 Jul 2021 07:31:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWxmzfbPiWp9YTy6eRK5ephDsP8OYCJwba4VXT9os2BA@mail.gmail.com>
Message-ID: <CAK7LNASWxmzfbPiWp9YTy6eRK5ephDsP8OYCJwba4VXT9os2BA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 28, 2021 at 3:46 AM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > On Tue, Jul 27, 2021 at 11:16 PM Eric W. Biederman
> > <ebiederm@xmission.com> wrote:
> >>
> >> Masahiro Yamada <masahiroy@kernel.org> writes:
> >>
> >> > On Tue, Jul 27, 2021 at 5:27 AM Eric W. Biederman <ebiederm@xmission.com> wrote:
> >> >>
> >> >> Masahiro Yamada <masahiroy@kernel.org> writes:
> >> >>
> >> >> > On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >> >> >>
> >> >> >> On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
> >> >> >> <torvalds@linux-foundation.org> wrote:
> >> >> >> > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> >> >> >
> >> >> >> > We do most of the other heavy lifting in this area in Kconfig anyway,
> >> >> >> > why not add that compiler choice?
> >> >> >> >
> >> >> >> > Obviously it would be gated by the tests to see which compilers are
> >> >> >> > _installed_ (and that they are valid versions), so that it doesn't ask
> >> >> >> > stupid things ("do you want gcc or clang" when only one of them is
> >> >> >> > installed and/or viable).
> >> >> >>
> >> >> >> I don't see a good way of making Kconfig options both select the
> >> >> >> compiler and defining variables based on the compiler, since that
> >> >> >> would mean teaching Kconfig about re-evaluating all compiler
> >> >> >> dependent settings whenever the first option changes.
> >> >> >>
> >> >> >> I do have another idea that I think would work though.
> >> >> >>
> >> >> >> > Hmm? So then any "LLVM=1" thing would be about the "make config"
> >> >> >> > stage, not the actual build stage.
> >> >> >> >
> >> >> >> > (It has annoyed me for years that if you want to cross-compile, you
> >> >> >> > first have to do "make ARCH=xyz config" and then remember to do "make
> >> >> >> > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> >> >> >> > never really cared).
> >> >> >>
> >> >> >> The best thing that I have come up with is a pre-configure step, where
> >> >> >> an object tree gets seeded with a makefile fragment that gets included
> >> >> >> for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
> >> >> >> 'CC=' and possibly any other option that gets passed to 'make' as
> >> >> >> a variable and has to exist before calling 'make *config'.
> >> >> >
> >> >> >
> >> >> > There is no need to add a hook to include such makefile fragment(s).
> >> >> >
> >> >> > Quite opposite, you can put your Makefile (in a different filename)
> >> >> > that includes the top Makefile.
> >> >> >
> >> >> >
> >> >> > I think this is what people are already doing:
> >> >> >
> >> >> >
> >> >> > GNU Make looks for 'GNUmakefile', 'makefile', and 'Makefile'
> >> >> > in this order.
> >> >> >
> >> >> >
> >> >> > So, you can put 'GNUmakefile' with your favorite setups.
> >> >> >
> >> >> >
> >> >> > $ cat GNUmakefile
> >> >> > ARCH=arm64
> >> >> > CROSS_COMPILE=aarch64-linux-gnu-
> >> >> > CC=clang
> >> >> > include Makefile
> >> >>
> >> >> Very weird.
> >> >>
> >> >> I just tested this and it does not work.
> >> >> I did this:
> >> >>
> >> >> $ cat GNUmakefile
> >> >> ARCH = alpha
> >> >> CROSS_COMPILE = $(arch-prefix alpha)
> >> >> include Makefile
> >> >>
> >> >> In one of my build directories and the main makefile simply does not see
> >> >> the value of ARCH or CROSS_COMPILE I set.  I have confirmed that my
> >> >> GNUmakefile is being read, because everything breaks if I remove the
> >> >> include line.
> >> >>
> >> >> Does anyone have any ideas?
> >> >>
> >> >> Something so we don't have to specify all of these variables on the make
> >> >> command line would be nice.
> >> >>
> >> >> Eric
> >> >
> >> >
> >> > Worked for me.
> >> >
> >> > Could you tell me the exact steps you did?
> >> >
> >> >
> >> > This is my case:
> >> >
> >> > My kernel source tree is located at $HOME/ref/linux
> >> > alpha tool chains are located at $HOME/tools/alpha-10.1.0/bin
> >> >
> >> >
> >> >
> >> > I tried a simple GNUmakefile with 3 lines.
> >> >
> >> > You can see 'make' is building the alpha kernel
> >> >
> >> >
> >> > Please see below:
> >>
> >> Interesting.  That appears to work if I don't specify a build directory.
> >> Once I specify a build directory with O= it does not work.
> >>
> >> When I am working on a change that affects multiple architectures
> >> I really want a build directory that is not my source tree so I can
> >> test small changes on multiple architectures without needing to rebuild
> >> everything.
> >>
> >> Eric
> >
> >
> > Ah, OK.
> > When you specify O= option, Kbuild will
> > invoke sub-make.
> > So you need to add 'export' to the
> > variables.
> >
> > Please see the following modified version.
>
> Yes. That does seem to work and be simpler.
>
> Is there any chance we can get the command that generates the Makefile
> in the build directory to include variables like ARCH and CROSS_COMPILE
> in the Makefile as well?  Just so they don't need to be set by hand to
> the same value every time?
>
> Eric


I am OK to document this small tip
in Documentation/kbuild/ if it is useful,
but am reluctant to add any code to
generate custom Makefile or GNUmakefile.

It is highly user-dependent after all.

If we merged the code to set up ARCH=...
and CROSS_COMPILE=...,
somebody would send a patch
"I need LLVM=1 in my GNUmakefile", then
another person, "I want CC=clang", and so on.

You can edit it by yourself.


-- 
Best Regards
Masahiro Yamada
