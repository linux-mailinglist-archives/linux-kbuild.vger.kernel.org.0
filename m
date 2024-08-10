Return-Path: <linux-kbuild+bounces-2932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E2D94DD1C
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 15:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7BB5B217BA
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 13:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CD41586D0;
	Sat, 10 Aug 2024 13:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="NGfMDt5j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch [185.70.40.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B218D158554
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Aug 2024 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723297469; cv=none; b=Ck2LMYMFM18PxdLIyzpdfEBWpd0qRQqBsHa6//j6fut713kUldPXdrXp0dJJZAXSR4unVu73QEvqGjAv63KOyde/3X3idBfEl3FwsTmwU8mLqQsJQpZ4PqMrO2A+gg7mu/IQt3h2sWCH2qsfTy4tztyu0CHjqc4rgyznVMK2M00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723297469; c=relaxed/simple;
	bh=qh1m6RcqelXzfAKZdRZLsq78s/42P6lE89sQ/4cmumQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHeUjCS1AP/ywVbdGwaeDESoXPSVIhDpF4kjvi/Zo5tvFeRtW6B6X8Hf3DPCUbWBUdajUT9cLUB2x/WsV1oR3zPsuaF/1oXvpfNtP5OE7hytR/qyO4wHfCE1hLuX7LltgKR3iBKBrGnJGoXzpVI1BB79b44IYfYImhmyGbMYccI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=NGfMDt5j; arc=none smtp.client-ip=185.70.40.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1723297460; x=1723556660;
	bh=sTHXt2cWE2fBKkY8Zgj4WTzgbvk4mbt/fAYkNXF/QiQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NGfMDt5j+GFxfdL4Z2YGtl4axtMSbqitXkIaX1l+J7eBLY5xwk3pkAXxJvcrOsojo
	 EXLAi3CFbU5BJ/SgGJ6zt+sckq1+ZUOcds8L9slVqdPfRQoz+wmETGwtR5mY/8JLem
	 f+bgB3Z8ih++GSecrAmHnuRBbbI4BdF78p3V7iFiffXV7TNNZDaiIIYuSJ3kyTFADV
	 yXzD+v++U5AI8xlfMT30qua0BTjDZJ8UK8KIjsVNfsbms48RgTs3sIA8qYRP4BElXz
	 hYR7efJ+44pq9Utq16l4b0R2IZtWKfVHi2/AxFgh+Xw1Ufw0MhxYEt9puXAdWFaVOp
	 jzcITwiIUJUEw==
Date: Sat, 10 Aug 2024 13:44:15 +0000
To: Miguel Ojeda <ojeda@kernel.org>
From: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH 2/6] kbuild: rust: make command for `RUSTC_VERSION_TEXT` closer to the `CC` one
Message-ID: <652ElsLaWV50vwbKOQc-kTFLeaf8wUGPKNhc8B8tS6EqgqzSj5k_tHgqCTUcxfSZkYvB1xC_N2pmNIA-oq2q9irSPp2XNaaiv67pZojm_9I=@protonmail.com>
In-Reply-To: <20240808221138.873750-3-ojeda@kernel.org>
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-3-ojeda@kernel.org>
Feedback-ID: 27884398:user:proton
X-Pm-Message-ID: ad53a1da5ba7130051722529175b5adb7028da5e
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, August 9th, 2024 at 00:11, Miguel Ojeda <ojeda@kernel.org> wrote=
:

> `CC_VERSION_TEXT` is defined as:
>=20
>     CC_VERSION_TEXT =3D $(subst $(pound),,$(shell LC_ALL=3DC $(CC) --vers=
ion 2>/dev/null | head -n 1))
>=20
> Make `RUSTC_VERSION_TEXT` closer to that, i.e. add `LC_ALL=3DC` and `|
> head -n 1` in case it matters in the future, and for consistency.

Cargo depends on the rustc version string not getting localized. Or to be p=
recise it depends on the version string being fixed for a given rustc versi=
on, which would not be the case if the value of LC_ALL could change the ver=
sion string. If the version string changes, cargo will rebuild everything f=
rom scratch. There is also not really anything to localize in the non-verbo=
se version string. I guess setting LC_ALL doesn't hurt either though.

>=20
> This reduces the difference in the next commit.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  init/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/init/Kconfig b/init/Kconfig
> index 47e2c3227b99..2f974f412374 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1926,7 +1926,7 @@ config RUST
>  config RUSTC_VERSION_TEXT
>  =09string
>  =09depends on RUST
> -=09default "$(shell,$(RUSTC) --version 2>/dev/null)"
> +=09default "$(shell,LC_ALL=3DC $(RUSTC) --version 2>/dev/null | head -n =
1)"
>=20
>  config BINDGEN_VERSION_TEXT
>  =09string
> --
> 2.46.0

