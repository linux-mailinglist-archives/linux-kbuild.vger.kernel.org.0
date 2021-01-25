Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC59302E41
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 22:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732350AbhAYVrj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 16:47:39 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51450 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732685AbhAYVql (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 16:46:41 -0500
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 10PLjDno004170;
        Tue, 26 Jan 2021 06:45:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10PLjDno004170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611611113;
        bh=jwaaWfOLyNeFlQAnNSQKJK+MaHiqrQ7LlTnPQQHpVeo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Qks7wY5aADVmF4XYs8OlPjdaDH3h5ka6z5dhbv7EP02zWHjZUTwRO31ezHou7DVnV
         94Os2PewULekRpL7uxIc32AZj2biTHQ197L3zWJ09CHxN0BYKk5eve9841THtS6UKn
         +D1VVvRJN61oE29syEoqRXZIEGlY88UNt6q9aFaZuNqWMtJME3qp0BwNXCfhfirUHE
         F3uwgToQhJ3K2n8x9WubXsRObVlJavqRNdzR83DCg+9m0ZPjc5mgTIHY4MkFTjmKsJ
         VoCpxO/y63nufFpS6B1LOnf/95fsav2yPIyVmYWja89yL2jby54ngEqxr4H826Rm0z
         i4gtLs2qTHzrg==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id a20so427653pjs.1;
        Mon, 25 Jan 2021 13:45:13 -0800 (PST)
X-Gm-Message-State: AOAM531kMSxyyCztv9bTQCgrqJRA4uAO/u/+UNJsnRFFsaRF4Fx4sNlk
        S97zqW5Ju3kKhSIUoO+KX9aa62m+WwPUHbv3pxg=
X-Google-Smtp-Source: ABdhPJzArtU/O7ywAiPmBA5GRCqetdanMADrFD0e9FqMwPtkjTxCHaH0WbHO1m+jZ1FA3ho5HzgHUCEaWEgU3bTf6oI=
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr2273222pjp.87.1611611112750;
 Mon, 25 Jan 2021 13:45:12 -0800 (PST)
MIME-Version: 1.0
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com> <20210125212755.jfwlqogpcarmxdgt@treble>
In-Reply-To: <20210125212755.jfwlqogpcarmxdgt@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 26 Jan 2021 06:44:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
Message-ID: <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 6:28 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Tue, Jan 26, 2021 at 06:16:01AM +0900, Masahiro Yamada wrote:
> > On Tue, Jan 26, 2021 at 5:42 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > >
> > > When building out-of-tree kernel modules, the build system doesn't
> > > require the GCC version to match the version used to build the original
> > > kernel.  That's probably [1] fine.
> > >
> > > In fact, for many distros, the version of GCC used to build the latest
> > > kernel doesn't necessarily match the latest released GCC, so a GCC
> > > mismatch turns out to be pretty common.  And with CONFIG_MODVERSIONS
> > > it's probably more common.
> > >
> > > So a lot of users have come to rely on being able to use a different
> > > version of GCC when building OOT modules.
> > >
> > > But with GCC plugins enabled, that's no longer allowed:
> > >
> > >   cc1: error: incompatible gcc/plugin versions
> > >   cc1: error: failed to initialize plugin ./scripts/gcc-plugins/structleak_plugin.so
> > >
> > > That error comes from the plugin's call to
> > > plugin_default_version_check(), which strictly enforces the GCC version.
> > > The strict check makes sense, because there's nothing to prevent the GCC
> > > plugin ABI from changing -- and it often does.
> > >
> > > But failing the build isn't necessary.  For most plugins, OOT modules
> > > will otherwise work just fine without the plugin instrumentation.
> > >
> > > When a GCC version mismatch is detected, print a warning and disable the
> > > plugin.  The only exception is the RANDSTRUCT plugin which needs all
> > > code to see the same struct layouts.  In that case print an error.
> > >
> > > [1] Ignoring, for the moment, that the kernel now has
> > >     toolchain-dependent kconfig options, which can silently disable
> > >     features and cause havoc when compiler versions differ, or even when
> > >     certain libraries are missing.  This is a separate problem which
> > >     also needs to be addressed.
> > >
> > > Reported-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > > ---
> >
> >
> > We are based on the assumption that we use the same
> > compiler for in-tree and out-of-tree.
>
> Sorry, but that assumption isn't based in reality.  And it's not
> enforced.
>
> > If people use a different compiler, they must be
> > prepared for any possible problem.
> >
> > Using different compiler flags for in-tree and out-of-tree
> > is even more dangerous.
> >
> > For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
> > for in-tree build, and then disabled for out-of-tree modules,
> > the struct layout will mismatch, won't it?
>
> If you read the patch you'll notice that it handles that case, when it's
> caused by GCC mismatch.
>
> However, as alluded to in the [1] footnote, it doesn't handle the case
> where the OOT build system doesn't have gcc-plugin-devel installed.
> Then CONFIG_GCC_PLUGIN_RANDSTRUCT gets silently disabled and the build
> succeeds!  That happens even without a GCC mismatch.


Ah, sorry.

I responded too early before reading the patch fully.

But, I do not like to make RANDSTRUCT a special case.

I'd rather want to stop building for any plugin.







> > This patch is ugly, and not doing the right thing.
>
> Maybe, but I doubt the solution is to make assumptions.
>
> --
> Josh
>


-- 
Best Regards
Masahiro Yamada
