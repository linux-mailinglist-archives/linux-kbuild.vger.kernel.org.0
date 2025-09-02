Return-Path: <linux-kbuild+bounces-8693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57351B40AC0
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Sep 2025 18:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357D816E7B3
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Sep 2025 16:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6262FD1CB;
	Tue,  2 Sep 2025 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBh3Pmjc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F77826C384;
	Tue,  2 Sep 2025 16:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756830954; cv=none; b=YFn1ymJuJvzc8otYHTdBiZxBk4KrrWBfMa8cPqM45Yl1gi0NniORJFQj8W0abhFTNiGljGDgYs92nSxxsQ7NYCUXmGEciOjOVzgL7Ip1jI5NUKWhIKZciUqkis551CpoljC76XPuv5te9IilzRv0/2VGwLX/D23+O0M7F/rz7a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756830954; c=relaxed/simple;
	bh=4dMCQTY93FDdn7ueR8Z2tcJ3/CtiSsSmu2HzPGOu/Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBa9bnlWl7GguzsSLZW7929djLaS00vjpAjBkAmW40npqnkEE5CHxaWsUWyT+KVxu+pPYS6yVN9BuIIijhDvnIDH7QJIRvVbMiX85y29ZS/PuiSy9+xEE72mZR890rdGX1Mnjcrvi+nNU7oLo9GJqd5/S8rWc76KENhkfkFKsBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBh3Pmjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCAEC4CEED;
	Tue,  2 Sep 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756830953;
	bh=4dMCQTY93FDdn7ueR8Z2tcJ3/CtiSsSmu2HzPGOu/Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBh3PmjcZuIEgrrElADaHH9xJIJUAI1t9Bk6cyJMewu7XYbg9zA1CaeEmGz+qtipd
	 RNZlDjYi9KPC1zeQmwvRiKQ8lTfNaWlsrpU1KAMRZ4bkm1CNWp0GThlUm/fPJ8U/ef
	 BsSPjZ1RB9m39VEWZ4BLO9AY5iwrokcWvaXLikixJk/aFZQ5m862kOg7s1ObYyK6g6
	 EspIHiAp48J/5ZfpEPhy4pBonJx2/4kS1dkbMYn8Rpkrefk9HQgD9anbm/tEvFk3Kf
	 ToZn5hB0Td9dLq/xAf91vB6dxGJ6qZ1Lpo5HXftZQx7mW0G3lXFmW78zg2tCUW3ZU6
	 DNLjadeOIt0DQ==
Date: Tue, 2 Sep 2025 17:35:46 +0100
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
Message-ID: <20250902-gown-relapse-8fd3978c1ea0@spud>
References: <20250408220311.1033475-1-ojeda@kernel.org>
 <20250901-shrimp-define-9d99cc2a012a@spud>
 <aLaq6TpUtLkqHg_o@google.com>
 <20250902-crablike-bountiful-eb1c127f024a@spud>
 <CAH5fLggmXaa9JJ-yGdyH06Um8FopvYh97=rANLcoLc+60_HGqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4EeWks93mszFnPWF"
Content-Disposition: inline
In-Reply-To: <CAH5fLggmXaa9JJ-yGdyH06Um8FopvYh97=rANLcoLc+60_HGqA@mail.gmail.com>


--4EeWks93mszFnPWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > AFAICT. Then later on it'd become more like:
> >
> > config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
> >         def_bool y
> >         depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
> >         depends on RISCV || ((ARM64 || x86_64) && RUSTC_VERSION >=3D 10=
7900)
> >         depends on (ARM64 || x86_64) || (RISCV && RUSTC_VERSION >=3D 99=
9999)
> >         # With GCOV/KASAN we need this fix: https://github.com/rust-lan=
g/rust/pull/129373
> >         depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=
=3D 108200) || \
> >                 (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
> >
> > but that exact sort of mess is what becomes unwieldy fast since that
> > doesn't even cover 32-bit arm.
>=20
> I think a better way of writing it is like this:
>=20
> depends on ARCH1 || ARCH2 || ARCH3
> depends on !ARCH1 || RUSTC_VERSION >=3D 000000
> depends on !ARCH2 || RUSTC_VERSION >=3D 000000
> depends on !ARCH3 || RUSTC_VERSION >=3D 000000


Ye, that's a lot more manageable than what I came up with, shoulda
really done better since the option I used for a reference looks a lot
more like this than what I had... Thanks.

--4EeWks93mszFnPWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLcc3gAKCRB4tDGHoIJi
0jnKAP9LYjFVXcrh5zaOZUH0oAgMo/4x8LRtidC5WGVJnSFzRAEAwRmIFTqnghCO
5eXDhlTuIMYMEiqkRoSEu+mM/OF6PwQ=
=RGAX
-----END PGP SIGNATURE-----

--4EeWks93mszFnPWF--

