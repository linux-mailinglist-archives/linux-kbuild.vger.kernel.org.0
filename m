Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767743D0774
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jul 2021 06:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhGUDYb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 23:24:31 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53929 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbhGUDYa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 23:24:30 -0400
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 16L44svr031715;
        Wed, 21 Jul 2021 13:04:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 16L44svr031715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626840294;
        bh=AfCQ8zWwU2kVtZFAJkMMPrdLTVubh6u8+7aVLlmJQ1M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UoGntPjrewv3EMKohf1coQEvbJTLFA38pl0GOwdCgdDKGHAAgiboqJ0RLT8t0wVLM
         jrflQ97dTN2xZrG6qmINNgUr9zk3POEu7QOcGyP4OX7wZLRNBmbh8LUxreR42N+fX8
         T2qISlYG6kcBiWDWdENrYCN7CiNonb6Kcji7pFyMZBbLshisHaCw5vVtILHI4IPQCs
         J4ONOmQuyKfTJpvKE08a8ktY9kJds/8El8O61DLYR5norpPVf7HbCAkAg4Ul0ZD/aa
         tQRusa9GhJOAAX7JtIixydi7haasayZaj2cP3yFLdP+has49D80UKCu4rNe35hC/pC
         4GnMpPKNctzSw==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id gp5-20020a17090adf05b0290175c085e7a5so3265883pjb.0;
        Tue, 20 Jul 2021 21:04:54 -0700 (PDT)
X-Gm-Message-State: AOAM532qVGtATBSkG7RtGEkN5++owlir4AqaDNEmeBA/Cc9dqlOZtp98
        69B12DYelZUcd2nQ2IwCwftqy1r9eJKrvdxi5Fg=
X-Google-Smtp-Source: ABdhPJyPlpII+Djv0wcPYTar2Xkjs3VuD+kka5J2NZe9ZbrC1Qotac3sCGY0EdklzreS8q4oum9vLrgfpm1+1B3quco=
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr1773256pjt.198.1626840293821;
 Tue, 20 Jul 2021 21:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com> <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
In-Reply-To: <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 21 Jul 2021 13:04:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
Message-ID: <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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

On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > We do most of the other heavy lifting in this area in Kconfig anyway,
> > why not add that compiler choice?
> >
> > Obviously it would be gated by the tests to see which compilers are
> > _installed_ (and that they are valid versions), so that it doesn't ask
> > stupid things ("do you want gcc or clang" when only one of them is
> > installed and/or viable).
>
> I don't see a good way of making Kconfig options both select the
> compiler and defining variables based on the compiler, since that
> would mean teaching Kconfig about re-evaluating all compiler
> dependent settings whenever the first option changes.
>
> I do have another idea that I think would work though.
>
> > Hmm? So then any "LLVM=1" thing would be about the "make config"
> > stage, not the actual build stage.
> >
> > (It has annoyed me for years that if you want to cross-compile, you
> > first have to do "make ARCH=xyz config" and then remember to do "make
> > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> > never really cared).
>
> The best thing that I have come up with is a pre-configure step, where
> an object tree gets seeded with a makefile fragment that gets included
> for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
> 'CC=' and possibly any other option that gets passed to 'make' as
> a variable and has to exist before calling 'make *config'.


There is no need to add a hook to include such makefile fragment(s).

Quite opposite, you can put your Makefile (in a different filename)
that includes the top Makefile.


I think this is what people are already doing:


GNU Make looks for 'GNUmakefile', 'makefile', and 'Makefile'
in this order.


So, you can put 'GNUmakefile' with your favorite setups.


$ cat GNUmakefile
ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu-
CC=clang
include Makefile



Then, you can simply do "make defconfig; make"
for building arm64 with clang.



If you want to have multiple setups, you can put
custom Makefiles, and select by the -f option.


For example,



$ cat Makefile-arm64
ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu-
include Makefile


$ cat  Makefile-arm64-llvm
ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu-
LLVM=1
include Makefile


$ cat Makefile-arm
ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf-
include Makefile


Then,

$ make -f Makefile-arm64  defconfig all   -j24

$ make -f Makefile-arm64-llvm   defconfig all -j24

$ make -f Makefile-arm  defconfig all -j24


You can use TAB-completion for the 'Makefile-*' part,
so you can save many typings than you do
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- ...



It is just a tip to ease your life without any change to upstream.
Maybe, some people might be doing that.




>
> This is probably the easiest part here, and it lets you set up multiple
> object directories in which you can then do
>
> make O=obj-x86 defconfig vmlinux modules -skj32
> make O=obj-x86-clang
> make O=obj-arm64 randconfig
> ...
>
> without ever having to type the additional CC/CROSS_COMPILE/LLVM
> variables again.
>
> One step further is the script that automatically finds a working toolchain
> for a given architecture and sets up that object directory accordingly,
> or even downloads a working cross-toolchain from kernel.org when
> asked to do that.


I saw Intel's 0-day bot attached a shell script to download and
set up cross compilers.
(make.cross)




--
Best Regards
Masahiro Yamada
