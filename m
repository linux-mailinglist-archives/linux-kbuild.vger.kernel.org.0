Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B45937E50D3
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 08:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbjKHHN4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Nov 2023 02:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbjKHGya (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2023 01:54:30 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34CA1A5
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Nov 2023 22:54:27 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40853c639abso47242375e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2023 22:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1699426466; x=1700031266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLU3pXaep9ANYhAtzsYwLgnt2lc8UAALt3j3fTNK0cc=;
        b=k9Yq4PQmu+XA4knUObfjM7kXQogso20BNf/9PYzyB0pKsqFMFtebmRl7N6fYvXy6G9
         rdxWC7hzyXE4ttVxMhEPgYG5GCgT/wige3hSvWFTYU025Ddx/tATQqgZA1cc38L3fvAw
         MKAWhs0iVCE/eXKGujCjvg476mv8BVbrPu5GiZsV3NHziL5cZqMduy/3+K1gqyMyxWsN
         P9OVb0n2mWrxd1h90j7dASroOmdx/9xf2f8m0f+q123N0yID7dP/yZJhgiS0HZTGgT8G
         ofcpbDmtvQ0APcSLZ10CySiptgJQSz5v7Tkoi6LvasVFnX8lx4JGFTQEfID05US/S3r6
         8DuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699426466; x=1700031266;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLU3pXaep9ANYhAtzsYwLgnt2lc8UAALt3j3fTNK0cc=;
        b=wWbTdHH3hAQDkDqAxxQ873D4ufi+irtze/vGzMUFGXjzpshay9ILQchk4gDoqfiJEQ
         0bXzjDyXJ9cpPEJsuSuEKsuxjQ0ZAGkAhqe+QDs1oxarbx1cb6RGgt4RCZdjRSIprjxZ
         W+zt662Pxq/iqgmHyq8NgVzJT6VapWaQRqKFvSjxIYGcOvQSj+hMSrToLpzWwYbNFdNK
         +9W6egT29OrYT58266oRYy+UP9KeioabKY3RQR04HCAv1ZHy8zjkuuFghfvQCO+ySvvi
         uw/mmsirOhWIqONpvrKJiK4nyGjCAS/Bn4SgjBGsZQh6ME/9gU0y5d3/W+QXPDkvNWfE
         LfNg==
X-Gm-Message-State: AOJu0YxugvPKThdM8H2EApx5dtvGMkU6MkaDLpr+6Ly4EC0MYOvrrky1
        RcT/iHGl4OwraANspPto6t7SZA==
X-Google-Smtp-Source: AGHT+IFGc958p+2Xn1W+6Oayumpfev2x+ZaiTixSHeGm5Od1UgKsHxJT3GRKUcyOCL1mF5ZzjFfq9Q==
X-Received: by 2002:a5d:648a:0:b0:32f:bdeb:d8c0 with SMTP id o10-20020a5d648a000000b0032fbdebd8c0mr790638wri.58.1699426466056;
        Tue, 07 Nov 2023 22:54:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id d5-20020adff2c5000000b0032d2f09d991sm4110012wrp.33.2023.11.07.22.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 22:54:25 -0800 (PST)
Message-ID: <ffeacb49-53ee-4b30-9e79-ef5490eeec98@tuxon.dev>
Date:   Wed, 8 Nov 2023 08:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] power: reset: at91-poweroff: Stop using
 module_platform_driver_probe()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, linux-kbuild@vger.kernel.org
References: <20231104211501.3676352-16-u.kleine-koenig@pengutronix.de>
 <20231104211501.3676352-17-u.kleine-koenig@pengutronix.de>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20231104211501.3676352-17-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 04.11.2023 23:15, Uwe Kleine-König wrote:
> On today's platforms the benefit of platform_driver_probe() isn't that
> relevant any more. It allows to drop some code after booting (or module
> loading) for .probe() and discard the .remove() function completely if
> the driver is built-in. This typically saves a few 100k.
> 
> The downside of platform_driver_probe() is that the driver cannot be
> bound and unbound at runtime which is ancient and so slightly
> complicates testing. There are also thoughts to deprecate
> platform_driver_probe() because it adds some complexity in the driver
> core for little gain. Also many drivers don't use it correctly. This
> driver for example misses to mark the driver struct with __ref which is
> needed to suppress a (W=1) modpost warning.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  drivers/power/reset/at91-poweroff.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/power/reset/at91-poweroff.c b/drivers/power/reset/at91-poweroff.c
> index dd5399785b69..83567428ab43 100644
> --- a/drivers/power/reset/at91-poweroff.c
> +++ b/drivers/power/reset/at91-poweroff.c
> @@ -149,7 +149,7 @@ static void at91_poweroff_dt_set_wakeup_mode(struct platform_device *pdev)
>  	writel(wakeup_mode | mode, at91_shdwc.shdwc_base + AT91_SHDW_MR);
>  }
>  
> -static int __init at91_poweroff_probe(struct platform_device *pdev)
> +static int at91_poweroff_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np;
>  	u32 ddr_type;
> @@ -202,7 +202,7 @@ static int __init at91_poweroff_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int __exit at91_poweroff_remove(struct platform_device *pdev)
> +static int at91_poweroff_remove(struct platform_device *pdev)
>  {
>  	if (pm_power_off == at91_poweroff)
>  		pm_power_off = NULL;
> @@ -224,13 +224,14 @@ static const struct of_device_id at91_poweroff_of_match[] = {
>  MODULE_DEVICE_TABLE(of, at91_poweroff_of_match);
>  
>  static struct platform_driver at91_poweroff_driver = {
> -	.remove = __exit_p(at91_poweroff_remove),
> +	.probe = at91_poweroff_probe,
> +	.remove = at91_poweroff_remove,
>  	.driver = {
>  		.name = "at91-poweroff",
>  		.of_match_table = at91_poweroff_of_match,
>  	},
>  };
> -module_platform_driver_probe(at91_poweroff_driver, at91_poweroff_probe);
> +module_platform_driver(at91_poweroff_driver);
>  
>  MODULE_AUTHOR("Atmel Corporation");
>  MODULE_DESCRIPTION("Shutdown driver for Atmel SoCs");
