Return-Path: <linux-kbuild+bounces-8715-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08BB43B8E
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 14:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E9917BA84
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 12:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF36A2EB871;
	Thu,  4 Sep 2025 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mr6popXI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858EC2EA480;
	Thu,  4 Sep 2025 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988883; cv=none; b=I9ToCpXFyM/ZHS75idLgxJZQ1NXOOslAAvhdfxYH0kdypq7pGJJUoj84DMKWqfzueHkQengnKjG3CXZVHvDnVMP2laPtUj+bkbNwLeJBcA2Ss1nza70tjJBR34qwDcWcQSV1MiXZ8kY7gtwtOIbHz2QUvzFFZDccOiC8cjZWdow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988883; c=relaxed/simple;
	bh=3ZEmRxjZLaIPRC9HRDNrnRhSzhVZ8NzTBiURfd6pYZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV+ycKGUQBiwm+UpZX9wgM7PjXEFRlIBAp1D4Xc4sUY3GbCSeXHtwz/GKdQDddcP80v9xGDbSiE3MNIivudL7qjUzbhPv2wupiLT0ajK3AAVfGmr4fFjZBsaFYDB16Jnx8goddtsWN40PQcHi3Og73SPfh7rW9tO3kTac7A73BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mr6popXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDE6C4CEF0;
	Thu,  4 Sep 2025 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756988883;
	bh=3ZEmRxjZLaIPRC9HRDNrnRhSzhVZ8NzTBiURfd6pYZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mr6popXIa1e9rO2XDnT/n4XKA045CjsCzYcg4PrERcyad1xy7XdUyxuqZ862L1WOG
	 wi+xMqMw8UjSAApSqmXpxlELbUPjfjbWOo7olkA4UzOtlzxLVapoAdxTonnmK2C+DS
	 rebTHSZJxr99w/45pCl8gc+2lvkiYtGidhXT0eNBcA9RWT8pFE/87pN04J1v9RLaYs
	 TLqR9hH4QNuqz7WsojMnrIvy1AeqbLbrpEZlziqtviBkzyLxhSUE+pkpfOsXUhQBEJ
	 632XLGeC+hAv6sSlAfgZouUKYjF9/MwjR+EIVpafoQOnTkKv/SXMF7hydTl2wkMCiV
	 v3LbC6xGZRmEQ==
Date: Thu, 4 Sep 2025 13:27:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna Yang <spriteovo@gmail.com>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Tejun Heo <tj@kernel.org>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
Message-ID: <20250904-sterilize-swagger-c7999b124e83@spud>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bRU8yYMCdcvTZHhs"
Content-Disposition: inline
In-Reply-To: <20250903190806.2604757-2-SpriteOvO@gmail.com>


--bRU8yYMCdcvTZHhs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 03, 2025 at 09:07:57PM +0200, Asuna Yang wrote:
> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM.
>=20
> Add a Kconfig non-visible symbol to ensure that all important RISC-V
> specific flags that will be used by GCC can be correctly recognized by
> Rust bindgen's libclang, otherwise config HAVE_RUST will not be
> selected.
>=20
> Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>

Thanks for working on this. One thing - please don't send new versions
of patchsets in response to earlier versions or other threads. It
doesn't do you any favours with mailbox visibility.

> ---
>  Documentation/rust/arch-support.rst |  2 +-
>  arch/riscv/Kconfig                  | 62 ++++++++++++++++++++++++++++-
>  rust/Makefile                       |  7 +++-
>  3 files changed, 68 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arc=
h-support.rst
> index 6e6a515d0899..5282e0e174e8 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
>  ``arm``        Maintained        ARMv7 Little Endian only.
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> -``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
> +``riscv``      Maintained        ``riscv64`` only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1c5544401530..d7f421e0f429 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -195,7 +195,7 @@ config RISCV
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RETHOOK if !XIP_KERNEL
>  	select HAVE_RSEQ
> -	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
> +	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && RUST_BINDGEN_LIBCLANG_RECOG=
NIZES_FLAGS
>  	select HAVE_SAMPLE_FTRACE_DIRECT
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>  	select HAVE_STACKPROTECTOR
> @@ -236,6 +236,27 @@ config RUSTC_SUPPORTS_RISCV
>  	# -Zsanitizer=3Dshadow-call-stack flag.
>  	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 108200
> =20
> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_FLAGS
> +	def_bool y
> +	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_V
> +	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZABHA
> +	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZACAS
> +	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBA
> +	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBB
> +	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBC
> +	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBKB
> +	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI

Other than Zicsr/Zifencei that may need explicit handling in a dedicated
option, the approach here seems kinda backwards.
Individually these symbols don't actually mean what they say they do,
which is confusing: "recognises" here is true even when it may not be
true at all because TOOLCHAIN_HAS_FOO is not set. Why can these options
not be removed, and instead the TOOLCHAIN_HAS_FOO options grow a
"depends on !RUST || <condition>"?

