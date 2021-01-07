Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C842ED715
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 20:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbhAGTDB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 14:03:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:41050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbhAGTDB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 14:03:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45AB723435;
        Thu,  7 Jan 2021 19:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610046140;
        bh=TZFc2uhAUvgMw7NBM7C6fXOSdHM+P8snV02JquEUOw4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BTS3AwKfTR0dYLwq+62mTag8GjfkQE4fBld0gDTblX2L/0l7ze+dHXhHSb/zorx27
         qQSR+bQ9VC8Jxqcs84UA4jEfxK7bfRAKN41BLnUHXdzn1cd+9ZN80AJyTlmdOelPUD
         vhuisk5IUBEXTtvBNXs9dyJNd/VVSMST+In3X4PzJl1+GpXhEHJL4MqcJaRXguuIqx
         AH1sYsCSyxB9uXi1DPb9oomF6U4lH7Q1gvKa7xX6o9rO+QxIHduKhyNf908nAX1ueP
         kbAY+J2mr03glNJPEpgT97PwdaGqHC+OnYJeqrYYXHR65gyuhfXEV6OmoACBEiSzfK
         rttUvOPqo/jZA==
Received: by mail-ej1-f50.google.com with SMTP id jx16so11115579ejb.10;
        Thu, 07 Jan 2021 11:02:20 -0800 (PST)
X-Gm-Message-State: AOAM530fWx557vdWBUtW3JVQqqEcCxT5rr+/5LOUeN8oq2xnw09fnufj
        FVj/LWNwiZ9EHvSQK/sBIYaMuuKXn3PcZ1spBQ==
X-Google-Smtp-Source: ABdhPJzSOhiLtuwC0AOfF/dJCQPjohzs36dVzzBpRAyXqzab3yXw9Q53sB/TVrj7BjS+gNHtCNXY41OIMTOKGMhEoyo=
X-Received: by 2002:a17:906:4146:: with SMTP id l6mr138538ejk.341.1610046138784;
 Thu, 07 Jan 2021 11:02:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609844956.git.viresh.kumar@linaro.org> <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
In-Reply-To: <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 7 Jan 2021 12:02:06 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+DFF0tRv61XCAGLJYYu=ow8Ah8prd6su=6dpoU_AyMXw@mail.gmail.com>
Message-ID: <CAL_Jsq+DFF0tRv61XCAGLJYYu=ow8Ah8prd6su=6dpoU_AyMXw@mail.gmail.com>
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
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

On Wed, Jan 6, 2021 at 10:35 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Jan 6, 2021 at 12:21 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Tue, Jan 5, 2021 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > Hello,
> > >
> > > Here is an attempt to make some changes in the kernel to allow building
> > > of device tree overlays.
> > >
> > > While at it, I would also like to discuss about how we should mention
> > > the base DT blobs in the Makefiles for the overlays, so they can be
> > > build tested to make sure the overlays apply properly.
> > >
> > > A simple way is to mention that with -base extension, like this:
> > >
> > > $(overlay-file)-base := platform-base.dtb
> > >
> > > Any other preference ?
>
>
>
> Viresh's patch is not enough.
>
> We will need to change .gitignore
> and scripts/Makefile.dtbinst as well.
>
>
> In my understanding, the build rule is completely the same
> between .dtb and .dtbo
> As Rob mentioned, I am not sure if we really need/want
> a separate extension.
>
>
> A counter approach is to use an extension like '.ovl.dtb'
> It clarifies it is an overlay fragment without changing
> anything in our build system or the upstream DTC project.
>
> We use chained extension in some places, for example,
> .dt.yaml for schema yaml files.
>
>
>
> dtb-$(CONFIG_ARCH_FOO) += \
>     foo-board.dtb \
>     foo-overlay1.ovl.dtb \
>     foo-overlay2.ovl.dtb
>
>
> Overlay DT source file names must end with '.ovl.dts'

I like that suggestion as then it's also clear looking at the source
files which ones are overlays. Or we'd need .dtso to be consistent.


> > I think we'll want something similar to how '-objs' works for modules:
> >
> > foo-board-1-dtbs := foo-board.dtb foo-overlay1.dtbo
> > foo-board-2-dtbs := foo-board.dtb foo-overlay2.dtbo
> > foo-board-1-2-dtbs := foo-board.dtb foo-overlay1.dtbo foo-overlay2.dtbo
> > dtbs-y += foo-board-1.dtb foo-board-2.dtb foo-board-1-2.dtb
> >
> > (One difference here is we will want all the intermediate targets
> > unlike .o files.)
> >
> > You wouldn't necessarily have all the above combinations, but you have
> > to allow for them. I'm not sure how we'd handle applying any common
> > overlays where the base and overlay are in different directories.
>
>
> I guess the motivation for supporting -dtbs is to
> add per-board -@ option only when it contains *.dtbo pattern.

I hadn't thought that far, but yeah, that would be good. Really, I
just want it to be controlled per SoC family at least.

> But, as you notice, if the overlay files are located
> under drivers/, it is difficult to add -@ per board.

Generally, they shouldn't be. The exceptions are what we already have
there which are old dt fixups and unittests.

We want the stripped DT repo (devicetree-rebasing) to have all this
and drivers/ is stripped out. (Which reminds me, the DT repo will need
some work to support all this. It's a different build sys.)

> Another scenario is, some people may want to compile
> downstream overlay files (i.e. similar concept as external modules),
> then we have no idea which base board should be given with the -@ flag.
>
>
> I'd rather be tempted to add it globally
>
>
> ifdef CONFIG_OF_OVERLAY
> DTC_FLAGS += -@
> endif

We've already rejected doing that. Turning on '-@' can grow the dtb
size by a significant amount which could be problematic for some
boards.


> > Another thing here is adding all the above is not really going to
> > scale on arm32 where we have a single dts directory. We need to move
> > things to per vendor/soc family directories. I have the script to do
> > this. We just need to agree on the vendor names and get Arnd/Olof to
> > run it. I also want that so we can enable schema checks by default
> > once a vendor is warning free (the whole tree is going to take
> > forever).
>
>
> If this is a big churn, perhaps we could make it extreme
> to decouple DT and Linux-arch.

I would be fine with that, but I don't think we'll get agreement
there. With that amount of change, we'll be discussing git submodule
again.

Rereading the thread on vendor directories[1], we may just move boards
one vendor at a time. We could just make that a prerequisite for
vendor supporting overlays.

> arch/*/boot/dts/*.dts
>  ->  dts/<vendor>/*.dts
>
> Documentation/devicetree/bindings
>  -> dts/Bindings/
>
> include/dt-bindings/
>  -> dts/include/dt-bindings/
>
>
>
> Then, other project can take dts/
> to reuse for them.

This is already possible with devicetree-rebasing.git. Though it is
still by arch.

Rob

[1] https://lore.kernel.org/linux-devicetree/20181204183649.GA5716@bogus/
