Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA142311323
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 22:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhBEVKb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 16:10:31 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33956 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhBEVI5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 16:08:57 -0500
Received: by mail-oi1-f169.google.com with SMTP id h192so8997757oib.1;
        Fri, 05 Feb 2021 13:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cBcHI7VOBes0FNKSSMeX2DmFTL3WX//7tJHy3/ZI6hk=;
        b=BoSlUouCsRrcZHG9E74QRezP2Y6xe8GgRBEj2ZPraa45WncJunimkQzW2DcW6pZ6fy
         615n4zQm/Gskp3R9x7M2Z30bdJ7ItYg5GqUESDI+wxZwm3N3YtMmEyt5q95+iZhcvS8Z
         J32GVBJwo1yPmQhvus80sSYlOjUzjxdxuWlxfvXoUCAQQWoPNKdQM8lENmBwRmHd14mR
         D+vhRTOvz8+59TuvcVZBMaQhxa16lXN64j8pKGf5uMQd0eZANVJFxGhXaPxbldjP0Afs
         zEF0FfUDGhQgce0EfrtsvYU5+UluLHHIWd1+8ZV8WxENKQoZme/+bEMoga5WT6PE8Fji
         jIlQ==
X-Gm-Message-State: AOAM530/t3oviTGVCUv81/gdhI63/uWDhsg9PBc8TZCFGAlpPyo4+i7m
        fVO76IvAGkDyXvJbMsa0Fw==
X-Google-Smtp-Source: ABdhPJzZCcFHaquBNOpsZPhtwnJnLk5n6Qa4WAEYZAprA6VTYeznVSgYRUSGopDyHmTBjS1Y0Cm7jw==
X-Received: by 2002:aca:5e84:: with SMTP id s126mr4439468oib.175.1612559296418;
        Fri, 05 Feb 2021 13:08:16 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r1sm2032112ooq.16.2021.02.05.13.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 13:08:15 -0800 (PST)
Received: (nullmailer pid 3741883 invoked by uid 1000);
        Fri, 05 Feb 2021 21:08:14 -0000
Date:   Fri, 5 Feb 2021 15:08:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
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
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210205210814.GA3707622@robh.at.kernel.org>
References: <cover.1611904394.git.viresh.kumar@linaro.org>
 <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
 <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
 <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
 <20210205095545.woevnkxg3ar7ctys@vireshk-i7>
 <CAMuHMdXKT3LD3ojMJEg-oHsEKO5TN5P1BTJMyf2fYkhnC8PU=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXKT3LD3ojMJEg-oHsEKO5TN5P1BTJMyf2fYkhnC8PU=Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 05, 2021 at 11:17:10AM +0100, Geert Uytterhoeven wrote:
> Hi Viresh,
> 
> On Fri, Feb 5, 2021 at 10:55 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > On 05-02-21, 10:41, Geert Uytterhoeven wrote:
> > > On Fri, Feb 5, 2021 at 10:25 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > On 05-02-21, 10:02, Geert Uytterhoeven wrote:
> > > > > Thanks for your patch
> > > > > (which I only noticed because it appeared in dt-rh/for-next ;-)
> > > > >
> > > > > On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > > > Add support for building DT overlays (%.dtbo). The overlay's source file
> > > > > > will have the usual extension, i.e. .dts, though the blob will have
> > > > >
> > > > > Why use .dts and not .dtso for overlays?
> > > > > Because you originally (until v5) had a single rule for building .dtb
> > > > > and .dtbo files?
> > > >
> > > > I am fine with doing that as well if Rob and David agree to it. Rob
> > > > did suggest that at one point but we didn't do much about it later on
> > > > for some reason.
> > > >
> > > > FWIW, this will also require a change in the DTC compiler.
> > >
> > > Care to explain why? I've been using .dtsi for ages in
> > > https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
> >
> > I don't see you building them anywhere, they aren't added to the
> > Makefile ever. What am I missing ?
> >
> > actually none of the dtso's were added to any makefile in that branch.
> 
> E.g. "ARM: dts: Build all overlays if OF_OVERLAY=y"?
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=597ee90971687a45678cca8d16bf624d174a99eb
> 
> > Anyway, the DTC needs to know how to treat the dtso format and it will
> > error out currently with unknown format kind of errors.
> >
> > Below email [1] have some information on the kind of changes required
> > here. Also note that we had to do similar changes for dtbo earlier
> > [2].
> >
> > --
> > viresh
> >
> > [1] https://lore.kernel.org/lkml/CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com/
> 
> -@ is handled by "kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used"
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=91e9d998514f3743125a707013a30d5f83054579
> 
> > [2] https://lore.kernel.org/lkml/30fd0e5f2156665c713cf191c5fea9a5548360c0.1609926856.git.viresh.kumar@linaro.org/
> 
> I never had a need for those changes to dtc. .dtso/.dtbo work fine regardless.

I think what Viresh means is dtc won't automatically set the input type 
to dts if not .dts.

We stuck with .dtbo as it's already widely used. I don't know about 
dtso though. If there's strong consensus to use .dtso, then let's do 
that. Whatever color for this shed you like.

Rob
