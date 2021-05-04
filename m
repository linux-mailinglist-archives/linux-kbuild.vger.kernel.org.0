Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01ABA3731D8
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 23:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhEDVWX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 17:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbhEDVWW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 17:22:22 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797CFC061761
        for <linux-kbuild@vger.kernel.org>; Tue,  4 May 2021 14:21:26 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y9so7975939ljn.6
        for <linux-kbuild@vger.kernel.org>; Tue, 04 May 2021 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yAbfmdaJbfLqhtql/cXcH6P3ondGJk0dpOjbha9QFHk=;
        b=WU+MXW5m+Lf1tw0Ehk8eRViK54G8DBa/iK9OB21udwYpwYVtasFRrsmRLxy/J/jzy4
         9Ww0syYnl3iyhgIg+ZNkKewuBfLf9UvzyN8AJs2KiTgsAAtz2XIw7SIqDSgEMD5lulB3
         3brQ+rSjbdhq9NGPiec3m8r8r+mX3JBitpdnIQ6n3j68wDQkoWI88m+CnzM5V4/Jr8of
         IMAxvZU96u2eE8n66JMeSWLfdPywgXVSXE1SvJLUn2ctk25cNOQi1fc6C846d3UlbEO0
         5ZhmqX5aux4rFFSuG3fvsESHX5vUmoSZYve5ljH1wI9rCQ3540JK4cBy/tjIKnWXKo4j
         ss1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yAbfmdaJbfLqhtql/cXcH6P3ondGJk0dpOjbha9QFHk=;
        b=aH4vm8SdqLml835A+IxXdoW4flRVkm8SHXCu7xyybAFxVvN7ozjf7a6AX59IWpxupC
         erSAnyRGhmcmY8yKubLLvoBXkWxffNvwdZDbkmdtvKedH3Wbx0muREELuF8uwHpDfUi4
         BASa1lW+VbfO689SROVt6X781wbwtnYzy7RfY+4UGRztrbOQnwlk/1Vi3TCfAlu1cykJ
         2TVz2L7ZoLxlY4lsbqAnAHA7NDS8KbD+zDNJ2l7IoOyz1jortK2+upLPgKSWj2wslqt3
         8O+om8MANFcTJ2FiC19ahfBralAJjD2vKW8QOqMAuiOa6T84UZN2cQhC9zdbIhQVZKnc
         OpYA==
X-Gm-Message-State: AOAM531oKBHUvZ+E5fDsuGavnNzeaRKlL1/+QstfnOL10nIrrvMaExwg
        zavKH/oAzmXDljpGNI0QRc+8UMrHP7XyO+mvt2DlRg==
X-Google-Smtp-Source: ABdhPJwME0m5eStfnw6WbRfi9Mllq4rBz3Mvg1scl5RVwon1JTsVhstn5mv0RH++RCLkxc74/MJMukbxEbPMndiFPDk=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr10098498lji.438.1620163284760;
 Tue, 04 May 2021 14:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
 <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com> <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
In-Reply-To: <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 May 2021 23:21:13 +0200
Message-ID: <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 28, 2021 at 5:10 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Apr 27, 2021 at 1:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > Actually my reply to Wedson brought up a new issue, which is the
> > quality of learning resources and the lack of an equivalent to
> > The C Programming Language book.
>
> I recall having a similar feeling when initially jumping into
> individual chapters of The Rust Programming Language book. I think it
> is intended to be read from cover to cover instead.
>
> There are other resources, see [1]. For instance, there is The
> Embedded Rust Book [2]. Some of those are a WIP, but perhaps others
> can recommend better finished/published books.
>
> In any case, Rust has more features than C, some of them quite unique,
> and they are routinely used, so it does take some time to learn.

No joke, I do try. I thought it would be easier since I have written
a fair share of Haskell in my years but Rust is this hybrid of
imperative and functional that just make things a bit hard
to pin down: is this part functional? is it imperative?
is it object oriented? etc.

