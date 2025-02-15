Return-Path: <linux-kbuild+bounces-5770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB9A370B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 21:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8777188FCE9
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 20:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B471EA7DA;
	Sat, 15 Feb 2025 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkEwe60R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76E1925A6;
	Sat, 15 Feb 2025 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739651858; cv=none; b=ffUcz0nJWfsmXtdU2AP3Rg/ND2No9eX/ZplKIPqZpBCuZreEfl6lxahpTIkTefZl6DbULJk2snzinqONbugxoTpZOJ3dYNc/sKoPAVmRLEn3hU+XAC226GP5wZLppOFGeaXbHx/+hEcIc+zzV3nZ4WN/pkkBhtzpsOAxykjJCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739651858; c=relaxed/simple;
	bh=oM535P0+yVW/RCS+EfwNf5PILDqtQCaGF2LRWeDXtdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvwvwmpdCU235XW67z05VzfxniHfPRFmDGwH6a7/oXZg4phil2OEqseyNyBRy0hL19hrXvH4S2surYStU2CFItLsYHQ7XaE29nqXS9RQ1/xNLL2C5FyLQQXuNGZV3aFXtvIBfCYqnfrfqCGAco6s/TtUOgjLrgSRRXcMvPV/idk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkEwe60R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C82C4CEE2;
	Sat, 15 Feb 2025 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739651858;
	bh=oM535P0+yVW/RCS+EfwNf5PILDqtQCaGF2LRWeDXtdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkEwe60R1qpUR+c8jFCMzTC/t/8DkpdMN8Q0p0X/kI/T+6fIbudfBR27hdTYJ7AJs
	 WKVQKWtHPbyHvi9RjuBYTsPzNd6nTZ/6ahEYFisCfBK3cNnMvMAXGGfj8B7bXg4jCt
	 3zdpxn5Ndn+qpSypvvarfp0+RDsANCg+kWUSS6YxOsDOQVej3hbZNi27b1KMy1/J4D
	 Ns/+cvhEQj9HYYSpoh2i8LOi5z3bfF+R6O3Er875ZZnr4087A5/397UDX817+AVH3R
	 T41DSKfD3l/aNjebBC0U+7rgQqsLzRC8fxWiN1pwxZ53UcHUc1IdkvZJgR+hvnH//t
	 COcTsxrAh/xbw==
Date: Sat, 15 Feb 2025 13:37:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: move -fzero-init-padding-bits=all to the
 top-level Makefile
Message-ID: <20250215203733.GA2954129@ax162>
References: <20250215161604.690467-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215161604.690467-1-masahiroy@kernel.org>

On Sun, Feb 16, 2025 at 01:15:52AM +0900, Masahiro Yamada wrote:
> The -fzero-init-padding-bits=all option is not a warning flag, so
> defining it in scripts/Makefile.extrawarn is inconsistent.
> 
> Move it to the top-level Makefile for consistency.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Whoops, I will have to watch for that in the future.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  Makefile                   | 3 +++
>  scripts/Makefile.extrawarn | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 89628e354ca7..4a36864dd4bd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -928,6 +928,9 @@ KBUILD_CFLAGS	+= $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
>  endif
>  endif
>  
> +# Explicitly clear padding bits during variable initialization
> +KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
> +
>  # While VLAs have been removed, GCC produces unreachable stack probes
>  # for the randomize_kstack_offset feature. Disable it for all compilers.
>  KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index dc081cf46d21..d75897559d18 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -82,9 +82,6 @@ KBUILD_CFLAGS += $(call cc-option,-Werror=designated-init)
>  # Warn if there is an enum types mismatch
>  KBUILD_CFLAGS += $(call cc-option,-Wenum-conversion)
>  
> -# Explicitly clear padding bits during variable initialization
> -KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
> -
>  KBUILD_CFLAGS += -Wextra
>  KBUILD_CFLAGS += -Wunused
>  
> -- 
> 2.43.0
> 

