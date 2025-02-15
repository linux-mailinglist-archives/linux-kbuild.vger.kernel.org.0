Return-Path: <linux-kbuild+bounces-5764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE44A36E61
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 14:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2B9A1894999
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 13:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC7512E5D;
	Sat, 15 Feb 2025 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="twkzlFMg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672311AAA1A
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624767; cv=none; b=OnxS31xB0LVSC/Pn7CAl59JGONNVo4m5eI0JyO4Txi91RrGLrcZNjFc+wPwsJjWd5ZWFEaMBtsMggBSPSugADHG5OB+zbn4boP7FEI8bBHle5lYZxINV15yOaOxMwh5//j/k1VqUtA802RnciU7xm5wI5lc+0WQw9wWYtXGXDxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624767; c=relaxed/simple;
	bh=LegW7uNViCWJ35+t2kn55rkZlppdNRxTGCe7C3E8QXY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=moInDaMoD0Q2ytg1/3I8q+x1mt0Wp2HPAsdTSJ0bNTCoQrKx3Rim1r9KSioLr+1bJgJXGxtzJmWNNmrZmrGqmXD3S6RyUr6/5dGLhPGarfOoHIhkI+UYHAzgoWOwh0PKqR0IFCTvPtK7cvxMe3EWStttIcHkOggkeRvBoC2Vu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=twkzlFMg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38f29a2c6a2so342838f8f.2
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Feb 2025 05:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739624764; x=1740229564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rdnNcfOULKMswbKDg7L33UkLvsdxqxjs2riP/giRrvs=;
        b=twkzlFMgT4R0PbMf4yaH3OCON+dYipCS8HGXYck8Mcg8fWuaZf0ZBSJz0e8NqqA4dM
         uUniXm0rgV0qwmtv5P5DJ5g+IuiGDcGuB+P8L+qQpe+7VwNEga/9WqW4PWg+zUIbq3Io
         iCKEmdA/RJuRU8GV5QbKfrA9V3HJrVjsvIPODlN2XDskr32TiByVKORwjDG5EUkLuFem
         BoNAiHKPhSrwoSBG8ppS0uv1NPj/E9XW0n/lKNgnhDh7Te9RrVwXbwgwXCqfEre95Be6
         qGfYm4Z+UcTe6ghs4z6ed/6xZc0i4qJ4jbf/mYUUAQHiXc+rVCCwucfCdkdVe943jn5S
         PIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624764; x=1740229564;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdnNcfOULKMswbKDg7L33UkLvsdxqxjs2riP/giRrvs=;
        b=AZSWL00ljJkI6ckkAhZ5NwE2U80VvY2ZgslBIk7aBcDL2CTxghYo+FL+8Y3lvO7hbC
         EWDLtLUXl9WmTdGwMjJb0MzV6wGCbfvMN69CFWr5knLaSGbw/cQ1J8xKO+YQQ7h43lTZ
         XS8ftLOCp0B3jS1UHRgBclOtEA3DolMfPaCyPZrxiU0bCvy8vWieMsB2NJ2YdhNIvmwM
         baCG4AcjMaCzUQnq+xc/F1nV0dym+oX3E80PKGarQlLA2AsvZx9CalyH23ysXsMy/gGF
         Ghi/UcEf9UV32L0VknmfKmq+5yU5KwzB81W73R0vhOQC+iu05Gx17qmOj+xRw4r1knVG
         4jaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXADQt7k1gUmN8hrBnpsERvdP8SaJ0AntTF2PVXJ66P8c3zo0+MyRADxReWX7lcrV1w1mBVB/FxEz4i1fQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6/EcLOSHICEHjy/Cqh+1w0BYwnWnO2cIg2e8g7/5mo4C1TCz9
	IWaybuPyDhRLUmTRu+Qtpizs561tDupu5QJALTYSAk71B5yHyrjR2ssj27KsYT4=
