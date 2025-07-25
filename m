Return-Path: <linux-kbuild+bounces-8179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF456B1218A
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 18:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCD52AC50B6
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 16:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F1B2EF2AB;
	Fri, 25 Jul 2025 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sn0ycBIv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF552EF67E
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753460018; cv=none; b=aArjfx24ESJpk9M/ElTq9IECWZJdjLNHWaxiM9UjwCi3h+Btq8wBUjj7qrlMVTbbg+JsjS8RbdHsFZdoGiruNVWdyny4SkS4A62ilanHevrDZGwrRVxPYdcz3hECqk4/ePsG677fxC7Z3D8kW2AUb5jTfOzSHgbEII6N+Qh3LCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753460018; c=relaxed/simple;
	bh=x4YQxIKQWr0zlAYssB11RNVL/V9ApQOefS1jUqYP7Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaySdhEYVtcI185pmIM9AR5YFi0GGpvnnMjWxbjhE1mOHXXIkGvyMLWtSo+G9tqL8fj8KTaEzZmlmYfP6gmbsI03iYD7HJ5EjLeMq7/si3ZO0po4Wz99bjxqr1HLyC5vlLqBn6PL7p7gqodSl7LbiFvEyu/uY1l9hEn44+z3ofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sn0ycBIv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e389599fso232105ad.0
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753460015; x=1754064815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbMA4/IPXQaEHQepmsbHPY7QV6shrVDJW0bf+hd1ByM=;
        b=Sn0ycBIvHsuysshNn0hv3S1qD6MA6KN8X2DvogWUcPzvrh1z5eYODQKUcRgzxYhkcO
         o25tPd83KG8V2d5lVddTdKA6XB1wu4CXMPMh6fqTb9eP8Gpr5SHNk/YqZI43Ul3U8Xfp
         QslyK8Qm9/V7eY2R06So2DnOubkGyDvHGdoFCq7cLBwu8Iada4icBe1NcgEQYq5dQTCM
         cXu6m8baC0ukrJo5Cf1QL7RcBO4E30+38zepCcNLo9sqjSAAZpiXB69T4VRzmNZK4rUu
         23riNFx9OcGuX5tf3edOa2kxu1TznsgrvkqCAxgIjMenW4KtODkkZQYyDA3C3XkPhtf2
         Bjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460015; x=1754064815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbMA4/IPXQaEHQepmsbHPY7QV6shrVDJW0bf+hd1ByM=;
        b=Az2zYw3If3nBjN1UkqSr70eqC+xdqsdzAZeUAq3M/Gz8hS/t7qvlbggizu1KEaPSLr
         wwAAg0rQ8Fje+rw8iQeJGE9qDkTBOcSbaNNsV1ewkQZbeo07OV5E3FKg7LEH9WJwnbqY
         Blk28pfqZqzOSGf7ctWVFvYZDzsstAFh8qNdZM5mAodHYsE9nrOZQZddI2vjQRAy2uC3
         rp9wcbWGMcJPtDDDeUuvdT++dE8V1GLO4UYDwPhPPsqiDTTJr3oFIozRo+26jLSbj+Gz
         cGRxvP2h25Xf3uTMxR5Q4uncG6X/0yN3n6LU6GX8PiEwzE+nt5eBKRNXLSsAOPtbHneg
         SyDA==
X-Forwarded-Encrypted: i=1; AJvYcCVNEN499wJroCm0F7q7fcU1X8PPLMqM7z7J97/deWRAjdso6IAX7qcS6FFQzcQDAoHs0abRnDJpY1ziq78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytr+z5OI+8w8DwD0gJHcLFYMo6S0lFw22a01A5CT98kuBVq3EL
	acrpsVq0XhCjmZJdDDV/qgsAPp/oMw8BFRTuPX2/fkavI9VIyA6a2Mo3e1gTZvZ4Qg==
X-Gm-Gg: ASbGncsAsefa9pXQBDyixRKvJAKYJCZ9tlLpp8MWNzm01irOVY3AKkY8eAN7ydH3/QT
	Z8ay0p3Gruc6RaijRu/TZuQENKT4qQqmXKGjMevuZf3ebVNOXJq6y4V9crRrMyz/Zd8yD6CiNN4
	HqzI5GHrX6jCSOWLswYU8Eh/1wKBvwn3V2J8C4N7Q+o3UUMPg/rRcSATwPzs4RGutxtKnxlam1e
	fcqb3T+mDFdgmIoAlvJf9ssKFd4wL6YHUW42IwT8lWBe2fVhEuZyklsFLSRg4mQ0Wb6cdPgBFMv
	HVu2G1qJsdWSyxyLphYWHYzLDSwyjOvyUDDG2VdNuEIENnlRKZ1s0K4w9QrSroVBguk8CvN9lEZ
	FAF1PklAX3EmvqPBQVMiNVPppa9s4sYT2sNZCJP/RBeW8COIq5PrfBx5glSDix62u0g==
