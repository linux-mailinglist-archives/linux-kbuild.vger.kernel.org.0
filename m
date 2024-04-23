Return-Path: <linux-kbuild+bounces-1677-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E86888AF365
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 18:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51C0286CCE
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 16:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07A913CA8A;
	Tue, 23 Apr 2024 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2m7aQoU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E184013CA83
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713888112; cv=none; b=XqjaSJ1Ld7sBMkwcBWp0K6qzx5a+om7i894pddNTk2wDfyawEA4woeF4oKl0eUxowqE2TdoKd1+mrFCD2odVxA7GV37qB05lj8kBrcxkR0YlnQWyqxMzQXREPIxEIhClomOwmBbepy2XgLE+f6gt2NMXA5wUX2ybPy0W29sk6SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713888112; c=relaxed/simple;
	bh=8wnNyKJb0veN/MV8Mv57GQlyBKPZWpwn557cXY3kO/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHPyZhRIZcuVbJo8p8eEYsdET9f/Y5edR8pEkJV5HhJk0pVHiIFhkdZrGLF1fTFD0m2tOernTi0w/UMPRkq0x1gFqUnF4+zBASDtHYcEH86tk7tq1hLrOGqYMD9hFEdpMnJgL1824ThM8DwptIE31rpSgLoeCDAk8omyzlOz3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2m7aQoU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51bafbe7509so1136637e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713888108; x=1714492908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyWNLoaFq49ed7kQ5m7rCchd3rgIf0cIGZ39xj4WFV4=;
        b=w2m7aQoUYXILnLTSXN9Z+A+zXZQ9SMcjxm0pLqo6acWhckZKywDUvGStoA+/xFoO+m
         5pKF722C4pLY098fzWIKvN7UDAgBxR+30LDcXAz5GmtfmO9fVPiCki8H/uob4JfW5y3H
         sqSBZTMIsh0V24LvIo5nYKXeSzdA0Y1Vik+Lzzki/PG1iURupBGu0/x/xAsvft4EsfRm
         7sEtX28YFiBqv7qd1zDNJGbB6x8ZNlBkcaDxvjR1whlqLF1/MMqrFoN62aJvSfjnWOa0
         72q8XZJAjEm95kt3NCa51F0CktKIbhLKnLLeH1LDvIKwIpU7ZXm92NLTfGnatzHQiKSY
         F0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713888108; x=1714492908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyWNLoaFq49ed7kQ5m7rCchd3rgIf0cIGZ39xj4WFV4=;
        b=fYg8si0vAxnjWIWFeRQryOQ2oPHtWYRLdabu8eMjhQ6reH7Xs1NATzcswZYKsKfeZt
         yLMtuWL/sOb2WiUqnYR4lbkjKBxfbWpfz+akWQ22g1DiXfetdCPvRS/GVM4XQXCPdfXN
         7Wl+8T8Lc7n3krjcJgvaO+RWg1l8iWU9c1VqiYq8Vqvz+C+7SiybZfI6eDAewAKCys5L
         LyRP55UvkkIYJXtr+eQUr/Bf6DJZBU+WSS3o7bVdGEDmsHpfccdCvORfW/jos9QHW1HL
         ut5bUPqpFMJgkrOhFQlpedtHQCYCaOFd3L3/HZ+o8DG9xt/Qyvm52Bo4ugVWqLKSOfiG
         pdUg==
X-Forwarded-Encrypted: i=1; AJvYcCViBEzMzQmQyao1GSpyxvld+LiytY9sVX6Rim1Qcx/NmxvU9ht3JHZkZ3wnsjny9K1y9LCoVAFgQxpvEmDnoudYmc+KMRSxmLpKxA/k
X-Gm-Message-State: AOJu0YzD8WdX4tbW3uIRsA5BNQn62BkN5JlhEl5j1d6eQYQ1FbHYw2wR
	o0Md+PUOBM4D+s7433Ta1YUT8adI9voTdqaJQlUz+1WIsPPntF8xX6ibsJTLTno=
X-Google-Smtp-Source: AGHT+IEMJHpXJqvWsOsvt5ybObDs25KSQ0lIYxTGWxZZJhc/tgLXqpQZOm+GNvAGtkZxSi9w/H+NxA==
X-Received: by 2002:a05:6512:3453:b0:515:9ee7:ce45 with SMTP id j19-20020a056512345300b005159ee7ce45mr10510574lfr.49.1713888108058;
        Tue, 23 Apr 2024 09:01:48 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r1-20020ac25a41000000b00516c1fa74e3sm2081333lfn.207.2024.04.23.09.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 09:01:47 -0700 (PDT)
Message-ID: <9fda72fa-e5e5-4d45-b268-dd98d28fb5a1@linaro.org>
Date: Tue, 23 Apr 2024 18:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] kallsyms: Avoid weak references for kallsyms symbols
To: Masahiro Yamada <masahiroy@kernel.org>,
 Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>
References: <20240420145303.238068-2-ardb+git@google.com>
 <CAK7LNARGZZC=5Pcy8qBpp1E94hRHHHdUu7KxVudH1iT-yugs=g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAK7LNARGZZC=5Pcy8qBpp1E94hRHHHdUu7KxVudH1iT-yugs=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/22/24 18:02, Masahiro Yamada wrote:
> On Sat, Apr 20, 2024 at 11:53 PM Ard Biesheuvel <ardb+git@google.com> wrote:
>>
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> kallsyms is a directory of all the symbols in the vmlinux binary, and so
>> creating it poses somewhat of a chicken-and-egg problem, as its non-zero
>> size affects the layout of the binary, and therefore the values of the
>> symbols.
>>
>> For this reason, the kernel is linked more than once, and the first pass
>> does not include any kallsyms data at all. For the linker to accept
>> this, the symbol declarations describing the kallsyms metadata are
>> emitted as having weak linkage, so they can remain unsatisfied. During
>> the subsequent passes, the weak references are satisfied by the kallsyms
>> metadata that was constructed based on information gathered from the
>> preceding passes.
>>
>> Weak references lead to somewhat worse codegen, because taking their
>> address may need to produce NULL (if the reference was unsatisfied), and
>> this is not usually supported by RIP or PC relative symbol references.
>>
>> Given that these references are ultimately always satisfied in the final
>> link, let's drop the weak annotation on the declarations, and instead,
>> provide fallback definitions with weak linkage. This informs the
>> compiler that ultimately, the reference will always be satisfied.
>>
>> While at it, drop the FRV specific annotation that these symbols reside
>> in .rodata - FRV is long gone.
>>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: linux-kbuild@vger.kernel.org
>> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
>> Acked-by: Kees Cook <keescook@chromium.org>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>> Link: https://lore.kernel.org/all/20240415075837.2349766-5-ardb+git@google.com
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>> v5: - avoid PROVIDE() in the linker script, use weak definitions instead
>>      - drop tested-by, replace reviewed-by with acked-by
>>
> 
> Applied to linux-kbuild. Thanks.

Hi, this commit seems to break call traces, resulting in output like:

[    2.777006] Call trace:
[    2.777007]  _text+0x89e7e8/0x39e0000
[    2.777008]  _text+0x89e82c/0x39e0000
[    2.777009]  _text+0x2b940cc/0x2bd2a90
[    2.777011]  _text+0x2b941a4/0x2bd2a90
[    2.777012]  _text+0x145dc/0x39e0000
[    2.777014]  _text+0x2b51184/0x2bd2a90
[    2.777016]  _text+0x18fc6a4/0x39e0000
[    2.777018]  _text+0x15644/0x39e0000
[    2.777019] ---[ end trace 0000000000000000 ]---

Konrad

