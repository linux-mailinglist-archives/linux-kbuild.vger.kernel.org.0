Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFF231989F
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 04:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhBLDI5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 22:08:57 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:61173 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhBLDIy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 22:08:54 -0500
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11C37d0w009910;
        Fri, 12 Feb 2021 12:07:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11C37d0w009910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613099260;
        bh=I5mK3G+CjJ+ik2u7vLdWvYhGKvVsmh00OZqq6nOWAfo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oyrj/HrlI42UvZ/W4/qK01nOaTO1jKZ+Gj5Kwj/VE1NJ13/IXuJ2oniIoCC4t3Fpy
         fD0fJ12sl0e/dNaFQ4QdjNgUq8agIlZKJsD3UFveynhKajmvsu+8biPfBeuFeCDdH3
         hlTfyqy3Dzn413PNssEmhneLlehzw5s8h0RceZbyEcNtE7JF+BwE3lWuBgOHg4xlL9
         1YUEZNSVmC8gMLfCb6YkHQxrm2nJSGvf35q9yl2Y/dA3jd1nv7X7//XEnp82+ynwro
         2NPTUhovCbmXsDBlQDO2aKFLlCpryxI+uxYXHU0k2AX0ul30u7QzHctKXznSOZzxy+
         UnZvMEz518kXg==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id c11so4963782pfp.10;
        Thu, 11 Feb 2021 19:07:39 -0800 (PST)
X-Gm-Message-State: AOAM5335C91fISp+5UC7w9984s+yOBl7aahfMv91TFO5wxPStJ8gYyjr
        sz4Dmyx/Q0VEk2LrkkHo6JKNGk/9XHmeTOwdQJA=
X-Google-Smtp-Source: ABdhPJx8OiSoNeZ/dmRG1leCMKTZJ1WHVjWadinf3/HxClDg13CKEIq42sKUnmjPj6qz2ebltPfCHfzmGNkzOzRQJVI=
X-Received: by 2002:a62:2f07:0:b029:1bb:5f75:f985 with SMTP id
 v7-20020a622f070000b02901bb5f75f985mr993540pfv.76.1613099258850; Thu, 11 Feb
 2021 19:07:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612955268.git.viresh.kumar@linaro.org> <44dad578df8a848fc378cd358f03b071f44c9a5b.1612955268.git.viresh.kumar@linaro.org>
 <CAK7LNARa8GzhhvZWV_KAW=MC0DRcSsfPsQ-KTBRRpbBgBqY=ig@mail.gmail.com> <CAL_JsqKHUG6VvvpQ18YdzsOA_gZ59gFsc2tUzt1SxKHsO2A03g@mail.gmail.com>
In-Reply-To: <CAL_JsqKHUG6VvvpQ18YdzsOA_gZ59gFsc2tUzt1SxKHsO2A03g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 12 Feb 2021 12:07:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQH8hVwqGF+82j=38gi7VaixLhYS-K1uT1wdX4t07pJ6Q@mail.gmail.com>
Message-ID: <CAK7LNAQH8hVwqGF+82j=38gi7VaixLhYS-K1uT1wdX4t07pJ6Q@mail.gmail.com>
Subject: Re: [PATCH V7 1/3] kbuild: Add generic rule to apply fdtoverlay
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 12, 2021 at 5:05 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Feb 11, 2021 at 12:28 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, Feb 10, 2021 at 8:13 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > From: Rob Herring <robh@kernel.org>
> > >
> > > Add a generic rule to apply fdtoverlay in Makefile.lib, so every
> > > platform doesn't need to carry the complex rule.
> > >
> > > The platform's Makefile only needs to have this now:
> > >
> > >  DTC_FLAGS_foo_base += -@
> > >  foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
> > >  overlay-y := foo.dtb
> >
> >
> > Please reuse dtb-y instead of introducing the new
> > overlay-y syntax, that is,
> >
> > foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
> > dtb-y := foo.dtb
>
> That's what I had, but I believe Viresh changed this because we don't
> want to run schema checks on foo.dtb (as foo.dts doesn't exist).
> However, we should be able to filter those out using something similar
> to technique used for multi-used-y and real-obj-y. We just need to
> drop composite entries when creating the .dt.yaml list.



Yes, I think this will work.



BTW, I do not know how to use overlay.
Do we apply overlay in the build time?
If so, I do not know what the benefit of overlay is.
Or is this just for build testing?


I just thought this was done in the boot time,
for example, in U-Boot or something.




-- 
Best Regards
Masahiro Yamada
