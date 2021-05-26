Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40523921E4
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 23:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233822AbhEZVXY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 17:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbhEZVXY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 17:23:24 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B62C061574;
        Wed, 26 May 2021 14:21:51 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id k19so2027272qta.2;
        Wed, 26 May 2021 14:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2gj/LlkROzfmxz2TRlX//Re0GJdYwJFPwzyGqBnK94g=;
        b=eS/yU/lURYbeJtal6ikmkPh888eIH6tEFzKX6Lr8aUuim4LRO5d9ajEsJNSNhm4UUD
         ZoLFbC0/RLG91nkZk2AsL8AgS6Rkw4+k6pRRwUsq0Jc5DhTGdRr/tD0FzunkphavE3W2
         Qim5dgILXpCfM2Zp9M/eiP75dBMX8pq7/3DGSFyMW0yPmrP60YoUXPy3MmsG8Y8tOegq
         O6lA+EOBQSHxScXdStoUdx3IXCnzrVhQDJhv3Jy2pWYFoH+iRomE6GCe/eCAmyIdC3/a
         q214g0H60ymFefVlKim4G0PNNCZLMfjlewf/tCW9vL3CoCmDI4dX1rj/EO8VUohZk9Ww
         HwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2gj/LlkROzfmxz2TRlX//Re0GJdYwJFPwzyGqBnK94g=;
        b=ZJePLMmVQXrbLUzwhhvBg1ZSmGOKe2JSHTVGMeBedefCuV0IRAXDdu+yUJAsAw7sDh
         JXDAtw7FSL+5XugsjR/HEsbQFh+aCL5/2kDAZNlgtwM5IjWUiViFn8YGJZU/B3ZC4T2j
         UHd19rpHkkmDW06ZUcW4vCqS+X0QILKFSdmOEpKCa/bVn7kDUBThnrF+nEP/rZfpS8uE
         kIXlWvzCzy+fogeAtG44rwXdkjusrriahrqhpE/kCcz3zvf2bEY/q9Gl8uJJtTtAPVGl
         edcmqFNGDETp5DKHSPiHp31cSrUQfEXGuTM646ceNfdE0SG7HJP5FK9KzjfMGn2PVXGW
         RQbQ==
X-Gm-Message-State: AOAM533AHIPRZhQxHd2NWGRzrP6qfqTzpoAj0VK4K2X79yl9Kf9dJY0A
        X2diR4IF+wqMIK7onBQv/QA=
X-Google-Smtp-Source: ABdhPJwT15x2fPHkBEyozoFsbKOElx8m094RDUGNTBfUnbhJ8fkX1ONk+G5dHB5I1ZRD4nU+sTVWrA==
X-Received: by 2002:a05:622a:b:: with SMTP id x11mr191454qtw.272.1622064110162;
        Wed, 26 May 2021 14:21:50 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id g63sm81950qkd.92.2021.05.26.14.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 14:21:49 -0700 (PDT)
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
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
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <f651e95b-feef-5c86-edba-d6008bc80b34@gmail.com>
Date:   Wed, 26 May 2021 16:21:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526061144.yvoaurpz75a3bsjr@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/26/21 1:11 AM, Viresh Kumar wrote:
> On 22-04-21, 13:54, Frank Rowand wrote:
>> On 4/22/21 3:44 AM, Geert Uytterhoeven wrote:
>>> Hi Frank, Rob,
>>>
>>> On Mon, Mar 29, 2021 at 9:23 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>> On 3/27/21 12:40 PM, Rob Herring wrote:
>>>>> On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wrote:
>>>>>> From: Frank Rowand <frank.rowand@sony.com>
>>>>>>
>>>>>> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
>>>>>> source file.
>>>>>>
>>>>>> Rename unittest .dts overlay source files to use .dtso suffix.
>>>>>
>>>>> I'm pretty lukewarm on .dtso...
>>>>
>>>> I was originally also, but I'm warming up to it.
>>>
>>> What's the status of this?
>>
>> I was planning to resend on top of the upcoming -rc1.
> 
> Ping.
> 

Thanks for the prod...

The .dtso convention was added to the dtc compiler, then a patch was
accepted to revert one mention of .dtso ,though there still remains
two location where .dtbo is still recognized (guess_type_by_name() in
dtc and the help text of the fdtoverlay program).

It seems that the general .dtso and .dtbo were not popular, so I'm
going to drop this patch instead of continuing to try to get it
accepted.

-Frank
