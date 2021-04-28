Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD6F36D0AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Apr 2021 04:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbhD1Cwj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Apr 2021 22:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235839AbhD1Cwj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Apr 2021 22:52:39 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B184C061574;
        Tue, 27 Apr 2021 19:51:55 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id w24so7158988vsq.5;
        Tue, 27 Apr 2021 19:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=COKqeIfX+x/8KkgUZa6JpkF1XncnNdp8WaLgOOuA0IY=;
        b=Trt07zXkQCd5/Gl6NZgnfd/L8C5o0jd2A4Kkux953c/3b26vUROyGKl2so7L2TRp6a
         geqWh9KkxDQjE6shN9l8XILV8gUaasgMCUOHd2nmkhjPNg2sFz/WK2MrAcGFh4k+TvSW
         KxDQ5JALCp+SZoIw7Mr+CVVo1bydvqGFxv38wO4pftFP/og83TFCg2Mnk1M4EM4iW02g
         H4rzQUuUOTR9v+iR1rySoG9qgr3UmCuq5sFneAofLfMl+yfoedylwSWcrq5+OhJ7KzLv
         uG6LwqqLGTNsOAZKV8W4LNPYZj5dwKbjhvPoWA2ysULq7XXT/mpB5USp+GXSnqfD7+c8
         SXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=COKqeIfX+x/8KkgUZa6JpkF1XncnNdp8WaLgOOuA0IY=;
        b=AajeDCLF7fA6nwVJsWSH5TYIS8KZP/olrRTDTquoaaXxyR+4JF3/uE2FjpJFogc2fe
         ZLJ/o2FXZr+kF6/Wy/mr5CNvCQIURVZo3rauJgrYQePGFSQh0POmjXcFp82BtRme8+k/
         rMNI6o6ZzocYOMI86Lc40Zfn8az+3tU5K06WlkN2LCyLuujsfgDJ4t2qK6RK/rrG4EsE
         0BxVKhQlDXv3tDVrOUePl15RYWF+4qUdmTjPXGkCHIJs/Illr1b2qZVhgibcuwG8Kmcb
         E2g98pIVxTR+cGtBF12AJiQ9/OIsfjnGndE7j7hWry0FU0TVvwLYyQsPImjGW3D8gmvM
         3KZg==
X-Gm-Message-State: AOAM531C+lSesUxSl4aFRMRLlRsRnoKteCkzqffJiDxyqmrY1tdxyq+/
        ccU13bF65lC0DEF5+0tygvvRAJC1DQ5qCjfFEDQ=
X-Google-Smtp-Source: ABdhPJxauU8wt5+8cERpdIH/6veXJbzFIaPfTatMhNOQL+J7zF/haO7SorwqCf4U72UCFErfxoLDtxfZmsg4+JEknz8=
X-Received: by 2002:a67:f503:: with SMTP id u3mr22446168vsn.3.1619578314269;
 Tue, 27 Apr 2021 19:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com> <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
In-Reply-To: <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
From:   Kyle Strand <batmanaod@gmail.com>
Date:   Tue, 27 Apr 2021 20:51:43 -0600
Message-ID: <CAKzwK0VH5424rwMPFV3SsmC841yVtmzn9R_uXJh0xjCJnpBvMg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
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

Hi Linus,

I wanted to shed some light on one specific point of your criticism of
The Rust Programming Language:

>  What I find very disturbing is that the authors of the Rust language did NOT write it.

