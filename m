Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD59F46DDA4
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Dec 2021 22:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237329AbhLHVfh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Dec 2021 16:35:37 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:40000 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234396AbhLHVfg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Dec 2021 16:35:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 47562CE2399;
        Wed,  8 Dec 2021 21:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CEFC341CA;
        Wed,  8 Dec 2021 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638999121;
        bh=yhrzuMW9YYQ7UR0VBpz4C0h74qTHz8keosLP2Pf/vio=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Mml5LULHYenyToqH6V6LXxc6yhqpP5JPmiaYYJDBAahG9Dzuk8KJ/364S9i+/R9Hm
         txfgFhVSC4Q9X7wEz5AniMaroB9BFO7bwQz5wLjbbS3DdoJp0TBptgrMCx5L0dMu/E
         +eW7MQ/5l5G632FfH8c6qfe4P6xzDc/JHb6CIsT90rROMPRRFZrtcPgUFUmk7fVYFj
         +tTuuPKtV7s976AcJZcwOk0NECn3qZGx8JAbfeLz35OBPy7RBmWRgHbY9ObdJC6Lgm
         z32u3l/hgrN0A+qBWWfupjW+mPhnEokclbT8/cAovyaw9+GwUJyQJio6LH9pVU0op9
         p5rOASrKLKnKQ==
Received: by mail-ed1-f44.google.com with SMTP id t5so13094286edd.0;
        Wed, 08 Dec 2021 13:32:01 -0800 (PST)
X-Gm-Message-State: AOAM530U+hIEKqc8DSX8/Gwh0W8D/qIrv0rTgEliLGMzCORRER3IWU6N
        nVpGr2BiJ4Ja4AoY2o5dbCoNxVjd6iafqTv2/A==
X-Google-Smtp-Source: ABdhPJxR12yWCxhEZ+okix4EY0gXy1Xr5hoe1N6Uc2GmwXxG9eWnj8jvtLZaWjb+VzJpJ6iTANmHfu3YKthHUUjupQY=
X-Received: by 2002:a17:907:3f24:: with SMTP id hq36mr10407723ejc.390.1638999119781;
 Wed, 08 Dec 2021 13:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20210913145146.766080-1-robh@kernel.org> <cc083619-3744-5979-4750-9c26f016505c@alliedtelesis.co.nz>
In-Reply-To: <cc083619-3744-5979-4750-9c26f016505c@alliedtelesis.co.nz>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 8 Dec 2021 15:31:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKqcCD+0ymW_km874A+HMeONBCF5Zgu352mwr-nNjDeqA@mail.gmail.com>
Message-ID: <CAL_JsqKqcCD+0ymW_km874A+HMeONBCF5Zgu352mwr-nNjDeqA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable DT schema checks for %.dtb targets
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 6, 2021 at 1:34 AM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
> Hi Rob,
>
> On 14/09/21 2:51 am, Rob Herring wrote:
> > It is possible to build a single dtb, but not with DT schema validation
> > enabled. Enable the schema validation to run for %.dtb and %.dtbo
> > targets. Anyone building a dtb for a specific platform *should* pay
> > attention to schema warnings.
> >
> > This could be supported with a separate %.dt.yaml target instead.
> > However, the .dt.yaml format is considered an intermediate format and
> > could possibly go away at some point if schema checking is integrated
> > into dtc. Also, the plan is to enable the schema checks by default once
> > platforms are free of warnings, and this is a move in that direction.
>
> Just started building 5.16-rc4 and hit the following error
>
> /usr/src/linux/scripts/dtc/Makefile:23: *** dtc needs libyaml for DT
> schema validation support. Install the necessary libyaml development
> package..  Stop.
> make: *** [/usr/src/linux/Makefile:1405: scripts_dtc] Error 2
> make: *** Waiting for unfinished jobs....
>
> I tracked it back to this patch and I gather that the "error" is very
> much intended. Fixing it means I need to get a native libyaml into my
> cross toolchain, which is doable but a bit of a hassle. This probably
> affects other meta build systems like buildroot and yocto.

Yes. I'm going to revert this for now.

Are python dependencies any easier? The libyaml dtc dependency may
actually go away, but dtschema and it's dependencies will remain.

> I think I understand what you're getting at but is it possible to have
> some kind of escape hatch to avoid having to add a build time tool
> dependency (or even bundling libyaml next to scripts/dtc)?

My current thought is to make it a kconfig option. I assume that would
work for you?

> I also notice that when I do supply a toolchain with libyaml the build
> times are impacted by a noticable factor.

How many dtbs are you building?

Rob
