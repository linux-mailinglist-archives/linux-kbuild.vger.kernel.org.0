Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F14825915B
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Sep 2020 16:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgIAOtz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Sep 2020 10:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbgIAOtv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Sep 2020 10:49:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A875C061244
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Sep 2020 07:49:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y6so639081plk.10
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Sep 2020 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bv5b6EVobqUNVIF87/DhH+cY3Q1HWbgPFf0dl3Olwio=;
        b=CMipeE03VR2QYd8nNYYHCTHPEJ1IdeFQMtTtnIpV/ee4MfCFYBft28C9Z4GIQo5zBV
         QK2gfzj3Lpql1P1iBv4jZiYTXLyHgovXgqQQLVy76+locmo3vFm7G8IW78U6hSLjWo7C
         TmvExCXdwMAaqW+bR3RRmdaQKZIoFbMkIauAd4Zew6KCdayaeAjIDHW6XrU23yriK2g2
         5Q89cEUh6IL2lzZJX+Qf7KP7yzHzSFg6msQOEJiQKJLe5dli7EmEZ2MIJzwXeCgPjFMv
         f5rmHep1MxFV7CqvQH9xpVPyf7UJMS2PB90qgeGaBr0u7DCp24xr/+nuCabqF2zMIkui
         Rk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bv5b6EVobqUNVIF87/DhH+cY3Q1HWbgPFf0dl3Olwio=;
        b=aNID7nyHC8Iqxrsi6HhJilHCYUJL51EDnmiskxWWWmWWd5BT3i5EgliFqPDlAznFrr
         t43vuy++t5QRx31nHgsloajCnl1VtegONapWqNMNT20QeHBwTZifwblTOkIltlh56WZ0
         saVhphT3nlzTy3kis8p+eSWWyCH3W+X1DSY7Lvj4NhH6vYEWBZum7Xo5yObCqlO+QflJ
         G8bB4L1hWmxRo4toARVc0FFG+lIPdh/zVCHph84k7T06gr/UZSM5FlkJES8Robd7mf5z
         Q7CsDHXiPyXCirsu9lCC86JFoc6a/f6BstXm+bSxcZy2SEwifk97jxxuBGpYb/eVln2u
         3QcQ==
X-Gm-Message-State: AOAM533EXwdElZhjMvOZB/fe3wMeAf/rP2kl2VxBGCtajdW16xDig9P9
        EX4Ir1a4mhjPSpa6GKJH6XODxw==
X-Google-Smtp-Source: ABdhPJwJT6OaFInhGXji8NM/sg0H1Gpqx+OhIP3Jac20+0b+pSpDpPp7UHpR6y/5tKsCNyF4pj13sg==
X-Received: by 2002:a17:90a:c086:: with SMTP id o6mr1911513pjs.224.1598971789688;
        Tue, 01 Sep 2020 07:49:49 -0700 (PDT)
Received: from [192.168.1.187] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id s67sm2304633pfs.117.2020.09.01.07.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 07:49:49 -0700 (PDT)
Subject: Re: [PATCH 0/1] block io layer filters api
To:     Sergei Shtepa <sergei.shtepa@veeam.com>
Cc:     "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "koct9i@gmail.com" <koct9i@gmail.com>,
        "jack@suse.cz" <jack@suse.cz>,
        "damien.lemoal@wdc.com" <damien.lemoal@wdc.com>,
        "ming.lei@redhat.com" <ming.lei@redhat.com>,
        "steve@sk2.org" <steve@sk2.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>
References: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
 <7a517822-6be2-7d0d-fae3-31472c85f543@kernel.dk>
 <20200901132957.GA18251@veeam.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <722e85ac-f494-2cb3-4caf-d903d79a5645@kernel.dk>
Date:   Tue, 1 Sep 2020 08:49:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901132957.GA18251@veeam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/1/20 7:29 AM, Sergei Shtepa wrote:
> The 08/28/2020 16:54, Jens Axboe wrote:
>> On 8/27/20 1:13 PM, Sergei Shtepa wrote:
>>> Hello everyone! Requesting for your comments and suggestions.
>>>
>>> We propose new kernel API that should be beneficial for out-of-tree
>>> kernel modules of multiple backup vendors: block layer filter API.
>>
>> That's just a non-starter, I'm afraid. We generally don't carry
>> infrastructure in the kernel for out-of-tree modules, that includes
>> even exports of existing code.
>>
>> If there's a strong use case *in* the kernel, then such functionality
>> could be entertained.
>>
>> -- 
>> Jens Axboe
>>
> 
> To be honest, we've always dreamed to include our out-of-tree module
> into the kernel itself - so if you're open to that, that is great news
> indeed!

We're always open to that, provided that a promise is made to maintain
the in-kernel version. Sometimes we see submissions that end up being an
over-the-wall kind of dump, and then the vendor only maintains their own
out-of-tree version after the fact and point customers at that one too.
For those cases we don't want the driver, as it just becomes a
maintenance hassle for us.

So if you are serious about this, it's important to set and manage
internal expectations on how the driver is developed and maintained
going forward. The upstream driver *must* be the canonical version, and
if you want and need to have versions for older kernels available, then
it should be based on backports of the current in-tree driver.

> We've spent some time before responding to estimate how long it will
> take us to update the current source code to meet coding requirements.
> It looks like we will need 2-4 months of development and QC, and
> possibly much more to work on your feedback thereafter. This is much
> work, but we are fully committed to this if you are willing to include
> this module into the kernel.

Honestly I don't think that is that much work, and I wouldn't personally
be too worried about that being succesful. Complications are generally
mostly around APIs, since an in-tree driver might need to change how you
communicate with the driver. So yes, it'll be some work, but the
important part is how we treat the maintenance of it after all that is
said and done.

> However, the same time requirement also presents a big immediate
> problem - as until this is done, over a hundred thousands of Linux
> users will not be able to protect their servers running the impacted
> kernels (our backup agent is free). They will be forced to stop using
> the new version of the kernel (or take a risk of data loss).

You have plenty of time to get this done before it becomes a problem.
It's not like the current patches are going to -stable.

> Given that, is there any chance that you accept the proposed patch
> now, to restore the ability to protect their Linux machines - and buy
> us time to deliver the compliant module for inclusion into the kernel?

I'm afraid not, we simply cannot allow exposing internals like that for
a use case that isn't currently covered by existing in-tree drivers.

-- 
Jens Axboe

