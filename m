Return-Path: <linux-kbuild+bounces-5880-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2457FA42988
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 18:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF9381693D3
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 17:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49525262D37;
	Mon, 24 Feb 2025 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tj+om4Em"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C22627E6;
	Mon, 24 Feb 2025 17:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740417903; cv=none; b=Hiiiu6h994U0pW90uyjWMc/M6NsH08xAMS+safkAdAyJW07CQHNTvGxKY3I7DtLicxLLtGSQdcW1PbhXrbRNGWA0/khvxoVUjLSL/HDW88Zt0+mi4ItqCO03PL6pZlw73fjkntNuM2uc9Nr/+HyNXm/equpxuCiQs1lhJQwYwYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740417903; c=relaxed/simple;
	bh=v7il4LMEfA/42fmG0eoKZPNhHXPInWhqNxLmpPkVLss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pk1i0h2vDXHgX2ur/DgBKXUwFCAl30wjd5T/+1J5NV0w56sBi2jbqsTni6Cu3WPtALTgifcjUt9nCkHrXmH3tBWSbNoCpO6GwlDLWkcyD8YuPKrqcwG+YaG+xJk7HjNzhVJhs5k4gwPJjQ0c9GQURT7W4Vpf8+UDE2+vtj4oHo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tj+om4Em; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA59C4CEE7;
	Mon, 24 Feb 2025 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740417902;
	bh=v7il4LMEfA/42fmG0eoKZPNhHXPInWhqNxLmpPkVLss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj+om4Ema2bIlx+SJW0NlMw5C7FhJFgtS0g45tVXX1FdFyu8VMJOri6XZHgeipFqt
	 Dvw44JbGyJ/wGcfsZKmEoD6RMvUAWfcz1hazyF1olgMRoghkHYyoNpIPPevD7rejrj
	 8hbD1FamKUx6OmHdFaLcfG3vg4Bka0gjrnMnVlAsuMNc5SZoMgTionp6y7IRL1HOgT
	 9jhoVVEjRxbtkJYD3BltQcIQjGzRGoFdR5xTCrxgU3tMVdBUK4G12tjraLGsZTL55w
	 AJ7NS6CH+zL+sLkkzw0AmR/h8/gPhYj6f/LZEyp/O/7f3aMF+47SS9B2VDYu7KGFtC
	 mgkO/Jy/H5dUw==
Date: Mon, 24 Feb 2025 09:24:56 -0800
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] [v2] kbuild: hdrcheck: fix cross build with clang
Message-ID: <20250224172456.GB585841@ax162>
References: <20250224141242.1370280-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224141242.1370280-1-arnd@kernel.org>

On Mon, Feb 24, 2025 at 03:12:36PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The headercheck tries to call clang with a mix of compiler arguments
> that don't include the target architecture. When building e.g. x86
> headers on arm64, this produces a warning like
> 
>    clang: warning: unknown platform, assuming -mfloat-abi=soft
> 
> Add in the CLANG_FLAGS, which contain the target, in order to make it

Small nit, this should probably be KBUILD_CPPFLAGS now.

> build properly.
> 
> See also 1b71c2fb04e7 ("kbuild: userprogs: fix bitsize and target
> > detection on clang").

Extra '>' I think?

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Perhaps this wants the same Fixes tag as the above referenced patch
since I think that is the one that broke this?

Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")

> ---
> v2: use same approach as the other patch.
> ---
>  usr/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index 58a9cbe4eba4..b9a2640b4bb7 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -10,7 +10,7 @@ UAPI_CFLAGS := -std=c90 -Wall -Werror=implicit-function-declaration
>  
>  # In theory, we do not care -m32 or -m64 for header compile tests.
>  # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
> -UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> +UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
>  # USERCFLAGS might contain sysroot location for CC.
>  UAPI_CFLAGS += $(USERCFLAGS)
> -- 
> 2.39.5
> 

