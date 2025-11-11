Return-Path: <linux-kbuild+bounces-9562-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB26C4D107
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 11:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D0C354E74C2
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2520C34B67F;
	Tue, 11 Nov 2025 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sjb5S7mK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522E9345739;
	Tue, 11 Nov 2025 10:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856856; cv=none; b=N/ZA/Y1vnpbxFCCS42rVLGBPkGZIpOGCo6sxAckPjDw++ADxmVK7FKUopQMwHUAJ1fwP2qe9ePNyw87CBFGI79xqMM9EXcsWKqaSF/SJW8wHwInxgPQ/93l1k63TRi3+Ga64QBFS0bILrt0ubRF+x/jKjk6y5+8F08GXPepLkTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856856; c=relaxed/simple;
	bh=JirDSvUgdW0BcnI08nHDbc8VOnVTAsZAJyon3YU6egM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hew4T6xTmiqBvQhXSw2rT2ZxdOrldklQlukqDo85KcsIr3fLpri+EnTRBDQmPuRfRCo1yBBKoDcmffQUbsqc6pjxSi78gHanXjdkSKDDbWgWWPlxNpeXDg9bDO6qWOw3LQZWHwrMxGn0XG29V7QpGBZ6pnyaBw5UuLE4W5lLiWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sjb5S7mK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iCozD/S14h9YyVEvZtzrw1OeE8+mwrBwtubAIDfZfYw=; b=sjb5S7mK2brT+EtiKy3b3jYsHd
	lNYMJRyT9YAluzwMc8XiVCT6lDbgLRAv3jkpzWQaIvSJiMVlTu0KB7Qeb3Zp7tud9XR4oQJS5GTtM
	wxeAFYkz/k6xVOXGOnLOFp9YHVm0W6z8GlyCJCZZ0wJOYVI7CnH4Pv0pgFsU4MylNjQJoXiWiA6Fm
	P+slWCcWrcvHBNtm3WSymnLMQIyuEJ2LWAiciGDcRLeuqppHzpm5GiYI/g2u4LGqNQC2HfcFNFeCC
	75V0Liz50oP+KjQ1uk1/50UGtZ/pFqw6GrHY0kVXbojzKRFWy6yONwogjg7nInxJrfnb8JC+dZ5/6
	MghJ6MCA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlaq-00000003ivF-1kLK;
	Tue, 11 Nov 2025 10:27:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 455A4300328; Tue, 11 Nov 2025 11:27:19 +0100 (CET)
Date: Tue, 11 Nov 2025 11:27:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, kaleshsingh@google.com, kbingham@kernel.org,
	akpm@linux-foundation.org, nathan@kernel.org,
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de,
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com,
	kees@kernel.org, baohua@kernel.org, vbabka@suse.cz,
	justinstitt@google.com, wangkefeng.wang@huawei.com,
	leitao@debian.org, jan.kiszka@siemens.com,
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com,
	ubizjak@gmail.com, ada.coupriediaz@arm.com,
	nick.desaulniers+lkml@gmail.com, ojeda@kernel.org,
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com,
	glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com,
	jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com,
	dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com,
	yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com,
	samuel.holland@sifive.com, vincenzo.frascino@arm.com,
	bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com,
	kas@kernel.org, tglx@linutronix.de, mingo@redhat.com,
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com,
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org,
	rppt@kernel.org, will@kernel.org, luto@kernel.org,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 15/18] x86/kasan: Handle UD1 for inline KASAN reports
Message-ID: <20251111102719.GH278048@noisy.programming.kicks-ass.net>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
 <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me>

On Wed, Oct 29, 2025 at 08:09:51PM +0000, Maciej Wieczor-Retman wrote:
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> 
> Inline KASAN on x86 should do tag mismatch reports by passing the
> metadata through the UD1 instruction and the faulty address through RDI,
> a scheme that's already used by UBSan and is easy to extend.
> 
> The current LLVM way of passing KASAN software tag mode metadata is done
> using the INT3 instruction. However that should be changed because it
> doesn't align to how the kernel already handles UD1 for similar use
> cases. Since inline software tag-based KASAN doesn't work on x86 due to
> missing compiler support it can be fixed and the INT3 can be changed to
> UD1 at the same time.
> 
> Add a kasan component to the #UD decoding and handling functions.
> 
> Make part of that hook - which decides whether to die or recover from a
> tag mismatch - arch independent to avoid duplicating a long comment on
> both x86 and arm64 architectures.
> 

> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index 396071832d02..375651d9b114 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -6,6 +6,24 @@
>  #include <linux/kasan-tags.h>
>  #include <linux/types.h>
>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> +
> +/*
> + * LLVM ABI for reporting tag mismatches in inline KASAN mode.
> + * On x86 the UD1 instruction is used to carry metadata in the ECX register
> + * to the KASAN report. ECX is used to differentiate KASAN from UBSan when
> + * decoding the UD1 instruction.
> + *
> + * SIZE refers to how many bytes the faulty memory access
> + * requested.
> + * WRITE bit, when set, indicates the access was a write, otherwise
> + * it was a read.
> + * RECOVER bit, when set, should allow the kernel to carry on after
> + * a tag mismatch. Otherwise die() is called.
> + */
> +#define KASAN_ECX_RECOVER	0x20
> +#define KASAN_ECX_WRITE		0x10
> +#define KASAN_ECX_SIZE_MASK	0x0f
> +#define KASAN_ECX_SIZE(ecx)	(1 << ((ecx) & KASAN_ECX_SIZE_MASK))
>  #define KASAN_SHADOW_SCALE_SHIFT 3

> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 6b22611e69cc..40fefd306c76 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -179,6 +179,9 @@ __always_inline int decode_bug(unsigned long addr, s32 *imm, int *len)
>  	if (X86_MODRM_REG(v) == 0)	/* EAX */
>  		return BUG_UD1_UBSAN;
>  
> +	if (X86_MODRM_REG(v) == 1)	/* ECX */
> +		return BUG_UD1_KASAN;
> +
>  	return BUG_UD1;
>  }
>  
> @@ -357,6 +360,11 @@ static noinstr bool handle_bug(struct pt_regs *regs)
>  		}
>  		break;
>  
> +	case BUG_UD1_KASAN:
> +		kasan_inline_handler(regs);
> +		handled = true;
> +		break;
> +
>  	default:
>  		break;
>  	}

> +void kasan_inline_handler(struct pt_regs *regs)
> +{
> +	int metadata = regs->cx;
> +	u64 addr = regs->di;
> +	u64 pc = regs->ip;
> +	bool recover = metadata & KASAN_ECX_RECOVER;
> +	bool write = metadata & KASAN_ECX_WRITE;
> +	size_t size = KASAN_ECX_SIZE(metadata);
> +
> +	if (user_mode(regs))
> +		return;
> +
> +	if (!kasan_report((void *)addr, size, write, pc))
> +		return;
> +
> +	kasan_die_unless_recover(recover, "Oops - KASAN", regs, metadata, die);
> +}

I'm confused. Going by the ARM64 code, the meta-data is constant per
site -- it is encoded in the break immediate.

And I suggested you do the same on x86 by using the single byte
displacement instruction encoding.

	ud1	0xFF(%ecx), %ecx

Also, we don't have to use a fixed register for the address, you can do:

	ud1	0xFF(%ecx), %reg

and have %reg tell us what register the address is in.

Then you can recover the meta-data from the displacement immediate and
the address from whatever register is denoted.

This avoids the 'callsite' from having to clobber cx and move the address
into di.

What you have here will work, and I don't suppose we care about code
density with KASAN much, but it could've been so much better :/



