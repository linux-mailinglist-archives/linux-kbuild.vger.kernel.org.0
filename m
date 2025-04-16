Return-Path: <linux-kbuild+bounces-6630-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2477FA8AFFB
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 08:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA5F189F88E
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 06:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2660818FDD2;
	Wed, 16 Apr 2025 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZxjNX5xW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B598188733
	for <linux-kbuild@vger.kernel.org>; Wed, 16 Apr 2025 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744783631; cv=none; b=mriEOsodYK03yHVsHNBXMeaf1nFkjsHsAGVy7q/uKcXtk2KvrZopVna2DWJ4hxjFckCA2C8I/WYjxzFj1poVhBiYckX5Fq00gFvWHuUzJmzRMp0KI+ZH3LSsiybZcxdZ/lyRSMzz0Asmoa/ghQs4YHV1Ga4/NB+sMehrRW0a4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744783631; c=relaxed/simple;
	bh=mlqPRoaq73XCmeAZ++E3XETCZFhxTE3AgvU+7zzHhL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICl4XoMatcDdgKI7QzJNzEdACAJHTxVCsjQfnwhVzlxui5JGR1s1T0s7SSWY29eT0UcHboGqiAi6hPD+oBvJv1MGF8qpGxt3ta4+S0UsB9vWFYtyEJTYXhAZs25kdE98dZEegrsa7b083peMUtmHTbggAIZPtlsiFcWMXaHRXYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZxjNX5xW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee651e419so26451f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Apr 2025 23:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744783627; x=1745388427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kEmTzYnjepJtrcuV2deV9sT9Hpj9wpHRNsaP/81wzdQ=;
        b=ZxjNX5xWcg3iiIESF3PsQ+PNiN6tVltvrarp7U5wHzt82aRZgERGDWqgTbprtKUgVt
         OHE5YdOcT2KXBeurBtM3UEXGKLi+UxcMn/2X1lr9+wQ2Ui69DbuC5hsQNqorgQ60G2KH
         ijM29NLU0Jwm3ru5bAEdJuk1Xu7Gep2A52ctzlRZz3ejcxC/Dl0OErPDdOTkjqN5baVf
         ivJvsXDjROI5+4FpX9TUoHAqgshpcCPnsSXGVi2VRKZkN/gI9BoeZmIxmGtDbvkGjrzG
         PW1cAfb4DnRFKyELMNK2g7WCIOL30hqlqGzbSETogd4FTLVNyTl1jhCUkq+TrfOaAMYn
         PbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744783627; x=1745388427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEmTzYnjepJtrcuV2deV9sT9Hpj9wpHRNsaP/81wzdQ=;
        b=KKrIU5PC50xcE39ZBYGPu2noOvOJaSOwK6732hMsuzMFMyPbnhwbpSFODqPgX+qTlO
         Jf0PUTEX9DTUyJIOVfFveoFRBfWzCJOonylWiqAbNZ2XfJ5Cg6mbOeuCf0YWc5HGh5zR
         On2pZtOUr7U3xInvsyCK0aqW6i+QMEnJUm9TJhqLphOQzfd/Smj/V1TVGp4++YxnTZf5
         3YeSr+Dct/zyI+K46uYv8WgKHSJ5+z0DfQ3OfCuRyzFGyPIDxzOcI+lJSvxikcUSzzK6
         Ull56mxT5qgTgLsDBF+4SstduPOwUieLU06SRFVLsoVlaL/VxfqpyT4iA+ew/1UzIVvg
         SX4g==
X-Gm-Message-State: AOJu0YxAjVswqGWDJc5ng0Zml5qa0g585NWvvhKHWvFvbJgIe31dq3IS
	E6bdv07xaxbt1JwaWjLrgCrEOaOHp5+ZrwwQ2HSfb8xWc6EbP8ImggZCT+Q6vEyb7KUGgAl6aH0
	=
