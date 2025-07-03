Return-Path: <linux-kbuild+bounces-7855-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE3AF7600
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 15:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D49984A37D4
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 13:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618A92E3398;
	Thu,  3 Jul 2025 13:45:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D502E7172;
	Thu,  3 Jul 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550306; cv=none; b=oPG0/UCAZ52PJBjbO8OLnfnLwQUvZYLo8YG1L8aqkpuPa/7gqCcQG6Dc/J8wXidjVKUIORJKZ2kJy+nRBE6CqrcVxmrWK/C9+0gtIZ3+lJaQT33x7bo44jL6NuuwzQEmydn1lFAfi24JKyO1rs5XKJsMBQ8jJI8VsGZjk7u4dcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550306; c=relaxed/simple;
	bh=jgRBUcYjsxcR6/WPVCigDDX1NPx00cIMSX/HK0xE4Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeGWWIHwTdRdHZbfSddLFrw/ZFGJsOcjwz+CMAk3DgW5wHvTJgaANLOPmEMd3glgSatlKJdi7Sh9IbLugHrsVo+m/ScCyNC4ZrHyQ0Ctf6RT4JMzhqR7pPzAkKD00dtbBMigW3SS8KIl6bLnv3W89oJq4ZtMgvIAHH8+GpoImEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.53.4)
	(envelope-from <n.schier@avm.de>)
	id 686687ab-037b-7f0000032729-7f0000018290-1
	for <multiple-recipients>; Thu, 03 Jul 2025 15:37:47 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu,  3 Jul 2025 15:37:47 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 0B39D80725;
	Thu,  3 Jul 2025 15:37:48 +0200 (CEST)
Received: from l-nschier-aarch64.ads.avm.de (unknown [IPv6:fde4:4c1b:acd5:6472::1])
	by buildd.core.avm.de (Postfix) with ESMTPS id 943FC189EB3;
	Thu,  3 Jul 2025 15:37:47 +0200 (CEST)
Date: Thu, 3 Jul 2025 15:37:38 +0200
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Building Debian from source spit out some warnings...please shed
 some light
Message-ID: <20250703-quick-celadon-horse-afb4de@l-nschier-aarch64>
References: <aF8f_3xbnXy4Vibi@debian>
 <20250703-offbeat-hound-of-tenacity-ceb047@l-nschier-aarch64>
 <aGZ3QH3hbpQVjUup@debian>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5UCpY6LUHqxL5aTa"
Content-Disposition: inline
In-Reply-To: <aGZ3QH3hbpQVjUup@debian>
Organization: AVM GmbH
X-purgate-ID: 149429::1751549867-88FA7EE7-E28F7686/0/0
X-purgate-type: clean
X-purgate-size: 2538
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean


--5UCpY6LUHqxL5aTa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03, 2025 at 05:57:44PM +0530, Bhaskar Chowdhury wrote:
> On 12:53 Thu 03 Jul 2025, Nicolas Schier wrote:
> > On Sat, Jun 28, 2025 at 04:19:35AM +0530, Bhaskar Chowdhury wrote:
> > >=20
> > > Alright, I was doing customary kernel building via upstream source an=
d come
> > > across these warnings .....
> > >=20
> > > dpkg-genbuildinfo --build=3Dfull -O../linux-upstream_6.15.4-00002-g48=
44502d6635-1_amd64.buildinfo
> > >  dpkg-genchanges --build=3Dfull -O../linux-upstream_6.15.4-00002-g484=
4502d6635-1_amd64.changes
> > > using Dpkg::Control::Fields::field_transfer_single() with an an impli=
cit field argument is deprecated at /usr/bin/dpkg-genchanges line 245.
> > > using Dpkg::Control::Fields::field_transfer_single() with an an impli=
cit field argument is deprecated at /usr/bin/dpkg-genchanges line 245.
> > [...]
[...]

> > Which version of dpkg-dev do you have installed on your system?
>=20
> FYI
>=20
> bhaskar_17:55:19_Thu Jul 03: :~>dpkg-query --status dpkg-dev
> Package: dpkg-dev
> Status: install ok installed
> Priority: optional
> Section: utils
> Installed-Size: 1728
> Maintainer: Dpkg Developers <debian-dpkg@lists.debian.org>
> Architecture: all
> Multi-Arch: foreign
> Source: dpkg
> Version: 1.21.22

hm.  My bookworm chroot has dpkg-dev=3D1.22.5~bpo12+1, but even if I=20
downgrade to 1.21.22 I cannot see the messages you reported.

Kind regards,
Nicolas

--5UCpY6LUHqxL5aTa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmhmh5sACgkQiMa8nIia
bbhvaQ/9E00GM/KWqG5fYBWYQF2AhOzebuLH8qJok8ORFmk8RjEZGsUuk+0FLSdP
O6AstdZaUw05WCGStxOjPAuOuiYSf2qAGMeMK+vDFTMMh7KjH+GWbXJvDoCV3QV1
DwnE4U/ZfPEaycT8AH5HltHTEcwMt/Ac8qluXQ4XpqysPhtCEEuds+xSgbNlqbg3
MCB9dnJF/IFZDaKLnx62pE/3nmWqP/R1w+ydW7BVVYOrULdKGWB66RCQZ++8qYMR
5fxkWU3nACyQOJDqX2pDPHnG+T4v/owUpBpvchFUHs+J/10XmtHH4vtT50iDn2Ps
MKvUvUx9zGJGTpaPZh2nVjrTr9bAID4XHM+xTo6MiPBqUG9vd9oV2+921StWTOz2
8zFZx1yTbSb0DiLQn5tp/mHdm6x3ywBmJnffJlYsrgxHRHAYx12sW156wV8HMSEn
gxIsVeZFovsNZmqKByGqbByx7dJfMxu/JoT7oQDK6Wdid5dxqB2xHiwe8nUAkdSz
aK4prYEMsK03AMCtMfhuklG5ma4X4QIogN44mGXy0UVkVKlve49Sm9QpK0HUa1Wh
IIuVlEgvYGov44mzHdb7eRFPaYwTU8mAnVEG03h9Ef83IDkD9hzQn6IYsa6xguEG
hOFZgCOc6vm+x6rVsrDp4min8KMhYRSQn2VhN0LypAmWqtj94i4=
=OqTi
-----END PGP SIGNATURE-----

--5UCpY6LUHqxL5aTa--

