Return-Path: <linux-kbuild+bounces-709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C698405D0
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 13:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88969286360
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 12:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB08B612EC;
	Mon, 29 Jan 2024 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="bWsMN8MK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93230627E3
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706533011; cv=none; b=G8uxT9hN+asfeet0Vx9rQGrQ2iQUkv+gx5l9enAKaBs7SszXYisZB1Z4i07O2I+kHZSEeTHtiPhQjpyIsUY2pY4dOjQcUgYebLK16q6w/E7T1A6DbtlTEFVfolIuRck5/Vj+a8fYzztJCluoXvOkqvTDkqL9SnzQ8Qn7/vykABk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706533011; c=relaxed/simple;
	bh=h6Gytjecrgj+QnUGb6LEMt11i7M5rKoL7fKZ/bZIWGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1VLPnhs6cPMshPo/4TCHhGgCRSFxO7enh2iMXhXzUnxAj7a9EZXAC9hCcFp/r8Qy76Ec0aixyHmLaEKRS8ogBe1lFufHt3riOFSMTM3E/2rEL0vfgYN3YjGK6NHo0CpdRNOGwfmf77MDrtoIsnq+BMsrFMUs71rU0gHlGlMPmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=bWsMN8MK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33af6129f3cso12850f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 04:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706533007; x=1707137807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QNHXs4gkTIruD9kdTnQ2Vb/LdVmYQFJe6pspYfvSm5Y=;
        b=bWsMN8MKE8PARjycpKpXl7KJfZvADmB1Md7F55vuA3V8r8nPHAAdQxRCzg/crdGYKW
         uMfKRtDKJMQk2SeeXovFzXc/WlrZ1fqYq6pbFc9/f/NxM7MiYU0cjZifwlEBm8CdfUSP
         5vJLH2Mvo0cLDH1Uv2pPrLcYHEEiqpbGNRAT66Er8+FzGPAJI1EqoMTlYJ0CtFwWYYWI
         mBUE4jGnMrnPFXGGr6lnUip4RVEvDvjDrd3oiTNtvuC8mtzbRI9mTPOkKwhnbtyX0bdO
         XF7v72E8nfTWwANmhDNvj7BmTzCKje1qs70bC6nm1elwDM0YKC9LhSZ3xr5mpsqsdpu8
         989A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706533007; x=1707137807;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNHXs4gkTIruD9kdTnQ2Vb/LdVmYQFJe6pspYfvSm5Y=;
        b=YHWy8Byj3/Gr2Zf3mxu7J0LGUi+rPGrKjmXS0NM+uzj06Wf8NbvsM81/Smbg9FZgcI
         ldEWTeeZ1D6YkGI42am47Pqr6MEcGsjE8Amkpos9nU91Q0gEImsF+Rv/ZWY44+xden3K
         z8iNIcTRUs7SlchnfQO70CXTMsdaKM/YryF2tpy876SAxTo/fA9ERv0wAsiCLVt74rWi
         r8KwZnaQjOyDnX9sxFKxJTv84ywYDvGoK4UXKf6drElPcBoeN6QPtlJEW3z81b5pDAlU
         2/g8eeAAUp1rPYTKjSAdS8WvjAs/0ugUS1nJJhUNt0sD8lvnnwZfwumtJwS3CXJVddJR
         EGnw==
X-Gm-Message-State: AOJu0Yw9huHLzGgY+jMAw5a1DSWGMad6u0n+G7h3bFVdANR4dxAAAIt7
	1DS0irx8Nv1CMT1Daj6BrIsLXW5QF7a4qG+ouJEjYQgvdaQedWszpSlBbnLVv9E=
X-Google-Smtp-Source: AGHT+IFD0/AG4pK9idMgc+xNvKzU9UgU/aWCZWDYMPtgA7pWAg6M1FWgI9ROhX5tbjXcEyBUPOYuMA==
X-Received: by 2002:adf:e88a:0:b0:33a:e7d7:5fbd with SMTP id d10-20020adfe88a000000b0033ae7d75fbdmr3280075wrm.32.1706533006839;
        Mon, 29 Jan 2024 04:56:46 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id t18-20020adfe112000000b0033ade19da41sm7316871wrz.76.2024.01.29.04.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 04:56:46 -0800 (PST)
