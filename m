Return-Path: <linux-kbuild+bounces-3548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6FF978ADB
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 23:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3AF61F22533
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 21:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8AD14AD19;
	Fri, 13 Sep 2024 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTQMeOYC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54A6BFD4;
	Fri, 13 Sep 2024 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264081; cv=none; b=pi403VL3VWk3ZaumWExsSza0TXHitfYAE+dNYUXq6BmYPpIHgAvP9UW8qNdXV0ddCkWwR1lkyMGLtNfxnFBVAIkvMuVlxHEVA8WGnPM/mSI/Bj6WMzlcs9H+W+uBXkNUXunPXZt3JBvAxc+ZlAFn6Avdpr2CNXPFkhyoEByI7Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264081; c=relaxed/simple;
	bh=DcEJaz7/MqaLtQJcgIq177t7RurKuxBUY+gSzhJcMig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDHhQgqmGUl05+czakUSLZAeV88xl/dyEKXpwXM0fxg8JuNfFIY+S7Tt/yMWt9ve59+L+iY0lIpWCr2VX0ihv9F5RNNIqv001H+QrJALPwh/wZvdp1CQAtkAAh3yijtcZiUuDPuIxzhtLlbJbbIc1Io9dJN14UJBh+4vHYyKP7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTQMeOYC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E68C4CEC0;
	Fri, 13 Sep 2024 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726264080;
	bh=DcEJaz7/MqaLtQJcgIq177t7RurKuxBUY+gSzhJcMig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTQMeOYC7hBejIAS7xCTTvIgO3RtoNfJVnYcFiygoUYS4781paKqk1giyRo52IzcY
	 NrCZUMR0EMKFi6zxCtzZ3Y8TJc110tLnYejZCD29xytiVQ5C+o6EewjV7Gx7Vn9HOz
	 NxcsQFXTPlHZ86HNvVqv+TOI1pWOA9sLdW9O9PqIQEP8wULk+bqDlMMs1MrzGrWluL
	 9wuvqRfdw6gm8lvELOBI4LzoLesWSeNeDGpDGGMr7PubfEqeAlIFLFZfd5NQyVwidn
	 vyeytts8flGijB0Ssd3eevN/tvw5lroKtQWREMP38m7ZKBGqoIyTRd4Im97pSOd6Pl
	 hEkpwaYae4kvg==
Date: Fri, 13 Sep 2024 22:47:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
Message-ID: <20240913-pastime-unsheathe-1c7d9161bbea@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud>
 <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XmBt+U4mG1ij8T4e"
Content-Disposition: inline
In-Reply-To: <CAH5fLggX=Uw8T6EqyonJyOkjOVM7ELy4hK8NV80suvDEBnq_Lg@mail.gmail.com>


--XmBt+U4mG1ij8T4e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:44:26PM +0200, Alice Ryhl wrote:
> On Fri, Sep 13, 2024 at 11:18=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Fri, Sep 13, 2024 at 12:08:20AM +0200, Miguel Ojeda wrote:
> > > On Thu, Aug 29, 2024 at 10:23=E2=80=AFAM Alice Ryhl <aliceryhl@google=
=2Ecom> wrote:
> > > >
> > > > Add all of the flags that are needed to support the shadow call sta=
ck
> > > > (SCS) sanitizer with Rust, and updates Kconfig to allow only
> > > > configurations that work.
> > >
> > > Applied to `rust-next` -- thanks everyone!
> > >
> > > Paul/Palmer/Albert/RISC-V: I think you were not Cc'd (at least in this
> > > version?), so please shout if you have a problem with this.

> > error[E0425]: cannot find function `__mutex_init` in crate `bindings`
> > --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28
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
> >
> > error: aborting due to 1 previous error
>=20
> This looks like an unrelated problem to me. This patch only changes
> the rustc flags, but these errors have to do with the Rust
> helpers/bindings, which get generated before the rustc flags are used
> at all. Most likely, there is a problem under the particular
> configuration you are using. Were you able to reproduce these errors
> without this patch?

Oh I'm not blaming you for it, don't worry. I didn't think it would be
related, but it did stop me from being trivially able to check whether
there was any problems with the applied patch. I'll give it another go
tomorrow, with all of the other rust code stripped out and just this
patch applied.

--XmBt+U4mG1ij8T4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuSzCAAKCRB4tDGHoIJi
0issAP9GjxTOIzL/cqkl1wZ2tWAlpPVRF5uvk4HLHAQG6GT4QgD5AcVnWQaXw4+H
qjvlVjN40TlXvEnLWp+lmPZDXlHyLg8=
=Kpsx
-----END PGP SIGNATURE-----

--XmBt+U4mG1ij8T4e--

