Return-Path: <linux-kbuild+bounces-7149-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982EABC7AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 May 2025 21:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DD1A7A3FAA
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 May 2025 19:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDF279FE;
	Mon, 19 May 2025 19:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oySq7fz1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86FA20E700
	for <linux-kbuild@vger.kernel.org>; Mon, 19 May 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747682371; cv=none; b=Huyy/lPtuVf/i8ItFqmivAtmu3sUSoBxShCLmhKQBc766ZdIVMfl7XUc1y/JIzgFMBQDIQ5raGFmCBDf4xtI16RHpRzGpVztX52AdvH/m60lUEeTtq5aFLnpgUfBd5W+5k2hWjNBxVsQ1EVVehbLiPT6Rvs1ocuRQz7/9HGvwXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747682371; c=relaxed/simple;
	bh=hqGVACYICyhYbUsEavZ2fotAVSVDAVizoXkfdIKl3eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2Dh+ihtgMjJcbLxWoj2Hs22dI3CEmzoHhiJhc1O08PEN2EYOdWzsvWTzV4Jiq8jk4PM+xkLpkxJ20kdNj7alx4E0R2Y0BifQZfV71diR3mFqQsyWkWY1G/3DpDBrrkPcGyyY5uewnpXvf2SGpm+NlhQk7XNA1UptUNQYza0tw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oySq7fz1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Jb1jpP7JqUA9AJMqCEE3mWhTB62xW6cuMLNB/LLlwH0=; b=oySq7fz11DssZBz+BXpRzkKZ1+
	r+/zDkS8NEklJpiiwN9mrjPiPFFAEv3ZAeDtiqh3NyWRSbjgvueeUZwAYm2U0WHQPfzcEMEttLhUJ
	nHreaUVam8iA2+TLkmuO0XFOPb8Vb1os63l798QoGXpGx5y0V0SDT5xWfkg91SzWg8K7wOuFALu2k
	uRkEPgQKEEzkBJ4ZfHxBAbT5d3sfJcchXm73SU32w/MM37ZjHI4vMgdCh+hIQWstCb7LQuM+pt/Y8
	Y6IrpPaCVoMUT6xKXi6pClGDD3ZTXRfw2uZcWhgWU4aQv2SuIRwtqbfDo5d9flvCpCeuCiIflJwmK
	yMsaIFUQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH617-00000002FmW-2tKG;
	Mon, 19 May 2025 19:19:17 +0000
Message-ID: <04edc215-c75a-48d4-906b-a9412c3dec52@infradead.org>
Date: Mon, 19 May 2025 12:19:07 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig for range is being ignored
To: Vlastimil Babka <vbabka@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>,
 Juan Yescas <jyescas@google.com>
Cc: linux-kbuild@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Kalesh Singh
 <kaleshsingh@google.com>, Isaac Manjarres <isaacmanjarres@google.com>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
 <592eafcc-6460-4461-bab7-3c709e13d3c0@suse.cz>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <592eafcc-6460-4461-bab7-3c709e13d3c0@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/19/25 12:01 AM, Vlastimil Babka wrote:
> On 5/17/25 08:45, Masahiro Yamada wrote:
>> On Wed, May 14, 2025 at 5:18 AM Juan Yescas <jyescas@google.com> wrote:
>>>
>>> Hi Kbuild team,
>>>
>>> In the patch from below, I am adding a new configuration that depends
>>> on ARCH_FORCE_MAX_ORDER.
>>>
>>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
>>>
>>> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER has
>>> to be ARCH_FORCE_MAX_ORDER.
>>>
>>> mm/Kconfig
>>>
>>> config ARCH_FORCE_MAX_ORDER
>>>       int
>>> config PAGE_BLOCK_ORDER
>>>        int "Page Block Order"
>>>        range 1 10 if !ARCH_FORCE_MAX_ORDER
>>>        default 10 if !ARCH_FORCE_MAX_ORDER
>>
>>
>> The logical calculations such as "!", "if"
>> are allowed for bool and tristate types.
>>
>> Here, ARCH_FORCE_MAX_ORDER is "int".
>>
>> So, I do not understand what
>> "!ARCH_FORCE_MAX_ORDER" is intended for.
> 
> A kernel developer used to program in C can easily assume hat it means
> "== 0" :)
> 
>> You are doing what is not supposed to work.
> 
> It would be great, if kconfig either behaved like C here ("cast" int to
> bool), or warn/error out. Silently treating such tests as false isn't great
> IMHO. Wonder how many other buggy instances we have now. At least

Exactly. I would prefer to make it a warning/error and not change the kconfig
language.

> ARCH_MMAP_RND_BITS_DEFAULT handling is also broken then, as Juan has shown.
> 

Thanks.

-- 
~Randy