Rust, unlike C when the K&R book was written, has already had a pretty
large number of people contribute to its development. Steve Klabnik
and Carol Nichols are 6th and 11th, respectively, on the list of
contributors with the most commits in the Rust compiler & standard
library (from the official "thanks" page, excluding the top committer
"bors", which is part of Rust's CI automation:
https://thanks.rust-lang.org/rust/all-time/).

I hope this clears up some confusion.

> What we need is a good resource to learn it, that skips the trivial aspects of the language and goes immediately for the interesting details.

I realize that what is "trivial" and what is "interesting" is
subjective, but if you find the explanation of traits in the Book
difficult to understand, I would recommend revisiting the earlier
sections in order to be certain you understand the foundations for the
explanation of traits.

For what it's worth, since you would specifically like a lower-level
perspective, in addition to looking at the Reference (as previously
suggested), I recommend trying O'Reilly's Programming Rust by Jim
Blandy and Jason Orendorff.

Kyle Strand


On Tue, Apr 27, 2021 at 5:14 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Apr 26, 2021 at 8:18 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> > On Mon, Apr 26, 2021 at 2:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > I think the Rust proponents should be open to the fact that their
> > > work will eventually depend on themselves or someone else
> > > fixing a working compiler for the maintained architectures in
> > > the Linux kernel one way or the other, so they will be able to
> > > work with Rust project anywhere in the kernel.
> > >
> > > For example m68k is not going away. Avoiding this question
> > > of compiler support, just waiting and hoping that these old
> > > architectures will disappear is the wrong idea. The right idea
> > > is to recognize that LLVM and/or GCC Rust needs to
> > > support all these architectures so they can all use Rust.
> > > Someone needs to put in the effort.
> >
> > The RFC does not avoid the question -- please note it explicitly
> > mentions the architecture/platform support issue and the current
> > dependency on LLVM, as well as the possible ways to solve it.
>
> OK true. Sorry for being sloppy.
>
> Actually my reply to Wedson brought up a new issue, which is the
> quality of learning resources and the lack of an equivalent to
> The C Programming Language book.
>
> > But even if we did not have the issue today, it seems like starting
> > with drivers and other "leaf" modules is a better approach. There are
> > several reasons:
> >
> >   - If for reason reason we wanted to remove Rust from the kernel,
> > then it would be easier to do so if only "leaf" bits had been written.
> >
> >   - We cannot compile the Rust support without nightly features yet,
> > so it does not seem wise to make it a hard requirement right away.
> >
> >   - Kernel developers need time to learn a bit of Rust, thus writing
> > subsystems or core pieces of the kernel in Rust would mean less people
> > can understand them.
> >
> > Given that drivers are a big part of the new code introduced every
> > release, that they are "leaf" modules and that in some cases they are
> > only intended to be used with a given architecture, they seem like a
> > good starting point.
>
> I'm not sure I agree with this.
>
> I think a good starting point would be to either fix Rust support in
> GCC or implement some more important ISAs in LLVM,
> whichever is easiest. I don't mind having just *one* compiler but
> I mind having *a* compiler for every arch we support.
>
> The situation for LLVM is very well described in the Wikipedia
> entry for LLVM: "but most of this hardware is mostly obsolete,
> and LLVM developers decided the support and maintenance
> costs were no longer justified" - this is what I would call
> deprecationism (deletionism). I think this is a detrimental force
> for both compilers and kernels. It encourages developers of
> compilers and kernels to do the wrong thing: instead of
> rewriting their compiler and kernel infrastructure such that
> maintenance of older ISAs and architectures becomes a bliss
> they do what mathematicians do "let's assume a simpler
> version of the problem". And this results in a less versatile
> infrastructure and less adaptable code in the end. Which will
> affect how agile and adaptive the software is. And when
> something new comes along it hits you in the head.
>
> Portability to old systems and ISAs is a virtue in itself
> because of the effect it has on code quality, not necessarily
> for the support itself.
>
> Deprecationism is more the side effect of a certain business
> strategy to toss new technology out every quarter without
> having to care about aftermarket or postmarket too much.
> This irritates people to the extent that there is now even
> a project called "PostmarketOS" (Linux based). It is not
> sustainable to use an emotional argument, but that is really
> not my point, I care about code quality and diversity of
> ISAs and target systems improves code quality in my book.
>
> I might be an extremist, but I do need to state this point.
>
> Yours,
> Linus Walleij
