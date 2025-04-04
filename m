Return-Path: <linux-kbuild+bounces-6438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C839DA7C2F8
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 19:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DB067A7674
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 17:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59F921A45D;
	Fri,  4 Apr 2025 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cS5RBcX8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E9521B9D4;
	Fri,  4 Apr 2025 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789317; cv=none; b=SUXFwKfOj5AAwShGlTAkfcSYy0G6w8oqmRjOnZG0nBbNRjJMM0KEGUUdZLnlLLO+Am4LeFIJyKuRvWbA2IO6xPm4fthO0qq1VlJNat17qDyh9srpWXoCSaUMk7tOLvkGaiIro+4AaT9ftgNgqz0tdP5wDToCea9+z+48+ImYKHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789317; c=relaxed/simple;
	bh=pIENLeWzTVJaaXaUldVebDEO8Uq2auKXJ/zTuKpRGc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2VU/7AZR0zctPcXM65kesR369bik6ffmobTmvJ3ImFTrCE76yMFjtA/SP6hyIHRZKyV+EJfqCXhtpt5PBFv3KnCyUU4xzKTCz8bplh6Bkc6XxBfoT2DxHQsLL842LK61x5AnQp5BZKqc24ime2BvosDvqawSKjaFiwG/aWPRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cS5RBcX8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743789315; x=1775325315;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pIENLeWzTVJaaXaUldVebDEO8Uq2auKXJ/zTuKpRGc0=;
  b=cS5RBcX8WVQOf/JI3BbiZgxYeiEAgULmmu2NSzvq4yZ312VY93PDul9S
   GWAo6FN2Tz1iF84duz1eS7C2kLL0Ne4wAb/4w5iUyNN7iFnCR3GewTOpC
   JUrv0DGH4ffj2RY62mk+lQa4mQrf+PMQidr3FiuS947599PDdP8AfbHOD
   FzID3hJpPW5/Ok3nwqXADYU9PKj39eRD8b1wwp/x+dLipq3abhOHt5fh0
   mhxdLY2tnXPMpCwUEXUBk/wge3nOyTz5mXi74R9d7qUEPag5XWdClGDHh
   E4Njzr3W9CgNayo3fI1FC2STBQ6k8SjHqzneYrAJ8WQmPN45O3T/Z2kU9
   w==;
X-CSE-ConnectionGUID: mFr2Ue2BTP2EZsE/gSOwjA==
X-CSE-MsgGUID: lyQ3Vt/uQrOCJkcJTIGOsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45379454"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="45379454"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:55:14 -0700
X-CSE-ConnectionGUID: XcFkPhxZTJWIrLqhXG8wPg==
X-CSE-MsgGUID: DQH8Q7APT5qgIEL6nrV9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="131512363"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.124.223.29]) ([10.124.223.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:55:10 -0700
Message-ID: <c797714b-4180-4439-8a02-3cfacd42dafe@intel.com>
Date: Fri, 4 Apr 2025 10:55:09 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] x86: Handle int3 for inline KASAN reports
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, hpa@zytor.com,
 hch@infradead.org, nick.desaulniers+lkml@gmail.com,
 kuan-ying.lee@canonical.com, masahiroy@kernel.org,
 samuel.holland@sifive.com, mingo@redhat.com, corbet@lwn.net,
 ryabinin.a.a@gmail.com, guoweikang.kernel@gmail.com, jpoimboe@kernel.org,
 ardb@kernel.org, vincenzo.frascino@arm.com, glider@google.com,
 kirill.shutemov@linux.intel.com, apopple@nvidia.com,
 samitolvanen@google.com, kaleshsingh@google.com, jgross@suse.com,
 andreyknvl@gmail.com, scott@os.amperecomputing.com, tony.luck@intel.com,
 dvyukov@google.com, pasha.tatashin@soleen.com, ziy@nvidia.com,
 broonie@kernel.org, gatlin.newhouse@gmail.com, jackmanb@google.com,
 wangkefeng.wang@huawei.com, thiago.bauermann@linaro.org, tglx@linutronix.de,
 kees@kernel.org, akpm@linux-foundation.org, jason.andryuk@amd.com,
 snovitoll@gmail.com, xin@zytor.com, jan.kiszka@siemens.com, bp@alien8.de,
 rppt@kernel.org, peterz@infradead.org, pankaj.gupta@amd.com,
 thuth@redhat.com, andriy.shevchenko@linux.intel.com,
 joel.granados@kernel.org, kbingham@kernel.org, nicolas@fjasle.eu,
 mark.rutland@arm.com, surenb@google.com, catalin.marinas@arm.com,
 morbo@google.com, justinstitt@google.com, ubizjak@gmail.com,
 jhubbard@nvidia.com, urezki@gmail.com, dave.hansen@linux.intel.com,
 bhe@redhat.com, luto@kernel.org, baohua@kernel.org, nathan@kernel.org,
 will@kernel.org, brgerst@gmail.com
Cc: llvm@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, x86@kernel.org
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <012c84049b853d6853a7d6c887ce0c2323bcd80a.1743772053.git.maciej.wieczor-retman@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <012c84049b853d6853a7d6c887ce0c2323bcd80a.1743772053.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/25 06:14, Maciej Wieczor-Retman wrote:
> When a tag mismatch happens in inline software tag-based KASAN on x86 an
> int3 instruction is executed and needs proper handling.

Does this mean "inline software"? Or "inline" functions? I'm not quite
parsing that. I think it needs some more background.

> Call kasan_report() from the int3 handler and pass down the proper
> information from registers - RDI should contain the problematic address
> and RAX other metadata.
> 
> Also early return from the int3 selftest if inline KASAN is enabled
> since it will cause a kernel panic otherwise.
...
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index bf82c6f7d690..ba277a25b57f 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1979,6 +1979,9 @@ static noinline void __init int3_selftest(void)
>  	};
>  	unsigned int val = 0;
>  
> +	if (IS_ENABLED(CONFIG_KASAN_INLINE))
> +		return;

