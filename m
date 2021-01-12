Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0D12F2356
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 01:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404214AbhALA0G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 19:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404262AbhALATO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 19:19:14 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF471C061575;
        Mon, 11 Jan 2021 16:18:33 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id 143so486812qke.10;
        Mon, 11 Jan 2021 16:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Va/TLHmqTzdYftUsGU9spJw7iP1vfidQ10JPpryt9Is=;
        b=Iq012b9t+WTc6JSfohiCHiYNlwMX1VkqWu/AGVuQSdRExanJLG9nrlSFIEUcdyZE90
         BN4RzkGBxP+YVJy6eTJZ7DBoNepMNXVpZE3urE23uBTp05Fil3a6LMGB5DA9/qBcwqHc
         uWqZtVfbkwEsBAr4mWpcW+Sr4Q7ll4K7zLmv6zEJtQ1+a9M+U9MlwvRCh3Y63AWVxt4J
         B+Z1XnD4iYYoqIU/+JOlzjgaOxlu2WAySwHewIUyklzc+E0L/PpxfIPmw3hKb36fgbRG
         eyxdvzQ5mpbwamQJF8CXizEx0jmFIHYCJxp31pCC4Q5hUMroezbfU36Y+fg9v29ffwG1
         kkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Va/TLHmqTzdYftUsGU9spJw7iP1vfidQ10JPpryt9Is=;
        b=CMfaVR0ElR+O3fhAHJY1SnqTEIRoJ5GvZcxOv2BDFl4o5dFkbWYUM7Oi3P7lY6hRUU
         yLMTUb9O56hGqZMvnrCx2uBRLaMhDWf5LV22x6NlHS7qC2O86mqyjQxgwVxnUDx1zqI+
         TcHdrRM12lfLiSiM02q7KheJgO7QUAYaxhkZ8riaLtTYDFcVuoRLLCk/6nZXJ4bgtbh1
         hmdcacQFfKJ/A9xM+nZSgEJIX1gmyJBB3HRcF5ksULVGTbaMYhYLokTEZoLsAzy++RbO
         9dzFC5fOYv1zRwzj5OHc19vsLVYuc8UZKZwYEjdRoalJYNI7uD9m2AKmfYCyOsmnRuCW
         XWxQ==
X-Gm-Message-State: AOAM533w8lQIZLrU/otYFXGMXWQx7w53NeDiYwucYqYR1kb+abOL3v5o
        kGzGqca9kxMjVwh4i8IcqIg=
X-Google-Smtp-Source: ABdhPJxTUT248a6O8eOgQVfKzG+XKSwwI2gOBNq9EepACUb3DuLXKP+WDI7hZcrYp0KCnxPvEQTHkw==
X-Received: by 2002:a37:a155:: with SMTP id k82mr1945836qke.290.1610410712948;
        Mon, 11 Jan 2021 16:18:32 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id u65sm683597qkb.58.2021.01.11.16.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 16:18:32 -0800 (PST)
Subject: Re: [RFC 2/2] scripts: dtc: Handle outform dtbo
To:     Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
References: <cover.1609844956.git.viresh.kumar@linaro.org>
 <7aa70809eff3f32d821761d2a763e4fb72ecc8fb.1609844956.git.viresh.kumar@linaro.org>
 <CAL_Jsq+0dL=LHo8r9mY_weBP_bQ97UOBnt596J3JoVHwGNinHA@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <500e233e-77d5-698c-cca5-7f6f1cbb890e@gmail.com>
Date:   Mon, 11 Jan 2021 18:18:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+0dL=LHo8r9mY_weBP_bQ97UOBnt596J3JoVHwGNinHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/5/21 9:37 AM, Rob Herring wrote:
> On Tue, Jan 5, 2021 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>> Update dtc compiler to accept dtbo as an outform.
>>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>
>> ---
>> I feel that this needs to go directly to
>> https://git.kernel.org/pub/scm/utils/dtc/dtc.git
>>
>> Right ? I will send it separately if the idea is accepted here.
> 
> Yes, needs to go to devicetree-compiler list. I think this came up
> before and IIRC David wasn't completely in agreement. I looked briefly
> and couldn't find the thread though...
> 
> We really don't need a different extension because we could just
> examine the dtb to determine if it is an overlay or not. That's less
> obvious. We could also add meta-data to overlays defining what base
> they apply to. If we had that, a tool could just list all overlays

It may be valid to apply an overlay may be valid to more than one base FDT.

And for connector nodes and plugin overlays (which do not exist yet, I'm
way behind on bringing that concept forward), a single overlay may be
applied to more than one connector node in the base FDT.

> that should apply to a base and we could use that info for build time
> applying overlays. Of course, that and a dtbo extension/format are not
> mutually exclusive.
> 
>> ---
>>  scripts/dtc/dtc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/dtc/dtc.c b/scripts/dtc/dtc.c
>> index bdb3f5945699..40fa7128b3d6 100644
>> --- a/scripts/dtc/dtc.c
>> +++ b/scripts/dtc/dtc.c
>> @@ -357,6 +357,8 @@ int main(int argc, char *argv[])
>>  #endif
>>         } else if (streq(outform, "dtb")) {
>>                 dt_to_blob(outf, dti, outversion);
>> +       } else if (streq(outform, "dtbo")) {
>> +               dt_to_blob(outf, dti, outversion);
>>         } else if (streq(outform, "asm")) {
>>                 dt_to_asm(outf, dti, outversion);
>>         } else if (streq(outform, "null")) {
> 
> You also need to extend guess_type_by_name().
> 
> 
> Rob
> 

