Return-Path: <linux-kbuild+bounces-5762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A067A36E4F
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 14:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFB73B04CA
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 13:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACA31ACEC6;
	Sat, 15 Feb 2025 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKPFFvM2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCCE1C8624
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624525; cv=none; b=q4s50JYzyx/SgZg/5CJjP6J8WRGG3cOwUjKwnfC+nSJ0WVflxNVq00Wn7yEsZMDd6O+dGJ/nZbkKo4ofpFep9NlyfKDX/q/MHOLfuWsoHi1hraxW5EYkQtzLcGT2Ak6O6J0vIrhlaj4dX4ZSf3pf3ryi0CceyEhQ6ZrcyCpxYsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624525; c=relaxed/simple;
	bh=pNpqUiamZ9dzTnpgPJdYJAKOpDBLeZW7fnoSXdVQ0Oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onFhNxKFAJmCyxpgWQBFYjHiXZeYsrGTYcnpkkdw6DQBl7bse7+WS8Wog9CQjxcqHB4DJaanv/TIRhAeFxjdRtlQAzHKgkGW3sG+Iw89N54M4mJSz77P0POQfxRwFpEaYBHB5I8vf2FoMsOLmHqJtj6RyKpkCthO2hT+MEtoqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKPFFvM2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43979038df6so162385e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 05:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739624521; x=1740229321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RR/GHUMHBjoRr6SKp1D1VZVvMK6Rk4ChRoLAcy+7yFQ=;
        b=XKPFFvM2H8umov4k3DcblYrLFytcv64PQqcpIXGIFKZtSxvNFv4VG7Xa/XKGZz/gDe
         RGC8jdWZRCDpt9Z/EfsW3iQTsa0YN9s4LVPeZQ1ngrMsNCziBXRptREckb8b41Pz2mDy
         Rr89WdVumDHGCsFWhtOOGYQTb1IewOH81ZedMbCbYSX6s+xYGFugtKHNbwX5feYsU2fD
         WQ84uv10A+U0MmsKe6b7uRt9tvH0sdUPbIKvFm1wI8PKqvwQZ5v4E/mLUn7e2GCqm8ip
         oLuviCDL/ZgzaiOWXqVl9wL0HtmdZHf5CA7Vv6/Q4sww+i/tGnXNwUZ7B7dyYgWCpS0p
         Q4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624521; x=1740229321;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR/GHUMHBjoRr6SKp1D1VZVvMK6Rk4ChRoLAcy+7yFQ=;
        b=p6KwPwgVKex3ehbsBcbvEQx5HAf1DOJp16jC/ni39pAlVHMqgnouqYMadfhuDrfkXy
         H/M1w79t+7LPHqV/BXxnFZPB9ObDSFsGr3HpL6xORCYrxJbRJs/H2o5vWty3LaWgHwnm
         FgaMWDUASzF45Rw9mcnbedTsiwenyeG3C5XV/cgFMGxiKFAbsD7Uu4gt3LwbwI4WtGMo
         XdOiI8m1ToIXLYDV9PnuHfi5MCRE+ltAsQF1gDyW9kyD7PK1vpgT8VRjh645LCx3g7UG
         WRCRX1EmO0F27rXZLHO8CDdqKQrfdZH+3+I5mcAArnYFr7z/AiyavRbWpPkMCr/X3Xsc
         JW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcP2VcaYjIOr5sxez5grGOe/3rJspf3CPWOGFqaf84mxPth7jPXELVx9JAheyCLFIYDe8p4ggezThTYAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpPoYQjqxkR7WCQqDX0+4tadBV2bDMmGWaVzW9brA2kgTYCcY
	7/Qyeo50lnOhy25m8g/UVw4R7CyKci6cpDSKl0qGJ9T+dPxUpKXXT9XCZlz/O5hlEJOpaFPN5AJ
	L
