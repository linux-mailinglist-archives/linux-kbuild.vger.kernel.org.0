Return-Path: <linux-kbuild+bounces-2379-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD4927B66
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 18:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09E4F287E7A
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 16:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3441B11F9;
	Thu,  4 Jul 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/8Qk5IF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B54A1BC57;
	Thu,  4 Jul 2024 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720111551; cv=none; b=gkTdqAjkvifN3hIcDhTvoxQQAH10CUgPbRBM47ordBp0k+JMOvVKLx07zr5gptI7oiyCrgE4KFhnMfj3c758vX5hPqI/kESywdZtSkCSaDw9I+KZluzfQ2mW+2dYyMdEuBIV1h7hWh5ok6vXBfJrfYCG+uFCmi7iauaf2smuRMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720111551; c=relaxed/simple;
	bh=WheJjgM7xwoYDL2h9KMuA8Uv+Mr1sZiDhbDrO6nNij0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbv3iBDP3JF9Miv5uFZL9Pvy5CC29mIjDqT18q++cyuZcX2X/anOkG1d/yvKGGb+5i4wAq4pr39m/ROTUOZj1X/JG3oJwSkPKn1hpOPqu5UrHnCG7D/507Mv19QWmxQXUP5Tg156fbZuUJQZxNTcVui1bcRJCh4YGWv5PoLiXWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/8Qk5IF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D042C3277B;
	Thu,  4 Jul 2024 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720111551;
	bh=WheJjgM7xwoYDL2h9KMuA8Uv+Mr1sZiDhbDrO6nNij0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/8Qk5IFaMOxhwedoQRRXvwxJ7aRBZtVyf1mVXOzpkF9wog9F4dXJ2mHn+ROUdue0
	 yZNdABnYecO8PZLjZ6DY5oZLAhV6bGO5W72583Hkh95G3iu9m5CGvUjcmdwH1B9pQA
	 m2lWQUbTD5ZF0y08aUnTgpzpa0KK9CXJivtY6SJD1kpCNnzsNkSapldCHUVW3H0778
	 c3Tcqc4eP8/jNB0b3ihZWSRQ/plFmkAnkHRwvBc3LyDr3lEzRKLtM+495jjSccaz8b
	 9mqZumxHPEjoWJYugOu6AS2QcZozZ5GmiNch3Qtrwoozq6/u3YwAOH1zCZ/6dBa1Cm
	 H0JPrHAv76+bQ==
Date: Thu, 4 Jul 2024 09:45:48 -0700
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
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: SHADOW_CALL_STACK is incompatible with Rust
Message-ID: <20240704164548.GB1394865@thelio-3990X>
References: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
 <20240704-shadow-call-stack-v3-1-d11c7a6ebe30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704-shadow-call-stack-v3-1-d11c7a6ebe30@google.com>

On Thu, Jul 04, 2024 at 03:07:57PM +0000, Alice Ryhl wrote:
> When using the shadow call stack sanitizer, all code must be compiled
> with the -ffixed-x18 flag, but this flag is not currently being passed
> to Rust. This results in crashes that are extremely difficult to debug.
> 
> To ensure that nobody else has to go through the same debugging session
> that I had to, prevent configurations that enable both SHADOW_CALL_STACK
> and RUST.
> 
> It is rather common for people to backport 724a75ac9542 ("arm64: rust:
> Enable Rust support for AArch64"), so I recommend applying this fix all
> the way back to 6.1.
> 
> Cc: <stable@vger.kernel.org> # 6.1 and later
> Fixes: 724a75ac9542 ("arm64: rust: Enable Rust support for AArch64")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Would it be better to move this to arch/arm64/Kconfig?

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 167e51067508..080907776db9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -90,7 +90,7 @@ config ARM64
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_MEMORY_FAILURE
-	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
+	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK && !RUST
 	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_CFI_CLANG

RISC-V probably needs the same change, which further leads me to believe
that this workaround should be architecture specific, as they may be
fixed and enabled at different rates.

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6b4d71aa9bed..4d89afdd385d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -213,6 +213,7 @@ config HAVE_SHADOW_CALL_STACK
 	def_bool $(cc-option,-fsanitize=shadow-call-stack)
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
 	depends on $(ld-option,--no-relax-gp)
+	depends on !RUST
 
 config RISCV_USE_LINKER_RELAXATION
 	def_bool y

> ---
>  arch/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 975dd22a2dbd..238448a9cb71 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -690,6 +690,7 @@ config SHADOW_CALL_STACK
>  	bool "Shadow Call Stack"
>  	depends on ARCH_SUPPORTS_SHADOW_CALL_STACK
>  	depends on DYNAMIC_FTRACE_WITH_ARGS || DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
> +	depends on !RUST
>  	depends on MMU
>  	help
>  	  This option enables the compiler's Shadow Call Stack, which
> 
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

