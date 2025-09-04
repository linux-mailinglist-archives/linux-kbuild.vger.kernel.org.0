Return-Path: <linux-kbuild+bounces-8725-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86BB44577
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 20:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C80781CC0672
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 18:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935492FDC4B;
	Thu,  4 Sep 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeOB5sfg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6206B243954;
	Thu,  4 Sep 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010783; cv=none; b=QG6kf5XOop9cO7aIsKOOvcKlWMyLFdbZfR4yqTQJZPQh3fGp9JgPBMfUvlNngHhY2hjM09sElFieMexrJRMiiIefIxgaQtuIIp+ePUziyZMqw3uVosj7mGkieHhbjcpwpUudSRd1D0XcmDCCGEfxs309oJ5UGork1gE6FLYOlUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010783; c=relaxed/simple;
	bh=vso1jcuXl4eMsNTY6YtZqzsNKfEUrShjwPxBJ8ib6Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcNuSDkep2eQRSGURzLldDytpWLXliwyctbA2dUOy5fiKOZG5FtQYYL9YHbAoY5NXnjI1yRGgeAtjBrTbE4/szXpp8AuADd3wnrRlYeKT3CvyFrxjpaieb6QpGF2VPK1B2+mZ+gd9wd6DEicWKpD6kxfC/CY0Digami75/jpb2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeOB5sfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58426C4CEF0;
	Thu,  4 Sep 2025 18:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757010782;
	bh=vso1jcuXl4eMsNTY6YtZqzsNKfEUrShjwPxBJ8ib6Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeOB5sfg1L8tYWhFhqz2+8pjsUnTOpx9cXPDxNx51xZLJCftmeovcMPkXsRvqFICf
	 nDdAqQ76nV20Ej46lnDZ2exe/GQRuCAu/zDKenXuF52NkMVjkwQ60r605Qv2qk0LMT
	 yytrDQgaMSRzgSCACAUVeXN+IG5zpDuFZcB9Vhvs6HgKGjDUd1MNCUkNQdmgoqNuqp
	 43RQIvazYa3NVw8wSTiBAtqLh5duh+MB7aNAF/nnaIpXB0sZDWpWFEKQ4fp7JucklF
	 x9HuiqWcOi6CRtX6yjY5m/F1zA9+7sbwTErgFA7+xxzsaeuofVvBZfNlk839R4mCVY
	 682w7KI4IXfvw==
Date: Thu, 4 Sep 2025 11:32:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/9] x86/cfi: Document the "cfi=" bootparam options
Message-ID: <20250904183254.GB2110053@ax162>
References: <20250904033217.it.414-kees@kernel.org>
 <20250904034656.3670313-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904034656.3670313-3-kees@kernel.org>

On Wed, Sep 03, 2025 at 08:46:42PM -0700, Kees Cook wrote:
> The kernel-parameters.txt didn't have a section for the cfi= options.
> Add it.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 747a55abf494..8bbffbb334ab 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -608,6 +608,23 @@
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
> +
>  	cgroup_disable=	[KNL] Disable a particular controller or optional feature
>  			Format: {name of the controller(s) or feature(s) to disable}
>  			The effects of cgroup_disable=foo are:
> -- 
> 2.34.1
> 

