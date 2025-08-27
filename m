Return-Path: <linux-kbuild+bounces-8634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071FB38A6D
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 21:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1421C209C0
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 19:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB51B22F74D;
	Wed, 27 Aug 2025 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTybwMbH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B730CDA1;
	Wed, 27 Aug 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756324025; cv=none; b=ltX45WphG95h8PZEPl4Yo8RyMiNa0DYuPfLX+o5qAQCGDFVh7kGlFVnUX/90DhaPjmgBE7OJDJFuNHxi+n2m+HhICBA547SvAoGPYrFNBtgd7uvCi/H1Bq4bGYsWePF0Kypx4/p8fddcX+w/BybFwQIuypr/srlxIstJv1v8ofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756324025; c=relaxed/simple;
	bh=81/v8nWc8euoHfOV4Sjmxdu7D+OwRFilhJeDCR9aoI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2Qrur1yNcFPV1nR4TJ4pW4C9P4CGeHfFCtnj0b8/k2aMB1syAYG6+caSdKNT8X7jJxAhBB7J/HcTwfiGm/CoHYSUu0jEAtE+sUlg3/+jp0LmrbdflSMQLDU23vpn08LCKwSZajDJungggI2d7jVwCIuUqK06OW9G9ywiV6oxkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTybwMbH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2933C4CEEB;
	Wed, 27 Aug 2025 19:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756324024;
	bh=81/v8nWc8euoHfOV4Sjmxdu7D+OwRFilhJeDCR9aoI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTybwMbHizBbBlCHjbHP/jpIktQ/ZQYuzvV1Tnp3YyDotqDC81SzIyROZnM4yuBYP
	 G1Mk4y/PMZDns8MmWGWMAUj1e+KchkU/0F5x2SS4M1O/bGVM2s5dzaJNvl1JW+HDqH
	 jL+ptyEcHrr//HSSh4xi74Pm322Med55qEJfMDCu2zkv4rMXdPzA1gHPofldXLtFRI
	 /KqeGOWvWaUrDk4oGIXOkxz2ITxzITs8K6PClIDn95mtSWNUwCN/VJiiet0Pyp3+EE
	 cev3f58U6HuM8xgSHWTLjRDxgreGTPEbeJXbYmeIjUt/LGBoRJu+q3lfriZq6iwLgs
	 +h2byf++DGPuw==
Date: Wed, 27 Aug 2025 12:46:57 -0700
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
Subject: Re: [PATCH 1/5] compiler_types.h: Move __nocfi out of
 compiler-specific header
Message-ID: <20250827194657.GA3572128@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825142603.1907143-1-kees@kernel.org>

On Mon, Aug 25, 2025 at 07:25:48AM -0700, Kees Cook wrote:
> From: Kees Cook <kees@outflux.net>
> 
> Prepare for GCC KCFI support and move the __nocfi attribute from
> compiler-clang.h to compiler_types.h. This was already effectively gated
> by CONFIG_CFI_CLANG, so this remains safe for non-KCFI GCC builds.
> 
> Signed-off-by: Kees Cook <kees@outflux.net>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  include/linux/compiler-clang.h | 5 -----
>  include/linux/compiler_types.h | 4 +++-
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index fa4ffe037bc7..7a4568e421dc 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -96,11 +96,6 @@
>  # define __noscs	__attribute__((__no_sanitize__("shadow-call-stack")))
>  #endif
>  
> -#if __has_feature(kcfi)
> -/* Disable CFI checking inside a function. */
> -#define __nocfi		__attribute__((__no_sanitize__("kcfi")))
> -#endif
> -
>  /*
>   * Turn individual warnings and errors on and off locally, depending
>   * on version.
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 16755431fc11..a910f9fa5341 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -432,7 +432,9 @@ struct ftrace_likely_data {
>  # define __noscs
>  #endif
>  
> -#ifndef __nocfi
> +#if defined(CONFIG_CFI_CLANG)

I tend to prefer '#ifdef' for single symbols.

> +# define __nocfi		__attribute__((__no_sanitize__("kcfi")))
> +#else
>  # define __nocfi
>  #endif
>  
> -- 
> 2.34.1
> 

