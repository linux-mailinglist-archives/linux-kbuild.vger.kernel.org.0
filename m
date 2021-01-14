Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE372F57C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 04:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbhANCGa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 21:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbhANCGZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 21:06:25 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FB3C061786
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 18:05:45 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id p15so2155558pjv.3
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 18:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2y4dk7RPy1+H0zBuDXTEaauzgo/RetPwOeAaLDfjsos=;
        b=UpT9ATiPlrxe65QqRf52h7JcDgIOjOU50wd3rc5S9/fV1avkZ2eqPth/QvTvho4x9w
         qsTlhFHkubqvIgFbgFHx92IbNW4Y3kv8zfzJfv4tAuMY/DtxjjfucLRzjFgpIcN82NFu
         /FE54vyYFFQtcmNzhkpjpGtv04Mnk6SM9dkBZ53AhH9ruh4Qf2WIYv+Z+qI9BxN8s9QF
         U/eGBztIpNLXb+49weYiN70xs4ZdpUMCKIIKsImGXNuVcKfiEPOAjj7VeNUV3hiuDx+0
         rimY09LTPOCmJZLN0mvnpkZ5D3ycFug3NZKq8vIC086Xu565ybhjJ+ZeQ9cf78tGVMfE
         1khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2y4dk7RPy1+H0zBuDXTEaauzgo/RetPwOeAaLDfjsos=;
        b=U0lrrAaIYM8AFRBiLizQVaVfS3Aozy1ga8ewWu0hVeo5MCo1iGbAh9al6XGvjpVtKG
         YhFWTcEpYcnp5OjBEp4d0x8oJiC3BwHm7oA0Qb7G7D6kRh+yzKwLdpFAI2Upxnqsgb2A
         eJB7MzjXmoLw4E+y7RP45dlPX5D/t3iONEQVPxe4FGYzPWIAw4/WhUBxEnjTqawdUfcJ
         TK71GEatwiDhCE/O1aWJIXA8+7y4MKchccwv1vWFdqZB6mG5Y12abCkC18HENtcRrRQm
         x92pchZOFdiHP7UVr8q/9wQNNgjE3L2wqof5y2s/YeyGRkWqO/eHNiTRAUtBpMGL893j
         oyYQ==
X-Gm-Message-State: AOAM530tro33jHjd3qXlE6TMP+3PsEaaJBsKJTvXsQOvppzGmIuaU7zm
        uOjgYxhQuXrKanfbKBOuX/aHIEw1jwCE/UCcQfYODA==
X-Google-Smtp-Source: ABdhPJzzbSwVqR4cFKreQ20J4RGA70jhmZkdQ+qNkNyV4tIa56erUcX5ihAZGP5O/T6NW0QfyYQS2oDli/oYDXvJh6s=
X-Received: by 2002:a17:90a:9915:: with SMTP id b21mr2352305pjp.101.1610589944646;
 Wed, 13 Jan 2021 18:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20210114003447.7363-1-natechancellor@gmail.com> <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com>
In-Reply-To: <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 13 Jan 2021 18:05:32 -0800
Message-ID: <CAKwvOdmr7RttdM25wWKiV8t+tzn8W-C_U6avwrQXQWphT8XhXQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported architectures
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 13, 2021 at 5:19 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Patch looks fine, but `make -j htmldocs` seems to be taking forever
> for me so I can't render it. Is this a known issue?
>
> $ make -j htmldocs

Just took a while, lots of warning spew (but not from this addition AFAICT).
Reviewed-by: Nick Desaulniers <ndesaulnier@google.com>

>
> On Wed, Jan 13, 2021 at 4:35 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > The most common question around building the Linux kernel with clang is
> > "does it work?" and the answer has always been "it depends on your
> > architecture, configuration, and LLVM version" with no hard answers for
> > users wanting to experiment. LLVM support has significantly improved
> > over the past couple of years, resulting in more architectures and
> > configurations supported, and continuous integration has made it easier
> > to see what works and what does not.
> >
> > Add a section that goes over what architectures are supported in the
> > current kernel version, how they should be built (with just clang or the
> > LLVM utilities as well), and the level of support they receive. This
> > will make it easier for people to try out building their kernel with
> > LLVM and reporting issues that come about from it.
> >
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  Documentation/kbuild/llvm.rst | 44 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index 21c847890d03..b18401d2ba82 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -63,6 +63,50 @@ They can be enabled individually. The full list of the parameters: ::
> >  Currently, the integrated assembler is disabled by default. You can pass
> >  ``LLVM_IAS=1`` to enable it.
> >
> > +Supported Architectures
> > +-----------------------
> > +
> > +LLVM does not target all of the architectures that Linux supports and
> > +just because a target is supported in LLVM does not mean that the kernel
> > +will build or work without any issues. Below is a general summary of
> > +architectures that currently work with ``CC=clang`` or ``LLVM=1``. Level
> > +of support corresponds to "S" values in the MAINTAINERS files. If an
> > +architecture is not present, it either means that LLVM does not target
> > +it or there are known issues. Using the latest stable version of LLVM or
> > +even the development tree will generally yield the best results.
> > +An architecture's ``defconfig`` is generally expected to work well,
> > +certain configurations may have problems that have not been uncovered
> > +yet. Bug reports are always welcome at the issue tracker below!
> > +
> > +.. list-table::
> > +   :widths: 10 10 10
> > +   :header-rows: 1
> > +
> > +   * - Architecture
> > +     - Level of support
> > +     - ``make`` command
> > +   * - arm
> > +     - Supported
> > +     - ``LLVM=1``
> > +   * - arm64
> > +     - Supported
> > +     - ``LLVM=1``
> > +   * - mips
> > +     - Maintained
> > +     - ``CC=clang``
> > +   * - powerpc
> > +     - Maintained
> > +     - ``CC=clang``
> > +   * - riscv
> > +     - Maintained
> > +     - ``CC=clang``
> > +   * - s390
> > +     - Maintained
> > +     - ``CC=clang``
> > +   * - x86
> > +     - Supported
> > +     - ``LLVM=1``
> > +
> >  Getting Help
> >  ------------
> >
> >
> > base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
> > --
> > 2.30.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
