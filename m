Return-Path: <linux-kbuild+bounces-166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8227F9042
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Nov 2023 00:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A94191C209D3
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 23:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0CF30FA7;
	Sat, 25 Nov 2023 23:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="OPclexMT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C70129
	for <linux-kbuild@vger.kernel.org>; Sat, 25 Nov 2023 15:10:46 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b405699a9so3842345e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 25 Nov 2023 15:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700953845; x=1701558645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oNiZ0WOzTAV3L7455QiacDrpLq7f4/1o2lfYS0Foxfw=;
        b=OPclexMT3Eqmk//h2K2gjUp25wBxtFtJOkzfprvVKGD5jpssC4OPWGfB4MyrghwWHL
         VflP/0oDe+YjYJ3zpGre9LUKkdbPAniAGXw4F99MpzC/EHTJDLcxnL+Gek1hGWHaHEal
         pkbe2LtNEP4aRDjegzdLWylSb2Ybg52lX+GIF1BDv5NcZlenanpcyPpXbZn3wAMV2o6B
         8i+a4Fyp/+WPUxE8A8oAvZ2tJX5BXq4kH74q2dfKOb+R4Z//HGpXD/hERDKCj/bIi8PV
         rCzHFmZKt8naPlgT6+FD3H20vg2angIeytGO8AXLhu0yOcis7/f7mUtYM8dnUUD5QqRd
         05pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700953845; x=1701558645;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNiZ0WOzTAV3L7455QiacDrpLq7f4/1o2lfYS0Foxfw=;
        b=KWc/F9tnh9ngdVirUbqLO7QXHgzoXaIbiHka/gI/arhKAX4/v3UjUKBxE+KQM4RjLQ
         Z+wGwwXQl5OIGS1H+dqpUxcmON8nSZq8j+Kqsarg3mz6z/A9X0wYDk8MKSdp5TMmXDV3
         tzsEseoX8Qd20zoxZ+jhdPdUCXSK4AFFPmppC+JkP+5Te9UeiiCTdzuWWF35n8ciMZCz
         P73V7B2sUUp1VIdyIBirs/OMPtg6p0tPYd5u96cALNl3wHM/bsm3tJn904AY6gKTFW95
         NLNvUx/Chds8v6yegtHRYz17xmmTCPoLXI5w+X9mk89RYCd0Tu94wLk3nl2WbmYQuxkI
         P1BA==
X-Gm-Message-State: AOJu0YyZxWYyckdB4aipn2Y4A3FDuWyVAnuzcQFfM/TIch6Ju/p+j1wd
	e6xQn7L06HpLZZ6Q3BIBLVtMdvWYlwtf7wyaoWM=
X-Google-Smtp-Source: AGHT+IEIXmZ9SSqNoPouyelTnEwM+YSm+OIdhr6YJ1d8IHhmIBrHsEleYcYCZqdWLXfDROH4jWuvsw==
X-Received: by 2002:a05:600c:4f88:b0:409:2c35:7b3e with SMTP id n8-20020a05600c4f8800b004092c357b3emr5476999wmq.8.1700953845282;
        Sat, 25 Nov 2023 15:10:45 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id fl8-20020a05600c0b8800b004030e8ff964sm9707637wmb.34.2023.11.25.15.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 15:10:44 -0800 (PST)
Message-ID: <fd5f08c0-4603-471a-bd6f-44a2e6191ac7@smile.fr>
Date: Sun, 26 Nov 2023 00:10:44 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kconfig: default to zero if int/hex symbol lacks
 default property
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20231125163559.824210-1-masahiroy@kernel.org>
 <20231125163559.824210-2-masahiroy@kernel.org>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20231125163559.824210-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 25/11/2023 à 17:35, Masahiro Yamada a écrit :
> When a default property is missing in an int or hex symbol, it defaults
> to an empty string, which is not a valid symbol value.
> 
> It results in a incorrect .config, and can also lead to an infinite
> loop in scripting.
> 
> Use "0" for int and "0x0" for hex as a default value.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks! It does fix our problem.

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

> ---
> 
>  scripts/kconfig/symbol.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index f7075d148ac7..a5a4f9153eb7 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -338,7 +338,11 @@ void sym_calc_value(struct symbol *sym)
>  
>  	switch (sym->type) {
>  	case S_INT:
> +		newval.val = "0";
> +		break;
>  	case S_HEX:
> +		newval.val = "0x0";
> +		break;
>  	case S_STRING:
>  		newval.val = "";
>  		break;
> @@ -746,14 +750,17 @@ const char *sym_get_string_default(struct symbol *sym)
>  		case yes: return "y";
>  		}
>  	case S_INT:
> +		if (!str[0])
> +			str = "0";
> +		break;
>  	case S_HEX:
> -		return str;
> -	case S_STRING:
> -		return str;
> -	case S_UNKNOWN:
> +		if (!str[0])
> +			str = "0x0";
> +		break;
> +	default:
>  		break;
>  	}
> -	return "";
> +	return str;
>  }
>  
>  const char *sym_get_string_value(struct symbol *sym)

-- 
Yoann Congal
Smile ECS - Tech Expert

