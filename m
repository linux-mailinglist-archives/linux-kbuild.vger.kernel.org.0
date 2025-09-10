Return-Path: <linux-kbuild+bounces-8807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01BB51950
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Sep 2025 16:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A00D7BA52E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Sep 2025 14:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C791932A821;
	Wed, 10 Sep 2025 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgVuC69I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A23324B33;
	Wed, 10 Sep 2025 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757514447; cv=none; b=PHbNeRMfe6ZEte50Sg9YkgAiP1kJrrJAN/je0Ps4SQhylOq92KQfghh6ak4yX4ogRrhTYIHaRce1mPLAEM0jNGMeKH79+Y1b5Ki7jG3h2QPtHDkorBQQdEnWbVYXv2F1Obr2qg4HWoytJk34+ECj5/GkTC5LlkEw4vMPp6jg1h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757514447; c=relaxed/simple;
	bh=5g5RBXhPqG8J7yMsN/VQOQGJMxPjWBvVy7aoWO0AUds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brBrs2Q17O1PDqFUu9PVmTpXIROO7S5NwWT/uFEyeRGjsH89Hoh25blibtwd2cnYsiEurHB6ICOjHhlywS1wlaeeLpK5cxwBlW32HxWyNPaFbfSc86yLmi2dGeic2vn5ZNIfNOE0PZTCSCjUVTT3racjq6BUcv0Z4qYWD+zVVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgVuC69I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A3DC4CEEB;
	Wed, 10 Sep 2025 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757514447;
	bh=5g5RBXhPqG8J7yMsN/VQOQGJMxPjWBvVy7aoWO0AUds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgVuC69I2qrVBPMfqkgTTLxAyUIuw76pJEbQ38ySGUovDRmI8lPGgl9VOtjd0N5ef
	 ijzr+reZCZmyXh7jK3TI9w4LOjsS70ahUFH/iBSe6PJP3ZV14vJZy5OGTn2wdxqYgY
	 JWJeQGDYoyH2qG2JTGXF5R7IYQXN/PC7+0AbzzqLmgxIvN/YzpsxHWzo+4zhGXAt5r
	 riklA7PCu75l3QKjY2ueNesmDrZRW76jCTBEXlAFmyqVW1DWdi+Dv5cA3FFMgvg8Ps
	 I7IhPyT7ZSQpELg1/N13ETsNErDw67UnFcc5RPVjsxCAHEMp/hh7teC8KDfrpj5FOR
	 m8Lmz6j7BcKkA==
Date: Wed, 10 Sep 2025 15:27:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna Yang <spriteovo@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Han Gao <rabenda.cn@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
Message-ID: <20250910-harmless-bamboo-ebc94758fdad@spud>
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9LQSzFz/Ck3gJsLT"
Content-Disposition: inline
In-Reply-To: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>


--9LQSzFz/Ck3gJsLT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2025 at 06:53:11PM +0200, Asuna Yang wrote:
> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM.
>=20
> Add a Kconfig symbol to indicate the version of libclang used by Rust
> bindgen and add conditions for the availability of libclang to the
> RISC-V extension Kconfig symbols that depend on the cc-option function.
>=20
> For Zicsr/Zifencei special handling, since LLVM/Clang always enables
> these two extensions, either don't pass them to -march, or pass them
> explicitly and Rust bindgen libclang must recognize them.
>=20
> Clang does not support -mno-riscv-attribute flag, filter it out to
> resolve error: unknown argument: '-mno-riscv-attribute'.
>=20
> Define BINDGEN_TARGET_riscv to pass the target triplet to Rust bindgen
> libclang for RISC-V to resolve error: unsupported argument 'medany' to
> option '-mcmodel=3D' for target 'unknown'. Improve to output a clearer
> error message if the target triplet is undefined for Rust bindgen
> libclang.
>=20
> Update the documentation, GCC + Rust builds are now supported.
>=20
> ---

FWIW, this --- breaks git, and anything after this line (including your
signoff) is lost when the patch is applied.

> Discussion:
> https://lore.kernel.org/linux-riscv/68496eed-b5a4-4739-8d84-dcc428a08e20@=
gmail.com/
> Patch v1:
> https://lore.kernel.org/linux-riscv/20250903190806.2604757-1-SpriteOvO@gm=
ail.com/
>=20
> GCC + Rust builds for RISC-V are disabled about a year ago due to differe=
nces in
> extension handling compared to LLVM, as discussed in
> https://lore.kernel.org/all/20240917000848.720765-1-jmontleo@redhat.com/
>=20
> This patch re-enables GCC + Rust builds. Compared to v1, v2 reverts the
> separation of get-rust-bindgen-libclang script and improves Kconfig condi=
tions
> based on Conor's review.
>=20
> The separation of get-rust-bindgen-libclang script is reverted based on t=
he
> concerns raised by Miguel. However, it's worth noting that we now have 3
> different places rust/Makefile scripts/{Kconfig.include,rust_is_avilable.=
sh}
> where manually calling bindgen rust_is_available_bindgen_libclang.h + sed=
 to get
> the version of libclang, and in particular, for our newly added Kconfig s=
ymbol,
> we now use awk to canonicalize the version to an integer. I would still l=
ike to
> do the script separation later for better maintainability and readability=
 if
> possible, which can be discussed further later when Miguel has time.
>=20
> Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>

> diff --git a/init/Kconfig b/init/Kconfig
> index e3eb63eadc8757a10b091c74bbee8008278c0521..0859d308a48591df769c7dbae=
f6f035324892bd3 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,6 +82,12 @@ config RUSTC_LLVM_VERSION
>  	int
>  	default $(rustc-llvm-version)
> =20
> +config RUST_BINDGEN_LIBCLANG_VERSION
> +	int
> +	default $(rustc-bindgen-libclang-version)
> +	help
> +	  This is the version of `libclang` used by the Rust bindings generator.

The riscv patchwork CI stuff is really unhappy with this change:
init/Kconfig:87: syntax error
init/Kconfig:87: invalid statement
init/Kconfig:88: invalid statement
init/Kconfig:89:warning: ignoring unsupported character '`'
init/Kconfig:89:warning: ignoring unsupported character '`'
init/Kconfig:89:warning: ignoring unsupported character '.'
init/Kconfig:89: unknown statement "This"

Is this bogus, or can rustc-bindgen-libclang-version return nothing
under some conditions where rust is not available?
Should this have 2 default lines like some other options in the file?

--9LQSzFz/Ck3gJsLT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMGKxwAKCRB4tDGHoIJi
0i95AQCss36HRy+RsBlpl62gIPI85+hygKJh0GXl428sU0nQ8AEA2u/2TAxBFT7L
YIW9Fn96HjUF3TjlXvi7128E1IzngQg=
=mZl4
-----END PGP SIGNATURE-----

--9LQSzFz/Ck3gJsLT--

