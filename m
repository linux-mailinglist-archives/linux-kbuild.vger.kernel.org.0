Return-Path: <linux-kbuild+bounces-4857-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DF29D8CAD
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 20:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E2E51665B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 19:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42531B6D1E;
	Mon, 25 Nov 2024 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzQO8MEO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE201B4156;
	Mon, 25 Nov 2024 19:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732561905; cv=none; b=o82ratBDxhSsdVC/Q1Fx2zvJYqEi8PxmFgJNKJI1cALqE43v0PKLAJ9cEQYN1x8MTXbEzqUlPqq73qAeswEY9jIYu4L4fNhtcgKDbk6BJKaycmvnW7cc4GGB/6AsHk+GwpgvJXr/yPll3hAyzuM+NM1BVfD9kimeEkgcAvawvSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732561905; c=relaxed/simple;
	bh=gSWynXHPHwRX+s2/nBHSwE30eRysNM3/W0t9ECCySZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ancd/tgb0sTmviC7Hc0MZhITu6aJZX03L5JPq0CpqLGf1AGXZKNUmDxaFl9/u8o7/fdSqwoQCOf1D5i6q6HcHm167+uYNAvOJPl9oI3S6N0D7Bl5DFLGB9dNhcC/ybab+bcrk1K8prKYeT2IQhjH6zUq2UVwa2XV6cdgC2+fBLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzQO8MEO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa52a5641f8so411724166b.3;
        Mon, 25 Nov 2024 11:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732561902; x=1733166702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IDfP23brxN+2T++cCx4X5R5Pibf8jiPLu8znBbw6ag=;
        b=TzQO8MEO0YSl3HVzfO/nTJnksCt2b0FDTeMOBLuWk0CQZK8y4PSiP8dJ/nWR7jX06d
         K9yARmvR/OuFI2SGzK+LULFHq9PwCtzAqYSuQnQJXiCcRlYeZennMrRNZGXQ3y5w0ZNi
         ddK7GpJajlnurE65AcBrNhHRWWvZtX+z0yIGIX1mlKBw3r53ulU2pBHD74V+PHhXjwGo
         c8614eaCrWjv0TEtAgN5z6cl/6N5xYB/x/01A9iOCKeaQie+uxgmljgfX/rJlmSdiQE+
         ZzzPRB17rBuUSv29whhO0I221xE8e6JHT0POyncHzZ5ibantMw9iiETRCs8khBTZc0hS
         w5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732561902; x=1733166702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IDfP23brxN+2T++cCx4X5R5Pibf8jiPLu8znBbw6ag=;
        b=lygCv12WwmJb6ZmQTn+DTxcDmxH/HJ+xOWdZTMkpb0+kJhYoZHdOtvJZw6vMhvmlJp
         V584cSZGHgMVQ+kUZO/aUjpEEg9Ze8/SFMFn3cgfbHHH+KVKU1FwS/JNMYqfJ+g9R1QU
         nsk9KujEwaC0f9+dfgAE6uSx+254RT9t4uUQGpV5Lm4bMaL0lX+Y2y2TckfZmgLmR6Zj
         iQKWgCV1ZM+9rb1gkRy53/e1L70GW5FThHBWOKDBRUBQI+XuPBjxcoeHXivHmGqid4up
         IgNsvQ4HwyblOlWulWuYPXMWnCqLUsNtqhcKZP1QYhKkOqCWHlNpnux2+AnfVo4WuhjP
         H5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNr8yuVXXDbS1nHs71ry1zgFXKyQKHCIgvvjijgUyi5iX7WtoHE1qc4m1JOtlEwpRQQLcc9U8lzQnGWPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMYqILq484NjwTzHM7MOAUkNrn7NqcE5yBLfpTCvs3MpKrL3V
	hN80s1YFYMY5yYV5LZubWOpfwHkExmDjneqBzLnmazJ/VdOMCXz1
