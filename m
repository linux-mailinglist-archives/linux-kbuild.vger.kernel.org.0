Return-Path: <linux-kbuild+bounces-7129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2650AB9E64
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 May 2025 16:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61BB01633CA
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 May 2025 14:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C51D3209;
	Fri, 16 May 2025 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ROgaBDj2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECE013B280
	for <linux-kbuild@vger.kernel.org>; Fri, 16 May 2025 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404884; cv=none; b=r0mflrwPzyX0HpNbDngJ9k/2v0FLcvqpZ5yI1SP1BwwuBIS1kS61GYiuo5CclyQ+XV2nOiy7YLit3VLiywI9nFexZsLh3ium0G678IG7zj8SKVb4ZtQzfO705A52fpw2uE66Bef/WZaDoBfCD8atl4H42ILWpy0rFwzhBIi+SO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404884; c=relaxed/simple;
	bh=MkChdoHojtunJdxud60z/ppWvc1d+lJBggVDQIsRmpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpaJTw8/d/TehqANJCUCf0u0fx3l1nBn9mKgVf6DI9AM8zSA8p9UxadEqjIuy/ExeJ39HPq74l0+4cKG8ftzj5OLJ7OThLVD8d17Y1eMSm41wikmarNiIDqtD2kuIgZ6A8UjND+ptVEVDRH6eVNy5CXBk4oRBJYjSGGrMJ6gAE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ROgaBDj2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747404880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fWeMDNVz35EuoIhZ51im3Y1FpVsyjNd+TU98aGM7pP8=;
	b=ROgaBDj2KsyaVv8tb8U78QbjSqPbNdlMkKHXKpFd4wmSQllA885yrfZNg6bJw6vZ8VlZIW
	nE13J8dBQAjNOb0Xa7ckRMHQmBh8bC1NBub8eR+7rQrd3n+TiIBKI+AeX53MMc/mVurdqx
	jVdfTSPpwov23iDZty3utmut8aT2ANo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-KJ6ZfFEfMtKETAwbdrLXFQ-1; Fri, 16 May 2025 10:14:39 -0400
X-MC-Unique: KJ6ZfFEfMtKETAwbdrLXFQ-1
X-Mimecast-MFC-AGG-ID: KJ6ZfFEfMtKETAwbdrLXFQ_1747404878
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so16245155e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 May 2025 07:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404878; x=1748009678;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fWeMDNVz35EuoIhZ51im3Y1FpVsyjNd+TU98aGM7pP8=;
        b=wl30DWyg7wPAfLB6VOtHXrcjMEuINcr1gXF3lhsVGR15qv/D4FPeSPdet2bCaAWuw5
         x6EmdENhtx6YkhOR9YLr81713AGWLo2Lu8sgfM79Gkt7AGQHnZpYHGBSuyj98UxT4tQ1
         y6DDqAFvveqa3SbkcHfKEpEegttXALQJXCv/OTfahx4jcte5t74/u8B5VcdIWC33apVh
         nzQ00cRWOVMwprIQ6B+pYdSqit38bprI40dWca2BhnK1BkNN+06HC5MSTXk+vrrJguuf
         2cKut+PzthFG4oknFmFVkvhEhBWYyhmRftfeQ61TFJ4bG0CIyQUw9o2NO7IEejJvuuYP
         4Hsg==
X-Forwarded-Encrypted: i=1; AJvYcCX5I46niijHFpvR4Pn6829Nn2OiLBmHMzPHJc3jUbZ99hNv44G5i4VESBwpER5dQ6KCqsIv6++/q797Cgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdlaYOsqW8oLeYMDhvna2uNp3pESYLuJDYWMRJQxf1JurFrDI+
	+OkPGqHMU0y0532emWAaLiGw34Y2fx9L36ozhce/ym+1O0VgopnYG14RbI1F2ViFz7hG9JtoCmC
	ixVACUG3m07OC6yMqdPh8tUWovKlafFKlPKQUtKh1/f+tsja0/7knD8tlsJJcuVE73Q==
