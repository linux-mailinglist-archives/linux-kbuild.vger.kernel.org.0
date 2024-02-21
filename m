Return-Path: <linux-kbuild+bounces-1008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A17B85D5BD
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 11:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC879281E04
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 10:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBD921112;
	Wed, 21 Feb 2024 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TfsZaFTD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2581EB48
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708511924; cv=none; b=Fq4DFl5Vbj6fzwrrMzE096VY85ePFQF+YHYQwSHN7cg3sAQoEW3dBhcRx8T7QbSUZVbfWe0URS7ajo6HT2q/5z+91FZz/oUKmx1KEzEnzi5euPniYfXB1uv8egdGlE5jx0HEjaczcvGOQ1KUMpqcLzyJK4V7rF0NuKMRIQZ9SZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708511924; c=relaxed/simple;
	bh=HBTD9NpgqM7kq4SO3bpEXJ5Bp3ofQRfsZKZeHA7Ambw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShwxGvn6Cf79XtkFVgW2knajixpsEkfJOAULiOZUc3QhJwIirYJ3wCFdZfZPoO6lqwpRlGFFLQXVFJCwZmkLJ05Syb3vsTk8fNU3xn2EXuo92P9LIM8ZTUJMN+J5M9YRdAA96mVSeBQi+4+jawrBBc00s6+oT0/UCVWOyLgewAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TfsZaFTD; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-563c0f13cabso8144021a12.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 02:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708511920; x=1709116720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cnKoPzhACftS9EnEu9/ynu2qMvlchm1lfMLjCdPuVQo=;
        b=TfsZaFTDBogozp2cAgzkSMybRGAUN9RDlIjzgiP5UO0OpFN7X32ox+OgPxXumY1FbW
         POZQVDD+UIWzWEPZwHKfqKyUH0ROr9svS6vtom1werFfvZuToAwMaBb5uL8mLbNbkbgY
         19tx8dGHEwogBxdNlz3g+HA9guvKCjaChhsk8FDKFzEeO59se+1vu1iFnYUcnMpkZRgd
         S1gFPd27fdasdLl+4BpiavF1Wb2U6m0yJE6pvc6/dmMwERdCecvUNOqePQtLZ0YB9B7y
         F+ItuctFxJjnf2lHONeRmEaFE6WVP0HJK6snwY2ywAXvTMNwAWC0Cqd7wnKcnT/W2r2S
         Gd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708511920; x=1709116720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnKoPzhACftS9EnEu9/ynu2qMvlchm1lfMLjCdPuVQo=;
        b=e/jzqdoFNu40BDB5BzpIKzyB9EGIhpAG7HFz+Qk9avxRwmfJYJgECbuFgII6KjFFbn
         kpK3MIEzXG+GSFlfE2/l3VztZRPBzNgiOdkzPmTzkQgHZZPaVxYU/z0xE1Wj05itdFff
         3RSohp83zb/pSmnXybhxRdH8MX+p4MzxMermweu88xBLhiHjVA6GbdVST3X9S46of4Wp
         BW5OLDU9EDOemS5I6n25hIGwo7MWvJPST4a2E7i85AWtJkcY/QMoqLL/kme8mrj3LcPk
         B6UuGWq813tYgufrX+Y56Tl3Jbj9PCPfMceD3IvvDdJKQRpUj0PVK1xyYsE6vmlpdI+f
         QSxw==
X-Forwarded-Encrypted: i=1; AJvYcCX3gYiROcU4dqcfb+4JuFwEDLMMWLw0f1xcL5DmMiDgE/7lZ5WbwXKSOuHq+UA+xnhD5sbSgEaJQzuNfVWnzvyDAXpj7RiFblSeOCLo
X-Gm-Message-State: AOJu0YxeIgc+fVkrs/ugktmeLR1YNL/8v21N3EMghSSSJ2abPTVH6B9M
	90jHdvn8JtXeogcCi1DHdreVCWyTZDOKMqoJHAAhpsi0inGBNRHGrK7RHGmcExEkPzm1ingB6pX
	3
