Return-Path: <linux-kbuild+bounces-8712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB82B43346
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 09:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F281896FA3
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 07:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1EE2853E2;
	Thu,  4 Sep 2025 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W7NMLZeI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F001242D86;
	Thu,  4 Sep 2025 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756969252; cv=none; b=dOXg1dOQt1SWP+ClxYfx/6bUFUgLdgxPohH3Yop26E5FYZSkJItqB4OSaioeUxxj5iyD7BexmSus4MNhBrlGpC6XGw954lzBOqZMYbhByxZ/znjy51oj3hOQBAV59jq+/uFh8n9ue13jxaVMdU1vj/nJ2UO+NvvxEf5IKjwOgqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756969252; c=relaxed/simple;
	bh=37erLIONhaV3dnD3FCCl2zgDM26oRzL9Ox+wdNor9eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMSfCpPAVbmaSWKHI+ipobt/QcboDHyL+o8vOxsWPWj26zvdQY+T10Z4R81ormxmwEGGNPGw3c/4yvW6l/WONKCMrQRQUXg7Ssvg8RIKae5jHxTYSIkfVwPqDz1gyQtgfbKkt9bQiRWVEOF2dgSRyuzF28C2ClzN5i2Pvja7uD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W7NMLZeI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DNsi1N8ANWHoR2Q6Eu2ZFoyXqqxCVpVHzpLmykJN6Ec=; b=W7NMLZeIKCTe5tsHWthhHxHA7Z
	1CM5FkomVoWsu0gk9+juyLSnrVjOoPAU0I0OsiTlP32/Ytk7Rm2QF4vQb0/8XRghZEDASC+UTwEge
	AwbQR1Hct+5rTN4ThUNZawy29bZdgLFwo+hEI4yq6NMW+R476V5NQ6lv3DP8sMdt66OYvI9IUUtbV
	CoepnEKHlSfy5PdAQ6vfG3fDIhYYA+b+iUXnGCuC9zWvJvLSsxab0YKumo5WtA2prviAgm1DEqotZ
	VHW8Gh0E7ycyGsX4mLMekcbei1w6XLwxJi0aiABtpTcpVT3AKkqqnTWgIJOzE7aytSc1hYQQ4veoS
	M0LIJhxg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3xT-0000000EVBI-1pV1;
	Thu, 04 Sep 2025 07:00:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C15C30034B; Thu, 04 Sep 2025 09:00:35 +0200 (CEST)
Date: Thu, 4 Sep 2025 09:00:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 5/9] x86/cfi: Add "debug" option to "cfi=" bootparam
Message-ID: <20250904070035.GW4067720@noisy.programming.kicks-ass.net>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-5-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904034656.3670313-5-kees@kernel.org>

On Wed, Sep 03, 2025 at 08:46:44PM -0700, Kees Cook wrote:

> @@ -1734,6 +1737,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  	 * rewrite them. This disables all CFI. If this succeeds but any of the
>  	 * later stages fails, we're without CFI.
>  	 */
> +	if (cfi_debug)
> +		pr_info("CFI: disabling all indirect call checking\n");
>  	ret = cfi_disable_callers(start_retpoline, end_retpoline);
>  	if (ret)
>  		goto err;
> @@ -1744,14 +1749,23 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  			cfi_bpf_hash = cfi_rehash(cfi_bpf_hash);
>  			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
>  		}
> +		if (cfi_debug)
> +			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
>  
> +		if (cfi_debug)
> +			pr_info("CFI: rehashing all preambles\n");

So this repeated if() bugs the heck out of me ... :-)

What would you prefer, this:

		if (cfi_debug) {
			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
			pr_info("CFI: rehashing all preambles\n");
		}

or something like:

#define pr_cfi_debug(X...) if (cfi_debug) pr_info(X)

		pr_cfi_debug("CFI: cfi_seed: 0x%08x\n", cfi_seed);
		pr_cfi_debug("CFI: rehashing all preambles\n");

?

>  		ret = cfi_rand_preamble(start_cfi, end_cfi);
>  		if (ret)
>  			goto err;
>  
> +		if (cfi_debug)
> +			pr_info("CFI: rehashing all indirect calls\n");
>  		ret = cfi_rand_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
> +	} else {
> +		if (cfi_debug)
> +			pr_info("CFI: rehashing disabled\n");
>  	}
>  
>  	switch (cfi_mode) {
> @@ -1761,6 +1775,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  		return;
>  
>  	case CFI_KCFI:
> +		if (cfi_debug)
> +			pr_info("CFI: enabling all indirect call checking\n");

This should be "CFI: re-enabling all..." I suppose, to better match the
earlier "CFI: disabling all ..." message.

>  		ret = cfi_enable_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
> @@ -1771,17 +1787,23 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  		return;
>  
>  	case CFI_FINEIBT:
> +		if (cfi_debug)
> +			pr_info("CFI: adding FineIBT to all preambles\n");
>  		/* place the FineIBT preamble at func()-16 */
>  		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
>  		if (ret)
>  			goto err;
>  
>  		/* rewrite the callers to target func()-16 */
> +		if (cfi_debug)
> +			pr_info("CFI: rewriting indirect call sites to use FineIBT\n");
>  		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
>  
>  		/* now that nobody targets func()+0, remove ENDBR there */
> +		if (cfi_debug)
> +			pr_info("CFI: removing old endbr insns\n");
>  		cfi_rewrite_endbr(start_cfi, end_cfi);
>  
>  		if (builtin) {
> @@ -2324,6 +2346,7 @@ void __init alternative_instructions(void)
>  
>  	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
>  			__cfi_sites, __cfi_sites_end, true);
> +	cfi_debug = false;
>  
>  	/*
>  	 * Rewrite the retpolines, must be done before alternatives since

