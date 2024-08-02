Return-Path: <linux-kbuild+bounces-2788-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CEC94660A
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 01:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D1E28341E
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 23:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC7D811E0;
	Fri,  2 Aug 2024 23:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzpylkbS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DBD5258;
	Fri,  2 Aug 2024 23:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722639860; cv=none; b=jkvajuFjEhl0Opet8z6ZlWYYD9osE8q8+TERyD4K6F2cWsFNa0j2HTBti0awI/pR8HUG8Ld/tQtItbVri/GEiylm7Tdg1xORcdHy6ykk4kmyRoNGFc8I9wmqp7yLQeTY1jpa0wvIhmrqYHtsNWa9KtfK9/VDoFg1njV+bQMYvFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722639860; c=relaxed/simple;
	bh=iIjDB6hSxLVkrCrMpfondG5ucRaBxFNaNNgaLKgyOM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEpJc4R9o0px7/r8f8QtV8Pxjhm3nObXRR+vXupLtCVmWch7U0+kXjW5maDBMVTg77rZP3SX4UiiD+w2XXcDdIQTThiK8J789Er0T98HcmouuQf17suTLj+pFc7M7ohk1+geXlRxUGMiczNueZvsccUCMwg0TFMBHID8IN1D2p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzpylkbS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0346C32782;
	Fri,  2 Aug 2024 23:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722639859;
	bh=iIjDB6hSxLVkrCrMpfondG5ucRaBxFNaNNgaLKgyOM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzpylkbS7oULAgh4yHoGZQoiNmiZKtx2nSFhfY0Ie9FEggok+KMDcsf9CC1hEsNTG
	 Cw03IqxXtDTI3+zeOgdifUhXO76bOLzK4I23UWYkKIyYFB/m6/eOZPaRxhVNNUZ60l
	 EUZn+QJy1MWBRVZL7RJ+K5kJXTAFNOqVGkD6tOIDQtkSWf83W/z9x5d3G2ws+kBcte
	 KJfwVFRV6cxDChzA0jau7Js8CcbC63y9NCLca0LylbJQIoNWxQvhCs2pgkyHiopPHG
	 yA1cUasAv5Gy6VNjS/pIaBqgGeM3pBaT+tw4pi3vPmGDesRlhG3P5qStaT9uracpI1
	 5FszcsmhOsVpA==
Date: Fri, 2 Aug 2024 16:04:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Koakuma <koachan@protonmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sparc/build: Remove all usage of -fcall-used*
 flags
Message-ID: <20240802230417.GB853635@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20240717-sparc-cflags-v2-1-259407e6eb5f@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-sparc-cflags-v2-1-259407e6eb5f@protonmail.com>

On Wed, Jul 17, 2024 at 11:10:15PM +0700, Koakuma wrote:
> Remove all usage of -fcall-used* flags so that all flags used are
> portable between GCC and clang.
> 
> The reasoning is as follows:
> 
> In the (normal) 32-bit ABI, %g5 and %g7 is normally reserved, and in
> the 64-bit ABI, %g7 is the reserved one.
> Linux turns them into volatile registers by the way of -fcall-used-*,
> but on the other hand, omitting the flags shouldn't be harmful;
> compilers will now simply refuse to touch them, and any assembly
> code that happens to touch them would still work like usual (because
> Linux' conventions already treats them as volatile anyway).
> 
> Signed-off-by: Koakuma <koachan@protonmail.com>

As before, I tested this series with the vDSO patch mentioned before and
a version of LLVM that supports the -m{,no-}v8plus flags and I was able
to successfully boot a kernel in QEMU :)

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/sparc/Makefile      | 4 ++--
>  arch/sparc/vdso/Makefile | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
> index 757451c3ea1d..7318a8b452c3 100644
> --- a/arch/sparc/Makefile
> +++ b/arch/sparc/Makefile
> @@ -29,7 +29,7 @@ UTS_MACHINE    := sparc
>  # versions of gcc.  Some gcc versions won't pass -Av8 to binutils when you
>  # give -mcpu=v8.  This silently worked with older bintutils versions but
>  # does not any more.
> -KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
> +KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu
>  KBUILD_CFLAGS  += -Wa,-Av8
>  
>  KBUILD_AFLAGS  += -m32 -Wa,-Av8
> @@ -45,7 +45,7 @@ export BITS   := 64
>  UTS_MACHINE   := sparc64
>  
>  KBUILD_CFLAGS += -m64 -pipe -mno-fpu -mcpu=ultrasparc -mcmodel=medlow
> -KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
> +KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -Wno-sign-compare
>  KBUILD_CFLAGS += -Wa,--undeclared-regs
>  KBUILD_CFLAGS += $(call cc-option,-mtune=ultrasparc3)
>  KBUILD_AFLAGS += -m64 -mcpu=ultrasparc -Wa,--undeclared-regs
> diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
> index 243dbfc4609d..e009443145af 100644
> --- a/arch/sparc/vdso/Makefile
> +++ b/arch/sparc/vdso/Makefile
> @@ -46,7 +46,7 @@ CFL := $(PROFILING) -mcmodel=medlow -fPIC -O2 -fasynchronous-unwind-tables -m64
>         -fno-omit-frame-pointer -foptimize-sibling-calls \
>         -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
>  
> -SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 -fcall-used-g5 -fcall-used-g7
> +SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5
>  
>  $(vobjs): KBUILD_CFLAGS := $(filter-out $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
>  
> 
> -- 
> 2.45.2
> 

