Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84017199F4F
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 21:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730105AbgCaTky (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 15:40:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45171 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730408AbgCaTky (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 15:40:54 -0400
Received: by mail-pg1-f194.google.com with SMTP id o26so10823509pgc.12
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2020 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1k2Wmff8smQkle9ahxWlMJVScKrQOt29svFTAK1Lhr8=;
        b=QVvuXjA67ZcCCqygGJUKSlPMfyHK0xdJ6Rw61Gqsg30dzIu5NMOUp/9yY3nEfYRnj8
         AdLJ9oB9xMb2+2aB63EtqF14AeDIKJjjAbnw4MVEUfWAd8dfT7QzGqvvFe+BJQfEmwph
         Ok0JFzTKfoHgmRGub5+uaQNh55Cu+xLH/U8++emKAIMo9KN9XvIE4fO7i9bK17XWIPY8
         hFtRzu7sQQ9xgW4BgM+QEYPmw3DLgpVtCwS/W5a851N6aU+llEAUPUqNZa7OHvhB8MVr
         arVj9aP0vGpmgJbyLdDL9zDat6PKlEA59Zg3j7NQELuQn6/xulzwTuRwN1nLkED3CvAC
         Zw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1k2Wmff8smQkle9ahxWlMJVScKrQOt29svFTAK1Lhr8=;
        b=nNReM8wgJgTgWEQs1dyjIvkSMbOcK+73hhAII1a8OX2uM1YjrqitTwd4zCrZ2x95HW
         2zVuHTA49PQVaq60Qhem4v8SD+V/z01rol3jne8YkYQWIQdUAsn1wrDnMrJWtXxOcixc
         qCJQDStx9pfabZtTo3oQ8glqpSfxTheu0gJ3pazZkAIihfEUwnySfPpsiBsoFvBtB4jr
         b4tdsvh5jrpZaBwghFp/IEC0BZlJVFwZpNjOLY9k3U+AKk5LqIejdoohMC1OYxv6QNQK
         uMHTqDQrXkwhYY6CwJo9Jas2T5b9RHi3MozROKXXvgJJY+0i1vLr/tqfE+X4sDUNZsW1
         W5WA==
X-Gm-Message-State: ANhLgQ0AvGSHx/Mt9u2kowXS3VyWkhB6XFpFJVRpjmOJWJg+FVpSuykn
        cR43cB3RCJV03vIIBFzrd6rMCG4FdiSukDgX8jHqew==
X-Google-Smtp-Source: ADFU+vvmC7Wvr2s2YSmUeaO3tF2LUvcQXFiCa14tYL5/nWsE4n65TMY9KMQcIRj1rXRAe7KJRoZ0BUAqlxhBkXYwsJU=
X-Received: by 2002:a05:6a00:42:: with SMTP id i2mr19631475pfk.108.1585683653136;
 Tue, 31 Mar 2020 12:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86> <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86> <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
 <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
 <20200330190312.GA32257@ubuntu-m2-xlarge-x86> <CAK7LNAT1HoV5wUZRdeU0+P1nYAm2xQ4tpOG+7UtT4947QByakg@mail.gmail.com>
 <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com> <20200331193544.GA55810@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200331193544.GA55810@ubuntu-m2-xlarge-x86>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 31 Mar 2020 12:40:42 -0700
Message-ID: <CAKwvOdnY64uo=73P2qkJkMbFxPTX8v7gC0cfxFndpaqsQ_c-CQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 31, 2020 at 12:35 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Mar 31, 2020 at 11:39:27AM -0700, Nick Desaulniers wrote:
> > On Mon, Mar 30, 2020 at 11:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > In fact, the debian provides multiple versions of GCC.
> > > For example, my machine has
> > >
> > > masahiro@pug:~$ ls -1 /usr/bin/gcc-*
> > > /usr/bin/gcc-4.8
> > > /usr/bin/gcc-5
> > > /usr/bin/gcc-7
> > > /usr/bin/gcc-ar
> > > /usr/bin/gcc-ar-4.8
> > > /usr/bin/gcc-ar-5
> > > /usr/bin/gcc-ar-7
> > > /usr/bin/gcc-nm
> > > /usr/bin/gcc-nm-4.8
> > > /usr/bin/gcc-nm-5
> > > /usr/bin/gcc-nm-7
> > > /usr/bin/gcc-ranlib
> > > /usr/bin/gcc-ranlib-4.8
> > > /usr/bin/gcc-ranlib-5
> > > /usr/bin/gcc-ranlib-7
> > >
> > > But, nobody has suggested GCC_SUFFIX.
> > >
> > > So, I guess CROSS_COMPILE was enough to
> > > choose a specific tool version.
> >
> > Or no one was testing specific versions of gcc with more than one
> > installed.  I can ask the KernelCI folks next week if this is an issue
> > they face or have faced.
>
> Well gcc is just one tool, so specified CC=gcc-5 is not that
> complicated; it would get a lot more gnarly if one had different
> versions of binutils as well.

Have you had to test different releases of binutils yet? I have, and
it was not fun.  I don't even remember what I did but I recall it
being painful trying to get it to work.  (I think I finally solved it
via temporary symlink).  Speaking of, I should get back to those
dwarf-5 patches I started, now that binutils devs implemented every
missing feature I could find.
-- 
Thanks,
~Nick Desaulniers
