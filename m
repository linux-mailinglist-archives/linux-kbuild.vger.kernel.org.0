Return-Path: <linux-kbuild+bounces-10095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D7CBB753
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Dec 2025 08:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81E123008886
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Dec 2025 07:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A9A29A300;
	Sun, 14 Dec 2025 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caBgqtMT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F69428507B
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Dec 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765697675; cv=none; b=VcnB6DBtThhmd7bsfVTYRpL8m2+z26sBGR/7RywP431rrJP0IZ//EweEG5lVROR1C+LiT7VL0aNI4XcN/ee6KsYxJOc1FpV0kOceMuBTtx01wWaCRJAIAGUkAwP1qorcVGCRPnjMCfnhA5cpmVOqfUm7mVsUWdOT7WGfh9Ndj1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765697675; c=relaxed/simple;
	bh=FVxIlAKuTuRT11DwsMiqIbBYGhbAiF+XA+LYL1zo2gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4JJoOJ91F99r2i80W3/N9yluT0yMkd8rQFML3PQXoDnAfjrQyBrMbNCYiGYn9zLwxOShSeEdsXVwh8kap+lfoGcgq+Vnu/O5HdekxbaxT398zGqq7P4wCqHBvK4qFL6sC14CEiNjTaQdKgN1Rx1c476nShhgYBNnB26j3tMAOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caBgqtMT; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bf1b402fa3cso2416849a12.3
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 23:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765697673; x=1766302473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRn1RbbVVYNiiCpJThw73EOp5BTjJZAt0+REstZc+hw=;
        b=caBgqtMTulwlXhh93hcKSUs0xu7K8V4YRTW8YuUX6J/kRWXqYWZPzjyql5NblDdwJs
         ra3haBTSHmjT33HYkRrC4c3H96WFvWsjPSbA+zyXzybi+R+VYSXSJn89pdsHqdAOBh5U
         GPVZQ8iSCZBWNe1JOSMSAOY7ZXIrinbOI+emjqOYjQQXZHoBNMeLkFikQpYriTo1yB+T
         5pTsYgJQGvaHlmlKv4DKqrD+JAcjLG3fL2eNdC+GVsKYpw0Nm4oUA5SkmCFw+yyRk5CK
         ATtDMEL582xSfTXi0wnK4m20E6wWNYhGUojB0sdOz20K4bA3R3AqWvAwmCZjj0cht4R5
         jQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765697673; x=1766302473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRn1RbbVVYNiiCpJThw73EOp5BTjJZAt0+REstZc+hw=;
        b=tgp2Ea204Xwae2UXHxfAX6TgdxSpqqtbE0YuiPpb3sKsQ3vcaRYUynQaUcGEB+LjYK
         VUhvzroH1ETqnTo9Oew9kPdlgVTF/fdcLEZvhxBCRcDRcYjpaK61Cwi5yEkQm2b93Lbj
         ljEnsgWiUZJe99rHRON6cKDnBZgoFXsV3ygucf32jmOwD5N1CSsfQwyaP3UPIAx8JhIb
         J5n0RJkpDmGDbbEBa6d2sDLc4wenjdplcoF8Ua6bgbAfpk9ZQy+Py03HKt2x0bVbQpvk
         xdq3VAKRiFS0Sy6lGCgLrua2mNzf5KnO6LvE3E7ARoVVg0MsncAM9cxssd8MnBMKIYPh
         P3ow==
X-Forwarded-Encrypted: i=1; AJvYcCVDLpjIIfHK6YtkaH/G5U7aGDrIfmFcVizA9o/GhSCsnOfjh+DnYwOyY0f+kFGL8ddHOqrocbiYXQSmqKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxF/5nzBjUqp5ojO0FJc2M9ogYMa2tIhmYkF2zC8Y1go3hPErh
	k6cfRFHNw3AaaYcf82MnZQn6AUeUQBDuqxOzAf0D9ysWBGndnR1YqWm3
