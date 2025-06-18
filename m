Return-Path: <linux-kbuild+bounces-7550-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D48ADF651
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 20:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637B23A5595
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 18:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E1E2F4314;
	Wed, 18 Jun 2025 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUBZxz9O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F72F49E0
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Jun 2025 18:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750272915; cv=none; b=lvYgj15qFkEdW9JpxyzGpTnTMn/Y/qAfHgXK1x+1efSCax9ojfXApV0NT2ZCJL8wv/jfrCtOWBbLfKN4hFboqxeaukmoykRJUxWQeOIrUsQCdElw3fRpjucMrZgknRTNckKyY0yghh5QyanCxFf6UY1L0aAO0f+zZjqO8d4WEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750272915; c=relaxed/simple;
	bh=l+sofPI0a4H9EXu998eR23hCXF88jut6G/66kBd7ucg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=onAfXQRgh6WpLT2H80545p6ECkOQ4S5ehLzJsrtu+bJwy5SnayJkjS08LpLoZ/tMw3ZilUuydNAlwpvv6faeBDZfTyLpDEH6YZcGStxDPkLqQ0P//0l41qXfR0mn5I20J2q2a3CGbPpTg6rBfMOSNSo/yCz90GXqZA8+gPw+Mw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUBZxz9O; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso4300051a12.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jun 2025 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750272912; x=1750877712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UYo69dGKwxkvZVYFGXMZv6iD++4zKKpxx8tLjZ8T8QQ=;
        b=jUBZxz9OKCF+h2AxjCWGsGVArfx+9daGF4E2OsnHgQFjUWRya0OgPl0RaBt0CllWlI
         CmCYCbYWep31fOrSRBDzYdTBczkk2jJvcrirQ8V3BqE++EbKXQA78wl025/OJHVbqFwO
         j6piZl/kIEOBp2Rn7OZPVRdKCjZqBzcwmZLuxyBeR0epXIAMYS52aw0x0MmO66XI2Weq
         NaSX6IdywsviJd7Lsk9gyrGSdK55Lolb2SA8MPEC8ROMU/yLVxMbIUssF8t1tzAMcGnp
         e4aXlaJPzqDbiPEWf3+Bi23XU0u6NyXNTGokDpQNWnVFBTp07Mjd1vf9cVhItg4EWObK
         oKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750272912; x=1750877712;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYo69dGKwxkvZVYFGXMZv6iD++4zKKpxx8tLjZ8T8QQ=;
        b=Yuft/Pp0+O7e85GgUxqliwNtxzMmHxK0G+Tl+8bocOWYOosUXH6f/n9GXbPagwoTbf
         /Iv/w+/mbxpztfPQIqtZbjtQSooJ4894jbQU7ZaGw2j1KiZ8BVfr/mjeSjwku3TQI0Ak
         NAoEjsZakrWM5BAMTHOdR4Ya3ljUObpWc0+Lt14Zcn7DaZmMTTB1LIAXKddrv/ae0EXV
         Ms9YcRfpq/okenJHvcWwhqHUgfY9tmEtaO0a9hfdL8xwUQc7yBJAjVjzfdY8UtVWJyeA
         WS4UqM+EMi/vMy2KssQvU0Xc4ZcvZhh9HYea6bcWuO3pQbTb9jJA2ujDXv6Omy8aTArh
         aDSQ==
X-Gm-Message-State: AOJu0Yz+r2/hjfImwMkxIN31w48/UTRLuYV7YfMmi5gNNzroc91OfyIK
	kwpnc0ehK3herieIgPDLsjyRq3c2otF3hhQ3NE0m3e/XWmy7AM15qT8T
X-Gm-Gg: ASbGncuUntzJIHLf2DCfMOPyA2ghkuoKY/Z4vcwj0MZuaYZW7+9Rp0pNLQKRx5AjiUs
	MZxRawBYVYc4MoWkLNBDSjdPIh5tEk77onyOWD6UB6L4kzWC2QV81Yq7JOqT0Oj6XOr7hSgKCWS
	owZQq8jTEUW6oSdLxlQefZE4jmvOccYjdbFmGiVsT2wwTuQsA6akBxGozDf6qpoYnJCvfXbf1KP
	pz9fihR6vcX30rrNFWatQZZBVzO70B82pO1KZkutGImiwGCuo4sbzdmh+WGtd6eUg3+P5vf+PGB
	5We5n3bcjNsxFsqu41zWGfq60gNfLymtwUexJrr7y4FlphHz10/cXBq8z/Mb0n5o
