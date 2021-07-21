Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3123D07FA
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jul 2021 06:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbhGUEOD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Jul 2021 00:14:03 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:52357 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbhGUEOB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jul 2021 00:14:01 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 16L4sM0v022986;
        Wed, 21 Jul 2021 13:54:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 16L4sM0v022986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626843263;
        bh=W1v70rWFrLtOW1Ykxet5FTFkDNOi12M78dgvKR6ceXg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bTGxYgJVrwr+TAaFPHcmdmmaCJtAK3wd0a6B3GBXxtL9PXeNhBxyApVnqwcoMUqQa
         qgYM1cC6J6S2JlFbeUkP6CRYsf3u+IIWycsCjRrCJQw2OdH9tHtYY5StREub/pNcEu
         2v0foeI3vZe5JXS1ZSNSd4Cp32+BqIZsD/R8KtfzJkQkdEWntJTPF/INuJLO1ydpm7
         Ktk+ACJVECOmHDHwteEl0kf9er/+DWYzWYJWpNLn36jQnl9inE6QwjpWq696Drzpqa
         t1yrDJlseyjXVLAJVggXkDJfDlYeHEPvw9aJPyli5YsbjhgVeL5M1zIkUWTMsJgflv
         9tL5yVmQ/AxYQ==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id g4-20020a17090ace84b029017554809f35so3277722pju.5;
        Tue, 20 Jul 2021 21:54:23 -0700 (PDT)
X-Gm-Message-State: AOAM530+0fJlpMbNUJb1bS0eiLTfuBDfDTZUgzdHsKNBHjch/tn413Y+
        2jpQKj/IJCDqEHXaeUILIGB/yBIV84baI3LO3T8=
X-Google-Smtp-Source: ABdhPJxeCjqxcCUPnWhnNro9RqO8oWqcWwGQRcS7jQ04Cxg5C82KfU6jz0UBpdmcYuojrbvkddaTuHHxiE8xp2UVGkU=
X-Received: by 2002:a17:902:e8ce:b029:12b:3d80:a028 with SMTP id
 v14-20020a170902e8ceb029012b3d80a028mr26211447plg.47.1626843262323; Tue, 20
 Jul 2021 21:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com> <CAKwvOdn065OJpow=7VF=ujagFoyN4sYMKAA_E2_39ZC7uThchg@mail.gmail.com>
In-Reply-To: <CAKwvOdn065OJpow=7VF=ujagFoyN4sYMKAA_E2_39ZC7uThchg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 21 Jul 2021 13:53:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUSHmD=D6e1NrkZ+oUPV23wX8rHd8wEmQJJ4LW3bNW5w@mail.gmail.com>
Message-ID: <CAK7LNAQUSHmD=D6e1NrkZ+oUPV23wX8rHd8wEmQJJ4LW3bNW5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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

On Wed, Jul 21, 2021 at 5:52 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Jul 20, 2021 at 10:43 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > LLVM=1 is a convenient switch to change all the
> > > defaults, but yet you can flip each tool individually.
> >
> > Actually, I'd argue that "LLVM=1" is *not* a convenient switch.
>
> Compared to the old way of CC=clang LD=ld.lld OBJCOPY=.... it certainly is.
>
> > Neither are the individual other command line settings.
>
> Agreed, but we needed flexibility until we could get all of the
> command line tools working for each architecture.  They're still
> useful when there's a regression and we need to fall back.  So I
> wouldn't be in favor of removing them (not that that's been proposed).
>
> > When clang was the odd man out, and special, it all made sense.
> > Changing the path to CC was similar to changing the path to AWK. And
> > that's obviously why we have what we have.
> >
> > But clang has become a primary compiler for some kernel communities,
> > and I think it might be time to just re-visit that entirely.
>
> :^)
>
> > In particular, I think we should just make it a Kconfig option. I hate
> > the command flag stuff so much, that my clang tree literally has this
> > patch in it:
> >
> >     -CC = $(CROSS_COMPILE)gcc
> >     +CC = $(CROSS_COMPILE)clang
> >
> > so that I can just do the same "make -j128" in both my gcc tree and my
> > clang tree.
>
> So you haven't been using LLD... :( (imagine using more than one
> thread to link, and being faster than ld.gold)  If anything you should
> be hard coding LLVM=1 in that tree.  Also, please be careful you don't
> accidentally commit that! 0:-)
>
> > But each build tree already has its own .config file, so it would be a
> > lot more convenient if that was how the compiler was chosen, and then
> > "make oldconfig" would just DTRT.
> >
> > We do most of the other heavy lifting in this area in Kconfig anyway,
> > why not add that compiler choice?
> >
> > Obviously it would be gated by the tests to see which compilers are
> > _installed_ (and that they are valid versions), so that it doesn't ask
> > stupid things ("do you want gcc or clang" when only one of them is
> > installed and/or viable).
> >
> > Hmm? So then any "LLVM=1" thing would be about the "make config"
> > stage, not the actual build stage.
> >
> > (It has annoyed me for years that if you want to cross-compile, you
> > first have to do "make ARCH=xyz config" and then remember to do "make
> > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> > never really cared).
> >
> > Let the flame wars^H^Hpolite discussions ensue..
>
> I agree with you.  Overall the command line invocation of make when
> cross compiling, or when using LLVM is too long.  You even call out
> LLVM=1 and ARCH separately.  Each one of these had good reasons to
> exist for years.
>
> But I disagree that all needs to be sorted out together, or right now.
> And I'd much rather tackle them separately, one by one, than try to
> completely rewrite how we cross compile the kernel today.
>
> Right now, we have:
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1 -j72
>
> This series is concerned with just CROSS_COMPILE (and just for LLVM=1).
> Next I plan to default on LLVM_IAS=1 for all architectures we support,
> minus ppc and s390 where we still have some assembler bugs.
> Your/Arnd's ideas about LLVM=1 or not via Kconfig, or pre-Kconfig is a
> good idea for eliminating LLVM=1.


I also like to make the integrated assembler our default.

We can add LLVM_DISABLE_IAS=1 to
replace LLVM_IAS=1.







> Then that just leaves ARCH.
> Arnd's idea about helping you install a toolchain from kernel.org is
> one I support, but orthogonal to the above somewhat.  Do you allow
> someone to have a config that denotes intent to build with clang then
> prompt if they don't have clang installed to download it? Or do you
> prevent someone from selecting building with clang because it's not in
> the $PATH?
> Your/Arnd's idea about detecting which toolchains are installed is one
> I support, but orthogonal to the above somewhat.  (For that, I'm
> curious for our build servers if that means having to put tools in
> certain locations; I prefer we reference $PATH when possible. Or if
> .configs can no longer be shared if tools are in different locations.
> But perhaps that's a non-issue).  I'm also curious how many stat calls
> we'll need to test/probe/find these, and how we prioritize which tools
> are selected when there's more than one version installed.
>
> I encourage us to make steps in the right direction; but I think this
> series is ready to go for at least one of the command line variables.
> I don't think we need to wait for some probing machinery to eliminate
> CROSS_COMPILE when LLVM=1; and if we ever get such machinery we can
> revisit whether that helps this case at all.
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
