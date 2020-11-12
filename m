Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5902AFEB1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Nov 2020 06:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbgKLFjP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Nov 2020 00:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbgKLDPB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Nov 2020 22:15:01 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BC2C0613D4
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2020 19:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=aU3b5ToJDV0mda8mMhwz6gCA0JPoBfQtpCD65sQOpHs=; b=Mtxop98kQpRTwmqh/4a8qd1Oil
        ibULqOTi3CV4RQhzmCgPiIPeD18tHa+UrCg632CHHjcXlDFwMuVHDxArUwr8Hynhjc7QeGTxTNevD
        YDQAPdkDE3y1msfwMwpY/ekLb33MccYclaRxRuJP0GlalqhRw7/YjAAwbfQbaH6zPE95k6Dmqh75Y
        qXO92IUsf1sW5+IlaCM+Km6Dih6PvuetcaEVa45bn01Stbhfaeufwsp4kyJjCt+6GR+WDGlmKHfxs
        ofIBP00M1mD3zIATqezDK2bvt/PK3u3zNWN9Pw4hFoDydfFs9Ia3Sgaec109OjP0A1di+h/AoGS6s
        Mts5Zotg==;
Received: from [2601:1c0:6280:3f0::662d]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kd34a-0002Js-Hb; Thu, 12 Nov 2020 03:14:57 +0000
Subject: Re: unwanted built-ins
To:     jrun <darwinskernel@gmail.com>, linux-kbuild@vger.kernel.org
References: <20201111163135.f6rjjgldlouspfat@savoirfairelinux.com>
 <b852dcf4-c8d6-c7b3-3833-5c6083883b9e@infradead.org>
 <20201111190045.j37ixzeosd7qxzkm@savoirfairelinux.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b5452d0b-fc9e-8811-ba3d-c1692a550b39@infradead.org>
Date:   Wed, 11 Nov 2020 19:14:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201111190045.j37ixzeosd7qxzkm@savoirfairelinux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/11/20 11:00 AM, jrun wrote:
> On Wed, Nov 11, 2020 at 10:09:18AM -0800, Randy Dunlap wrote:
>> Hi,
>>
>> Is this a speed of build issue?
> 
> i wasn't thinking about that but sure it does have that effect too.
> 
>> Yes, make is descending into multiple directories that are not
>> strictly needed in this kernel config:
>>
>>   AR      drivers/gpu/drm/arm/built-in.a
>>   AR      drivers/gpu/drm/rcar-du/built-in.a
>>   AR      drivers/gpu/drm/omapdrm/dss/built-in.a
>>   AR      drivers/gpu/drm/omapdrm/displays/built-in.a
>>   AR      drivers/gpu/drm/omapdrm/built-in.a
>>   AR      drivers/gpu/drm/tilcdc/built-in.a
>>   AR      drivers/gpu/drm/imx/built-in.a
>>   AR      drivers/gpu/drm/i2c/built-in.a
>>   AR      drivers/gpu/drm/panel/built-in.a
>>   AR      drivers/gpu/drm/bridge/analogix/built-in.a
>>   AR      drivers/gpu/drm/bridge/cadence/built-in.a
>>   AR      drivers/gpu/drm/bridge/synopsys/built-in.a
>>   AR      drivers/gpu/drm/bridge/built-in.a
>>   AR      drivers/gpu/drm/hisilicon/built-in.a
>>   AR      drivers/gpu/drm/tiny/built-in.a
>>   AR      drivers/gpu/drm/xlnx/built-in.a
>>   AR      drivers/gpu/drm/built-in.a
>>
>> The built-in.a files that I see being built are all of size 8 bytes.
> 
> and they don't make it into the final image which is what i wanted. thanks.
> 
> now i would interested to know why some subsystems have those obj-y's
> unconditionally asserted?
> for instance, would something like this make sense?
> 
> diff --git a/drivers/video/Makefile b/drivers/video/Makefile
> index df7650adede9..47508d8049d9 100644
> --- a/drivers/video/Makefile
> +++ b/drivers/video/Makefile
> @@ -7,7 +7,7 @@ obj-$(CONFIG_FB_STI)		  += console/
>  obj-$(CONFIG_LOGO)		  += logo/
>  obj-y				  += backlight/
> 
> -obj-y				  += fbdev/
> +obj-$(CONFIG_FB)		  += fbdev/
> 
>  obj-$(CONFIG_VIDEOMODE_HELPERS) += display_timing.o videomode.o
>  ifeq ($(CONFIG_OF),y)
> 
> or this:
> 
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 835c88318cec..c1a71f4938bb 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -3,6 +3,7 @@
>  # taken to initialize them in the correct order. Link order is the only way
>  # to ensure this currently.
>  obj-$(CONFIG_TEGRA_HOST1X)	+= host1x/
> -obj-y			+= drm/ vga/
> +obj-y				+= vga/
> +obj-$(CONFIG_DRM)		+= drm/
>  obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/

Yeah, that may be the right thing to do, but it would take
a lot of build testing. My laptops don't have enough horsepower
for all of that (multiple configs * multiple arch-es).

-- 
~Randy

