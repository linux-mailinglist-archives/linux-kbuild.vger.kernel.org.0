Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844173D0396
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 23:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhGTUZg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 16:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234856AbhGTUMm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 16:12:42 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F617C0613E3
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 13:52:52 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c23so130996ljr.8
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SbK6o7K/EkXUAGGxjZp7cQsvPy5H+b1sgULKd5tuIl8=;
        b=RZrjkrspMlyjhNfo8C2mQdLOvr7mkdUI4sM5tGIno3VN2G/g9g9xRd9ju+RP62eh6E
         bUueDNj0aBrWk0OwADCCXZ5OjPY6DtaZB6JTVxIgotjf2Duygyli7h0/9UuDF1pQk1JE
         HYEmV2qZC+4H/O2fjmBMyCgAWyJfDDYDpv6wPDVAotBqoNjehS88/YaRfL+hpJSYPPQf
         KzsQfjeE34J+kYZXTHCbLzJzQkA8BEyhWQHk1ok6eWaGyRJv0XuDFBo/SMu9rw5EjAcl
         PgfratM3omlSEVece2KEdYBAXuf03kx+c2v/8grGQ56/utkw5aodZN9yjw6uAULuWydf
         PKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SbK6o7K/EkXUAGGxjZp7cQsvPy5H+b1sgULKd5tuIl8=;
        b=K4pEKVITKogQ7WiNqfOH8U6FXz7QN38k3kZtqTi2ilUlBM6Pan41gRqn8xd8odHxeJ
         4WZMdZEuA2muNCgHJgfrRwlimYN+Mm9fxMxy+9PngJYcUYm4LeHHKhbRrp24REB18zJr
         xZr4c9GWWS4/uDnqo7J2gOoPYyrL02Qj+MChy0URNc/4K6VRaugrcRS31rT2EJa8zezo
         euzLlpZaVw+8OKOIscSj6N0x1h09n86depn18cAi4L+S4cxSe0ocX4HGQuPsz9Xq50+f
         gN6vfp1YW1er+OZrbpt9sxNuahaqljx+SuTmnRv5vVHNXoYNuhu8VjyUZJ6k+Ea0PwVr
         cCFw==
X-Gm-Message-State: AOAM532h60pnb9IIeeEqmTG2+wCxgh5TiRjEVWqXHwuelMaUbXfDClgN
        0b3xd9l8SIkVXCBRxfGQYUkrZAgUoyUZlMcq4uq61A==
X-Google-Smtp-Source: ABdhPJxUrCzDCNF950Lm9K1xwPMluhTK+m0aWC4jD/Zo3lLp96xSbocy0Qg4lRGWmVCM/qKJpab/khbXJyRtpxcsc64=
X-Received: by 2002:a2e:a911:: with SMTP id j17mr28057523ljq.341.1626814370202;
 Tue, 20 Jul 2021 13:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 20 Jul 2021 13:52:39 -0700
Message-ID: <CAKwvOdn065OJpow=7VF=ujagFoyN4sYMKAA_E2_39ZC7uThchg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
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

On Tue, Jul 20, 2021 at 10:43 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > LLVM=1 is a convenient switch to change all the
> > defaults, but yet you can flip each tool individually.
>
> Actually, I'd argue that "LLVM=1" is *not* a convenient switch.

Compared to the old way of CC=clang LD=ld.lld OBJCOPY=.... it certainly is.

> Neither are the individual other command line settings.

Agreed, but we needed flexibility until we could get all of the
command line tools working for each architecture.  They're still
useful when there's a regression and we need to fall back.  So I
wouldn't be in favor of removing them (not that that's been proposed).

> When clang was the odd man out, and special, it all made sense.
> Changing the path to CC was similar to changing the path to AWK. And
> that's obviously why we have what we have.
>
> But clang has become a primary compiler for some kernel communities,
> and I think it might be time to just re-visit that entirely.

:^)

> In particular, I think we should just make it a Kconfig option. I hate
> the command flag stuff so much, that my clang tree literally has this
> patch in it:
>
>     -CC = $(CROSS_COMPILE)gcc
>     +CC = $(CROSS_COMPILE)clang
>
> so that I can just do the same "make -j128" in both my gcc tree and my
> clang tree.

So you haven't been using LLD... :( (imagine using more than one
thread to link, and being faster than ld.gold)  If anything you should
be hard coding LLVM=1 in that tree.  Also, please be careful you don't
accidentally commit that! 0:-)

> But each build tree already has its own .config file, so it would be a
> lot more convenient if that was how the compiler was chosen, and then
> "make oldconfig" would just DTRT.
>
> We do most of the other heavy lifting in this area in Kconfig anyway,
> why not add that compiler choice?
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

I agree with you.  Overall the command line invocation of make when
cross compiling, or when using LLVM is too long.  You even call out
LLVM=1 and ARCH separately.  Each one of these had good reasons to
exist for years.

But I disagree that all needs to be sorted out together, or right now.
And I'd much rather tackle them separately, one by one, than try to
completely rewrite how we cross compile the kernel today.

Right now, we have:
$ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1 -j72

This series is concerned with just CROSS_COMPILE (and just for LLVM=1).
Next I plan to default on LLVM_IAS=1 for all architectures we support,
minus ppc and s390 where we still have some assembler bugs.
Your/Arnd's ideas about LLVM=1 or not via Kconfig, or pre-Kconfig is a
good idea for eliminating LLVM=1.
Then that just leaves ARCH.
Arnd's idea about helping you install a toolchain from kernel.org is
one I support, but orthogonal to the above somewhat.  Do you allow
someone to have a config that denotes intent to build with clang then
prompt if they don't have clang installed to download it? Or do you
prevent someone from selecting building with clang because it's not in
the $PATH?
Your/Arnd's idea about detecting which toolchains are installed is one
I support, but orthogonal to the above somewhat.  (For that, I'm
curious for our build servers if that means having to put tools in
certain locations; I prefer we reference $PATH when possible. Or if
.configs can no longer be shared if tools are in different locations.
But perhaps that's a non-issue).  I'm also curious how many stat calls
we'll need to test/probe/find these, and how we prioritize which tools
are selected when there's more than one version installed.

I encourage us to make steps in the right direction; but I think this
series is ready to go for at least one of the command line variables.
I don't think we need to wait for some probing machinery to eliminate
CROSS_COMPILE when LLVM=1; and if we ever get such machinery we can
revisit whether that helps this case at all.
-- 
Thanks,
~Nick Desaulniers