X-Gm-Gg: AY/fxX69tXpe7529MqTj7zSmANUMSa3qnLjgTw1EMv+vjoR7ebJPH+KtFRInGG6OabG
	N2M7/SqrB6uQfenQa3t53q7TSRKzDjMNQhShGIWa4D+mfPDQjulb9JYI2ECY1m49xAq9W77gkS6
	iMtYt1T1fH0g7hDApM9k/ZWBx6lp36IyD1LElwe9KN1RabUi+WoFD7oHnWinpV+heY5htKpHEaH
	lhwm6AqbgWjchcEQs+miEjpTz2e4riZ4Grj+igat62eKteUQJccBpHF3zuO+QSHoVj86ZCaDgX+
	Fhopx+5NX0HOA4biKdpnzBb8uxgysOODH6UehTiIuhjFhenml9BFpwA1TSkLMjJaTUQjs/n9uny
	WQ95aD0j3a0llC1AT0RosvShv8bjViM0AUpR2vD3YHga30g02qIG6nVSBSa6MlJpbTvpbL6C7SL
	pd6CpXDo5L6DGph1p8Nv8kCsuBVO1zSS70Qrrc6KklXQWjzcU1fJgolip7vYPaewmGuw==
X-Google-Smtp-Source: AGHT+IHAPA/EnNsgzP0HIlYsXfOj/q3Xg73QhloxXAO45aDmZUzS7OcDiFy9ELh/3UzA7ijVRiMldg==
X-Received: by 2002:a05:701b:2704:b0:11a:61ef:8491 with SMTP id a92af1059eb24-11f34ac1593mr4017789c88.3.1765697673068;
        Sat, 13 Dec 2025 23:34:33 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb2f4sm32890480c88.3.2025.12.13.23.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 23:34:32 -0800 (PST)
Message-ID: <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
Date: Sat, 13 Dec 2025 23:34:31 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/13/25 22:06, Miguel Ojeda wrote:
> On Sun, Dec 14, 2025 at 12:54 AM Rudraksha Gupta <guptarud@gmail.com> wrote:
>> - The kernel boots and outputs via UART when I build the kernel with the
>> following:
>>
>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>
>> - The kernel doesn't boot and there is no output via UART when I build
>> the kernel with the following:
>>
>> make LLVM=1 ARCH="$arm"
>>
>> The only difference being: CC="${CC:-gcc}". Is this expected?
> It depends on what that resolves to, i.e. your environment etc., i.e.
> that is resolved before Kbuild is called.

Sorry about that, I should've specified in the original email. The CC 
resolves to armv7-alpine-linux-musleabihf-gcc.

When both LLVM=1 and the CC=gcc are used, I can insmod the sample rust 
modules just fine. However, if I only use LLVM=1, my phone doesn't 
output anything over UART, and I assume that it fails to boot. 
Interestingly enough, if I just specify LLVM=1 (with no CC=gcc), and 
remove the rust related configs from the pmos.config fragment, then my 
phone boots and I can see logs over UART.


> The normal way of calling would be the latter anyway -- with the
> former you are setting a custom `CC` (either whatever you have there
> or the `gcc` default). By default, `LLVM=1` means `CC=clang`.
>
> So it could be that you are using a completely different compiler
> (even Clang vs. GCC, or different versions, and so on). Hard to say.
> And depending on that, you may end up with a very different kernel
> image. Even substantial Kconfig options may get changed etc.
>
> I would suggest comparing the kernel configuration of those two ways
> (attaching them here could also be nice to see what compilers you are
> using and so on).

postmarketOS uses kernel config fragments and tracks the latest linux-next:

- 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/devices.config

- 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/pmos.config

- build recipe: 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD


The only thing that changed was whether CC=gcc was specified or not:

https://gitlab.postmarketos.org/postmarketOS/pmaports/-/commit/b9102ac5718b8d18acb6801a62e1cd4cc7edc0cb

> Cc'ing Kbuild too so that they are in the loop.
>
> I hope that helps.

Thanks for your help! Always appreciate your presence. :)


> Cheers,
> Miguel

