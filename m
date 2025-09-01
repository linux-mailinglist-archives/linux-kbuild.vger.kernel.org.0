Return-Path: <linux-kbuild+bounces-8685-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D14B3ED78
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 19:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAD021A87ABF
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 17:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CA127145F;
	Mon,  1 Sep 2025 17:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9jzYM2f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2F33E1;
	Mon,  1 Sep 2025 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756748763; cv=none; b=QeIRxroLREOF5oeukXOYR5YPUhmwC+Am/ij5vs8iON5clVg6Sh11sYpF4Hiccc6qsE1qrn1RkxtVYJZFFB4skKM/31GlnHGSPZ21qNpDLc2w4rQOVr91oXdiT28d+mvV35RwwIipRl/oAZO98hFhko1p8lfYLTcQpdJrarAukfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756748763; c=relaxed/simple;
	bh=mkiyPyDj9nqRryG6c8NXuKXdNEmPx96Yw2sXoi/eVZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfPe1wGx4wNMxfOu3brMpVfHjcLWD3k/FarWcKJBeIIQvD1Qe7TBjoKv0ifPcn4Z9djdrOaebF6dVmCD6qXMPu7wmgpPDWQRUjMCwb8o3zwd60fWyEpqIv2frv0roGOE70R92GnO+aYDUBiaOlUBYWxjlxmJUMJQgnCiYn6yFUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9jzYM2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AB5C4CEF0;
	Mon,  1 Sep 2025 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756748761;
	bh=mkiyPyDj9nqRryG6c8NXuKXdNEmPx96Yw2sXoi/eVZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9jzYM2frw0sUhWaJqO5YlLtjhXYIosJUWmi8hp+hWqBqitZP4aVGcM/FJURdp0L9
	 QEkKVlihsSyUaDvJ+YPo4Y3ob9/m6XjKTlBZmnsaZY/vUTQqGIw39EcrvwebN6cKP8
	 VZl5Zt2VWHJ92aVNLQg5bvHPgMTwwCn8rLpUvjtLARC21u55EyeDsSyTpVejckMGFn
	 ucg3FFGrJ4ZnMauZDEo0zdClc1o/8faywlWjLq2FGvQ8gA800u5Vs7bq78IGXQmE33
	 PRx4e05LPg9rVkOcO87dFhF2A4ttjvbyG6vnR+Nnc68xSP+hrapVz911GoO8MRmOuC
	 B30h4dRxkrW6g==
Date: Mon, 1 Sep 2025 18:45:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	Matthew Maurer <mmaurer@google.com>,
	Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] rust: kasan/kbuild: fix missing flags on first build
Message-ID: <20250901-shrimp-define-9d99cc2a012a@spud>
References: <20250408220311.1033475-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jV0+S3M+JORbrPCq"
Content-Disposition: inline
In-Reply-To: <20250408220311.1033475-1-ojeda@kernel.org>


--jV0+S3M+JORbrPCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Wed, Apr 09, 2025 at 12:03:11AM +0200, Miguel Ojeda wrote:
> If KASAN is enabled, and one runs in a clean repository e.g.:
>=20
>     make LLVM=3D1 prepare
>     make LLVM=3D1 prepare
>=20
> Then the Rust code gets rebuilt, which should not happen.
>=20
> The reason is some of the LLVM KASAN `rustc` flags are added in the
> second run:
>=20
>     -Cllvm-args=3D-asan-instrumentation-with-call-threshold=3D10000
>     -Cllvm-args=3D-asan-stack=3D0
>     -Cllvm-args=3D-asan-globals=3D1
>     -Cllvm-args=3D-asan-kernel-mem-intrinsic-prefix=3D1
>=20
> Further runs do not rebuild Rust because the flags do not change anymore.
>=20
> Rebuilding like that in the second run is bad, even if this just happens
> with KASAN enabled, but missing flags in the first one is even worse.
>=20
> The root issue is that we pass, for some architectures and for the moment,
> a generated `target.json` file. That file is not ready by the time `rustc`
> gets called for the flag test, and thus the flag test fails just because
> the file is not available, e.g.:
>=20
>     $ ... --target=3D./scripts/target.json ... -Cllvm-args=3D...
>     error: target file "./scripts/target.json" does not exist
>=20
> There are a few approaches we could take here to solve this. For instance,
> we could ensure that every time that the config is rebuilt, we regenerate
> the file and recompute the flags. Or we could use the LLVM version to
> check for these flags, instead of testing the flag (which may have other
> advantages, such as allowing us to detect renames on the LLVM side).
>=20
> However, it may be easier than that: `rustc` is aware of the `-Cllvm-args`
> regardless of the `--target` (e.g. I checked that the list printed
> is the same, plus that I can check for these flags even if I pass
> a completely unrelated target), and thus we can just eliminate the
> dependency completely.
>=20
> Thus filter out the target.




