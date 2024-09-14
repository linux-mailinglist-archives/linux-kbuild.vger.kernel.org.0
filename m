Return-Path: <linux-kbuild+bounces-3554-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49F9793A1
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 00:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 579971C20E4B
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 22:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503E112C7FB;
	Sat, 14 Sep 2024 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQDKnls0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEA118E1F;
	Sat, 14 Sep 2024 22:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726352136; cv=none; b=bVUpZ1/suyCrdBuEUbN3PWkRx+Whki1dp7rLlMHldeVMI6Y4u3aR/tF3ORN5MXFoYDI8Nd83E7++L5Ug4YJ4zxG8J92gC58d+D8YK0WD1qms2obtd5p5vbwyfbBUVvn5vSm5VEEnec9tg6QKzbiFTowgm2Yp7axKZaeSP+hQids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726352136; c=relaxed/simple;
	bh=CbuOYtL+nJOrUCr5pQsOYq97OPNcveR8zM/nfsn08qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fglx5me35Ou0UAwqTM2jmDrmUflHfxRwIOwGXH9cqWZYRrKALnzJPjgF+UexX5g3rZNmxuPhhVVsx+q8MtDmle5usaWhtD7W6XSCMEzj7Y44v5LTV+EKMg5QvUg4K+yj9zww/mLTLXFivLnQ7cU/p/N8fyHaCy/zC4jRKZJvYFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQDKnls0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF7BC4CEC0;
	Sat, 14 Sep 2024 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726352135;
	bh=CbuOYtL+nJOrUCr5pQsOYq97OPNcveR8zM/nfsn08qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQDKnls003f8BK0pKf1mAStEZ9zE6wsWHaExX8l8zaWXnpDiBsz1jZs7ZttGkqDSa
	 XatEWwLlqGA1c6lCIgeKGcsUk99gpo63jaFqtbfURKCUTk7glOMU4PdvuguR/Rk5xd
	 008Op3BGEMvHes4BgTBis51CxqO/Q+Lse+BZ0FWM4mdsg0ftYw9+Z70Cm920dhA5Go
	 FQzfzQCtDH1SqvgamYPu9C/Bj8QTuM0ENOBpC+tTr3Pnd4b1Ky+JSApbXwzGyLnIRA
	 gIIWc3a9hlYpEhltsut6EeWj1jdEBP8nCX/uOAHZ6fRNW7M03nXKHVj95BYfODd31K
	 Wt0mM0JoWMGTA==
Date: Sat, 14 Sep 2024 23:15:27 +0100
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
Message-ID: <20240914-romp-clothing-965a16cb4dd4@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
 <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
 <20240913-shack-estate-b376a65921b1@spud>
 <20240914173037.422902b9.gary@garyguo.net>
 <20240914-jitters-barber-a0e51e7b83a8@spud>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aukCVL/k+hWQAKhq"
Content-Disposition: inline
In-Reply-To: <20240914-jitters-barber-a0e51e7b83a8@spud>


--aukCVL/k+hWQAKhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 05:46:14PM +0100, Conor Dooley wrote:
> On Sat, Sep 14, 2024 at 05:30:37PM +0100, Gary Guo wrote:
> > On Fri, 13 Sep 2024 22:17:56 +0100
> > Conor Dooley <conor@kernel.org> wrote:
>=20
> > > error[E0425]: cannot find function `__mutex_init` in crate `bindings`
> > > --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28 =20
> > > |
> > > 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
> > > |                              ^^^^^^^^^^^^ help: a function with a s=
imilar name exists: `__mutex_rt_init`
> > > |
> > > ::: /stuff/brsdk/work/linux/rust/bindings/bindings_generated.rs:12907=
:5
> > > |
> > > 12907 | /     pub fn __mutex_rt_init(
> > > 12908 | |         lock: *mut mutex,
> > > 12909 | |         name: *const core::ffi::c_char,
> > > 12910 | |         key: *mut lock_class_key,
> > > 12911 | |     );
> > > | |_____- similarly named function `__mutex_rt_init` defined here
> > >=20
> > > error: aborting due to 1 previous error
> > >=20
> >=20
> > Do you have PREEMPT_RT enabled?
>=20
> I do indeed.


Turned it off, only to find out my board farm is non-functional! Looks
fine in QEMU however :)


--aukCVL/k+hWQAKhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuYK/wAKCRB4tDGHoIJi
0l1DAQCyyTAltATXfFiGsTKm9k1tm3bo1zh+Ka4em8UHR49XWgD+IOU3xgen2R5l
RRhM8jVPdaxa/BqvxrBHgqH4wRX5xgg=
=Fb0t
-----END PGP SIGNATURE-----

--aukCVL/k+hWQAKhq--

