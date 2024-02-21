Return-Path: <linux-kbuild+bounces-1014-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA7985D87F
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 13:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D106E1F231EB
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 12:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86D93EA71;
	Wed, 21 Feb 2024 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NG9f1erN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC553816
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520313; cv=none; b=NWnv2+ldPmTTnpsI7FheLK2baQGNL7xaBaVUmnrK9ozhxv/oVtxG9pdvcd2r3V3fyetxjKxsBHP4Erh1K+kR19RZGkC2M5YrjBQIXEPiXRN0XpqPmiehfLFMBWZD+hnnlewpmtx3lccg8QYc1NNGhG3RoL/b/y/8sRj7jr0P7ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520313; c=relaxed/simple;
	bh=WJ9A5QtoMXxG0k+fxj+jIbEyTRni/+mSHqJYY4sHdLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSID3tC6Bxkrzhydgd929NbaECsJFVo/tQhK2U+h2edAYUCZmVrcgPOcifyKPq+q85lhbDum2lx1mJCnSh1GJJoDJ8xF5mgviPvvbfjR+95kk0m8v5geW/EFCFz3siCsFJEMZ2cZzuSkYOMJg3ggwqhoOdTHwvqVTmS9Tq9N8vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NG9f1erN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-563c595f968so917278a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708520310; x=1709125110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNLht0D2TbPYN2mcKtnYK8Nmtvs6+Js0QliA4/Y92SU=;
        b=NG9f1erNyd9aKO97flS5D51wZYCDq++5H1OX+9At/v08kOeldXwpjXfJdMp+E5F1VE
         LNcGT2XQnIS+kxxapKl+p6KCWRhhdONsFIXFb2b19xagTboP0Xbo4/1XU/OKOAoX7l0a
         jhtBH2aSiarr78W6EDEbISPHcqt1TagGFzEylHp2up0ksOgasgKsyyPw396HjZj4We8z
         KwCnUOdbRrH6qMR+sPeW+uO7QpElH7VX7PgLI17yaHAl9aoMwzUfjcw5UwVV3+HFS9iP
         EOgwXETxyla8Lfop7BOIv51X6WerkrNut3K9UdKaTjadfELGviKbJBQCCCoMt6ugwVQY
         eCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708520310; x=1709125110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HNLht0D2TbPYN2mcKtnYK8Nmtvs6+Js0QliA4/Y92SU=;
        b=B7wvimpoYl/jDloBPWqw09EWvrXSSA3J6lFB5ovzLriu7YWEUD2m95pqrFvjyD3ihQ
         M1H5D4yyGIm6RTKx4c1gF4d9LY4tAsNbpBNaSYVkE68D0XhbZV3nvU5qYlwnCR5LWne+
         QKUxFNUYYxQjTy+P5S467YnznrNUkfwkq0xBFz8KFUArwh18ykDDiLosO7poLus5DTtL
         /6tXA/JKfMB5Asg11QeTlTDeORIkT1iK2tozhQ2Vf7msEpdW4/wCkhFaAKMDzZWi6JPG
         V6ydDSmekKdQbgjG6wbRNrIJfs2H/ksGggOLz30bpi/md2DVNsjxS0ZCzwUlLhsbCSe/
         0MAA==
X-Forwarded-Encrypted: i=1; AJvYcCXn4k0Z6Lu/LFos4vGTNiJY23Wk6sakSebjc9DP4bDt3SHU1h6TZJYS3+K+ypplmzneHXRd/WhDQOU7IWeTb13Il5GNUH7X43Ef5m+Q
X-Gm-Message-State: AOJu0YyR9vWfUY5zF54LxEP8lfdjQ3i0arEFobfBHoABUs3jfVm4ZMPg
	GML/C/09wGHkYFTWqzbqq4UzeuLOzFXPsm6OLx5Kr0kycBAcoq3GgLuCwuwRsc8=
X-Google-Smtp-Source: AGHT+IHsdQvbQf66PYO62tOyicG1JiGwnIE2tFKrFnJ8dAQKoT+QzuBkQh/Kh1YfcIUx1W84ydIA1w==
X-Received: by 2002:a05:6402:b38:b0:564:aa2c:a6e0 with SMTP id bo24-20020a0564020b3800b00564aa2ca6e0mr4438161edb.4.1708520309832;
        Wed, 21 Feb 2024 04:58:29 -0800 (PST)