> +	help
> +	  Rust bindgen currently relies on libclang as backend. When a mixed bu=
ild is
> +	  performed (building C code with GCC), GCC flags will be passed to lib=
clang.
> +	  However, not all GCC flags are recognized by Clang, so most of the
> +	  incompatible flags have been filtered out in rust/Makefile.
> +
> +	  For RISC-V, GCC and Clang are not at the same pace of implementing ex=
tensions.
> +	  This config ensures that all important RISC-V specific flags that wil=
l be
> +	  used by GCC can be correctly recognized by Rust bindgen's libclang, o=
therwise
> +	  config HAVE_RUST will not be selected.
> +
>  config CLANG_SUPPORTS_DYNAMIC_FTRACE
>  	def_bool CC_IS_CLANG
>  	# https://github.com/ClangBuiltLinux/linux/issues/1817
> @@ -634,6 +655,11 @@ config TOOLCHAIN_HAS_V
>  	depends on LLD_VERSION >=3D 140000 || LD_VERSION >=3D 23800
>  	depends on AS_HAS_OPTION_ARCH
> =20
> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_V
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/e6de53b4de4aecca4ac892500=
a0907805896ed27
> +	depends on !TOOLCHAIN_HAS_V || RUST_BINDGEN_LIBCLANG_VERSION >=3D 140000
> +
>  config RISCV_ISA_V
>  	bool "Vector extension support"
>  	depends on TOOLCHAIN_HAS_V
> @@ -698,6 +724,11 @@ config TOOLCHAIN_HAS_ZABHA
>  	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zabha)
>  	depends on AS_HAS_OPTION_ARCH
> =20
> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZABHA
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/6b7444964a8d028989beee554=
a1f5c61d16a1cac
> +	depends on !TOOLCHAIN_HAS_ZABHA || RUST_BINDGEN_LIBCLANG_VERSION >=3D 1=
90100
> +
>  config RISCV_ISA_ZABHA
>  	bool "Zabha extension support for atomic byte/halfword operations"
>  	depends on TOOLCHAIN_HAS_ZABHA
> @@ -716,6 +747,11 @@ config TOOLCHAIN_HAS_ZACAS
>  	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zacas)
>  	depends on AS_HAS_OPTION_ARCH
> =20
> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZACAS
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/614aeda93b2225c6eb42b00ba=
189ba7ca2585c60
> +	depends on !TOOLCHAIN_HAS_ZACAS || RUST_BINDGEN_LIBCLANG_VERSION >=3D 2=
00100
> +
>  config RISCV_ISA_ZACAS
>  	bool "Zacas extension support for atomic CAS"
>  	depends on TOOLCHAIN_HAS_ZACAS
> @@ -735,6 +771,11 @@ config TOOLCHAIN_HAS_ZBB
>  	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
>  	depends on AS_HAS_OPTION_ARCH
> =20
> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBB
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da22=
0d0952f795ac477
> +	depends on !TOOLCHAIN_HAS_ZBB || RUST_BINDGEN_LIBCLANG_VERSION >=3D 140=
000
> +
>  # This symbol indicates that the toolchain supports all v1.0 vector cryp=
to
>  # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these a=
t once.
>  # binutils added all except Zvkb, then added Zvkb.  So we just check for=
 Zvkb.
> @@ -750,6 +791,11 @@ config TOOLCHAIN_HAS_ZBA
>  	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
>  	depends on AS_HAS_OPTION_ARCH
> =20
> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBA
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da22=
0d0952f795ac477
> +	depends on !TOOLCHAIN_HAS_ZBA || RUST_BINDGEN_LIBCLANG_VERSION >=3D 140=
000
> +
>  config RISCV_ISA_ZBA
>  	bool "Zba extension support for bit manipulation instructions"
>  	default y
> @@ -785,6 +831,11 @@ config TOOLCHAIN_HAS_ZBC
>  	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
>  	depends on AS_HAS_OPTION_ARCH
> =20
> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBC
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da22=
0d0952f795ac477
> +	depends on !TOOLCHAIN_HAS_ZBC || RUST_BINDGEN_LIBCLANG_VERSION >=3D 140=
000
> +
>  config RISCV_ISA_ZBCawl
>  	bool "Zbc extension support for carry-less multiplication instructions"
>  	depends on TOOLCHAIN_HAS_ZBC
> @@ -808,6 +859,11 @@ config TOOLCHAIN_HAS_ZBKB
>  	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
>  	depends on AS_HAS_OPTION_ARCH
> =20
> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBKB
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/7ee1c162cc53d37f717f9a138=
276ad64fa6863bc
> +	depends on !TOOLCHAIN_HAS_ZBKB || RUST_BINDGEN_LIBCLANG_VERSION >=3D 14=
0000
> +
>  config RISCV_ISA_ZBKB
>  	bool "Zbkb extension support for bit manipulation instructions"
>  	depends on TOOLCHAIN_HAS_ZBKB
> @@ -894,6 +950,10 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
>  	  versions of clang and GCC to be passed to GAS, which has the same res=
ult
>  	  as passing zicsr and zifencei to -march.

