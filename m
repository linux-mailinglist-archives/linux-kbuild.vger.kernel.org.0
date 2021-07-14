Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60083C91EF
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 22:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbhGNUVo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 16:21:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237002AbhGNUVo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 16:21:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31CC7613D0;
        Wed, 14 Jul 2021 20:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626293932;
        bh=oYfnou5QrrOb7U0CV0cSAUF5DqCBPcwnE78QZi9FPqs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KFD+vift05YPCmw5Vr9xI+ZHM31/3sC5I9gz9gL/6DW9sOE07lf1UCTq0EfTYgCEd
         h71LEfsQRV0QQxh9gliJ1jWfeU/79expDoGm6sI9vSbQ4ThK2OetF1Nj9oXi/o8AKe
         O0Uyxshop86+JTQqjFWQUkpu921cKp2S3VHa/b8BpXwYvZTEidz8/YdjI5NPkCW/3+
         GnYLoBnNhFZdPcF1wkvtUZpxVIZMWc1Z9WrHcp/4nQ0EQmG0Vrup/L5iE/rmewvsre
         2C4GDDCqltRAszNcug50BSur0PJEPpUKl3vvsE+gKCNMX88qZ+4F9/jyZe2gMdp74m
         jQtOHPhUfXBzw==
Received: by mail-wm1-f44.google.com with SMTP id m11-20020a05600c3b0bb0290228f19cb433so4673668wms.0;
        Wed, 14 Jul 2021 13:18:52 -0700 (PDT)
X-Gm-Message-State: AOAM5331WgChpdIt99qs/cS1FgvfWQAA7K/fHFmvAyN6dCoL7ok/C1Iy
        3X5zFskuNuAGpsc2k5gB8e1fkU0T0CBZvzchXNo=
X-Google-Smtp-Source: ABdhPJwjV7O1SlNLPN2Cm4d3pik+v/hHQtZHMVCFrC1Vcx0o4N80DdVJ3CMItTwtQaQjCya28wbk+9hn2XKJu57ALbU=
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr5971146wmh.120.1626293930689;
 Wed, 14 Jul 2021 13:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <YOaR1ZjToP/kgNsC@infradead.org> <CAK8P3a1ctLcHuLZfBJ7wXHRmidpQZ4EZdML1nqPJVGYVTgHmaw@mail.gmail.com>
 <CAKwvOdkaifETNvtTA3O9EToVHAK0N50wkT-bHOpQ2RmFg7qk0A@mail.gmail.com>
 <CAK8P3a3h_tVaXVKRgaC9L+z9CwVGkOmCPPeW7UjDUhPKHNQDmw@mail.gmail.com> <CAKwvOdkUUJU8Ktg8Wcvg3pbsyUWLCH0320nF-aQWre0hGTP2Ag@mail.gmail.com>
In-Reply-To: <CAKwvOdkUUJU8Ktg8Wcvg3pbsyUWLCH0320nF-aQWre0hGTP2Ag@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 14 Jul 2021 22:18:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3R7FeA3Qjm9+bTz0Zd3=eFkXjgjmB24kewpVOPMtSbHQ@mail.gmail.com>
Message-ID: <CAK8P3a3R7FeA3Qjm9+bTz0Zd3=eFkXjgjmB24kewpVOPMtSbHQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] infer CROSS_COMPILE from ARCH for LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
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

