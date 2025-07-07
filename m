Return-Path: <linux-kbuild+bounces-7913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB7AFBD83
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 23:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D754A4BD3
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 21:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A231F4191;
	Mon,  7 Jul 2025 21:31:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53307199934;
	Mon,  7 Jul 2025 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751923904; cv=none; b=elV69pPjp3sKiJtRaQ5/v5ecOwTbdlJfnyuWExTDCELvu5+piXG7DjfiOVdeG8GcNpv5nwbvvziJ0Ze3ZZiH428ArhmqKqpe2JNNIlbAlnBEYHaP4AyddOfrZu/4OVfnJnu3Bmw4itk/62k+ujjAbj0jBHm9+WEU8+HRN4mPriY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751923904; c=relaxed/simple;
	bh=knn5ptmuTBEl1zFysuErVCW6CyCCiL4U4AygZpHszko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klr51ftu0eWEUCFk2uCsoSISXEw4H/GIaJ/yLg36/gKf3/gSCnx3sm7HBdWjbep9outJAbN/oJ9mukU8je96loVoJC15IKKpiqh2lpEpupRQfIReRlpgGteyjjFNDB20GrlxZDrjv6Av5OCTdxso7J1gb9AIB60DiSlsBwuEsiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 120441595;
	Mon,  7 Jul 2025 14:31:29 -0700 (PDT)
Received: from [172.27.42.165] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E1053F66E;
	Mon,  7 Jul 2025 14:31:38 -0700 (PDT)
Message-ID: <8e9a01b5-b93a-415c-9399-005ba55bc3ea@arm.com>
Date: Mon, 7 Jul 2025 16:31:38 -0500
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
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <CAK7LNARG3wO_1R6_n1djbAQVx8=t0aMqAR4aaMUsRDBysSkkfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Thanks for looking at this.

On 6/24/25 12:56 PM, Masahiro Yamada wrote:
> On Tue, Jun 17, 2025 at 1:09 AM Jeremy Linton <jeremy.linton@arm.com> wrote:
>>
>> Hi,
>>
>> Thanks for looking at this.
>>
>> On 6/7/25 11:04 AM, Masahiro Yamada wrote:
>>> On Fri, May 23, 2025 at 2:29 AM Jeremy Linton <jeremy.linton@arm.com> wrote:
>>>>
>>>> Zboot compressed kernel images are used for arm kernels on various
>>>> distros.
>>>
>>> Are you talking about arm 32 bit here?
>>> (arch/arm/boot/zImage)
>>
>> No, it should be arm64.
>>
>>>
>>>> extract-vmlinux fails with those kernels because the wrapped image is
>>>> another PE. While this could be a bit confusing, the tools primary
>>>> purpose of unwrapping and decompressing the contained vmlinux image
>>>> makes it the obvious place for this functionality.
>>>>
>>>> Add a 'file' check in check_vmlinux() that detects a contained PE
>>>> image before trying readelf. Recent file implementations output
>>>> something like:
>>>>
>>>> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
>>>
>>> Are you talking about arm64 here?
>>>
>>> I am confused, as arm64 adopts a simple-compressed image.
>>
>> No, there is a CONFIG_EFI_ZBOOT, which is a EFI/PE image which self
>> decompresses a contained kernel similar to x86, but is for !x86 EFI
>> architectures. This patch extends this utility to work for those images
>> as well.
> 
> The commit description does not explain why this is useful.
> 
> Extracing vmlinux ELF is useful for debugging purposes.

Right,

> 
> In this case, the extracted file is
> arch/arm64/boot/vmlinux.bin, which is just a (zero-padded) binary.

$ file vmlinux.bin
vmlinux.bin: Linux kernel ARM64 boot executable Image, little-endian, 4K 
pages
$ readpe -S vmlinux.bin
Sections
     Section
         Name:                            .text
         Virtual Size:                    0x2860000 (42336256 bytes)
         Virtual Address:                 0x10000
         Size Of Raw Data:                0x2860000 (42336256 bytes)
         Pointer To Raw Data:             0x10000
         Number Of Relocations:           0
         Characteristics:                 0x60000020
         Characteristic Names
                                              IMAGE_SCN_CNT_CODE
                                              IMAGE_SCN_MEM_EXECUTE
...(trimming remainder of output)

Its another complete PE boot image which can be used by UEFI/grub/etc as 
well as any PE debugging and analysis utilities.

So, this change effectively removes the zboot wrapper. The resulting 
image is still useful for a certain amount of debugging (ex string 
extraction, manually matching crash points, version checking, etc) in a 
distro based environment where the user doesn't have a kernel build tree 
handy. As well as any boot debugging, which could be caused by the ZBOOT 
wrapper itself, and I'm sure a long list of other things.


Thanks

>>>
>>> Apparently, this patch did not work for me.
>>>
>>> $ ./scripts/extract-vmlinux  arch/arm/boot/zImage
>>> extract-vmlinux: Cannot find vmlinux.
>>>
>>> The 'file' command says, it is "data".
>>> Is my 'file' command too old?
>>>
>>> $ file arch/arm/boot/Image
>>> arch/arm/boot/Image: data
>>>
>>>
>>>> Which is also a stronger statement than readelf provides so drop that
>>>> part of the comment. At the same time this means that kernel images
>>>> which don't appear to contain a compressed image will be returned
>>>> rather than reporting an error. Which matches the behavior for
>>>> existing ELF files.
>>>>
>>>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>> ---
>>>>    scripts/extract-vmlinux | 9 +++++----
>>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
>>>> index 8995cd304e6e..edda1abe226c 100755
>>>> --- a/scripts/extract-vmlinux
>>>> +++ b/scripts/extract-vmlinux
>>>> @@ -12,10 +12,11 @@
>>>>
>>>>    check_vmlinux()
>>>>    {
>>>> -       # Use readelf to check if it's a valid ELF
>>>> -       # TODO: find a better to way to check that it's really vmlinux
>>>> -       #       and not just an elf
>>>> -       readelf -h $1 > /dev/null 2>&1 || return 1
>>>> +       file $1 |grep 'Linux kernel.*boot executable Image' > /dev/null
>>>> +       if [ "$?" -ne "0" ]; then
>>>> +               # Use readelf to check if it's a valid ELF, if 'file' fails
>>>> +               readelf -h $1 > /dev/null 2>&1 || return 1
>>>> +       fi
>>>>
>>>>           cat $1
>>>>           exit 0
>>>> --
>>>> 2.49.0
>>>>
>>>
>>>
>>
>>
> 
> 



