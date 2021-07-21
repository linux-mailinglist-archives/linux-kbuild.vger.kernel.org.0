Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B299D3D07C9
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jul 2021 06:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbhGUDwL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 23:52:11 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:23762 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbhGUDwJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 23:52:09 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 16L4WRIo019438;
        Wed, 21 Jul 2021 13:32:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 16L4WRIo019438
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626841948;
        bh=J9oYDcYqoBIO5hSk3r1VYqQb2xyH8Fh1EI0OV1fPJMA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wt6NiRdvV3nVGC0+EPjv+Hx8Zck0rpBFPbrLHEWRe0mNu9mfJFbHvr0b/O6bdyDqO
         5cB8n/fm4rCRR68lbT5ecH6lRyNkoXLBtoBJlJjilTLUt2wGFoWwiI4Skiu9yCPKzv
         RGrYbux0g6W9mLQ1o7gDABW95eAv+V4TedxcJkQBmOvCsQywZ8ca81XdlkcfR+X5sG
         8ziNmogBZnv9cdVQITQ1MN2L6ughYV28Rg/yDH0hrDv+xkuom1H7X4hhW9nDZks1ng
         dAwufVi8PibN+dDD51xMP/NvuJM0kX2ClBZBlI5vaz/Xp+IVlqg6+e+slXSiosDoSG
         AHYux0Xqntmmw==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id x13-20020a17090a46cdb0290175cf22899cso297681pjg.2;
        Tue, 20 Jul 2021 21:32:27 -0700 (PDT)
X-Gm-Message-State: AOAM532DnWQHBcszjiSRDOlUluTx07FJ5vI0s4of9TUKSpjO4zTCTaLw
        VY5AEeyhJSo1zSd+Ws2UWBYWKcKyw3k7+3ZAUOA=
X-Google-Smtp-Source: ABdhPJzW0wW0fU9+V0pQhIspzTzWNYvurAZJTZNq7nhtuJpeSMk73AG/dk7yBo7rYe4ZZtCHYR/xR2YVL7hH/Mv1zcU=
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr1870574pjt.198.1626841946977;
 Tue, 20 Jul 2021 21:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 21 Jul 2021 13:31:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATsdF9+dpqf3OWNpi2dcrT52QcPkNog5reGewbwo8rGBg@mail.gmail.com>
Message-ID: <CAK7LNATsdF9+dpqf3OWNpi2dcrT52QcPkNog5reGewbwo8rGBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
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

On Wed, Jul 21, 2021 at 2:43 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > LLVM=1 is a convenient switch to change all the
> > defaults, but yet you can flip each tool individually.
>
> Actually, I'd argue that "LLVM=1" is *not* a convenient switch.
> Neither are the individual other command line settings.
>
> When clang was the odd man out, and special, it all made sense.
> Changing the path to CC was similar to changing the path to AWK. And
> that's obviously why we have what we have.
>
> But clang has become a primary compiler for some kernel communities,
> and I think it might be time to just re-visit that entirely.
>
> In particular, I think we should just make it a Kconfig option. I hate
> the command flag stuff so much, that my clang tree literally has this
> patch in it:
>
>     -CC = $(CROSS_COMPILE)gcc
>     +CC = $(CROSS_COMPILE)clang
>
> so that I can just do the same "make -j128" in both my gcc tree and my
> clang tree.
>
> But each build tree already has its own .config file, so it would be a
> lot more convenient if that was how the compiler was chosen, and then
> "make oldconfig" would just DTRT.
>
> We do most of the other heavy lifting in this area in Kconfig anyway,
> why not add that compiler choice?


This does not work in the current design.

When we moved compiler tests to Kconfig from Makefile at v4.18,
I discussed a lot about the implementation.
Especially 'static' vs 'dynamic'.
(mostly Ulf Magnusson actively gave me feed backs)


static model
    Kconfig is given with a fixed set of toolchains.
    All macros such as cc-option are expanded in the early parse stage
    before proceeding to the configuration stage.


dynamic  model
   Every time a user toggles a CONFIG option, it feeds back to
   cc-option because CONFIG options (such as CONFIG_64BIT)
   might affect cc-option. In this model, CONFIG_CROSS_COMPILE
   works well.




Of course, the dynamic model is much more complex,
and I could not find a sane syntax to achieve it.

So, I implemented the static model; in this model,
$(cc-option ) are all constant values.

So, you cannot do:


  choice
         prompt "Compiler suite"

  config GCC
          "GCC and GNU binutils"

   config LLVM
           "LLVM (clang and llvm tools)"

  endchoice



To achieve this, we need the dynamic model.

Every time a user switches between CONFIG_GCC and CONFIG_LLVM,
all the cc-options must be re-evaluated.
This does not work in the current implementation.






BTW, keeping the command line interface
such as CROSS_COMPILE=...  CC=... LD=...
is useful when the kernel is built from umbrella
projects such as Buildroot, OpenEmbedded, etc.

Such projects build compilers by themselves,
and feed the exact compiler paths to the kernel.

Too long command line is an annoyance when
we build the kernel manually.












>
> Obviously it would be gated by the tests to see which compilers are
> _installed_ (and that they are valid versions), so that it doesn't ask
> stupid things ("do you want gcc or clang" when only one of them is
> installed and/or viable).
>
> Hmm? So then any "LLVM=1" thing would be about the "make config"
> stage, not the actual build stage.
>
> (It has annoyed me for years that if you want to cross-compile, you
> first have to do "make ARCH=xyz config" and then remember to do "make
> ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> never really cared).
>
> Let the flame wars^H^Hpolite discussions ensue..
>
>                         Linus

--
Best Regards
Masahiro Yamada
