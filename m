Return-Path: <linux-kbuild+bounces-2821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5FC94801A
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 19:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4A01F21A90
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 17:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC6015EFA6;
	Mon,  5 Aug 2024 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9+YjFax"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20BC155351;
	Mon,  5 Aug 2024 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722878028; cv=none; b=TdEki/RGWoSV0M6hZWn+ZGQvJH09f10mRRqUkvTMGdgN6em2IgYRSNPsur6DL1YAYK687fVYLwtYfxDYlNmuLPNKdwxqvJqiY9/tF2YOkn1ojEhBw0azYklQ+5HMiPaV/e6sL/N/yi/shShMeUAGrpBSEwuAE3cck+eniSSz79w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722878028; c=relaxed/simple;
	bh=cbBt27hkdYHhswR7zddV7pmhvdwW7EAG8ILuZV1nH1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwmOunUi9Hw/yMFG6e+oMYHKlSWiiZa2WTUiY0mLZfrXaKPwjwLvp4f/LCZkYUNy3JoocQwk1GmoLyp7Y08ZpmzBL/c2zl070ReW4t3qReHe11rbVXNoTZ5+F4fgyYFlUaUdwmaU5z0tHfgmOr3QN0JM3bQ1FyOEICjW8zWRqOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9+YjFax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BABC32782;
	Mon,  5 Aug 2024 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722878028;
	bh=cbBt27hkdYHhswR7zddV7pmhvdwW7EAG8ILuZV1nH1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9+YjFaxZSYW0ZixSlvUm/Ty/OMkCZIU9jpLjS3AJqB3q3k9IBl/Vn77b+5COySEc
	 WsMh6JRodj08EwWvXcBxQS3R/dh6B6AaDG0MNl+UTqAK0baehklkdJtzUQS8ywnenk
	 H2c67m5GCoD5F4q8VBcEZeqnD9D/2x3OYrjDNhDBlhYdcjeNp6fiCkGU9LbukqCx7e
	 f2ziKSZuPb6Hbr5meHSPVWKFiUjSxRizg6k2z8nmhAxuX9Uwj8TdqAPwncHY1gKVcO
	 jJXBMBy5bQ2LC/M8Zh4aq91FxSXKi8RsnGAt+jrEfbYYAKzGXqCww7OwQW3IGEwHLp
	 LXUfO/iOmsNfQ==
Date: Mon, 5 Aug 2024 18:13:40 +0100
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
Subject: Re: [PATCH v4 2/2] rust: support for shadow call stack sanitizer
Message-ID: <20240805171340.GC10196@willie-the-truck>
References: <20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com>
 <20240729-shadow-call-stack-v4-2-2a664b082ea4@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-shadow-call-stack-v4-2-2a664b082ea4@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alice,

Just some minor comments on this:

On Mon, Jul 29, 2024 at 02:22:50PM +0000, Alice Ryhl wrote:
> To use the shadow call stack sanitizer, you must pass special flags:
> 
> * On arm64, you must pass -ffixed-x18 to your compiler.
> * On riscv, you must pass --no-relax-gp to your linker.

Since this patch doesn't touch riscv, I think you can just talk about
arm64 in the commit message.

> These requirements also apply to Rust code. When using Rust on arm64,
> you must pass the -Zfixed-x18 flag to rustc, which has the same effect
> as the -ffixed-x18 flag does for C code. The -Zfixed-x18 flag requires
> rustc version 1.80.0 or greater.
> 
> There is no need to pass any flags to rustc on riscv as only the linker
> requires additional flags on this platform.
> 
> On older versions of Rust, it is still possible to use shadow call stack
> by passing -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18.
> However, this flag emits a warning during the build, so this patch does
> not add support for using it.
> 
> Currently, the compiler thinks that the aarch64-unknown-none target

"Currently" will probably age badly -- can you talk about a compiler
version instead (e.g. "prior to version nnn, the compiler thinks...").

> doesn't support -Zsanitizer=shadow-call-stack, so the build will fail if
> you enable shadow call stack in non-dynamic mode. See [1] for the
> relevant feature request. To avoid this compilation failure, Kconfig is
> set up to reject such configurations.
> 
> The `depends on` clause is placed on `config RUST` to avoid a situation
> where enabling Rust silently turns off the sanitizer. Instead, turning
> on the sanitizer results in Rust being disabled. We generally do not
> want changes to CONFIG_RUST to result in any mitigations being changed
> or turned off.
> 
> Link: https://github.com/rust-lang/rust/issues/121972 [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile            | 1 +
>  arch/arm64/Makefile | 3 +++
>  init/Kconfig        | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 2b5f9f098b6f..66daca7a9b57 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -928,6 +928,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
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

These unwind entries aren't mentioned at all in the commit message.
Please can you explain what you're doing here? I guess it's something to
do with the PAC patching? Maybe this hunk would be better as a separate
patch?

Will

