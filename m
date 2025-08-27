Return-Path: <linux-kbuild+bounces-8623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E4B37635
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 02:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63BCD3BE0E9
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 00:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCFB1C5499;
	Wed, 27 Aug 2025 00:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="c+ONQrpC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3BB1AE877
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Aug 2025 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756255583; cv=none; b=lIHRiHfbTAfGOeMhBv/gCkhLckDAbxvWgRG7Oa/vGqXS9ejHK6KNakIybD0tttBoBiuZhP9jo+2NiE+r9k2m4ZupMDutQC5PeQZ9HOYjZELxyPLkgcDulDpdpvAhHQTQUU7CEQh4OXjKEZGmctxzoTv64Ib9WD1NABN5WSoOBVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756255583; c=relaxed/simple;
	bh=H+kkfzVW4fOfE6BunEcIw/4uno8zsE2Jauu4d0HhpAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1t4obXXkNBvXJMMIfUVPxuwHO8/aptLqtaBUGZtHF0zQ1x+nWo4egjkt8RsW60ZytX43x5FupBMP0s7LMA4RCdnU6gushY1GFR1TdkKwXFvcJpW7xjIqkkUkfPeiSsr8pP5vmOYficluRL4VtzXQOWf65+7QOlZ0Df53b2wZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=c+ONQrpC; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-88432e362bfso85636539f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Aug 2025 17:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756255581; x=1756860381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=;
        b=c+ONQrpC/gFcMpFrWP6VtrlBKlcf6RfnQxWmrEr8ckXSDyYBJK+GrnN3wCCgIHhGAB
         SzTW4SKnr1jq/6J5fjdlj+48sJYThTL3F1sVT2LGjwyZMlBI36kdtMgciYoz/6iOXXAF
         ucunwLN1tUTq/IwcBu63HPH5v+97JeehyqaME29rMsIk0iZ6hTSA23POTVOyvfpAmXwZ
         B97FaBEzwDfwW2Th7uhD0XJcKlk/Pvd1NHRNEtbpCzJPYLq/nekY+gOFw/Qf6iG2d57A
         qd+vsnj8NZqXhqgu1ZPaQybpuyPHoUmG1kJ+gFb/RgG7XEUytrQ8hREZw2PYf75KFT/v
         tozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756255581; x=1756860381;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=;
        b=vM0h0JVWeUqzx83tk4IVIhLf52TQWZdeF5hRHu1ppNEgbPJnj1mW4VxWeDK/4os7RI
         to9XS6ApuWnbQv986iuejupLoNUpXBiy3uR2rUydklNbny07ifc0DdnIbDsQ4HoG/rY9
         3NSQvaos1MedCLOaRDlEbdEbO5Y88dzuv+XV4uMBYzp9NIthiaEGcbn/0AjLcShE11Uc
         uwC04uLQbUSYe/lOYFRuFVghNYutOD6gQDv/MzNomNOxItOSe5RnTe4ywmLx/z0QSnNK
         VzIK+//klpQ06f+GTbe+iuJP5BjsVp5wwRIVHOIFLz/AWPji3MNC/bXClVfD8HarAvUe
         t1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi2/nUd8KJ4ztlxi7GkEmpmMIGZ3/fX8M3CQzLAAZs6JDQkQPoaHKPxpVE/b6yPigSV34t55VtXScFQbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyND5HPD1BkOyK1FVNep4WGpQqHBe4e4w7qzq3TQaVmEr96ELLQ
	ZfX9KMdEP7UZ/BGLJR/nUzsg31R7Z1YsKsST7E9XEfzeqg/5iNC5oGMD7NvZ6T3n06A=
