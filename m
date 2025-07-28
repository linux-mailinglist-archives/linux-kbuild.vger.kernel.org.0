Return-Path: <linux-kbuild+bounces-8229-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5DDB1406B
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 18:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6074189DC40
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 16:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168FA2741CF;
	Mon, 28 Jul 2025 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vVFi66ti"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A1218ABD
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Jul 2025 16:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753720661; cv=none; b=lwt5exddoMXWCNi4ukgXKm8Z4bl2Y7djwdFPU6PoGITSxOfYIS2BAo5XZq9py+LLMipkZCdpo7SJsdLb5adJmfvenN1lyUnCTKALxiM9oqs+SkxjeQ+0A+yC6F7AomC9yiN2eLqCLZBZVnYqdtwRtEvraTwaVJy6AVKccyLnKHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753720661; c=relaxed/simple;
	bh=2SCBpxMSnr0Udt96N/nYsntgpWGEdtVpMjRq+5bF/Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcFFUtgm5tO1JgoekyZavvP3oQdglvSVQEMdJTO4V22GUmm5xIsSNeD8F/v9d+uhQ+ktUzbEsA40n5khnA/tcQgY8Wya+gRPx4h6086VY0jmOPO5XPHZ9hG2b9LhQtyY+GPiSHCjyngKQ1iEDXCAth0dI28OiHe3gQg2z+yriQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vVFi66ti; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2403df11a2aso8049855ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Jul 2025 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753720658; x=1754325458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5q5M+CpT+5kwmRPJ46tyAoXGVagM73LO6ZWHv96bYmU=;
        b=vVFi66tiWkkBaX51T0jP0+PE1SzQWHC6EG7d1SVIMWrkF2yBdpIlKC3y3RISdPsAXx
         flcnb8zEyYmHB4neYpKWddQK7ecUX2I94Ug+w6kTsJq0ghJsZYgBozyi/vHTVvx1Q2y8
         KA0NBn3KpFhFBm9hMWKM47COZ/YgXeE2Uftzc/WwMVYiPjQu5ASRUGzCzwwesTr+3Pne
         vZoMIyMF0epLbh2hyNVUhhiwyayfrbp+L348YyW4gOEKEKw9s8M8pkZmNFQnPoqO5CW5
         NkY7BdvWrxnU9lsmY5jAI3cFu/MX5mKL1XYaw7JCOMF+nT7Sr6Yh/NBCv4sli2t495oG
         YRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753720658; x=1754325458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q5M+CpT+5kwmRPJ46tyAoXGVagM73LO6ZWHv96bYmU=;
        b=A9pl9z3ZSW/5OXPwVMpdwb/6kyEjMKIRv/6X+CVrUB86f/SuL/6Oo35i6jWP0dH60J
         fOmUIMnk/x4Pt+LUAdoZt14P0FY25Ea9qKYF9Dl5cVmMFeLpWbn8xHHMMjJtp7Fmh9Ps
         BWWwiwj3u8U8SQMgtZ3HzS+ynTbi/1OvGjRpNXxSvZ4D+FKcEc0CBqBQ4bzfQzT6f5SK
         yOayEszC+KrXDRygbZFefEDGKZnqo3Dca8pLIwjPAlHTxarxCa5pGda5eDJeg/o/xyTJ
         OAbTb1kG0v45C8Kvx2961xlgWzxZqaatyrGpw5wGE4znNOLPi9McFRadKezF5YegvUbJ
         qiXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS89O4HIT9PD67bzNvQFGRBWedobjOce2IM3j4/Et1qX3Q5viNJBKgNXYZ6RhPVU6pNrJ05z5uYVnjBi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTVa04llUPPVP+6RidPzApJgk0HfBfsSITS5OBqRy0eX/qMON
	jg2wFwB7rJ6h1raj55vlqDrPmXk1H1DQ56SUiEvyyartEumUvUibYGUcXMIwmmoOgGk=
