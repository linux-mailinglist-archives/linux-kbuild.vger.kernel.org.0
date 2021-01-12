Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253DC2F2528
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 02:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbhALA4b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 19:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbhALA4a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 19:56:30 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7DCC061575;
        Mon, 11 Jan 2021 16:55:50 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id z11so562068qkj.7;
        Mon, 11 Jan 2021 16:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=khkcF5qXfxpoNwKCSWV+pCbO5c4AEuaZShBo2MyVJjE=;
        b=iDvxKeycU5wJXIxKNaqJc2ThF2NEGfh3ArBgzmsYEZRF84igPXN7ksaxQpUV2Nwymg
         FPx8fESpjPhrJMMB0J2dj+1Xema7GPKalF/LQTvCJzB+qp8C6EX7M1twX7fX/Y7VeZ6x
         k/18hLZ2FXzZ5nWADBhk3c5qwskPnP8m/O/DMfYtE0smczXpMChNksCvG+71cnYRfEbJ
         x6ia8eP9eGkc+gZd2PQ5lgr4CKiXIqbT9RFin21x79XyfmbbY9vyJtFIMfMTowt29ZzT
         PDd/DeRPSgVtwpwQQfY55wY8F2NH94yhO6DimHlNL23LCXw9lWXVgrmHGJLXDv6Aafap
         zwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=khkcF5qXfxpoNwKCSWV+pCbO5c4AEuaZShBo2MyVJjE=;
        b=VBIMkI/QjK9sCkhuOwR21KW00ennWqfGQrtztRjVS7Z77HiIgY8nigI06IHw0LohhD
         /2hBT/XCPhI9DdqKg20zpffdha8YdWRqWy1A9WjCz6uBuCh0JcW29hx9JIbKuoYXo1dr
         9O8l8qBJ6XPiWvbOCOSa9VKporBxs0wm0KN05iHiSlDEQOu0qhhiK9joz32QK+xiXVJA
         q8vCHvV3l6XZ66ZM3aE3t1QtCjmmoKJRucR0TwRqIqDg9XhGMAiPImnyl+FsEDILMpfP
         Khzn64ueU06JQSXnjVT7Km/WOlLjo9+qnXhl1Qx08uWzZvtzutCBFizO36vCqbBwlOnT
         3MAw==
X-Gm-Message-State: AOAM530Cfie9OEf8LCmXwQ58c1D7j7WhX8hjEky0vFY5w7hUIsaS7YXp
        HZuxbSSRG3lJq+C6Vovrj1E=
X-Google-Smtp-Source: ABdhPJxW5EtmDEuHQqa8Fqy2/u2uKkH7Co3MpwSkAOFME7g2rR2X0lWhXA3TgyAUcBhNWtO7rsiGrw==
X-Received: by 2002:ae9:e8c5:: with SMTP id a188mr1992510qkg.479.1610412949557;
        Mon, 11 Jan 2021 16:55:49 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id n3sm569365qtp.72.2021.01.11.16.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 16:55:49 -0800 (PST)
Subject: Re: [PATCH V3 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
 <72c3a4f63dde3c172c11153e9a5b19fb6cdb4498.1610000585.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <94990759-34ff-0f4a-c913-dbcc679219be@gmail.com>
Date:   Mon, 11 Jan 2021 18:55:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <72c3a4f63dde3c172c11153e9a5b19fb6cdb4498.1610000585.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

I may have an email hiccup, but I don't see a "[PATCH V3 1/2]" email, I
only see this "V3 2/2" email.

Please start each new version of a patch series as a stand alone email
instead of a reply to an email in a previous version of the series.
That way each patch series discussion stands out as a separate thread.

Also each version of the patch series needs to include all of the patches
in the current version, even if they are unchanged from the previous
version.

Thanks,

Frank

On 1/7/21 12:25 AM, Viresh Kumar wrote:
> We will start building overlays for platforms soon in the kernel and
> would need these tools going forward. Lets start building them.
> 
> The fdtoverlay program applies (or merges) one ore more overlay dtb
> blobs to a base dtb blob. The kernel build system would later use
> fdtoverlay to generate the overlaid blobs based on platform specific
> configurations.
> 
> The fdtdump program prints a readable version of a flat device-tree
> file. This is a very useful tool to analyze the details of the overlay's
> dtb and the final dtb produced by fdtoverlay after applying the
> overlay's dtb to a base dtb.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V3:
> - Updated log
> - Remove libfdt_dir
> 
>  scripts/dtc/Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 4852bf44e913..472ab8cd590c 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -1,12 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # scripts/dtc makefile
>  
> -hostprogs-always-$(CONFIG_DTC)		+= dtc
> +hostprogs-always-$(CONFIG_DTC)		+= dtc fdtdump fdtoverlay
>  hostprogs-always-$(CHECK_DT_BINDING)	+= dtc
>  
>  dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
>  		   srcpos.o checks.o util.o
>  dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
> +fdtdump-objs	:= fdtdump.o util.o
> +
> +libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
> +libfdt		= $(addprefix libfdt/,$(libfdt-objs))
> +fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
>  
>  # Source files need to get at the userspace version of libfdt_env.h to compile
>  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
> 