X-Gm-Gg: ASbGnct26P+rJgxMdEOTEQz/JsefTTLRJ+vJ6KGvYT0XCa+HfDsCwqpw1EYxR9kVEbv
	Z+E1ytwAHbEd4JAMOYGGBbiHDWmjKNI/yn8ccr6Xo3cGX4EnjojwRlk8LOgQIJ5jghXPhDwBOa2
	4GwBOLcueIDrbh6Z9ZXy+hsG0YHo5K3ua3iq38Td7CAGX9I+NQQ/uu1EYzCDNNQckDjEXWic12j
	MkkUksiQl6k7R+T68RpFNRXdSQ7V2s5ku1WxjE0wdbIgYhu2d6uhsAKHXzhHAYCdAFp6vF9tArd
	3lcrT44+K+nyeCecLxy9e9FmC1xEAbeb9rYKHgTbBAbV1OY8bnj4ojgAQkOzdv/gy5M2FdD7V4H
	YpA6j7xysRTEXRJgtPQk9RsKuyhkEe+PtLSH1Uk0=
X-Received: by 2002:a05:600c:548f:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-442fd664a5fmr24474585e9.23.1747404878058;
        Fri, 16 May 2025 07:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXyCur2ghf/+EFU/zMg4Bv3ZRGX3cgAV1Ct4bEDhF9NaDVa0VCJnHHMmMPWAHe+3F4f6NZmg==
X-Received: by 2002:a05:600c:548f:b0:43d:82c:2b23 with SMTP id 5b1f17b1804b1-442fd664a5fmr24474085e9.23.1747404877597;
        Fri, 16 May 2025 07:14:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef811sm103031725e9.35.2025.05.16.07.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:14:37 -0700 (PDT)
Message-ID: <f7bb4ac6-af9e-4388-b672-6364f77b975d@redhat.com>
Date: Fri, 16 May 2025 16:14:35 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig for range is being ignored
To: Vlastimil Babka <vbabka@suse.cz>, Juan Yescas <jyescas@google.com>,
 linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Kalesh Singh
 <kaleshsingh@google.com>, Isaac Manjarres <isaacmanjarres@google.com>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <e6f335a4-c981-4bb1-8ea4-70e9efc56ae3@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e6f335a4-c981-4bb1-8ea4-70e9efc56ae3@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.05.25 15:10, Vlastimil Babka wrote:
> On 5/13/25 22:17, Juan Yescas wrote:
>> Hi Kbuild team,
>>
>> In the patch from below, I am adding a new configuration that depends
>> on ARCH_FORCE_MAX_ORDER.
>>
>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
>>
>> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER has
>> to be ARCH_FORCE_MAX_ORDER.
>>
>> mm/Kconfig
>>
>> config ARCH_FORCE_MAX_ORDER
>>        int
>> config PAGE_BLOCK_ORDER
>>         int "Page Block Order"
>>         range 1 10 if !ARCH_FORCE_MAX_ORDER
>>         default 10 if !ARCH_FORCE_MAX_ORDER
>>         range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>>         default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>>
>> This configuration works on ARM64, however, on powerpc, the restriction is
>> not being respected.
>>
>> The main difference that I see between arch/arm64/Kconfig and
>> arch/powerpc/Kconfig
>> is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig
>>
>> https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1637
>> config ARCH_FORCE_MAX_ORDER
>> int
>> default "13" if ARM64_64K_PAGES
>> default "11" if ARM64_16K_PAGES
>> default "10"
> 
> I've changed this default "10" to default "8" and
> 
>> ARCH=arm64 make allmodconfig
>> grep ORDER .config
> CONFIG_ARCH_FORCE_MAX_ORDER=8
> CONFIG_PAGE_BLOCK_ORDER=10
> 
> So I'd say it has the same issue as powerpc, just not obvious due to the
> different default.
> 
> Poking a bit I found this interesting bit in arch/Kconfig:
> 
> # Note: arch/$(SRCARCH)/Kconfig needs to be included first so that it can
> # override the default values in this file.
> #
> source "arch/$(SRCARCH)/Kconfig"
> 
> Thus I've tried to move the whole config PAGE_BLOCK_ORDER thing from
> mm/Kconfig to arch/Kconfig. But to my surprise it didn't change anything.
> 
> AFAICS "config ARCH_MMAP_RND_BITS" is doing very similar stuff than we're
> trying with "config PAGE_BLOCK_ORDER" but it seems to work? I'm puzzled.

I have a faint recollection that tests for "!" and numerical values
has some weird corner cases. I skimmed the docs but didn't immediately 
spot what I was looking for :(

... or was it, that testing for a config option that is not
define has weird semantics? But that wouldn't explain what we see here ...

Let me do some more digging.

-- 
Cheers,

David / dhildenb