X-Gm-Gg: ASbGncs/b2I+P4vRfn07Cqj+6bgTKANp8s5DxHXWl+zNMR5DlgQZ/9n+D8XHRzE3xAR
	XVGTXIrqQtg/eYuDPIBBvt4Odpeazr/xFxlI5sEctsZzhcTrzJOp6WAoTLPSCN9kA6P5OZ99MwL
	dztsCGuI7xSSslxEDY1+6GL4P5WMmlghrw/06M6C+K6HS0e1Pn3MEEYSM6iKUEgOFi8buVQOaBi
	Gqvtwo61pw5LqL22+RKi5X321iYyCA4IPruLG0YU5lHWNCwwY45/a64BrjYOPmPzIN3Durvaegl
	HugMPm4hKlLnfKCqFumBuAQPRACM9EuP1DE=
X-Google-Smtp-Source: AGHT+IHgFfqzOyh8YOkTFwMiAGZ+drlj5ukXDY1hDHlBflrhlFazNLrZU3s4XdAUR69ZWZnyBTqsIw==
X-Received: by 2002:a05:6000:4185:b0:38d:eb4b:f9aa with SMTP id ffacd0b85a97d-38f33f2c18fmr1005687f8f.5.1739624763697;
        Sat, 15 Feb 2025 05:06:03 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm7332517f8f.16.2025.02.15.05.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 05:06:03 -0800 (PST)
Message-ID: <a09b2636-dc15-4970-81dd-a16b5a166464@linaro.org>
Date: Sat, 15 Feb 2025 14:06:01 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kconfig: Mention IS_REACHABLE as way for optional
 dependency
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
 <CAK7LNATqSPBnGfVXCfJq7oCtE1ge4-L5QY6gVx8_chpmKDQusg@mail.gmail.com>
 <886cb4b9-9d95-4346-9c38-923cb7c69036@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <886cb4b9-9d95-4346-9c38-923cb7c69036@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2025 14:01, Krzysztof Kozlowski wrote:
>> One more thing, please document the drawback of IS_REACHABLE.
> 
> Ack
> 
>>
>> It is true that IS_REACHABLE() resolves the link error, but we
>> will end up with run-time debugging.
>>
>> foo_init()
>> {
>>         if (IS_REACHABLE(CONFIG_BAZ))
>>                 baz_register(&foo);
>>         ...
>> }
>>
>> Even if CONFIG_BAZ is enabled, baz_register() may get discarded.
> 
> Hm, why would that happen? For compiler this would be "if(true)", so
> what case would lead to discarding?
> 
>> Users may scratch their head why baz_register() does not work.
>> Due to this reason, IS_REACHABLE() tends to be avoided.
> 
> I would rather say IS_REACHABLE should be avoided if someone really
> wants to document the dependency, not optional feature.
I hope I got your intention right below:



@@ -580,15 +570,31 @@ Some drivers are able to optionally use a feature from another module
-The most common way to express this optional dependency in Kconfig logic
-uses the slightly counterintuitive::
+There are two ways to express this optional dependency:
 
-  config FOO
+1. If pre-processor can discard entire optional code or module BAR does not
+   provide !BAR stubs then call can be guarded with IS_REACHABLE()::
+
+       foo_init()
+       {
+               if (IS_REACHABLE(CONFIG_BAR))
+                       bar_register(&foo);
+               ...
+       }
+
+   Drawback: this might lead to run-time debugging, when looking why
+   bar_register() was not called.
+
+2. Otherwise (and module BAR must provide all !BAR stubs) use the slightly
+   counterintuitive Kconfig syntax::
+
+     config FOO
        tristate "Support for foo hardware"
        depends on BAR || !BAR
 
 This means that there is either a dependency on BAR that disallows
-the combination of FOO=y with BAR=m, or BAR is completely disabled.
+the combination of FOO=y with BAR=m, or BAR is completely disabled.  Unlike
+IS_REACHABLE(), this option favors configuration-time debugging.
 For a more formalized approach if there are multiple drivers that have
 the same dependency, a helper symbol can be used, like::




Best regards,
Krzysztof