X-Google-Smtp-Source: AGHT+IGWY0olFbTK2LeHVps++mXY14F0mgECCZhY5FffQmgkJeKvOHJIZBdK7Rb6s/6ljo8BEwbLBg==
X-Received: by 2002:a17:907:b9ca:b0:a3f:2247:bb59 with SMTP id xa10-20020a170907b9ca00b00a3f2247bb59mr1776452ejc.61.1708511919896;
        Wed, 21 Feb 2024 02:38:39 -0800 (PST)
Received: from [10.100.51.161] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906474a00b00a3e50e01612sm3853825ejs.62.2024.02.21.02.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 02:38:39 -0800 (PST)
Message-ID: <9b067ec7-34e2-437b-a41b-319aaee4c7e6@suse.com>
Date: Wed, 21 Feb 2024 11:38:38 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: Use -fmin-function-alignment when available
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: nathan@kernel.org, nicolas@fjasle.eu, mark.rutland@arm.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240215151642.8970-1-petr.pavlu@suse.com>
 <CAK7LNAS=knGxd9ZRo37CaKTvjcc28bqNasx+XuqbV3S+XV=HtQ@mail.gmail.com>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAK7LNAS=knGxd9ZRo37CaKTvjcc28bqNasx+XuqbV3S+XV=HtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/20/24 14:39, Masahiro Yamada wrote:
> On Fri, Feb 16, 2024 at 12:16 AM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> GCC recently added option -fmin-function-alignment, which should appear
>> in GCC 14. Unlike -falign-functions, this option causes all functions to
>> be aligned at the specified value, including the cold ones.
>>
>> Detect availability of -fmin-function-alignment and use it instead of
>> -falign-functions when present. Introduce CC_HAS_SANE_FUNCTION_ALIGNMENT
>> and make the workarounds for the broken function alignment conditional
>> on this setting.
>>
>> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
>> ---
> 
> [snip]
> 
>> index dfb963d2f862..5a6fed4ad3df 100644
>> --- a/kernel/exit.c
>> +++ b/kernel/exit.c
>> @@ -1920,7 +1920,10 @@ EXPORT_SYMBOL(thread_group_exited);
>>   *
>>   * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345#c11
>>   */
>> -__weak __function_aligned void abort(void)
>> +#ifndef CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT
>> +__function_aligned
>> +#endif
>> +__weak void abort(void)
>>  {
>>         BUG();
> 
> 
> 
> 
> 
> __function_aligned is conditionally defined in
> include/linux/compiler_types.h, and then it is
> conditionally used in kernel/exit.c
> 
> This is unreadable.
> 
> 
> 
> 
> You may want to move CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT
> to include/linux/compiler_types.h, as this is more
> aligned with what you did for __cold.
> 
> 
> 
> if !defined(CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT) && \
>                CONFIG_FUNCTION_ALIGNMENT > 0
> #define __function_aligned       __aligned(CONFIG_FUNCTION_ALIGNMENT)
> #else
> #define __function_aligned
> #endif
> 
> 
> 
> 
> 
> However, an even more elegant approach is to unify
> the two #ifdef blocks because __cold and __function_aligned
> are related to each other.
> 
> 
> 
> #if defined(CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT) || \
>                  (CONFIG_FUNCTION_ALIGNMENT == 0)
> #define __cold                 __attribute__((__cold__))
> #define __function_aligned
> #else
> #define __cold
> #define __function_aligned     __aligned(CONFIG_FUNCTION_ALIGNMENT)
> #endif

I didn't want to make __function_aligned conditional on
CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT because the macro has a fairly
general name. One could decide to mark a variable as __function_aligned
and with the above code, it would no longer produce an expected result
when -fmin-function-alignment is available.

__function_aligned was introduced c27cd083cfb9 ("Compiler attributes:
GCC cold function alignment workarounds") only for aligning the abort()
function and has not been so far used anywhere else.

If the above unification is preferred, I think it would be good to
additionally rename the macro in order to prevent the mentioned misuse,
perhaps to __force_function_alignment.

#if defined(CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT) || \
		(CONFIG_FUNCTION_ALIGNMENT == 0)
#define __cold				__attribute__((__cold__))
#define __force_function_alignment
#else
#define __cold
#define __force_function_alignment	__aligned(CONFIG_FUNCTION_ALIGNMENT)
#endif

Would this be ok?

-- 
Thanks,
Petr