On Wed, Jul 14, 2021 at 8:09 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Fri, Jul 9, 2021 at 1:07 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Thu, Jul 8, 2021 at 8:04 PM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > > > /usr/bin/powerpc64-linux-gnu-gcc-5.2.0
> > > > /usr/bin/powerpc64-linux-gnu-gcc -> powerpc64-linux-gnu-gcc-5.2.0
> > > > /usr/local/bin/ppc64le-linux-gcc-9
> > > > ~/bin/powerpc/powerpc-linux-unknown-gcc-12.0.20210708.experimental
> > > >
> > > > all of these should be able to cross-build any powerpc kernel, but
> > > > there is no obvious first choice (highest version, first in path,
> > > > ordered list of target triples, ...). I tried coming up with a heuristic
> > > > to pick a reasonable toolchain, but at some point gave up because
> > > > I failed to express that in a readable bash or Makefile syntax.
> > >
> > > Right; foremost in my mind was arm-linux-gnueabi-gcc vs
> > > arm-linux-gnueabihf-gcc.  That's not even to mention the versioned
> > > suffixes.
> > >
> > > In terms of multiversion support; this series doesn't regress doing
> > > things the hard/verbose way.  But I think for most users we can have a
> > > simpler common case; folks can play with their $PATH or focus on more
> > > hermetic builds if they want this new feature (CROSS_COMPILE
> > > inference) AND support for multiple versions of the same toolchain.
> >
> > Fair enough. So how something like this:
> >
> > powerpc-targets := powerpc32 powerpc64 powerpc32le \
> >         powerpc32be powerpc64le powerpc64be ppc64le ppc64be
> > arm-targets := arm-linux-gnueabi arm-linux-gnueabihf
> > x86-targets := x86_64 i386 i686
> > x86_64-targets := x86
> > i386-targets := i686 x86 x86_64
> > parisc-targets := hppa64 hppa
> > ...
> >
> > CROSS_COMPILE ?= `find-toolchain $(ARCH) $($(ARCH)-targets)`
> >
> > where find-toolchain just finds the first working toolchain based, looking
> > for $(target)-linux-gcc $(target)-gcc $(target)-unknown-linux-gcc etc
> > in $(PATH) but ignoring the versions?
>
> Sure, debian doesn't even package different versions of the cross GCC
> packages AFAIK; no idea about other distros.  Though the user may have
> built from source, or have multiple versions fetched from tarballs.

I have an Ubuntu installation with gcc-9, gcc-10 and gcc-11 cross
toolchains installed from through apt, but none that is just 'gcc'
without a version as the ones I built myself are.

> I think we can simplify the common case of "I just want to cross
> compile, I don't necessarily care about an older compiler version
> co-installed with a newer one." ("and if I did, I could still use
> CROSS_COMPILE the verbose way").

Right, in my example above one would still have to set CC=
since the detected target triple has no $(CROSS_COMPILE)gcc,
only the versioned ones.

Setting up the symlinks however should get you there.

> > What I had actually planned was a set of helpers that allow you to
> > do this in multiple steps:
> >
> > - if $(objtree)/scripts/cross/bin/gcc (or something else we pick)
> >   exists and CROSS_COMPILE is not set, set CROSS_COMPILE
> >   to $(objtree)/scripts/cross/bin/ in the Makefile
> > - add script to enumerate the installed toolchains
> > - add a second script to symlink one of those toolchains to
> >   $(objtree)/scripts/cross/bin
>
> (and check the symlink isn't broken should the user uninstall a
> toolchain, or have their distro update their toolchain version)

There are lots of options for the policy here. My preference would
be to just pick the one from the symlink before any other, and then
have a step 'make config' family of commands that checks that
the selected toolchain actually produces object code for the selected
architecture.

> > - add a third script to download a cross-toolchain from kernel.org
> >   for $(ARCH) and install it to one of the locations that the first
> >   script looks for (/opt/cross/, $(HOME)/cross/, $(objtree)scripts/cross/)
>
> Would the user be prompted for the download? So during
> `defconfig`/configuration we could prompt and say "it looks like
> you're cross compiling without setting CROSS_COMPILE, would you like
> me to fetch a cross compiler for you?"
>
> Seems reasonable, when cross compiling with GCC.

I don't think we want interactive commands in the build system other
than 'make config', but it would be reasonable to print something like

"no compiler found", "selected compiler ${CC} does not match architecture
${ARCH}", or "selected compiler ${CC} does not work", followed by a
list of suggested commands to configure or download a different toolchain.

       Arnd