> +config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI
> +	def_bool y
> +	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || (TOOLCHAIN_NEEDS_EXPLICIT_ZI=
CSR_ZIFENCEI && RUST_BINDGEN_LIBCLANG_VERSION >=3D 170000)

What does the libclang >=3D 17 requirement actually do here? Is that the
version where llvm starts to require that Zicsr/Zifencei is set in order
to use them? I think a comment to that effect is required if so. This
doesn't actually need to be blocking either, should just be able to
filter it out of march when passing to bindgen, no?

What about the case where TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not
set at all? Currently your patch is going to block rust in that case,
when actually nothing needs to be done at all - no part of the toolchain
requires understanding Zicsr/Zifencei as standalone extensions in this
case.

The TOOLCHAIN_NEEDS_OLD_ISA_SPEC handling I don't remember 100% how it
works, but if bindgen requires them to be set to use the extension
this will return true but do nothing to add the extensions to march?
That seems wrong to me.
I'd be fairly amenable to disabling rust though when used in combination
with gcc < 11.3 and gas >=3D2.36 since it's such a niche condition, rather
doing work to support it. That'd be effectively an inversion of your
first condition.

You could probably do something like blocking rust if
TOOLCHAIN_NEEDS_OLD_ISA_SPEC and where TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFEN=
CEI
is set in combination with an older libclang - so like:

	select HAVE_RUST if FOO && !ZICSR_ZIFENCEI_MISMATCH

config ZICSR_ZIFENCEI_MISMATCH
	def_bool y
	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || (TOOLCHAIN_NEEDS_EXPLICIT_ZICSR=
_ZIFENCEI && RUST_BINDGEN_LIBCLANG_VERSION < 170000)

or alternatively, make a Kconfig option for the later half of that
condition along the lines of:

config BINDGEN_FILTER_OUT_ZICSR_ZIFENCEI
	def_bool y
	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI && RUST_BINDGEN_LIBCLAN=
G_VERSION < 170000

and use it to filter out _zicsr_zifencei and make the select

	select HAVE_RUST if FOO && !TOOLCHAIN_NEEDS_OLD_ISA_SPEC


FWIW the reason that these odd mixes have dedicated work done for them
in Kconfig is that the ?Linaro? CI infrastructure was running clang +
binutils builds with a version of LLVM that predated us having full
LLVM=3D1 support and it was done to stop that CI infrastructure falling
over constantly.

Cheers,
Conor.

> +
>  config FPU
>  	bool "FPU support"
>  	default y
> diff --git a/rust/Makefile b/rust/Makefile
> index 34d0429d50fd..7b1055c98146 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -277,20 +277,25 @@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-387 -mpref=
erred-stack-boundary=3D% \
>  	-fno-inline-functions-called-once -fsanitize=3Dbounds-strict \
>  	-fstrict-flex-arrays=3D% -fmin-function-alignment=3D% \
>  	-fzero-init-padding-bits=3D% -mno-fdpic \
> -	--param=3D% --param asan-%
> +	--param=3D% --param asan-% -mno-riscv-attribute
> =20
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
> +BINDGEN_TARGET_riscv	:=3D riscv64-linux-gnu
>  BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
> =20
> +ifeq ($(BINDGEN_TARGET),)
> +$(error add '--target=3D' option to rust/Makefile)
> +else
>  # All warnings are inhibited since GCC builds are very experimental,
>  # many GCC warnings are not supported by Clang, they may only appear in
>  # some configurations, with new GCC versions, etc.
>  bindgen_extra_c_flags =3D -w --target=3D$(BINDGEN_TARGET)
> +endif
> =20
>  # Auto variable zero-initialization requires an additional special optio=
n with
>  # clang that is going to be removed sometime in the future (likely in
> --=20
> 2.51.0
>=20

--bRU8yYMCdcvTZHhs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLmFyQAKCRB4tDGHoIJi
0hMEAQDtTxonALOV/JfCKvfTZ6lOMO5sKIiu+p36yGVHPeJcyAEA1gwfVGWd76Yv
/iUM0vKFtuexQARFCnxY9cTCDeaywgY=
=/COZ
-----END PGP SIGNATURE-----

--bRU8yYMCdcvTZHhs--

