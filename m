Return-Path: <linux-kbuild+bounces-8161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFEFB11892
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 08:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED69A18913C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 06:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4803328935A;
	Fri, 25 Jul 2025 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="BNHB4G1p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658CF284682
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753425237; cv=none; b=e2+lKKW73iAPx4klBajc+b3OfzW6zI0Bl9MrR+MTxaTk/KkWYvrzu5FAxPQqUJub/EaU4OeVhfDgKFL1OmBCtJPTc66ig9A1p1PwZ5m3361nbcBJ8X7AHpZVL5PakaFWQ/ltG3vlqvx6PLdN+h37x2SEs6XC/wQb5q1Lo7TKgbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753425237; c=relaxed/simple;
	bh=O5sZvO2bRfOkG7bX13D5V4uZzof7+lq/HEk97vq2bZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lS1eyfsMDWIv1kemVl+GIl0lYerGVcvwq3LNofNsUOeg2et1Zz2EOeDdQaqEmcr5sF9bWFh71iW4TVJ+cBAIsgxAmrFUlGBpzKQ7A8Wh6CQ1JX2klpjDZT534ZP1WcRm6Uut8wqpR50wy1N8Jw1QOwN6fjWJ2XdC6xk4S73/hEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=BNHB4G1p; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EAC953F5B7
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753425231;
	bh=AcnKBfE2a+S1VW5IMnseKsBzXFCCOskdFvDUc4TUQMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=BNHB4G1p6AwvuX8eQB5UkxJQBT0dBt1rnZHoImQ/fW555vDDFtnCog9LE0qGLXn4A
	 un+4Rx6f1YQgKJle2wzM3Bum2cGpqK1Wh+eWR9BTPao0UHDRPT0x8DtC5OLKheX1If
	 TYHsNPVe18TL3M7zMIRwoM8FO4p+J0gUfyWdvUZ4zTZYcoDaG+rK579Mnna1KS6yRQ
	 XDzdL2Ee4ePlJrYGLdPjgX+Yb+gMPheH4OY0sM6HvP1+UBco9CNcNEE7N5L5ldtH8l
	 zvNA6yAv9BN/vuQYOUzQrw36SpjjlawVgJGsKorqww65N6kIFxsO1jz5OHcWtEFykf
	 SL/l+OSTPNtSQ==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so865572f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753425230; x=1754030030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcnKBfE2a+S1VW5IMnseKsBzXFCCOskdFvDUc4TUQMs=;
        b=TbOyCF/bZcRyF4qv/DqRklXkwKcCKLkwuhy5pdqdmqlKu5EnaEDNbIVsLDMdl2nQe5
         5fcx09oX0KSF8mqw45y7kBHtCYwJ370R6kb61YB4n3NXGLoLkHC6exAcISd2k/zjDddP
         7X1459/YfpKKeV7L+gQ4IHR4EqXbWkTqXp2TipFa8YU3jSfYtdTWiQIRUEilmE7l6QRo
         nKWsGM2jQU2dYPwy6mTazOLJJMdFSE8nzSaFASw220pdEL00dytNBxPqE4/EKx4xsbyW
         IYZd92Egx70KSXHczYfZZxSWrDBbPDNdcArNAdprAJaQ0cgWggjWaVQJr31BOuxNm8Mx
         jEDw==
X-Forwarded-Encrypted: i=1; AJvYcCWbwNAb8rV3AxmSorSZs82aNgu3hnI6dj5ERDAVV3hhdm3C67j6xJSt6WCwRdK4+ZYLKzFDQg2QmzrqKok=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjv/v5l8diytYCxfDL1eQ5/ANn2dX8SOXfHJ069/sySpL/cuf1
	m+O/aVMtYxkMWTLOBuEKp72mpWAVcN+uO2tfXpcfYvAe9BsUZRkc1uIlrfax/H+ox2p1Bc73SRK
	e7GyUhdCe3DRCw426p7IaOhb9IGiZGhniQDS6ScAhtfOb9nnHr8dnxHJB1b/zAduH8jVEHiN/Qq
	uuEBou7w==
X-Gm-Gg: ASbGncsTVkyomwFqJ8Wl2/0AawEZhKypYhE4r32z1g9rD5Rm1GGZ+1evHtlm6d/WfWv
	cMAIIZz70b6bYZ8jp75BSOc0A29bPDaXlQ4E/+L5jD8FnWgjUL170A4bX5yswuvAMx86XkkczJF
	P0VS+EPwxMJ6T7EuVYz0dDGZ5Jb83qJh05iAFy4o919fzRurxDzzGcWRL3ni7P97clnAZpJMjpY
	21n2l99tgtQNMPNA7EfPE4p8sLQTxbI476qvihLv2mgkWM/VogRRsvOlyKj3byxBfvZ39N3Zox4
	PQLLCZwoKJ32F+tG9/d9ddGy714DUrJobH4Uu5q9RJK94z/lyzR7jDwtfnWZnZ1dkgrgHYz6yc3
	6OR57Hp/6XD6N1IbhuOHQsSEYzSi1jxTcwNFF
X-Received: by 2002:a05:6000:2c0d:b0:3a5:7895:7f6b with SMTP id ffacd0b85a97d-3b7765ecfd6mr508120f8f.7.1753425230231;
        Thu, 24 Jul 2025 23:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF33NxRWxXDTDDBoqgqdvHkBJufwM8gnuJUTxJTRNJxH7wzbKZ2u1yPOgBX88LofGXQiRQPhA==
X-Received: by 2002:a05:6000:2c0d:b0:3a5:7895:7f6b with SMTP id ffacd0b85a97d-3b7765ecfd6mr508059f8f.7.1753425229758;
        Thu, 24 Jul 2025 23:33:49 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcc3429sm4041277f8f.75.2025.07.24.23.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:33:48 -0700 (PDT)
Message-ID: <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
Date: Fri, 25 Jul 2025 08:33:46 +0200
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
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.07.25 01:36, Deepak Gupta wrote:
> Enables landing pad enforcement by invoking a SBI FWFT call.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/kernel/asm-offsets.c |  1 +
>   arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index e4d55126dc3e..e6a9fad86fae 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -536,6 +536,7 @@ void asm_offsets(void)
>   	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>   	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>   	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
> +	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
>   	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
>   #endif
>   }
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9c99c5ad6fe8..59af044bf85c 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -185,6 +185,16 @@ secondary_start_sbi:
>   1:
>   #endif
>   	scs_load_current
> +
> +#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
> +	li a7, SBI_EXT_FWFT
> +	li a6, SBI_EXT_FWFT_SET
> +	li a0, SBI_FWFT_LANDING_PAD
> +	li a1, 1 /* enable landing pad for supervisor */
> +	li a2, SBI_FWFT_SET_FLAG_LOCK
> +	ecall	/* check for error condition and take appropriate action */
> +#endif
> +
>   	call smp_callin
>   #endif /* CONFIG_SMP */
>   
> @@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
>   #endif
>   	scs_load_current
>   
> +#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
> +	li a7, SBI_EXT_FWFT
> +	li a6, SBI_EXT_FWFT_SET
> +	li a0, SBI_FWFT_LANDING_PAD
> +	li a1, 1 /* enable landing pad for supervisor */

The SBI specification calls BIT(0) "LOCK".
Shouldn't we define a constant for the lock bit instead of using a magic 
value?

Best regards

Heinrich

> +	li a2, SBI_FWFT_SET_FLAG_LOCK
> +	ecall	/* check for error condition and take appropriate action */
> +#endif
> +
>   #ifdef CONFIG_KASAN
>   	call kasan_early_init
>   #endif
> 


