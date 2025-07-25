Return-Path: <linux-kbuild+bounces-8176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6E7B1204E
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 16:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84D471699EE
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 14:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7A1246760;
	Fri, 25 Jul 2025 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="QqmmkhH+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A421C9E3
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454608; cv=none; b=tGqzwd2TXLCPWueShyDyVFeUwSUklzt2nSWGXAdyjRxVjmZo9UiGg59eK0xJH530on8/TMaPxttGZBf0o0VQC27EaPjCPpm7fGUXq+6ubxrYdB/p7v1y1tlJL5t+xEcG5KtrrgsT/8mrEuamQiHB5KtbuxWal03YoTZhm4rOVG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454608; c=relaxed/simple;
	bh=ysgHg5Dj/aps0NLD2cY4ifNfa0Mk7jUSH1XfLsrAuuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJHzBrkTkqCF04z0fzrL6uwy6w+3X3wcelgAVEkKlXBEFN83EFETFeEooo2zws3A7OntCV4QFcO60p2mx79g5uv9zc08gr4Uh8ryona95/LfiuIUS7t7PMI2/s7StNBeotf82aIaZE8j8P5/ujrtFr4jBXnkDTcKSPdIAuPXlys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=QqmmkhH+; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 17E503FCD1
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753454604;
	bh=0k2OjtFlklZYYSusmSIAAvwXtZV4jXB/0YYQlrt+7FM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=QqmmkhH+oeELz8SrXkqfveadWYD6f+xVH8sjn1VhlFAIFGN9jd9SfzZ4isziFZ78s
	 dB7LDJAuuc+11oFlJQAdJNCuEbygP8Q9209uinnVNzt3HNgfubaRW2qQ8nJD0qNBnN
	 1w8ze0+3jfL+r1n6Crwzst3r7i5eioJ54AH70pS7jkNBLcXVLE3Owtt8oPKJRKj+zf
	 etpbzFIJxvKm3Ud2vjvllm/Nt6m70SUJajYZf9ECDci+3uYtyOaEaNQL6Ep/xXchrx
	 iVTYOo6pKgbXGmFq+0Yxm0I1NkLwpoWeNVshj0Znpk/2PIzwLyz1uG8a5XWxiPekaj
	 7PO6641c4vGUQ==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae0dffaa8aeso296109366b.0
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 07:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753454603; x=1754059403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0k2OjtFlklZYYSusmSIAAvwXtZV4jXB/0YYQlrt+7FM=;
        b=Ab/ckWWd8hzoHiWTfDjeGdowxbaL/aKloP0lHLlpHnZmJWmzoMkfaV0BI5TfUqCroN
         Lrzdddmrk2OE/Z0ChRqUm6MZbQUvgoQrixVh4ZXC9j5fG/pvZ/BYPnoSZjTPELP/iJHV
         xSrwYsS3nE2H9/BbGqnSE2JE7QHagQWC5o5ZoPLQDaKy84FaZmGC8q2M+jI1mngZBpb6
         jcQpqtFyVO8iCk6V5MLZJaY9nJ+XNGGDsnXLi0/krVZVxUgTvZN/FdWW5ZzQjESnN1ON
         r4tzjijwzbaS1tzOzuvR1iazxPtScqVE59GiTgxUyGKZC97KjRyteouTXBM0NPkWPwSi
         A5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+6qSATefI2+lJ4RSZP5R+QmZLmC2kHyA169gR3Bcb2hBdG4t70b8MtinTYRraBjI2Xj29KRTK2GfUAsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZdD68VFTahL6HsE7AuxfqPKxL1S2PQnFgWRRM/njUFRMjxQ2J
	j6cY/EUiKUi82XHKc6uA+vtMbqjdlIWrxGg1dijjvFDpPxsA5JSyl1607HeDzCTT934eTXcyKBx
	HhPDiKBvMvkub38gWZ5VQNXjxwAj9DhpZRCC9k+XyoLcK3ekp7zy/GnN2j8/c+yYReWw783Hynp
	yqwi1C5w==
X-Gm-Gg: ASbGnct542CK91jIQIQqFEeB2ls1upu30Xt8GL7jG6IUvJBeRY2VPr8y2re+3Jrabix
	HxzprSwTcMBg5WsbG28l+7Bh2KHJk3MOTOgcisScEp0djH9AdgJFFYvUWObzwNGFzEs3F6lECMB
	czToGEzKA6/gLrgooB+h6ADQYnYeh9eNk/b5oBZ2JHBMSudPbUd3zvBbZmNcBYvvjfszgKZxw8r
	1113LYTT0wb6h/Cbx+tuP10STyjw6IU1Am6jNxK1s/EdGuC5kYJ6Ha4c7mYGO3seniNseC09i6k
	N6qS1JILn30FDsYd1SnMMxu/G5YEyZsQZw83pRKFbKaLBEhkwOtyTNaHoNpBVQg5FU6zmE4lI0s
	cOpqOvZvg2U8TxFGRRkQOF/R06Hk5HHkvcVOJ
