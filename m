Return-Path: <linux-kbuild+bounces-6038-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998AA5B69A
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 03:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EB793AD737
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 02:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B521E0E13;
	Tue, 11 Mar 2025 02:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="kqEs78NT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F301DFE00;
	Tue, 11 Mar 2025 02:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659578; cv=none; b=Pd/19MYr0Z7h8KPkTpm+vvSONs1m/clq4qHemkAKqfbKKYMKjEBZSV9OE7lOp6C+GrRQE2YY1eLN2/MuKbxQogFrcCb/57tva0pMxqpgmJUqjFM5KDUnMArpMSkJ7s7JYbeeWTKV4h95BUvtFrbtXCsl6I+1uESgY55kfXdHQ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659578; c=relaxed/simple;
	bh=Sth8l67n+uwLQKxCXrukaimfOae11pQFiWD/R/v/SeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoEd7t5SomifJ5EhbXJpdDyQqPg9ffBERk5HR0FH4FraZIMvgrEflHPX8d51L1VKoKULE0Av88kzloCKQ6F92seH1L/bhL9oJQstNPwIN9G+RxMUnBH5yQGio6p02Xv7u7YicML0b7URlKJIH+abwb9UOGD9fIgAdDLOqVqiTvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=kqEs78NT; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52B2J6su1869505
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 10 Mar 2025 19:19:07 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52B2J6su1869505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741659548;
	bh=RRnyrixk4lF11HSwzZsW5tJQgq5fiSSNVV/SDhLEu7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kqEs78NT0RMed9+pWysEdFOMLGaEx67KyyrKHIV9vaUlM8K/7b2JagrU0JiUhV10D
	 D2A84l8gaejvfUxi9q8Y0x+AU6yF4oc3Zl/rBMTQWzjohefTXmHt4ciwkiigZeRWcv
	 3lQsi6dTSj/H+gU10FJ0rSymVFMWReEhgmEE/icQkeKg2x6D6xfQYP0V8d4iluT5sf
	 U/BBAz5tnj97uDN1TTntWhBpvBWXoWxd9Kt2U7ShEX/2kBJllXRF3PNX8fgx18nP0I
	 Waq3uZUG5yT/v2XBo9l1EzgXIkKUR4+BtEGh6e7zv+wQoYvstiUUsLj7FDVi4eG8a+
	 rwSNT/Vd1LpDQ==
Message-ID: <08bbfff0-4aef-4d9e-bbeb-661aedaf3737@zytor.com>
Date: Mon, 10 Mar 2025 19:19:05 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de, hpa@zytor.com,
        sraithal@amd.com
References: <20250308040451.585561-1-xin@zytor.com>
 <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
 <6149ac51-07da-45e2-863e-1d4418f6b662@zytor.com>
 <CAK7LNATGToVHEfZ-hmJ=3xbQCdHmBZf7x9w2QtQVGV-nMiP2Ag@mail.gmail.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <CAK7LNATGToVHEfZ-hmJ=3xbQCdHmBZf7x9w2QtQVGV-nMiP2Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/10/2025 6:52 PM, Masahiro Yamada wrote:
> On Mon, Mar 10, 2025 at 3:23 PM Xin Li <xin@zytor.com> wrote:
>>
>> On 3/8/2025 7:12 AM, Masahiro Yamada wrote:
>>> On Sat, Mar 8, 2025 at 1:05 PM Xin Li (Intel) <xin@zytor.com> wrote:
>>>>
>>>> Meanwhile explicitly state that the headers are uapi headers.
>>>
>>> There are many internal-use targets, which are not documented in the
>>> help message.
>>> I assume this one is the case.
>>>
>>> If users want to install UAPI headers, 'headers_install' is
>>> the user-visible interface and it is already documented.
>>>
>>>
>>
>> hpa and Boris prefer to add it, which I also agree.  But ofc it's your
>> call :)
>>
>> If you don't want to add help for "headers", it probably still makes
>> sense to explicitly state that the headers are uapi headers, no?
>>
>> Thanks!
>>       Xin
> 
> 
> If a help message for "headers" is desired, how about this?
> 
>    headers  - Build read-to-install uapi headers in usr/include
> 

LGTM.

I guess you will make the change right now?

Thanks!
     Xin

