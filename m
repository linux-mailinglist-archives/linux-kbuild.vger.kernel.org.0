Return-Path: <linux-kbuild+bounces-8691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D3B3FBF0
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Sep 2025 12:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DBD91B23C86
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Sep 2025 10:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7592EC098;
	Tue,  2 Sep 2025 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0iq12Hp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A62EA49D;
	Tue,  2 Sep 2025 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807939; cv=none; b=HG+w0xAZ5paa/VIoS3rYQAYZiSoskUKGQK5VysEczTqNlGgxnVp2OF9VpXu29AvTxvVcR98E6JzWqSi2e4U6mRgTl8BDfWLn0nsu2+JNnsq/oyPVaY6tYB46aqP/nX9aeyH/7qCdqHY0a7Bd3HXMBPxczd5gM9DAHGqJWjjygJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807939; c=relaxed/simple;
	bh=dLzEaqaX+WltyZNFo8+JxunBRV1p0dzHnmT+/Qzfz8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMyFmBEOWGwauDvdY6H9ZaJPy02gYsqoRCADz4V2/4slLKGxAI4r3yP9AmJLSb6ZTYzlvJl0NH13/DhALnbnCHmwgT+n1dJYWVctCbKGOzr0buLR6IUdQHkcogZoJMVQLnJLnhkp4lh9OcoVPUWmAWOotA62T1HUvEQgnnbpHNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0iq12Hp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4683CC4CEED;
	Tue,  2 Sep 2025 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756807938;
	bh=dLzEaqaX+WltyZNFo8+JxunBRV1p0dzHnmT+/Qzfz8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0iq12HpLoyS1ZEAT5vmL19wjDENpOw9N5G0QDaXoQdlEofns52lh6RpdN50jPO1R
	 ak9cN19qpcWOmfzidBioNz9i37LW2qVyAl5dWev8b84X8BSTgtW0ZMyF4wiZ0tODeg
	 37l1Sep25jEgdMGQHpabFabtdhE+lwhO6o+Di9dJo0ZG6t2jmNfUBKH7M7uB3jFB6O
	 5WZHS1PcaoBBHqm/0SYq7KvP1gHczRkZMPdsjuqXzDgfe9gJm7j7lDhlRX90wmt6SW
	 SYOkHuV3FfBoVusXPqpobYqfqcRCBx/iMgfB9zkd2PB0fxpTLlrUzxcn+6lXr5mQOi
	 N9IrNKtKmu07w==
Date: Tue, 2 Sep 2025 11:12:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
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
Message-ID: <20250902-crablike-bountiful-eb1c127f024a@spud>
References: <20250408220311.1033475-1-ojeda@kernel.org>
 <20250901-shrimp-define-9d99cc2a012a@spud>
 <aLaq6TpUtLkqHg_o@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H+VzOpbPUpNEExps"
Content-Disposition: inline
In-Reply-To: <aLaq6TpUtLkqHg_o@google.com>


