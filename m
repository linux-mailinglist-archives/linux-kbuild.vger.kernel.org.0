Return-Path: <linux-kbuild+bounces-7244-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE6AC25E0
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 17:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D73B9E2B64
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 15:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B436F24676D;
	Fri, 23 May 2025 15:04:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C710145B27;
	Fri, 23 May 2025 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012649; cv=none; b=VD4btFh6F+vAjMFnXR+N6N27xVv3r0de2znhJbTYOkFCpRPSRUuuj+xjxTFUKay/OhqAGG/rADzYFNRyghzabiRYaDPDncET9rjz6J60HGvIhDQiEREaOM3BN1/8P/arA5Z/U3DUZRIFS7ZTJdT/XovywLePA+gRRBCM01ZwToc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012649; c=relaxed/simple;
	bh=LgzZzvYlCla4L/rFHSdbF/gMPO8RB3+Aboi8mlRGv9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwT0FGXoi/AT8ZJNAQHJWh0SzfzyWUjcgk/4y9JUbtY0xjT3Nmik4jR5AuddEAAI0+GJw5ooFnB674mB4Cov0Dd4wq3ZZgiL7LjDyeGcRM9M8BfOaxymQG2G1Gs/uxTDxgUV5KaNmCvmWBIltCTjqYU4staKZsVFSWUKfNy0GY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFB781758;
	Fri, 23 May 2025 08:03:51 -0700 (PDT)
Received: from [192.168.20.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CD2E3F5A1;
	Fri, 23 May 2025 08:04:04 -0700 (PDT)
Message-ID: <d97d3229-110f-4aee-93ad-e4499ef4133e@arm.com>
Date: Fri, 23 May 2025 10:03:58 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: add zboot support to extract-vmlinux
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
 nicolas.schier@linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
References: <20250522172941.1669424-1-jeremy.linton@arm.com>
 <20250522231009.GA2020750@ax162>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20250522231009.GA2020750@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thanks for looking at this.

On 5/22/25 6:10 PM, Nathan Chancellor wrote:
> Hi Jeremy,
> 
> On Thu, May 22, 2025 at 12:29:41PM -0500, Jeremy Linton wrote:
>> Zboot compressed kernel images are used for arm kernels on various
>> distros.
>>
>> extract-vmlinux fails with those kernels because the wrapped image is
>> another PE. While this could be a bit confusing, the tools primary
>> purpose of unwrapping and decompressing the contained vmlinux image
>> makes it the obvious place for this functionality.
>>
>> Add a 'file' check in check_vmlinux() that detects a contained PE
>> image before trying readelf. Recent file implementations output
>> something like:
>>
>> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
>>
>> Which is also a stronger statement than readelf provides so drop that
>> part of the comment. At the same time this means that kernel images
>> which don't appear to contain a compressed image will be returned
>> rather than reporting an error. Which matches the behavior for
>> existing ELF files.
>>
>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>> Cc: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>   scripts/extract-vmlinux | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
>> index 8995cd304e6e..edda1abe226c 100755
>> --- a/scripts/extract-vmlinux
>> +++ b/scripts/extract-vmlinux
>> @@ -12,10 +12,11 @@
>>   
>>   check_vmlinux()
>>   {
>> -	# Use readelf to check if it's a valid ELF
>> -	# TODO: find a better to way to check that it's really vmlinux
>> -	#       and not just an elf
>> -	readelf -h $1 > /dev/null 2>&1 || return 1
>> +	file $1 |grep 'Linux kernel.*boot executable Image' > /dev/null
>> +	if [ "$?" -ne "0" ]; then
> 
> Could these two lines be simplified to:
> 
>    if file $1 | grep 'Linux kernel.*boot executable Image' > /dev/null; then

Yes, but it needs, a '!', which applies to the last operator in the 
pipeline and for clarity should probably drop the redirection, so I 
think it ends up:

if ! file $1 | grep -q 'Linux kernel.*boot executable Image'; then

But it mixes the condition checking and the execution, which is common 
but maybe not the best idea.

Although, if I'm going to reroll this, i think the " Image" should be 
dropped since it can also have zImage and possibly other reports in the 
future and AFAIK there isn't any reason to exclude them.




> 
>> +		# Use readelf to check if it's a valid ELF, if 'file' fails
>> +		readelf -h $1 > /dev/null 2>&1 || return 1
>> +	fi
>>   
>>   	cat $1
>>   	exit 0
>> -- 
>> 2.49.0
>>


