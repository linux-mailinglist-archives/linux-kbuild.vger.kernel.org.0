Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22112F2269
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 23:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388832AbhAKWHY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 17:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730511AbhAKWHY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 17:07:24 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4563C061786;
        Mon, 11 Jan 2021 14:06:43 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id l7so128277qvt.4;
        Mon, 11 Jan 2021 14:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x5xp/a8CRjkMEiQyy4fYTkZWqvHateorg5bsaZ3Wm30=;
        b=P7Dv1RfEHdKBeiAvCa1vZTHIi0rg44zYplJR17Pa4tDbdG80nPYDvnrevTzM4m0fki
         krHzvQ8/St9guGSPhHF5vAhwIemv2wsHSdMnwdbvHta8Xi9lHOsyZUcQ6kvkrbF/mXPO
         AX7lr3HJbn7CYPsWm1C7/KpGWGhTaHwsfuJubt3VTVRZ07zbD02sHCdYG18fuWGNFJP1
         OCVPgN/dEi57j/nAojcGwB7R7QMmDKE2AST5+JfKb+yDWu1Fy9g+ZOFb5OEapzYs2hzA
         o83VZMv7dmz1efVJslfYTYztgIlWZ33DpgHkVIF2bISogU/0nIZHGx4WnjJL0FtKKs/o
         pAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x5xp/a8CRjkMEiQyy4fYTkZWqvHateorg5bsaZ3Wm30=;
        b=oT/eioILfu2dzIjpQZIOJxRQ0dTpGayvcjGSV4Le6t9OqyKLwEAEPHDtgbeqtVm6C8
         P0HwE0A0OPSRCnTVfTySafsD9FfCPHbkBJCc2U8QZ58+mhegRIVk8y5jCyj/gnCg5wG7
         URiOHW/4fDAPCCcNDbqyerQBrN6n3A4Dk1g589VEORyGxFm9z1ZzekU5WqKTKb5AKg/O
         L+T0VwrSkQnT3ko9rty0dwBj5+QL7eOJGQW5oatset0nnV9pcWKUpT+fSPnNqPF26rNw
         AdqsRV124cl7ezSzckU0FH+zap/Uqz26Nll8E2JTazxeyF9d1/+vh0S2j5197i1HvcWp
         9Abw==
X-Gm-Message-State: AOAM5334oqYWWHS77wKfFPDeIj3S7gk3p1KIGs84+CuPJhIFrS7aUjV3
        GEzX3axu+7NP/GWSqCiokJk=
X-Google-Smtp-Source: ABdhPJzM5Xl+b6PfhkmzAQFSOE86h0AP5nocB8FO2Ljz4R4g/v8YJOvyvdErcxt248QpwR2igbu5fg==
X-Received: by 2002:a05:6214:487:: with SMTP id ay7mr1418221qvb.37.1610402803134;
        Mon, 11 Jan 2021 14:06:43 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id o30sm445864qtd.24.2021.01.11.14.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 14:06:42 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com>
Date:   Mon, 11 Jan 2021 16:06:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/8/21 2:41 AM, Viresh Kumar wrote:
> Now that fdtoverlay is part of the kernel build, start using it to test
> the unitest overlays we have by applying them statically.
> 
> The file overlay_base.dtb have symbols of its own and we need to apply
> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
> us intermediate-overlay.dtb file.
> 
> The intermediate-overlay.dtb file along with all other overlays is them
> applied to testcases.dtb to generate the master.dtb file.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

NACK to this specific patch, in its current form.

There are restrictions on applying an overlay at runtime that do not apply
to applying an overlay to an FDT that will be loaded by the kernel during
early boot.  Thus the unittest overlays _must_ be applied using the kernel
overlay loading methods to test the kernel runtime overlay loading feature.

I agree that testing fdtoverlay is a good idea.  I have not looked at the
parent project to see how much testing of fdtoverlay occurs there, but I
would prefer that fdtoverlay tests reside in the parent project if practical
and reasonable.  If there is some reason that some fdtoverlay tests are
more practical in the Linux kernel repository then I am open to adding
them to the Linux kernel tree.

-Frank


> 
> ---
> Depends on:
> 
> https://lore.kernel.org/lkml/be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org/
> 
> I have kept the .dtb naming for overlays for now, lets see how we do it
> eventually.
> 
> Rob/Frank, this doesn't work properly right now. Maybe I missed how
> these overlays must be applied or there is a bug in fdtoverlay.
> 
> The master.dtb doesn't include any nodes from overlay_base.dtb or
> overlay.dtb probably because 'testcase-data-2' node isn't present in
> testcases.dtb and fdtoverlay doesn't allow applying new nodes to the
> root node, i.e. allows new sub-nodes once it gets phandle to the parent
> but nothing can be added to the root node itself. Though I get a feel
> that it works while applying the nodes dynamically and it is expected to
> work here as well.
> 
> (And yeah, this is my first serious attempt at updating Makefiles, I am
> sure there is a scope of improvement here :))
> 
> ---
>  drivers/of/unittest-data/Makefile | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
> index 009f4045c8e4..f17bce85f65f 100644
> --- a/drivers/of/unittest-data/Makefile
> +++ b/drivers/of/unittest-data/Makefile
> @@ -38,3 +38,26 @@ DTC_FLAGS_testcases += -@
>  
>  # suppress warnings about intentional errors
>  DTC_FLAGS_testcases += -Wno-interrupts_property
> +
> +# Apply overlays statically with fdtoverlay
> +intermediate-overlay	:= overlay.dtb
> +master			:= overlay_0.dtb overlay_1.dtb overlay_2.dtb \
> +			   overlay_3.dtb overlay_4.dtb overlay_5.dtb \
> +			   overlay_6.dtb overlay_7.dtb overlay_8.dtb \
> +			   overlay_9.dtb overlay_10.dtb overlay_11.dtb \
> +			   overlay_12.dtb overlay_13.dtb overlay_15.dtb \
> +			   overlay_gpio_01.dtb overlay_gpio_02a.dtb \
> +			   overlay_gpio_02b.dtb overlay_gpio_03.dtb \
> +			   overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
> +			   intermediate-overlay.dtb
> +
> +quiet_cmd_fdtoverlay = fdtoverlay $@
> +      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
> +
> +$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(obj)/,$(intermediate-overlay))
> +	$(call if_changed,fdtoverlay)
> +
> +$(obj)/master.dtb: $(obj)/testcases.dtb $(addprefix $(obj)/,$(master))
> +	$(call if_changed,fdtoverlay)
> +
> +always-$(CONFIG_OF_OVERLAY) += intermediate-overlay.dtb master.dtb
> 

