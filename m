Return-Path: <linux-kbuild+bounces-3257-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADAB962935
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 15:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9C5283223
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 13:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43AF16EBE2;
	Wed, 28 Aug 2024 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tqg/WrCk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F7D1DFE3;
	Wed, 28 Aug 2024 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852895; cv=none; b=mdE6odk9dGhCv84rvj25HPZbVqrFeqqJl0MQY+aIogJ3xhNR9gHIcU2n3eL69M5xbEbvqVZn3hEg8/NtNSUZ1R6mQPnMllLyzuItuBgFt+gQ74nW3qjGddLeSxyswAyPttC5x8ZZiZuF8Q+Lu6ujk9rHpTCBpLL7W2ahxVdhNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852895; c=relaxed/simple;
	bh=vHCxnHLM7B79W/rgmZykoOgP/HNJv5GnpgTCvP/Ur24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2zutdlBzye1yMRfBqhM7WuvFDkojYcYq4ng45+X8mFjiA2Xc57j+wSsBdpxNX5LQSeUb9aCfsBO9q2EHnrgqIUYaVwMZzlU5tgE9piDueR5CMXFEI/Qo6+q0kypq7Kc5SzOGU8uOM7hxhNQAXO41fNTU9f94vxIAJ2EqwNmLFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tqg/WrCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0204CC5E88C;
	Wed, 28 Aug 2024 13:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724852895;
	bh=vHCxnHLM7B79W/rgmZykoOgP/HNJv5GnpgTCvP/Ur24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tqg/WrCk9j5LppdS0Qik+p9lgpluTCZ7MBXbWfYy32xKnLgj+hGS7dmulUC+XKOHN
	 /7L/5iYbJEHodyc3521Z6+NcliBGqsCLSDc7wUnVZFKtdAqIg6BHURxNdbm1fC3tRI
	 hcWtsLvZyA7VsczMO/gO94mrI9sgo/KGu3lR/O6U6M2YhINeu4awDWKM1BnNjMv+W/
	 OSczhJ0x0Gnr0zPiyrh3QJAz9le0fkZLakoz37S9Fh1Gtq2XtUVAsWBVbKlTIv9P4k
	 tieXKlBNncfB+vyW3ycH2EWMIMYDmEIUg4lfRS8aalFVWMRTmymhP2clm6jp37vHDW
	 qKQZlPmHT6MNA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso8846454e87.0;
        Wed, 28 Aug 2024 06:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsgAYdSXka3D25Ys68LK4tLWkU/XWjadHUSHgqcm/8457+IOIwBbat+yV0uDd6ThJ3SPuVbmqdRgvewIA=@vger.kernel.org, AJvYcCX28lkYApcClrgbCRPZ+Vf7I9h9TRc6GJBffrXSre6ZLCwAVRkJZawNe3wzE0xy0C6bSLGXAcHQGkBDBsJAGGw=@vger.kernel.org, AJvYcCXXUltXB4nCVR5DzYpYfyzYN0l5DlHTJnZ56xvy+hQDB2CTeCO3FSZ8UA9mrtuUrfsPDDM/DVTy5WQ7aVoS@vger.kernel.org
X-Gm-Message-State: AOJu0YyUyKWQe/4G8akKqg7bu06ZRB+D06OhuNxHQkKw1y5/FbrlUsFR
	URJuOGt/ZOQayY/H6UFa9bLV7lh1xOWDn79fCOid055qCuoD7C+wAl54a2tHBJMdFc6vQTGPmAg
	DFGsckH/kL6hje6Y35bZQ2UCrvck=
X-Google-Smtp-Source: AGHT+IFAy0fk5KS1tTiiP87NuO0Q/oqObzktBq/uhSptt/agQiBkAIexx42a+MIM2J93D76DYhPdj4+z1KwWaOfH4x0=
X-Received: by 2002:a05:6512:39cb:b0:52e:9b92:4990 with SMTP id
 2adb3069b0e04-534387850c1mr11723335e87.32.1724852893131; Wed, 28 Aug 2024
 06:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
