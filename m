Return-Path: <linux-kbuild+bounces-4851-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111D9D89FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 17:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F68FB3C563
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 15:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421ED1B3926;
	Mon, 25 Nov 2024 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWRtUtbK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114641B3923;
	Mon, 25 Nov 2024 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547223; cv=none; b=V/q8QNjg6h46X2khD2FW6T5BWLuGaOlpdViE6EmoxFUSu1sC+0gqzJWE3MOemD4bbm/YFHzA7hz4qmAT9ep89Zkn3BlI8tmD796uyAZwci5MSs62nmXgr2l7SE29UMvtryd4JSEVj30RM4qzx2qjUaEME9/VyNSsAVIIG/9yRm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547223; c=relaxed/simple;
	bh=S2acybjjAFxX699dxMvNIaAzO47Rn/RSXjo9ZH/ylGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UP6zO+nHu8Kbmjne8nCLpvDAEAGjiO2X6o6RlIkeL+Bhq3LX/dXIm4s+d1mwoYif8K1382J6dDG15WL9X9xRnWjqltbOlPyYmSIow4ycqLOjp3DbzMBgSRtZG9A9aq42q61p1jmV+/Itq3/XY3HU8IH4zSf3rwYP7zPoD3UNqXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWRtUtbK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4C6C4CED3;
	Mon, 25 Nov 2024 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732547222;
	bh=S2acybjjAFxX699dxMvNIaAzO47Rn/RSXjo9ZH/ylGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWRtUtbK5n9tskL2ymy6Vp8M7PvBae4CVm2l//UxN1f5JElcA3yqLzkTsqHxWRFkt
	 W0CS6h9LH5Gqd1mfp1sWn7/VMTJnuq0Xbs4/11PARxgS+MLjhqLB9CG/gJEecSUtNg
	 3Zo/iXtBgmAToxAVkY5sIQgf+NGxW4kQGSCvNP9iiGydk6BiDucR54r+EJn2JknSOr
	 8nmAZS5QliBTB80qs9OVbnXQV2K0WhA/7U58R64/PM9smT67d9Er6U2+uY+HSUs1/Z
	 qSe1bH3tcHXCBb30VUTqVDlYdlqA8Wyt2EE/L5HRwwycnpW1CbwD3mYG5cH5obOxgx
	 F9oKlNzLjxIcQ==
Date: Mon, 25 Nov 2024 08:07:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RFC] kbuild: disable -Wc23-extensions from clang
Message-ID: <20241125150700.GB2067874@thelio-3990X>
References: <20241125-kbuild-c23-extensions-v1-1-b4263b795fc8@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125-kbuild-c23-extensions-v1-1-b4263b795fc8@weissschuh.net>

Hi Thomas,

On Mon, Nov 25, 2024 at 10:03:00AM +0100, Thomas Weiﬂschuh wrote:
> Some of the C23 extensions are also GNU extensions, which are allowed.
> Examples are declarations after labels or function definitions with
> omitted parameter names.
> 
> Also with the switch to C23 at some point in the future all those

We are likely a ways off from being able to switch to C23:

https://lore.kernel.org/10db3077-9409-446d-8e50-1a2a803db767@app.fastmail.com/

> warnings will be resolved automatically anyways.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> I had some patches failing the CI only with clang.
> And it feels like unnecessary busywork to fix these warnings.

A declaration after a label is a hard error with clang 17 and older, so
I think it is entirely appropriate to continue to warn on that:

https://godbolt.org/z/sj98GMhv3

While a function definition with omitted parameter names is always a
warning for the versions of clang supported by the kernel, I still think
those should be fixed for consistency sake, as I have really only seen
these occur in stub functions, which should match the definition of the
full function.

> ---
>  scripts/Makefile.extrawarn | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 1d13cecc7cc7808610e635ddc03476cf92b3a8c1..0da75c9d84da4daf6936495a5ab96df75658da4f 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -31,6 +31,8 @@ KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
>  ifdef CONFIG_CC_IS_CLANG
>  # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
>  KBUILD_CFLAGS += -Wno-gnu
> +# Some allowed GNU extensions are also C23 extensions
> +KBUILD_CFLAGS += $(call cc-disable-warning, c23-extensions)
>  else
>  
>  # gcc inanely warns about local variables called 'main'
> 
> ---
> base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> change-id: 20241118-kbuild-c23-extensions-2560d140de36
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

