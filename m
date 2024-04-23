Return-Path: <linux-kbuild+bounces-1679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A59C68AF3EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 18:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C917E1C230D2
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 16:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A9513FD6E;
	Tue, 23 Apr 2024 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WC0sD1+C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658B13D508
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 16:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713889456; cv=none; b=hsGMkwW81H93UVSQ0plJUI6s1VrjGqvWHPuaLjiNCrQpT0A9U3opOeTxCrP5La3qkElVCngKDiSIPD7S82jvmc2ca6y2lyLDn40Q/61Gjv/fn2yCMg5a32W88GOkx/EstqRwttn5ZGj7+LMuveyNqbUfST5KG9+0ZR/VHomJPGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713889456; c=relaxed/simple;
	bh=+tdsTWcu5uZanT7zFCmikn7iEc1JLzdiEfizbaR/wz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ly8IG03/ObAYq8caVWu2BXO9UZfj3Fg9TJNRLUiOAZXugJnKyC+kccmcOLWdGMjowSdYqQ3/CLV8NIyjoo6LQ3VofiBJxXhPZzHh1mrj5PmdI5LTN7EyIJsfgCSMlC2s5rNYwFq5ts7p4BeFJ7eFFIh49C/I9nt0zRMgp1i2ugg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WC0sD1+C; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2db7c6b5598so77277331fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713889453; x=1714494253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXsBJiPCF6EJaK39O0Gdhcu0AFBTCRBlun7yBYbTEfc=;
        b=WC0sD1+CZqLKeR4tx/5uAjJeFoNz5tYvU+xSZ9Zc6I2+fVkislD9qUC/0Fn61irriP
         +yiM1wNpJUerNp6DI4Bw/XQsZEMEqwSU0WIa7RUw6LujL3NsPmoVFnoHqosOepkqiD5P
         TAaZ7uo+eTSybxBiYdTZK2GLCuJ5Cp+yWSdoqPlHOprTL3fVywgZz3+dgDJzBl5x/ee0
         kRB15pjB7KSb4A7OC06VFXWEDqydkpzD+xB34VAlP7L1uwbB7NEmSWQFQpdNEc8UjFhI
         bYww7EHfFekQ3wElJbJc1BT8/HCpHCFXL8wMOdhzNvn188KmwucCGHnwrf7KwObHmV1k
         48uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713889453; x=1714494253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXsBJiPCF6EJaK39O0Gdhcu0AFBTCRBlun7yBYbTEfc=;
        b=GZKo9UPolCWkAvXGwd185m75sQVTnLmJtcM/0A+tSMSVKc6Q5jl2kPGmJ0jfO0E2FF
         /vsFVB/rpK9P0lLQLQW1D/HN4NHLZbhCq3Joe4hsYhdWL1Knybp1UWh7areSYXH7Slvx
         Uup4PrHf8jjty4XoasGqxChbv7r5IkmNITl+zzOSuYtnSGvLMQlJZp66TEnWM+u9FDEg
         QtFgF2FXXFOuClbogNoQ+07yOfUVJ/KmdoeAyL+ElC2eI3e9GPTLco0tZo9D4u8xDNbZ
         VXl0ll4YfotKfYe1f5rendGzhLyWvLXgVKXNH7soNFOMCy+PCjPRlnPOehzbjZptr00r
         HBFw==
X-Forwarded-Encrypted: i=1; AJvYcCVMIa/AEh4i4Iy0LK64eaSAjOAvOLlcC8gsxLLjHQ6wqUsvLEuuwBzcCkyD4ixxgGcXF1jFyIUoMZ3xkWGmsA6KOCpdvK1xgLpePxs/
X-Gm-Message-State: AOJu0Yyx0JfVNok2gpwY0wpWlau2jQNMH2omv+WnEr6v8Cq3ZmzH5GU8
	11R3HU0N1QiVGLJouCFI4hIkhxlT4EWGi6XGys+1s25VQN7sx9kj6LZC93gMnGk=
X-Google-Smtp-Source: AGHT+IGty4tVE0wt57SqmxXH6DbHe9+jZEXLxRpdlTX809Ie8ckAScVNfBVThnijn7lxg0pVJPm0bA==
X-Received: by 2002:a2e:9a95:0:b0:2da:9f24:44a8 with SMTP id p21-20020a2e9a95000000b002da9f2444a8mr9481892lji.11.1713889452664;
        Tue, 23 Apr 2024 09:24:12 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u25-20020a2e2e19000000b002d4746112fesm1716288lju.38.2024.04.23.09.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:24:12 -0700 (PDT)