In-Reply-To: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 28 Aug 2024 15:48:01 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGtH+yna6CLncxTYi+ie2WF5-nSA3q0Re9L1VJt1EoQ9A@mail.gmail.com>
Message-ID: <CAMj1kXGtH+yna6CLncxTYi+ie2WF5-nSA3q0Re9L1VJt1EoQ9A@mail.gmail.com>
Subject: Re: [PATCH v6] rust: support for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Aug 2024 at 16:23, Alice Ryhl <aliceryhl@google.com> wrote:
>
> This patch adds all of the flags that are needed to support the shadow
> call stack (SCS) sanitizer with Rust, and updates Kconfig to allow only
> configurations that work.
>
> The -Zfixed-x18 flag is required to use SCS on arm64, and requires rustc
> version 1.80.0 or greater. This restriction is reflected in Kconfig.
>
> When CONFIG_DYNAMIC_SCS is enabled, the build will be configured to
> include unwind tables in the build artifacts. Dynamic SCS uses the
> unwind tables at boot to find all places that need to be patched. The
> -Cforce-unwind-tables=y flag ensures that unwind tables are available
> for Rust code.
>
> In non-dynamic mode, the -Zsanitizer=shadow-call-stack flag is what
> enables the SCS sanitizer. Using this flag requires rustc version 1.82.0
> or greater on the targets used by Rust in the kernel. This restriction
> is reflected in Kconfig.
>
> It is possible to avoid the requirement of rustc 1.80.0 by using
> -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However, this flag
> emits a warning during the build, so this patch does not add support for
> using it and instead requires 1.80.0 or greater.
>
> The dependency is placed on `select HAVE_RUST` to avoid a situation
> where enabling Rust silently turns off the sanitizer. Instead, turning
> on the sanitizer results in Rust being disabled. We generally do not
> want changes to CONFIG_RUST to result in any mitigations being changed
> or turned off.
>
> At the time of writing, rustc 1.82.0 only exists via the nightly release
> channel. There is a chance that the -Zsanitizer=shadow-call-stack flag
> will end up needing 1.83.0 instead, but I think it is small.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Link: https://lore.kernel.org/rust-for-linux/20240808221138.873750-1-ojeda@kernel.org/ [1]
> ---
> Changes in v6:
> - Move Kconfig requirements into arch/*/Kconfig.
> - List non-dynamic SCS as supported on 1.82. This reflects newly added
>   things in rustc.
> - Link to v5: https://lore.kernel.org/r/20240806-shadow-call-stack-v5-1-26dccb829154@google.com
>
> Changes in v5:
> - Rebase series on v6.11-rc2.
> - The first patch is no longer included as it was merged in v6.11-rc2.
> - The commit message is rewritten from scratch.
> - Link to v4: https://lore.kernel.org/r/20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com
>
> Changes in v4:
> - Move `depends on` to CONFIG_RUST.
> - Rewrite commit messages to include more context.
> - Link to v3: https://lore.kernel.org/r/20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com
>
> Changes in v3:
> - Use -Zfixed-x18.
> - Add logic to reject unsupported rustc versions.
> - Also include a fix to be backported.
> - Link to v2: https://lore.kernel.org/rust-for-linux/20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com/
>
> Changes in v2:
> - Add -Cforce-unwind-tables flag.
> - Link to v1: https://lore.kernel.org/rust-for-linux/20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com/
> ---
>  Makefile            | 1 +
>  arch/arm64/Kconfig  | 7 ++++++-
>  arch/arm64/Makefile | 3 +++
>  arch/riscv/Kconfig  | 7 ++++++-
>  init/Kconfig        | 1 -
>  5 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 44c02a6f60a1..eb01a26d8354 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -927,6 +927,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
>  ifndef CONFIG_DYNAMIC_SCS
>  CC_FLAGS_SCS   := -fsanitize=shadow-call-stack
>  KBUILD_CFLAGS  += $(CC_FLAGS_SCS)
> +KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
>  endif
>  export CC_FLAGS_SCS
>  endif
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a2f8ff354ca6..28c4a3035331 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -231,7 +231,7 @@ config ARM64
>         select HAVE_FUNCTION_ARG_ACCESS_API
>         select MMU_GATHER_RCU_TABLE_FREE
>         select HAVE_RSEQ
> -       select HAVE_RUST if CPU_LITTLE_ENDIAN
> +       select HAVE_RUST if RUSTC_SUPPORTS_ARM64
>         select HAVE_STACKPROTECTOR
>         select HAVE_SYSCALL_TRACEPOINTS
>         select HAVE_KPROBES
> @@ -265,6 +265,11 @@ config ARM64
>         help
>           ARM 64-bit (AArch64) Linux support.
>
> +config RUSTC_SUPPORTS_ARM64

Nit: could we choose a better name here? ARCH_HAVE_RUST perhaps?

> +       def_bool y
> +       depends on CPU_LITTLE_ENDIAN
> +       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200 || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS
> +

This is a bit opaque, so I'd prefer to have a comment here, explaining
that rustc 1.82 supports emitting the instrumentation statically, but
1.80 is needed to get the X18 reservation, which the DWARF based
patching logic relies on.

>  config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
>         def_bool CC_IS_CLANG
>         # https://github.com/ClangBuiltLinux/linux/issues/1507
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index f6bc3da1ef11..b058c4803efb 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -57,9 +57,11 @@ KBUILD_AFLAGS        += $(call cc-option,-mabi=lp64)
>  ifneq ($(CONFIG_UNWIND_TABLES),y)
>  KBUILD_CFLAGS  += -fno-asynchronous-unwind-tables -fno-unwind-tables
>  KBUILD_AFLAGS  += -fno-asynchronous-unwind-tables -fno-unwind-tables
> +KBUILD_RUSTFLAGS += -Cforce-unwind-tables=n
>  else
>  KBUILD_CFLAGS  += -fasynchronous-unwind-tables
>  KBUILD_AFLAGS  += -fasynchronous-unwind-tables
> +KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y -Zuse-sync-unwind=n
>  endif
>
>  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> @@ -114,6 +116,7 @@ endif
>
>  ifeq ($(CONFIG_SHADOW_CALL_STACK), y)
>  KBUILD_CFLAGS  += -ffixed-x18
> +KBUILD_RUSTFLAGS += -Zfixed-x18
>  endif
>
>  ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0f3cd7c3a436..476e38ed9c00 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -172,7 +172,7 @@ config RISCV
>         select HAVE_REGS_AND_STACK_ACCESS_API
>         select HAVE_RETHOOK if !XIP_KERNEL
>         select HAVE_RSEQ
> -       select HAVE_RUST if 64BIT
> +       select HAVE_RUST if RUSTC_SUPPORTS_RISCV
>         select HAVE_SAMPLE_FTRACE_DIRECT
>         select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>         select HAVE_STACKPROTECTOR
> @@ -202,6 +202,11 @@ config RISCV
>         select UACCESS_MEMCPY if !MMU
>         select ZONE_DMA32 if 64BIT
>
> +config RUSTC_SUPPORTS_RISCV
> +       def_bool y
> +       depends on 64BIT
> +       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200
> +

Same nit as above. Also, if this enables shadow call stack on RISC-V
too, please mention it in the commit log more clearly, as it only
mentions arm64 by name.

>  config CLANG_SUPPORTS_DYNAMIC_FTRACE
>         def_bool CC_IS_CLANG
>         # https://github.com/ClangBuiltLinux/linux/issues/1817
> diff --git a/init/Kconfig b/init/Kconfig
> index fe76c5d0a72e..e095e94eb9db 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1909,7 +1909,6 @@ config RUST
>         depends on !MODVERSIONS
>         depends on !GCC_PLUGINS
>         depends on !RANDSTRUCT
> -       depends on !SHADOW_CALL_STACK
>         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
>         help
>           Enables Rust support in the kernel.
>
> ---
> base-commit: 5953fd808fca8116a91678ee5fac00fc198ad93d
> change-id: 20240304-shadow-call-stack-9c197a4361d9
>

With the comments addressed (or refuted)

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

Thanks,

