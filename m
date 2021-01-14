Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6173D2F5A1D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 06:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbhANFBi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 00:01:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbhANFBi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 00:01:38 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFC7C061786
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 21:00:58 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id v3so2298567plz.13
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 21:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cE42hFVWguryUlCy208ZPD2cycUw1CkNT9EoleozTcg=;
        b=T+xOhJjkUwkFDehOd5lqfyjQlHhT1i8lTPkAHdt7hR/Mc9HxU1ffN8TCrfP6Cg3vfT
         04w4O7r+q7p9+mYR2sTVgqmVPXYkNP29UpjJhYaSC2CLkUj9ByqX0yfFxWjhFCxglc4F
         9265lD9q0OJZF/BX+ofCrZXoEL9deZaEqYLCF42nJiZFYH20bZId3xFcrZjbJjg9eKrw
         lwDGzGT4G979NSEMf1NRb9ytA/vhjSPPPO3YK6XWh2z1OWRr2hFTstAKjkdNAw1OxG+J
         bhBkl3FfQYjvFUqpZeSbNRg92j6DOSjA5Zc5AI8diKdusrneAUJ5VgTq+I6DOqnH7Jl8
         ZLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cE42hFVWguryUlCy208ZPD2cycUw1CkNT9EoleozTcg=;
        b=uOtxNMyh4IrHFwujfzPWZ1nhQAtEZCsQcvWJhXbX7ZxDAe3h/44fPgbLNc+aZedyf9
         3dlKXVmFwFm5JYIErL+lETHDounIYEYPYc5roGRwkX1SVPzk6jKHJ2XdBIvS44OKs9Ol
         NIK5FbisSUj9E7bb5OA8Ry8MicfHtaGnnfC/IO+np+57gXEkHBoKmqrC5a3Z3G2s8WR3
         dnmZjCGL20t2ul7RG5SVN2ti2X5kMnMHe3RKaXSlnyM+PK8BAsy+qxLvgAqIf4OTZsFT
         eNGLGYefptjW04Lskr1VzTl91ns1KHjP9fTi9T9OwAPZwqT6QZ2hi7+vjL36d5Om2fyg
         WAHA==
X-Gm-Message-State: AOAM530YQuqcPVgDHr8HF7VY9XCEecka4lNHxvRfnmk6Ziue6Qv7VY5F
        7sGkTEt+ozi/VC9tmO3woUciINqbqmJBCQ==
X-Google-Smtp-Source: ABdhPJxmovMsDDzMfYod9jPsoYrPikEBudEzDVbQ7NJePchZ7rsR/uQyoELD5H7C/+Q8y9eUaMHQng==
X-Received: by 2002:a17:90a:ee8f:: with SMTP id i15mr3056399pjz.82.1610600457673;
        Wed, 13 Jan 2021 21:00:57 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id gz5sm4294731pjb.15.2021.01.13.21.00.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jan 2021 21:00:56 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:30:54 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Message-ID: <20210114050054.gfkllnr45pgvwcd7@vireshk-i7>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Frank/Rob.

On 08-01-21, 14:11, Viresh Kumar wrote:
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

I will update this part to mention about the dtbs we are not using in the build
as they will fail (as per Frank's comment).

Is there anything else you guys want me to change before I send the next version
?

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

-- 
viresh
