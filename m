Return-Path: <linux-kbuild+bounces-5750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30407A34C87
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 18:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D7F188CD44
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 17:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B0E241678;
	Thu, 13 Feb 2025 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NByeFNW2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586023A9AE;
	Thu, 13 Feb 2025 17:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469345; cv=none; b=ix8q3YxsjA3CQ3grRnmnK3OIu5JC5diQV0lIoKkXuw8CCPG4vpeeiH5XRQ88iM35AfnyNXWMEMgueiolSfumFXinr6bbKR3KlHZ5p7s3GqvDsC9n6cPw3qaDvB70qfMiL+sFSdiL3qKOmLDwy1i2UMVp6gZYeZlNZ7kE8rm79w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469345; c=relaxed/simple;
	bh=/PNpSbgiLWG9bLBWpPA4uVPKXUWGs7jN8qVFPTrfZTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ar1Hn/hqVCDEbZSfKs13fV2SKQ4UG4+dsj6k29Wksev8kpNmjWQuiUHSRvfCRZksaOpp1wVEsOjRClDr8T/7Zf+ddS64s7ykPlt9OhJTLUcEQNrbEx2S0hP1GHiL74izRfm/WDEc9r2M+qELZm23mgiScbia5ZfNVr3NN6gFxFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NByeFNW2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B818C4CEE5;
	Thu, 13 Feb 2025 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739469344;
	bh=/PNpSbgiLWG9bLBWpPA4uVPKXUWGs7jN8qVFPTrfZTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NByeFNW2HNKG+Or1s9nAySboW83Ggzz0b+NOyt3FmxlW23UICV1ytS5xRVjQzEeeg
	 4iJNSm97SoPyNAqfp5g1tVZ65hAFPAlED3c3qWsS4JwMZVlZaZPWHQc9EGpClUrkbA
	 m/KKbHaNX/khx5EIpDIOHfXYOVdk0Ge+R3ZgWuKN7qbe4To0dT57j+dLf/I7tdjfSx
	 j1LTxDNehVvEnZ+G1qUDffvJuopixRbVWOwUFno1lKLsmEhdPclEUeJFauTXsJn46I
	 ufcJp0CbcbIcVx3oN0eZhgAeXsoEHxgx5PuyBh+K7P//iB8HlrciSItjHlYy+yXj12
	 FG5rYbSe8wVDg==
Date: Thu, 13 Feb 2025 10:55:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: userprogs: fix bitsize and target detection
 on clang
Message-ID: <20250213175539.GB2756218@ax162>
References: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
 <20250213-kbuild-userprog-fixes-v1-1-f255fb477d98@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213-kbuild-userprog-fixes-v1-1-f255fb477d98@linutronix.de>

On Thu, Feb 13, 2025 at 03:55:17PM +0100, Thomas Weiﬂschuh wrote:
> scripts/Makefile.clang was changed in the linked commit to move --target from
> KBUILD_CFLAGS to KBUILD_CPPFLAGS, as that generally has a broader scope.
> However that variable is not inspected by the userprogs logic,
> breaking cross compilation on clang.
> 
> Use both variables to detect bitsize and target arguments for userprogs.
> 
> Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9e0d63d9d94b90672f91929e5e148e5a0c346cb6..bb5737ce7f9e79f4023c9c1f578a49a951d1e239 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1120,8 +1120,8 @@ LDFLAGS_vmlinux += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  endif
>  
>  # Align the bit size of userspace programs with the kernel
> -KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> -KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> +KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
> +KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
>  # make the checker run with the right architecture
>  CHECKFLAGS += --arch=$(ARCH)
> 
> -- 
> 2.48.1
> 

