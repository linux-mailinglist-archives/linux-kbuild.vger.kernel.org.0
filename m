Return-Path: <linux-kbuild+bounces-1715-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC128B63B6
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2024 22:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B67728410B
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2024 20:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05AA171E45;
	Mon, 29 Apr 2024 20:32:29 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD6171E49
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Apr 2024 20:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714422749; cv=none; b=Y06RHI1HrfNJmsyhHIZ2qXLNMV2GqcHRoTYfJ/H6u88wAoI6iYAnh2q1bAD0QkuRcSejIR2MEIji5XJl9WBwSixz/su/CrORt9VMBzdrjbzJ8Q+vs8MswbRVxv5daCduxSESHopVTjUjtj7celhdlUDxdGVbnEzdmed8dNR+EYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714422749; c=relaxed/simple;
	bh=WbKokxwcqvS7ui7yklys9w2AOjpFxCzl2KlsPCbNMOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fI84D3kNSFww5kmotajvcaaHMiP4U3xXvtLeNwIW5+C6CoKYq7FJaD77CuwX3K2RMdBUUabkrgqQMYEwazQoYyccK8u1l8x9iow5QNHELlQwCnRyu+hPGbQtKbokAGEskUCOx7456Z6WI+hTlWpEALeusn1br71ncRmjCOdYMe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1Xfe-0002LD-Le; Mon, 29 Apr 2024 22:32:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1Xfd-00F2iD-FA; Mon, 29 Apr 2024 22:32:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1Xfd-00BjEY-1F;
	Mon, 29 Apr 2024 22:32:17 +0200
Date: Mon, 29 Apr 2024 22:32:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tom Lendacky <thomas.lendacky@amd.com>, 
	Dan Williams <dan.j.williams@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: kernel@pengutronix.de, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] virt: sev-guest: Mark driver struct with __refdata to
 prevent section mismatch
Message-ID: <ksfolp7i5zwtiqlxkblkwkiwkkpj5kz3gn6bacvxfqua5epmuo@jxoxugbjta7i>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
 <4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de>
 <cy6wxmcdr6o5nm3q2ze3otkmaeekwum4ob3cotxllp2l2km3np@fkljzlvxabyz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g6ofochip3badeha"
Content-Disposition: inline
In-Reply-To: <cy6wxmcdr6o5nm3q2ze3otkmaeekwum4ob3cotxllp2l2km3np@fkljzlvxabyz>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org


--g6ofochip3badeha
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 04:39:32PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Fri, Mar 29, 2024 at 10:54:41PM +0100, Uwe Kleine-K=F6nig wrote:
> > As described in the added code comment, a reference to .exit.text is ok
> > for drivers registered via module_platform_driver_probe(). Make this
> > explicit to prevent the following section mismatch warning
> >=20
> > 	WARNING: modpost: drivers/virt/coco/sev-guest/sev-guest: section misma=
tch in reference: sev_guest_driver+0x10 (section: .data) -> sev_guest_remov=
e (section: .exit.text)
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
>         b4 am -P _ 4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.gi=
t.u.kleine-koenig@pengutronix.de

This patch didn't make it into next up to now. Is there a chance to get
it into v6.10-rc1?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--g6ofochip3badeha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYwA9AACgkQj4D7WH0S
/k4C4Qf9Ev3fo1PaeZFkprRPjXhIIQgTRl2crSwQ8KR5U7GS0jI+B32pjukhN8+C
IbcfMYm2QmUpg5KLWs6ERD2BErF198tGWCDroJAXMBFDQRpkRYZafg7YT9BvguUy
B4UhUtId/yOoBcDpR0RaD5JZ+yVlCPhpT+yEdURJJjHi5wsjZNlHB+QdsvpPONX4
EHyJRWdDkfQzLysnlunZ/BwBFoa1qoVyfWdav+/8p5nf2I+SxcO8PkY1Q6nJGIH/
utM6Noi393sFw4/L01Lss7SX0megz76CoKsW1HLS5uhpXwrx4Ear2imUv/lccNUG
KohoV295Pl/v0QHjHaDkhFO083wiTw==
=D3J9
-----END PGP SIGNATURE-----

--g6ofochip3badeha--

