Return-Path: <linux-kbuild+bounces-8635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E82CAB38A93
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 21:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A277A7C3727
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 19:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876C12E7BDA;
	Wed, 27 Aug 2025 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ii6ET0wv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53679273810;
	Wed, 27 Aug 2025 19:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756324679; cv=none; b=tfpMRq3521wAjzyFqL73PiOw1+5i02woo5TZBE0lX3/MUwOfijTierMmTA9ew+g+NRLtZAIe4IKoyGOr6ZvbBbDlKXKg/JXXDUaanSwSGqqCT/aa4ucTZ2PyIvheQ1XRwVkz2CnuXsKJ/ZIC1Bd2azenNFAvmlE2Re6BrQ6lRBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756324679; c=relaxed/simple;
	bh=vy4jaU+tF4nJ+2/n+HhT0G0kW3maniYcW78uwrPgAQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNOtfC2xcUmS/ZajugmH/cxBDHuHgaaE2ViE7GTi0bhy+GEOyjKQBEgB5FCAnUY0S4qUtGIxa+PQQTVYHkfbkc7Nny900dgSIvAs1SIciiHuMjodx7iqIjYMAN8bZUSVDFIpGIANKA5wP1nM3FhMxwvs5pNi/DTsW3NKz305SKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ii6ET0wv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B1EC4CEEB;
	Wed, 27 Aug 2025 19:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756324678;
	bh=vy4jaU+tF4nJ+2/n+HhT0G0kW3maniYcW78uwrPgAQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ii6ET0wvArOsxX/ssBzb/+H7x9KbZftfTVjf/SXXq4vInYHTqx+iHWGk9SusLNXM8
	 9M8JLRgUhM+h+7PWPxGKRNDg81FH5AjGacpl9nbf63lJHmieGEU/EV9dVFOHiztk9r
	 yLffNs4q5n8uhwnSc+/so3sr3s/b3LlpZIKq5YPwx1tjjMKnzMKIUSkqRrpqR9g0oP
	 E82PXUm9owcegxXN+Hjw40BjDxX21cZaTVKYwY2gJl7jAcWQ08NWeBl2ctSqA9p56T
	 znFZ/U+3N5oO88nF2YnkSs1sk45Sx+XbR6QU1ECiSSJMalVUM5n/7+89hWJng7Jta4
	 ydYMGwfNEvSrA==
Date: Wed, 27 Aug 2025 12:57:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <20250827195753.GB3572128@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825142603.1907143-3-kees@kernel.org>

On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:
> From: Kees Cook <kees@outflux.net>
> 
> Add "debug" option for "cfi=" bootparam to get details on early CFI
> initialization steps. Standardize CFI pr_info() lines to use "CFI:"
> prefix. Standardize "CFI: Using ..." to always report which CFI mode is
> being used, regardless of CONFIG_FINEIBT. Document all the "cfi=" options.
> 
> Signed-off-by: Kees Cook <kees@outflux.net>

I am not sure if the x86 maintainers are "patch count adverse" but it
feels like this would be a little easier to review as four separate
patches. Every sentence in the commit message is basically its own
change.

1. The initial documentation for cfi= and its current values.
2. Standardization of pr_info() calls to use "CFI:"
3. Adding "CFI: Using" to __apply_fineibt()
4. Adding cfi=debug

Patch four would become much simpler to understand, especially with
Peter's suggested change.

