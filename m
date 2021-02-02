Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9DE30B7AC
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 07:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbhBBGLP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 01:11:15 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54889 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhBBGLO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 01:11:14 -0500
X-Greylist: delayed 104440 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Feb 2021 01:11:13 EST
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1126AFmT030335;
        Tue, 2 Feb 2021 15:10:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1126AFmT030335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612246216;
        bh=2faiPUU1kCn9CAla/zsNtBG+tChwSI/0/LPuqDKvFFo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xeb4ljx2coq4CTT4KH1ixIBqET/OVNoJqOAgpVpvmJ103knAnHtg60AJuqDrpSiqJ
         Q3Dh/vA6bHO/WaBQq2oJHZRUnGZJsSg6J49C7mbxE2JGMx/mO3JASVvH3HuHmFCzp/
         rhSCM7FTPX7xQ+y6KaSsni4vdUd8701HF/wnPU4oBU3a04ZpPQ4cI2wb4OnUPIraKV
         D1/9PERUB6usDkNqSUMBCiASeM6BMOSFbrNlIk7sLklXAIVubMvRVzoM8ZoxabaWhG
         Pl2QEY8rVbeK8y4m5EuMfk3DXn5UylBAQcdMz9ok5t8LwrbC3eJXTQHIWLL7yJUwH+
         pmpd//aSFqRgA==
X-Nifty-SrcIP: [209.85.216.46]
Received: by mail-pj1-f46.google.com with SMTP id nm1so1606434pjb.3;
        Mon, 01 Feb 2021 22:10:16 -0800 (PST)
X-Gm-Message-State: AOAM530/q++j0gfcP5DELgw3oeOfNcu6r8k9V//SXHBxyFICkoAVL4T0
        ILpYj8taoBM7y2jhboYPHfTnEFcqWEkTwvHoezs=
X-Google-Smtp-Source: ABdhPJy7XtWW44+kUNWZz3iSggbI/ZB+xZxQGW6Cm9nmgZ7xrISemk/yF6L0G4Eu04oKtOWs4LsXiCS8a53x3ygpfo0=
X-Received: by 2002:a17:90a:184:: with SMTP id 4mr2633282pjc.87.1612246215253;
 Mon, 01 Feb 2021 22:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20210201010819.655597-1-masahiroy@kernel.org> <CAKwvOdnECGDFe=n6ms0Aj7FB0sN7ktZyk4dyVvV0UTgPvpuWpA@mail.gmail.com>
In-Reply-To: <CAKwvOdnECGDFe=n6ms0Aj7FB0sN7ktZyk4dyVvV0UTgPvpuWpA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 2 Feb 2021 15:09:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNATSna9f8cd5Lm=zx2vfJzk=WUnAUkA8V593O304zTx=vQ@mail.gmail.com>
Message-ID: <CAK7LNATSna9f8cd5Lm=zx2vfJzk=WUnAUkA8V593O304zTx=vQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: switch some more scripts explicitly to Python 3
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
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

On Tue, Feb 2, 2021 at 3:28 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Sun, Jan 31, 2021 at 5:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > For the same reason as commit 51839e29cb59 ("scripts: switch explicitly
> > to Python 3"), switch some more scripts, which I tested and confirmed
> > working on Python 3.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks for the patch. It's time to move on from Python 2.
>
> It looks like there's already a patch in -next for scripts/spdxcheck.py.
> ("spdxcheck.py: Use Python 3") by Bert Vermeulen.
> https://lore.kernel.org/r/20210121085412.265400-1-bert@biot.com

OK, I dropped the spdxcheck.py change in v2.



> What about:
> scripts/tracing/draw_functrace.py
> scripts/show_delta
> scripts/jobserver-exec
>
> Or do those need additional source level changes?


I touched jobserver-exec in this patch:

https://patchwork.kernel.org/project/linux-kbuild/patch/20210201010024.654526-1-masahiroy@kernel.org/


I have not tested draw_functrac.py or show_delta.





> > ---
> >
> >  scripts/clang-tools/gen_compile_commands.py | 2 +-
> >  scripts/clang-tools/run-clang-tools.py      | 2 +-
> >  scripts/spdxcheck.py                        | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> > index 19963708bcf8..8ddb5d099029 100755
> > --- a/scripts/clang-tools/gen_compile_commands.py
> > +++ b/scripts/clang-tools/gen_compile_commands.py
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3
> >  # SPDX-License-Identifier: GPL-2.0
> >  #
> >  # Copyright (C) Google LLC, 2018
> > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> > index fa7655c7cec0..f754415af398 100755
> > --- a/scripts/clang-tools/run-clang-tools.py
> > +++ b/scripts/clang-tools/run-clang-tools.py
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3
> >  # SPDX-License-Identifier: GPL-2.0
> >  #
> >  # Copyright (C) Google LLC, 2020
> > diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
> > index bc87200f9c7c..cbdb5c83c08f 100755
> > --- a/scripts/spdxcheck.py
> > +++ b/scripts/spdxcheck.py
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/env python
> > +#!/usr/bin/env python3
> >  # SPDX-License-Identifier: GPL-2.0
> >  # Copyright Thomas Gleixner <tglx@linutronix.de>
> >
> > --
> > 2.27.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
