Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98EBF3C2246
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 12:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhGIKeh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jul 2021 06:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbhGIKeh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jul 2021 06:34:37 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CA1C0613E7
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jul 2021 03:31:54 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id i5-20020a9d68c50000b02904b41fa91c97so4570159oto.5
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Jul 2021 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Ag9cLTRzEt3rLWB36U/GaTidnQngHz1mFDbPHdbYJM=;
        b=sy+60CShYu2+iBbLulb6BXcdNl+YIgSb+jajYjDZa4zuiim9DZxtK88a9BSEKRhPbe
         2149xKE135XoG+YMIvJKNw6ZCj+Hh+EyWUQfK08pHq86IYtTdGJTm+svEvs37g5Uc5aC
         xngQeJK55dnd2ThJlBq5eYZYae9d0PV6/iYXED9E2qqxOYHyQkUpxQ8hj9KF/zDuFrT9
         tgJPN39rPw0sSVwFi7t4ZBZBflf0sauWKsDv5fafUbt1gGs3lfO03jiHBYX5NnqsSVoi
         /ujWD+DqEO4PATTm5/8r52LotGJ0RL6BBjZ8Ui/OZxRKJiFG0Xe11t+2cPco8FTtPijx
         5Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Ag9cLTRzEt3rLWB36U/GaTidnQngHz1mFDbPHdbYJM=;
        b=rCIVdbSf4dZQJtYmHW0Jgb90xBMUvd4FlDKA8uycEoYBT0UL2fzJGLJwLnLmaAIkHB
         eXyxEsLf2oKL3prcesKWhhPndi4tBqael6ml3uZTl0AxR99MLmoWELcLWpKLkMsl5+c0
         sd6gdeZ+r3jkUCXzm4vDrwbuBW8nygR0kkilQSB5Or6JRTuru1ZejYmDdi3v+nx779f7
         6u0T2RU2eV+BYPGGQ9DNW05ogazXjuhEHuUGimjXcicBQtYD/uM0QeDIohz8BWOgnPFn
         FnG29qQnx3fAI7khvfFvvuZCl9cVl+hnzC62W1j/1Hj7F/fDje6d/n0CNuoeOk5Udea7
         NgQg==
X-Gm-Message-State: AOAM531UVrmNEyZjkHtlOAcuvdABuDd577Z1bt2ykVx6zYck/w8NNQS8
        M5MEwTcoDGNVd9iamIETDEz51hlN6Vr5lxQH6/hUUQ==
X-Google-Smtp-Source: ABdhPJzZsHc3H6ZMG5NBT8zSvR+UmJMGAQPOW7Oty1uNxYZb5VbOU1cqW4degb+Ls5Psx+gb8Y7wOEkrsU6h6jHMP2U=
X-Received: by 2002:a9d:d04:: with SMTP id 4mr29227829oti.251.1625826713387;
 Fri, 09 Jul 2021 03:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-6-ojeda@kernel.org>
 <YOV/oj0rjHhzluH2@elver.google.com>
In-Reply-To: <YOV/oj0rjHhzluH2@elver.google.com>
From:   Marco Elver <elver@google.com>
Date:   Fri, 9 Jul 2021 12:31:41 +0200
Message-ID: <CANpmjNMOou5DccZvGAcy4U7iqoLk6NRuTFkd-6JzTmoSFR+YYg@mail.gmail.com>
Subject: Re: [PATCH 05/17] rust: add C helpers
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>,
        Yuki Okushi <jtitor@2k36.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 7 Jul 2021 at 12:19, Marco Elver <elver@google.com> wrote:
> On Sun, Jul 04, 2021 at 10:27PM +0200, ojeda@kernel.org wrote:
> > From: Miguel Ojeda <ojeda@kernel.org>
> >
> > This source file contains forwarders to C macros and inlined
> > functions.
>
> What is the story with Rust and LTO? Intuitively, I would expect Rust
> code to only perform optimally if the kernel is built with LTO
> (currently only supported via Clang).

I'll answer my own question: it looks like Linux Rust code currently
does _not_ generate LLVM-LTO compatible object files, but only native
object files (which still link fine if LTO is enabled, but doesn't
permit the optimizations below we'd want).

rustc already supports playing nicely with LLVM LTO via `-C
linker-plugin-lto`:
https://doc.rust-lang.org/rustc/linker-plugin-lto.html

So, hopefully it should only require kernel work to make it play
nicely with CONFIG_LTO_CLANG.

> Because if calls to every one of these helpers are real calls, I would
> expect performance to be pretty poor. There's probably a reason these
> are macros or inlinable functions.
>
> I would almost go so far and suggest that CONFIG_RUST be modified as
> follows:
>
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2028,6 +2028,7 @@ config RUST
>         depends on HAS_RUST
>         depends on !COMPILE_TEST
>         depends on !MODVERSIONS
> +       depends on LTO || EXPERT
>         default n
>         help
>           Enables Rust support in the kernel.
>
> [ I'm sure there are configs that don't yet work with LTO, but could be
>   useful to enable for debugging or testing purposes, and therefore would
>   make it conditional on CONFIG_EXPERT as well. ]
>
> [...]
> > +unsigned long rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
> > +{
> > +     return copy_from_user(to, from, n);
> > +}
> > +
> [...]
>
> From some local tests, it looks like simply attaching
> __attribute__((always_inline)) will do what one would expect when
> compiling with Clang LTO (I checked -flto=thin).
>
> If you confirm this also works across C and Rust TUs when enabling LTO,
> I would then suggested adding __attribute__((always_inline)) to all
> these helpers.
>
> Thanks,
> -- Marco
