Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386043D03E0
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 23:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhGTUt1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 16:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbhGTUtN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 16:49:13 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EBAC061574
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 14:29:47 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id d17so217848ljq.12
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lD7MSr2tHShwP24PsDQ+AQ045DheEanjMiBeVzyowZM=;
        b=V1vQhpEk0nUsfOn4JiW4a32yiqit8hnxNX8BpCSbJi8H1nLmRPdqpupHi3VLsfwDNq
         KC1UZap1tiEKAda3Lre4Ew+fUaQgN2M3Gp79qdhjjje2HPrUgZ/8i+6T40p6gkTjwftW
         CZudVHWWpuz3VjviDdQzffdJ+7DS5iB2Pjy09Kd3FRjKYJxE/+ecdC0L/N+hH3qTG4Ey
         mwOPbrvidz9LL8rCluTRyTTkfQLRfge6+FRY/0/jSFgaId0VJi0zqM3/SQeEvXFr6uDf
         EuwrKROyGHF1BFxtFUyEHgG54uHnQDud0pgFqVhPnWT/rXBA3f6i6HUa1+SY0fqCsSv4
         TzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lD7MSr2tHShwP24PsDQ+AQ045DheEanjMiBeVzyowZM=;
        b=uIX/4BjqNo9oQVoWZ0QhzufLmkBW5zdZ+jBTNRaIwIitJFq5fI0c4lG6HD8lFMJz8G
         yGO+r+T4O3tpeggWQY43JO+vf5Pw/Jp0pa9b7sW1pX6Xtge9j0Za24JbQNUdtRmPXHBg
         bWo++T2qv9kp5Mf+V/w2fjqCsldNReyhy4A5UQP38dkZf57JZXKycWA/nS2x9/KHR5os
         WaIZS3qPsSWXeq6tYUH04/6qcV6GzkLpEzZwmyZyswFX1geyS7McKRk6PUCw1xmzX66D
         sn2zKmqsIJZjID2yGw22RL1yg1P5F27P0/rGXV6W9w9RA17B20DSwqatXyV4weBPeI1Z
         dHng==
X-Gm-Message-State: AOAM533jqHbjxGSkWZhubAzHllMWmIQ83jmTEfX7c2Q21ljC91B7hyl/
        CyAe9Pj7MLFOPFUQo/4Igl3Y3Cn9WDOzlAeIaapJBQ==
X-Google-Smtp-Source: ABdhPJy2KiMdz7KfGiMYgZETgo0ONCU5xQ7QpOBa3+v9uTiyXYesMI5VQvqBe24MELTiidv9lgno9qVT59w6KSkowow=
X-Received: by 2002:a2e:a911:: with SMTP id j17mr28176107ljq.341.1626816585818;
 Tue, 20 Jul 2021 14:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 20 Jul 2021 14:29:35 -0700
Message-ID: <CAKwvOdkvju7heeNpk87brsjkhXHbdKFsUgf63KWhXox9rDkQsA@mail.gmail.com>
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
> But clang has become a primary compiler for some kernel communities,
> and I think it might be time to just re-visit that entirely.
>
> In particular, I think we should just make it a Kconfig option. I hate
> the command flag stuff so much, that my clang tree literally has this
> patch in it:
>
>     -CC = $(CROSS_COMPILE)gcc
>     +CC = $(CROSS_COMPILE)clang
>
> so that I can just do the same "make -j128" in both my gcc tree and my
> clang tree.
>
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

I will concede that "why do I need to respecify all of my command line
args/env vars to make when I already did so for a configure step?" is
a reasonable question to ask, and may be worth pursuing.

There's still some that we can eliminate for BOTH configure and actual
build, like CROSS_COMPILE. :^)
-- 
Thanks,
~Nick Desaulniers
