Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936912F386D
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 19:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390926AbhALSSH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 13:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389601AbhALSSH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 13:18:07 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3177AC061575;
        Tue, 12 Jan 2021 10:17:27 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id a13so1340495qvv.0;
        Tue, 12 Jan 2021 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/qE1B43O7lkcKdAWcDlQHeKRkyrYTiA3CVvGiUbnnHY=;
        b=q5hdyT0zl2fyZyzZCip6ggpBXIEIXSRFloKdT89+J1WmpQB0MtqHm/NG/a3lE05dzc
         YZWa9ioJhnOC1tfMeONtSIqSdvYxWux2e9cuZWNH7fqLXnptAGeL5TOyEvKla/dNVGFK
         att5IVs4uM8UBDaRUaXIB90U6l+BVcmFTi3hYUKJLdX3w5WBguVj9v7uYlYDSEHI4eKm
         oKnPxXzCE2FCUEVNVZQraUElwl83c3vg5PdcyxGle5KfbI8ZuAqscfKQcrJYKdLELvVe
         NpaUWSvH84LPbJUk2B454tbmS4/Xvt6tRbaF7ZUVcesi9cyrboZcql9f2jMDsaCsHmsZ
         UHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/qE1B43O7lkcKdAWcDlQHeKRkyrYTiA3CVvGiUbnnHY=;
        b=ufeC7nptQ70PHg2wpnS6UTR722l4MJpqpfl+eiJF4HECIpcujnYmtVIq0TNJKlXF81
         WTqgGelI/Nf8r11H2uQyQq5I0N3tDOaQ2cWEb+s9wnpPmM/9GAiaaZiKgwtUymg5RRqR
         knYyaTkFH35wBcABvoijJ995L2xAWrQwTQj4aGlceAnvESHlDWvmla7G6vSPKX41Sv2/
         5jSw9N6ukFO29elS7OKqftwGqPbTc26Ur9kP7qnjwliNrt2igHuMM69GRTWjF5WKZcpc
         731r8mnFSpGU18SWYkfjzitittpxcuS12IOwYmJSJYgstYT0Nf3r1aswrQreU0e3OvKt
         o1FQ==
X-Gm-Message-State: AOAM530CbULMRXDkgP8UYAtWcVhasaM1y2uDloKbRMN1Rh5KqM7KMcwH
        LTth5n7b+a0eqa30kCiYx2I=
X-Google-Smtp-Source: ABdhPJx+1IPTskfpt36UK5tDFxGSfOt+OwCDy8n6in+IOp0Ciaglc8m9dIw02vjUMq0B3a/dOb4TzQ==
X-Received: by 2002:a0c:f2cd:: with SMTP id c13mr328749qvm.11.1610475446445;
        Tue, 12 Jan 2021 10:17:26 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id u26sm1720132qke.57.2021.01.12.10.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 10:17:26 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Bill Mills <bill.mills@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        anmar.oueja@linaro.org, Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com>
 <31611390-eded-d290-36a7-0b1e8465f71e@linaro.org>
 <20210112083703.yfpicoi4zrddeykd@vireshk-i7>
 <4a8bbbaa-9303-8a8c-1de4-38499b8151dd@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <f78ea9a4-7bed-aa76-8a84-c979214ed69b@gmail.com>
Date:   Tue, 12 Jan 2021 12:17:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4a8bbbaa-9303-8a8c-1de4-38499b8151dd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/12/21 4:16 AM, Bill Mills wrote:
> 
> 
> On 1/12/21 3:37 AM, Viresh Kumar wrote:
>> On 11-01-21, 20:22, Bill Mills wrote:
>>> On 1/11/21 5:06 PM, Frank Rowand wrote:
>>>> NACK to this specific patch, in its current form.
>>>>
>>>> There are restrictions on applying an overlay at runtime that do not apply
>>>> to applying an overlay to an FDT that will be loaded by the kernel during
>>>> early boot.  Thus the unittest overlays _must_ be applied using the kernel
>>>> overlay loading methods to test the kernel runtime overlay loading feature.
>>>>
>>>> I agree that testing fdtoverlay is a good idea.  I have not looked at the
>>>> parent project to see how much testing of fdtoverlay occurs there, but I
>>>> would prefer that fdtoverlay tests reside in the parent project if practical
>>>> and reasonable.  If there is some reason that some fdtoverlay tests are
>>>> more practical in the Linux kernel repository then I am open to adding
>>>> them to the Linux kernel tree.
>>
>> I wasn't looking to add any testing for fdtoverlay in the kernel, but
>> then I stumbled upon unit-tests here and thought it would be a good
>> idea to get this built using static tools as well, as we aren't
>> required to add any new source files for this and the existing tests
>> already cover a lot of nodes.
>>
>> And so I am fine if we don't want to do this stuff in kernel.
>>
>>> I thought we were aligned that any new overlays into the kernel today would
>>> only be for boot loader applied case.  Applying overlays at kernel runtime
>>> was out of scope at your request.
>>>
>>> Rob had requested that the overlays be test applied at build time.  I don't
>>> think there is any way to test the kernel runtime method at build time
>>> correct?
>>>
>>> Please clarify your concern and your suggested way forward.
>>
>> The kernel does some overlay testing currently (at kernel boot only,
>> not later), to see if the overlays get applied correctly or not, these
>> are the unit tests.
>>
>> What Frank is probably saying is that the unit-tests dtbs shouldn't
>> get used for testing fdtoverlay stuff. He isn't asking to support
>> runtime application of overlays, but to not do fdtoverlay testing in
>> the kernel.

Yes, Viresh is understanding my point.

>>
> 
> Thanks Viresh, that makes sense.  Sorry for the confusion Frank.

No problem Bill, communication by email is hard, and we end up
spending a lot of time getting to the point of common understanding,
it is the nature of the process.

-Frank

