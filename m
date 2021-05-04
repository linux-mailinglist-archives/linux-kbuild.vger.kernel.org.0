Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3693732BD
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 01:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbhEDXbf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 19:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhEDXbf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 19:31:35 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D32C061574;
        Tue,  4 May 2021 16:30:39 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id v188so325304ybe.1;
        Tue, 04 May 2021 16:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0LsRUNPM5NdWoS3h9RSO3mAB34MIxNW5tjSsk4+LsLE=;
        b=XZMtzbHjri0105Y1lVg/5Ncu9oGiuxK/pbBeGByRKgC0sKRo0I5Rd78m2bqkVeaMVa
         4++Xilk5XHEsP/P3EV9WWEYB+0YWEse6uTzqzF7rpQ6msTw9Ov/KwLWx/kU04RQCb5oA
         gxLl9+HPmOOddphhO0Vk+S9RuOGxHuChQ4IGWz0erJGxRKsIiKf2QynxKjX/5lIdL9HU
         yWtYwijs1N+uic8qY0EI+wb4EPN5QOilsdknBVVbUmjHbsACggnDm+8dHoHA6y3U3ty9
         opfQQigGVWs44iR9yPEmw4xzT3deyt+SxuGrWMvaLcMbGj0BoSnf1NbxaZvhK7KrJRzp
         Ps7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0LsRUNPM5NdWoS3h9RSO3mAB34MIxNW5tjSsk4+LsLE=;
        b=nGcm4/JuMkuzH8+mKRBRwbA2i0tPdDGuPLAZmebtF1t6j0TGqssnhwIX7o3Uxp/EC2
         wwx7eCYkm6dNX0lvqf2+mHLw9+RCXxJJpzBlJKYpvT9LdphUmLEa1QcyWvJ+Sg1WWUs+
         gEeWy8K5cbtUFg0H2JC3pSA3dmXQ6cDmaPqdi1QIe5FCtp3kB5i4rtNLr2XvlHmCPLa2
         gNW66ldw//8WsjBoP3TTvd01IJ/dIGdnTOyQtVy28/xcn6Fg4o9GVQoIzeQ38cb1f3mf
         0BgKBjWf9M+2Ntj+UHbRxiMk9Xy2i+/yUqGgqiCgFFsFEDfGeXKauDExelfAiLRvZnjF
         uZqQ==
X-Gm-Message-State: AOAM531KRURxDlZ6p6J+AGUaE/OG1OEBF17TfaGGuEAB34NJLxBMmT5n
        8/Q40f3QAYta+2Lfz8Q9gzpJaU2UgzH5JqnyPdI=
X-Google-Smtp-Source: ABdhPJwCasFo5HIaTPDTfDvDc+XFDs+QeP6r/wfG3fsdURBUabG3johtzO5OD9xuHcXUqjx9/oUVIFMHAYF7dpIOI0M=
X-Received: by 2002:a25:880f:: with SMTP id c15mr36952995ybl.247.1620171039053;
 Tue, 04 May 2021 16:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
 <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
 <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com> <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com>
In-Reply-To: <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 5 May 2021 01:30:28 +0200
Message-ID: <CANiq72k+x13L+sFkjtDLahcvnpEySqk_NGow6FVMZfrV+MmHPw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Linus Walleij <linus.walleij@linaro.org>
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

On Tue, May 4, 2021 at 11:21 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Another argument can be made that for Rust to be
> perceived as mature, two independent implementations
> should exist anyway.

Many people agree, and in fact it may not be that far away. On related
news, the GCC frontend for Rust is now in Compiler Explorer, e.g.
https://godbolt.org/z/Wjbe5dTTb

I just requested `mrustc` (the Rust transpiler written in C++ for
bootstrapping purposes) to the Compiler Explorer folks to have it
there too.

> Fixing proper compilers may take a few years, like
> 5 or 10. But who cares? We are in it for the long run

I don't think it will take 5 years to see a new frontend (in
particular if only for valid code).

But even if it does, I don't see why we would need to wait for that to
start setting up Rust for the kernel if the decision is made to do so.

In fact, getting into the kernel can be an incentive for a new
frontend to say "we are now able to compile the kernel".

There are also other advantages to start the work now, such as working
out the currently-nightly features we need in the Rust language and
the standard library, getting them stabilized, submitting upstream
fixes (I had to implement a couple small ones), etc.

That way, when the time comes that we announce a minimum Rust stable
version, all that is ready for other frontends too.

> But I am not convinced that writing device drivers is the right
> thing to use Rust for in the kernel.

That is fair, hopefully the picture will be clearer when we get the
first drivers that talk to real hardware.

> There are some stuff in device driver frameworks, such as USB
> hierarchies or (battery) charging state machines, that can be
> really good to rewrite in Rust. But these rewrites would affect
> anything with a USB port for example, including Nios II and
> Motorola 68k systems.  So then the compiler support for all
> archs is needed first.

I would avoid a rewrite, but similarly to one of the previous points,
I don't see why work cannot already start if a maintainer is keen on
using Rust (and able to maintain both to some degree).

> I think right now the right thing for Rust is to work out-of-tree until
> there is Rust support for all archs, while encouraging kernel
> developers to learn the language.

That would be an option, yes, but if the decision ends up being made
and we are encouraging kernel developers to learn the language, what
do we achieve by keeping things out-of-tree?

In fact, by getting in-tree people, organizations & companies would be
encouraged to give more support sooner rather than later to the LLVM
backends they care about and/or to the GCC frontend for Rust. So, in a
way, it can be a win for those projects too.

Cheers,
Miguel
