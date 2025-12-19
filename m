Return-Path: <linux-kbuild+bounces-10204-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB84CCF303
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 10:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A752300DA7A
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 09:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25594269811;
	Fri, 19 Dec 2025 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X9nqywsp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A1D18D658;
	Fri, 19 Dec 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766137475; cv=none; b=AlbGOZNBL0gF8pDqos45GVVOgAzlAHj/JraJWFBLDJ/TLlVxsb1Kr6Gx6ZUAfZvaWi9i3Vi1y1bTq1dOmNmE3QdWwyxvNKasnfHwPDx8hGSpNvs2MxPynbjQNhJOU7seGcOfnOuwwF1rTFpoyRpAJxkeIVCZ4OJa32Bz4urcHiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766137475; c=relaxed/simple;
	bh=q7IPgu5tja6+HtHQKlymmCBdtGbC45E+/uyjfQWCj6k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WebDzglhLIn/SXTeOn6KqHVKGTqlulLcTSM/yaInRAEnIBLXiDIi4Ef43gfE2sraKAarNwMlSSzaIa61mP/k9sArqgAjCi7VP7KrEjpr2mttr142nq1PZsPl0AK/w5TRQqPEth3L7x+QOULi1/4H7frOsrxu6IOgeFd8P1zYU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X9nqywsp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766137460;
	bh=XHWIllkwA/bV/L6nyjgD79iEfUYp5i9cJYFO7uVIkpo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X9nqywspiWgvSG5CvVlxdSW7UHWnlhkIrnur0nXKg4/Fr2RkzPxQXXl3rrcBGfAwj
	 qpY6ubRVtW1Pm9qFC9XlRIK5FoHbWAgN2A97me2Mc+wrFJuiLYejR2lMM4JwoIutWb
	 Tfb8tdMZlJegJIQGw3cHXT3h+DG5Re+5bD1pXvvPXCIfoXGp8OvMBB78EjgpTEzHKb
	 YUizXR3+TZHXtvFjZPG6tKiohQLiQdravtPX7J38qq2qEY6qsB5LTqdAevEncr5Rv5
	 KjgklBpOt5EvdER7fSP/kU7IY3COWHS2Xk7GZzA/DBZMxhzCZcdK0CGWrEMT9bKtFJ
	 sgbdjxED9rBDg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dXjKw5XH2z4wC8;
	Fri, 19 Dec 2025 20:44:20 +1100 (AEDT)
Date: Fri, 19 Dec 2025 20:44:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan
 Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: Updating Kbuild tree and contacts
Message-ID: <20251219204419.65babe76@canb.auug.org.au>
In-Reply-To: <aURzg3BliUOYxnhI@levanger>
References: <aURzg3BliUOYxnhI@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/djpFH/4g9_HQXpYYjCXKofV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/djpFH/4g9_HQXpYYjCXKofV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Thu, 18 Dec 2025 22:34:59 +0100 Nicolas Schier <nsc@kernel.org> wrote:
>
> Nathan and I have to reorganize the kbuild branches a bit.  Can you
> please update the branches for the kbuild tree
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
>   (unchanged)
>=20
> for linux-next to
>=20
>   kbuild-for-next        and
>   kbuild-fixes-for-next

I have updated them.

--=20
Cheers,
Stephen Rothwell

--Sig_/djpFH/4g9_HQXpYYjCXKofV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlFHnMACgkQAVBC80lX
0GytoAf/aHQjftYhpa2+C3Oe1Dy3LSlypV95kHW8bDuJIbBsGaqyk5T7/yW6jGLo
uEnMXYJ1D9hdcnU1w9XoGqxA8SxFUN015uD3SX59fg4BvkX/iWBoibsxVRHnR6s4
+NpdERRPrXUxeASwoKy95tjiskG+3UZfSjhg9lBRRF9JvI2wXi9EoR18x9MZMIFk
AZ3n+xs4n1e/9B/5KENAK3BQCe3YyNZeNBsc8cpwA/dt0os5QRFfCiEfD159RVzH
dtZ3Yb6oSp7ZcvKgBkog6PCionlLN6ftTJYwi7ciXC6GvSLuiRQ7QOxg7NnHLhnc
omCk/AO07o00ZMLuXshy+X8J1N1+wA==
=MqsE
-----END PGP SIGNATURE-----

--Sig_/djpFH/4g9_HQXpYYjCXKofV--