--H+VzOpbPUpNEExps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 08:29:29AM +0000, Alice Ryhl wrote:
> On Mon, Sep 01, 2025 at 06:45:54PM +0100, Conor Dooley wrote:
> > Yo,
> >=20
> > On Wed, Apr 09, 2025 at 12:03:11AM +0200, Miguel Ojeda wrote:
> > > If KASAN is enabled, and one runs in a clean repository e.g.:
> > >=20
> > >     make LLVM=3D1 prepare
> > >     make LLVM=3D1 prepare
> > >=20
> > > Then the Rust code gets rebuilt, which should not happen.
> > >=20
> > > The reason is some of the LLVM KASAN `rustc` flags are added in the
> > > second run:
> > >=20
> > >     -Cllvm-args=3D-asan-instrumentation-with-call-threshold=3D10000
> > >     -Cllvm-args=3D-asan-stack=3D0
> > >     -Cllvm-args=3D-asan-globals=3D1
> > >     -Cllvm-args=3D-asan-kernel-mem-intrinsic-prefix=3D1
> > >=20
> > > Further runs do not rebuild Rust because the flags do not change anym=
ore.
> > >=20
> > > Rebuilding like that in the second run is bad, even if this just happ=
ens
> > > with KASAN enabled, but missing flags in the first one is even worse.
> > >=20
> > > The root issue is that we pass, for some architectures and for the mo=
ment,
> > > a generated `target.json` file. That file is not ready by the time `r=
ustc`
> > > gets called for the flag test, and thus the flag test fails just beca=
use
> > > the file is not available, e.g.:
> > >=20
> > >     $ ... --target=3D./scripts/target.json ... -Cllvm-args=3D...
> > >     error: target file "./scripts/target.json" does not exist
> > >=20
> > > There are a few approaches we could take here to solve this. For inst=
ance,
> > > we could ensure that every time that the config is rebuilt, we regene=
rate
> > > the file and recompute the flags. Or we could use the LLVM version to
> > > check for these flags, instead of testing the flag (which may have ot=
her
> > > advantages, such as allowing us to detect renames on the LLVM side).
> > >=20
> > > However, it may be easier than that: `rustc` is aware of the `-Cllvm-=
args`
> > > regardless of the `--target` (e.g. I checked that the list printed
> > > is the same, plus that I can check for these flags even if I pass
> > > a completely unrelated target), and thus we can just eliminate the
> > > dependency completely.
> > >=20
> > > Thus filter out the target.
> >=20
> >=20
> >=20
> >=20
> > > This does mean that `rustc-option` cannot be used to test a flag that
> > > requires the right target, but we don't have other users yet, it is a
> > > minimal change and we want to get rid of custom targets in the future.
> >=20
> > Hmm, while this might be true, I think it should not actually have been
> > true. Commit ca627e636551e ("rust: cfi: add support for CFI_CLANG with =
Rust")
> > added a cc-option check to the rust kconfig symbol, checking if the c
> > compiler supports the integer normalisations stuff:
> > 	depends on !CFI_CLANG || RUSTC_VERSION >=3D 107900 && $(cc-option,-fsa=
nitize=3Dkcfi -fsanitize-cfi-icall-experimental-normalize-integers)
> > and also sets the relevant options in the makefile:
> > 	ifdef CONFIG_RUST
> > 	       # Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST=
 selects
> > 	       # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
> > 	       RUSTC_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-norma=
lize-integers
> > 	       KBUILD_RUSTFLAGS +=3D $(RUSTC_FLAGS_CFI)
> > 	       export RUSTC_FLAGS_CFI
> > 	endif
> > but it should also have added a rustc-option check as, unfortunately,
> > support for kcfi in rustc is target specific. This results in build
> > breakages where the arch supports CFI_CLANG and RUST, but the target in
> > use does not have the kcfi flag set.
> > I attempted to fix this by adding:
> > 	diff --git a/arch/Kconfig b/arch/Kconfig
> > 	index d1b4ffd6e0856..235709fb75152 100644
> > 	--- a/arch/Kconfig
> > 	+++ b/arch/Kconfig
> > 	@@ -916,6 +916,7 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
> > 	 config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
> > 	        def_bool y
> > 	        depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
> > 	+       depends on $(rustc-option,-C panic=3Dabort -Zsanitizer=3Dkcfi =
-Zsanitizer-cfi-normalize-integers)
> > 	        depends on RUSTC_VERSION >=3D 107900
> > 	        # With GCOV/KASAN we need this fix: https://github.com/rust-la=
ng/rust/pull/129373
> > 	        depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=
=3D 108200) || \
> > but of course this does not work for cross compilation, as you're
> > stripping the target information out and so the check passes on my host
> > even though my intended
> > RUSTC_BOOTSTRAP=3D1 rustc -C panic=3Dabort -Zsanitizer=3Dkcfi -Zsanitiz=
er-cfi-normalize-integers -Ctarget-cpu=3Dgeneric-rv64 --target=3Driscv64ima=
c-unknown-none-elf
> > is a failure.
> >=20
> > I dunno too much about rustc itself, but I suspect that adding kcfi to
> > the target there is a "free" win, but that'll take time to trickle down
> > and the minimum version rustc version for the kernel isn't going to have
> > that.
> >=20
> > I'm not really sure what your target.json suggestion below is, so just
> > reporting so that someone that understands the alternative solutions can
> > fix this.
>=20
> Probably right now we have to do this cfg by
>=20
> 	depends on CONFIG_ARM

It's valid on x86 too, right?

>=20
> to prevent riscv if rustc has the missing setting
> set on riscv. Once we add it to riscv, we change it to
>=20
> 	depends on CONFIG_ARM || (RUSTC_VERSION >=3D ??? || CONFIG_RISCV)

I kinda shied away from something like this since there was already a
cc-option on the other half and checking different versions per arch
becomes a mess - but yeah it kinda is a no-brainer to do it here when
rustc-option is kinda broken.

I guess the temporary fix is then:

config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
	def_bool y
	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
	depends on ARM64 || x86_64
	depends on RUSTC_VERSION >=3D 107900
	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull=
/129373
	depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=3D 108200) |=
| \
		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)

because there's no 32-bit target with SanitizerSet::KCFI in rustc either
AFAICT. Then later on it'd become more like:

config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
	def_bool y
	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
	depends on RISCV || ((ARM64 || x86_64) && RUSTC_VERSION >=3D 107900)
	depends on (ARM64 || x86_64) || (RISCV && RUSTC_VERSION >=3D 999999)
	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull=
/129373
	depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=3D 108200) |=
| \
		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)

but that exact sort of mess is what becomes unwieldy fast since that
doesn't even cover 32-bit arm.


--H+VzOpbPUpNEExps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLbC+wAKCRB4tDGHoIJi
0hjyAP9tByKVI1IGeavixZ01MOC4OXttf2BTFfivcgVEZF5lAAEA27I7Tv1B7oFK
OTlynfN6TLIg3kRbEhZ4XzMKZVeSLgU=
=lQ9s
-----END PGP SIGNATURE-----

--H+VzOpbPUpNEExps--