X-Gm-Gg: ASbGncsSr+5Dst+6DMzFhiaA46hDiwGsPWsNHtb69hFJxmCz1hRq07xJRsbO5ORKxOK
	2xHfiT/HRuaniViEcJ/b4v/i8kHCt8uUTV4MLMW6/EU4eAfSMsaKnKGRcH/fP2RZGi2J6ZOv4RN
	N9BaHro3YsafFirJm6kJPjHUMLhFe1EDtJlvlLhd/JXKF5vYyZjrhThawjwLF5YPL8TBUBCvxLa
	1v5R9s7jnSmoRd4ger07FLQIrlGJthxifDcTSHlBCOUsuatNS9BWwSY6wN31vIWXq7bTSo0Fc6s
	QkoD1lK7/sPNKbgTcQF6qg+ioNb07mB46C4=
X-Google-Smtp-Source: AGHT+IEkYaev64JoIJX7BjN1Kn2qbNsU34l3xF8cI2UjENhYJNPkz42xyMxJqIrN2wkI3tDlo9ovyA==
X-Received: by 2002:a05:600c:1d23:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-4396e6d8163mr14041935e9.1.1739624521315;
        Sat, 15 Feb 2025 05:02:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396713feccsm45558085e9.39.2025.02.15.05.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 05:02:00 -0800 (PST)
Message-ID: <886cb4b9-9d95-4346-9c38-923cb7c69036@linaro.org>
Date: Sat, 15 Feb 2025 14:01:59 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kconfig: Mention IS_REACHABLE as way for optional
 dependency
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
 <CAK7LNATqSPBnGfVXCfJq7oCtE1ge4-L5QY6gVx8_chpmKDQusg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAK7LNATqSPBnGfVXCfJq7oCtE1ge4-L5QY6gVx8_chpmKDQusg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/02/2025 13:54, Masahiro Yamada wrote:
> On Sat, Feb 15, 2025 at 8:42 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Several drivers express optional Kconfig dependency with FOO || !FOO,
>> but for many choices this is neither suitable (lack of stubs for !FOO
>> like in HWMON) nor really needed and driver can be built in even if FOO
>> is the module.  This is achieved with IS_REACHABLE, so provide cross
>> reference to it.
>>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/kbuild/kconfig-language.rst | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
>> index 2619fdf56e68..66248294a552 100644
>> --- a/Documentation/kbuild/kconfig-language.rst
>> +++ b/Documentation/kbuild/kconfig-language.rst
>> @@ -194,6 +194,8 @@ applicable everywhere (see syntax).
>>    ability to hook into a secondary subsystem while allowing the user to
>>    configure that subsystem out without also having to unset these drivers.
>>
>> +.. _is_reachable:
> 
> Instead of this, could you move this hunk below ?
> 

Ack

> 
> 
> 
> 
>>    Note: If the combination of FOO=y and BAZ=m causes a link error,
>>    you can guard the function call with IS_REACHABLE()::
>>
>> @@ -580,10 +582,15 @@ Some drivers are able to optionally use a feature from another module
>>  or build cleanly with that module disabled, but cause a link failure
>>  when trying to use that loadable module from a built-in driver.
>>
>> -The most common way to express this optional dependency in Kconfig logic
>> -uses the slightly counterintuitive::
>> +There are two ways to express this optional dependency:
>>
>> -  config FOO
>> +1. If pre-processor can discard entire optional code or module FOO does not
>> +   provide !FOO stubs then in the C code :ref:`IS_REACHABLE<is_reachable>`
> 
> Instead of the link, please move the code example at line 200 to here.
> 
> The note at line 197 is not strongly related to the 'imply' keyword.
> 
> 
> One more thing, please document the drawback of IS_REACHABLE.

Ack

> 
> It is true that IS_REACHABLE() resolves the link error, but we
> will end up with run-time debugging.
> 
> foo_init()
> {
>         if (IS_REACHABLE(CONFIG_BAZ))
>                 baz_register(&foo);
>         ...
> }
> 
> Even if CONFIG_BAZ is enabled, baz_register() may get discarded.

Hm, why would that happen? For compiler this would be "if(true)", so
what case would lead to discarding?

> Users may scratch their head why baz_register() does not work.
> Due to this reason, IS_REACHABLE() tends to be avoided.

I would rather say IS_REACHABLE should be avoided if someone really
wants to document the dependency, not optional feature.

> 
> 
> "depends on BAR || !BAR" is configuration-time debugging.
> 



Best regards,
Krzysztof

