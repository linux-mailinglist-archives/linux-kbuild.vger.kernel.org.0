Return-Path: <linux-kbuild+bounces-7105-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F33AB6634
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 10:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4071A8658CD
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 08:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CD421C9F9;
	Wed, 14 May 2025 08:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZDmZZybQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AD91FF60E
	for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212037; cv=none; b=ltSNbHulgd5nvKjW6eoUbqRcx3FjshHvK+F0WEKRb0eE6CaekVmLHuwSjpNubV3leKxhHwVAycBny1onfk5/N419+8gV9KOK+vtLDjR/mJDhSo+XUrwzZoWTRerLBbDJhPpEvRPCZrz8JA3cRYaglyke26UZvUD0y0+EVe5DZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212037; c=relaxed/simple;
	bh=bOvlpJgB38yWtB6iHmH6Tk5IzM3ygnlwVf/ZOxmrdgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIA3A5AF773E9Drx4sJ64pqNsJXOWlk4w7PrKjtQGeSPq6TiZpJIANQ4Txfl06s0/r85qngxMmE5a8dQA8HVIJp8H24E/GsXRlXyQWbRMViRpN19Oibyvlbrc3qkV+MURyxJPsiUN5biokBvEFl00v/0qalaIlwB/ZaXH6P6zcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZDmZZybQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso2944773f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 May 2025 01:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747212034; x=1747816834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUZ+TWBCEumVyKUR1t0gEvLsedm10yxyAulY/94k4bA=;
        b=ZDmZZybQav+Ly9/LFyPILWry6DnnrY7Uj2P8/t3fZ/8N6MlvjwPOq8ochp2fYz5Xjf
         dgWsby0IOuX+FJsM9VGytDmIRBtmPx+lpjgqFDOdam3M9q1L+onH3PauIvfnHSpBJ6LX
         p0EBhBcBNdj3QoGi76bdIVf+Hh6vTLUG2tcLdMaeG0J5P855WrBo1AplITse9EmmDWnq
         X2eert3ic6eWEpMyTC1vXimz+wpJWgBq7kB9HYrB/f/1OXBwEV1ul3Hdt/XvvEk96r3v
         NQwPJcj00AtxHQF4by7aLMCaTG1GPtyylCvykwd6bg+Z2AOyM6HNVtE6MfkjGF5/8ETs
         Jd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747212034; x=1747816834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUZ+TWBCEumVyKUR1t0gEvLsedm10yxyAulY/94k4bA=;
        b=OVrCN5lTOLvpOn21a7C/PsR3pVn/VZxr+ngM6d+OPEpBUt6h867p8qp9Ge2z4pM2sm
         C4okbRGdzYJktc8GaMdTlq6qg+JWL03Y/bFItedK+Zj2qBB6UpKTwoH3hGXNE/E7RgFR
         4HizQ8pybM7STHZ588Yskm90/H9TVuy0UsTyVa508EMgg3+eIFr+XgNHAjU9zmzmmOtT
         wjUGvL8t0w8dAGQTSjSvUlv5N5nRzfkB9pydM6S35HBOs2KwCNdhPQjak5idrlXbJxbi
         jImH55C/DYiCLoEFFXzCgJ9cHamWFxjAaY917q3EJs8wNPChvrZTuBYSCaIm0m/ewTeU
         Gj9w==
X-Forwarded-Encrypted: i=1; AJvYcCW06fOGhX6zVIo25pSFnXGhEaEpGEWGeoR7UqVvNC9p64BfYnfk3Ua+d3l64Hw0Z/xnVuVa+SFw/iMHSJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYssoRzM0nFlw/oPt9UzUJquYHKKt1mDqkC2vMomqgh7sB6NCw
	IHrzO6qlU7jWJKUmQB0q15kkBxwO5GKkmcJL2qKzz7aQy6PmvRCM+zP/UJL83PA=
X-Gm-Gg: ASbGncsGn3eVfhlov6N+2cZh38PeJLJeZffEyYeT+v8oZy4oYDt4iIEaqW+tmq6XO/m
	e8T+GcRJAeJ2m+ex5juPgfCJ0XvDS1EeQFSw5ohstSKHqOSOO57+zBBhAl5uh08/TWGrw9lz6WS
	TST5LBZX+mouqc0kQFcj9h7S4GEmiE9HVkQLUlesGbsbixrO1Oa8U3P/tgNAy/03p6O/0uF1ms9
	0ndUqRBNWhKTCozXMMnryAMlHRX76/1fmKmqid3G1O8oixLm4ZXbqPJ5a7oa0pi8GzvvN2JFjB1
	3amPqqxt3B/4GOj68aApzyMq3KaHMcrwhNVStqS4y0HXfocBv67F9Q==
X-Google-Smtp-Source: AGHT+IFF2gEltVWksw/7sMuSeu0VYvts2lcQdv0P/daOYEJ1wwTuGxfg8BHv9/A6qpkaqat5IeIqJg==
X-Received: by 2002:a05:6000:4284:b0:3a0:7f85:1905 with SMTP id ffacd0b85a97d-3a3493dada6mr2246544f8f.0.1747212034024;
        Wed, 14 May 2025 01:40:34 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea857f729sm7994896137.1.2025.05.14.01.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:40:33 -0700 (PDT)
Message-ID: <3b8dad35-5af2-41f3-aea2-07db9761dd4a@suse.com>
Date: Wed, 14 May 2025 10:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES()
 helper
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com,
 samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
 <20250502141844.369838967@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250502141844.369838967@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 16:12, Peter Zijlstra wrote:
> Helper macro to more easily limit the export of a symbol to a given
> list of modules.
> 
> Eg:
> 
>   EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm");
> 
> will limit the use of said function to kvm.ko, any other module trying
> to use this symbol will refure to load (and get modpost build
> failures).
> 
> Requested-by: Masahiro Yamada <masahiroy@kernel.org>
> Requested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
> [...]
> --- a/include/linux/export.h
> +++ b/include/linux/export.h
> @@ -24,11 +24,17 @@
>  	.long sym
>  #endif
>  
> -#define ___EXPORT_SYMBOL(sym, license, ns)		\
> +/*
> + * LLVM integrated assembler cam merge adjacent string literals (like
> + * C and GNU-as) passed to '.ascii', but not to '.asciz' and chokes on:
> + *
> + *   .asciz "MODULE_" "kvm" ;
> + */

Typo: "cam" -> "can't". I can correct it when picking up the series.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

> +#define ___EXPORT_SYMBOL(sym, license, ns...)		\
>  	.section ".export_symbol","a"		ASM_NL	\
>  	__export_symbol_##sym:			ASM_NL	\
>  		.asciz license			ASM_NL	\
> -		.asciz ns			ASM_NL	\
> +		.ascii ns "\0"			ASM_NL	\
>  		__EXPORT_SYMBOL_REF(sym)	ASM_NL	\
>  	.previous
>  
> @@ -85,4 +91,6 @@
>  #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", ns)
>  #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", ns)
>  
> +#define EXPORT_SYMBOL_GPL_FOR_MODULES(sym, mods) __EXPORT_SYMBOL(sym, "GPL", "module:" mods)
> +
>  #endif /* _LINUX_EXPORT_H */
> 
> 

