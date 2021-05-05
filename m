Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC32A373DD5
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 16:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbhEEOnH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 May 2021 10:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233244AbhEEOnG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 10:43:06 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2307DC06174A;
        Wed,  5 May 2021 07:42:09 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id m9so2983469ybm.3;
        Wed, 05 May 2021 07:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T4XfxZaZq47CKwnyWGH3VIAzItUvGF98JVa05cm0EJ4=;
        b=gbtIna15A823UxWQ8KiZ4769tXSVtif/RLtdgeX9uWDg+cuVSJV4atrp8HJ8X3ZpB9
         NVF2kMygWDlHvterIJIVMEDbWweRPYt1t8DBjeupko66Yu1RjklNdu5rqTdFvViJfqRo
         NiB5C+f9Q2aVX9FM4BdGj6RhRAvzYqeOT17lhtAaNqMCaV1FctqgPyP7N4bhn0AnB7Rl
         Eo4baobiVUNeAyus7N6eVYY5TZbXQa0+C9kZJdK29k0NXsYGGw/S55JFOvJGUuXGbJiy
         MAUACY/LcNTxgx23d3lpTWyBW4nVeuTbIfvOy4xHPZCwhUOFpQouZhxilzVNZzqXblQL
         CmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T4XfxZaZq47CKwnyWGH3VIAzItUvGF98JVa05cm0EJ4=;
        b=gNe2NU6+Pp3J18Nk+sp/+jir0IaVLhyqBBN8mdaBHJXJPfmlVQjWNcleQUJnp5kHoc
         GWpCO0YwmIKbtILdwMRwjRynlZrMw+YMyT8H/DSI+BX+rypsl3jq+xDwYulU0UvYMro6
         1TzdW2JTzYvUNu9zI/w1UtHuN2pvivqM8eS/eUZSn6IFd7k6hwnzxK6TCasuWVx629e+
         HL/q1XUBm90y3ewGB0LTzLBnf6eUApxTpaXmCTIH6+1NfcaHhv3Wo6h4kOj9XD1uM2rs
         p3ftzc8VKGWL52arzUJ+f4O89sSjf/nQCpkBa7rHZODjuDZWNcTItQAULzirpw8gXMWO
         iCdA==
X-Gm-Message-State: AOAM5339GZkXoySPs+N55jgR4sHgtkz+6OKTYPUiwT4C72UNEfQHSAGm
        mOm62zVx1r9Se/0rqtxOJTBQMvhd5R4YTANBMf0=
X-Google-Smtp-Source: ABdhPJzciMEHoN9O9+VTTcdf9MnIS5J1InKekAolQeJU8U366NZlTQ0yPSlsG12wbhVfnh/RhfnWqokTIgU1II4fqKc=
X-Received: by 2002:a25:ca85:: with SMTP id a127mr37116107ybg.33.1620225728295;
 Wed, 05 May 2021 07:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com> <7999ba57-9b95-265e-a189-d9ca01304b13@schoebel-theuer.de>
 <53413f58-269a-a1f6-2a97-e33819446609@metux.net>
In-Reply-To: <53413f58-269a-a1f6-2a97-e33819446609@metux.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 5 May 2021 16:41:57 +0200
Message-ID: <CANiq72kjMf=Qv0+9vN45Qg6te1RUCTtmzP=a8X8XS8sriOzbkQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Thomas Schoebel-Theuer <tst@schoebel-theuer.de>,
        Kajetan Puchalski <mrkajetanp@gmail.com>,
        mceier+kernel@gmail.com, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 5, 2021 at 3:59 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> ACK. And speaking for embedded world, 20+ product lifetime is pretty
> common. During that lifetime you'd need to be able to pick out old
> sources, so some changes and rebuild your code and having your system
> still running seamlessly after the update. IOW: long-term
> reproducability is absolutely vital. Linux does much better here than
> many competitors (that eg. need proprietary build tools that don't
> even run later machine generations)

You should be able to rebuild old releases with newer compilers.

Like the major C and C++ compilers keep support for old code and old
standards, the main Rust compiler keeps support for old code and old
"editions" too.

> Yes, and also adding long-term reproducability as another vital requirement.

See my sibling replies to Linus W. on the efforts underway around this.

> Rust seems to be a fast moving target. Even building a Rust compiler can
> be a pretty complex task (if you're not a full time rust developer).

It only takes a handful of commands. If you know how to build GCC or
LLVM, building Rust is about the same complexity.

> Gcc, in constrast, itself can be built on older compilers (even non-
> gcc). How to do that w/ rustc ? According to my observations some while
> ago, it needs a fairly recent rustc to compile recent rustc, so when
> coming with an old version, one has to do a longer chain of rustc
> builds first. Doesn't look exactly appealing for enterprise grade and
> long term support.

Why would enterprise users care about bootstrapping? Companies
typically want to use supported software, so they would use the
pre-built compiler their distribution offers support for.

For companies that want more features, they can use newer versions via
the pre-built official binaries from the Rust project itself, which
are routinely used by many projects around the world. Some companies
are even using particular (i.e. frozen) Rust nightly compilers they
picked.

> Correct, the amount of people who understand rust is pretty low, those
> who also understand enough of linux kernel development, probably just
> a hand full world wide. For any practical business use case this
> practically means: unsupported.

This assumes Rust-enabled kernels will be provided by distributions to
businesses from day 1 as soon as supports gets merged.

Instead, what will need to happen first is that we evolve the support
enough to compile the kernel with a Rust stable compiler, some
important drivers get written *and* distributions start shipping those
drivers in their business-oriented releases.

That will take some time, and interested companies (e.g. for drivers)
and their kernel developers will learn how to use Rust in the
meantime.

Cheers,
Miguel