X-Gm-Gg: ASbGncu7fPmUj5ssdQazNGQv+/69MjrutMpwbDnlINZpwkNlg+Xen7KULW9xoqeryuK
	Pqm4cUbFeG3JIA7/yvfy2oT6bxKl1Yc/XoyUwYps0azCGaKjIoN2sxEByeeh5hU2s/32ISYWCrj
	BJx3Q/EDfZ+LBIDY9HMGzkH6/2a9wED74h61E8qeMviS10LWIkpDMmIFONw3FH9wrIhyT0Gpp6w
	m9y7NtOgDdCp9hdyal9dW1blsBy7Kidzj6DrPWiZycaGYxIzkPzpNeWM7y8XAnuJE/wCgeWB1gT
	JzdefIbW19crRI7n2J3QhxiWjHPOsjWZRkGVxsQABAe7lnAC6Vbh56begqDANFnWnZj14tHI+ud
	hLWO/FSCOmMkvrmGgbTi+OFIaEQ==
X-Google-Smtp-Source: AGHT+IF5KsYTk38SIP0BnkqE8tr6/OtVvutUS0uinS9C/cWO/4pBLKLKhAI41D21A5YWD8oz9ts6Dw==
X-Received: by 2002:a05:6000:2901:b0:39c:1257:feb8 with SMTP id ffacd0b85a97d-39ee5bb13a6mr388525f8f.56.1744783626680;
        Tue, 15 Apr 2025 23:07:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964048sm16267093f8f.2.2025.04.15.23.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 23:07:06 -0700 (PDT)
Message-ID: <471b4106-8c4c-45d5-881d-e2494ca69432@suse.com>
Date: Wed, 16 Apr 2025 08:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] correct disabling of -Wshift-negative-value
To: Nathan Chancellor <nathan@kernel.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Arnd Bergmann <arnd@arndb.de>
References: <10b1ebd8-5d32-41a2-9454-1b40e98d5187@suse.com>
 <20250414193836.GA107755@ax162>
 <26dcdba6-1aae-4a5c-bd64-78406b7f39b9@suse.com>
 <20250415211527.GC995325@ax162>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250415211527.GC995325@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 23:15, Nathan Chancellor wrote:
> On Tue, Apr 15, 2025 at 07:53:12AM +0200, Jan Beulich wrote:
>> On 14.04.2025 21:38, Nathan Chancellor wrote:
>>> On Mon, Apr 14, 2025 at 04:23:36PM +0200, Jan Beulich wrote:
>>>> The warning is supported only from gcc6 onwards, hence its disabling
>>>> needs probing that the (positive) option is actually supported.
>>>>
>>>> Fixes: 1344794a59db ("Kbuild: add -Wno-shift-negative-value where -Wextra is used")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> The patch itself seems fine (I might add "scripts/Makefile.extrawarn: "
>>> to the title) but if I understand correctly, this is only to support GCC
>>> 5? Would this be necessary if GCC 8.1 becomes the minimum supported
>>> version of GCC for building the kernel?
>>>
>>> https://lore.kernel.org/20250407094116.1339199-2-arnd@kernel.org/
>>>
>>> If people are actively noticing this, perhaps we should send this to
>>> Linus's tree for backports then Arnd could revert it in his series?
>>
>> Actually, aiui that work was meanwhile merged. Hence the patch here is
> 
> I think only x86 has been bumped to a minimum of GCC 8.1 so far, done in
> commit a3e8fe814ad1 ("x86/build: Raise the minimum GCC version to 8.1").
> That series is still being reviewed/worked on as far as I can tell, so I
> think these patches would still be needed for other architectures.

Oh, I see. I merely noticed the bump (after sending) on x86. Then what you
said in your earlier reply is probably the best that can be done for now
(and then also for the other patch).

Jan

>> indeed only applicable to stable trees. No idea how such a situation
>> is to be handled. (Apparently the same is true for "correct disabling
>> of -Wstringop-overflow": That option was introduced in gcc7.)
> 
> Normally, you would just send a patch to the stable maintainers and
> mailing list just like this but the commit message would say something
> like "<xyz problem> was fixed in mainline in such a way that cannot be
> easily backported due to <xyz reason> so do <xyz thing> to resolve said
> problem in the stable trees".
> 
> Cheers,
> Nathan


