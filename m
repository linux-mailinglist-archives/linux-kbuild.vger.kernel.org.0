Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD903D03DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 23:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234264AbhGTUrJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 16:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbhGTUqt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 16:46:49 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6F8C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 14:27:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id t20so276766ljd.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tNyYA05ylU2XvRUfrq05bnLIwQDYxkRccZveeJvkl54=;
        b=nyPyS8j29YzOV3W5hC0WKKPhbhG/VyL5LXoVZNrXlICf1TF0yf/aaVryX160Fi3Dlq
         NyBK/+QQm5fJUpSdjV1mhcvj/ENGOOYnMBeiMXYHWSR60QlwUzS835imVP+P6M7H1YRj
         p96qmwII9W3WT9cbOBnBiWAWYx26tr/n7iLkOMoWXXSu02/QjELIlHllDlHzaUHsL8QP
         TV+x7Ys34raApA9sK3A5QE72qZ2lxfBQTnSJ0LgV9U3edO0+2SMba+ChpV0dxHVZdRnc
         JxKJLgaNbOQy2jaLd0FlXpHaE2Cl4aN452zhcuh6RssvdCQd624ZPU0qzTEj34rNzAs1
         RiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNyYA05ylU2XvRUfrq05bnLIwQDYxkRccZveeJvkl54=;
        b=SyuNl0OYSM6S/c7/eLQJU0Me2wK9SdbDh/ZzmJFW4UPdApiyjiCRu1Bb0K3Uqx8ij1
         OgnrnOJKUWN5E1lPpRycPq1GdYaE813At2s1wYs7x5yUkqVg8zwyjbtceke4Ruf8eX25
         kY2r2BjQB0VJ1Aj7n4+NGUcKv24v8K8wDK67V65Myyt7+AZHtO6h4t6LAk0K1MXKP0zv
         8mH65+aroIUvUDWnMyJC82DFIp04uyEDTza2U7GzYXyupqRlrAoUx11B7EGv4SlKYRMU
         10w5S7MYDDPq6OgL0X77N+qiawu5xUhWXs1Zxr/udQiT/woYOFTfyu0YCQTi1x34z7qR
         Ns1w==
X-Gm-Message-State: AOAM530YJNFzmFjCIm8LYBhZZ6BYMICm4zRUQNF+PtMhEgloJW02bsgQ
        a9GyDBPo1i92S/UK9YeJmxssYWtIb/hfSnKv+4V/Gg==
X-Google-Smtp-Source: ABdhPJxrOj+Jm37rU9hqwWfFoY2vsD5IZ88MYg7a5i30OSi5oVHFIzKL+6LR32Xlpue7pPsvCxVG/IYkWw/LWIe7BqE=
X-Received: by 2002:a2e:a784:: with SMTP id c4mr3289166ljf.479.1626816440772;
 Tue, 20 Jul 2021 14:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAKwvOdn065OJpow=7VF=ujagFoyN4sYMKAA_E2_39ZC7uThchg@mail.gmail.com> <CAHk-=wjDdDPDa6mfoC-QM=NZULsmQfcUbF2RdwMq0J4Ztm+UAw@mail.gmail.com>
In-Reply-To: <CAHk-=wjDdDPDa6mfoC-QM=NZULsmQfcUbF2RdwMq0J4Ztm+UAw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 20 Jul 2021 14:27:10 -0700
Message-ID: <CAKwvOdk7ATbLP9uRVgWnYHQT0BKAuOTPmOeWdZgytTs=bqTLfw@mail.gmail.com>
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
        Nathan Chancellor <nathan@kernel.org>,
        Tom Stellard <tstellar@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 20, 2021 at 2:11 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Jul 20, 2021 at 1:52 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > >     -CC = $(CROSS_COMPILE)gcc
> > >     +CC = $(CROSS_COMPILE)clang
> >
> > So you haven't been using LLD... :( (imagine using more than one
> > thread to link, and being faster than ld.gold)
>
> I started out just building my own clang - nothing else.
>
> And now that I'm using the distro clang, the linker isn't even _close_
> to a performance issue. Since clang is a big, slow, bloated pig.
>
> I posted profiles and performance numbers of clang being three times
> slower than gcc, and it was all just clang itself, not the linker. All
> due to insanely expensive startup costs.

Yeah, it's unfortunate that package maintainers for your distro chose
to distribute clang built in such a manner.  But in response to that
thread:
1. I planned a whole conference around how folks distribute LLVM
(particularly how the configurations are done, and important ones to
use):
https://lists.llvm.org/pipermail/llvm-dev/2021-June/150861.html
We have a pretty good set of CFPs lined up (and I need to go chase
folks from Apple and Qualcomm that are working on proposals...)
https://github.com/ClangBuiltLinux/llvm-distributors-conf-2021/issues

2. I brainstormed a whole set of ways to make Clang even faster.
https://github.com/ClangBuiltLinux/tc-build/issues
Most promising I think would be building musl with LTO and statically
linking that into the toolchain.  I don't have a ton of time to pursue
that, but I will continue to bang on that drum in front of management.
It's just very hard to fund improving build times for users on
thinkpads when the corporate world has moved on to distributed and
cached building in the cloud.

3. Pretty sure we've resolved that config with your distro's packager,
and made other changes to upstream LLVM to default on some flags that
help a lot when those unfortunate configs are used.
https://reviews.llvm.org/D102090

> I suspect a lot of clang users build bloated C++ code where the time
> to compile a single object file is so big that the startup costs don't
> even show up. But for the (fairly) lean C kernel header files that
> don't bring in millions of lines of headers for some template library,
> startup costs are a big deal.
>
> So honestly, I don't care at all about "imagine being faster than ld.gold".
>
> I can only _dream_ of clang itself not being 3x slower than gcc.

Let's be precise here, because quotes (even when imprecise) lead to PR
cycles.  Clang startup time for NULL input when testing command line
flags as part of a build configure step, when clang is misconfigured
is slower than GCC. Clang is not generally 3x slower than GCC.
-- 
Thanks,
~Nick Desaulniers
