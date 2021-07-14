Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7143C8A7C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 20:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhGNSMa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 14:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbhGNSMa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 14:12:30 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F05C061760
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:09:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 8so5103144lfp.9
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ij5c5QtyImKnAJ85AhNr0s4HqHfwN57z+cA0A4w9TXQ=;
        b=tP02GM10ESokXnfzuxqxyGhn+LXYrrm8TTsb0+WcG/RMMEk6ZIvyOA8njSVXinuPi0
         8OwwVj78Cn36LsfAMVQzjEHdchb6s8HzynJKXNFaXWXyZgrttIZwZFNs0UaXLPTchX9j
         4ebjWYjT3oVH01OKeOU9OCs90UQCyM0oN3DoHI0Q9aLfZCue3M7sOeSj8kENCZHrlqjU
         zu8AVJD/bCI2Y2osCvdQEE6rnLXPf6c5NW0xSwWiNwsaz6DnHrSmUYX98wQY9UiCD+il
         AARZX0oSlWsL+Vh8fDDpvJWY5oXQNSjZ2c6hfqx3VwCKvo6ysGipm+rBBTCOgTMIR3wQ
         YFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ij5c5QtyImKnAJ85AhNr0s4HqHfwN57z+cA0A4w9TXQ=;
        b=V1v6o3cyQsHkUqqb1occmuYE5xApglbJbi5eeQJebKWxgs9JrHSjuULyQ6yKZd0T5K
         d9UInLN/PyyyJPtfD9gk6vI2Q/zICxMhpl695xLVnJvsuuFKY2egN8T4gLgHEDDIv9tN
         uW6iNvqYzsC04Uo7b2iZbOL2hsFwnsbUWZdko2WrB74ZGrHN13Q39Q5yRl2oQioaNIvU
         vw19UNEIyQuy0VTdOwgvItoO3utLJx23RlK0Gq/nPGkVAV6CLUOgIosJf4cQy1bFpvnv
         rX6qgfgwD7ErONG/eF1HnEi4A2wxrlDcoTFMz+EbWEk3dkVGaEzWVvRpqMppmfpfaPeo
         Re0A==
X-Gm-Message-State: AOAM530kME5Gck7WRCqcKoISLI5F6RTPlObtn7gRQ8LwLYnnyYUEwXqf
        KS84nJWOnlMSOUNqk6FtWawgjyb7RSpwunzMKOoN0Q==
X-Google-Smtp-Source: ABdhPJx4KbBG6lrTeab1p1OzfGrztNprrxVheKM54pSelWmgS8ycp9fITsymufFWStCtFwAgfHJPrlZycm5VIuP6blA=
X-Received: by 2002:a05:6512:3e0c:: with SMTP id i12mr8754331lfv.122.1626286176530;
 Wed, 14 Jul 2021 11:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <YOaR1ZjToP/kgNsC@infradead.org> <CAK8P3a1ctLcHuLZfBJ7wXHRmidpQZ4EZdML1nqPJVGYVTgHmaw@mail.gmail.com>
 <CAKwvOdkaifETNvtTA3O9EToVHAK0N50wkT-bHOpQ2RmFg7qk0A@mail.gmail.com> <CAK8P3a3h_tVaXVKRgaC9L+z9CwVGkOmCPPeW7UjDUhPKHNQDmw@mail.gmail.com>
In-Reply-To: <CAK8P3a3h_tVaXVKRgaC9L+z9CwVGkOmCPPeW7UjDUhPKHNQDmw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Jul 2021 11:09:24 -0700
Message-ID: <CAKwvOdkUUJU8Ktg8Wcvg3pbsyUWLCH0320nF-aQWre0hGTP2Ag@mail.gmail.com>
Subject: Re: [PATCH 0/2] infer CROSS_COMPILE from ARCH for LLVM=1 LLVM_IAS=1
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 9, 2021 at 1:07 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Thu, Jul 8, 2021 at 8:04 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
>
> > > /usr/bin/powerpc64-linux-gnu-gcc-5.2.0
> > > /usr/bin/powerpc64-linux-gnu-gcc -> powerpc64-linux-gnu-gcc-5.2.0
> > > /usr/local/bin/ppc64le-linux-gcc-9
> > > ~/bin/powerpc/powerpc-linux-unknown-gcc-12.0.20210708.experimental
> > >
> > > all of these should be able to cross-build any powerpc kernel, but
> > > there is no obvious first choice (highest version, first in path,
> > > ordered list of target triples, ...). I tried coming up with a heuristic
> > > to pick a reasonable toolchain, but at some point gave up because
> > > I failed to express that in a readable bash or Makefile syntax.
> >
> > Right; foremost in my mind was arm-linux-gnueabi-gcc vs
> > arm-linux-gnueabihf-gcc.  That's not even to mention the versioned
> > suffixes.
> >
> > In terms of multiversion support; this series doesn't regress doing
> > things the hard/verbose way.  But I think for most users we can have a
> > simpler common case; folks can play with their $PATH or focus on more
> > hermetic builds if they want this new feature (CROSS_COMPILE
> > inference) AND support for multiple versions of the same toolchain.
>
> Fair enough. So how something like this:
>
> powerpc-targets := powerpc32 powerpc64 powerpc32le \
>         powerpc32be powerpc64le powerpc64be ppc64le ppc64be
> arm-targets := arm-linux-gnueabi arm-linux-gnueabihf
> x86-targets := x86_64 i386 i686
> x86_64-targets := x86
> i386-targets := i686 x86 x86_64
> parisc-targets := hppa64 hppa
> ...
>
> CROSS_COMPILE ?= `find-toolchain $(ARCH) $($(ARCH)-targets)`
>
> where find-toolchain just finds the first working toolchain based, looking
> for $(target)-linux-gcc $(target)-gcc $(target)-unknown-linux-gcc etc
> in $(PATH) but ignoring the versions?

Sure, debian doesn't even package different versions of the cross GCC
packages AFAIK; no idea about other distros.  Though the user may have
built from source, or have multiple versions fetched from tarballs.

I think we can simplify the common case of "I just wan't to cross
compile, I don't necessarily care about an older compiler version
co-installed with a newer one." ("and if I did, I could still use
CROSS_COMPILE the verbose way").

> What I had actually planned was a set of helpers that allow you to
> do this in multiple steps:
>
> - if $(objtree)/scripts/cross/bin/gcc (or something else we pick)
>   exists and CROSS_COMPILE is not set, set CROSS_COMPILE
>   to $(objtree)/scripts/cross/bin/ in the Makefile
> - add script to enumerate the installed toolchains
> - add a second script to symlink one of those toolchains to
>   $(objtree)/scripts/cross/bin

(and check the symlink isn't broken should the user uninstall a
toolchain, or have their distro update their toolchain version)

> - add a third script to download a cross-toolchain from kernel.org
>   for $(ARCH) and install it to one of the locations that the first
>   script looks for (/opt/cross/, $(HOME)/cross/, $(objtree)scripts/cross/)

Would the user be prompted for the download? So during
`defconfig`/configuration we could prompt and say "it looks like
you're cross compiling without setting CROSS_COMPILE, would you like
me to fetch a cross compiler for you?"

Seems reasonable, when cross compiling with GCC.
-- 
Thanks,
~Nick Desaulniers
