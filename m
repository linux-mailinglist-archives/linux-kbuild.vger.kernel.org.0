Return-Path: <linux-kbuild+bounces-3263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF81962EA5
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 19:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA1A02842A4
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 17:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0BA1A4B84;
	Wed, 28 Aug 2024 17:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBsxYONW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE701A3BAA;
	Wed, 28 Aug 2024 17:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724866714; cv=none; b=sLjnCBorno8h+ajL2b4wYMRnTg2h20aXmW0COeg650dWRBqenerxigZUj/DyYeAd5H0KXwM1xDV47FZn0FID4wIeZ4ofqea8TKYzWaWifd3x2vIsQ2TRWe/oi1y4WSnxq71tmlJm7B70c6ljmgLb36WDaF4tAwTlO/ve+YV7NKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724866714; c=relaxed/simple;
	bh=OOOwYyXztEJvfAk9NZ/gGALIUTmg/ggLAJsY8ejOKvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzD9HChEhRdo2uxmsV4uBLp7w4hAA54g42zd5iYdCqsx37dpXOWMYKvy6A/RFdTLNekx4/3lvN3HgJwY7Ej/lfseqYyRUOl3nIP0s3PZGSY8zbAmQNOPGZbPPcYWhmtnf2wJ8JuhYU3EW4EKQ/3/WOrINebfFBjMtnDphL29IXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBsxYONW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FC9C4CEC2;
	Wed, 28 Aug 2024 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724866714;
	bh=OOOwYyXztEJvfAk9NZ/gGALIUTmg/ggLAJsY8ejOKvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GBsxYONWLzQDJtDnWl5DiWShZUeY/q2/WNLpY07cQ+lyCAts4dj0qaDNm0JjnpQd1
	 NOCLtfnCmbyU9WUGBL1KkOEuPayurkumOjJb/ejvAf41J4MuLO62tqE2Dr0vvSu3gb
	 WhVovi8sR+GcEnPV57MEg7GMSEZv2iviGOHrP22M4ghlID430TbTIOwcCVQV5Y9oft
	 SJD8rC+AhII3TI/WqfI3vLFNbHN6ji2ASHIgvFwnW5JC+e8FGaHxm40aYZ0hA+GDmu
	 52EIu3gyGljVRKkyU1COVG52g5E90E1zLJaakdW0SIyrtwmERJd2sgjzInbsRDxYmL
	 fcnF5OPmuEjOg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533de5a88f8so6569259e87.3;
        Wed, 28 Aug 2024 10:38:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQAU6GL3ahOJnXEBLSWz4Dbneg9pK4R5UCSN8ipVbBt7GEZXZlAh1NzzFrUwltbismdqRsxC9UU7BPbPxeJ6s=@vger.kernel.org, AJvYcCWdoBbdYASv06Boy7BZBfnA2vr+pVilQeZZSW8c2sRFJCnKETSXJ5YGNEh4YHcXMY5x5MMuGNXm99lWv/w=@vger.kernel.org, AJvYcCXHkHqTUIv2cX8BkD5yHwWD6ViiimlbC9Aujbbew9LsmtWJz1S90eXEx0hIMxwm/8+wMayvKEeMRaxVoCYU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1aMxb12jGvOE3+ImJrSKr8BdrPW4zWrljeQSzPjlmIdFmuDu0
	AtAsIFSFf7/CSzXYX+X1Ewv7uzdkvkhyDIMbp5oshSPSIIm5IRnmLKujDUT916xRwSGPCC/7zH7
	gxCX4JkXXRXXD9UD/uZY9GUSYcsM=
X-Google-Smtp-Source: AGHT+IHAVGPi6q8uJE+1kN/NUmiGTD51hr7CK0dL16xh2mxDpNMfUGdYD+AhZP9SM2JiO/W4nWgxh8SUi+GMSifF6bc=
X-Received: by 2002:a05:6512:2211:b0:530:ab86:3 with SMTP id
 2adb3069b0e04-5353e54640emr29659e87.1.1724866712397; Wed, 28 Aug 2024
 10:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
 <CAMj1kXGtH+yna6CLncxTYi+ie2WF5-nSA3q0Re9L1VJt1EoQ9A@mail.gmail.com> <CAH5fLgiE9TsCSj2JWny+d_StTPcw3iVu7zNQf0TSUVu2H8Dr5A@mail.gmail.com>
