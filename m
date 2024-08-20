Return-Path: <linux-kbuild+bounces-3112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86695897A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 16:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0C38B214D7
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 14:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640AE1917F4;
	Tue, 20 Aug 2024 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qg+7baI9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382601917F0;
	Tue, 20 Aug 2024 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724164513; cv=none; b=LZSzFN1TLMbmALLN29Z+bjsjRBWxKxdkkmLsXhK66/zUwq2veZz1L7xgQkEFMTsT/cYIvr0MFQC1kQCnLLFYsuFv1tFSzEpMgzN++kx/ADPcnxf9Nsl9uYhEYqejCDxyZE4hUSMevCbTIieI1D05f1x1FPxLf2x0IquE6BxFwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724164513; c=relaxed/simple;
	bh=r5UcAyWfcjLB0PGZ0XNrk1RX83pspyrEnY6LgqT8Dx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ldc2u4nBHZVR/bJwWOMrt/8ehzasfuVnbYvMsFMi6jCI6iQld8fwy0+SpDVR/amC2cwBiG+BpWVPaKHllzzNVAJFzmFrNpOg3ro1Zuq5Tfph6dDQsNNDkLrGiKknPOm2k4GtvEWSE/CnDLkWNFedIiZm2XjuXoOokc3sKZ2IvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qg+7baI9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E152BC4AF17;
	Tue, 20 Aug 2024 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724164512;
	bh=r5UcAyWfcjLB0PGZ0XNrk1RX83pspyrEnY6LgqT8Dx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qg+7baI9EQhBFuxIyiOJ/ikRP9AiBmAKZad91cEPtSXOohqzvBbdl8OXYLPJO2cY7
	 LoqitX+EZMRNKqWciz4Eia3c1cCMtibWWQEF1egcwQV8EJ/9y/MDsb6KNBXEKNvPbw
	 ZFDVRoBeAN1AGsVmdeG5LLFN2nE7XI7jU+ltAPUGHeXSgvE94/o8WRU7pnyljllNa6
	 e1fB9EWgNbffKjreANu34SDkkLWIhlRBXaNEyThRqeDKNUlW7PqGXvNsrCI8K/3iu2
	 7JfoSCBsJjzta2V0pmHNs8KjDwf70GmduHkpHjfv7MPgbfmCx/nlZojA5ZMPZ7I4lR
	 /4XOYBgr0cTRQ==
Date: Tue, 20 Aug 2024 15:35:04 +0100
From: Will Deacon <will@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v5] rust: support for shadow call stack sanitizer
Message-ID: <20240820143503.GD28338@willie-the-truck>
References: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 06, 2024 at 10:01:44AM +0000, Alice Ryhl wrote:
> This patch adds all of the flags that are needed to support the shadow
> call stack (SCS) sanitizer with Rust, and updates Kconfig to allow
> configurations that work.

Minor nit, but some folks have allergic reactions to "This patch".
See:

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

I think the commit message is much better now, though, so thank you for
adding so much more detail for v5. If you end up respinning anyway, you
could move this all to the imperative.

>  Makefile            | 1 +
>  arch/arm64/Makefile | 3 +++
>  init/Kconfig        | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 44c02a6f60a1..eb01a26d8354 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -927,6 +927,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
>  ifndef CONFIG_DYNAMIC_SCS
>  CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
>  KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
> +KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
>  endif
>  export CC_FLAGS_SCS
>  endif
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index f6bc3da1ef11..b058c4803efb 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -57,9 +57,11 @@ KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
>  ifneq ($(CONFIG_UNWIND_TABLES),y)
>  KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
>  KBUILD_AFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
> +KBUILD_RUSTFLAGS += -Cforce-unwind-tables=n
>  else
>  KBUILD_CFLAGS	+= -fasynchronous-unwind-tables
>  KBUILD_AFLAGS	+= -fasynchronous-unwind-tables
> +KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y -Zuse-sync-unwind=n
>  endif
>  
>  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> @@ -114,6 +116,7 @@ endif
>  
>  ifeq ($(CONFIG_SHADOW_CALL_STACK), y)
>  KBUILD_CFLAGS	+= -ffixed-x18
> +KBUILD_RUSTFLAGS += -Zfixed-x18
>  endif
>  
>  ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
> diff --git a/init/Kconfig b/init/Kconfig
> index fe76c5d0a72e..d857f6f90885 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1909,7 +1909,7 @@ config RUST
>  	depends on !MODVERSIONS
>  	depends on !GCC_PLUGINS
>  	depends on !RANDSTRUCT
> -	depends on !SHADOW_CALL_STACK
> +	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS

Sorry, I didn't spot this in v4, but since UNWIND_PATCH_PAC_INTO_SCS is
specific to arm64 and the only other architecture selecting
ARCH_SUPPORTS_SHADOW_CALL_STACK is riscv, I can't help but feel it would
be cleaner to move this logic into the arch code selecting HAVE_RUST.

That is, it's up to the architecture to make sure that it has whatever
it needs for SCS to work with Rust if it claims to support Rust.

What do you think?

Will