Message-ID: <77482887-4be9-4c33-8b2c-e30e8ccfbf57@linaro.org>
Date: Tue, 23 Apr 2024 18:24:05 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] kallsyms: Avoid weak references for kallsyms symbols
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>
References: <20240420145303.238068-2-ardb+git@google.com>
 <CAK7LNARGZZC=5Pcy8qBpp1E94hRHHHdUu7KxVudH1iT-yugs=g@mail.gmail.com>
 <9fda72fa-e5e5-4d45-b268-dd98d28fb5a1@linaro.org>
 <CAMj1kXERSHjh0k9uCmYuNf31Fg79sd_6EHuS=Y_-xEdNGWeiAw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAMj1kXERSHjh0k9uCmYuNf31Fg79sd_6EHuS=Y_-xEdNGWeiAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/23/24 18:22, Ard Biesheuvel wrote:
> On Tue, 23 Apr 2024 at 18:01, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 4/22/24 18:02, Masahiro Yamada wrote:
>>> On Sat, Apr 20, 2024 at 11:53 PM Ard Biesheuvel <ardb+git@google.com> wrote:
>>>>
>>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>>
>>>> kallsyms is a directory of all the symbols in the vmlinux binary, and so
>>>> creating it poses somewhat of a chicken-and-egg problem, as its non-zero
>>>> size affects the layout of the binary, and therefore the values of the
>>>> symbols.
>>>>
>>>> For this reason, the kernel is linked more than once, and the first pass
>>>> does not include any kallsyms data at all. For the linker to accept
>>>> this, the symbol declarations describing the kallsyms metadata are
>>>> emitted as having weak linkage, so they can remain unsatisfied. During
>>>> the subsequent passes, the weak references are satisfied by the kallsyms
>>>> metadata that was constructed based on information gathered from the
>>>> preceding passes.
>>>>
>>>> Weak references lead to somewhat worse codegen, because taking their
>>>> address may need to produce NULL (if the reference was unsatisfied), and
>>>> this is not usually supported by RIP or PC relative symbol references.
>>>>
>>>> Given that these references are ultimately always satisfied in the final
>>>> link, let's drop the weak annotation on the declarations, and instead,
>>>> provide fallback definitions with weak linkage. This informs the
>>>> compiler that ultimately, the reference will always be satisfied.
>>>>
>>>> While at it, drop the FRV specific annotation that these symbols reside
>>>> in .rodata - FRV is long gone.
>>>>
>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>>> Cc: linux-kbuild@vger.kernel.org
>>>> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
>>>> Acked-by: Kees Cook <keescook@chromium.org>
>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>>> Link: https://lore.kernel.org/all/20240415075837.2349766-5-ardb+git@google.com
>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>> ---
>>>> v5: - avoid PROVIDE() in the linker script, use weak definitions instead
>>>>       - drop tested-by, replace reviewed-by with acked-by
>>>>
>>>
>>> Applied to linux-kbuild. Thanks.
>>
>> Hi, this commit seems to break call traces, resulting in output like:
>>
>> [    2.777006] Call trace:
>> [    2.777007]  _text+0x89e7e8/0x39e0000
>> [    2.777008]  _text+0x89e82c/0x39e0000
>> [    2.777009]  _text+0x2b940cc/0x2bd2a90
>> [    2.777011]  _text+0x2b941a4/0x2bd2a90
>> [    2.777012]  _text+0x145dc/0x39e0000
>> [    2.777014]  _text+0x2b51184/0x2bd2a90
>> [    2.777016]  _text+0x18fc6a4/0x39e0000
>> [    2.777018]  _text+0x15644/0x39e0000
>> [    2.777019] ---[ end trace 0000000000000000 ]---
>>
> 
> This patch triggers an issue in the compiler, which appears to perform
> constant propagation on variables defined as weak, and this is
> definitely a compiler bug. (A weak variable can be superseded by
> another instance from a different object at link time, so the compiler
> cannot make assumptions based on the version of the variable it
> observes at compile time)

Sounds like fun..

> 
> It has already been dropped from the kbuild tree.

Thanks!

Konrad