Message-ID: <31306b8b-d534-42ad-8ece-b4b558023efd@smile.fr>
Date: Mon, 29 Jan 2024 13:56:44 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] printk: Remove redundant CONFIG_BASE_SMALL
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 "Luis R . Rodriguez" <mcgrof@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20240127220026.1722399-1-yoann.congal@smile.fr>
 <60deb891-dab3-4440-82ff-c179486c0a79@kernel.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <60deb891-dab3-4440-82ff-c179486c0a79@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Le 29/01/2024 à 12:28, Jiri Slaby a écrit :
> On 27. 01. 24, 23:00, Yoann Congal wrote:
>> CONFIG_BASE_SMALL is currently a type int but is only used as a boolean
>> equivalent to !CONFIG_BASE_FULL.
>>
>> So, remove it entirely and move every usage to !CONFIG_BASE_FULL.
>>
>> In addition, recent kconfig changes (see the discussion in Closes: tag)
>> revealed that using:
>>    config SOMETHING
>>       default "some value" if X
>> does not work as expected if X is not of type bool.
>>
>> CONFIG_BASE_SMALL was used that way in init/Kconfig:
>>    config LOG_CPU_MAX_BUF_SHIFT
>>        default 12 if !BASE_SMALL
>>        default 0 if BASE_SMALL
>>
>> Note: This changes CONFIG_LOG_CPU_MAX_BUF_SHIFT=12 to
>> CONFIG_LOG_CPU_MAX_BUF_SHIFT=0 for some defconfigs, but that will not be
>> a big impact due to this code in kernel/printk/printk.c:
>>    /* by default this will only continue through for large > 64 CPUs */
>>    if (cpu_extra <= __LOG_BUF_LEN / 2)
>>            return;
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Closes: https://lore.kernel.org/all/CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com/
>> Fixes: 4e244c10eab3 ("kconfig: remove unneeded symbol_empty variable")
>> ---
>> v1 patch was named "treewide: Change CONFIG_BASE_SMALL to bool type"
>> https://lore.kernel.org/all/20240126163032.1613731-1-yoann.congal@smile.fr/
>>
>> v1 -> v2: Applied Masahiro Yamada's comments (Thanks!):
>> * Changed from "Change CONFIG_BASE_SMALL to type bool" to
>>    "Remove it and switch usage to !CONFIG_BASE_FULL"
>> * Fixed "Fixes:" tag and reference to the mailing list thread.
>> * Added a note about CONFIG_LOG_CPU_MAX_BUF_SHIFT changing.
> ...
>> --- a/drivers/tty/vt/vc_screen.c
>> +++ b/drivers/tty/vt/vc_screen.c
>> @@ -51,7 +51,7 @@
>>   #include <asm/unaligned.h>
>>     #define HEADER_SIZE    4u
>> -#define CON_BUF_SIZE (CONFIG_BASE_SMALL ? 256 : PAGE_SIZE)
>> +#define CON_BUF_SIZE (IS_ENABLED(CONFIG_BASE_FULL) ? PAGE_SIZE : 256)
> 
> Why is the IS_ENABLED() addition needed? You don't say anything about that in the commit log.
> 
> thanks,

It is needed because we go from using CONFIG_BASE_*SMALL* which is of type _int_ (so either defined to 0 or some other non-zero value) to CONFIG_BASE_*FULL* which is of type _bool_ (so, it is either enabled or not).
If I understood correctly, the proper way to check a config of type bool inside of a C function is with IS_ENABLED().

Another way to say this is :
  CONFIG_BASE_SMALL != 0
is equivalent to
  !IS_ENABLED(CONFIG_BASE_FULL)

Finally, CONFIG_XXX is not defined if CONFIG_XXX is a type bool and disabled so :
  CONFIG_XXX? "yes":"no";
... does not compile.

I will try to explain it better in the v3 commit log.

Thanks!

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

