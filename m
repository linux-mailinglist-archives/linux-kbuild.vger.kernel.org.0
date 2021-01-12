Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B492F250E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 02:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbhALAqA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 19:46:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731052AbhALAp6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 19:45:58 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F006C0617A3;
        Mon, 11 Jan 2021 16:44:57 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id z20so597182qtq.3;
        Mon, 11 Jan 2021 16:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WkdvFf9Kvj9q6SdxxyiGqDsjHoA0pygDOy1ejbafjew=;
        b=a9RRO5NAwOw7Pv2CG8C9Ec88Bps6J2PLj48v+WgWFwr9lFZCOUKTrqgIXgBiV7BS9n
         ZJJrPOl/+/4Fx9iRXziLdd40VjLKqNkUzYuLenD/rubXmwanygZC+DS/3DV+raYt97pO
         4XgwF5BG3n9L3pQraPGey/6b6gG/Kbt0zqvjo7L7f1jdHJGmrKpBE29pjKP8Ht1HkIcO
         dT5pb8u1Jve+vWqUb8prcKuMQXgXatIFsm7tZE/7uCXlFmjU4NjqUxjuUAXiR5pV+cs+
         MQxKgjpI3/rg1FkJl8kc8GhEB275G7qbpKDKWchnMHz0W9H0wbIYSlbvmvXPecr7YI1e
         7yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WkdvFf9Kvj9q6SdxxyiGqDsjHoA0pygDOy1ejbafjew=;
        b=UzT8CsPkvF/jowrFlkvZIHVZ1VNTd7ufaLNdcI/VxseLYWQ/Sa1n4BLXC5t3JpsY2w
         DoDdmoXzyiPHxGcuTFHry1/ngr2883WIe5VwgnA4KIjl3hPDIXzFWMI6P6kV7Z2IW8Rs
         /F54v0MXu8PNEws0LomoFnG8YnnQxCvh9bLli/BwUMs9Sz+qYb1Q0QWLtVkFUsdWezO7
         6+BP8YO2my+Px9ZTE1A/KrqmEwe+1Utmp1hq67PxvbDY8xemzAzPatUugPXjJAx1lADq
         9DIhgBFvl5Lq4NYmNlv0kRxp63Zu2dbCnf4+oqqkGK2p2M6Aj9R1srO/cuIkGfAgwOdH
         0GDQ==
X-Gm-Message-State: AOAM533vN2GgQ4Xe2uu/UpVaX1gl0S4fx6+/9KUFjN9hT4eLGCDiLL1B
        fAyEJ8ouOW8HhlTrSY5qBouKLR7oh86iKQ==
X-Google-Smtp-Source: ABdhPJyYm3C7psPQvWFjASOwuELMRIuHugkTaXJer2geMuJLQNiPkHoVisNLQS+oJdKdPwOc1sHQaA==
X-Received: by 2002:aed:3462:: with SMTP id w89mr2191880qtd.265.1610412296445;
        Mon, 11 Jan 2021 16:44:56 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id k7sm566316qtg.65.2021.01.11.16.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 16:44:56 -0800 (PST)
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
Message-ID: <1d9369aa-b7aa-6d06-0d44-6ef21bc639e3@gmail.com>
Date:   Mon, 11 Jan 2021 18:44:55 -0600
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

You can calso dump an FDT with:

   dtc -O dts XXX.dtb

Is this sufficient for the desired functionality, or is there something
additional in fdtdump that is needed?

If nothing additional needed, and there is no other justification for adding
another program, I would prefer to leave fdtdump out.

-Frank

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