> ---
>  .../admin-guide/kernel-parameters.txt         | 18 +++++++++
>  arch/x86/kernel/alternative.c                 | 39 +++++++++++++++----
>  2 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 747a55abf494..7b4bddb5a030 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -608,6 +608,24 @@
>  	ccw_timeout_log	[S390]
>  			See Documentation/arch/s390/common_io.rst for details.
>  
> +	cfi=		[X86-64] Set Control Flow Integrity checking features
> +			when CONFIG_FINEIBT is enabled.
> +			Format: feature[,feature...]
> +			Default: auto
> +
> +			auto:	  Use FineIBT if IBT available, otherwise kCFI.
> +				  Under FineIBT, enable "paranoid" mode when
> +				  FRED is not available.
> +			off:	  Turn off CFI checking.
> +			kcfi:	  Use kCFI (disable FineIBT).
> +			fineibt:  Use FineIBT (even if IBT not available).
> +			norand:   Do not re-randomize CFI hashes.
> +			paranoid: Add caller hash checking under FineIBT.
> +			bhi:	  Enable register poisoning to stop speculation
> +				  across FineIBT. (Disabled by default.)
> +			warn:	  Do not enforce CFI checking: warn only.
> +			debug:	  Report CFI initialization details.
> +
>  	cgroup_disable=	[KNL] Disable a particular controller or optional feature
>  			Format: {name of the controller(s) or feature(s) to disable}
>  			The effects of cgroup_disable=foo are:
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 7bde68247b5f..5d80ae77c042 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1225,6 +1225,7 @@ int cfi_get_func_arity(void *func)
>  
>  static bool cfi_rand __ro_after_init = true;
>  static u32  cfi_seed __ro_after_init;
> +static bool cfi_debug __ro_after_init;
>  
>  /*
>   * Re-hash the CFI hash with a boot-time seed while making sure the result is
> @@ -1259,6 +1260,8 @@ static __init int cfi_parse_cmdline(char *str)
>  		} else if (!strcmp(str, "off")) {
>  			cfi_mode = CFI_OFF;
>  			cfi_rand = false;
> +		} else if (!strcmp(str, "debug")) {
> +			cfi_debug = true;
>  		} else if (!strcmp(str, "kcfi")) {
>  			cfi_mode = CFI_KCFI;
>  		} else if (!strcmp(str, "fineibt")) {
> @@ -1266,26 +1269,26 @@ static __init int cfi_parse_cmdline(char *str)
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

You lowercase "Ignoring" earlier but not here, intentional? There are a
couple of other messages that have a capital first letter but not
others.

>  		}
>  
>  		str = next;
> @@ -1734,6 +1737,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  	 * rewrite them. This disables all CFI. If this succeeds but any of the
>  	 * later stages fails, we're without CFI.
>  	 */
> +	if (builtin && cfi_debug)
> +		pr_info("CFI: disabling all indirect call checking\n");
>  	ret = cfi_disable_callers(start_retpoline, end_retpoline);
>  	if (ret)
>  		goto err;
> @@ -1744,43 +1749,61 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  			cfi_bpf_hash = cfi_rehash(cfi_bpf_hash);
>  			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
>  		}
> +		if (builtin && cfi_debug)
> +			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
>  
> +		if (builtin && cfi_debug)
> +			pr_info("CFI: rehashing all preambles\n");
>  		ret = cfi_rand_preamble(start_cfi, end_cfi);
>  		if (ret)
>  			goto err;
>  
> +		if (builtin && cfi_debug)
> +			pr_info("CFI: rehashing all indirect calls\n");
>  		ret = cfi_rand_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
> +	} else {
> +		if (builtin && cfi_debug)
> +			pr_info("CFI: rehashing disabled\n");
>  	}
>  
>  	switch (cfi_mode) {
>  	case CFI_OFF:
>  		if (builtin)
> -			pr_info("Disabling CFI\n");
> +			pr_info("CFI: disabled\n");
>  		return;
>  
>  	case CFI_KCFI:
> +		if (builtin && cfi_debug)
> +			pr_info("CFI: enabling all indirect call checking\n");
>  		ret = cfi_enable_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
>  
>  		if (builtin)
> -			pr_info("Using kCFI\n");
> +			pr_info("CFI: Using %s kCFI\n",
> +				cfi_rand ? "rehashed" : "retpoline");
>  		return;
>  
>  	case CFI_FINEIBT:
> +		if (builtin && cfi_debug)
> +			pr_info("CFI: adding FineIBT to all preambles\n");
>  		/* place the FineIBT preamble at func()-16 */
>  		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
>  		if (ret)
>  			goto err;
>  
>  		/* rewrite the callers to target func()-16 */
> +		if (builtin && cfi_debug)
> +			pr_info("CFI: rewriting indirect call sites to use FineIBT\n");
>  		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
>  		if (ret)
>  			goto err;
>  
>  		/* now that nobody targets func()+0, remove ENDBR there */
> +		if (builtin && cfi_debug)
> +			pr_info("CFI: removing old endbr insns\n");
>  		cfi_rewrite_endbr(start_cfi, end_cfi);
>  
>  		if (builtin) {
> @@ -2005,6 +2028,8 @@ bool decode_fineibt_insn(struct pt_regs *regs, unsigned long *target, u32 *type)
>  static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
>  			    s32 *start_cfi, s32 *end_cfi, bool builtin)
>  {
> +	if (builtin)
> +		pr_info("CFI: Using standard kCFI\n");
>  }
>  
>  #ifdef CONFIG_X86_KERNEL_IBT
> -- 
> 2.34.1
> 

