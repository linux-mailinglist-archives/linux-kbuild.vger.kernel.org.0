Return-Path: <linux-kbuild+bounces-10691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29566D3B52A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 19:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54A9B30006F2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 18:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A9423C8AE;
	Mon, 19 Jan 2026 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix5ADGUe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEBF1F09A8
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Jan 2026 18:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845980; cv=none; b=SYKaq5FHKOjI08MRpciBMYBlRaLc3KgVRf2UukMMdcw6K2vy6VvcDxpmuCvyJomnnbgCyM8KP+FkHYxN7HoFnziTR7dpWnhUEEarFoHsgqTanaw6+71RhstlGi31lHNA9+RylDMgIKiS39KVWQs6PPfP3T7bN8iQgH57Jo8y7Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845980; c=relaxed/simple;
	bh=bj95vgAZVPhJ5iLFRK0Wh3k7CRZDgw7L+i/67I9oJrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqkAxGaMNPB5UcOHQIIz7kA19bHv1YeRP/kEjXJPczv/+K6VN7P5M45NzwWqafXZ9jemVvNxWFr66hs1dn7OHzf8axVaM/9p3sGiR6IChO+IWRFXN1CpjGAkEAagUo486K98fECi50ZpTMsel7600Pz9FFERG8qjFYUpLSdRqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ix5ADGUe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee598d00fso3209095e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Jan 2026 10:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768845977; x=1769450777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vSQyY/sbw+WW+mdZ495+fmp7dM6Z9X4lGB7EkpPTED8=;
        b=ix5ADGUeSpyEFQnJnOaemky2StDp23vdHu+Cs64XAVhDrT+P/COQW/tAdguM7STF0K
         YpkSE+5i/l30PRoL0m154y+3pHup542J7qSX3YwRFibGmRHfCDOldOwkocsrbWqcnyqT
         R7O3HIl9f4C/hnLjGrUoCgSQgVgqF4hMcBPFox47XP4q0iJfvfUT692kXimPQ2AJPK1l
         hgMAEG4fO0t7hgGSvdC8NNnVshJN1Ok04fg4xIRRjuKUnEDAos74Uzbzv49W6xxVTETP
         JhpDltm5gPHdMMkwkBqFQpdpv78rgtW/7ROGcxRL4rd8F5/QZp2brzzO7RJcJo/S+FV2
         IR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768845977; x=1769450777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSQyY/sbw+WW+mdZ495+fmp7dM6Z9X4lGB7EkpPTED8=;
        b=OJ7FsUF/X2DNjnzjYowP9PsukByA5o5QULElxpqYW1scK82H+t0GTahDetr2y3spQ5
         R+Gv8vK6dlqxMFtKX2SB2ZReYHrTvRh0E7l0/TsHzSBPNHDdgjiMlMPVmTi/j9MV9whB
         GlK5e+G4T1YIGKydqg8Ilg7Dj0VvHV2fqKNbicBOIuztlcqDg7KZ5fdCqve4PT/NpL9T
         IrPxXS7oNOn7SUfkSNVOJimYxFJk1AqFg85lWTou+iKo8pmxcrnkpkWu4o3bc9xFbiMp
         JzxUt3N6B+qQozTRQ7jZeR96T1BBuEmB2lgzZU4/71pP6RX4w4ShWH4unAByh4j5NhHT
         NfMg==
X-Forwarded-Encrypted: i=1; AJvYcCXCGQiw9W1818KD/HPOnRDO/bYX58qHe4fxJTPvm5ow9cSQw2iRB4rdja+oDO7C1DZprH/AOew8i2RHGHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze3lizFd24B7NIbZluCTfoIoC9U2jXhmbJvSwQKxJoFVru7IoZ
	yecRRopOKRxu3M8UFZP5ZQNellSZ8/bsDSfmTOkOY9SAf8nX3i9Yl6j9AQeDag==
X-Gm-Gg: AY/fxX7V8q/Ax171vuTV28zoDRtwsY1R0vvBspg0SgLiWlI8/2B60qZ/MwVwkSdjC/h
	TaKX5rl+S+/83buZmvkaRtmoUKepAjUeGfGY2PWMhwwTytmh6dfiEmpLhkHkZ1kv5Tcb1TaCfpW
	ahKCbnv09vK5hneEhsJbhDDqQvH/GVgmw/oT9fwCpC5c3aeLCW5qCclipMs8uYlhOc/3lCFNT0m
	U94xMC1c3n4k2BHg4hWKnRzPTMsV5tDHnFdXhbCtdM5gRQDyKND1FvYjqOjGt7hDzqsm7bD+N2w
	PnnVD+SnDhOuXNXDCUrdFzFNoCbII76YQP8yJfKSnF//En8RUJttYO3iEZWqw87KaMYFlR/tMZS
	rsGz6ErqRH97ZGxJS/V8ydnRcZgUHuyhghFDnujFjvvW7BL9KHf6EHKtfyBEvl4IHX+RP+gTBt2
	mxzMmkY59NkLnZRem1NA==
X-Received: by 2002:a05:6512:340e:b0:59d:c490:3ab9 with SMTP id 2adb3069b0e04-59dc4903b42mr330960e87.0.1768840488602;
        Mon, 19 Jan 2026 08:34:48 -0800 (PST)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3a6ff6sm3432421e87.102.2026.01.19.08.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:34:47 -0800 (PST)
Message-ID: <e273571e-ab8f-46d6-a44e-c1d0d06d3cbf@gmail.com>
Date: Mon, 19 Jan 2026 17:33:35 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, corbet@lwn.net,
 morbo@google.com, rppt@kernel.org, lorenzo.stoakes@oracle.com,
 ubizjak@gmail.com, mingo@redhat.com, vincenzo.frascino@arm.com,
 maciej.wieczor-retman@intel.com, maz@kernel.org, catalin.marinas@arm.com,
 yeoreum.yun@arm.com, will@kernel.org, jackmanb@google.com,
 samuel.holland@sifive.com, glider@google.com, osandov@fb.com,
 nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org,
 akpm@linux-foundation.org, Liam.Howlett@oracle.com, kees@kernel.org,
 jan.kiszka@siemens.com, thomas.lendacky@amd.com, jeremy.linton@arm.com,
 dvyukov@google.com, axelrasmussen@google.com, leitao@debian.org,
 bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com,
 urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com,
 andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org,
 vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com,
 samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com,
 surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
 yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com,
 kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org,
 bp@alien8.de, ardb@kernel.org, justinstitt@google.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, x86@kernel.org
References: <cover.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <cover.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/12/26 6:26 PM, Maciej Wieczor-Retman wrote:

> ======= Compilation
> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> seem to have support for KASAN tag-based compiler instrumentation on
> x86.
> 


It appears that GCC nominally supports this, but in practice it does not work.
Here is a minimal reproducer: https://godbolt.org/z/s85e11T5r

As far as I understand, calling a function through a tagged pointer is not
supported by the hardware, so GCC attempts to clear the tag before the call.
This behavior seems to be inherited from the userspace implementation of HWASan (-fsanitize=hwaddress).

I have filed a GCC bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=123696

For the kernel, we probably do not want this masking at all, as effectively 99.9–100%
of function pointer calls are expected to be untagged anyway.

Clang does not appear to do this, not even for userspace.

