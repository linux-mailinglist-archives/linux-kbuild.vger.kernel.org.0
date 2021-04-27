Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7755736C4B1
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Apr 2021 13:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235811AbhD0LOb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Apr 2021 07:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235408AbhD0LOa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Apr 2021 07:14:30 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E9BC061756
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Apr 2021 04:13:44 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 4so33204583lfp.11
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Apr 2021 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+6WzqLyiZKhKSJY8jYMrMfFwc4Ih1W7DjlWwozGabCA=;
        b=q1CvhHPZNPCzVXL+eN0+T90/rhrNDTEGeHe0B9InduoF98HXZ6LvqT0k/KkdpQhaed
         EYTaQylYZdyTkkqgz1fD49HC52aY9k9EJf4jB0FqIG89QyCOUF9XRzT+M++d0Cnb39Rh
         cERREkzpk5nPIwbUX2eUYtB75RizCNOSQ896EJJ2dNqVDg747j3Nn5a68phBMPu2GTcd
         chMdUwv/6hDnvWVYJsH1UkfAW8BtT/e+NlHC9v7cVHhQXItZQ5eWD5KtWIDlXvjhIDDs
         mLcouHkC4aPS0K3xk7ziJjNRwL5appkAd96MP7kBEHe92sm0TzjbPiTYodF3zQleS9mF
         FJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+6WzqLyiZKhKSJY8jYMrMfFwc4Ih1W7DjlWwozGabCA=;
        b=JbtsmUHTc0iwr+sMrBRRG8vULRDJDm30aU+8PJvA9twCmuXGudEq0ChtvKFprxOG9B
         Zt3sA0/oBPourWqUG82rmwQ/vgPINO1Sfx3h8iJObJfWqgMbX5VnfcSAottGvl3CASdh
         WSuAcgg6l6MGelh/xI1oO3b/m4aogfZAqELuZhTM+/mwAGjxEx421KgDIwzoK4OwFHUc
         /FVjyJ7j0zNLTcScjviM/cDI/k7nHHRoYaEnd09DlJAhk6Q4Pk2lwOmH2zbtpcd9Osxk
         zcMaCrkzpgjQKivyaziPQmSgAENp1Rw01iblwx4FbJuJqOuCmsiDQVrd+Ua6N4k8lCI7
         naKw==
X-Gm-Message-State: AOAM533dUfLlA1U4mfLSLmpH8Qy/xUT1+AaQUn2iMFplob4Tplh74C22
        rd3PLUWtITGRXUeQdmkcimSXw7URd+psCSOWBFhJ8A==
X-Google-Smtp-Source: ABdhPJyq8TnYEmj5N3TDgDxEQ+7LEfs//gKfhBfewYP5TgeLHDcSCnq84n3Chlc6Zy3MWdsTAjYGHoh8vOWMSYDErMA=
X-Received: by 2002:a19:c218:: with SMTP id l24mr16789090lfc.529.1619522022816;
 Tue, 27 Apr 2021 04:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com> <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
In-Reply-To: <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 27 Apr 2021 13:13:31 +0200
Message-ID: <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
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

On Mon, Apr 26, 2021 at 8:18 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Apr 26, 2021 at 2:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > I think the Rust proponents should be open to the fact that their
> > work will eventually depend on themselves or someone else
> > fixing a working compiler for the maintained architectures in
> > the Linux kernel one way or the other, so they will be able to
> > work with Rust project anywhere in the kernel.
> >
> > For example m68k is not going away. Avoiding this question
> > of compiler support, just waiting and hoping that these old
> > architectures will disappear is the wrong idea. The right idea
> > is to recognize that LLVM and/or GCC Rust needs to
> > support all these architectures so they can all use Rust.
> > Someone needs to put in the effort.
>
> The RFC does not avoid the question -- please note it explicitly
> mentions the architecture/platform support issue and the current
> dependency on LLVM, as well as the possible ways to solve it.

OK true. Sorry for being sloppy.

Actually my reply to Wedson brought up a new issue, which is the
quality of learning resources and the lack of an equivalent to
The C Programming Language book.

> But even if we did not have the issue today, it seems like starting
> with drivers and other "leaf" modules is a better approach. There are
> several reasons:
>
>   - If for reason reason we wanted to remove Rust from the kernel,
> then it would be easier to do so if only "leaf" bits had been written.
>
>   - We cannot compile the Rust support without nightly features yet,
> so it does not seem wise to make it a hard requirement right away.
>
>   - Kernel developers need time to learn a bit of Rust, thus writing
> subsystems or core pieces of the kernel in Rust would mean less people
> can understand them.
>
> Given that drivers are a big part of the new code introduced every
> release, that they are "leaf" modules and that in some cases they are
> only intended to be used with a given architecture, they seem like a
> good starting point.

I'm not sure I agree with this.

I think a good starting point would be to either fix Rust support in
GCC or implement some more important ISAs in LLVM,
whichever is easiest. I don't mind having just *one* compiler but
I mind having *a* compiler for every arch we support.

The situation for LLVM is very well described in the Wikipedia
entry for LLVM: "but most of this hardware is mostly obsolete,
and LLVM developers decided the support and maintenance
costs were no longer justified" - this is what I would call
deprecationism (deletionism). I think this is a detrimental force
for both compilers and kernels. It encourages developers of
compilers and kernels to do the wrong thing: instead of
rewriting their compiler and kernel infrastructure such that
maintenance of older ISAs and architectures becomes a bliss
they do what mathematicians do "let's assume a simpler
version of the problem". And this results in a less versatile
infrastructure and less adaptable code in the end. Which will
affect how agile and adaptive the software is. And when
something new comes along it hits you in the head.

Portability to old systems and ISAs is a virtue in itself
because of the effect it has on code quality, not necessarily
for the support itself.

Deprecationism is more the side effect of a certain business
strategy to toss new technology out every quarter without
having to care about aftermarket or postmarket too much.
This irritates people to the extent that there is now even
a project called "PostmarketOS" (Linux based). It is not
sustainable to use an emotional argument, but that is really
not my point, I care about code quality and diversity of
ISAs and target systems improves code quality in my book.

I might be an extremist, but I do need to state this point.

Yours,
Linus Walleij
