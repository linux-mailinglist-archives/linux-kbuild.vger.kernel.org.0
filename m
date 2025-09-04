Return-Path: <linux-kbuild+bounces-8726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68550B445A5
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 20:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F925426E7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 18:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB69B31A57D;
	Thu,  4 Sep 2025 18:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuPqvLm3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59930F528;
	Thu,  4 Sep 2025 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757011218; cv=none; b=Dgmgi7q+vna22KjEmN3dlBuAm8gQ1PVtvbB2Ti5w01NjWrVddLBIH8X0vkz7droHlqzY51q8h7XHRht0tgpyoEjhwVz02UaT/+/wY9HKwPUAP27H68p4bYoTmwpeiSovpTYmcJDWT2kxbD1PGdXWQNnKSrB2Tglq0w9x0nG86ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757011218; c=relaxed/simple;
	bh=ILiVByv+j8sL6RIqPKHr6lcD5lYejE6CwCw4EFoN4f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obk7RyANdLP5hePch2jjrbzVTqa7gqjIua1Y9g1aKwuwGYtlcmExVeY7hEjkWIG3KEHQFgbWV2H8VcRiiaohmJspjJ5ho/I48fb+Q3GqRxvQBEd4tbm1DysBfMdGHr5yUqxEkhO8+pWvV4FDKPMWH/fNsRjrsxd6dnZ4a0tK4X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuPqvLm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0ADC4CEF6;
	Thu,  4 Sep 2025 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757011214;
	bh=ILiVByv+j8sL6RIqPKHr6lcD5lYejE6CwCw4EFoN4f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuPqvLm3BxpuhLbqcQawdON7moRQflTsG/i697n1BQm5czZrXEMAY0SKKt8ZbpKxa
	 CfwMIMFPO+HtPWYHlb1Dykig0UCLgZwo/CZVLh9iGcfAIqbv4EK6UrGC+zUj2DG5Nk
	 32t9+6h5DTNfOBTEbQuhvMqcW/zTCLi/NvfCiXtdUFFg+epbo4E3OP7h1OzCZyb/mU
	 bykMskO9KqcE00XXI9fXVewJdKZOELlVb9E1ydT1pFn3FhuhAqq7kJIGaawMvcskQa
	 Kg99OHJffxp9hNXtIzfwD4PvSRtB6Y6dKy/9mfg2g6N2552wzx/5T9va88RdST70Jr
	 1N01jP9mlh7Iw==
Date: Thu, 4 Sep 2025 11:40:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
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
Subject: Re: [PATCH v2 4/9] x86/cfi: Standardize on common "CFI:" prefix for
 CFI reports
Message-ID: <20250904184004.GC2110053@ax162>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-4-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904034656.3670313-4-kees@kernel.org>

On Wed, Sep 03, 2025 at 08:46:43PM -0700, Kees Cook wrote:
> Use a regular "CFI:" prefix for CFI reports during alternatives setup,
> including reporting when nothing has happened (i.e. CONFIG_FINEIBT=n).
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Obviously minor but I had pointed out on v1 that there appears to be
some inconsistency within the diff around capitalization, "ignoring" vs.
"Ignoring".

> ---
>  arch/x86/kernel/alternative.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 7bde68247b5f..d8f4ac95b4df 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1266,26 +1266,26 @@ static __init int cfi_parse_cmdline(char *str)
>  		} else if (!strcmp(str, "norand")) {
>  			cfi_rand = false;
>  		} else if (!strcmp(str, "warn")) {
> -			pr_alert("CFI mismatch non-fatal!\n");
> +			pr_alert("CFI: mismatch non-fatal!\n");
>  			cfi_warn = true;
>  		} else if (!strcmp(str, "paranoid")) {
>  			if (cfi_mode == CFI_FINEIBT) {
>  				cfi_paranoid = true;
>  			} else {
> -				pr_err("Ignoring paranoid; depends on fineibt.\n");
> +				pr_err("CFI: ignoring paranoid; depends on fineibt.\n");
>  			}
>  		} else if (!strcmp(str, "bhi")) {
>  #ifdef CONFIG_FINEIBT_BHI
>  			if (cfi_mode == CFI_FINEIBT) {
>  				cfi_bhi = true;
>  			} else {
> -				pr_err("Ignoring bhi; depends on fineibt.\n");
> +				pr_err("CFI: ignoring bhi; depends on fineibt.\n");
>  			}
>  #else
> -			pr_err("Ignoring bhi; depends on FINEIBT_BHI=y.\n");
> +			pr_err("CFI: ignoring bhi; depends on FINEIBT_BHI=y.\n");
>  #endif
>  		} else {
> -			pr_err("Ignoring unknown cfi option (%s).", str);
> +			pr_err("CFI: Ignoring unknown option (%s).", str);
>  		}
>  
>  		str = next;
> @@ -1757,7 +1757,7 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  	switch (cfi_mode) {
>  	case CFI_OFF:
>  		if (builtin)
> -			pr_info("Disabling CFI\n");
> +			pr_info("CFI: disabled\n");
>  		return;
>  
>  	case CFI_KCFI:
> @@ -1766,7 +1766,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  			goto err;
>  
>  		if (builtin)
> -			pr_info("Using kCFI\n");
> +			pr_info("CFI: Using %sretpoline kCFI\n",
> +				cfi_rand ? "rehashed " : "");
>  		return;
>  
>  	case CFI_FINEIBT:
> @@ -2005,6 +2006,8 @@ bool decode_fineibt_insn(struct pt_regs *regs, unsigned long *target, u32 *type)
>  static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  			    s32 *start_cfi, s32 *end_cfi, bool builtin)
>  {
> +	if (IS_ENABLED(CONFIG_CFI) && builtin)
> +		pr_info("CFI: Using standard kCFI\n");
>  }
>  
>  #ifdef CONFIG_X86_KERNEL_IBT
> -- 
> 2.34.1
> 

