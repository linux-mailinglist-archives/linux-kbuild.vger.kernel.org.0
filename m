Return-Path: <linux-kbuild+bounces-7892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A808AFADC6
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 09:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5192D16E767
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 07:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E77C1A0BF1;
	Mon,  7 Jul 2025 07:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jo1At3mb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A62A70813
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Jul 2025 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874942; cv=none; b=jb/BK/vW672qWjP3NsviTbcMPOjdsI054IeWl8GOKKa0kn4GuXuBPisPuZ0Wj1AK1QvkzIjLR+wVWB/Esh2/yFNn5y96wE7nwjurKS9CsKm+8iCIcxpqgIaeYaP94xBI7gvue3hEva1E1rlRuuLT9jJ+NhkQYWC7dstimpldU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874942; c=relaxed/simple;
	bh=++UJghTlDO+V1M8aHBzPmQO1OJVHBsqH0kjOiCS3i3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q9BzhSKYG0tifdwRHz1aSurcILAuckZbi4klHwyMoyPT9HCNrQQAHkgf7Slc6qmNH2o9Qfiq0jqB3d9/0JERhxkWpeIEkEf6NOKCQ3+uaYEsDrlt/+WNLWpgcdtFkxukLpilQPN7mYeWcwFxcU8wHWvGNB/EGjlKB8uvxAD6W5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jo1At3mb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234bfe37cccso29790625ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Jul 2025 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751874939; x=1752479739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aApJabUejUWlSHVtY2EMwiJ02+kG5XX+8RqRV7KPGb4=;
        b=jo1At3mbk9gpak6Gwe1nMLU3xPr4dHy+5TmSgYYSaGuYB03Q9EXUjvdctn+t7opXRH
         HwWd6hxEYIaew2SJMMc6AGKmjzhxwB1dGpxFRbhjdQa43tki0pgCPbj0h7HRSIHGKMx5
         9SgmFhj2mb/Wzyd9bbthXzCkqsCTT7ijf+m4VVYoLg97ILpGbN3Avb3nZLl0J7OZut2/
         ULVF1Q+rEMdU2n8YB3GWkZrdie389deVLDJqI/dsJiBx68oc8lgGgRMNUzJNwgGpYFhL
         Gq6gQUaPr0r27Gw1XI0Dmzrl9gllYZxFRQiu32fgsZJvmJafdpXeWjScJ+h75Ab49kea
         n/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874939; x=1752479739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aApJabUejUWlSHVtY2EMwiJ02+kG5XX+8RqRV7KPGb4=;
        b=U3z3Q0yAj6lHY/KReczSu1x9V73VOA+F8B4kQ2B7iRnS+3xpJWRgzJW8yiu9rxXUnP
         gtcY1W8jzCFh8SfRdvtY49LDyVJsODa/ph3DUAIo3sirk7C15XXYq6WNykFn4i1P+Nvb
         IrJpAq16gqFJQuSXTniWkNpaYFOiny6HvVwL2BOWHag9wI6c+OC3BnPWecs0cW8rxjaP
         tVF6++Uq3igT7gXI4R311WSLoWW3SlaJlwaJSt50gZN8gnngn7BHemQZn5cqDTua0N0h
         5NagH+nSmItJd3vFMWLop2nynsCMFkH7uQCkI72kIGrg9zn+tCjRvc/vmmsrc5JpmAdg
         LaPw==
X-Forwarded-Encrypted: i=1; AJvYcCXi/Rd8YQNELSqcEVTq6r7mmU11FnmGZrafbO7R/lVVVLS+xYyVo0tb9DbMdIjkAPNuaSVe/Ce56LWvPKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyFOe/3YfNgfMEy3xkbkDZkwviqmaNUTXg8C7TG+JSJXtdUj/0
	2qPYwLMg+VrsrCq8Orw9HryvlhwQOI5+g2vYoXq2r9bzx5P57kTLjlrEEDeqO+dmmjA=