Received: from [10.100.51.161] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id f21-20020a056402195500b0056413012fa8sm4521392edz.62.2024.02.21.04.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 04:58:29 -0800 (PST)
Message-ID: <5f372b1f-3f3e-4b44-bc21-95dd154bd61a@suse.com>
Date: Wed, 21 Feb 2024 13:58:28 +0100
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
 <9b067ec7-34e2-437b-a41b-319aaee4c7e6@suse.com>
 <CAK7LNAQ=iz8iY_VXmzGuU+7YPnaExm769k1BqCpSYvqSfRr=Fg@mail.gmail.com>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAK7LNAQ=iz8iY_VXmzGuU+7YPnaExm769k1BqCpSYvqSfRr=Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/21/24 12:38, Masahiro Yamada wrote:
> On Wed, Feb 21, 2024 at 7:38 PM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> On 2/20/24 14:39, Masahiro Yamada wrote:
>>> On Fri, Feb 16, 2024 at 12:16 AM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>>>
>>>> GCC recently added option -fmin-function-alignment, which should appear
>>>> in GCC 14. Unlike -falign-functions, this option causes all functions to
>>>> be aligned at the specified value, including the cold ones.
>>>>
>>>> Detect availability of -fmin-function-alignment and use it instead of
>>>> -falign-functions when present. Introduce CC_HAS_SANE_FUNCTION_ALIGNMENT
>>>> and make the workarounds for the broken function alignment conditional
>>>> on this setting.
>>>>
>>>> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
>>>> ---
>>>
>>> [snip]
>>>
>>>> index dfb963d2f862..5a6fed4ad3df 100644
>>>> --- a/kernel/exit.c
>>>> +++ b/kernel/exit.c
>>>> @@ -1920,7 +1920,10 @@ EXPORT_SYMBOL(thread_group_exited);
>>>>   *
>>>>   * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345#c11
>>>>   */
>>>> -__weak __function_aligned void abort(void)
>>>> +#ifndef CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT
>>>> +__function_aligned
>>>> +#endif
>>>> +__weak void abort(void)
>>>>  {
>>>>         BUG();
>>>
>>>
>>>
>>>
>>>
>>> __function_aligned is conditionally defined in
>>> include/linux/compiler_types.h, and then it is
>>> conditionally used in kernel/exit.c
>>>
>>> This is unreadable.
>>>
>>>
>>>
>>>
>>> You may want to move CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT
>>> to include/linux/compiler_types.h, as this is more
>>> aligned with what you did for __cold.
>>>
>>>
>>>
>>> if !defined(CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT) && \
>>>                CONFIG_FUNCTION_ALIGNMENT > 0
>>> #define __function_aligned       __aligned(CONFIG_FUNCTION_ALIGNMENT)
>>> #else
>>> #define __function_aligned
>>> #endif
>>>
>>>
>>>
>>>
>>>
>>> However, an even more elegant approach is to unify
>>> the two #ifdef blocks because __cold and __function_aligned
>>> are related to each other.
>>>
>>>
>>>
>>> #if defined(CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT) || \
>>>                  (CONFIG_FUNCTION_ALIGNMENT == 0)
>>> #define __cold                 __attribute__((__cold__))
>>> #define __function_aligned
>>> #else
>>> #define __cold
>>> #define __function_aligned     __aligned(CONFIG_FUNCTION_ALIGNMENT)
>>> #endif
>>
>> I didn't want to make __function_aligned conditional on
>> CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT because the macro has a fairly
>> general name. One could decide to mark a variable as __function_aligned
>> and with the above code, it would no longer produce an expected result
>> when -fmin-function-alignment is available.
>>
>> __function_aligned was introduced c27cd083cfb9 ("Compiler attributes:
>> GCC cold function alignment workarounds") only for aligning the abort()
>> function and has not been so far used anywhere else.
>>
>> If the above unification is preferred, I think it would be good to
>> additionally rename the macro in order to prevent the mentioned misuse,
>> perhaps to __force_function_alignment.
>>
>> #if defined(CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT) || \
>>                 (CONFIG_FUNCTION_ALIGNMENT == 0)
>> #define __cold                          __attribute__((__cold__))
>> #define __force_function_alignment
>> #else
>> #define __cold
>> #define __force_function_alignment      __aligned(CONFIG_FUNCTION_ALIGNMENT)
>> #endif
>>
>> Would this be ok?
> 
> 
> 
> 
> 
> Or, you can always add __function_aligned to abort()
> whether CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT is y or n.
> 
> 
> I think you did not need to modify kernel/exit.c

Ah, that looks as the simplest option, thanks.

-- Petr