In-Reply-To: <CAH5fLgiE9TsCSj2JWny+d_StTPcw3iVu7zNQf0TSUVu2H8Dr5A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 28 Aug 2024 19:38:20 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFFaXW5WBUW=U+SZBOkCYSRwVJkQ1rD1wGKRsoxDBY8aw@mail.gmail.com>
Message-ID: <CAMj1kXFFaXW5WBUW=U+SZBOkCYSRwVJkQ1rD1wGKRsoxDBY8aw@mail.gmail.com>
Subject: Re: [PATCH v6] rust: support for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Aug 2024 at 16:42, Alice Ryhl <aliceryhl@google.com> wrote:
>
> On Wed, Aug 28, 2024 at 3:48=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> =
wrote:
> >
> > On Mon, 26 Aug 2024 at 16:23, Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > This patch adds all of the flags that are needed to support the shado=
w
> > > call stack (SCS) sanitizer with Rust, and updates Kconfig to allow on=
ly
> > > configurations that work.
> > >
> > > The -Zfixed-x18 flag is required to use SCS on arm64, and requires ru=
stc
> > > version 1.80.0 or greater. This restriction is reflected in Kconfig.
> > >
> > > When CONFIG_DYNAMIC_SCS is enabled, the build will be configured to
> > > include unwind tables in the build artifacts. Dynamic SCS uses the
> > > unwind tables at boot to find all places that need to be patched. The
> > > -Cforce-unwind-tables=3Dy flag ensures that unwind tables are availab=
le
> > > for Rust code.
> > >
> > > In non-dynamic mode, the -Zsanitizer=3Dshadow-call-stack flag is what
> > > enables the SCS sanitizer. Using this flag requires rustc version 1.8=
2.0
> > > or greater on the targets used by Rust in the kernel. This restrictio=
n
> > > is reflected in Kconfig.
> > >
> > > It is possible to avoid the requirement of rustc 1.80.0 by using
> > > -Ctarget-feature=3D+reserve-x18 instead of -Zfixed-x18. However, this=
 flag
