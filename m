Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5022ECA26
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 06:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbhAGF3v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 00:29:51 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32619 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbhAGF3v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 00:29:51 -0500
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1075ScAO022423;
        Thu, 7 Jan 2021 14:28:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1075ScAO022423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1609997319;
        bh=lvPP/ovJSzu/fFkNuqkFGmuMHuzmmi/KupX+Somo4Tk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ftfyjNRqlB3xR4s/fn9hHp0Zhbeyi54WZTvfFonqaRoV45wTu1B06gJr9qFKN7Mjo
         /sVDpsdTXXrCq/fwd87AMyZjS90aXa3cvEVvjAr+ZKFbMvZ5Q31+aDk/6KRBx8PTVT
         wQ6yywdyHS2g8SwPDMlZhER8h1f1nhPUKf5ZA81dIgT7LRswqGBWAqN3fcEJrG+JsX
         rQvBmhINzhGnRKlTzKWgxga3BfM5rHlEehtGdWMn4mEuPD7yw3m5yJEdKQaORNJYC3
         KwwThb0hvRtFpB3mEJDkyqi5OH94RciDRohLzRZisCHDHdRCqdNc72CAKWiObNt5mH
         flTUSL9vt0RrQ==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id y8so2903976plp.8;
        Wed, 06 Jan 2021 21:28:38 -0800 (PST)
X-Gm-Message-State: AOAM533ck1/j7X5Ssg20nCKORrBSCVwvTQpncpLMHWtoUKXZk6JbN+/H
        b1iTtzOcK7PnY+B7Pp6bg/f5oWLrPt1vm0R7kKo=
X-Google-Smtp-Source: ABdhPJyqieTynTjtxOoQxrDCON3gMFLOBlYhUZzKbpbFKt+1C8c/pAXPUwmKwIbRKppuzO6KfEEXXk/JvebLVaIAAfk=
X-Received: by 2002:a17:90a:c910:: with SMTP id v16mr7675125pjt.198.1609997318210;
 Wed, 06 Jan 2021 21:28:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609844956.git.viresh.kumar@linaro.org> <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
In-Reply-To: <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 7 Jan 2021 14:28:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
Message-ID: <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 6, 2021 at 12:21 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Jan 5, 2021 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > Here is an attempt to make some changes in the kernel to allow building
> > of device tree overlays.
> >
> > While at it, I would also like to discuss about how we should mention
> > the base DT blobs in the Makefiles for the overlays, so they can be
> > build tested to make sure the overlays apply properly.
> >
> > A simple way is to mention that with -base extension, like this:
> >
> > $(overlay-file)-base := platform-base.dtb
> >
> > Any other preference ?



Viresh's patch is not enough.

We will need to change .gitignore
and scripts/Makefile.dtbinst as well.


In my understanding, the build rule is completely the same
between .dtb and .dtbo
As Rob mentioned, I am not sure if we really need/want
a separate extension.


A counter approach is to use an extension like '.ovl.dtb'
It clarifies it is an overlay fragment without changing
anything in our build system or the upstream DTC project.

We use chained extension in some places, for example,
.dt.yaml for schema yaml files.



dtb-$(CONFIG_ARCH_FOO) += \
    foo-board.dtb \
    foo-overlay1.ovl.dtb \
    foo-overlay2.ovl.dtb


Overlay DT source file names must end with '.ovl.dts'




>
> I think we'll want something similar to how '-objs' works for modules:
>
> foo-board-1-dtbs := foo-board.dtb foo-overlay1.dtbo
> foo-board-2-dtbs := foo-board.dtb foo-overlay2.dtbo
> foo-board-1-2-dtbs := foo-board.dtb foo-overlay1.dtbo foo-overlay2.dtbo
> dtbs-y += foo-board-1.dtb foo-board-2.dtb foo-board-1-2.dtb
>
> (One difference here is we will want all the intermediate targets
> unlike .o files.)
>
> You wouldn't necessarily have all the above combinations, but you have
> to allow for them. I'm not sure how we'd handle applying any common
> overlays where the base and overlay are in different directories.


I guess the motivation for supporting -dtbs is to
add per-board -@ option only when it contains *.dtbo pattern.

But, as you notice, if the overlay files are located
under drivers/, it is difficult to add -@ per board.

Another scenario is, some people may want to compile
downstream overlay files (i.e. similar concept as external modules),
then we have no idea which base board should be given with the -@ flag.


I'd rather be tempted to add it globally


ifdef CONFIG_OF_OVERLAY
DTC_FLAGS += -@
endif







>
> Another thing here is adding all the above is not really going to
> scale on arm32 where we have a single dts directory. We need to move
> things to per vendor/soc family directories. I have the script to do
> this. We just need to agree on the vendor names and get Arnd/Olof to
> run it. I also want that so we can enable schema checks by default
> once a vendor is warning free (the whole tree is going to take
> forever).


If this is a big churn, perhaps we could make it extreme
to decouple DT and Linux-arch.



arch/*/boot/dts/*.dts
 ->  dts/<vendor>/*.dts

Documentation/devicetree/bindings
 -> dts/Bindings/

include/dt-bindings/
 -> dts/include/dt-bindings/



Then, other project can take dts/
to reuse for them.







> > Also fdtoverlay is an external entity right now, and is not part of the
> > kernel. Do we need to make it part of the kernel ? Or keep using the
> > external entity ?
>
> Part of the kernel. We just need to add it to the dtc sync script and
> makefile I think.
>
> Rob



--
Best Regards
Masahiro Yamada
