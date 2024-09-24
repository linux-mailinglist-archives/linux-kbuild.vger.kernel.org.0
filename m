Return-Path: <linux-kbuild+bounces-3698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA5983FB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 09:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21D7E282DD5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 07:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA88E7F48C;
	Tue, 24 Sep 2024 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LzGyz53U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EB61487DD
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 07:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727164370; cv=none; b=rSBYOq/knQ0Y4dDpN4NQpAIOpKxbSe4/vcHID/MUUOzSyv4vY/4tKKYg1o+lMgl47tnR+ZY9pn+U8ysTXtM+GwxhiRYJpNVSf0AM8uDuFz8Q3QUqWeZrStxAvIUPDvwmfGE7way1kPkbpofWrf0rq1mCmNeDGfoWBasmV6RasQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727164370; c=relaxed/simple;
	bh=jmxCdwBMGJfRiTBkGEvh+OIgwE2BlqH9TH/yhYHzDLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXrJoeFq3YbV/Q+PIv2HokPKSGBLHJcJu7+wyzOQmyCsGKbiCCgMJm4RM+Idolxu7QnjkQk9JnwZqFcF8WmtP4kGjV34nw3Iwu+u9V2qBMd8aiuCbnzQGpyqfIg+DBsA6P29AS2MY2Xz7Zek3Xtkw3T3cvqbb+9PcIcj8YSOil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LzGyz53U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727164367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ObXE9vIRh5fRALLQD7xR1O0F8ZoBqYvtbEm80vH4934=;
	b=LzGyz53UKSPb+EdC94/ibhEmqbmwxH/LEkQUQafNzYvEPoxKsgvARFmHynW6dVw+7IpsrH
	azuv12nk5MJJM+4rU7FADT7QUOUlrR4aRvMgV/hxvulNkDt8dGez6o2ttG2eoLs/ZpmxzF
	2rpwMk7Jmq7HFEuBxHKw9KYiC1uYpEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-pigBTcInNueqHuFk3NGdow-1; Tue, 24 Sep 2024 03:52:46 -0400
X-MC-Unique: pigBTcInNueqHuFk3NGdow-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42ac185e26cso40540085e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 00:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727164365; x=1727769165;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObXE9vIRh5fRALLQD7xR1O0F8ZoBqYvtbEm80vH4934=;
        b=nIacRQ70g2+njkGC1rtKzp6AYi6I+BE4Yrpo7MfwoVhxHh7+UGMd+Md+ZqOq9IAR/A
         BD2WX3csRASnIUfFJzZtVNUgNywJTIP3V/i/TOx41BhXdPia/9YAyWd+Pr72r1P1Kq/S
         za1bHKjYDIa/H0hTPca6gOeFOjXpGapo36oAoEaXsK0mtBsScXQnJUGO9zBsgTswZT/S
         1reSizaEl2sNCYoth4dpmFyx9pxpNQtCY8FfSfjfeMXzGLD8eOarqtxK8ZkD7Twf4xlr
         A+4RNAkLDy4O2lUUs4VVby9v+1LSGCO0Akfl5wNIvrXNqe8AXY2Xf1VINU+6lV3dok1k
         FXzg==
X-Forwarded-Encrypted: i=1; AJvYcCXTGsrQ/7EC7KZj/A5A/TOwCX+0jYzEWjZ1/89IJktcGiDH0w60v0WdykVlU6v8bIrnSKxu/17l8dYTDUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFOrZQidtsqQVWA0a8njY3rsn/KuUjWiGjSCnjCSjf0IETwHHl
	54NHg2y71ErprKOuVWB5JUUj9ALnQb44SGU+7jWQ/VyWY13RvJT+7xPXVAEvbAzvEVULpjEanyo
	ZwH7kKb2h20UGfk4gDyz1Tyc/m3aqGGi5vRRs1H5h5J0WNDqDwTaKBPLzlbGz7A==
X-Received: by 2002:a5d:47a8:0:b0:374:c6ad:a7c6 with SMTP id ffacd0b85a97d-37a431583e1mr9188492f8f.20.1727164364814;
        Tue, 24 Sep 2024 00:52:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGi61AR7ZQd735ap15hTXbAosrgZ53xoTwmw7kaKYs0un5FWhvEzu7+ZbaquyAzWoh4P/H3A==
X-Received: by 2002:a5d:47a8:0:b0:374:c6ad:a7c6 with SMTP id ffacd0b85a97d-37a431583e1mr9188471f8f.20.1727164364325;
        Tue, 24 Sep 2024 00:52:44 -0700 (PDT)