X-Gm-Gg: ASbGncsRIlCBbjA0Quwx1+3/2XRqE2/bsIFX4HVnJWtRS+nNm4o+vsrW5UVIuIua+QE
	xdqn839sr8Bwfyl2XAy0J/x6RRsrhX7eLNS88f4xVYDfzYPE1PlPY9O66mMF49ERM0/USfmQe0K
	nd6D6zisLSgk7XlPXFJ4csIpIsfdFHkXbVYIhl/ZcfKI29XdqOez845qQVXMw62H5E5P6RhZFcJ
	1cql+lfOKys3oLTd/8c6o4v3rO9C4I6iPQ6ZXzzURtVGXc+YVEEOVCnodOjPmnxAwXkUfadvl5P
	lwYbH6AYiHAqoJxfu/a6B4fvWgoBKIzjjAnzGXurs1ej3UkGJXjuCpXw6Wz2RFonv6tpmfYjeSN
	N8dg4HEBkxfmiEbETgVXUwEWaVn1qq8ZP7dD8Wg==
X-Google-Smtp-Source: AGHT+IGfh2W97xdVpFCgiQyq3Pb9/ifBsTlwqyh1OAHr3R34PnfYQnj+aQ8bMShNsAl8EpMrNrhaMQ==
X-Received: by 2002:a05:6e02:1b0c:b0:3ef:1b56:c8ea with SMTP id e9e14a558f8ab-3ef1b56c9f9mr43866025ab.11.1756255580619;
        Tue, 26 Aug 2025 17:46:20 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ef2ff2dd60sm14606295ab.9.2025.08.26.17.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 17:46:20 -0700 (PDT)
Message-ID: <2e9ee035-9a1d-4a7b-b380-6ea1985eb7be@sifive.com>
Date: Tue, 26 Aug 2025 19:46:19 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
 <c68330de-c076-45be-beac-147286f2b628@intel.com>
 <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maciej,

On 2025-08-26 3:08 AM, Maciej Wieczor-Retman wrote:
> On 2025-08-25 at 14:36:35 -0700, Dave Hansen wrote:
>> On 8/25/25 13:24, Maciej Wieczor-Retman wrote:
>>> +/*
>>> + * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
>>> + */
>>> +#ifdef CONFIG_KASAN_SW_TAGS
>>> +static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>> +{
>>> +	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
>>> +}
>>> +#else
>>>  static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>>  {
>>>  	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
>>>  }
>>> +#endif
>>
>> This is the kind of thing that's bound to break. Could we distill it
>> down to something simpler, perhaps?
>>
>> In the end, the canonical enforcement mask is the thing that's changing.
>> So perhaps it should be all common code except for the mask definition:
>>
>> #ifdef CONFIG_KASAN_SW_TAGS
>> #define CANONICAL_MASK(vaddr_bits) (BIT_ULL(63) | BIT_ULL(vaddr_bits-1))
>> #else
>> #define CANONICAL_MASK(vaddr_bits) GENMASK_UL(63, vaddr_bits)
>> #endif
>>
>> (modulo off-by-one bugs ;)
>>
>> Then the canonical check itself becomes something like:
>>
>> 	unsigned long cmask = CANONICAL_MASK(vaddr_bits);
>> 	return (vaddr & mask) == mask;
>>
>> That, to me, is the most straightforward way to do it.
> 
> Thanks, I'll try something like this. I will also have to investigate what
> Samuel brought up that KVM possibly wants to pass user addresses to this
> function as well.
> 
>>
>> I don't see it addressed in the cover letter, but what happens when a
>> CONFIG_KASAN_SW_TAGS=y kernel is booted on non-LAM hardware?
> 
> That's a good point, I need to add it to the cover letter. On non-LAM hardware
> the kernel just doesn't boot. Disabling KASAN in runtime on unsupported hardware
> isn't that difficult in outline mode, but I'm not sure it can work in inline
> mode (where checks into shadow memory are just pasted into code by the
> compiler).

On RISC-V at least, I was able to run inline mode with missing hardware support.
The shadow memory is still allocated, so the inline tag checks do not fault. And
with a patch to make kasan_enabled() return false[1], all pointers remain
canonical (they match the MatchAllTag), so the inline tag checks all succeed.

[1]:
https://lore.kernel.org/linux-riscv/20241022015913.3524425-3-samuel.holland@sifive.com/

Regards,
Samuel

> Since for now there is no compiler support for the inline mode anyway, I'll try to
> disable KASAN on non-LAM hardware in runtime.
> 


