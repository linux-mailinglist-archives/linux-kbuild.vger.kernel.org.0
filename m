Return-Path: <linux-kbuild+bounces-7494-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97DAD8961
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jun 2025 12:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7A323A5621
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jun 2025 10:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891CD2C15B1;
	Fri, 13 Jun 2025 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XqSwfUjz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666802D5C83
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2025 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810084; cv=none; b=B35VxO0datWjyJRL+1cbNBNHEhjr263qlL43teFcZC4h+QZb1jrDqVNfFKrWvwd9LOu/8a+xVp09l2wPOO4F0eyV0cq6HFRl7d8QbQr+LI0xBOtKntkduLJFRclHQ9Lk8FFliEr8wTMUjnRidOSr9lBf6hBlxU7BjidEefqEhHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810084; c=relaxed/simple;
	bh=5vWvO7APvFqNr7TvWRF8J9X828f8LeO6UiHetDUQAPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0qVvJGfjJZ8++GW1y1TwkP8VDCDAW9jyGtKxp8rFG+m6+9Oj9eN3CaLuWVbFskH1KUxdHXkCG5dH0uUhRafhcyVwdB6fEAA44/2PksIjZmxpjbrVe7e/hpC0oXkXBJdqKqgXsh8m0WsJm+yxNhDoo9b2wtKotjtBPKx0LT6bnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XqSwfUjz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade33027bcfso310524866b.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2025 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749810081; x=1750414881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9SJxTP/LNWCbYYEI6OkUEGLgl2yUwj6T7YItwXovjw=;
        b=XqSwfUjzumsdz8qLHdVfKRfy6wJKh2yOCdDl4WldplVQaEW6RDfv2CsBoYRRzhAQhl
         eU8sFCHqi4W2A2+6gzBTOqwb9NMfQjy7pIoWIFy0lQ4LLKjM/H57f7D/Lm13pKUuQWhV
         KvaUSEv0fJ+rqOOGw9I4WU0xouQcr54AhI7hSGDWNwSHyTd8UzeXu99E6UUdVwBULbl5
         /tMY+qC4BLHQjEC5dDgvx+lL42Pmno9JrmcS2oy3eDo8Q7uNSojqjmN0BBEeusmOyYtf
         mpyheqeNYHz+hONgV6RPpcIxiwgKL3nBZQ8tBicksyn7fvf6BC7w+tDk0n8Cjooq9Unm
         oIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810081; x=1750414881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9SJxTP/LNWCbYYEI6OkUEGLgl2yUwj6T7YItwXovjw=;
        b=MQFTVNQxJMmbKzpXOYykpqVnt8tJU3Rs39fnblWjGTbKALeDVZz1wDHb/RpK0hFY/L
         goQCl636GV9kayzv+S+HVsrYGRRFqmpiXcByDvDraOcE1y4f/gQaHJYIbhlwy954QYhI
         RNM12Hc7F46BWIpc/PjFC0vFwrMQqMdTohOo6cJvxYmZbjrJ1gm4FHEEtCJoX/66kl0K
         R1rOVNhRih+AW5XZt5zQVWUa+me4jVH0oiBeKbbIquUqHZpAO/pUm62TnsJXV6lUCzZj
         M9mYy7DphHliAPDjSPAYix62R0Nd8HnaP3psX0HKCwgDRTXVjPn5u1GailP7T5sMB8rx
         n/iw==
X-Forwarded-Encrypted: i=1; AJvYcCVhW15qoLidqP5+TrhAhfK4AwlZYl7b1i1QYGckD1s0eqUNah4KzeOGInjS37AnVj9pvS0js6hku9viRhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx8zgHm43ghEHkPPx7dtIkSiFFzDN9Q1OVrqhcQ4ssWEGkFs/K
	GUu0OI2dpq8ylGWisMGJHVlm9DLD/6SpLtS0fGOsXNBJINL62Et153NRoLwhG7ItNVpAEakJK/n
	o8wol
X-Gm-Gg: ASbGncu6MhefQF0zJRMstHLAw0LgzX6cR5C1GkXaBO29UElIWZpN9QH7i0DU3Jqp7HP
	+wZI/UZJ7BYdUrjWOxA3Fd9L/GgmHIeZlzXlb8C2YWRBRXwQtricoiJXXSVh0ppzdRWmdhjC57d
	UwGy4UbCL/nBUn5JY7mFWze1hKmYoh3nBRPfa4ADRCpIM2jv6LNFMohpBRlySXQ6Fq5wGRy3Nvl
	E09JhA9aa6t8aYN7WFWOHFDCybY01ThRICH6NrPMH13GcwFVDkXdz/J+JVdvNd0y/vJ7MtRQ6wU
	IvmOk5d4yFiww2Y+qk5C17r++JFp8RkDpn029oyInFXIpHfeLDylbo7Tcraw1awJOX2Z+hSwEWn
	C2nWkDlk/fP/wzmB1VFEdEXSuhgdCJOvE+AuhiZ+ssKT658sqYdaRECmh9mjxZJEzQwK23hFqzq
	PVyqKZ+lGoE8eHLhmKKPIe7gj5XEwA
