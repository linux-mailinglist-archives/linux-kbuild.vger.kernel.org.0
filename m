Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9692F41B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 03:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbhAMCVe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 21:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbhAMCVd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 21:21:33 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D90C061575;
        Tue, 12 Jan 2021 18:20:53 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id h16so170511qvu.8;
        Tue, 12 Jan 2021 18:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NgfCLjdwiV5IrR3V5SLx5kGDk48Gn9FbHwenzcY7+rk=;
        b=VfLpcZJMdB9v9AqwCKEMsMPi/PjXlimaCzfo1oC6qPni5B+ehy6IGyA0W+e4uyW3Vx
         cWOYOElkYhdhzsghvFAkW7rKTammIBSohMa1+18xwRSpsYdUvnbFXcozxR5Af9wjuUwz
         xhn/C7ZZGbafTaFZ8KVgYz+Y1coNJV/VA8cmam1vTZJl7MgPaqUBY2IMeCa0CyMO0JeI
         1sieeEyLl1tve7HbQ+hxSjGta0lTvtDEfUsqdF+Io7vDw99DiNuIqraC/7iIaxcdRfRR
         vgWhpw1btdBuKlfFufgcR3xTvvhk45d1XBWGpZKjcKpVFutWetKK/by3veOqqIQAsbCi
         8g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NgfCLjdwiV5IrR3V5SLx5kGDk48Gn9FbHwenzcY7+rk=;
        b=Te/ysK77+xqGxxA+//0eRDBCeFdukyZ97VMQNJAq/bsLBEe/sxRqX6dKQU2EySvdrI
         j0qfR4pmVlWDi8ELkalblmsv0WKlYjmKmbkMziXzKYNZxq7ETL7qm2vXTBdBQCoaT+6p
         imgvY+KHkoxhd3zXM0jM3kzKg4QbvI4lM7XAqATWyOKQdw0+oidoGgrPLBfthUIpfsfW
         kMTGgFPnE4bRO3VRRtLgRDlVE6znmYpvUTzK+Zl4Lui1hLEj8Rus5hS5ORaO2+QtYcBZ
         HvEj77BpT56+ZQeMAISqanH7R5GymI9Qek5P+2aTNTb1TwUyXGew6LCh98vSyqjiyjdU
         QUOA==
X-Gm-Message-State: AOAM531ER3CmU6DGODG67KCaZ/57hIuReZWwJEsffxtXxgZ7rxjxmqOq
        pEgpt3exzS0eonNxN4A2/Jg=
X-Google-Smtp-Source: ABdhPJy7K3o2EKyUD6DXtbtRoXSjnG5m9QHY73yrysPBjQgPvzMVMLsqnE435PDzn6dQVdj9fBuNmQ==
X-Received: by 2002:ad4:584b:: with SMTP id de11mr2288170qvb.15.1610504452307;
        Tue, 12 Jan 2021 18:20:52 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id u4sm280080qtv.49.2021.01.12.18.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 18:20:51 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com>
 <CAL_JsqKqSVGCjcue=ka2=bB1Os9pczNTCqDeaoFPFfRxnvsteQ@mail.gmail.com>
 <e549c7ce-d01e-08a3-9ed0-7325a34e9c29@gmail.com>
 <CAL_Jsq+W4X5H2myCzX1bGTEqJG9dpwLXdmqbpq6oGm5wpF7WMQ@mail.gmail.com>
 <de50f7a5-d0d7-86b0-a1eb-84a91438b586@gmail.com>
 <CAL_JsqLMeX_f-TpX4j5tgxJOxDafP9tiunvcF_Ed4MGV90982A@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <5a243fb8-b264-0529-4213-ffd47799f873@gmail.com>
