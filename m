Return-Path: <linux-kbuild+bounces-2378-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D8E927B45
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 18:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1011C281CEB
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 16:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E586D1B375B;
	Thu,  4 Jul 2024 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNI0T/Pf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6701B374F;
	Thu,  4 Jul 2024 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720111151; cv=none; b=q9O05syLJ/k1TsjwrBD73qZtFK4IB+yo9mipKtIn+qpk/OHpOSbH27k80/dPNNqM1/kYgi8I5fI6w/G46/AhFvOMWZQIIkgL5ndJeBW9M70NznWdLJrlEvDry5FWlT4haetaqlQLoPBAMEy3DfvFIRqs+r4OpFNxjn3rZeNpHZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720111151; c=relaxed/simple;
	bh=Bs5sRfDrSxaaIvkIerZLN3dXVAr5INLyWGwt4rreui8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRNYDasCHLMPfXPWIaoo63LFTibSETVicLn3fBO6cWocuijEid75B+X7bm7KEU5TCVL5RltbYDW7dn10GmAcJBTHyp1EwOScmf46ZXing5jdLtVlcgKf8MOBt3B/TICFzttNZO7fZFlBTHUrA4KBX9n6rPGil5pS8pOm/7rsUXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNI0T/Pf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF8EC4AF0E;
	Thu,  4 Jul 2024 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720111151;
	bh=Bs5sRfDrSxaaIvkIerZLN3dXVAr5INLyWGwt4rreui8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNI0T/Pffc6B3iSRMiZPlG8zDplMPuzvnoqo0GJ334XC5B2XgSX031T6dBiIB7fuv
	 eCAhTZmTJvoPNopI0xgqtjIPCOBhvjQHSCjQkfpDk5ONQMxD2McfzTsFjK6BBS+COs
	 opCHlYojwbsYmhXsaDZUrfnPC5xX1Y364/AYT7PvYCq6O3bBhsLdVBzNrGJENi+Wth
	 K0jocA5kxTwj15uVdaZp7gJ8h408lZMfqOiLZlUuO3AYbL8u4P7J5CGouOdL+HDR8h
	 WXpVmafGFur+LmEx6Z1Q/MvOHSDWJvJZ2l+xWLIo0CVFWvX7NRDxskKvr7/Zwykx3a
	 Kd9asDK6i+/lA==
Date: Thu, 4 Jul 2024 09:39:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: add flags for shadow call stack sanitizer
Message-ID: <20240704163908.GA1394865@thelio-3990X>
References: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
 <20240704-shadow-call-stack-v3-2-d11c7a6ebe30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704-shadow-call-stack-v3-2-d11c7a6ebe30@google.com>

Hi Alice,

On Thu, Jul 04, 2024 at 03:07:58PM +0000, Alice Ryhl wrote:
> As of rustc 1.80.0, the Rust compiler supports the -Zfixed-x18 flag, so
> we can now use Rust with the shadow call stack sanitizer.
> 
> On older versions of Rust, it is possible to use shadow call stack by
> passing -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However,
> this flag emits a warning, so this patch does not add support for that.
> 
> Currently, the compiler thinks that the aarch64-unknown-none target
> doesn't support -Zsanitizer=shadow-call-stack, so the build will fail if
> you enable shadow call stack in non-dynamic mode. See [2] for the

                                                        ^ this should be [1]?

> feature request to add this. Kconfig is not configured to reject this
> configuration because that leads to cyclic Kconfig rules.

While it probably does not matter much given Rust for Linux is still "in
the works", I think it would be good to avoid these build failures.
Perhaps something like this could work (which basically just forces on
UNWIND_PATCH_PAC_INTO_SCS when Rust is enabled).

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5d91259ee7b5..a9f08a2bd1c6 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -89,7 +89,7 @@ config ARM64
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_MEMORY_FAILURE
-	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
+	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK && (!RUST || CAN_UNWIND_PATCH_PAC_INTO_SCS)
 	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_CFI_CLANG
@@ -2262,12 +2262,16 @@ config STACKPROTECTOR_PER_TASK
 	def_bool y
 	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_SYSREG
 
-config UNWIND_PATCH_PAC_INTO_SCS
-	bool "Enable shadow call stack dynamically using code patching"
+config CAN_UNWIND_PATCH_PAC_INTO_SCS
+	def_bool y
 	# needs Clang with https://github.com/llvm/llvm-project/commit/de07cde67b5d205d58690be012106022aea6d2b3 incorporated
 	depends on CC_IS_CLANG && CLANG_VERSION >= 150000
 	depends on ARM64_PTR_AUTH_KERNEL && CC_HAS_BRANCH_PROT_PAC_RET
-	depends on SHADOW_CALL_STACK
+
+config UNWIND_PATCH_PAC_INTO_SCS
+	bool "Enable shadow call stack dynamically using code patching" if !RUST
+	depends on SHADOW_CALL_STACK && CAN_UNWIND_PATCH_PAC_INTO_SCS
+	default y if RUST
 	select UNWIND_TABLES
 	select DYNAMIC_SCS
 

Otherwise, it might be good to wait to enable this until [1] is
addressed, but I don't really feel that strongly about it.

From a Kconfig/Kbuild perspective, the rest of the patch seems fine.

> Link: https://github.com/rust-lang/rust/issues/121972 [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile            | 1 +
>  arch/Kconfig        | 2 +-
>  arch/arm64/Makefile | 3 +++
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c11a10c8e710..4ae741601a1c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -945,6 +945,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
>  ifndef CONFIG_DYNAMIC_SCS
>  CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
>  KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
> +KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
>  endif
>  export CC_FLAGS_SCS
>  endif
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 238448a9cb71..5a6e296df5e6 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -690,7 +690,7 @@ config SHADOW_CALL_STACK
>  	bool "Shadow Call Stack"
>  	depends on ARCH_SUPPORTS_SHADOW_CALL_STACK
>  	depends on DYNAMIC_FTRACE_WITH_ARGS || DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
> -	depends on !RUST
> +	depends on !RUST || RUSTC_VERSION >= 108000
>  	depends on MMU
>  	help
>  	  This option enables the compiler's Shadow Call Stack, which
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 3f0f35fd5bb7..bbf313ddd700 100644
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
> 
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