X-Google-Smtp-Source: AGHT+IGwhxBXtvKQCuLuDCf/nGJEfM4DLEKQAoHQVK7c7AK6Z8TsMeRo2v0GxkveBG+7/VTqYRmzIQ==
X-Received: by 2002:a17:907:97c5:b0:ad8:87a1:4da8 with SMTP id a640c23a62f3a-adec55221aamr244337866b.14.1749810080571;
        Fri, 13 Jun 2025 03:21:20 -0700 (PDT)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf1b7fb8d5sm29584666b.98.2025.06.13.03.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 03:21:20 -0700 (PDT)
Message-ID: <f64cd2c7-905c-4554-b007-ad3fd528cec9@suse.com>
Date: Fri, 13 Jun 2025 12:21:19 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] module: remove meaningless 'name' parameter from
 __MODULE_INFO()
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250606041029.614348-1-masahiroy@kernel.org>
 <20250606041029.614348-2-masahiroy@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250606041029.614348-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/6/25 6:10 AM, Masahiro Yamada wrote:
> The symbol names in the .modinfo section are never used and already
> randomized by the __UNIQUE_ID() macro.
> 
> Therefore, the second parameter of  __MODULE_INFO() is meaningless
> and can be removed to simplify the code.
> 
> With this change, the symbol names in the .modinfo section will be
> prefixed with __UNIQUE_ID_modinfo, making it clearer that they
> originate from MODULE_INFO().
> 
> [Before]
> 
>   $ objcopy  -j .modinfo vmlinux.o modinfo.o
>   $ nm -n modinfo.o | head -n10
>   0000000000000000 r __UNIQUE_ID_license560
>   0000000000000011 r __UNIQUE_ID_file559
>   0000000000000030 r __UNIQUE_ID_description558
>   0000000000000074 r __UNIQUE_ID_license580
>   000000000000008e r __UNIQUE_ID_file579
>   00000000000000bd r __UNIQUE_ID_description578
>   00000000000000e6 r __UNIQUE_ID_license581
>   00000000000000ff r __UNIQUE_ID_file580
>   0000000000000134 r __UNIQUE_ID_description579
>   0000000000000179 r __UNIQUE_ID_uncore_no_discover578
> 
> [After]
> 
>   $ objcopy  -j .modinfo vmlinux.o modinfo.o
>   $ nm -n modinfo.o | head -n10
>   0000000000000000 r __UNIQUE_ID_modinfo560
>   0000000000000011 r __UNIQUE_ID_modinfo559
>   0000000000000030 r __UNIQUE_ID_modinfo558
>   0000000000000074 r __UNIQUE_ID_modinfo580
>   000000000000008e r __UNIQUE_ID_modinfo579
>   00000000000000bd r __UNIQUE_ID_modinfo578
>   00000000000000e6 r __UNIQUE_ID_modinfo581
>   00000000000000ff r __UNIQUE_ID_modinfo580
>   0000000000000134 r __UNIQUE_ID_modinfo579
>   0000000000000179 r __UNIQUE_ID_modinfo578
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> [...]
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 92e1420fccdf..81b41cc6a19e 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -164,9 +164,6 @@ extern void cleanup_module(void);
>  
>  struct module_kobject *lookup_or_create_module_kobject(const char *name);
>  
> -/* Generic info of form tag = "info" */
> -#define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
> -
>  /* For userspace: you can also call me... */
>  #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
>  
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index bfb85fd13e1f..00166f747e27 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -20,18 +20,19 @@
>  /* Chosen so that structs with an unsigned long line up. */
>  #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
>  
> -#define __MODULE_INFO(tag, name, info)					  \
> -	static const char __UNIQUE_ID(name)[]				  \
> +/* Generic info of form tag = "info" */
> +#define MODULE_INFO(tag, info)					  \
> +	static const char __UNIQUE_ID(modinfo)[]			  \
>  		__used __section(".modinfo") __aligned(1)		  \
>  		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
>  

One nit is that MODULE_INFO() is now defined in moduleparam.h, even
though it is a general macro for adding module information and not
specifically tied to parameters. I realize it is needed in moduleparam.h
and that the dependency is from module.h to moduleparam.h, not the other
way around. We could potentially keep the MODULE_INFO() (in module.h) ->
__MODULE_INFO() (moduleparam.h) split solely for this, but it is
probably unnecessary.

The overall change looks ok to me.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