But the reference that Robin pointed to is better to read. It
is not as talkative and more to the point. So now I am working
with that.

> > I think a good starting point would be to either fix Rust support in
> > GCC or implement some more important ISAs in LLVM,
> > whichever is easiest. I don't mind having just *one* compiler but
> > I mind having *a* compiler for every arch we support.
> >
> > [...]
> >
> > Portability to old systems and ISAs is a virtue in itself
> > because of the effect it has on code quality, not necessarily
> > for the support itself.
>
> I agree that there are benefits of keeping compiler technology
> flexible, but one cannot force or expect any project (including the
> Linux kernel) to maintain all code forever.
>
> In the end, we need to balance that adaptability against the benefits
> of adding Rust. In particular because nowadays LLVM is able to cover
> the majority of devices that want to run the very latest Linux
> kernels. Thus those benefits apply to most users. If LLVM only
> supported, say, x86_64, I would agree that it would not be enough.
>
> By contrast, compiler flexibility only matters indirectly to users,
> and at some point there are diminishing returns to keeping all
> architectures around.

My values in this regard are 180 degrees opposed to yours.

My attitude to the problem, was I to fix it, would be
"let's go fix a frontend for Rust to GCC, how hard can it be"
rather than trying to avoid that work with this kind of
reasoning trying to one way or other prove that it is not
worth the effort.

A GCC front-end will allow you to run Rust on all Linux
target architectures which is a big win. LLVM can be
expanded with backends for all archs as well but that
seems like a much bigger job to me.

Another argument can be made that for Rust to be
perceived as mature, two independent implementations
should exist anyway.

The IETF Standards Process (RFC 2026, updated by
RFC 6410) requires at least two independent and
interoperable implementations for advancing a protocol
specification to Internet Standard.

Why should the kernel programming languages have any
lower standards than that?

The C programming language has earned its place thanks
to perseverance of implementing and reimplementing
compilers for it again and again.

Fixing proper compilers may take a few years, like
5 or 10. But who cares? We are in it for the long run
anyway. When I designed the character device interface
for GPIO I said I expect it to be maintained for at least
100 years. This is my honest perspective of things.

Torvalds has this saying (from Edison) that kernel
engineering is 1% inspiration and 99% perspiration.
Well let's live by that and fix those compilers.

When Linux was developed in 1992 C had existed since
1973 so it was 19 years old.

Now Linux is 28 years old and C is 47 years old.

This discussion needs perspective. And we really
cannot have development with a finger constantly
pushing the fastforward button.

> In any case, adding Rust (in particular for "leaf" modules) does not
> imply that we will lose those architectures any time soon.

But I am not convinced that writing device drivers is the right
thing to use Rust for in the kernel.

There are some stuff in device driver frameworks, such as USB
hierarchies or (battery) charging state machines, that can be
really good to rewrite in Rust. But these rewrites would affect
anything with a USB port for example, including Nios II and
Motorola 68k systems.  So then the compiler support for all
archs is needed first.

> That would
> take at least several years, and would require quite a few things to
> happen at the same time:
>
>   - That Rust got so widely used in the kernel (because the benefits
> turned out to be important) that maintainers went as far as wanting to
> drop C drivers from mainline for Rust equivalents.
>
>   - That GCC did not get any way to compile Rust (no Rust frontend for
> GCC, no GCC backend for `rustc`, etc.) and, moreover, that the plans
> for that had been dropped.
>
>   - That LLVM did not add support for the missing architectures.
>
> The first point is unlikely any time soon. The second point is
> unlikely, too, given there is funding for that now (and I assume those
> projects will receive more support if Rust lands in the kernel). The
> third point is likely, though.

What about patience?

I am thrilled to hear that GCC is growing Rust support and has funding
to fix a proper front-end. This is what Rust needs in general and
what the kernel needs in particular.

I think right now the right thing for Rust is to work out-of-tree until
there is Rust support for all archs, while encouraging kernel
developers to learn the language.

Yours,
Linus Walleij
