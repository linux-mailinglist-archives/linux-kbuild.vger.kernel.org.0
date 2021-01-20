Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6461B2FCAAC
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 06:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbhATFUZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 00:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730152AbhATFS2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 00:18:28 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A10C061575
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 21:17:44 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id q131so3436565pfq.10
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 21:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AdP7hW1OlesHEID5tzj1W4YBp6WPF3ynORuFlVktpQY=;
        b=aCG1WpRnObbidbMTgXWrQuNqvoSc5ISPy8UryM+RZxcNR4KkJhjsXP9hlf2JzH9v9D
         90PUilhBV2X/jooVXryfUCZF8Xc0ZeXyLCgQ5Eyx1qgLvxyN2w1Gxgy0PKrwf4kw2lZK
         7p7udUarJKkurU16/MWqEwQVZWlTO2fr9nJpNllp2tDK8hk4go7bhzR2VCKteCKFd7pQ
         Oq38MmyD/DsSstSPDel0KJ5ovhAUW7Q13vnH7v8ub/GHZiMrAz6B0qO/cN2Igl2nSqdP
         tyAPA4liiGIqGZYqX5LChG8RV+U7mbMzoPsI71FMiMXVnK/ZYPew1/L0GwkbohZ9Yhuz
         iI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AdP7hW1OlesHEID5tzj1W4YBp6WPF3ynORuFlVktpQY=;
        b=nVvOVsTYQDNwXMZS83VB7X3myJ7tU8fa89dn1YplJCXHmPjHY6EHLAMLcwwPad7VHw
         MlXrRkJaupHWvvgMifO5HZt0qlleM3VG2QWbKyG0Xy4o7i/eKMlmJ2HjD/vtbwJ55RoL
         VR+Len4qRHdeTNF68saZi6EcJq95ol0yQDF8UsapK/QYIT/5wG5c30Vd8284YnZJRDcB
         WO0zZbhhqn860hwwfhc6Dpdqaah3YeJxMWLEmBw3lQsr/aBkaos447ZSL4dJkGywtK1v
         eRbb1jrWsKVlPXWBiWAxyEUxb/yhWJ+13IQibm7M04UFAwFiIbXTMURFObfAiC7yks5w
         zgcg==
X-Gm-Message-State: AOAM531m6V/2Y/BXDVbYR+p3CHvieYCmxHUMV42hG9TQJjpoXqsSuIf6
        7fYy7QjFI3XykDffNPXKEBXCRQ==
X-Google-Smtp-Source: ABdhPJzuG9xbfs8VF5EZO9R/GE81fjPKxcpvTgNH/cQEq5GiXwlVXmeaQ/IXu8NzhIRGF5cb+j6Gqg==
X-Received: by 2002:aa7:8245:0:b029:1b8:da74:40ec with SMTP id e5-20020aa782450000b02901b8da7440ecmr7619373pfn.15.1611119863466;
        Tue, 19 Jan 2021 21:17:43 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id b62sm759747pfg.58.2021.01.19.21.17.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 21:17:42 -0800 (PST)
Date:   Wed, 20 Jan 2021 10:47:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
Message-ID: <20210120051740.yph4v7zldvs7szdz@vireshk-i7>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
 <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+David.

On 19-01-21, 11:12, Frank Rowand wrote:
> On 1/12/21 2:28 AM, Viresh Kumar wrote:
> > We will start building overlays for platforms soon in the kernel and
> > would need fdtoverlay tool going forward. Lets start fetching and
> > building it.
> > 
> > While at it, also remove fdtdump.c file, which isn't used by the kernel.
> > 
> > V4:
> > - Don't fetch and build fdtdump.c
> > - Remove fdtdump.c
> > 
> > Viresh Kumar (3):
> >   scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
> >   scripts: dtc: Build fdtoverlay tool
> >   scripts: dtc: Remove the unused fdtdump.c file
> > 
> >  scripts/dtc/Makefile             |   6 +-
> >  scripts/dtc/fdtdump.c            | 163 -------------------------------
> >  scripts/dtc/update-dtc-source.sh |   6 +-
> >  3 files changed, 8 insertions(+), 167 deletions(-)
> >  delete mode 100644 scripts/dtc/fdtdump.c
> > 
> 
> My first inclination was to accept fdtoverlay, as is, from the upstream
> project.
> 
> But my experiences debugging use of fdtoverlay against the existing
> unittest overlay files has me very wary of accepting fdtoverlay in
> it's current form.
> 
> As an exmple, adding an overlay that fails to reply results in the
> following build messages:
> 
>    linux--5.11-rc> make zImage
>    make[1]: Entering directory '/local/frowand_nobackup/src/git_linus/build/dragon_linus_5.11-rc'
>      GEN     Makefile
>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/checksyscalls.sh
>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/atomic/check-atomics.sh
>      CHK     include/generated/compile.h
>      FDTOVERLAY drivers/of/unittest-data/static_test.dtb
> 
>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTFOUND
>    make[4]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/drivers/of/unittest-data/Makefile:96: drivers/of/unittest-data/static_test.dtb] Error 1
>    make[3]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/Makefile.build:496: drivers/of/unittest-data] Error 2
>    make[2]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/Makefile.build:496: drivers/of] Error 2
>    make[1]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/Makefile:1805: drivers] Error 2
>    make[1]: Leaving directory '/local/frowand_nobackup/src/git_linus/build/dragon_linus_5.11-rc'
>    make: *** [Makefile:185: __sub-make] Error 2
> 
> 
> The specific error message (copied from above) is:
> 
>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTFOUND
> 
> which is cryptic and does not even point to the location in the overlay that
> is problematic.  If you look at the source of fdtoverlay / libfdt, you will
> find that FDT_ERR_NOTFOUND may be generated in one of many places.
> 
> I do _not_ want to do a full review of fdtoverlay, but I think that it is
> reasonable to request enhancing fdtoverlay in the parent project to generate
> usable error messages before enabling fdtoverlay in the Linux kernel tree.
> 
> fdtoverlay in it's current form adds a potential maintenance burden to me
> (as the overlay maintainer).  I now have the experience of how difficult it
> was to debug the use of fdtoverlay in the context of the proposed patch to
> use it with the devicetree unittest overlay .dtb files.
> 
> -Frank

-- 
viresh
