Return-Path: <linux-kbuild+bounces-7942-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1473EAFD9F0
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 23:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23FE03A66DA
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 21:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF991E2614;
	Tue,  8 Jul 2025 21:30:52 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCB21799F;
	Tue,  8 Jul 2025 21:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752010252; cv=none; b=CzQ29M7/lVh2hv3MSgbNtvmogg0yTrVdiBf00rUu0dYMAdtsfZGY34BJ8dGd/SpTKNgr81uLeDrrxQ6nqVm09PNxbgAUNiPJANPaHC3P5jVMYX3jJm37CYcpghrO6Mu0ImFse4LVqhfZILj73dAtfdA5QzhL3QSIKLnXIHBs/lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752010252; c=relaxed/simple;
	bh=4JainiTku1WVgFyGDaWtDRUd4uIgB1cSt4VwdoTLW7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kx1lvL4CZJKgk5K50hqCX2Q4gX/sTFE0uWKsqwUFh8/Tdg1+lRD+SR0tTaFeLAH9VrLJPdX/XfvWKo6KIkS9eeKUkx41SOFGfr4PF8m21XPsD5i4I13RJbw05P04Ia8pbKvxDbxeabLQsGUfRqtHs53bMV1I+J+utdURgajCSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D1CE1BC0;
	Tue,  8 Jul 2025 14:30:37 -0700 (PDT)
Received: from [172.27.42.165] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23AB03F66E;
	Tue,  8 Jul 2025 14:30:49 -0700 (PDT)
Message-ID: <9ddd8122-a2d7-43f3-a0ec-d4d7a0450d2e@arm.com>
Date: Tue, 8 Jul 2025 16:30:44 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: add zboot support to extract-vmlinux
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org,
 nicolas.schier@linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
References: <20250522172941.1669424-1-jeremy.linton@arm.com>
 <CAK7LNAQzkh+DO7ZBVEgLu63k0H5qB-etV_jpo67k+itLWGAosA@mail.gmail.com>
 <14f2329f-e110-4f3f-976b-acb38d255798@arm.com>
 <CAK7LNARG3wO_1R6_n1djbAQVx8=t0aMqAR4aaMUsRDBysSkkfA@mail.gmail.com>
 <4edecc95-0b6e-4365-bc97-d072bb06d79d@arm.com>
 <CAK7LNAR=LaMQLqqhG86T9Vk6tZYOYzMsvfm_FtK8sBdL5CGY+A@mail.gmail.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <CAK7LNAR=LaMQLqqhG86T9Vk6tZYOYzMsvfm_FtK8sBdL5CGY+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 7/7/25 6:35 PM, Masahiro Yamada wrote:
> On Tue, Jul 8, 2025 at 6:29 AM Jeremy Linton <jeremy.linton@arm.com> wrote:
>>
>> Hi,
>>
>> Thanks for looking at this.
>>
>> On 6/24/25 12:56 PM, Masahiro Yamada wrote:
>>> On Tue, Jun 17, 2025 at 1:09 AM Jeremy Linton <jeremy.linton@arm.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Thanks for looking at this.
>>>>
>>>> On 6/7/25 11:04 AM, Masahiro Yamada wrote:
>>>>> On Fri, May 23, 2025 at 2:29 AM Jeremy Linton <jeremy.linton@arm.com> wrote:
>>>>>>
>>>>>> Zboot compressed kernel images are used for arm kernels on various
>>>>>> distros.
>>>>>
>>>>> Are you talking about arm 32 bit here?
>>>>> (arch/arm/boot/zImage)
>>>>
>>>> No, it should be arm64.
>>>>
>>>>>
>>>>>> extract-vmlinux fails with those kernels because the wrapped image is
>>>>>> another PE. While this could be a bit confusing, the tools primary
>>>>>> purpose of unwrapping and decompressing the contained vmlinux image
>>>>>> makes it the obvious place for this functionality.
>>>>>>
>>>>>> Add a 'file' check in check_vmlinux() that detects a contained PE
>>>>>> image before trying readelf. Recent file implementations output
>>>>>> something like:
>>>>>>
>>>>>> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
>>>>>
>>>>> Are you talking about arm64 here?
>>>>>
>>>>> I am confused, as arm64 adopts a simple-compressed image.
>>>>
>>>> No, there is a CONFIG_EFI_ZBOOT, which is a EFI/PE image which self
>>>> decompresses a contained kernel similar to x86, but is for !x86 EFI
>>>> architectures. This patch extends this utility to work for those images
>>>> as well.
>>>
>>> The commit description does not explain why this is useful.
>>>
>>> Extracing vmlinux ELF is useful for debugging purposes.
>>
>> Right,
>>
>>>
>>> In this case, the extracted file is
>>> arch/arm64/boot/vmlinux.bin, which is just a (zero-padded) binary.
>>
>> $ file vmlinux.bin
>> vmlinux.bin: Linux kernel ARM64 boot executable Image, little-endian, 4K
>> pages
>> $ readpe -S vmlinux.bin
>> Sections
>>       Section
>>           Name:                            .text
>>           Virtual Size:                    0x2860000 (42336256 bytes)
>>           Virtual Address:                 0x10000
>>           Size Of Raw Data:                0x2860000 (42336256 bytes)
>>           Pointer To Raw Data:             0x10000
>>           Number Of Relocations:           0
>>           Characteristics:                 0x60000020
>>           Characteristic Names
>>                                                IMAGE_SCN_CNT_CODE
>>                                                IMAGE_SCN_MEM_EXECUTE
>> ...(trimming remainder of output)
>>
>> Its another complete PE boot image which can be used by UEFI/grub/etc as
>> well as any PE debugging and analysis utilities.
>>
>> So, this change effectively removes the zboot wrapper. The resulting
>> image is still useful for a certain amount of debugging (ex string
>> extraction, manually matching crash points, version checking, etc) in a
>> distro based environment where the user doesn't have a kernel build tree
>> handy. As well as any boot debugging, which could be caused by the ZBOOT
>> wrapper itself, and I'm sure a long list of other things.
> 
> OK. Then, please add a little more context regarding
> how this is useful in the commit description of v2.

Sure,

> 
> Please fix the first line of the description:
> 
> used for arm kernels -> used for arm64 kernels
Right,

> 
> 
> Lastly, how about this implementation?
> 
> check_vmlinux()
> {
>          if file $1 | grep -q 'Linux kernel.*boot executable Image' ||
>                              readelf -h $1 > /dev/null 2>&1; then
>                  cat $1
>                  exit 0
>          fi
> }

That works too.

> 
> 
> I used the -q option for grep instead of the redirection.
> 
> 
> Masahiro

