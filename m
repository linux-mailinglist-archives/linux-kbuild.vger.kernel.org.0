Return-Path: <linux-kbuild+bounces-8637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E62B393B1
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 08:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1A216D3AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 06:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C662773D6;
	Thu, 28 Aug 2025 06:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bkxGi3Q6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E8277C84;
	Thu, 28 Aug 2025 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756361686; cv=none; b=lfhNrGCfzlSej4Joo+yS5gnCXD16p8uhcAlHVm9+HxUoh68MxOjmOpHfyTkvyg437k1XjSIGiqm/0QJnkZ4xiQhgTMl/oz3OZy5rIxTOqdHliZZCjCnSlSBZrxBYXBMe4V5Ts7bphDtkhNGt4mGcWQ/s7rqdcmhxA5ZEhr4nu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756361686; c=relaxed/simple;
	bh=24RtXmBs8sDbV+FKZY3m2RQfjwKVsmeGc/ycJ8DwMBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ks0sc6XGzELAOPcuOZzwHqUfbIte4X2nyiLJDr1FuH9EAEzNKACheMD6j8LVHUL8V71BQG+rLcN43YDAMMtcWezgHk6t15lY2s3nRxyfQjAjE9GpveYAVmKB8ZkbHVRKQ0OZxj9fzk3nZNtm6gkwcJgukmvlt1XXqaptdLOCV3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bkxGi3Q6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mLP5bwfx5JUrcHsz6CyZc7tgsZnbyjt3ON1W+9DUhmE=; b=bkxGi3Q6m6lm+Igj/KqLC35diy
	D+8C+V1d7b7P294LP3kloHaUZQsS5V2wNmdrRa9BnpUsrNdGc9sjnIFq5AVDEdvpfr2CRtTaXXt6/
	ZTCf7PVZigQcjx7zulNTvhErrYr+n50RnGuPZBTN+x/vD9kAZFGU983GYe6EkyK8JE7zP0NreezE8
	dsJezbWOu2t9JxU8z/Gtny6N+IrqdZm3jVq7jSIaiNtr2M0vMWF8rbRYtFLyJX4HQQOhJ98tIZQc2
	jwoD23j7ZEdtvosv6JKqa4SoOnqZ9GR/bHA5PxbpW0DcZWbKDISZecRVQVLixsAWZGKU8JYJAXrfm
	WpmdxvJQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVuA-00000000Phx-1KCr;
	Thu, 28 Aug 2025 06:14:38 +0000
Message-ID: <61cd6dac-14e1-474e-9aa3-4fe782e81ba9@infradead.org>
Date: Wed, 27 Aug 2025 23:14:36 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@outflux.net>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Rutland
 <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
 <20250827193815.GA2293657@ax162>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250827193815.GA2293657@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/27/25 12:38 PM, Nathan Chancellor wrote:
> On Wed, Aug 27, 2025 at 12:35:12AM -0700, Randy Dunlap wrote:
>> On 8/26/25 6:34 PM, Nathan Chancellor wrote:
>>> On Mon, Aug 25, 2025 at 03:31:34PM -0400, Kees Cook wrote:
>>>> On August 25, 2025 1:00:22 PM EDT, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>>>>> On Mon, Aug 25, 2025 at 5:35 PM Kees Cook <kees@kernel.org> wrote:
>>>>>>
>>>>>> Yeah, that's a good idea. What the right way to do that?
>>>>>>
>>>>>> config CFI_CLANG
>>>>>>         bool "Use Clang's Control Flow Integrity (CFI)"
>>>>>>         depends on ARCH_SUPPORTS_CFI
>>>>>>         select CFI
>>>>>>
>>>>>> ?
>>>>>
>>>>> I don't recall what is the idiomatic solution for renames, but I
>>>>> remember Linus talking about this topic and about avoiding losing old
>>>>> values if possible (perhaps getting a new question in `oldconfig` is
>>>>> OK as long as the `olddefconfig` respects the old value).
>>>>>
>>>>> I think your suggestion above will still make it appear twice in
>>>>> `menuconfig` -- there may be a way to play with visibility to make it
>>>>> better.
>>>>>
>>>>> A simple possibility I can think of (assuming it works) is having the
>>>>> CFI symbol for the time being introduced just as a `def_bool
>>>>> CFI_CLANG` for a few releases so that people get the new one in their
>>>>> configs.
>>>>
>>>> Ah, I think this works:
>>>>
>>>> config CFI_CLANG
>>>>     bool
>>>>
>>>> config CFI
>>>>     bool "...."
>>>>     default CFI_CLANG
>>>>
>>>> I will add that for v2.
>>>
>>> That does not appear to work for me. I applied
>>>
>>> diff --git a/arch/Kconfig b/arch/Kconfig
>>> index c25a45d9aa96..0d3ed03c76c2 100644
>>> --- a/arch/Kconfig
>>> +++ b/arch/Kconfig
>>> @@ -876,8 +876,12 @@ config ARCH_SUPPORTS_CFI
>>>  config ARCH_USES_CFI_TRAPS
>>>         bool
>>>
>>> +config CFI_CLANG
>>> +       bool
>>> +
>>>  config CFI
>>>         bool "Use Kernel Control Flow Integrity (kCFI)"
>>> +       default CFI_CLANG
>>>         depends on ARCH_SUPPORTS_CFI
>>>         depends on $(cc-option,-fsanitize=kcfi)
>>>         help
>>>
>>> on top of this series and
>>>
>>>   CONFIG_CFI_CLANG=y
>>>   # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS is not set
>>>   # CONFIG_CFI_PERMISSIVE is not set
>>>
>>> gets turned into
>>>
>>>   # CONFIG_CFI is not set
>>>
>>> after olddefconfig. CONFIG_CFI_CLANG has to be user selectable with a
>>
>> Could/did you test with 'oldconfig' instead?
>>
>> olddefconfig is going to use the default value from the Kconfig file,
>> which if CFI_CLANG which is undefined/No/Not set.
>>
>> oldconfig will use the old value from the .config file.
> 
> I am not sure I understand what you mean here. With the series as it is
> or Kees's suggested fix, oldconfig still prompts the user to enable

OK, I don't know the state of the CFI_CLANG / CLANG patch(es).

I just mean the difference in 'make oldconfig' and 'make olddefconfig'
(at least AIUI).


> CONFIG_CFI with CONFIG_CFI_CLANG=y in the old configuration. Both Miguel
> and I allude to that being fine but it would be really nice if users
> with CONFIG_CFI_CLANG=y were automatically transitioned to CONFIG_CFI=y
> without any action on their part. That seems to be in line with how

Yes, I agree.

> Linus feels even as recently as this past merge window:
> 
> https://lore.kernel.org/CAHk-=wgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV5HeQ@mail.gmail.com/
> 
> Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a user
> selectable symbol and making CONFIG_CFI the hidden symbol that both
> compiler symbols select. After a couple of releases (or maybe the next
> LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated with
> CONFIG_CFI becoming user selectable, which would keep things working
> since CONFIG_CFI=y will be present in the previous configuration.


-- 
~Randy


