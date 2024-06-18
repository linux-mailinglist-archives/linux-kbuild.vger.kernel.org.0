Return-Path: <linux-kbuild+bounces-2174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9E90C7A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 12:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 709A9B25F71
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 10:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964091BD918;
	Tue, 18 Jun 2024 09:08:19 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1131615572F;
	Tue, 18 Jun 2024 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718701699; cv=none; b=q11OwvEzhGi5zBnefUDSCtC5SP+76vTh2wM/zpVbFiI8+BPB/BOfTlaM0cnKaY5RZZcS9Ds9TbgCT5JzNkqrQjejopyODe1Y8JFQ+0MLoCMPY6oTdQFLN7vmieMoAW2D2tiM4nHK2OxzfgD0Ng3drLK2IEviW3OLs/iWER9qcp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718701699; c=relaxed/simple;
	bh=DDDGLIPOP6EiTvFcaWmwtQeKDLHvT6mj4lEiqQkKzBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H962ynBvN3yoBi/ZjPjj3uo0jCewZmdnKfwPJaZxZK7G+jUhugyxFJ0Gl5/OYSXtLBA9qJcxoMEkD+WhiRk1lgS2SC9p0BbNMKk0KCmytKR/WqRFRpUQ/EzDskjLRwfpDiWWvbUDLg7tQx31d5ZAI7kuWr2/1TRsIuwUx4ub4UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de; spf=fail smtp.mailfrom=denx.de; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=denx.de
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 714621C00A4; Tue, 18 Jun 2024 11:08:15 +0200 (CEST)
Date: Tue, 18 Jun 2024 11:08:14 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 8/8] kbuild: fix short log for AS in
 link-vmlinux.sh
Message-ID: <ZnFOfuILtsfDsr2A@duo.ucw.cz>
References: <20240605120554.2968012-1-sashal@kernel.org>
 <20240605120554.2968012-8-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wZjAlOeZ8nJzzmG8"
Content-Disposition: inline
In-Reply-To: <20240605120554.2968012-8-sashal@kernel.org>


--wZjAlOeZ8nJzzmG8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi1

> From: Masahiro Yamada <masahiroy@kernel.org>
>=20
> [ Upstream commit 3430f65d6130ccbc86f0ff45642eeb9e2032a600 ]
>=20
> In convention, short logs print the output file, not the input file.
>=20
> Let's change the suffix for 'AS' since it assembles *.S into *.o.
>=20
> [Before]
>=20
>   LD      .tmp_vmlinux.kallsyms1
>   NM      .tmp_vmlinux.kallsyms1.syms
>   KSYMS   .tmp_vmlinux.kallsyms1.S
>   AS      .tmp_vmlinux.kallsyms1.S
>   LD      .tmp_vmlinux.kallsyms2
>   NM      .tmp_vmlinux.kallsyms2.syms
>   KSYMS   .tmp_vmlinux.kallsyms2.S
>   AS      .tmp_vmlinux.kallsyms2.S
>   LD      vmlinux
>=20
> [After]
>=20
>   LD      .tmp_vmlinux.kallsyms1
>   NM      .tmp_vmlinux.kallsyms1.syms
>   KSYMS   .tmp_vmlinux.kallsyms1.S
>   AS      .tmp_vmlinux.kallsyms1.o
>   LD      .tmp_vmlinux.kallsyms2
>   NM      .tmp_vmlinux.kallsyms2.syms
>   KSYMS   .tmp_vmlinux.kallsyms2.S
>   AS      .tmp_vmlinux.kallsyms2.o
>   LD      vmlinux

I don't believe this is "bad enough" bug for -stable.

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--wZjAlOeZ8nJzzmG8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZnFOfgAKCRAw5/Bqldv6
8j6YAJ9zoR0AG9jncaBX92zfkXPViArLIwCgrgaH0mZO3Du+J2sZO3lPWONVH2w=
=aHaw
-----END PGP SIGNATURE-----

--wZjAlOeZ8nJzzmG8--