X-Gm-Gg: ASbGncsZLrAgfwywbvAlK5rAmPq0ualjxZ+dyw4Y4OkB8crpKPSgoZdUmDcRLDXdClD
	+P0mHPed5ZzZxuh8pMDMkj5fj9phnusQVhOcmXGilDMf9RqKwCqfeyzFRyBOHYKsjWqZOeYMVH5
	YkeT7fQwUCK5QAHVAYB9sSfI5wp57b84NQmuqBCf9gbwWUXmA2t8sMljdY4JMrxuSEjg/7lHzzb
	92aotMIhl/JDQBq0+Y1c0V4zb4zPD087U93qYTj0FZ/VoXwRia1NYlz4oFdXJwGLUjMRIi8hSbl
	2zUq1+0OqB0w+QikJGOAop3LcReW4Psaqfbc6pFCwe4pbARgMMU636wxTWeDYYvICwspiwvLG6j
	gjRmVhtObgmJzffT5pw5Xk+3m+SNkECXX
X-Google-Smtp-Source: AGHT+IG8PkXREALt2B41+CkCZk4vD0+tX/pzcMfIzczJ6dwSMXqtKdHnRzA6w8eQHSP6Yq5Aix/U2Q==
X-Received: by 2002:a17:903:1111:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-23fb30cd1f9mr182480625ad.35.1753720658505;
        Mon, 28 Jul 2025 09:37:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ff3ea7547sm40412335ad.149.2025.07.28.09.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 09:37:37 -0700 (PDT)
Date: Mon, 28 Jul 2025 09:37:34 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Will Deacon <will@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
Message-ID: <aIenTs_D4l414isp@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
 <20250725161327.GC1724026@google.com>
 <aIdxUpSc-Co8wLYE@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aIdxUpSc-Co8wLYE@willie-the-truck>

On Mon, Jul 28, 2025 at 01:47:14PM +0100, Will Deacon wrote:
>On Fri, Jul 25, 2025 at 04:13:27PM +0000, Sami Tolvanen wrote:
>> On Thu, Jul 24, 2025 at 04:37:03PM -0700, Deepak Gupta wrote:
>> > diff --git a/include/linux/scs.h b/include/linux/scs.h
>> > index 4ab5bdc898cf..6ceee07c2d1a 100644
>> > --- a/include/linux/scs.h
>> > +++ b/include/linux/scs.h
>> > @@ -12,6 +12,7 @@
>> >  #include <linux/poison.h>
>> >  #include <linux/sched.h>
>> >  #include <linux/sizes.h>
>> > +#include <asm/scs.h>
>> >
>> >  #ifdef CONFIG_SHADOW_CALL_STACK
>> >
>> > @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>> >  	 * Reset the shadow stack to the base address in case the task
>> >  	 * is reused.
>> >  	 */
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
>> > +#else
>> >  	task_scs_sp(tsk) = task_scs(tsk);
>> > +#endif
>> >  }
>> >
>> >  static inline unsigned long *__scs_magic(void *s)
>> >  {
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	return (unsigned long *)(s);
>> > +#else
>> >  	return (unsigned long *)(s + SCS_SIZE) - 1;
>> > +#endif
>> >  }
>> >
>> >  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>> >  {
>> >  	unsigned long *magic = __scs_magic(task_scs(tsk));
>> > -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
>> > +	unsigned long sz;
>> > +
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
>> > +#else
>> > +	sz = task_scs_sp(tsk) - task_scs(tsk);
>> > +#endif
>> >
>> >  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>> >  }
>> >
>> > +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
>> > +{
>> > +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>> > +	arch_scs_store(s, magic_val);
>> > +#else
>> > +	*__scs_magic(s) = magic_val;
>> > +#endif
>> > +}
>> > +
>>
>> I'm not a huge fan of all the ifdefs. We could clean this up by
>> allowing architectures to simply override some these functions, or at
>> least use if (IS_ENABLED(CONFIG...)) instead. Will, any thoughts about
>> this?
>
>Yeah, I agree that allowing architectures to provide overrides makes
>sense, however I also suspect that some of this needs to be a runtime
>decision because not all CPUs will support the hardware-accelerated
>feature and will presumably want to fall back on the software
>implementation.

Hmm runtime fallback is an important point. Thanks. I'll munch on it a
bit.

>
>Will

