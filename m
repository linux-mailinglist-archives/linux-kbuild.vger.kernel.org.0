Return-Path: <linux-kbuild+bounces-8724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E61A4B44561
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 20:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC3FA1C877BD
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 18:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F0E343205;
	Thu,  4 Sep 2025 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNb2zDM1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20420342CAD;
	Thu,  4 Sep 2025 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010519; cv=none; b=BvTtlcrcYvhuNsjigbvvg9zY9rdKoTIFUJsQsnuZXyKcG1p36aSiyoa8oxIXBT9fDFpKhAIj1Jq0j2Kd/y8T/dByQookGmNOEkd/eULAd9+EOG1vdx1gZY3aUhkRh8UxycRRyEUalM4QCp+uaRYjOkaTDCsXA9iqo9174pNJSnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010519; c=relaxed/simple;
	bh=+XQg5Gr7AwL8fTXdZyl2qxqsdyHuqVxLGzPFbhKUbHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHy+saTwbdO2O13V6mveKXTex91+uhIT2t2EXPRlL2m4deDsCeAMqSL+6q+hfsJJ7g0wsHRpZxQ7YhQ6MGT6ahZlgAN4+0Ns8nVus+HVMD74txogkynNzanTYQxbufsWh+6xHQw2cUwdhQowtkORYA9gxIVUoIHUFbHCcMCy/QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNb2zDM1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053CDC4CEF1;
	Thu,  4 Sep 2025 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757010517;
	bh=+XQg5Gr7AwL8fTXdZyl2qxqsdyHuqVxLGzPFbhKUbHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNb2zDM1DtPkwJjb2Km/2/fT+7BssKm2TAp9GcwMc2kwey4bKvumwTBZC8XjicAgC
	 O8vKxGEQ6ZrnbzNzRsgKdmln5fi1QVQ+ggBSNnCmXRh2F8TKHBagjC/7JuI0gjZ7a0
	 eQeXW07loWW1uGspxhWsQshfExAjBMJoe10aDY1wE58xKccTgdaulrjO8VykzTyEWg
	 Ax0/oRKgjIAljA0ajad4796myhhQBKaRVODi31HN6fiOYLHb/KzOb4vpTxPYRFYA+E
	 rlfsr63uFdOgrmw0DWihkM2EWyMEbqUss3dI0PwAziP2dKS58ObkfVS0tvszvFgLRH
	 hoMvTNN+MFWew==
Date: Thu, 4 Sep 2025 11:28:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>, llvm@lists.linux.dev,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/9] compiler_types.h: Move __nocfi out of
 compiler-specific header
Message-ID: <20250904182829.GA2110053@ax162>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904034656.3670313-1-kees@kernel.org>

On Wed, Sep 03, 2025 at 08:46:40PM -0700, Kees Cook wrote:
> Prepare for GCC KCFI support and move the __nocfi attribute from
> compiler-clang.h to compiler_types.h. This was already gated by
> CONFIG_CFI_CLANG, so this remains safe for non-KCFI GCC builds.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

I reviewed this on v1:

https://lore.kernel.org/20250827194657.GA3572128@ax162/

but just to make sure it sticks :)

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
> +# define __nocfi		__attribute__((__no_sanitize__("kcfi")))
> +#else
>  # define __nocfi
>  #endif
>  
> -- 
> 2.34.1
> 