X-Google-Smtp-Source: AGHT+IGq4HV4wynITvP6Q3jQAvqNu8aZGXk3r1rzEnuZDeWdHk39Doexv2T5tkYjqpbpWqlrXy/lSA==
X-Received: by 2002:a17:902:e947:b0:234:b2bf:e67e with SMTP id d9443c01a7336-23fb0309a88mr3165975ad.13.1753460015047;
        Fri, 25 Jul 2025 09:13:35 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fc7a4sm619335ad.120.2025.07.25.09.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:13:34 -0700 (PDT)
Date: Fri, 25 Jul 2025 16:13:27 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>, Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Message-ID: <20250725161327.GC1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>

On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
> If shadow stack have memory protections from underlying cpu, use those
> protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
> stack pages. Hw assisted shadow stack pages grow downwards like regular
> stack. Clang based software shadow call stack grows low to high address.

Is this the case for all the current hardware shadow stack
implementations? If not, we might want a separate config for the
shadow stack direction instead.

> Thus this patch addresses some of those needs due to opposite direction
> of shadow stack. Furthermore, hw shadow stack can't be memset because memset
> uses normal stores. Lastly to store magic word at base of shadow stack, arch
> specific shadow stack store has to be performed.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  include/linux/scs.h | 26 +++++++++++++++++++++++++-
>  kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/scs.h b/include/linux/scs.h
> index 4ab5bdc898cf..6ceee07c2d1a 100644
> --- a/include/linux/scs.h
> +++ b/include/linux/scs.h
> @@ -12,6 +12,7 @@
>  #include <linux/poison.h>
>  #include <linux/sched.h>
>  #include <linux/sizes.h>
> +#include <asm/scs.h>
>  
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  
> @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>  	 * Reset the shadow stack to the base address in case the task
>  	 * is reused.
>  	 */
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
> +#else
>  	task_scs_sp(tsk) = task_scs(tsk);
> +#endif
>  }
>
>  static inline unsigned long *__scs_magic(void *s)
>  {
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	return (unsigned long *)(s);
> +#else
>  	return (unsigned long *)(s + SCS_SIZE) - 1;
> +#endif
>  }
>  
>  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>  {
>  	unsigned long *magic = __scs_magic(task_scs(tsk));
> -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
> +	unsigned long sz;
> +
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
> +#else
> +	sz = task_scs_sp(tsk) - task_scs(tsk);
> +#endif
>  
>  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>  }
>  
> +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
> +{
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	arch_scs_store(s, magic_val);
> +#else
> +	*__scs_magic(s) = magic_val;
> +#endif
> +}
> +

I'm not a huge fan of all the ifdefs. We could clean this up by
allowing architectures to simply override some these functions, or at
least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
this?

>  DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>  
>  static inline bool scs_is_dynamic(void)
> diff --git a/kernel/scs.c b/kernel/scs.c
> index d7809affe740..5910c0a8eabd 100644
> --- a/kernel/scs.c
> +++ b/kernel/scs.c
> @@ -11,6 +11,7 @@
>  #include <linux/scs.h>
>  #include <linux/vmalloc.h>
>  #include <linux/vmstat.h>
> +#include <asm-generic/set_memory.h>
>  
>  #ifdef CONFIG_DYNAMIC_SCS
>  DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
> @@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
>  {
>  	int i;
>  	void *s;
> +	pgprot_t prot = PAGE_KERNEL;
> +
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	prot = PAGE_KERNEL_SHADOWSTACK;
> +#endif

I would rather define the shadow stack protection flags in the header
file and allow them to be overridden in asm/scs.h.

>  	for (i = 0; i < NR_CACHED_SCS; i++) {
>  		s = this_cpu_xchg(scs_cache[i], NULL);
>  		if (s) {
>  			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
>  						   KASAN_VMALLOC_PROT_NORMAL);
> +/*
> + * If software shadow stack, its safe to memset. Else memset is not
> + * possible on hw protected shadow stack. memset constitutes stores and
> + * stores to shadow stack memory are disallowed and will fault.
> + */
> +#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>  			memset(s, 0, SCS_SIZE);
> +#endif

This could also be moved to a static inline function that
architectures can override if they have hardware shadow stacks that
cannot be cleared at this point.

>  			goto out;
>  		}
>  	}
>  
>  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
> -				    GFP_SCS, PAGE_KERNEL, 0, node,
> +				    GFP_SCS, prot, 0, node,
>  				    __builtin_return_address(0));
>  
>  out:
> @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>  	if (!s)
>  		return NULL;
>  
> -	*__scs_magic(s) = SCS_END_MAGIC;
> +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>  
>  	/*
>  	 * Poison the allocation to catch unintentional accesses to
> @@ -87,6 +100,16 @@ void scs_free(void *s)
>  			return;
>  
>  	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
> +	/*
> +	 * Hardware protected shadow stack is not writeable by regular stores
> +	 * Thus adding this back to free list will raise faults by vmalloc
> +	 * It needs to be writeable again. It's good sanity as well because
> +	 * then it can't be inadvertently accesses and if done, it will fault.
> +	 */
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));
> +#endif

Another candidate for an arch-specific function to reduce the number
of ifdefs in the generic code.

Sami

