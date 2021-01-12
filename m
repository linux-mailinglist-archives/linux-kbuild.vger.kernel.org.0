Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D4D2F38F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 19:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbhALSfP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 13:35:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbhALSfO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 13:35:14 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E39C061794;
        Tue, 12 Jan 2021 10:34:34 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id g24so2225469qtq.12;
        Tue, 12 Jan 2021 10:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/J2zRKmxDhbKwQ+cfEQ7FFvcXxU4+VcYyyS0jtn1t5w=;
        b=hTmtqD49IHqYo6y9+uVUT5pF8sFes0PsFMkiwXMXGte4it0LnQe0hoHtnzVSs4P+to
         0CMAU7e/u7QIIZe7u5FhiBVd/+akyn0m5RU0BDPBDb4EhJ3Dhu8lNZghw8s3q4YK+NVd
         vEHU283U89Q1xMYp+VhOd76hy+pq96JfPqdQG5/dbX8qeDJrjv+fV2/h5Rs1iCGPwreV
         MdU+G9gyzr6GJ/Rjm8jfhoydLlCgzjdsoVaoqcDKdQSYEhirQn6GFQ5Mwwl1VyIem0O7
         3lWcgE9MLcki4KUoPGjD2V4FBpFAdmvPSGVv1Bug5uN81oLTAt4iODvTxz5L1H3tukMw
         F2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/J2zRKmxDhbKwQ+cfEQ7FFvcXxU4+VcYyyS0jtn1t5w=;
        b=jOh2duqpP8sIbfcWFzvr+e824qgbxXQyrFLPefbZ3SNaPeZ6dVwQhl9zk2QRs/0pwX
         RqsuB5FPeurezZPnC+JV5euSDPGuarOX9ZthyYsQAj1tum+7JXLS1ZKeNT4kZv2GWFVA
         9Nhd/6bPVdr1ypzUvxrvpjrBdY9QYuvzuiCr/TRT6yCUDZolVOgDXwSI2UcpsSSdeJc2
         KqZ4qth3cWBOitV+jAfZSH8NLTs8gFccw7j1RVzfP4pDJZODo0xoOSNEId2Yg7m0UFbE
         OvmCdYDSz5g5arACiZzZoQ07vHEkmGB15+DDnJ/uUbAz3ey4GOnlGyQkcI9OL0pTe3yy
         spuA==
X-Gm-Message-State: AOAM531mSKKfFGQJzsBJ43IKcExVPVShxeVpUnTonV5WdaDBbzmKF8Hq
        s4jiDRPEmMCOs4K7G6LNnIk=
X-Google-Smtp-Source: ABdhPJz/vD5kjzn92FMPZ/llPyVvX8A0FIz2K1glfJREBebfwvWosIVccSoYynEfKa+j9US1MJefGQ==
X-Received: by 2002:ac8:4cda:: with SMTP id l26mr298115qtv.213.1610476472849;
        Tue, 12 Jan 2021 10:34:32 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id 70sm1779957qkk.10.2021.01.12.10.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 10:34:32 -0800 (PST)
Subject: Re: [PATCH V3 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
 <72c3a4f63dde3c172c11153e9a5b19fb6cdb4498.1610000585.git.viresh.kumar@linaro.org>
 <1d9369aa-b7aa-6d06-0d44-6ef21bc639e3@gmail.com>
 <20210112050818.s6ctvd6ihd2dt2d2@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <3f0c733a-641f-290f-41b8-62ca22e355b7@gmail.com>
Date:   Tue, 12 Jan 2021 12:34:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112050818.s6ctvd6ihd2dt2d2@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/11/21 11:08 PM, Viresh Kumar wrote:
> On 11-01-21, 18:44, Frank Rowand wrote:
>> On 1/7/21 12:25 AM, Viresh Kumar wrote:
>>> We will start building overlays for platforms soon in the kernel and
>>> would need these tools going forward. Lets start building them.
>>>
>>> The fdtoverlay program applies (or merges) one ore more overlay dtb
>>> blobs to a base dtb blob. The kernel build system would later use
>>> fdtoverlay to generate the overlaid blobs based on platform specific
>>> configurations.
>>>
>>> The fdtdump program prints a readable version of a flat device-tree
>>> file. This is a very useful tool to analyze the details of the overlay's
>>> dtb and the final dtb produced by fdtoverlay after applying the
>>> overlay's dtb to a base dtb.
>>
>> You can calso dump an FDT with:
>>
>>    dtc -O dts XXX.dtb
>>
>> Is this sufficient for the desired functionality, or is there something
>> additional in fdtdump that is needed?
> 

comment 1:

> Not for my usecase at least.

> 
>> If nothing additional needed, and there is no other justification for adding
>> another program, I would prefer to leave fdtdump out.
> 

comment 2:

> Okay, then I will also remove the stale version of fdtdump which is
> already there in kernel since a long time.
> 

I'm confused.  I read comment 1 as saying that fdtdump does provide a feature
that you need to analyze the dtb created by fdtoverlay.  But I read comment 2
as implying that you are accepting that fdtdump will not be added to the
Linux kernel source.

-Frank