X-Gm-Gg: ASbGnctvzB+aQkly9Bt/9H6qA3p6Olpc5rBZL85UDVpyAKsXrPE9qoauqixQk2iYm5S
	c8poQHyfsfIG2m/Pz7JczuAXdvU9aVZ9YdvtLKQ4M9+NAhXo1AvpbuznCIDAsHqmsLx63tkTncB
	MDSDRxnB+ffqT7AeFZH0jTWgMvCTbcf/jsgwYMuW+PoM2bHIqkNsv3h3T5UJxtzihwP3WllV1Cz
	XYunzNobt27eneu88QZA3ED2Bhqo1CcsFu8ipZ4JGMQIq7HP+FO2a9Pz1tbjsBiEHxfaz7GpC9W
	0o0bTeBTMacGpPkfNDM6ltMnStxzQG3Xext8Vbp11KhHfZ5GEpCyAh6F/sWzBjyQaiFkoSNifBx
	e5JWgADZWB3w/tVQ2lncQhKg3Sv4vh+Q=
X-Google-Smtp-Source: AGHT+IFfTih1LqKT1LDm5be4/O7hUomMhMwDtvn8B+cv+CxwUB3mfhw4Xg4ugcd+O6z8cN5GXNsIqg==
X-Received: by 2002:a17:902:ce81:b0:234:c549:d9dd with SMTP id d9443c01a7336-23c90ffd4ddmr129310345ad.48.1751874939247;
        Mon, 07 Jul 2025 00:55:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a381sm78207605ad.20.2025.07.07.00.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 00:55:38 -0700 (PDT)
Message-ID: <977847c2-d94b-44a9-9c1f-f1ff95ffb985@rivosinc.com>
Date: Mon, 7 Jul 2025 09:55:19 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] RISC-V: Fix a register to store the percpu offset
To: Yunhui Cui <cuiyunhui@bytedance.com>, masahiroy@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, dennis@kernel.org,
 tj@kernel.org, cl@gentwo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com,
 bjorn@rivosinc.com, cyrilbur@tenstorrent.com, rostedt@goodmis.org,
 puranjay@kernel.org, ben.dooks@codethink.co.uk, zhangchunyan@iscas.ac.cn,
 ruanjinjie@huawei.com, jszhang@kernel.org, charlie@rivosinc.com,
 antonb@tenstorrent.com, ajones@ventanamicro.com, debug@rivosinc.com,
 haibo1.xu@intel.com, samuel.holland@sifive.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250704084500.62688-1-cuiyunhui@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/07/2025 10:45, Yunhui Cui wrote:
> The following data was collected from tests conducted on the
> Spacemit(R) X60 using the fixed register method:
> 
> No modifications:
> 6.77, 6.791, 6.792, 6.826, 6.784, 6.839, 6.776, 6.733, 6.795, 6.763
> Average: 6.786839305
> 
> ffix-x27:
> 7.106, 7.035, 7.362, 7.141, 7.096, 7.182, 7.109, 7.126, 7.186, 7.12
> Average: 7.145826539
> 
> ffix-x27 + x27(s11) used for offset optimization:
> 7.059, 6.951, 6.961, 6.985, 6.93, 6.964, 6.977, 6.907, 6.983, 6.944
> Average: 6.965993173

Hi Yunhui,

Out of curiosity, did you tried using a register different than x27 ?

Thanks,

Clément

