Return-Path: <linux-kbuild+bounces-4384-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1A89B55B6
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 23:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3182D1F23145
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 22:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9029520ADD3;
	Tue, 29 Oct 2024 22:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvTKCeCZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5B20A5DB;
	Tue, 29 Oct 2024 22:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730240664; cv=none; b=rD2JbjoEYY01XejYlzttmyTB2j4tqfXCMBTuzzfq3WID5mWPIgquHI96f98y72o/vrcqdCxvZkg+hAFv/JWrZyWvZwqA1Fpv4nTVrLZUdG10BM+vRLZveocileoeYCvIp/tJ8Vx+aDIRGb61u9e5q0KJ4wI38TFLVjalKfePflM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730240664; c=relaxed/simple;
	bh=Y9KYwDKlXpJ9Sr+8AScw+9OZ+aqfWvOvXRPpRGxiCAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzraTTqmBeMJldbkhP1FtvI2tt4MYCc2JQCr/X6hu383+Zvzd3CW1YtX+ptBG1UIhBJYVo0buZIovUFyRkhunMbwznWFg2Hv9+4JVSDQk08rrOt0VdejSg2jX4sWuLzhlJhezUzfiSfQHxHcX9fJaEpEzV9oS6n6w9H8EXprR0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvTKCeCZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05137C4CECD;
	Tue, 29 Oct 2024 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730240663;
	bh=Y9KYwDKlXpJ9Sr+8AScw+9OZ+aqfWvOvXRPpRGxiCAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvTKCeCZ3OjY9xGlhTb4noZIjmk67EC4hw+DOoJp30qWT7c/q2kiCO65o0NrXPmKe
	 SIMrmVnlXDDCFGAWVcvl1/0zC1EPOEtPvtnP4/xitobhNOJWi0QYffq4F2ZcDaSHP3
	 KhiTk2P82S/wrox0M7MLVl+8hplQ6zlmUkZJwa6PaJ10xLy+C+2mbXKu0jKqEWBMFK
	 djTzXjkbLixTpyLDWBtwYDavYeVCf5O59S+ftRMaeWX1p2wVPYD/bAxVMmATXDbzky
	 2nBYuPTyQfc6rufLw+2a4aifyl7fM09I4x1EsBO1cbNHDXmMImdVyHEIuc42U2Y1wa
	 mTCpwM2Hzn6wg==
Date: Tue, 29 Oct 2024 15:24:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: koachan@protonmail.com
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] sparc/build: Put usage of -fcall-used* flags
 behind cc-option
Message-ID: <20241029222421.GA2632697@thelio-3990X>
References: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com>
 <20241029-sparc-cflags-v3-1-b28745a6bd71@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029-sparc-cflags-v3-1-b28745a6bd71@protonmail.com>

On Tue, Oct 29, 2024 at 09:49:07PM +0700, Koakuma via B4 Relay wrote:
> From: Koakuma <koachan@protonmail.com>
> 
> Place -fcall-used* flags behind cc-option so that clang (which doesn't
> support them) can still compile the kernel.
> 
> This is a safe change, the reasoning is as follows:
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

Clang builds now succeed with this series and builds with GCC 14.2.0
continue to pass and boot successfully.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

One comment below, please carry these tags forward if there are future
revisions without substantial technical changes.

> ---
>  arch/sparc/Makefile      | 4 ++--
>  arch/sparc/vdso/Makefile | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
> index 757451c3ea1df63b948e68a45988c78f5974f9ea..0400078076e588be93a702d1c64eb9fd34466075 100644
> --- a/arch/sparc/Makefile
> +++ b/arch/sparc/Makefile
> @@ -29,7 +29,7 @@ UTS_MACHINE    := sparc
>  # versions of gcc.  Some gcc versions won't pass -Av8 to binutils when you
>  # give -mcpu=v8.  This silently worked with older bintutils versions but
>  # does not any more.
> -KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
> +KBUILD_CFLAGS  += -m32 -mcpu=v8 -pipe -mno-fpu $(call cc-option,-fcall-used-g5) $(call cc-option,-fcall-used-g7)

Small nit, this (and the one in the vdso) could probably be one
cc-option call? Is it likely that one flag would be implemented in the
compiler without the other?

  $(call cc-option,-fcall-used-g5 -fcall-used-g7)

>  KBUILD_CFLAGS  += -Wa,-Av8
>  
>  KBUILD_AFLAGS  += -m32 -Wa,-Av8
> @@ -45,7 +45,7 @@ export BITS   := 64
>  UTS_MACHINE   := sparc64
>  
>  KBUILD_CFLAGS += -m64 -pipe -mno-fpu -mcpu=ultrasparc -mcmodel=medlow
> -KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 -fcall-used-g7 -Wno-sign-compare
> +KBUILD_CFLAGS += -ffixed-g4 -ffixed-g5 $(call cc-option,-fcall-used-g7) -Wno-sign-compare
>  KBUILD_CFLAGS += -Wa,--undeclared-regs
>  KBUILD_CFLAGS += $(call cc-option,-mtune=ultrasparc3)
>  KBUILD_AFLAGS += -m64 -mcpu=ultrasparc -Wa,--undeclared-regs
> diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
> index 243dbfc4609d804fc221c3591eebe891107ffdab..50ec2978cda5397841daad6ffdc9682811b9b38e 100644
> --- a/arch/sparc/vdso/Makefile
> +++ b/arch/sparc/vdso/Makefile
> @@ -46,7 +46,7 @@ CFL := $(PROFILING) -mcmodel=medlow -fPIC -O2 -fasynchronous-unwind-tables -m64
>         -fno-omit-frame-pointer -foptimize-sibling-calls \
>         -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
>  
> -SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 -fcall-used-g5 -fcall-used-g7
> +SPARC_REG_CFLAGS = -ffixed-g4 -ffixed-g5 $(call cc-option,-fcall-used-g5) $(call cc-option,-fcall-used-g7)
>  
>  $(vobjs): KBUILD_CFLAGS := $(filter-out $(RANDSTRUCT_CFLAGS) $(GCC_PLUGINS_CFLAGS) $(SPARC_REG_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
>  
> 
> -- 
> 2.47.0
> 
> 
> 

