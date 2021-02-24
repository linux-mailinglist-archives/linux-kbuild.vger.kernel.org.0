Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065AB3235F6
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 04:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhBXDP4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 22:15:56 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:21212 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbhBXDPz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 22:15:55 -0500
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11O3Efsb017357;
        Wed, 24 Feb 2021 12:14:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11O3Efsb017357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614136482;
        bh=BxAdqFYTvCTCTcnQXNwMMcHQIOzVEEBf5uOSZ6wOE+I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EhPtFp6x4LfAnoP+aDRrkgRSlW5kBanvoL5CxFfNgwdjlt+886ah3F7fyCj3RRUTT
         Jbp0i4P7sPO8Z6TlBfA2TIXu4AhXIgXBd2DPHLeHLwgFlSXEhCYGLaL5ddZEaQmE6R
         lBKCf1hssu3RMzs8O4iF10xma9eJUrnU25Wwm0p/Z2evg1xwKfDGu2uXe1Nzi16F5Q
         fVQ1p1ytOglIP+PP8xjVYr1ZbrfSFacIs8cjEg5scYCINlaYxPO/p0Ip/nOeNezNTf
         n6WLy4H0vSBJtqsETI5ypWTll3yMkxWaJD2qIYrJslEtKiM5ETA1wgPZSn2SWtGDAa
         6GswgFvNqNgfg==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id 201so401454pfw.5;
        Tue, 23 Feb 2021 19:14:42 -0800 (PST)
X-Gm-Message-State: AOAM530SyikKzlWwOaDnE0gO/aeJSdMPtDBtPJAjyAdBIaaDQ2Js5QCf
        CX60Cqfr7eOxFac3rkdLyg1dviumTVosn0nLTpc=
X-Google-Smtp-Source: ABdhPJxaTM2Pzjx5chKj2KPAi1nBnluvWeKX08mcehL1SmBMguHGmpuQalDO7/qm9cM0ZI3EJRANpEWuV8mfUGW6Bjo=
X-Received: by 2002:a62:1412:0:b029:1ec:bc11:31fd with SMTP id
 18-20020a6214120000b02901ecbc1131fdmr28966427pfu.76.1614136481220; Tue, 23
 Feb 2021 19:14:41 -0800 (PST)
MIME-Version: 1.0
References: <20210205220125.2931504-1-ndesaulniers@google.com>
 <CAK7LNARKHvjTcnic=ZKntH3NY5meehQbJuBr34y9_tn8b-Ym0w@mail.gmail.com> <CA+icZUVkFOZq=5K=dKsQAFJPTmEE2gr_hVmYM=Q+rn70bSOh2w@mail.gmail.com>
In-Reply-To: <CA+icZUVkFOZq=5K=dKsQAFJPTmEE2gr_hVmYM=Q+rn70bSOh2w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 24 Feb 2021 12:14:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQGUnzLSOHAwF6ebH7oOuNETAyf3nrdNgNNq7JsDgiFkA@mail.gmail.com>
Message-ID: <CAK7LNAQGUnzLSOHAwF6ebH7oOuNETAyf3nrdNgNNq7JsDgiFkA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: reuse CC_VERSION_TEXT
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 6, 2021 at 12:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sat, Feb 6, 2021 at 2:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Sat, Feb 6, 2021 at 7:01 AM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > >
> > > I noticed we're invoking $(CC) via $(shell) more than once to check the
> > > version.  Let's reuse the first string captured in $CC_VERSION_TEXT.
> > >
> > > Fixes: 315bab4e972d ("kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE")
> >
> >
> > I did not touch this hunk because I have a plan
> > for different refactoring, but I have never got
> > around to do it.
> >
> > Anyway, you beat me, and I will pick this up.
> > But, the Fixes tag is questionable because
> > this is code refactoring.
> >
>
> When I see this... and hear refactoring... As a suggestion/improvement...
>
> Can we have LD_VERSION_TEXT analogue to CC_VERSION_TEXT?
> Both are shown when doing a `cat /proc/version` (and IIRC in file
> include/generated/compile.h).

Sorry, I had forgotten to answer this question.

Probably, we should do so.

Feeding it to Kconfig allows us to re-evaluate
config settings when tools are upgraded.

One question is where we should draw a line.
If we record the version text of CC, LD,
we should do that for more tools?

For LD, I will be probably OK because
some features rely on LD_VERSION or $(ld-option ).


-- 
Best Regards
Masahiro Yamada
