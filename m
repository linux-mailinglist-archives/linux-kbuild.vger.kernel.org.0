Return-Path: <linux-kbuild+bounces-2380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E68A927BCC
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 19:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC971C22F81
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 17:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8070B29428;
	Thu,  4 Jul 2024 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/IJ5KxP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECCC262A8;
	Thu,  4 Jul 2024 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113425; cv=none; b=pTILyUCvMxNVjeavcHGd7McGYEcK0lFyMrOCWHKkNqqDuhWYrofvy490sTmdqCjqYvFlj4hw8DEL95ds9WWm7DysQkYLfeeYS7v2uplUr7JlmU9vuyLwMB3HSwevHPU5MOjfOyMO+UrBmLc1YDJJotBZRXpGOuQFHZu2Q3eAqvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113425; c=relaxed/simple;
	bh=6KBZ6d3b2y4heC9NhfRu6FvZmJNP5IgVVL6D6CaLHHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlRJ8Zlf5CL6uEPhr88AwC4z58IlpRU2hCGKIVmAPdK+95vkopAddNhfUKViaZWtpf9SomPKOLLzaL9/1ZxuCHovaYLZgNmsmNQRN73zjXmnI5HQcM65j3Tn3Gdhhj6BMNjrXmzc1trFNpNQJrbyFuPJ9BflWDy46uNJ+T1xsOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/IJ5KxP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F33C3277B;
	Thu,  4 Jul 2024 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720113425;
	bh=6KBZ6d3b2y4heC9NhfRu6FvZmJNP5IgVVL6D6CaLHHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/IJ5KxPMbOiZFO8Yr3ndkeiBUqJM/u94mYyMeSZp3KhKpSf4jXJtz3sGcDCAzOxp
	 JCvfpuwAr6ywDGpeSMJxsTkqYzV0A7vxBgDjpqlK9n8qKT3bsG/bNIlQRfhIkrRUpJ
	 aAV9Vct6jstAVQR5uba29phm+3ylyzkhwuQPT2fQFksz1iaeA+nS3WHY9OYpMWVLK2
	 46XXkV7zHaECXBLFtS+6NOoclLfZvw8LqnoZP2uiYtp6B1VD06R1zhYVazDmYakJTK
	 XHLjJS7YQR2D8E0/EbjKVAdcYTSRK76TtyYxGDfmA5TSDcHzU4gaF30SONys7SenJN
	 wzzyNDgCrDu8g==
Date: Thu, 4 Jul 2024 18:16:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
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
Message-ID: <20240704-unless-cache-8a971c244348@spud>
References: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
 <20240704-shadow-call-stack-v3-2-d11c7a6ebe30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pilQx93eD8hL4hZr"
Content-Disposition: inline
In-Reply-To: <20240704-shadow-call-stack-v3-2-d11c7a6ebe30@google.com>


--pilQx93eD8hL4hZr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 03:07:58PM +0000, Alice Ryhl wrote:
> As of rustc 1.80.0, the Rust compiler supports the -Zfixed-x18 flag, so
> we can now use Rust with the shadow call stack sanitizer.
>=20
> On older versions of Rust, it is possible to use shadow call stack by
> passing -Ctarget-feature=3D+reserve-x18 instead of -Zfixed-x18. However,
> this flag emits a warning, so this patch does not add support for that.
>=20
> Currently, the compiler thinks that the aarch64-unknown-none target
> doesn't support -Zsanitizer=3Dshadow-call-stack, so the build will fail if
> you enable shadow call stack in non-dynamic mode. See [2] for the
> feature request to add this. Kconfig is not configured to reject this
> configuration because that leads to cyclic Kconfig rules.
>=20
> Link: https://github.com/rust-lang/rust/issues/121972 [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile            | 1 +
>  arch/Kconfig        | 2 +-
>  arch/arm64/Makefile | 3 +++
>  3 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index c11a10c8e710..4ae741601a1c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -945,6 +945,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
>  ifndef CONFIG_DYNAMIC_SCS
>  CC_FLAGS_SCS	:=3D -fsanitize=3Dshadow-call-stack
>  KBUILD_CFLAGS	+=3D $(CC_FLAGS_SCS)
> +KBUILD_RUSTFLAGS +=3D -Zsanitizer=3Dshadow-call-stack
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
>  	depends on DYNAMIC_FTRACE_WITH_ARGS || DYNAMIC_FTRACE_WITH_REGS || !FUN=
CTION_GRAPH_TRACER
> -	depends on !RUST
> +	depends on !RUST || RUSTC_VERSION >=3D 108000
>  	depends on MMU
>  	help
>  	  This option enables the compiler's Shadow Call Stack, which

For these security related options, like CFI_CLANG or RANDSTRUCT, I'm
inclined to say that RUST is actually what should grow the depends on.
That way it'll be RUST that gets silently disabled in configs when patch
1 gets backported (where it is mostly useless anyway) rather than SCS
nor will it disable SCS when someone enables RUST in their config,
instead it'd be a conscious choice.

Cheers,
Conor.

--pilQx93eD8hL4hZr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobZCQAKCRB4tDGHoIJi
0op3AQDGn+hWppfWYDd7g/Ck3at4aD+SwbMd/jUQuQ9pL+qLpgD+MahETrfZpXoA
f/6oMzXX33g7xHjyqSsL73pnqhMoBQU=
=7i1H
-----END PGP SIGNATURE-----

--pilQx93eD8hL4hZr--

