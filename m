Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0230A3C2076
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 10:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhGIIKK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jul 2021 04:10:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231278AbhGIIKK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jul 2021 04:10:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96F1F61057;
        Fri,  9 Jul 2021 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625818047;
        bh=4oYv7iKBXhSakHoC7OkzpBAI0y1ALUiBYq+K2NardEs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oTQk1UzUrkLqPeA+IyWAHfyynAHz5Oe5MqOtaeoGUCQRd5kNzkWfJmkDFoSKajUSS
         ZHHCX896XpUoLaJ97y2tPutCdmNeqPAGmW4/iKGoHq4/ysEATq7FfGNrK+ksVbXOv9
         C+13DkDpqmXYlP2UWoI0/evYLT5dn37LZDkjMOAZKWCDtZTS3qh2wh4HRAg8e1m2pv
         RPbH3y/fB26DaNebmObRJYtCMvOtc6xvqRYT67Px/n2F7BrSC89n0sq6AD82NSQJl7
         lYZekLjxN/AVywUeNrsleaWHWGPBUDG9Fo3iBlCdhL55VvOTQmaTdpFwHO2liH8H3S
         UXw7E2SY9vvdA==
Received: by mail-wm1-f44.google.com with SMTP id k31-20020a05600c1c9fb029021727d66d33so4189924wms.0;
        Fri, 09 Jul 2021 01:07:27 -0700 (PDT)
X-Gm-Message-State: AOAM531Th/fyEBQT5L7WrKZdIM9SAifyZw/suwyB+Jch5PO3EZhBE5de
        4G+nnffpeFYTDGvE3j9532O2EFJG07tR/DYIJ4M=
X-Google-Smtp-Source: ABdhPJyjma8r7kjEiEkZKC5RLhyIGYHqliAQk5yugD4nO73X1ncsjrcjW8SNBayxciO4eA1HJRR3GVkZlYgMIsNcUS8=
X-Received: by 2002:a05:600c:4101:: with SMTP id j1mr10271383wmi.84.1625818046196;
 Fri, 09 Jul 2021 01:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <YOaR1ZjToP/kgNsC@infradead.org> <CAK8P3a1ctLcHuLZfBJ7wXHRmidpQZ4EZdML1nqPJVGYVTgHmaw@mail.gmail.com>
 <CAKwvOdkaifETNvtTA3O9EToVHAK0N50wkT-bHOpQ2RmFg7qk0A@mail.gmail.com>
In-Reply-To: <CAKwvOdkaifETNvtTA3O9EToVHAK0N50wkT-bHOpQ2RmFg7qk0A@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 9 Jul 2021 10:07:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3h_tVaXVKRgaC9L+z9CwVGkOmCPPeW7UjDUhPKHNQDmw@mail.gmail.com>
Message-ID: <CAK8P3a3h_tVaXVKRgaC9L+z9CwVGkOmCPPeW7UjDUhPKHNQDmw@mail.gmail.com>
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

On Thu, Jul 8, 2021 at 8:04 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:

> > /usr/bin/powerpc64-linux-gnu-gcc-5.2.0
> > /usr/bin/powerpc64-linux-gnu-gcc -> powerpc64-linux-gnu-gcc-5.2.0
> > /usr/local/bin/ppc64le-linux-gcc-9
> > ~/bin/powerpc/powerpc-linux-unknown-gcc-12.0.20210708.experimental
> >
> > all of these should be able to cross-build any powerpc kernel, but
> > there is no obvious first choice (highest version, first in path,
> > ordered list of target triples, ...). I tried coming up with a heuristic
> > to pick a reasonable toolchain, but at some point gave up because
> > I failed to express that in a readable bash or Makefile syntax.
>
> Right; foremost in my mind was arm-linux-gnueabi-gcc vs
> arm-linux-gnueabihf-gcc.  That's not even to mention the versioned
> suffixes.
>
> In terms of multiversion support; this series doesn't regress doing
> things the hard/verbose way.  But I think for most users we can have a
> simpler common case; folks can play with their $PATH or focus on more
> hermetic builds if they want this new feature (CROSS_COMPILE
> inference) AND support for multiple versions of the same toolchain.

Fair enough. So how something like this:

powerpc-targets := powerpc32 powerpc64 powerpc32le \
        powerpc32be powerpc64le powerpc64be ppc64le ppc64be
arm-targets := arm-linux-gnueabi arm-linux-gnueabihf
x86-targets := x86_64 i386 i686
x86_64-targets := x86
i386-targets := i686 x86 x86_64
parisc-targets := hppa64 hppa
...

CROSS_COMPILE ?= `find-toolchain $(ARCH) $($(ARCH)-targets)`

where find-toolchain just finds the first working toolchain based, looking
for $(target)-linux-gcc $(target)-gcc $(target)-unknown-linux-gcc etc
in $(PATH) but ignoring the versions?

What I had actually planned was a set of helpers that allow you to
do this in multiple steps:

- if $(objtree)/scripts/cross/bin/gcc (or something else we pick)
  exists and CROSS_COMPILE is not set, set CROSS_COMPILE
  to $(objtree)/scripts/cross/bin/ in the Makefile
- add script to enumerate the installed toolchains
- add a second script to symlink one of those toolchains to
  $(objtree)/scripts/cross/bin
- add a third script to download a cross-toolchain from kernel.org
  for $(ARCH) and install it to one of the locations that the first
  script looks for (/opt/cross/, $(HOME)/cross/, $(objtree)scripts/cross/)

        Arnd
