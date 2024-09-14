Return-Path: <linux-kbuild+bounces-3553-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7096A97922C
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 18:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A39591C21579
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 16:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1971CF7CF;
	Sat, 14 Sep 2024 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ES4QW2+U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8005126AFF;
	Sat, 14 Sep 2024 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726332382; cv=none; b=fCx11QJsYEPItn0+t+LPXdw1sbzhPmMQfCvN16Pc7XfbD9XRC1T+0KEa3nqs69jSQ0okRYmSW6PvRqFYNV5+BuocMLVcdLsygNyHRFI0cIViST5V/NCUG0WrzvRlpYGk41EsSZ95Jg22UhUmw9MpZ2MaMqfvWwa2CF8Y3PE9W3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726332382; c=relaxed/simple;
	bh=Z9KLHDysHT+QZFA9N2DhaeAfpGSFeSGzTbu4CvQ+R/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW1kLakv8dP6XoMS9R2jPEdC+lfDTuOrTKg6vUTWnL7klmDTo++lUXMjxjflfC133RmoNc9/4Gxd6Zb9ZS/Z7mqbHpIRHfDQBjn2Gmrc9eg52nIZ8rt72lPv3eevkVGzAlF1Ky9PJy1HTaU2I+Uaus2qLgOmHFKlK+cp10ih7MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ES4QW2+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28943C4CEC0;
	Sat, 14 Sep 2024 16:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726332382;
	bh=Z9KLHDysHT+QZFA9N2DhaeAfpGSFeSGzTbu4CvQ+R/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ES4QW2+Uwsj+XxM5lsWtejDsyOt9ZxevTIIBqFbZx8Ekjs8gGHWSIh3a8CpIVW9HY
	 qNvzSPQulxAR2lc1Zc3mYbp1WxeuanQ/YnOtjtE4tbV7Dk3hpC2ZFMR9Ui/ZcXnJMd
	 joB8iOzpysPGpZoTeUIclgN/bkqEURdblOs3dA5z94M8KJohCAXAWf6e3+fv3tH/aS
	 w/hAMRF8JFDk28dxJwTeM70QvXD9PExnCQFxaf7pkYJ1pQtHWRvd23OFe9056W6CiY
	 9mOw0QVp9E0wRJnUMOiLwN8YTMDpTOuEy4jt3c/ZVaBHUvCUoEMFlZojKSaVomwxHJ
	 bBo2jcypLgsUQ==
Date: Sat, 14 Sep 2024 17:46:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
Message-ID: <20240914-jitters-barber-a0e51e7b83a8@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud>
 <20240914173037.422902b9.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B4QM7QVF324ySoAc"
Content-Disposition: inline
In-Reply-To: <20240914173037.422902b9.gary@garyguo.net>


--B4QM7QVF324ySoAc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 05:30:37PM +0100, Gary Guo wrote:
> On Fri, 13 Sep 2024 22:17:56 +0100
> Conor Dooley <conor@kernel.org> wrote:

> > error[E0425]: cannot find function `__mutex_init` in crate `bindings`
> > --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28 =20
> > |
> > 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
> > |                              ^^^^^^^^^^^^ help: a function with a sim=
ilar name exists: `__mutex_rt_init`
> > |
> > ::: /stuff/brsdk/work/linux/rust/bindings/bindings_generated.rs:12907:5
> > |
> > 12907 | /     pub fn __mutex_rt_init(
> > 12908 | |         lock: *mut mutex,
> > 12909 | |         name: *const core::ffi::c_char,
> > 12910 | |         key: *mut lock_class_key,
> > 12911 | |     );
> > | |_____- similarly named function `__mutex_rt_init` defined here
> >=20
> > error: aborting due to 1 previous error
> >=20
>=20
> Do you have PREEMPT_RT enabled?

I do indeed.


--B4QM7QVF324ySoAc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuW91QAKCRB4tDGHoIJi
0g1AAP4jVE5sTjh7ZpAYSXX8cAez9VIN9z196SmWTQQotiAMIQEAglBSa7/hmf+1
k1drziNQUGk/j2h9jhXIhrEAGrRagwI=
=6Xln
-----END PGP SIGNATURE-----

--B4QM7QVF324ySoAc--