X-Gm-Gg: ASbGnct7YCCd3Jc2Hw02AAr1Q3U8tqaE7kNoYHtyTF9kQG26V/mXNOUTHeZJLJ8J7Eq
	7f89Uk4EVSXq2uS+nWdXIzR7YXyQUl5qjfmLdTOOErFRNIIQiINshruJpV9Q8i9gdW6hd7rewuq
	iMWBOgoalY0rUbLoXowL8I1nmNkVYbg7+/0/pTQoNlE3i0SDVJO6NBOCIWD2TNZKX9BfzIdrBg2
	d7zO4MKN/fPWXmE5l+XWeTCHMVt4x4Sl6m8YQ9PHqdVQkcojB7amKGzzUXj3cxw/xm0eGYe1soH
	+w==
X-Google-Smtp-Source: AGHT+IFZBEe3oi2NXw/tkyV1McqqXsCNGrLSxvbm4IIwYZtunoceviOn3M3Yn0JcekmYk/blhqCdBQ==
X-Received: by 2002:a17:906:31c5:b0:aa5:225f:47d9 with SMTP id a640c23a62f3a-aa5225fb282mr964846866b.29.1732561902078;
        Mon, 25 Nov 2024 11:11:42 -0800 (PST)
Received: from [192.168.178.20] (dh207-43-247.xnet.hr. [88.207.43.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fe94sm497858766b.96.2024.11.25.11.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 11:11:41 -0800 (PST)
Message-ID: <d136d201-7aa5-4bab-8437-c44e0c54e0e4@gmail.com>
Date: Mon, 25 Nov 2024 20:10:42 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM] make bindeb-pkg: When just one source line in a single
 driver is changed, all driver are rebuilt?
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <f96d57c9-efda-4781-a395-a7c5fec7f2ad@gmail.com>
 <9748bda4-0db8-4c70-a321-c7189d575cbc@t-8ch.de>
 <f50cd6ae-0d99-4836-b268-c9c86da448d8@alu.unizg.hr>
 <b21160de-8f12-4796-8df1-2188b5fc93e0@t-8ch.de>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <b21160de-8f12-4796-8df1-2188b5fc93e0@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/23/24 15:57, Thomas Weißschuh wrote:
> Hi Mirsad,
> 
> On 2024-11-23 02:53:09+0100, Mirsad Todorovac wrote:
>> Hi, Mr. Weißschuh,
> 
> Call me Thomas, please :-)

It will be my honour, thanks :-)

>> On 11/21/24 22:43, Thomas Weißschuh wrote:
>>
>>> On 2024-11-21 22:18:58+0100, Mirsad Todorovac wrote:
>>>> I am perplexed now at 6.12 stable vanilla tree, and I've noticed that after changing just one
>>>> line in ./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11, all unrelated drivers are being BTF'd, SIGNED,
>>>> and INSTALL-ed:
>>>>
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aht10.ko
>>>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>>>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
>>>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/adt7475.ko
>>>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/as370-hwmon.ko
>>>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aquacomputer_d5next.ko
>>>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/applesmc.ko
>>>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
>>>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asus_rog_ryujin.ko
>>>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asc7621.ko
>>>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
>>>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
>>>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9055-hwmon.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
>>>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
>>>>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>>>>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>>>>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/dell-smm-hwmon.ko
>>> This happens when the vermagic is changed. The vermagic is linked into
>>> each module. And after relinking all the other steps also need to be
>>> done.
>>> Building the Debian package increases the build number which ends up in
>>> the vermagic and therefore all modules.
>>> Also there is CONFIG_LOCALVERSION_AUTO which may be involved.
>>
>> Yes, I use CONFIG_LOCALVERSION_AUTO because it saves a lot of trouble in bisecting.
>>
>> This vermagic manipulation is beyond my grasp. I understand that
>> modules must match kernel version, for internal ABI often changes. But
>> not between builds of the same source? Am I thinking right?
> 
> The ABI doesn't change between builds of the same source tree which is
> why there are no actual rebuilds ("CC") of all modules.

That is actually more precise.

> But your usage of bindeb-pkg bumps the version string
> (also without CONFIG_LOCALVERSION_AUTO) and this needs to end up in each
> module file which explains the LD/BTF/SIGN/INSTALL steps.

I see. I hoped there is a way around this.

CONFIG_LOCALVERSION_AUTO is very useful when compared to manually keeping tracks of commits.

Once upon a time, about a year or two ago, I told Mr. Bagas Sanjaya how a list of applied diffs
could be added to the kernel manifest instead of just config-${VERSION} and "-dirty" flag.

Thanks.

Best regards,
Mirsad

> [..]


