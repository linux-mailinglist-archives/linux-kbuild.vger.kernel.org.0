Return-Path: <linux-kbuild+bounces-8138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21022B11457
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F768587E01
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571DE23C516;
	Thu, 24 Jul 2025 23:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LK/VBakt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272125D8F0;
	Thu, 24 Jul 2025 23:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753398631; cv=none; b=hfp9Dxcj1EQuER3FBza6li/I2Yd53BA7wcme/uNI0mzSMLLJV9GbK/MmBlYP0Fc4CCZUJDq9fLAUFXb7b1E0taLspeH0ln+1AhGELQxD4HXDuNXERilEn8ivHyEiamq8+B9A5136N3TWwMH7OMCAwto+n/itQItnHfEm4+84v0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753398631; c=relaxed/simple;
	bh=5QF7XQ0L8h22/WiqgEsgKHIytbIiPXuvxgRIQrTSArM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgvLSboEM8ak2lVB/LIUauSWqOyKnJJHt33yhAVhZGhtRyxPmuOMRPCe2x0cNaO57GGYb8cHU4xTdZ/sUxkPHw5ZZ7b132gfV0Ol58UTOjBUXWfXzj9LsNideXWFui9BP5WfEQD4Nroprf5fYD+jOCScXS212me845R8utFSVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LK/VBakt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87631C4CEED;
	Thu, 24 Jul 2025 23:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753398630;
	bh=5QF7XQ0L8h22/WiqgEsgKHIytbIiPXuvxgRIQrTSArM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LK/VBakt4CDvhVmLLvojGsNOL+rvUZvu7vmOS71UHTrg6RLTfuq3eoE+DmUu+mppT
	 ljynWt3/pEdxU+fy0TqaXGhh6gD2EOVHe/LNPiPxvoMpeJhIjZcZAzORwQV2mJcBaI
	 0fy5AruUoV6y9JG1ratXLpoGU/eBr8b70flZwLMbgLEqWRGm4mH2M/DJo9x/P6EsNb
	 9iJ5sZZV69dJ3u4yAUPZgLvB1ASdeTGYxgA6g/J9u17mqkZM4FubXhEzTALN060KfX
	 KefdTkW2o8wBQaCs25pfZNq0Svh6DWlMyg6HuWKqrxdEBez5jH0C7OOTPW1pmsgcDO
	 JoO2O+yeh3wsw==
Date: Thu, 24 Jul 2025 16:10:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: userprogs: use correct linker when mixing clang
 and GNU ld
Message-ID: <20250724231025.GA3620641@ax162>
References: <20250724-userprogs-clang-gnu-ld-v1-1-3d3d071e53a7@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724-userprogs-clang-gnu-ld-v1-1-3d3d071e53a7@linutronix.de>

On Thu, Jul 24, 2025 at 10:32:45AM +0200, Thomas Weiﬂschuh wrote:
> The userprogs infrastructure does not expect clang being used with GNU ld
> and in that case uses /usr/bin/ld for linking, not the configured $(LD).
> This fallback is problematic as it will break when cross-compiling.
> Mixing clang and GNU ld is used for example when building for SPARC64,
> as ld.lld is not sufficient; see Documentation/kbuild/llvm.rst.
> 
> Relax the check around --ld-path so it gets used for all linkers.
> 
> Fixes: dfc1b168a8c4 ("kbuild: userprogs: use correct lld when linking through clang")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Nathan, you originally proposed the check for $(CONFIG_LD_IS_LLD) [0],
> could you take a look at this?

I would expect this to be okay but I have not explicitly tested it. I
had not considered the case of GNU ld being used since aside from
sparc64, there is not another architecture that supports clang but not
ld.lld.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c09766beb7eff4780574682b8ea44475fc0a5188..e300c6546c845c300edb5f0033719963c7da8f9b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1134,7 +1134,7 @@ KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD
>  KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))

Does KBUILD_USERCFLAGS respect LLVM_IAS? sparc64 does not use the
integrated assembler yet (as far as I am aware) so I think we probably
need to filter '--prefix=' and '-fno-integrated-as' to avoid further
issues with assembling?

>  # userspace programs are linked via the compiler, use the correct linker
> -ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
> +ifneq ($(CONFIG_CC_IS_CLANG),)

At this point, I think this can just become

  ifdef CONFIG_CC_IS_CLANG

>  KBUILD_USERLDFLAGS += --ld-path=$(LD)
>  endif
>  
> 
> ---
> base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> change-id: 20250723-userprogs-clang-gnu-ld-7a1c16fc852d
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