> This does mean that `rustc-option` cannot be used to test a flag that
> requires the right target, but we don't have other users yet, it is a
> minimal change and we want to get rid of custom targets in the future.

Hmm, while this might be true, I think it should not actually have been
true. Commit ca627e636551e ("rust: cfi: add support for CFI_CLANG with Rust=
")
added a cc-option check to the rust kconfig symbol, checking if the c
compiler supports the integer normalisations stuff:
	depends on !CFI_CLANG || RUSTC_VERSION >=3D 107900 && $(cc-option,-fsaniti=
ze=3Dkcfi -fsanitize-cfi-icall-experimental-normalize-integers)
and also sets the relevant options in the makefile:
	ifdef CONFIG_RUST
	       # Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST sel=
ects
	       # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
	       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normalize=
-integers
	       KBUILD_RUSTFLAGS +=3D $(RUSTC_FLAGS_CFI)
	       export RUSTC_FLAGS_CFI
	endif
but it should also have added a rustc-option check as, unfortunately,
support for kcfi in rustc is target specific. This results in build
breakages where the arch supports CFI_CLANG and RUST, but the target in
use does not have the kcfi flag set.
I attempted to fix this by adding:
	diff --git a/arch/Kconfig b/arch/Kconfig
	index d1b4ffd6e0856..235709fb75152 100644
	--- a/arch/Kconfig
	+++ b/arch/Kconfig
	@@ -916,6 +916,7 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
	 config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
	        def_bool y
	        depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
	+       depends on $(rustc-option,-C panic=3Dabort -Zsanitizer=3Dkcfi -Zsa=
nitizer-cfi-normalize-integers)
	        depends on RUSTC_VERSION >=3D 107900
	        # With GCOV/KASAN we need this fix: https://github.com/rust-lang/r=
ust/pull/129373
	        depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=3D 1=
08200) || \
but of course this does not work for cross compilation, as you're
stripping the target information out and so the check passes on my host
even though my intended
RUSTC_BOOTSTRAP=3D1 rustc -C panic=3Dabort -Zsanitizer=3Dkcfi -Zsanitizer-c=
fi-normalize-integers -Ctarget-cpu=3Dgeneric-rv64 --target=3Driscv64imac-un=
known-none-elf
is a failure.

I dunno too much about rustc itself, but I suspect that adding kcfi to
the target there is a "free" win, but that'll take time to trickle down
and the minimum version rustc version for the kernel isn't going to have
that.

I'm not really sure what your target.json suggestion below is, so just
reporting so that someone that understands the alternative solutions can
fix this.

Cheers,
Conor.

>=20
> We could only filter in the case `target.json` is used, to make it work
> in more cases, but then it would be harder to notice that it may not
> work in a couple architectures.
>=20
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: stable@vger.kernel.org
> Fixes: e3117404b411 ("kbuild: rust: Enable KASAN support")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> By the way, I noticed that we are not getting `asan-instrument-allocas` e=
nabled
> in neither C nor Rust -- upstream LLVM renamed it in commit 8176ee9b5dda =
("[asan]
> Rename asan-instrument-allocas -> asan-instrument-dynamic-allocas")). But=
 it
> happened a very long time ago (9 years ago), and the addition in the kern=
el
> is fairly old too, in 342061ee4ef3 ("kasan: support alloca() poisoning").
> I assume it should either be renamed or removed? Happy to send a patch if=
 so.
>=20
>  scripts/Makefile.compiler | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 8956587b8547..7ed7f92a7daa 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -80,7 +80,7 @@ ld-option =3D $(call try-run, $(LD) $(KBUILD_LDFLAGS) $=
(1) -v,$(1),$(2),$(3))
>  # TODO: remove RUSTC_BOOTSTRAP=3D1 when we raise the minimum GNU Make ve=
rsion to 4.4
>  __rustc-option =3D $(call try-run,\
>  	echo '#![allow(missing_docs)]#![feature(no_core)]#![no_core]' | RUSTC_B=
OOTSTRAP=3D1\
> -	$(1) --sysroot=3D/dev/null $(filter-out --sysroot=3D/dev/null,$(2)) $(3=
)\
> +	$(1) --sysroot=3D/dev/null $(filter-out --sysroot=3D/dev/null --target=
=3D%,$(2)) $(3)\
>  	--crate-type=3Drlib --out-dir=3D$(TMPOUT) --emit=3Dobj=3D- - >/dev/null=
,$(3),$(4))
>=20
>  # rustc-option
>=20
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> --
> 2.49.0

--jV0+S3M+JORbrPCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLXb0gAKCRB4tDGHoIJi
0r5JAP9stx0TbJREz/W9sAmDo2EJJVmlvCEc0CI4vZzSB2wjKwEA5jtbN7q3rJFE
W/SZOgW6pFQIP1LZGnzYf2uxoNSSzQ0=
=5atv
-----END PGP SIGNATURE-----

--jV0+S3M+JORbrPCq--

