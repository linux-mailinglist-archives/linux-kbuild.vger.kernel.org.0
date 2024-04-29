Return-Path: <linux-kbuild+bounces-1713-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A958B6395
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2024 22:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4914D1C221BB
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2024 20:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FB71419A2;
	Mon, 29 Apr 2024 20:29:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C87F1419B5
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Apr 2024 20:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714422585; cv=none; b=IXxr0vCDrxEgvHd/mYduIdV7yi2lurpdChFyiGs7iH/VFb66Aw/NvtLWFf3x1nIHcsZWPSdPh4riH+Vvley4PQG0w/d0VIbI1gKomKjint3uRv1N3phpXp++v59Eu56+QME60lzKK6nhCdFfBgfYeHPcwavxRyXhIwfaX2x9G+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714422585; c=relaxed/simple;
	bh=duOjByc8yIadUnTUFj4s3XDa68q3SsYJiP0qL2bpV4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyN+rL7coHlcLTwnriPaLqXrzTXmzaVT+JGEP4UjljQqRNXqGhr3DlsITDV9CxER11sG5BZ9QPS3h3jCWTDl2W/lAjy7ptodmA8VPyAYl4fteb8PFTwoFvt0dDrqaww0rN+YaucrsOJ7ykSUqA8nWG/5PoR58a4Iawi+hLzxXYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1Xd7-0001Wm-RC; Mon, 29 Apr 2024 22:29:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1Xd7-00F2hk-EG; Mon, 29 Apr 2024 22:29:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1Xd7-00BjBf-1A;
	Mon, 29 Apr 2024 22:29:41 +0200
Date: Mon, 29 Apr 2024 22:29:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, kernel@pengutronix.de, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Input: amimouse - Mark driver struct with __refdata to
 prevent section mismatch
Message-ID: <pkglwlztl5nj37j4i2ydh4y3ohfx6pt2dilzha5lng5aoaggid@ec2iszqt5nzj>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
 <ln446wvlcruoglseztao7jwywzxiixyxnx3qxqnm7nmdan6bzt@klbghdi3wwir>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnkta3uwbswxhja3"
Content-Disposition: inline
In-Reply-To: <ln446wvlcruoglseztao7jwywzxiixyxnx3qxqnm7nmdan6bzt@klbghdi3wwir>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org


--rnkta3uwbswxhja3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Mon, Apr 15, 2024 at 04:34:53PM +0200, Uwe Kleine-K=F6nig wrote:
> On Fri, Mar 29, 2024 at 10:54:38PM +0100, Uwe Kleine-K=F6nig wrote:
> > As described in the added code comment, a reference to .exit.text is ok
> > for drivers registered via module_platform_driver_probe(). Make this
> > explicit to prevent the following section mismatch warning
> >=20
> > 	WARNING: modpost: drivers/input/mouse/amimouse: section mismatch in re=
ference: amimouse_driver+0x8 (section: .data) -> amimouse_remove (section: =
=2Eexit.text)
> >=20
> > that triggers on an allmodconfig W=3D1 build.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I'd like to enable these warnings even for W=3D0 builds, so it would be
> great to get it into the main line soon.
>=20
> If you apply it, please notice that I fat-fingered the parameters to git
> send-email and it was sent in a thread. So (assuming you're using b4)
> you'd need:
>=20
> 	b4 am -P _ -v1 2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u=
=2Ekleine-koenig@pengutronix.de

Do you have this patch still on your radar? I guess it's to late to get
it into v6.9 now, but do you plan to apply it for v6.10-rc1?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rnkta3uwbswxhja3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYwAzQACgkQj4D7WH0S
/k5uVgf/TsvaHVZR9h5+inhjnjAz6/GCpmHNzK7x8Ypvb0A6p1kWLQTh6S0GoKV2
RU4JpgD0eQveWyyf7rimVtD9a1dZQRI4ztVcZeR3jTt3sJrCamgyI8HyYS1nI/7O
n5POjbu9FNLjN9jtrCjhKCmd+8ulI/HKis6wMubtwghs3nuYYv1IVjnErLV65kW+
v58RhGWwNkuNzLs8LbrT8TfoQMPY7L7vwGbZGBZOMBCi/nAGhjg5s6w78wV/UwHx
E8GrIpbyQwklliwjSDEqNoVasE2y2ZE7O5eMlK/GX1kcpVg2XVHkzSMUVyzBBlmB
4PKX5NqGlXZmHHMxRjFEXqJxElrQ5A==
=asuz
-----END PGP SIGNATURE-----

--rnkta3uwbswxhja3--

