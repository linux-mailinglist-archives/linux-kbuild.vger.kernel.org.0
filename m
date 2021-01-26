Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588C5304810
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 20:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388364AbhAZFwJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 00:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727406AbhAZDnE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 22:43:04 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864C7C061574;
        Mon, 25 Jan 2021 19:42:24 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id u20so6173855qku.7;
        Mon, 25 Jan 2021 19:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oMApGJJuxI7H3UBT71XHcnRSpOkMBPrIGTSp5eFj79c=;
        b=foccLgkNTCOLz/2iC22r/6M52N61hC6QPPewcSjZ/bVyjz9QW4+xf/GuSSYPj0x7Xt
         2XAXMJ1cP34xW7POfqxr1r0HA1n19pkETLk0NBD9cBhZvyXBT/Naxn4EcQZI+bkKFO6P
         awkyX2zuCVC3bb4dQmT6vD01z6cMENrFwN7Eo1gGmcyzMbMpZRsIdWXN5J/2grkQTqi5
         X1Ih4HLEp4UlkzzUl1nx9hz0z2PLA2HTIYc9n4Kv9sbhoMwC2DBWDzSHdvPwmtBKCSUo
         IxI9RN3oEjwLSEMDM17YdP10AuZKL8Uxa+Jkk6pNcQv88K0E88VkrdGpTYHB+eQaQt5j
         1h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oMApGJJuxI7H3UBT71XHcnRSpOkMBPrIGTSp5eFj79c=;
        b=dRU0NfiJ8RHW7xIPAlr+FIGfY037SMxbZksVs8v61BVVSd3KFPI7I2T0MbAUV5NRHR
         5VG/XaDg/Zbj//0cw5rmEC0m6SSx3bItH+Dhvwo/mNorWZfs4w8YpdwYgDdmplbZ5ZDM
         jBD3aDdUEr6wniYqSlV2nw9xIgE7UfRVVGHmSymBx42ZOWcQiixoO4KrNKXLFgPfBtHp
         m/WE9Ap+hdtOwXvKneLaZkg6Ey9wSvFghAn2h2kbnzM0nNQFQ4io57DTgVfyOCzfeOKp
         6KFvrPNC1/cSh7ZUnU8hL3h8bWZvHqyNyc4Ji/vXP2bYjRdabIujoAw3RYDYOtBaFCIa
         1iiA==
X-Gm-Message-State: AOAM531CEoQeOSnW0kKD271R2DCKTrRf55DDxagHv3eMFgeYeAPA1cEy
        qmivNdekAmo1H94ySwfu0eE=
X-Google-Smtp-Source: ABdhPJwd6CfVKu7QQrFyOUkAOmgkR1je3z4q9lzDusuYmWQH+WoVteXZGL3vorVEWqfdo0ABcO7dAw==
X-Received: by 2002:a05:620a:1241:: with SMTP id a1mr3951736qkl.405.1611632543671;
        Mon, 25 Jan 2021 19:42:23 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id s15sm12472541qtn.35.2021.01.25.19.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 19:42:23 -0800 (PST)
Subject: Re: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
To:     David Gibson <david@gibson.dropbear.id.au>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
 <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
 <20210120051740.yph4v7zldvs7szdz@vireshk-i7>
 <20210122063455.GE4400@yekko.fritz.box>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <83242f56-19a5-6d32-c050-8d9f63ac1e47@gmail.com>
Date:   Mon, 25 Jan 2021 21:42:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122063455.GE4400@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi David,

