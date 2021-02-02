Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCB630B81D
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 07:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbhBBG4A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 01:56:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbhBBGz5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 01:55:57 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28574C061573;
        Mon,  1 Feb 2021 22:55:17 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id e1so18098113ilu.0;
        Mon, 01 Feb 2021 22:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=WpSVmsY/faKm4dlJ146DwBtmdLNrKsjKH+DPaGAQX+I=;
        b=OZqDDd5Ny9VuN97WfkF/h5hU3G62luzkxXm7s+Jd/8ciJdCdb0QqoIE12nanVHd6xH
         gYS/TQgRjabNW4XaBniEhB8En1LjBj8R1vJMtAEiUhlvDmOc3qUW6jxwwR0G563E6lTM
         i5sgHbklJK/VAPCnvmahlmgL7zC2u7MRmLs1VM+UpGf5BAQAr2rzfrGlURazfcQFu18S
         04o1BqXuJ69jldRnzTH53phHqWo1tyoO/j2o2f4rcGJI7bfLzr1VVw8D5YMKrdgcPWfy
         UNhs6qBnCMqaC/H0LsEk9+Lff2PQah8NQkXfFWbSO1dmj/cpdCicdrtHJpOowFj56gJU
         kDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=WpSVmsY/faKm4dlJ146DwBtmdLNrKsjKH+DPaGAQX+I=;
        b=itaa9GSTzOdYHvtT+dEUecQAzpsI1LPQwBrH1ILGMy+ou1fJL5haFUDgfVJKp1wv7P
         gp18EowKSidlswftHOGLiKzWIUqdBoKL3GxfzMg97xOZx/5uH5C4GxOG7xahu497XC/o
         5O8uNJFM5uuakpwY4pe1S7dqF9BFrYNAIqe9BBRAEs76djsaiZGnDluAYmRI9iF62ena
         IuHX1cCcdn9ZX74meyYZ1m9mMQBiFlhHl71e/OaUvG0+H9C/PBs9uZwaPL57eOeId3Mc
         +n4o4dxLS3hhsbf+iySoXNtZOdVHQTnFi5iuOZCc4U/A81HbSqU1FmXKEosN7Dapv1X6
         58mQ==
X-Gm-Message-State: AOAM533qoDoa7LcdjHXHBOdZYkjrl9ise79wL8su1ZpGs0GOv4OcGuz/
        uToqYpnS25vL8bU0TNCpnwDCwEMdBAlbqtCxy6A=
X-Google-Smtp-Source: ABdhPJzR7J7yG3We/nSZ4pNDfkwB27b27HUXKmBK1UqfouKgrPQ8tcm0WxcYJmqAXYKy6SgYTJZVmYYBfbHjpFxdRbM=
X-Received: by 2002:a92:444e:: with SMTP id a14mr315234ilm.215.1612248916528;
 Mon, 01 Feb 2021 22:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20210201010819.655597-1-masahiroy@kernel.org> <CAKwvOdnECGDFe=n6ms0Aj7FB0sN7ktZyk4dyVvV0UTgPvpuWpA@mail.gmail.com>
 <CAK7LNATSna9f8cd5Lm=zx2vfJzk=WUnAUkA8V593O304zTx=vQ@mail.gmail.com>
In-Reply-To: <CAK7LNATSna9f8cd5Lm=zx2vfJzk=WUnAUkA8V593O304zTx=vQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 2 Feb 2021 07:55:05 +0100
Message-ID: <CA+icZUVDG1AHHrOcRua3qdA7_5vtJONOt1K3XgQiuWcydmRkjg@mail.gmail.com>
Subject: Re: [PATCH] scripts: switch some more scripts explicitly to Python 3
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-spdx@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 2, 2021 at 7:10 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Feb 2, 2021 at 3:28 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Sun, Jan 31, 2021 at 5:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > For the same reason as commit 51839e29cb59 ("scripts: switch explicitly
> > > to Python 3"), switch some more scripts, which I tested and confirmed
> > > working on Python 3.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Thanks for the patch. It's time to move on from Python 2.
> >
> > It looks like there's already a patch in -next for scripts/spdxcheck.py.
> > ("spdxcheck.py: Use Python 3") by Bert Vermeulen.
> > https://lore.kernel.org/r/20210121085412.265400-1-bert@biot.com
>
> OK, I dropped the spdxcheck.py change in v2.
>
>
>
> > What about:
> > scripts/tracing/draw_functrace.py
> > scripts/show_delta
> > scripts/jobserver-exec
> >
> > Or do those need additional source level changes?
>
>
> I touched jobserver-exec in this patch:
>
> https://patchwork.kernel.org/project/linux-kbuild/patch/20210201010024.654526-1-masahiroy@kernel.org/
>
>
> I have not tested draw_functrac.py or show_delta.
>

As Debian/testing - upcoming bullseye release - has moved to python3.9
(3.9.1-3) as default I am interested in the kbuild transition to
python3.

Is it possible to have a Git branch in kbuild.git especially for this
transition?

Honestly; I lost a bit the track of all kbuild/python3 patches.

Thanks.

- Sedat -

> > > ---
> > >
> > >  scripts/clang-tools/gen_compile_commands.py | 2 +-
> > >  scripts/clang-tools/run-clang-tools.py      | 2 +-
> > >  scripts/spdxcheck.py                        | 2 +-
> > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> > > index 19963708bcf8..8ddb5d099029 100755
> > > --- a/scripts/clang-tools/gen_compile_commands.py
> > > +++ b/scripts/clang-tools/gen_compile_commands.py
> > > @@ -1,4 +1,4 @@
> > > -#!/usr/bin/env python
> > > +#!/usr/bin/env python3
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  #
> > >  # Copyright (C) Google LLC, 2018
> > > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> > > index fa7655c7cec0..f754415af398 100755
> > > --- a/scripts/clang-tools/run-clang-tools.py
> > > +++ b/scripts/clang-tools/run-clang-tools.py
> > > @@ -1,4 +1,4 @@
> > > -#!/usr/bin/env python
> > > +#!/usr/bin/env python3
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  #
> > >  # Copyright (C) Google LLC, 2020
> > > diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
> > > index bc87200f9c7c..cbdb5c83c08f 100755
> > > --- a/scripts/spdxcheck.py
> > > +++ b/scripts/spdxcheck.py
> > > @@ -1,4 +1,4 @@
> > > -#!/usr/bin/env python
> > > +#!/usr/bin/env python3
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  # Copyright Thomas Gleixner <tglx@linutronix.de>
> > >
> > > --
> > > 2.27.0
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Best Regards
> Masahiro Yamada
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNATSna9f8cd5Lm%3Dzx2vfJzk%3DWUnAUkA8V593O304zTx%3DvQ%40mail.gmail.com.
