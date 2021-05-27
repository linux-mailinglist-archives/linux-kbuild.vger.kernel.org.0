Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6673933A0
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 May 2021 18:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbhE0QZX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 May 2021 12:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233702AbhE0QZX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 May 2021 12:25:23 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF63C061574;
        Thu, 27 May 2021 09:23:49 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id t17so602571qta.11;
        Thu, 27 May 2021 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sdg6PhtYpFMULY1pq6vpaLfF6qM0VMonxMRGrT127HE=;
        b=nrQQ9DDLoy4Fk2SqxWK72Zu+DNXm7owDz+tVDgB3oueHR1u2eLO2+HUrkZQvjzPyYJ
         UF5u7uUaqUxYzS94ZCIAoeCfW/tvSJ1UZOP5pLA6qcUv4haXZThjQnTKhLOvLfjlQB7p
         DYfL+UlVudfSKlGUSVEBvDy6zf03yKFp4ynryVpfJHhZwUr0irQ1HP8qbGiCDlpRdN85
         n+LtLirqlQWUfKJhgv5AyTgoIIkcJhG9cZfeCtN7eoXr6YA4kVKd5DswpKp1YCCyOnD2
         L8+nWAbObkQvvPTB1fhGjJT+tcZ05Mm0D+WBiQTBKoOT068oAHuD25+vrDXoH8LXCGS0
         5eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sdg6PhtYpFMULY1pq6vpaLfF6qM0VMonxMRGrT127HE=;
        b=cFeOJvFuDITY1D04WflQ6YZDaECTCf0SDMB3Kbm6IJPp5WdtSb75ZqDyWoDOUnG4i2
         lSoAfVTa2tSeLuy76AA0/D2q5oqpDZ92TFHB+f0QINAZF83XDhTon9jmOjzomLw1G3yh
         w3/+ayjr5ahLeH0YGaL9TovhJbFd5ZeQzLK8KxSSmEiyfpDynHjiyYmhCQq9DskadQl9
         xX1ueUyjxG5Re6IN2Lw69BD5OG611RTLJzQaH2Ucv0m0nvqGTp9lJ/LLz+u8ymIp6CpB
         rWCl0cpkv93n/15GZzLglLZrF4BrWmty3ouv9DqCfprJMtDdUpZrqZxuoiLtsKCl6HQM
         hTGQ==
X-Gm-Message-State: AOAM533BfBe7+r3+PtsQNzkXw6LaGxB3yED+s8Mk+E9oWQs3kexnel6c
        ME5vsjUEXtusSR72Xf3Xx9I=
X-Google-Smtp-Source: ABdhPJzTy11SMjF4rbFOlZJCI5frrke6OrhVmh60TaEyqybSR5SgldVsU6iKanc1NOyL2nUvyVpQYg==
X-Received: by 2002:ac8:4b45:: with SMTP id e5mr3954795qts.248.1622132629115;
        Thu, 27 May 2021 09:23:49 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id e20sm1600690qto.93.2021.05.27.09.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 09:23:48 -0700 (PDT)
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
To:     David Gibson <david@gibson.dropbear.id.au>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210324223713.1334666-1-frowand.list@gmail.com>
 <20210327174035.GA291160@robh.at.kernel.org>
 <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
 <CAMuHMdXpGKMi-xv6hZQmmEw0JO=Q0WuvUzwJ2v0O28Tx5uW+sg@mail.gmail.com>
 <d1aefaae-7b12-b5fb-4b97-7230bd52c1be@gmail.com>
 <20210526061144.yvoaurpz75a3bsjr@vireshk-i7>
 <f651e95b-feef-5c86-edba-d6008bc80b34@gmail.com> <YK70Xsl1oXeEQpWZ@yekko>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <e175ace6-36a0-bfcc-c8e4-b06553064860@gmail.com>
Date:   Thu, 27 May 2021 11:23:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK70Xsl1oXeEQpWZ@yekko>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/26/21 8:22 PM, David Gibson wrote:
> On Wed, May 26, 2021 at 04:21:48PM -0500, Frank Rowand wrote:
>> On 5/26/21 1:11 AM, Viresh Kumar wrote:
>>> On 22-04-21, 13:54, Frank Rowand wrote:
>>>> On 4/22/21 3:44 AM, Geert Uytterhoeven wrote:
>>>>> Hi Frank, Rob,
>>>>>
>>>>> On Mon, Mar 29, 2021 at 9:23 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>>> On 3/27/21 12:40 PM, Rob Herring wrote:
>>>>>>> On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wrote:
>>>>>>>> From: Frank Rowand <frank.rowand@sony.com>
>>>>>>>>
>>>>>>>> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
>>>>>>>> source file.
>>>>>>>>
>>>>>>>> Rename unittest .dts overlay source files to use .dtso suffix.
>>>>>>>
>>>>>>> I'm pretty lukewarm on .dtso...
>>>>>>
>>>>>> I was originally also, but I'm warming up to it.
>>>>>
>>>>> What's the status of this?
>>>>
>>>> I was planning to resend on top of the upcoming -rc1.
>>>
>>> Ping.
>>>
>>
>> Thanks for the prod...
>>
>> The .dtso convention was added to the dtc compiler, then a patch was
>> accepted to revert one mention of .dtso ,though there still remains
>> two location where .dtbo is still recognized (guess_type_by_name() in
>> dtc and the help text of the fdtoverlay program).
>>
>> It seems that the general .dtso and .dtbo were not popular, so I'm
>> going to drop this patch instead of continuing to try to get it
>> accepted.
> 
> AFAICT .dtbo is moderately well established, and I think it's a good
> convention, since it matters whether a blob is an overlay or base
> tree, and it's not trivial to tell which is which.
> 
> .dtso is much more recent, and I think there's much less value to it.
> 

Thanks for the correction, I misunderstood your thoughts.

-Frank