Date:   Tue, 12 Jan 2021 20:20:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLMeX_f-TpX4j5tgxJOxDafP9tiunvcF_Ed4MGV90982A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/12/21 2:46 PM, Rob Herring wrote:
> On Tue, Jan 12, 2021 at 2:05 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 1/12/21 1:41 PM, Rob Herring wrote:
>>> On Tue, Jan 12, 2021 at 1:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>
>>>> On 1/12/21 8:04 AM, Rob Herring wrote:
>>>>> On Mon, Jan 11, 2021 at 4:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>>>
>>>>>> On 1/8/21 2:41 AM, Viresh Kumar wrote:
>>>>>>> Now that fdtoverlay is part of the kernel build, start using it to test
>>>>>>> the unitest overlays we have by applying them statically.
>>>>>>>
>>>>>>> The file overlay_base.dtb have symbols of its own and we need to apply
>>>>>>> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
>>>>>>> us intermediate-overlay.dtb file.
>>>>>>>
>>>>>>> The intermediate-overlay.dtb file along with all other overlays is them
>>>>>>> applied to testcases.dtb to generate the master.dtb file.
>>>>>>>
>>>>>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>>>>>
>>>>>> NACK to this specific patch, in its current form.
>>>>>>
>>>>>> There are restrictions on applying an overlay at runtime that do not apply
>>>>>> to applying an overlay to an FDT that will be loaded by the kernel during
>>>>>> early boot.  Thus the unittest overlays _must_ be applied using the kernel
>>>>>> overlay loading methods to test the kernel runtime overlay loading feature.
>>>>>
>>>>> This patch doesn't take away from any of that and it completely orthogonal.
>>>>
>>>> Mea culpa.  I took the patch header comment at face value, and read more into
>>>> the header comment than what was written there.  I then skimmed the patch
>>>> instead of actually reading what it was doing.
>>>>
>>>> I incorrectly _assumed_ (bad!) that the intent was to replace applying the
>>>> individual overlay dtb's with the master.dtb.  Reading more closely, I see
>>>> that the assumed final step of actually _using_ master.dtb does not exist.
>>>>
>>>> So, yes, I agree that the patch as written is orthogonal to my concern.
>>>>
>>>> My updated understanding is that this patch is attempting to use the existing
>>>> unittest overlay dts files as source to test fdtoverlay.  And that the resulting
>>>> dtb from fdtoverlay is not intended to be consumed by the kernel unittest.
>>>
>>> The goal is not to test fdtoverlay. dtc unittests do that. The goal is
>>> testing overlays we expect to be able to apply can actually apply and
>>> doing this at build time. That's also the goal for all the 'real'
>>> overlays which get added.
>>>
>>>> I do not agree that this is a good approach to testing fdtoverlay.  The
>>>> unittest overlay dts files are constructed specifically to test various
>>>> parts of the kernel overlay code and dynamic OF code.  Some of the content
>>>> of the overlays is constructed to trigger error conditions in that code,
>>>> and thus will not be able to be processed without error by fdtoverlay.
>>>
>>> Then those should be omitted.
>>>
>>>> Trying to use overlay dts files that are constructed to test runtime kernel
>>>> code as fdtoverlay input data mixes two different test environments and
>>>> objectives.  If fdtoverlay test cases are desired, then fdtoverlay specific
>>>> dts files should be created.
>>>>
>>>>>
>>>>>> I agree that testing fdtoverlay is a good idea.  I have not looked at the
>>>>>> parent project to see how much testing of fdtoverlay occurs there, but I
>>>>>> would prefer that fdtoverlay tests reside in the parent project if practical
>>>>>> and reasonable.  If there is some reason that some fdtoverlay tests are
>>>>>> more practical in the Linux kernel repository then I am open to adding
>>>>>> them to the Linux kernel tree.
>>>>>
>>>>> If you (or more importantly someone else sending us patches) make
>>>>> changes to the overlays, you can test that they apply at build time
>>>>> rather than runtime. I'll take it! So please help on fixing the issue
>>>>> because I want to apply this.
>>>>
>>>> If the tests can be added to the upstream project, I would much prefer
>>>> they reside there.  If there is some reason a certain test is more
>>>> suited to be in the Linux kernel source tree then I also would like
>>>> it to be accepted here.
>>>
>>> Again, this is just about doing sanity checks at build time rather
>>> than *only* rely on runtime.
>>
>> I'm fine with adding tests for applying overlays at build time (in
>> other words, tests of fdtoverlay).
> 

> Again, it's not tests of fdtoverlay. It's a test of the dts files. We
> are testing that an overlay dts can apply to the base dts we claim it
> applies. If the overlay dts has crap then we'll catch it.
> 
> We shouldn't accept overlays that can't apply to a base in the kernel
> tree. That's either because it's broken or because the base doesn't
> exist. With the exception of overlays designed to fail for tests,
> unittest overlays should not be any different.

I understood the goal to be testing fdtoverlay.  I'll switch my mind
set to the goal being a test of dts files.

We already know that unittest overlays that are expected to be valid
can apply successfully.  The run time unittests already check for that.
I don't see any value in adding a build time test for the same thing
_for unittest overlay dts files_.  And I do see an ongoing maintenance
cost for _unittest overlay dts files_.

If you want to add build time tests for all (or some) non-unittest overlay
dts files, then I am not particularly opposed to that (but being aware that
an overlay dtb could apply on top of more than one base dtb, so there
is a possibility of an "explosion" of combinations to be maintained
in the build system).

I see value in having build time testing that overlay dtbs apply cleanly
on a base dtb.  I have heard frustration from the out of tree users of
overlays that apply the overlays via the bootloader, because if the
bootloader fails to apply an overlay it can be difficult to debug or
fix on the target computer.  Having a mechanism to specify what overlays
are intended to be applied to a base dtb, and verify that they do
apply would resolve some of those issues, assuming the boot loader
and fdtoverlay are consistent with each other.

> 
>> But the constraints on applying an overlay at build time are different
>> than the runtime constraints.
> 
> Like what specifically? Runtime is more constrained than build time.
> Or at least it should be. It's not really and that's why we have
> limited runtime applied overlay support.
> 
>> The existing unittest overlay dts files are not designed to test applying
>> overlays at build time.  Tests for fdtoverlay should be designed to test
>> that overlays that meet the build time constraints can be applied
>> properly by fdtoverlay, and that overlays that fail to meet those
>> constraints are rejected by fdtoverlay.
>>
>> Trying to use the same data (dts) files for tests that have different
>> constraints is likely to make both tests more fragile when a data file
>> is modified for one environment without careful consideration of the
>> other environment.
> 
> We're not changing nor constraining the data files. Just adding
> another sanity test on them.

For _unittest_ dts files, I see no value add.  And the cost of needing
to track _in the build system_ which unittest dts files are expected fail
to apply and which are expected to succeed.

-Frank

> 
> Rob
> 

