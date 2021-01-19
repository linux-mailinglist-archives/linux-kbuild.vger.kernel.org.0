Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDA92FBD42
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 18:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390786AbhASRNF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 12:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390680AbhASRMy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 12:12:54 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EC9C061573;
        Tue, 19 Jan 2021 09:12:13 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id v5so14199831qtv.7;
        Tue, 19 Jan 2021 09:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8ZydUd6iysbYazKads1ipIIW9R1NAHfYqDDc67KX+ok=;
        b=GUDFIcbbkZ0IKIM4c9iEcy1neGW1Am8AUsPJaK5r+I0x8/XC+qJ6nYm3gtQT7I7rTm
         oLGRvD0Mwza9JzaPlkt+gSugq+ltoro+jO/Q2yMEBAU0Ea8cwM1lPfatTuoW2x40vhFf
         f17G5DKs6UpamngxVSM02PtXFwA1KrGZN/f847VB29EZIdE1zgOSa5g9skse6P62x60W
         iceQoQyyFtru7OzdGAzm7sCqJ7/VYs7xi7DR4NRWjZRctUd83LRJadIvFEv+vEHYkhCb
         /r456Iiat+2ErGvhEjsUVHSGSaebp36nT7hh72DnOxAVZMg9j6INS4YJ795MSUSWZMXa
         wQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ZydUd6iysbYazKads1ipIIW9R1NAHfYqDDc67KX+ok=;
        b=nUQ+t3rJ8ZZGF5eKMduGbM2gmnZfccks3LoNrUUXquhPkKvCLwBkOG3FyoW3U6s2aJ
         9WiiLVBOE2A/9RnNroS2yxJKRmlXpjKRKOwitHifWP6+D+uPuCz654V1/puD5TfLVqY3
         /xTePq5OA/Uk+fmx+ut6iHw5oerEczIVlUnRUREC6S2i1IpYImDF/1iIil3qVYiffL6Q
         I3rtJpU9jVp3k58VxLqbpq2sZy9RHQYkAb9RGf2PxG4xi9dtDAgiKjryEXatO38m+ggs
         Go1VfSlAvF2C9GnVySXQv9//JwBsynXksNBaU1aFUWTMqWkLpiaiPZBAW0gznyp7G6mp
         E4xA==
X-Gm-Message-State: AOAM531vzu2zvuK0hmlYRBzGtgZYgK3+kzsX5aT63WlNIGxgKOuqpzwS
        wFKb2B/FWo/ZFgE8onWHnAQ=
X-Google-Smtp-Source: ABdhPJwtroIpxWtBHKcJeF05ADTjF0q/OCbvAPWrC+faW3VgLBMJHBUy/U1Ri2mRYv4Wi61jkGQBRw==
X-Received: by 2002:aed:2f67:: with SMTP id l94mr5244724qtd.201.1611076333155;
        Tue, 19 Jan 2021 09:12:13 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id j66sm495062qkf.78.2021.01.19.09.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 09:12:12 -0800 (PST)
Subject: Re: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
Date:   Tue, 19 Jan 2021 11:12:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1610431620.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/12/21 2:28 AM, Viresh Kumar wrote:
> We will start building overlays for platforms soon in the kernel and
> would need fdtoverlay tool going forward. Lets start fetching and
> building it.
> 
> While at it, also remove fdtdump.c file, which isn't used by the kernel.
> 
> V4:
> - Don't fetch and build fdtdump.c
> - Remove fdtdump.c
> 
> Viresh Kumar (3):
>   scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
>   scripts: dtc: Build fdtoverlay tool
>   scripts: dtc: Remove the unused fdtdump.c file
> 
>  scripts/dtc/Makefile             |   6 +-
>  scripts/dtc/fdtdump.c            | 163 -------------------------------
>  scripts/dtc/update-dtc-source.sh |   6 +-
>  3 files changed, 8 insertions(+), 167 deletions(-)
>  delete mode 100644 scripts/dtc/fdtdump.c
> 

My first inclination was to accept fdtoverlay, as is, from the upstream
project.

But my experiences debugging use of fdtoverlay against the existing
unittest overlay files has me very wary of accepting fdtoverlay in
it's current form.

As an exmple, adding an overlay that fails to reply results in the
following build messages:

   linux--5.11-rc> make zImage
   make[1]: Entering directory '/local/frowand_nobackup/src/git_linus/build/dragon_linus_5.11-rc'
     GEN     Makefile
     CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/checksyscalls.sh
     CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/atomic/check-atomics.sh
     CHK     include/generated/compile.h
     FDTOVERLAY drivers/of/unittest-data/static_test.dtb

   Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTFOUND
   make[4]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/drivers/of/unittest-data/Makefile:96: drivers/of/unittest-data/static_test.dtb] Error 1
   make[3]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/Makefile.build:496: drivers/of/unittest-data] Error 2
   make[2]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/Makefile.build:496: drivers/of] Error 2
   make[1]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/Makefile:1805: drivers] Error 2
   make[1]: Leaving directory '/local/frowand_nobackup/src/git_linus/build/dragon_linus_5.11-rc'
   make: *** [Makefile:185: __sub-make] Error 2


The specific error message (copied from above) is:

   Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTFOUND

which is cryptic and does not even point to the location in the overlay that
is problematic.  If you look at the source of fdtoverlay / libfdt, you will
find that FDT_ERR_NOTFOUND may be generated in one of many places.

I do _not_ want to do a full review of fdtoverlay, but I think that it is
reasonable to request enhancing fdtoverlay in the parent project to generate
usable error messages before enabling fdtoverlay in the Linux kernel tree.

fdtoverlay in it's current form adds a potential maintenance burden to me
(as the overlay maintainer).  I now have the experience of how difficult it
was to debug the use of fdtoverlay in the context of the proposed patch to
use it with the devicetree unittest overlay .dtb files.

-Frank