X-Google-Smtp-Source: AGHT+IExCXPPz+aIkbdgn2e6ZXZYlHW+L9/Suinx85GYUmGTSPlpYhxuC859Ft14ftutwl+HUNdFZQ==
X-Received: by 2002:a05:6402:5109:b0:604:bbd2:7c6c with SMTP id 4fb4d7f45d1cf-608d097cdfbmr19243162a12.27.1750272911572;
        Wed, 18 Jun 2025 11:55:11 -0700 (PDT)
Received: from [192.168.0.3] ([91.80.31.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48a9db9sm10182464a12.16.2025.06.18.11.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 11:55:10 -0700 (PDT)
Message-ID: <64d93af1-b602-4dba-ad4b-a2b9a493c800@gmail.com>
Date: Wed, 18 Jun 2025 20:55:09 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
From: Franco Martelli <martellif67@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Franco Martelli <martellif67@gmail.com>
References: <20250604183539.425053-1-martellif67@gmail.com>
 <CAK7LNAROMO2686KPbt+ZquymcZC-RLr0aX5x477uF1DaesUkCQ@mail.gmail.com>
 <9aaea19f-cd15-44fe-8d61-984f7ff316b7@gmail.com>
Content-Language: en-US
Autocrypt: addr=martellif67@gmail.com; keydata=
 xjMEXwx9ehYJKwYBBAHaRw8BAQdA8CkGKYFI/MK9U3RPhzE5H/ul7B6bHu/4BIhTf6LLO47N
 J0ZyYW5jbyBNYXJ0ZWxsaSA8bWFydGVsbGlmNjdAZ21haWwuY29tPsKWBBMWCAA+FiEET9sW
 9yyU4uM6QbloXEn0O0LcklAFAl8MfXoCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQXEn0O0LcklBgAwEAhdX5TbxGOmMhlJUi9AkDACN2ZemI8Tz2jSZPDlOQoE0A/3Tq
 SPaEkb6kvK4xw626+AUDrfIzwzBscgpkDo4zCW0DzjgEXwx9ehIKKwYBBAGXVQEFAQEHQNP5
 V2q0H0oiJu89h1SSPgQDtkixXvUvRf1rNLLIcNpPAwEIB8J+BBgWCAAmFiEET9sW9yyU4uM6
 QbloXEn0O0LcklAFAl8MfXoCGwwFCQlmAYAACgkQXEn0O0LcklCMtgEAuCcSolf8LBIB4WTI
 4YGKiN7qBXfW0QTbPO+bPXQLxfEBAJuoVm3BlyMHoNG6UEZ2TcqfV8k6oRqwr/c0IXwJqEkK
In-Reply-To: <9aaea19f-cd15-44fe-8d61-984f7ff316b7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/06/25 at 15:44, Franco Martelli wrote:
> On 16/06/25 at 15:04, Masahiro Yamada wrote:
>> On Thu, Jun 5, 2025 at 3:36 AM Franco Martelli <martellif67@gmail.com> 
>> wrote:
>>>
>>> Signed-off-by: Franco Martelli <martellif67@gmail.com>
>>> ---
>>>
>>> Dear Linux hacker,
>>>
>>> I've written a patch that allows to compare the tristate value of two
>>> .config files inline, symbol by symbol, in mconf (make menuconfig) only.
>>
>>
>> I do not understand why this needs to be implemented in
>> menuconfig.
>> scripts/diffconfig is already available.

> When a new stable release of a distribution is available, in the Linux
> kernel many things has changed, this patch comes in help in this
> situations, it allows to easily compare the customized .config file
> built for the previous version of the distribution, with the one
> provided by the new software distribution, used as reference.
> Generally it can be helpful when the differences between .config files
> are huge, because you can navigate across them in the menu window.

>>
>> I think the comparison mode is rather distracting.
>>

A solution to improve readability of the comparison mode could
be to skip symbols without differences, so leaving those menu
entries untouched. This will shrink the amounts of characters
displayed significantly.

I can send a version 3 of the patch changed accordingly, if
you don't reply to this email I will assume yes, but if you
are definitely against to this patch, please let me to know.

Kind regards,
-- 
Franco Martelli

