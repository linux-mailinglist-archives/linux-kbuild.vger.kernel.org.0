Return-Path: <linux-kbuild+bounces-7997-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F57B02C7B
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 20:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 266A91C2250D
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 18:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE574220686;
	Sat, 12 Jul 2025 18:50:27 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCFFB672;
	Sat, 12 Jul 2025 18:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752346227; cv=none; b=SfUDccH9ShbBNYNqiqKONkb8PrCJxj628qodyEDp7DfVI8tomt2AFqABXvdEz5h+OQ2+Zxwfcj5QTHX15ZamOnnWtBOuaG60BUXOQTY8cNnYPtcDXOLMBc8lPSclHAt3J4tWe72vMKWplThBaem3/IOB121TLomO2DnQ6Wjuwdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752346227; c=relaxed/simple;
	bh=wX6BK2CyDpMPWioTbpzKfrkSxmuGErecAaERxhdAYyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AW17/fzB+VglCgWxjnNx1ws3O15Eug7GkdJW1BzoGS/MBNQkCthGmwxe7C7dDbqJHOfMNO0cw1FwkZypZSzFV4jDjO4wAZ+s3wtKk6Yr8C2Dqoe6grr9foNzUtVvmoIhpxZf/Hndsury0+GUvPsC4qfnJVg08IAgYVfzPCohkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27AC41424;
	Sat, 12 Jul 2025 11:50:08 -0700 (PDT)
Received: from [192.168.20.57] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A265F3F6A8;
	Sat, 12 Jul 2025 11:50:16 -0700 (PDT)
Message-ID: <bef8875c-a7c1-4ae2-abc4-ce279e9d4778@arm.com>
Date: Sat, 12 Jul 2025 13:49:59 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] scripts: add zboot support to extract-vmlinux
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org,
 nicolas.schier@linux.dev, linux-kernel@vger.kernel.org
References: <20250711162605.545514-1-jeremy.linton@arm.com>
 <20250711162605.545514-2-jeremy.linton@arm.com>
 <CAK7LNAQM02RBd4M5QgNTNKNaAYKGaPUSgJRXwq=Pq3OA5dYMRQ@mail.gmail.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <CAK7LNAQM02RBd4M5QgNTNKNaAYKGaPUSgJRXwq=Pq3OA5dYMRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 7/12/25 10:47 AM, Masahiro Yamada wrote:
> On Sat, Jul 12, 2025 at 1:26 AM Jeremy Linton <jeremy.linton@arm.com> wrote:
>>
>> Zboot compressed kernel images are used for arm64 kernels on various
>> distros.
>>
>> extract-vmlinux fails with those kernels because the wrapped image is
>> another PE. While this could be a bit confusing, the tools primary
>> purpose of unwrapping and decompressing the contained kernel image
>> makes it the obvious place for this functionality.
>>
>> Add a 'file' check in check_vmlinux() that detects a contained PE
>> image before trying readelf. Recent (FILES_39, Jun/2020) file
>> implementations output something like:
>>
>> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
>>
>> Which is also a stronger statement than readelf provides so drop that
>> part of the comment. At the same time this means that kernel images
>> which don't appear to contain a compressed image will be returned
>> rather than reporting an error. Which matches the behavior for
>> existing ELF files.
>>
>> The extracted PE image can then be inspected, or used as would any
>> other kernel PE.
>>
>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>> ---
>>   scripts/extract-vmlinux | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
>> index 8995cd304e6e..049bab337f0e 100755
>> --- a/scripts/extract-vmlinux
>> +++ b/scripts/extract-vmlinux
>> @@ -12,13 +12,12 @@
>>
>>   check_vmlinux()
>>   {
>> -       # Use readelf to check if it's a valid ELF
>> -       # TODO: find a better to way to check that it's really vmlinux
>> -       #       and not just an elf
>> -       readelf -h $1 > /dev/null 2>&1 || return 1
>> -
>> -       cat $1
>> -       exit 0
>> +       if file "$1" | grep -q 'Linux kernel.*boot executable' \
> 
> Sorry for my nit-picking, but I'd like to get rid of this back-slash
> by breaking the line _after_ the OR operator, not before.
> 
> That is,
> 
> 
>      if command1 ||
>             command2
>      then
>           ...
>      fi
> 
> 
> rather than
> 
>      if command1 \
>            || command2
>      then
>            ...
>      fi

Moving the || is no problem, but I am/was under the impression that 
implicit line continuation is a posix shell gray area? Particularly when 
its outside of an explicit compound statement. This AFAIK was one of the 
things bash clarifed.

> 
>> +               || readelf -h "$1" > /dev/null 2>&1
>> +       then
>> +               cat "$1"
>> +               exit 0
>> +       fi
>>   }
>>
>>   try_decompress()
>> --
>> 2.50.1
>>
> 
> 