Received: from [10.202.151.204] (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8c2csm858559f8f.20.2024.09.24.00.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:52:43 -0700 (PDT)
Message-ID: <c10d3f92-e4ec-4a56-b78e-acb68865a11c@redhat.com>
Date: Tue, 24 Sep 2024 09:52:42 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Make SPLIT_PTE_PTLOCKS depend on the existence of
 NR_CPUS
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
References: <20240923142533.1197982-1-linux@roeck-us.net>
 <f15ff981-e725-40f0-8d2f-856b4b6a65b3@redhat.com>
 <4c2cdf84-9794-4722-8417-cf924f890797@roeck-us.net>
 <203f0d01-d25e-4436-b769-b89edb1b57d9@roeck-us.net>
 <CAMuHMdWfsgnCRLhCkvJBn8Prdd4M=HvwtsPT0BeRPtA-nFHzYQ@mail.gmail.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAMuHMdWfsgnCRLhCkvJBn8Prdd4M=HvwtsPT0BeRPtA-nFHzYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.09.24 09:45, Geert Uytterhoeven wrote:
> Hi Günter,
> 
> CC kbuild
> 
> I have two comments...
> 
> On Tue, Sep 24, 2024 at 1:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 9/23/24 15:08, Guenter Roeck wrote:
>>> On 9/23/24 08:23, David Hildenbrand wrote:
>>>> On 23.09.24 16:25, Guenter Roeck wrote:
>>>>> SPLIT_PTE_PTLOCKS already depends on "NR_CPUS >= 4", but that evaluates
>>>>> to true if there is no NR_CPUS configuration option (such as for m68k).
>>>>> This results in CONFIG_SPLIT_PTE_PTLOCKS=y for mac_defconfig.
>>>>> This in turn causes the m68k "q800" machine to crash in qemu.
> 
> Should this be fixed in Kconfig (too)?
> 
>>>> Oh, that's why my compile tests still worked ... I even removed the additional NR_CPUS check, assuming it's not required ...
>>>>
>>>> Thanks for debugging and fixing!
>>>>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>>
>>>
>>> Apparently it wasn't that simple :-(. 0-day reports a build failure
>>> with s390 builds.
>>>
>>> arch/s390/mm/gmap.c:357:16: error: implicit declaration of function 'pmd_pgtable_page'.
>>>
>>> Turns out that
>>>       depends on NR_CPUS && NR_CPUS >= 4
>>>
>>> doesn't work and disables SPLIT_PTE_PTLOCKS even if NR_CPUS _is_ defined.
>>> I have no idea how to declare the dependency correctly.
>>> Sorry, I did not expect that.
>>
>> The only solution I found was to define NR_CPUS for m68k. That seems to be
>> the only architecture not defining it, so hopefully that is an acceptable
>> solution. I'll send v2 of the patch shortly.
> 
> My first thought was to agree, as m68k is indeed the only architecture
> that does not define NR_CPUS. Upon closer look, most architectures
> have NR_CPUS depend on SMP, hence I assume the issue could happen for
> those too (although I didn't manage to create such a config on anything

I recall that I played the same thing, convincing me that having no
CONFIG_NR_CPUS on !SMP would actually do the right thing. Apparently it doesn't
for m68k at least.

> but m68k)?  So the simple solution would be to add a dependency on
> SMP to SPLIT_PTE_PTLOCKS.

That will probably work for now. CONFIG_NR_CPUS should be cleaned up at some point
to sort out the FIXME I commented in v2. Having kconfig set CONFIG_NR_CPUS=1 without
SMP would be easiest, but it's probably not that easy.

> 
> BTW, the list of excluded architectures looks fragile to me:
> 
>      config SPLIT_PTE_PTLOCKS
>              def_bool y
>              depends on MMU
>              depends on NR_CPUS >= 4
>              depends on !ARM || CPU_CACHE_VIPT
>              depends on !PARISC || PA20
>              depends on !SPARC32
> 
> If this can't be handled in a generic way, perhaps this should be
> changed from opt-out to opt-in (i.e. select gate symbol in arch-specific
> Kconfig)?

Yes, as stated in my commit:

     More cleanups would be reasonable (like the arch-specific "depends on" for
     CONFIG_SPLIT_PTE_PTLOCKS), but we'll leave that for another day.

-- 
Cheers,

David / dhildenb


