Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E332AF8A2
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Nov 2020 20:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgKKTAt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Nov 2020 14:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgKKTAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Nov 2020 14:00:48 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CE2C0613D1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2020 11:00:48 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id f93so2054005qtb.10
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2020 11:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jyT78UXpcNHaKY4Y10GknFYiBfBLk3+5JG963pdEOMM=;
        b=WU1E6AhwbYVGKm2Hm5MnZWoi6h+9KQViYYwp5EUgmIq5U4lhuumfC3ak7G8+ePZoNk
         mOShf/WsAcx3sVLSM7QX+XxUteQCatOXnfu3BB7jenS29ruvzj4xObkSUhuvXDSKZHoE
         ExntQ13XomiA5uaIOXQYWkZlDFsmS/HX7nfJ8BVIlHduZ1FMXeXRwAoJqBIxFXaBIexG
         b6Wt9GBg8r5Xwqr6zItLloXA0aDvQomSyQ5EdQFxttkgifBYOo1xFglqWCbXH4zUq+9n
         46Hc1SySMFGj7vgJ/o9QE3Kn8abGCMY5LfX3i5J1Z5YivgS42uTWskPDDKrNzPpsb+7l
         n+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jyT78UXpcNHaKY4Y10GknFYiBfBLk3+5JG963pdEOMM=;
        b=b/eSI89Jwrb7G5KZFzkyJLJiJU2zwsTCzcHxGtapHAOUnIiE2j49DU8T2aVpLK+2/I
         9dYGh137xuNWwrLuvYE2fW/aoefmVTbhXNbxRjiLT4LYzj+y+iwEwgT4pvdroSvxmkiH
         iqXAtFjF5oAtYEqR9p08kF00NFeGhQTud/LK9w69TSOrJ/VPK/WIYkhxJif4f7sNouwk
         BhxXa2SElbEaty5OoiExRPkdGaWgGMaRgGJwBbR5EWN0hfgN5/vueeXnI/A4YfdCJ3an
         AGaxpdPrusMSEpXZg/41k5lud6zcNlsbk4yom0ve8YlAS2g+xWRtnCsvxHLsI7BvXCPR
         nJlg==
X-Gm-Message-State: AOAM533j+WCT74Jj4CjuQltjWK+kKjW4dmfhxcjKf+QxWaL7EZhYWE0E
        5Pxp6Xqu3L2sRz4/WL1d01CtKmJRLVU=
X-Google-Smtp-Source: ABdhPJynOlRqHP5VnmOtLwyDKbjKBTB+is5uNwaP1Zwh+aJzUHxiH9uUDF/lToKMtnZWcZMdrMO2IA==
X-Received: by 2002:ac8:4a07:: with SMTP id x7mr16903913qtq.273.1605121247184;
        Wed, 11 Nov 2020 11:00:47 -0800 (PST)
Received: from p51.localdomain (bras-base-mtrlpq4706w-grc-05-174-93-161-125.dsl.bell.ca. [174.93.161.125])
        by smtp.gmail.com with ESMTPSA id n201sm2978938qka.32.2020.11.11.11.00.46
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 11:00:46 -0800 (PST)
Received: by p51.localdomain (Postfix, from userid 1000)
        id C6A261D1723E; Wed, 11 Nov 2020 14:00:45 -0500 (EST)
Date:   Wed, 11 Nov 2020 14:00:45 -0500
From:   jrun <darwinskernel@gmail.com>
To:     linux-kbuild@vger.kernel.org
Subject: Re: unwanted built-ins
Message-ID: <20201111190045.j37ixzeosd7qxzkm@savoirfairelinux.com>
References: <20201111163135.f6rjjgldlouspfat@savoirfairelinux.com>
 <b852dcf4-c8d6-c7b3-3833-5c6083883b9e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b852dcf4-c8d6-c7b3-3833-5c6083883b9e@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 11, 2020 at 10:09:18AM -0800, Randy Dunlap wrote:
> Hi,
> 
> Is this a speed of build issue?

i wasn't thinking about that but sure it does have that effect too.

> Yes, make is descending into multiple directories that are not
> strictly needed in this kernel config:
> 
>   AR      drivers/gpu/drm/arm/built-in.a
>   AR      drivers/gpu/drm/rcar-du/built-in.a
>   AR      drivers/gpu/drm/omapdrm/dss/built-in.a
>   AR      drivers/gpu/drm/omapdrm/displays/built-in.a
>   AR      drivers/gpu/drm/omapdrm/built-in.a
>   AR      drivers/gpu/drm/tilcdc/built-in.a
>   AR      drivers/gpu/drm/imx/built-in.a
>   AR      drivers/gpu/drm/i2c/built-in.a
>   AR      drivers/gpu/drm/panel/built-in.a
>   AR      drivers/gpu/drm/bridge/analogix/built-in.a
>   AR      drivers/gpu/drm/bridge/cadence/built-in.a
>   AR      drivers/gpu/drm/bridge/synopsys/built-in.a
>   AR      drivers/gpu/drm/bridge/built-in.a
>   AR      drivers/gpu/drm/hisilicon/built-in.a
>   AR      drivers/gpu/drm/tiny/built-in.a
>   AR      drivers/gpu/drm/xlnx/built-in.a
>   AR      drivers/gpu/drm/built-in.a
> 
> The built-in.a files that I see being built are all of size 8 bytes.

and they don't make it into the final image which is what i wanted. thanks.

now i would interested to know why some subsystems have those obj-y's
unconditionally asserted?
for instance, would something like this make sense?

diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index df7650adede9..47508d8049d9 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_FB_STI)		  += console/
 obj-$(CONFIG_LOGO)		  += logo/
 obj-y				  += backlight/

-obj-y				  += fbdev/
+obj-$(CONFIG_FB)		  += fbdev/

 obj-$(CONFIG_VIDEOMODE_HELPERS) += display_timing.o videomode.o
 ifeq ($(CONFIG_OF),y)

or this:

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 835c88318cec..c1a71f4938bb 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -3,6 +3,7 @@
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
 obj-$(CONFIG_TEGRA_HOST1X)	+= host1x/
-obj-y			+= drm/ vga/
+obj-y				+= vga/
+obj-$(CONFIG_DRM)		+= drm/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/


- jrun