Comments, please. This is a total non sequitur otherwise.

>  	BUG_ON(register_die_notifier(&int3_exception_nb));
>  
>  	/*
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 9f88b8a78e50..32c81fc2d439 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
...
> @@ -849,6 +850,51 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
>  	cond_local_irq_disable(regs);
>  }
>  
> +#ifdef CONFIG_KASAN_SW_TAGS
> +
> +#define KASAN_RAX_RECOVER	0x20
> +#define KASAN_RAX_WRITE	0x10
> +#define KASAN_RAX_SIZE_MASK	0x0f
> +#define KASAN_RAX_SIZE(rax)	(1 << ((rax) & KASAN_RAX_SIZE_MASK))

This ABI _looks_ like it was conjured out out of thin air. I assume it's
coming from the compiler. Any pointers to that ABI definition in or out
of the kernel would be appreciated.

> +static bool kasan_handler(struct pt_regs *regs)
> +{
> +	int metadata = regs->ax;
> +	u64 addr = regs->di;
> +	u64 pc = regs->ip;
> +	bool recover = metadata & KASAN_RAX_RECOVER;
> +	bool write = metadata & KASAN_RAX_WRITE;
> +	size_t size = KASAN_RAX_SIZE(metadata);

"metadata" is exactly the same length as "regs->ax", so it seems a
little silly. Also, please use vertical alignment as a tool to make code
more readable. Isn't this much more readable?

	bool recover = regs->ax & KASAN_RAX_RECOVER;
	bool write   = regs->ax & KASAN_RAX_WRITE;
	size_t size  = KASAN_RAX_SIZE(regs->ax);
	u64 addr     = regs->di;
	u64 pc       = regs->ip;

> +	if (!IS_ENABLED(CONFIG_KASAN_INLINE))
> +		return false;
> +
> +	if (user_mode(regs))
> +		return false;
> +
> +	kasan_report((void *)addr, size, write, pc);
> +
> +	/*
> +	 * The instrumentation allows to control whether we can proceed after
> +	 * a crash was detected. This is done by passing the -recover flag to
> +	 * the compiler. Disabling recovery allows to generate more compact
> +	 * code.
> +	 *
> +	 * Unfortunately disabling recovery doesn't work for the kernel right
> +	 * now. KASAN reporting is disabled in some contexts (for example when
> +	 * the allocator accesses slab object metadata; this is controlled by
> +	 * current->kasan_depth). All these accesses are detected by the tool,
> +	 * even though the reports for them are not printed.
> +	 *
> +	 * This is something that might be fixed at some point in the future.
> +	 */

Can we please find a way to do this that doesn't copy and paste a rather
verbose comment?

What if we passed 'recover' into kasan_report() and had it do the die()?

> +	if (!recover)
> +		die("Oops - KASAN", regs, 0);
> +	return true;
> +}
> +
> +#endif
> +
>  static bool do_int3(struct pt_regs *regs)
>  {
>  	int res;
> @@ -863,6 +909,12 @@ static bool do_int3(struct pt_regs *regs)
>  	if (kprobe_int3_handler(regs))
>  		return true;
>  #endif
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +	if (kasan_handler(regs))
> +		return true;
> +#endif
I won't get _too_ grumbly about ti since there's another culprit right
above, but the "no #fidefs in .c files" rule still applies. The right
way to do this is with a stub kasan_handler() in a header with the
#ifdef in the header.

Actually, ditto on the kasan_handler() #ifdef. I suspect it can go away
too and be replaced with a IS_ENABLED(CONFIG_KASAN_SW_TAGS) check.

