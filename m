Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BAB2FBFB1
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 20:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391267AbhASTDY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 14:03:24 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:42334 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391955AbhASTDT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 14:03:19 -0500
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 10JJ1vNK023366;
        Wed, 20 Jan 2021 04:01:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 10JJ1vNK023366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611082917;
        bh=zI6GU7mXkcWDxGjtKMV8O8z/yEmOhQ9tFNXqxOpXbBs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PDRabLSkS9jpbERu9lBeGwslLvIbsqKFP4NvjjApjDiDkovfYJvXuPbWPsAq8zyy9
         gLDpMSPItGow2lLB7kV/qGRsQ1Oiu/+LjaDHa5YiwaPw2IYt1NHcnB0FQjC6KBij7P
         Xx7DonaNydC8iQ4vEpTXovCcXcPTMMBOmV2ALO5f+UOKR358KxV+xEqCraHHB6Ok50
         XEZVnEK7OyfeRL/4fDO2GsAsCAXY87jhLKjvoFwLtREwVgX3r6Z5Lk5bJG3l4uB0dS
         xDaq3pYYNFDBjmk6MtRQ7tRM1Gn9Z/Aij6R++WdMJ5zT/iWsSSBt0sMG9TemsEzv/g
         Lt/pHbOgUvsuQ==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id m5so491804pjv.5;
        Tue, 19 Jan 2021 11:01:57 -0800 (PST)
X-Gm-Message-State: AOAM531xdmSkOajvjTmZHuTSHy5PxeX/j07Jn3cbkpITNmV/t0Qnp0dY
        Csu536ijkwfyHNtMh61q7RsJiRfxmbdgD5W6FkM=
X-Google-Smtp-Source: ABdhPJwcVVWFx/19HJIMuNEGuXLwQm9F5Mh2DdvpPlQ8jXfzldkpTmg2AmaScl9Z3BgO9qJVOtbiOwj5drL5ew0zrDo=
X-Received: by 2002:a17:902:ed93:b029:de:84d2:9ce1 with SMTP id
 e19-20020a170902ed93b02900de84d29ce1mr6162056plj.47.1611082916634; Tue, 19
 Jan 2021 11:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20201203125700.161354-1-masahiroy@kernel.org> <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
 <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
 <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com> <e5b06d9a-9b24-2440-e0c2-8bf7095eccd9@nvidia.com>
 <25030057-86b1-5619-25fd-acfa0728b850@samsung.com> <4ab4f62f-8b37-01e1-f81c-270155b13a51@nvidia.com>
 <7e691a61-bf4b-0594-8d6d-36d62a5def0b@nvidia.com> <CAHk-=wjjiYjCp61gdAMpDOsUBU-A2hFFKJoVx5VAC7yV4K6WYg@mail.gmail.com>
 <95ce88c6-59bd-55b9-9299-51fa20aeb95c@nvidia.com> <YAcbZRViwlAwl62q@ulmo>
In-Reply-To: <YAcbZRViwlAwl62q@ulmo>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 20 Jan 2021 04:01:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATf6DEyk=SPouHDO6f4Na0bm3HY7_7Cn4Quq6weg_6uFA@mail.gmail.com>
Message-ID: <CAK7LNATf6DEyk=SPouHDO6f4Na0bm3HY7_7Cn4Quq6weg_6uFA@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 2:48 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Fri, Dec 18, 2020 at 08:33:37PM +0000, Jon Hunter wrote:
> >
> > On 18/12/2020 17:54, Linus Torvalds wrote:
> > > On Fri, Dec 18, 2020 at 7:33 AM Jon Hunter <jonathanh@nvidia.com> wrote:
> > >>
> > >> However, if you are saying that this is a problem/bug with our builders,
> > >> then of course we will have to get this fixed.
> > >
> > > This seems to be a package dependency problem with the gcc plugins -
> > > they clearly want libgmp, but apparently the package hasn't specified
> > > that dependency.
> > >
> > > If this turns out to be a big problem, I guess we can't simplify the
> > > plugin check after all.
> > >
> > > We historically just disabled gcc-plugins if that header didn't build,
> > > which obviously meant that it "worked" for people, but it also means
> > > that clearly the coverage can't have been as good as it could/should
> > > be.
> > >
> > > So if it's as simple as just installing the GNU multiprecision
> > > libraries ("gmp-devel" on most rpm-based systems, "libgmp-dev" on most
> > > debian systems), then I think that's the right thing to do. You'll get
> > > a working build again, and equally importantly, your build servers
> > > will actually do a better job of covering the different build options.
> >
> >
> > Thanks. I have reported this issue to the team that administers the
> > builders. So hopefully, they will install the necessary packages for us
> > now.
>
> Just to close the loop on this, the builders now have libgmp-dev and
> libmpc-dev packages installed and the builds are passing without the
> workaround we had used.
>
> Thierry


I was slightly concerned about your question:

"In case where CC != HOSTCC, it's possible that CC was not built against
the same version of GMP/MPC as HOSTCC. And even HOSTCC might not
necessarily have been built against the versions provided by libgmp-dev
or libmpc-dev. I'm not overly familiar with GMP/MPC, so perhaps if these
headers are reasonably stable, this is not all that important. But if it
is, then which version of GMP/MPC do we need? The version that CC was
built against, or the version that HOSTCC was built against?"



I do not have a good insight about this.

I am not sure if it is perfectly OK to
use gmp.h from HOSTCC when it was not bundled with CC.

The version difference might not be a significant issue, though...





-- 
Best Regards
Masahiro Yamada
