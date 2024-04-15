Return-Path: <linux-kbuild+bounces-1565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C76188A548D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 16:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67CC81F20CAA
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 14:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2B685260;
	Mon, 15 Apr 2024 14:35:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4825F84D30
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Apr 2024 14:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713191705; cv=none; b=DxHsC03o+BZUzGvgk5gt/xPx3C91WjVIqC9RndvuvwuIOPvBKxv99rF2+YgN1sM0ZHPZeRKAdU708QUkQE5i1pkg6+ASBx5YbWZUV5gCtbZ1YwTAXXuyYL5XyzxFuN3IyKrwEow7IAXL2b5kTVfJL+17ouKKoojd8KjtjX0Oeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713191705; c=relaxed/simple;
	bh=BHTUrnQani3RmIacngf5ncMhkchnk/Pc3hAKX542Xd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckFz6BpzNMHDqVRZWdZ+hKuqqM9C+A4DUld/TWdXc82vH9KT1Tp5TsHxqtETlxpgaKEvE6wuIw+YnuZFhqHnotYTae0rnl7fz1hz15aekIcR4l9W/em/fsqfStM1AjGxgO3JGjPHwegD4jwaOQ4C8uBGx9XmQsUOlAKdrkF6A70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rwNQ6-0005Mx-91; Mon, 15 Apr 2024 16:34:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rwNQ5-00CRSL-Sa; Mon, 15 Apr 2024 16:34:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rwNQ5-001gDX-2a;
	Mon, 15 Apr 2024 16:34:53 +0200
Date: Mon, 15 Apr 2024 16:34:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kbuild@vger.kernel.org, kernel@pengutronix.de, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: amimouse - Mark driver struct with __refdata to
 prevent section mismatch
Message-ID: <ln446wvlcruoglseztao7jwywzxiixyxnx3qxqnm7nmdan6bzt@klbghdi3wwir>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbu3mgd7jdx763c2"
Content-Disposition: inline
In-Reply-To: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org


--zbu3mgd7jdx763c2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Mar 29, 2024 at 10:54:38PM +0100, Uwe Kleine-K=F6nig wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent the following section mismatch warning
>=20
> 	WARNING: modpost: drivers/input/mouse/amimouse: section mismatch in refe=
rence: amimouse_driver+0x8 (section: .data) -> amimouse_remove (section: .e=
xit.text)
>=20
> that triggers on an allmodconfig W=3D1 build.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I'd like to enable these warnings even for W=3D0 builds, so it would be
great to get it into the main line soon.

If you apply it, please notice that I fat-fingered the parameters to git
send-email and it was sent in a thread. So (assuming you're using b4)
you'd need:

	b4 am -P _ -v1 2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.k=
leine-koenig@pengutronix.de

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zbu3mgd7jdx763c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYdOwwACgkQj4D7WH0S
/k6RCQf/QgXoedmAW7uGY+b/iuS96b/xEsfbqrpApHnmRH8MStb7LJXuZVcoCzV3
jilQ/jEeeBsVy1xcprMnigJCNYvQijRAPr1h1sHg6OtS0tC8UI7W60j96eAZJx/I
Vf+61Nfe4U/65aSX4rUSGWDIo5qyKVCIRpHNdv5dPWv1BiOtd2cwnvgRZigdThdH
9PoOp3WWDi1ziF+mCF3922e09vag9d0Gil5IzxlaJNEDxPLaVxe6TkYtRDMA9+uS
A88Zw7J2k0lq2wkhfrkEGzce6PsmBT5i9KAlYJX3QSC2sDnI9ONLdlcFzOU+s14C
2DKbnZV0Y5/CvGoJ4AlHAIuaOR3Yzw==
=xNOK
-----END PGP SIGNATURE-----

--zbu3mgd7jdx763c2--

