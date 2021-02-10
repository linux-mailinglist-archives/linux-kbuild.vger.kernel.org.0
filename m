Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B183931656F
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Feb 2021 12:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhBJLoy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Feb 2021 06:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhBJLmg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Feb 2021 06:42:36 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A98C061222
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2021 03:42:07 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id i9so1572715wmq.1
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2021 03:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IN+db2cORNt7VkGGcBYrI5DAOlBAd7luCiB6c6UTORg=;
        b=A+lqcb1Mco2IH4sWZvbvEORyp44FjHIA2kKgYhWKHPRcBkihslWgY+eyCxjObLl4xM
         IJdLu77vzz0H46AfAyGLrLZ3P1y6a5z1GwgMJhI4clGjeFf+PyAsCenM3g5U2vflKhew
         Ju+igjclW8aHFZvW5zgCxQyfWMS4Xu5pD9ywx63JFAYNlS4WSR6nbO70ZKcfoghRGb4z
         Rf0JtLIheyrZWr3WvWIiahz7R05/j8oqaJTIUkNIo+kjiEWRTPpEAZUcmb+bwwR3TthY
         w8gny9neoDuQOvARwJ0yj7al35enKLxoqYkPmwR0BkgrFFw+H8Knypppuo27DmWcolMY
         g6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IN+db2cORNt7VkGGcBYrI5DAOlBAd7luCiB6c6UTORg=;
        b=kIqd8eWjwUynZZ3rOb6Tg+y6FtyKH8EKxx9ODPpQp1NhAHkZf6zKxazWBdIF4MOzdU
         6l12pCXiIn7P12rGhvtVqwOLsQrm49/Im7lde9ntaJBHmSB21bRr9JiLBMEzWECr51dV
         TanD+eix60h5sTBaYSyOk2oG18cT03Ajqwiz3YW1oc5CFDKU8fj+12q5UocqKjU9vSYZ
         fZ/yTiGGNkjwVv7G4y49Pv+bOMGSd0MmKrCQDKJ6t6rK96kuPXqW1y4NRLNaQI/peLas
         qC74WSdD356TcDrAXkhQQU9wmNIZnpviqQUdqMIj4cIIHYR5NK98JU/wsy1S39d8f2J8
         HPHw==
X-Gm-Message-State: AOAM532iDfPXj9NfTkAGJd5M1gr+UgMRmupdqCI7YxsBAvHlG23SxfIj
        beiZyeoOFuyk4d5PdM/uGR1sqQ==
X-Google-Smtp-Source: ABdhPJzcqeZvzBcu69WDOYa0AXEj+jkTjIK/0ivShR9A511clPVo2aBOAWDwimsl6o1C8uR6vnac8Q==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr2619209wmi.61.1612957326535;
        Wed, 10 Feb 2021 03:42:06 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id y63sm2154970wmd.21.2021.02.10.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 03:42:05 -0800 (PST)
Date:   Wed, 10 Feb 2021 11:42:03 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, jdelvare@suse.com,
        linux@roeck-us.net, giometti@enneenne.com, abbotti@mev.co.uk,
        hsweeten@visionengravers.com, kw@linux.com, helgaas@kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, linuxarm@openeuler.org,
        prime.zeng@huawei.com
Subject: Re: [PATCH 1/4] driver core: Use subdir-ccflags-* to inherit debug
 flag
Message-ID: <20210210114203.jvhst2veqbx73r5g@maple.lan>
References: <1612518255-23052-1-git-send-email-yangyicong@hisilicon.com>
 <1612518255-23052-2-git-send-email-yangyicong@hisilicon.com>
 <YB0Vk6ERJ3lFc3WD@kroah.com>
 <08017751-a1be-ea07-50de-73d14ab6d57e@hisilicon.com>
 <YCEWtxYgbRPET4Sr@kroah.com>
 <1f0b2f37-db56-c220-dfe1-8c376031404f@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f0b2f37-db56-c220-dfe1-8c376031404f@hisilicon.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 08, 2021 at 09:09:20PM +0800, Yicong Yang wrote:
> On 2021/2/8 18:47, Greg KH wrote:
> > On Mon, Feb 08, 2021 at 06:44:52PM +0800, Yicong Yang wrote:
> >> On 2021/2/5 17:53, Greg KH wrote:
> >>> What does this offer in benefit of the existing way?  What is it fixing?
> >>> Why do this "churn"?
> >>
> >> currently we have added ccflags-$(CONFIG_DEBUG_DRIVER) := -DDEBUG in the Makefile
> >> of driver/base and driver/base/power, but not in the subdirectory
> >> driver/base/firmware_loader. we cannot turn the debug on for subdirectory
> >> firmware_loader if we config DEBUG_DRIVER and there is no kconfig option
> >> for the it.
> > 
> > Is that necessary?  Does that directory need it?
> 
> there are several debug prints in firmware_loader/main.c:
> 
> ./main.c:207:   pr_debug("%s: fw-%s fw_priv=%p\n", __func__, fw_name, fw_priv);
> ./main.c:245:                   pr_debug("batched request - sharing the same struct fw_priv and lookup for multiple requests\n");
> <snip>

Even if these are not in scope for CONFIG_DEBUG_DRVIER there is a
config option that would allow you to observe them without changing
any code (CONFIG_DYNAMIC_DEBUG).


Daniel.