On 1/22/21 12:34 AM, David Gibson wrote:
> On Wed, Jan 20, 2021 at 10:47:40AM +0530, Viresh Kumar wrote:
>> +David.
>>
>> On 19-01-21, 11:12, Frank Rowand wrote:
>>> On 1/12/21 2:28 AM, Viresh Kumar wrote:
>>>> We will start building overlays for platforms soon in the kernel and
>>>> would need fdtoverlay tool going forward. Lets start fetching and
>>>> building it.
>>>>
>>>> While at it, also remove fdtdump.c file, which isn't used by the kernel.
>>>>
>>>> V4:
>>>> - Don't fetch and build fdtdump.c
>>>> - Remove fdtdump.c
>>>>
>>>> Viresh Kumar (3):
>>>>   scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
>>>>   scripts: dtc: Build fdtoverlay tool
>>>>   scripts: dtc: Remove the unused fdtdump.c file
>>>>
>>>>  scripts/dtc/Makefile             |   6 +-
>>>>  scripts/dtc/fdtdump.c            | 163 -------------------------------
>>>>  scripts/dtc/update-dtc-source.sh |   6 +-
>>>>  3 files changed, 8 insertions(+), 167 deletions(-)
>>>>  delete mode 100644 scripts/dtc/fdtdump.c
>>>>
>>>
>>> My first inclination was to accept fdtoverlay, as is, from the upstream
>>> project.
>>>
>>> But my experiences debugging use of fdtoverlay against the existing
>>> unittest overlay files has me very wary of accepting fdtoverlay in
>>> it's current form.
>>>
>>> As an exmple, adding an overlay that fails to reply results in the
>>> following build messages:
>>>
>>>    linux--5.11-rc> make zImage
>>>    make[1]: Entering directory '/local/frowand_nobackup/src/git_linus/build/dragon_linus_5.11-rc'
>>>      GEN     Makefile
>>>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/checksyscalls.sh
>>>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/atomic/check-atomics.sh
>>>      CHK     include/generated/compile.h
>>>      FDTOVERLAY drivers/of/unittest-data/static_test.dtb
>>>
>>>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTFOUND
>>>    make[4]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/drivers/of/unittest-data/Makefile:96: drivers/of/unittest-data/static_test.dtb] Error 1
>>>    make[3]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/Makefile.build:496: drivers/of/unittest-data] Error 2
>>>    make[2]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/Makefile.build:496: drivers/of] Error 2
>>>    make[1]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/Makefile:1805: drivers] Error 2
>>>    make[1]: Leaving directory '/local/frowand_nobackup/src/git_linus/build/dragon_linus_5.11-rc'
>>>    make: *** [Makefile:185: __sub-make] Error 2
>>>
>>>
>>> The specific error message (copied from above) is:
>>>
>>>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTFOUND
>>>
>>> which is cryptic and does not even point to the location in the overlay that
>>> is problematic.  If you look at the source of fdtoverlay / libfdt, you will
>>> find that FDT_ERR_NOTFOUND may be generated in one of many places.
>>>
>>> I do _not_ want to do a full review of fdtoverlay, but I think that it is
>>> reasonable to request enhancing fdtoverlay in the parent project to generate
>>> usable error messages before enabling fdtoverlay in the Linux kernel tree.
> 

> That's... actually much harder than it sounds.  fdtoverlay is
> basically a trivial wrapper around the fdt_overlay_apply() function in
> libfdt.  Matching the conventions of the rest of the library, really
> it's only way to report errors is a single error code.
> 
> Returning richer errors is not an easy problem in a C library,
> especially one designed to be usable in embedded systems, without an
> allocator or much else available.
> 
> Of course it would be possible to write a friendly command line tool
> specifically for applying overlays, which could give better errors.
> fdtoverlay as it stands isn't really that - it was pretty much written
> just to invoke fdt_overlay_apply() in testcases.

Thank you for providing that context.

I do not know if there is a way to enable the code that is currently in libfdt
to both be useful as an embedded library (for example, U-boot seems to often
have a need to keep memory usage very small) and also be part of a tool with
effective warning and error messages.

Before having looked at libfdt only at a cursory level while debugging the proposed
use of fdtoverlay in Linux, my first thought was that maybe it would be possible
to add warning and error messages within "#ifdef" blocks, or other ways that
cause the error code to _not_ be compiled as part of library version of libfdt,
but only be compiled as part of fdtoverlay _when built in the Linux kernel_
(noting that the proposed Linux patch builds the libfdt files as part of
the fdtoverlay compile instead of as a discrete library).  After looking at
the libfdt source a tiny bit more carefully, I would probably shoot down this
suggestion, as it makes the source code uglier and harder to understand and
maintain for the primary purpose of being an embedded library.

Do you have any thoughts on how warning and error messages could be added,
or if it is even possible?  Or maybe your suggestion of writing a "friendly
command line tool specifically for applying overlays" is the path that
Viresh should pursue?

-Frank

> 
>>> fdtoverlay in it's current form adds a potential maintenance burden to me
>>> (as the overlay maintainer).  I now have the experience of how difficult it
>>> was to debug the use of fdtoverlay in the context of the proposed patch to
>>> use it with the devicetree unittest overlay .dtb files.
>>>
>>> -Frank
>>
> 

