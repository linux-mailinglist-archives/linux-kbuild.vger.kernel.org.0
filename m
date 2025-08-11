Return-Path: <linux-kbuild+bounces-8348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D58B21876
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 00:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E04D7461D4A
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 22:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A2D223DF5;
	Mon, 11 Aug 2025 22:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XYZI9dyj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6921C19D;
	Mon, 11 Aug 2025 22:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754951648; cv=none; b=od72bKaAYzDe22M7/ZBMKr/pwkirGkL3KvbD0Vf9TPMHXBJJsDtVOHVtxT2cmiXeHQSBxMY+pbYW7IY98chtKyAD7jd6k2b/1peIS294GQSUFou2VgvtbTfWw1t75WHHhmBpVtygcjVB2oXuCyl4icQrMNMWQYaKSXd86zu0CNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754951648; c=relaxed/simple;
	bh=mkiyXdF2n1cF1Jn2rMuBCcE5PZTE98Wg0dFNXa956wY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjoN+fGubYKbpuSbpTH2lbZF7WuPHMr+A63HYbj0DkmNy4eaOkNYiwDklMzWJc++SOo31tNIwj/T3BxhHhf6RvKDssyi/Tsex5zEiaoaerPYMVZGPseGgjkunXjIZi0GvfW9wXEegC0M7quAWPS04lx9GZ/3ryXDBtRDjSlXmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XYZI9dyj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754951643;
	bh=Iq48dsdcKsW+mJEn/1rcHJexVmJNAGD2zZfJ0SOoOX8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XYZI9dyjodmyNsbl/vvDimQhB+4AWtUJxhNvfaD6MklKUvYXjXnarqaaMaUrLLIv1
	 m/LxxRqBPQqstxDYfC/RNefmt3i2gkMVmB1bgENZaUm+eF/X7ZXuCJlocwvzlEtXnn
	 EUOOgZNk/xJ6krn4JL1ssTdq4JfvZj8bidK4PhKI7UOg8JUkRzCoBWrPoMU5afqPeh
	 +U9T8sfaD/06OEkKfy0wXtr1hP/BZ4SwSlUAW47Ni9JKlq31IfP6h9S8PZHSLaY1U1
	 QtgvwVgxDIBvBOkBzON4TOVnq/5Hmc4vOHUaWRCzOxkNDFI4Wpzsd+kojNjKJbpaix
	 xcMpQA8MkpvRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c18Z30Pqqz4xdg;
	Tue, 12 Aug 2025 08:34:03 +1000 (AEST)
Date: Tue, 12 Aug 2025 08:34:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Schier
 <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org
Subject: Re: Updating Kbuild tree and contacts
Message-ID: <20250812083402.2a985821@canb.auug.org.au>
In-Reply-To: <20250811184849.GA1266@ax162>
References: <20250811184849.GA1266@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZMRtbcM6y+NEXjvp3P9=.T8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZMRtbcM6y+NEXjvp3P9=.T8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Mon, 11 Aug 2025 11:48:49 -0700 Nathan Chancellor <nathan@kernel.org> wr=
ote:
>
> Nicolas and I have taken over Kbuild maintenace from Masahiro as of
> commit 8d6841d5cb20 ("MAINTAINERS: hand over Kbuild maintenance"). Could
> you please update your contacts for the Kbuild tree to both of us and
> the Kbuild tree to
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
>=20
> and start pulling kbuild-fixes and kbuild-next in at their respective
> places within the -next update cycle? Please let me know if there are
> any issues or questions.

Done.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/ZMRtbcM6y+NEXjvp3P9=.T8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiab9oACgkQAVBC80lX
0Gw6UAf+PK5X+uR3Sv/MPXeoWhHHsljTDBmeFKcuRhxLkM3kOqXH8ttGIqy/fWmK
TlRXjYlt89FCQ0+wPPjaoNswqx5v0hJm3OlFeQEnFol6Fu2k5VBdfrqDFyNM/+Cp
9PG72HPYASZdtppn0aaHRVM7Y+Rq0u69vdVJ0Lxp5OptZAKoSvuej6zQq3UgACW2
qvOA72rpwYYTsg28x1k6sb+JutxsJd3fWk68/K6N1gy6Fa+0rbGRhChe4YtkBo6z
BVKvuuBQMOiL745oBXFxAEIX2bzP63XGHe7g9pWZVErsy+2byB8FXqKjLbudna7K
4y32rqY/kjcbUQ/G8tlNzfFTLE5mjw==
=/fdb
-----END PGP SIGNATURE-----

--Sig_/ZMRtbcM6y+NEXjvp3P9=.T8--

