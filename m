Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7C3311CCD
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 12:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhBFLE1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 06:04:27 -0500
Received: from mail-oo1-f53.google.com ([209.85.161.53]:45345 "EHLO
        mail-oo1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhBFLEZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 06:04:25 -0500
Received: by mail-oo1-f53.google.com with SMTP id y21so2287884oot.12;
        Sat, 06 Feb 2021 03:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6lX81VL+W5b2OWAyfZlO80FWfJRJ3Y5NfrlCPUjFYY=;
        b=Xw1GWphpcqMYUr///jFPQOuQ6P4Xh2IJOpz1mrgr670iWybncSZ3AlFZuV4u0aj+SH
         y5LJnpmdZdn/XhlbDsmxXpGxRA0Om5lNrgL2j0TF1eV/j2lLsdqMKjnXrp/4iMuKJN57
         3MCM09LKHSFd01CPTQw3Njk2HQWwNLgPzySosZ6TGlyFFb/UPgDAb4j1Ucid4KARWExf
         ax92634J9vPlC3tpHbSVAxzotSqDK7N/VVBV1Jxw8WgwXE9uGcxrdYZXF4MP3U8kdmYu
         2MHBTcdlkfA9I3I2zKOfg9E3RXUURdoftuuZ+XAIAyC2d9K0IfTcQg55HIz6TNxouM7W
         fvvQ==
X-Gm-Message-State: AOAM5315VHUh0CjmlGAPfaYEXuqXxvfqPSX71KtqueU/h5zhO5eulQKe
        dv8mu1mwhHd6vgATa9F/tu8fiDCXBM1xyxVErSnvfFeQ9AI=
X-Google-Smtp-Source: ABdhPJyIhKYR8uiSFmowRVcN0ighX+TbbX1FuohQqvKMOg83LJQmYM8DWixjNZ5Ua+5JR/+MvLLhzW2UbmVIUy5+r40=
X-Received: by 2002:a4a:e6d2:: with SMTP id v18mr6546905oot.40.1612609424930;
 Sat, 06 Feb 2021 03:03:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611904394.git.viresh.kumar@linaro.org> <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
 <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7> <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
 <20210205095545.woevnkxg3ar7ctys@vireshk-i7> <CAMuHMdXKT3LD3ojMJEg-oHsEKO5TN5P1BTJMyf2fYkhnC8PU=Q@mail.gmail.com>
 <20210205210814.GA3707622@robh.at.kernel.org>
In-Reply-To: <20210205210814.GA3707622@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 6 Feb 2021 12:03:33 +0100
Message-ID: <CAMuHMdX_4Liv8j4z7kgggWh4WqV6mbv2qCNzQpbkjyEAm+6oqw@mail.gmail.com>
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
To:     Rob Herring <robh@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Rob,

On Fri, Feb 5, 2021 at 10:08 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Feb 05, 2021 at 11:17:10AM +0100, Geert Uytterhoeven wrote:
 > On Fri, Feb 5, 2021 at 10:55 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > On 05-02-21, 10:41, Geert Uytterhoeven wrote:
> > > > On Fri, Feb 5, 2021 at 10:25 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > > On 05-02-21, 10:02, Geert Uytterhoeven wrote:
> > > > > > Thanks for your patch
> > > > > > (which I only noticed because it appeared in dt-rh/for-next ;-)
> > > > > >
> > > > > > On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > > > > Add support for building DT overlays (%.dtbo). The overlay's source file
> > > > > > > will have the usual extension, i.e. .dts, though the blob will have
> > > > > >
> > > > > > Why use .dts and not .dtso for overlays?
> > > > > > Because you originally (until v5) had a single rule for building .dtb
> > > > > > and .dtbo files?
> > > > >
> > > > > I am fine with doing that as well if Rob and David agree to it. Rob
> > > > > did suggest that at one point but we didn't do much about it later on
> > > > > for some reason.
> > > > >
> > > > > FWIW, this will also require a change in the DTC compiler.

> I think what Viresh means is dtc won't automatically set the input type
> to dts if not .dts.

Which is not needed with the kernel build rules.

> We stuck with .dtbo as it's already widely used. I don't know about
> dtso though. If there's strong consensus to use .dtso, then let's do
> that. Whatever color for this shed you like.

I did a quick survey of its popularity, and found:

  1. .dts => .dtbo
        https://www.kernel.org/doc/Documentation/devicetree/overlay-notes.txt
        https://github.com/beagleboard/bb.org-overlays
        https://www.raspberrypi.org/documentation/configuration/device-tree.md
        https://www.96boards.org/documentation/consumer/dragonboard/dragonboard410c/guides/dt-overlays.md.html
        https://learn.adafruit.com/introduction-to-the-beaglebone-black-device-tree/compiling-an-overlay
        https://developer.toradex.com/knowledge-base/device-tree-overlays

  2. .dtso => .dtbo
        https://github.com/linux4sam/dt-overlay-at91/tree/master/sama5d3_xplained
        https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

  3. .dtsi => .dtbo
        https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager

Note that many overlay users haven't migrated to the sugar syntax yet.

IMHO the biggest advantage of .dtso over .dts is that you (and the
tooling) know which files should be compiled to .dtbo, and which to
.dtb.  This doesn't matter for

    obj-$(CONFIG_FOO) += foo.dtbo

but it does for options like CONFIG_OF_ALL_DTBS.
Having a way to build all overlays will become more important when we
will have more generic overlays (capes/hats/wings/...), that can apply
to multiple base DTBs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
