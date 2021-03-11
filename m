Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF50633816F
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 00:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhCKX1K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 18:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhCKX1D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 18:27:03 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB55C061574;
        Thu, 11 Mar 2021 15:27:02 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id s7so22559682qkg.4;
        Thu, 11 Mar 2021 15:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eGur/YOoRlDCdFA68I/JbkJXl6oe8JCfqTE/jfegHn0=;
        b=XlLu2LltlpJC+8bv4gWABDlveadGiiMv5cDxaU0X+3GeqYANkLZYT3JjR3SNgN6v88
         yp8n0QefMDCikY0M1sZBxftbTN3dPUMhkPHDVI42TS5ZYgpr2k3oCko5pwKzIAAsvQ+a
         jpINiV8bSDFRNQVUpg2GfWtmVCvGXY9MweOUbek01vdW5Bf71aak/UVucTp4MdyglYb0
         0aAuyVYT1iXmBY8Vm1sLAFGtYH4tHeGOhO8oc1ly8A7PqKFGIFzGe0lAsbD38v87ga8N
         fyka8S1kGJhttD3JNfJt45iwmQ1kSjWtRyRMHqsFjZhV3BdUZrcDyCTKR+LP6i2XmimT
         2mHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eGur/YOoRlDCdFA68I/JbkJXl6oe8JCfqTE/jfegHn0=;
        b=F7H7lcyvpTthjEbaVNswGfrQdZi6c49KtuT5xk/afWwfuY6kdj4Tmj+hOx80kIp5lS
         KLCMX7mCJGBTPrWDiIhKz6GRIzsaLowjMepWe4ca4T51b8Yw/wlhpUb7KcxqS7tHADQ3
         QbGVwe+CqmSaTm2LprYX98JUm4+qc7P/+SHgNzjCWgsDJxy/ZsNsZNVzNAL3SxnAg1tD
         7WAnJMmZH4xoU4UdKJ6z3C9Z8GCTzoA5IQGr4Y1ZnqkvMiN1YiuFc1APjoKMTY+5+kw/
         d2JIknxQoEJzjbqVr+gF26CnYoRUL1XftgC1gurQzYxj7NoAfQakoTB5ojaJGHkUzgor
         xQZA==
X-Gm-Message-State: AOAM530E7LByVym4YgUQACpWirbkUyWSe5VljlcOqU0ZDQ8RUcXfEf1N
        AVqMewhx4fKmVzdtmcwhm2E=
X-Google-Smtp-Source: ABdhPJxYMdzRnLYFj2Rmb5YjVxaJstDM3jcH8qHrZhzVfOFDJZtaeWFriaFJYchomaCqcwApQF+BKg==
X-Received: by 2002:a37:96c4:: with SMTP id y187mr10780849qkd.231.1615505222183;
        Thu, 11 Mar 2021 15:27:02 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id g11sm3155527qkk.5.2021.03.11.15.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 15:27:01 -0800 (PST)
Subject: Re: [PATCH V11 0/5] dt: Add fdtoverlay rule and statically build
 unittest
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <7211f09e-092b-d928-0c69-e2dcd1fc7c1e@gmail.com>
Date:   Thu, 11 Mar 2021 17:27:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1615354376.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/9/21 11:35 PM, Viresh Kumar wrote:
> Hi,
> 
> This patchset adds a generic rule for applying overlays using fdtoverlay
> tool and then updates unittests to get built statically using the same.
> 
> V10->V11:
> - Update patch 4/5 to fix checkpatch warning on spaces and tabs.
> - Added Acked-by from Masahiro for patch 2/5.
> 
> V9->V10:
> - Add a new patch to allow .dtso files.
> - Update 2/5 to be more efficient and also generate symbols for base
>   files automatically.
> - No need to add lines like DTC_FLAGS_foo_base += -@ in patch 5/5.
> - Add Ack by Masahiro for 1/5.
> 
> V8->V9:
> - Added some comment in patch 3/4 based on Frank's suggestions.
> 
> V7->V8:
> - Patch 1 is new.
> - Platforms need to use dtb-y += foo.dtb instead of overlay-y +=
>   foo.dtb.
> - Use multi_depend instead of .SECONDEXPANSION.
> - Use dtb-y for unittest instead of overlay-y.
> - Rename the commented dtb filess in unittest Makefile as .dtbo.
> - Improved Makefile code (I am learning a lot every day :)
> 
> V6->V7:
> - Dropped the first 4 patches, already merged.
> - Patch 1/3 is new, suggested by Rob and slightly modified by me.
> - Adapt Patch 3/3 to the new rule and name the overlay dtbs as .dtbo.
> 
> --
> Viresh
> 
> Rob Herring (1):
>   kbuild: Add generic rule to apply fdtoverlay
> 
> Viresh Kumar (4):
>   kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
>   kbuild: Allow .dtso format for overlay source files
>   of: unittest: Create overlay_common.dtsi and testcases_common.dtsi
>   of: unittest: Statically apply overlays using fdtoverlay
> 
>  drivers/of/unittest-data/Makefile             | 48 ++++++++++
>  drivers/of/unittest-data/overlay_base.dts     | 90 +-----------------
>  drivers/of/unittest-data/overlay_common.dtsi  | 91 +++++++++++++++++++
>  drivers/of/unittest-data/static_base_1.dts    |  4 +
>  drivers/of/unittest-data/static_base_2.dts    |  4 +
>  drivers/of/unittest-data/testcases.dts        | 23 ++---
>  .../of/unittest-data/testcases_common.dtsi    | 19 ++++
>  .../of/unittest-data/tests-interrupts.dtsi    | 11 +--
>  scripts/Makefile.lib                          | 40 ++++++--
>  9 files changed, 218 insertions(+), 112 deletions(-)
>  create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
>  create mode 100644 drivers/of/unittest-data/static_base_1.dts
>  create mode 100644 drivers/of/unittest-data/static_base_2.dts
>  create mode 100644 drivers/of/unittest-data/testcases_common.dtsi
> 
> 
> base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
> 

Does not apply to 5.12-rc2 because of a dependency on a patch to
scripts/Makefile.lib.  That patch has been merged by Linus
somewhere between -rc2 and -rc3.  I had a working version
between -rc2 and -rc3 at commit e6f197677b2e that does have
the required patch, so that is the version I used to test
this series.

There is still confusion caused by the contortions that unittest
goes through to mis-use base DTBs vs overlay DTBs, so _after_
this series is merged by Rob, I will poke around and see if
I can change unittest so that it does not look like it is
mis-using DTBs and overlay DTBs.


Reviewed-by: Frank Rowand <frank.rowand@sony.com>
Tested-by: Frank Rowand <frank.rowand@sony.com>


