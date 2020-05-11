Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657591CDB11
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2020 15:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgEKNTO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 May 2020 09:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgEKNTM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 09:19:12 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69A2C061A0C
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2020 06:19:10 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u4so7471846lfm.7
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2020 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nSnS7Ie9UNZzxFtT0FPY3YdLhDlPLgdcToB0TW/eJg0=;
        b=JoL4nZBSDZztmVrBLOHK7hCH/R93C83xJ8g+4nQTwPOC3pvybxZKQ8jDzL/Pn16UcC
         OW7PpuAjZBExsCIE+cfPrBJzeJ9eUTgpr0IQ3gr6sDH+92v8UvMCjopEW4ZpS2RqphXg
         iPp0tSNcmMHyze+geUPBeMLreZgMirsjuT/SqkTLn1y3vp4o3eBmRcRtM1T83uhc/mtm
         guoHXI4v33wpgxZKoXEPQ+eNT7mYyrcySBEftYTouad+MGWtGH5KUOjk40cFiFpRbgZZ
         6sLaDQtaimgVJHNxtMXqUTtZ2JFeBldWgk8jbSc841TWeU8KfzOLVpG5B9c0JtwOHg+d
         4vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nSnS7Ie9UNZzxFtT0FPY3YdLhDlPLgdcToB0TW/eJg0=;
        b=CF/o6uia9UmPlch3aZJ2fCJMikGILV2CEFTtmcyi/whJiP3wjf989Jng2KcJbQ6nQv
         zf0z8OfQ6HI+uVwQd9mx0/ItYgJgzZCQPa+lw8F4i/EkSJERuQlo/zEqKPgkIio0e3XI
         M3iF5elbiecDmldQeEAzChWklOSewmKy+F6f44ow+acfWoPvxx8F5IkPUDeThwp66tVM
         PCuoPWCgdptE68O3l+2uS62KR3r0cTq29zmA78rEvbpGeYoz+UqoTRvGxxMK4orAeWZu
         X012I0hiwC8Y+YAuIkvI1z+/z79briacaGk3jvXVD04G3AMDp7bBWioHsfKXorzgsmne
         4FBw==
X-Gm-Message-State: AOAM530PNe5vSblRDsot/p0RLJKL/YK4+ZNheeFPV1hcdKc4nI8h1QIo
        rU9ws7FmczgTHU/V210vEpW+6wB/awEjaqV8towsxFEuJ7o=
X-Google-Smtp-Source: ABdhPJyVUXYypgLE/nyWeGyB9xDhwePfsjNO0riSZ2z4h3PL0zyZXlon+1CQvNGe8A8LtGcrB1RK4hdWU7Ds8+ea4Mc=
X-Received: by 2002:a19:c6c1:: with SMTP id w184mr11135402lff.20.1589203147183;
 Mon, 11 May 2020 06:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200505115420.18765-1-anders.roxell@linaro.org> <CAK7LNAR6MeBRhP1A3oc-UVATNN4r2Ru1LUp2=DqiLSKDL9gwOQ@mail.gmail.com>
In-Reply-To: <CAK7LNAR6MeBRhP1A3oc-UVATNN4r2Ru1LUp2=DqiLSKDL9gwOQ@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 11 May 2020 15:18:56 +0200
Message-ID: <CADYN=9+MZyCHdp2VbBCjk4u9zVaSXYe6vWwyFa6cy5GOA+-a8w@mail.gmail.com>
Subject: Re: [PATCH] scripts: fix deprecated always and hostprogs-y
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 6 May 2020 at 20:36, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, May 5, 2020 at 8:54 PM Anders Roxell <anders.roxell@linaro.org> wrote:
> >
> > When I did an allmodconfig build the following warning showed up:
> >
> > scripts/Makefile.lib:8: 'always' is deprecated. Please use 'always-y' instead
> > scripts/Makefile.lib:12: 'hostprogs-y' and 'hostprogs-m' are deprecated. Please use 'hostprogs' instead
> >
> > Rework to use the new 'always-y' and 'hostprogs'.
> >
> > Fixes: ee066c3ddf7b ("kbuild: warn if always, hostprogs-y, or hostprogs-m is used")
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
>
>
> As Stephen Rothwell reported
> (https://lkml.org/lkml/2020/5/3/392),
> this warning appears by merging the
> two different trees.

Right, I see.

>
>
> You sent this patch to the kbuild maintainers,
> but samples/watch_queue/Makefile does not exist
> in the kbuild tree.

oops, I'm sorry.

>
>
> Also, please drop the fixes tag.

I will.

> The commit hash might change.
>
>
> > ---
> >  samples/watch_queue/Makefile | 4 ++--
> >  scripts/Makefile.build       | 1 -
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/samples/watch_queue/Makefile b/samples/watch_queue/Makefile
> > index eec00dd0a8df..8511fb6c53d2 100644
> > --- a/samples/watch_queue/Makefile
> > +++ b/samples/watch_queue/Makefile
> > @@ -1,7 +1,7 @@
> >  # List of programs to build
> > -hostprogs-y := watch_test
> > +hostprogs := watch_test
> >
> >  # Tell kbuild to always build the programs
> > -always := $(hostprogs-y)
> > +always-y := $(hostprogs)
> >
> >  HOSTCFLAGS_watch_test.o += -I$(objtree)/usr/include
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 3665b1a0bc8e..abdba70f33a1 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -15,7 +15,6 @@ obj-y :=
> >  obj-m :=
> >  lib-y :=
> >  lib-m :=
> > -always :=
> >  always-y :=
> >  always-m :=
> >  targets :=
>
>
> Why are you deleting 'always'?
> It would immediately break
> the downstream Makefiles immediately.

Thank you, you are correct.

I will send out a new patch shortly to the correct list.

Cheers,
Anders