> 
> Analysis:
> The fixed register method reduced performance by 5.29%.
> The per-CPU offset optimization improved performance by 2.52%.
> 
> Issues with the fixed register method (beyond code size):
> Performance degradation due to the loss of one general-purpose register.
> Each handle_exception() call requires loading the per-CPU offset into the
> fixed register.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  Makefile                        |  4 ++--
>  arch/riscv/include/asm/percpu.h | 22 ++++++++++++++++++++++
>  arch/riscv/kernel/asm-offsets.c |  1 +
>  arch/riscv/kernel/entry.S       | 11 +++++++++--
>  arch/riscv/kernel/smpboot.c     |  3 +++
>  5 files changed, 37 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/include/asm/percpu.h
> 
> diff --git a/Makefile b/Makefile
> index b7d5f2f0def0..e291f865adc4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1026,8 +1026,8 @@ include $(addprefix $(srctree)/, $(include-y))
>  
>  # Add user supplied CPPFLAGS, AFLAGS, CFLAGS and RUSTFLAGS as the last assignments
>  KBUILD_CPPFLAGS += $(KCPPFLAGS)
> -KBUILD_AFLAGS   += $(KAFLAGS)
> -KBUILD_CFLAGS   += $(KCFLAGS)
> +KBUILD_AFLAGS   += $(KAFLAGS) -ffixed-x27
> +KBUILD_CFLAGS   += $(KCFLAGS) -ffixed-x27
>  KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
>  
>  KBUILD_LDFLAGS_MODULE += --build-id=sha1
> diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
> new file mode 100644
> index 000000000000..5d6b109cfab7
> --- /dev/null
> +++ b/arch/riscv/include/asm/percpu.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_PERCPU_H
> +#define __ASM_PERCPU_H
> +
> +static inline void set_my_cpu_offset(unsigned long off)
> +{
> +	asm volatile("addi s11, %0, 0" :: "r" (off));
> +}
> +
> +static inline unsigned long __kern_my_cpu_offset(void)
> +{
> +	unsigned long off;
> +	asm ("mv %0, s11" :"=r" (off) :);
> +	return off;
> +}
> +
> +#define __my_cpu_offset __kern_my_cpu_offset()
> +
> +#include <asm-generic/percpu.h>
> +
> +#endif
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index a03129f40c46..0ce96f30bf32 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -35,6 +35,7 @@ void asm_offsets(void)
>  	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>  	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>  	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> +	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>  	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 9d1a305d5508..529d6576265e 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -77,6 +77,13 @@ SYM_CODE_START(handle_exception)
>  	 */
>  	csrw CSR_SCRATCH, x0
>  
> +	/* load __per_cpu_offset[cpu] to s11*/
> +	REG_L t6, TASK_TI_CPU(tp)
> +	slli t6, t6, 3
> +	la s11, __per_cpu_offset
> +	add s11, s11, t6
> +	REG_L s11, 0(s11)
> +
>  	/* Load the global pointer */
>  	load_global_pointer
>  
> @@ -298,7 +305,7 @@ SYM_FUNC_START(__switch_to)
>  	REG_S s8,  TASK_THREAD_S8_RA(a3)
>  	REG_S s9,  TASK_THREAD_S9_RA(a3)
>  	REG_S s10, TASK_THREAD_S10_RA(a3)
> -	REG_S s11, TASK_THREAD_S11_RA(a3)
> +	/* REG_S s11, TASK_THREAD_S11_RA(a3) */
>  	/* Save the kernel shadow call stack pointer */
>  	scs_save_current
>  	/* Restore context from next->thread */
> @@ -315,7 +322,7 @@ SYM_FUNC_START(__switch_to)
>  	REG_L s8,  TASK_THREAD_S8_RA(a4)
>  	REG_L s9,  TASK_THREAD_S9_RA(a4)
>  	REG_L s10, TASK_THREAD_S10_RA(a4)
> -	REG_L s11, TASK_THREAD_S11_RA(a4)
> +	/* REG_L s11, TASK_THREAD_S11_RA(a4) */
>  	/* The offset of thread_info in task_struct is zero. */
>  	move tp, a1
>  	/* Switch to the next shadow call stack */
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index fb6ab7f8bfbd..6fa12cc84523 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -43,6 +43,7 @@ static DECLARE_COMPLETION(cpu_running);
>  
>  void __init smp_prepare_boot_cpu(void)
>  {
> +	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
>  }
>  
>  void __init smp_prepare_cpus(unsigned int max_cpus)
> @@ -240,6 +241,8 @@ asmlinkage __visible void smp_callin(void)
>  	mmgrab(mm);
>  	current->active_mm = mm;
>  
> +	set_my_cpu_offset(per_cpu_offset(curr_cpuid));
> +
>  	store_cpu_topology(curr_cpuid);
>  	notify_cpu_starting(curr_cpuid);
>  