X-Received: by 2002:a17:907:2d8f:b0:ae9:cd0a:5827 with SMTP id a640c23a62f3a-af61e533d42mr227197366b.20.1753454603582;
        Fri, 25 Jul 2025 07:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLGJ6zB3+OfdWnXfUelODaXvg8HjyVSfwaUZrmP6gSKNspnUl1zTG7y8LUoP5t34erFR1Evg==
X-Received: by 2002:a17:907:2d8f:b0:ae9:cd0a:5827 with SMTP id a640c23a62f3a-af61e533d42mr227194666b.20.1753454603155;
        Fri, 25 Jul 2025 07:43:23 -0700 (PDT)
Received: from [192.168.103.102] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635af9967sm1931166b.131.2025.07.25.07.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 07:43:22 -0700 (PDT)
Message-ID: <d6643810-094b-46d8-b223-b987783d23db@canonical.com>
Date: Fri, 25 Jul 2025 16:43:20 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] riscv: enable landing pad enforcement
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
 <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
 <aIOSqskb_hBAqjIt@debug.ba.rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <aIOSqskb_hBAqjIt@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.07.25 16:20, Deepak Gupta wrote:
> On Fri, Jul 25, 2025 at 08:33:46AM +0200, Heinrich Schuchardt wrote:
>> On 25.07.25 01:36, Deepak Gupta wrote:
>>> Enables landing pad enforcement by invoking a SBI FWFT call.
>>>
>>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>> ---
>>>  arch/riscv/kernel/asm-offsets.c |  1 +
>>>  arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
>>>  2 files changed, 20 insertions(+)
>>>
>>> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm- 
>>> offsets.c
>>> index e4d55126dc3e..e6a9fad86fae 100644
>>> --- a/arch/riscv/kernel/asm-offsets.c
>>> +++ b/arch/riscv/kernel/asm-offsets.c
>>> @@ -536,6 +536,7 @@ void asm_offsets(void)
>>>      DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>>>      DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>>>      DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
>>> +    DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
>>>      DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
>>>  #endif
>>>  }
>>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>> index 9c99c5ad6fe8..59af044bf85c 100644
>>> --- a/arch/riscv/kernel/head.S
>>> +++ b/arch/riscv/kernel/head.S
>>> @@ -185,6 +185,16 @@ secondary_start_sbi:
>>>  1:
>>>  #endif
>>>      scs_load_current
>>> +
>>> +#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
>>> +    li a7, SBI_EXT_FWFT
>>> +    li a6, SBI_EXT_FWFT_SET
>>> +    li a0, SBI_FWFT_LANDING_PAD
>>> +    li a1, 1 /* enable landing pad for supervisor */
>>> +    li a2, SBI_FWFT_SET_FLAG_LOCK
>>> +    ecall    /* check for error condition and take appropriate 
>>> action */
>>> +#endif
>>> +
>>>      call smp_callin
>>>  #endif /* CONFIG_SMP */
>>> @@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
>>>  #endif
>>>      scs_load_current
>>> +#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
>>> +    li a7, SBI_EXT_FWFT
>>> +    li a6, SBI_EXT_FWFT_SET
>>> +    li a0, SBI_FWFT_LANDING_PAD
>>> +    li a1, 1 /* enable landing pad for supervisor */
>>
>> The SBI specification calls BIT(0) "LOCK".
>> Shouldn't we define a constant for the lock bit instead of using a 
>> magic value?
> 
> See below `li a2, SBI_FWFT_SET_FLAG_LOCK`.
> 
> "li a1, 1 /* enable landing pad for supervisor */>" --> this is enabling.
> Had we done "li a1, 0 /* enable landing pad for supervisor */" --> this is
> asking firmware to disable the feature (turn off the bit in menvcfg CSR)

So we lack constants for

"Enable landing pad for supervisor-mode"
"Disable landing pad for supervisor-mode"

Best regards

Heinrich

>>
>>> +    li a2, SBI_FWFT_SET_FLAG_LOCK
>>> +    ecall    /* check for error condition and take appropriate 
>>> action */
>>> +#endif
>>> +
>>>  #ifdef CONFIG_KASAN
>>>      call kasan_early_init
>>>  #endif
>>>
>>