> > > emits a warning during the build, so this patch does not add support =
for
> > > using it and instead requires 1.80.0 or greater.
> > >
> > > The dependency is placed on `select HAVE_RUST` to avoid a situation
> > > where enabling Rust silently turns off the sanitizer. Instead, turnin=
g
> > > on the sanitizer results in Rust being disabled. We generally do not
> > > want changes to CONFIG_RUST to result in any mitigations being change=
d
> > > or turned off.
> > >
> > > At the time of writing, rustc 1.82.0 only exists via the nightly rele=
ase
> > > channel. There is a chance that the -Zsanitizer=3Dshadow-call-stack f=
lag
> > > will end up needing 1.83.0 instead, but I think it is small.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > > Link: https://lore.kernel.org/rust-for-linux/20240808221138.873750-1-=
ojeda@kernel.org/ [1]
> > > ---
> > > Changes in v6:
> > > - Move Kconfig requirements into arch/*/Kconfig.
> > > - List non-dynamic SCS as supported on 1.82. This reflects newly adde=
d
> > >   things in rustc.
> > > - Link to v5: https://lore.kernel.org/r/20240806-shadow-call-stack-v5=
-1-26dccb829154@google.com
> > >
> > > Changes in v5:
> > > - Rebase series on v6.11-rc2.
> > > - The first patch is no longer included as it was merged in v6.11-rc2=
.
> > > - The commit message is rewritten from scratch.
> > > - Link to v4: https://lore.kernel.org/r/20240729-shadow-call-stack-v4=
-0-2a664b082ea4@google.com
> > >
> > > Changes in v4:
> > > - Move `depends on` to CONFIG_RUST.
> > > - Rewrite commit messages to include more context.
> > > - Link to v3: https://lore.kernel.org/r/20240704-shadow-call-stack-v3=
-0-d11c7a6ebe30@google.com
> > >
> > > Changes in v3:
> > > - Use -Zfixed-x18.
> > > - Add logic to reject unsupported rustc versions.
> > > - Also include a fix to be backported.
> > > - Link to v2: https://lore.kernel.org/rust-for-linux/20240305-shadow-=
call-stack-v2-1-c7b4a3f4d616@google.com/
> > >
> > > Changes in v2:
> > > - Add -Cforce-unwind-tables flag.
> > > - Link to v1: https://lore.kernel.org/rust-for-linux/20240304-shadow-=
call-stack-v1-1-f055eaf40a2c@google.com/
> > > ---
> > >  Makefile            | 1 +
> > >  arch/arm64/Kconfig  | 7 ++++++-
> > >  arch/arm64/Makefile | 3 +++
> > >  arch/riscv/Kconfig  | 7 ++++++-
> > >  init/Kconfig        | 1 -
> > >  5 files changed, 16 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 44c02a6f60a1..eb01a26d8354 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -927,6 +927,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
> > >  ifndef CONFIG_DYNAMIC_SCS
> > >  CC_FLAGS_SCS   :=3D -fsanitize=3Dshadow-call-stack
> > >  KBUILD_CFLAGS  +=3D $(CC_FLAGS_SCS)
> > > +KBUILD_RUSTFLAGS +=3D -Zsanitizer=3Dshadow-call-stack
> > >  endif
> > >  export CC_FLAGS_SCS
> > >  endif
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index a2f8ff354ca6..28c4a3035331 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -231,7 +231,7 @@ config ARM64
> > >         select HAVE_FUNCTION_ARG_ACCESS_API
> > >         select MMU_GATHER_RCU_TABLE_FREE
> > >         select HAVE_RSEQ
> > > -       select HAVE_RUST if CPU_LITTLE_ENDIAN
> > > +       select HAVE_RUST if RUSTC_SUPPORTS_ARM64
> > >         select HAVE_STACKPROTECTOR
> > >         select HAVE_SYSCALL_TRACEPOINTS
> > >         select HAVE_KPROBES
> > > @@ -265,6 +265,11 @@ config ARM64
> > >         help
> > >           ARM 64-bit (AArch64) Linux support.
> > >
> > > +config RUSTC_SUPPORTS_ARM64
> >
> > Nit: could we choose a better name here? ARCH_HAVE_RUST perhaps?
>
> This is the name suggested by Will Deacon in the previous version. I'm
> happy to change it if you prefer, but I'm wondering if that name is
> too close to HAVE_RUST? Perhaps ARCH_SUPPORTS_RUST? Ultimately I think
> that the current name is okay.
>

Fair enough. Let's leave it as-is.

> > > +       def_bool y
> > > +       depends on CPU_LITTLE_ENDIAN
> > > +       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 108200 ||=
 RUSTC_VERSION >=3D 108000 && UNWIND_PATCH_PAC_INTO_SCS
> > > +
> >
> > This is a bit opaque, so I'd prefer to have a comment here, explaining
> > that rustc 1.82 supports emitting the instrumentation statically, but
> > 1.80 is needed to get the X18 reservation, which the DWARF based
> > patching logic relies on.
>
> Hmm. I tried a few different wordings and ended on this:
>
> config RUSTC_SUPPORTS_ARM64
>        def_bool y
>        depends on CPU_LITTLE_ENDIAN
>        # Shadow call stack is only supported on some versions of rustc.
>        #
>        # When using the UNWIND_PATCH_PAC_INTO_SCS option, rustc version 1=
.80+ is
>        # required due to use of the -Zfixed-x18 flag.
>        #
>        # Otherwise, rustc version 1.82+ is required due to use of the
>        # -Zsanitizer=3Dshadow-call-stack flag.
>        depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 108200 ||
> RUSTC_VERSION >=3D 108000 && UNWIND_PATCH_PAC_INTO_SCS
>
> This wording avoids getting into the weeds of how SCS works. Do you
> prefer something that gets into more detail than this?
>

This looks fine to me.

> > >  config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
> > >         def_bool CC_IS_CLANG
> > >         # https://github.com/ClangBuiltLinux/linux/issues/1507
> > > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > > index f6bc3da1ef11..b058c4803efb 100644
> > > --- a/arch/arm64/Makefile
> > > +++ b/arch/arm64/Makefile
> > > @@ -57,9 +57,11 @@ KBUILD_AFLAGS        +=3D $(call cc-option,-mabi=
=3Dlp64)
> > >  ifneq ($(CONFIG_UNWIND_TABLES),y)
> > >  KBUILD_CFLAGS  +=3D -fno-asynchronous-unwind-tables -fno-unwind-tabl=
es
> > >  KBUILD_AFLAGS  +=3D -fno-asynchronous-unwind-tables -fno-unwind-tabl=
es
> > > +KBUILD_RUSTFLAGS +=3D -Cforce-unwind-tables=3Dn
> > >  else
> > >  KBUILD_CFLAGS  +=3D -fasynchronous-unwind-tables
> > >  KBUILD_AFLAGS  +=3D -fasynchronous-unwind-tables
> > > +KBUILD_RUSTFLAGS +=3D -Cforce-unwind-tables=3Dy -Zuse-sync-unwind=3D=
n
> > >  endif
> > >
> > >  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> > > @@ -114,6 +116,7 @@ endif
> > >
> > >  ifeq ($(CONFIG_SHADOW_CALL_STACK), y)
> > >  KBUILD_CFLAGS  +=3D -ffixed-x18
> > > +KBUILD_RUSTFLAGS +=3D -Zfixed-x18
> > >  endif
> > >
> > >  ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 0f3cd7c3a436..476e38ed9c00 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -172,7 +172,7 @@ config RISCV
> > >         select HAVE_REGS_AND_STACK_ACCESS_API
> > >         select HAVE_RETHOOK if !XIP_KERNEL
> > >         select HAVE_RSEQ
> > > -       select HAVE_RUST if 64BIT
> > > +       select HAVE_RUST if RUSTC_SUPPORTS_RISCV
> > >         select HAVE_SAMPLE_FTRACE_DIRECT
> > >         select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
> > >         select HAVE_STACKPROTECTOR
> > > @@ -202,6 +202,11 @@ config RISCV
> > >         select UACCESS_MEMCPY if !MMU
> > >         select ZONE_DMA32 if 64BIT
> > >
> > > +config RUSTC_SUPPORTS_RISCV
> > > +       def_bool y
> > > +       depends on 64BIT
> > > +       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 108200
> > > +
> >
> > Same nit as above. Also, if this enables shadow call stack on RISC-V
> > too, please mention it in the commit log more clearly, as it only
> > mentions arm64 by name.
>
> Same question as above. I came up with:
>
> config RUSTC_SUPPORTS_RISCV
>        def_bool y
>        depends on 64BIT
>        # Shadow call stack requires rustc version 1.82+ due to use of the
>        # -Zsanitizer=3Dshadow-call-stack flag.
>        depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 108200
>

Fine too.

> > >  config CLANG_SUPPORTS_DYNAMIC_FTRACE
> > >         def_bool CC_IS_CLANG
> > >         # https://github.com/ClangBuiltLinux/linux/issues/1817
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index fe76c5d0a72e..e095e94eb9db 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -1909,7 +1909,6 @@ config RUST
> > >         depends on !MODVERSIONS
> > >         depends on !GCC_PLUGINS
> > >         depends on !RANDSTRUCT
> > > -       depends on !SHADOW_CALL_STACK
> > >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > >         help
> > >           Enables Rust support in the kernel.
> > >
> > > ---
> > > base-commit: 5953fd808fca8116a91678ee5fac00fc198ad93d
> > > change-id: 20240304-shadow-call-stack-9c197a4361d9
> > >
> >
> > With the comments addressed (or refuted)
> >
> > Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
>
> Thanks for the review!
>
> Alice
>

