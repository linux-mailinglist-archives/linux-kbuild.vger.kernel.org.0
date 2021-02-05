Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87318310903
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 11:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhBEKZi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 05:25:38 -0500
Received: from mail-oo1-f43.google.com ([209.85.161.43]:33852 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbhBEKSC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 05:18:02 -0500
Received: by mail-oo1-f43.google.com with SMTP id x23so1491746oop.1;
        Fri, 05 Feb 2021 02:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l72BMIb3zhzzE8Mc2vCdYcqGUh+JciNiU1J70+nqoJI=;
        b=lSKuaFzPlqrvQkHbpvlXBeh3i+1FF9i5QtYM8s97XUnj2stya8f/r+i8G64MXk8vee
         LfYBbfrkTDnR4u93qoveoxOJAgf6mkucbqfHux41scYt56aU8g6JX/vAZy66kJIn3gNw
         lGh6Iz3t38KGFx/O0MiiagpxlVAm22Af/QGE0Y0X5oKaQEZnWEQ9RGnOzJ02e8HeoXES
         iSczVQHwIoYI/3NPe9kfAYAf544fB9FoMOgrvexH/EqPAZqXbumEiPEcQBtivQTtx3lF
         ar5obKOZ2v8av4d5Vs+piqgkEYOIgnQzvidy0BAGZH7wuPMPsAtafO9fh2sbxy6Nq1V0
         BdOg==
X-Gm-Message-State: AOAM531L2E/xj+CPGvX7JhIJJG+UAOLKBErmFjhjJcJtulms7MDXLqTS
        yehTP8yIY0VaeQUx97vETNd+AMNGBX2n2URNCrk=
X-Google-Smtp-Source: ABdhPJygXWRTFA7m8W3rDa/nNXZsqdUMOa+4wi/8Xobw0G4luRVdhEzx1c9WHF/DD7QSyQ2KNLJAi78q7X63Idf+eDg=
X-Received: by 2002:a4a:e6d2:: with SMTP id v18mr2910653oot.40.1612520241833;
 Fri, 05 Feb 2021 02:17:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611904394.git.viresh.kumar@linaro.org> <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
 <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7> <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
 <20210205095545.woevnkxg3ar7ctys@vireshk-i7>
In-Reply-To: <20210205095545.woevnkxg3ar7ctys@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Feb 2021 11:17:10 +0100
Message-ID: <CAMuHMdXKT3LD3ojMJEg-oHsEKO5TN5P1BTJMyf2fYkhnC8PU=Q@mail.gmail.com>
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

On Fri, Feb 5, 2021 at 10:55 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 05-02-21, 10:41, Geert Uytterhoeven wrote:
> > On Fri, Feb 5, 2021 at 10:25 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > On 05-02-21, 10:02, Geert Uytterhoeven wrote:
> > > > Thanks for your patch
> > > > (which I only noticed because it appeared in dt-rh/for-next ;-)
> > > >
> > > > On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > > Add support for building DT overlays (%.dtbo). The overlay's source file
> > > > > will have the usual extension, i.e. .dts, though the blob will have
> > > >
> > > > Why use .dts and not .dtso for overlays?
> > > > Because you originally (until v5) had a single rule for building .dtb
> > > > and .dtbo files?
> > >
> > > I am fine with doing that as well if Rob and David agree to it. Rob
> > > did suggest that at one point but we didn't do much about it later on
> > > for some reason.
> > >
> > > FWIW, this will also require a change in the DTC compiler.
> >
> > Care to explain why? I've been using .dtsi for ages in
> > https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
>
> I don't see you building them anywhere, they aren't added to the
> Makefile ever. What am I missing ?
>
> actually none of the dtso's were added to any makefile in that branch.

E.g. "ARM: dts: Build all overlays if OF_OVERLAY=y"?
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=597ee90971687a45678cca8d16bf624d174a99eb

> Anyway, the DTC needs to know how to treat the dtso format and it will
> error out currently with unknown format kind of errors.
>
> Below email [1] have some information on the kind of changes required
> here. Also note that we had to do similar changes for dtbo earlier
> [2].
>
> --
> viresh
>
> [1] https://lore.kernel.org/lkml/CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com/

-@ is handled by "kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used"
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=91e9d998514f3743125a707013a30d5f83054579

> [2] https://lore.kernel.org/lkml/30fd0e5f2156665c713cf191c5fea9a5548360c0.1609926856.git.viresh.kumar@linaro.org/

I never had a need for those changes to dtc. .dtso/.dtbo work fine regardless.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
