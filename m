Return-Path: <linux-kbuild+bounces-3700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A62ED984775
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 16:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247821F266AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 14:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4597E1A706F;
	Tue, 24 Sep 2024 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dm+P8U3Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05F13342F;
	Tue, 24 Sep 2024 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187387; cv=none; b=CcOPPIJzIN/TEHKN5MPFFppL9WwGUbLIfCsv/ou6V++qNIX4RjkkoFuLJfSu+Aic5QrpiyAfgec5cpJb81aOpWICLeRBfl9gurQyOFx8gl1dB7mmiC0fjsO3f6hrghhJ+54BkWCKlDsTjmo5JLUplwEiFITHYKyl1I3InOAjjfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187387; c=relaxed/simple;
	bh=+gUBpIrb2T1hUf3TsCKqyC6OOOcVQGFGOFFDC51kVGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdXcGhAy1aUKTpYD8QDSDGDGR2NvqdnQ7D3XserDwOXMyYp+l71OX/HOwG7tU9C8nSalkIJ+GiodMW3Cnu0dDjwhTVbpyg/g+MAdEsLAVbDQ6IcbzViqF0s6uZDBs0ieDZnL/OT049dg81MBfWzVGzy+CKdKxAG2OXwVidSapyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dm+P8U3Y; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7cf5e179b68so4607088a12.1;
        Tue, 24 Sep 2024 07:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727187385; x=1727792185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1GgB+hTZpTml0qKRANWfPlHVjU+0Wqbyo4s8XQzdZho=;
        b=dm+P8U3YmOEsfk7v/y4tr2uiCjoNfvUSL3p8VHXp1wwJ5+khg+mEUcUszrYPylwmgU
         PiIbdm/s8/bsmYTyQ/uEdjPGLoQo8cq5wo04mwckadeI3gb6qpGjRxCPfA6FnS58madU
         onsxggKqu2PSI+TmzizgcCRhLxFST6Kn4CDBfOr/wgJ1BxozuPb2hCSPIRZ1goItIL+f
         IC//5QIEiOCragmhzUR/HmS79TKZlbDTvHLGldXCS599Mt99gK4pV+1uB6C8kOjTrRRo
         mKdANqsHeGETp6ouF0m72rjQKBWFlaJLxteNIdTCjJSsDu+XLTcX2U/jeJRMd4PG58bd
         dC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187385; x=1727792185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GgB+hTZpTml0qKRANWfPlHVjU+0Wqbyo4s8XQzdZho=;
        b=F6dS9Tfx9dqBcEiEcRdh4oYaWiHUtqsMqajPiVMwU0KDuMDeKL9xGRh+Zz4WkDkUYY
         iTPCu7bhzudlAaEVQaOJdja1ixAe8twR0j/1ms7jpc3ICB6bq5bpvB6fXF0AiVtJyv6U
         EE52GuN75933Wpz09abo6PK62UC64/cxxswtVJXcEn1nMmfHKHHN4NPB2Zwrl+nUDH0q
         juZDW45od9ftmbcYjiEBLTvssIR2gnt7/IMzzfsRqg1lRiw6BQvGe3LZU04kBMA726yM
         gZzBFPqwFXiOU+n+N5qrHTRzN6oXQfc3TIQWBV/5Ovv1eXg5+VG3rIHh28Pu7HxDNFDw
         tjRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJOC2uEzo232d/k/qSo2AXKR0VibY96h/LVpp+DUN/s2Z8ex9T5C5yahINpyeMWt2QwpoAAzqU4XeA62D+@vger.kernel.org, AJvYcCViDur7RGJYrOgIRS9eUmrKjE74KfaRoRmXZM0nRe4paBEFRkUR5i3bP7MPHmLJ9BhnDIQ95SOVdHNV5aY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/+XY+llS7dhfb37cyq6Mv9HDRFcaYiIhyfRwVyQyoWcCfpnh
	/96hhkT4gUTkhf/rt1CZwgxPy5b55xu+sKluN1IWt+fcQQYkCKyqFSL0wg==
X-Google-Smtp-Source: AGHT+IGq1CKWT/TJzAVM3mHN2JVIpOfn5RlMWqMypCAOXz7pPMKpwFQ5Hpr7sz8VVE1ZSn5aa2aKpw==
X-Received: by 2002:a05:6300:668b:b0:1d2:e793:cc0 with SMTP id adf61e73a8af0-1d343c19cbdmr5082360637.7.1727187384932;
        Tue, 24 Sep 2024 07:16:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc835402sm1251416b3a.44.2024.09.24.07.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 07:16:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a5095b37-ab61-4789-973a-aee3a748fe12@roeck-us.net>
Date: Tue, 24 Sep 2024 07:16:22 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Make SPLIT_PTE_PTLOCKS depend on the existence of
 NR_CPUS
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
References: <20240923142533.1197982-1-linux@roeck-us.net>
 <f15ff981-e725-40f0-8d2f-856b4b6a65b3@redhat.com>
 <4c2cdf84-9794-4722-8417-cf924f890797@roeck-us.net>
 <203f0d01-d25e-4436-b769-b89edb1b57d9@roeck-us.net>
 <CAMuHMdWfsgnCRLhCkvJBn8Prdd4M=HvwtsPT0BeRPtA-nFHzYQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAMuHMdWfsgnCRLhCkvJBn8Prdd4M=HvwtsPT0BeRPtA-nFHzYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/24 00:45, Geert Uytterhoeven wrote:
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

I don't know. I thought that was intentional, though I don't understand
the logic. I didn't find a documentation that would explain how boolean
dependencies of integer objects are supposed to be handled. My expectation
that it would be similar to C was obviously wrong.

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
> but m68k)?  So the simple solution would be to add a dependency on
> SMP to SPLIT_PTE_PTLOCKS.
> 
Makes sense. I'll send v3.

Guenter


