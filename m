Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2405C2FCF5C
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 13:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbhATLXd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 06:23:33 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:37037 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388854AbhATLHd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 06:07:33 -0500
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 10KB5ZgM031817;
        Wed, 20 Jan 2021 20:05:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10KB5ZgM031817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611140735;
        bh=9TFgVC5GCS9ytVvloa3e3F44Yu5iAQkgD9AbrTeaqcw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IMZtSkWFdEhQtKTOT0gZsxpsYCNt/uAZH8lC5ajfERYjQFbhnOchPJ59lWQMDQK/D
         se1A+jc0Iw0JVcQypCcZoxhlZjerGf9jpCR7/ZhkT/XRZuJHKgc2/YiJZBMMMOOnfF
         Tl+WHKLvHkHegI+xhQybH6Vn/wo5lR9Y8TljHxl3N5+plt2EvDRjUyvxftr+CV7cOX
         Yxww+or12T+Q6OZJ47ydLlCRdqKFczQid4/FKhWyZwUj5BSHs8Mduo0AonftjrsC01
         qnnkQKWx/qatuzpXsyDL828iED/5gz3YSgJ+ZxZIeJFjfp7tINO0hoM9ceSglzkTed
         8sp8+cyv/Dwhg==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id j12so1953714pjy.5;
        Wed, 20 Jan 2021 03:05:35 -0800 (PST)
X-Gm-Message-State: AOAM530A9YJlRg7L4jO/OShEO1Uh/c22RUFcj1fS+n4D3uwTNIv/2M74
        MWq94iwGVauqyTcGmHI+3RHD4XLYPtHPnGRbsKM=
X-Google-Smtp-Source: ABdhPJwbUudTGF8VVk187qQE2APBClVB0j98S6UXW28gHOpp/o/770bNkeRb5JaravL/BlID2ZOYhZ7hMggk6fYt+M8=
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr5109138pjp.87.1611140734807;
 Wed, 20 Jan 2021 03:05:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611124778.git.viresh.kumar@linaro.org> <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
 <CAK7LNATPSBrmSC_if+6sK0pwi1ksBZ7RXK1mndj1AGCX3gkj+g@mail.gmail.com> <20210120095541.f354ml4h36rfc4gx@vireshk-i7>
In-Reply-To: <20210120095541.f354ml4h36rfc4gx@vireshk-i7>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 20 Jan 2021 20:04:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNATL=O4p_LAhzJguUK=jo9BaU+Jisaw7ey4wNgKw08zH1A@mail.gmail.com>
Message-ID: <CAK7LNATL=O4p_LAhzJguUK=jo9BaU+Jisaw7ey4wNgKw08zH1A@mail.gmail.com>
Subject: Re: [PATCH V5 4/5] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 6:55 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 20-01-21, 17:58, Masahiro Yamada wrote:
> > > +%.dtb %.dtbo: include/config/kernel.release scripts_dtc
> > >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> >
> >
> > No, this is wrong because it does not work
> > as grouped targets.
> >
> > You need to separate them.
> >
> >
> >
> > %.dtb: include/config/kernel.release scripts_dtc
> >          $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> >
> > %.dtbo: include/config/kernel.release scripts_dtc
> >          $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> >
> >
> >
> >
> > See GNU make manual.
> >
> >
> > "Pattern rules may have more than one target; however, every target
> > must contain a % character.
> > Pattern rules are always treated as grouped targets"
> >
> > https://www.gnu.org/software/make/manual/html_node/Pattern-Intro.html
>
> Hmm, okay I will do that.
>
> I did it this way because I saw similar stuff at some other places. I
> am not a regular Makefile hacker, there is every chance I am reading
> it wrong.
>


In grouped targets, a recipe must be able to create
all the targets in a single invocation.



> $ git grep "%.*%.*:" | grep Makefile
> Makefile:%/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)

One single invocation of Kconfig generates
three files, auto.conf, auto.conf.cmd, autoconf.h

So, this is correct.


> scripts/Makefile.build:$(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler

asn1_compiler takes one source file,
then outputs two files %.asn1.c and %.asn1.h

So, this is correct.


> scripts/Makefile.host:$(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE

bison takes one source file,
then outputs two files %.tab.c and %.tab.h

So, this is correct.


> scripts/genksyms/Makefile:$(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE

This is also a bison rule. Correct.


> tools/perf/Documentation/Makefile:$(OUTPUT)%.1 $(OUTPUT)%.5 $(OUTPUT)%.7 : %.txt
> tools/perf/Documentation/Makefile:$(OUTPUT)%.1 $(OUTPUT)%.5 $(OUTPUT)%.7 : $(OUTPUT)%.xml


These are out of scope of my maintenance coverage.
I do not know whether they are correct or not.



The DTC rule takes one source input, and one output file.

It cannot generate .dtb and .dtbo at the same time.

That is why a grouped target does not fit here.



> --
> viresh



-- 
Best Regards
Masahiro Yamada
