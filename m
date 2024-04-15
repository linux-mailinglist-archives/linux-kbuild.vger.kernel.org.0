Return-Path: <linux-kbuild+bounces-1567-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E138A54FD
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 16:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA76281407
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Apr 2024 14:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865CF1E4B1;
	Mon, 15 Apr 2024 14:39:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD50A7868B
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Apr 2024 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713191982; cv=none; b=h47hCReZ6IqAibe2jndMNb/jPkCK0+swSsd5jM4HZDv3kUhqQTJq1kPSjZS1bpytr0n/mH6XYy67z8wwhKIRaS1o7G1NAWQ3NhU+dDqcCHQ04mZmPPW+FBzWY+xV4kF4L3ZG+cqTPMnSx5Em601NpkLeJycGQqK8V3O7OEH+mLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713191982; c=relaxed/simple;
	bh=FHbGFKAl8IPGRU4r+qn10Zuutr6ljVvHfpCj4apBixA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPs6IGvHuRJLDhnLZreM7aIfLA7PCn39aD8ClIqM8aSqsRqRTYPbI7SI3NjAaQzreghoZRJgMSZNgrX+DZ2SwcwdtuiLvuWnUqJ/iHfhlv7iajuEaDNuivyv1TRFPuvTkmLkyZaruA0HAX8n1fsRxyxmNa71UHV1M9ZiO60jRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rwNUc-0004lT-3r; Mon, 15 Apr 2024 16:39:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rwNUa-00CRT0-QE; Mon, 15 Apr 2024 16:39:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rwNUa-001gJA-2L;
	Mon, 15 Apr 2024 16:39:32 +0200
Date: Mon, 15 Apr 2024 16:39:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tom Lendacky <thomas.lendacky@amd.com>, 
	Dan Williams <dan.j.williams@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: kernel@pengutronix.de, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] virt: sev-guest: Mark driver struct with __refdata to
 prevent section mismatch
Message-ID: <cy6wxmcdr6o5nm3q2ze3otkmaeekwum4ob3cotxllp2l2km3np@fkljzlvxabyz>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
 <4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4sjysix7pc3rleqw"
Content-Disposition: inline
In-Reply-To: <4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org


--4sjysix7pc3rleqw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Mar 29, 2024 at 10:54:41PM +0100, Uwe Kleine-K=F6nig wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent the following section mismatch warning
>=20
> 	WARNING: modpost: drivers/virt/coco/sev-guest/sev-guest: section mismatc=
h in reference: sev_guest_driver+0x10 (section: .data) -> sev_guest_remove =
(section: .exit.text)
>=20
> that triggers on an allmodconfig W=3D1 build.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I'd like to enable these warnings even for W=3D0 builds, so it would be
great to get it into the main line soon.

If you apply it, please notice that I fat-fingered the parameters to git
send-email and it was sent in a thread. So (assuming you're using b4)
you'd need:

        b4 am -P _ 4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.=
u.kleine-koenig@pengutronix.de

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4sjysix7pc3rleqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYdPCMACgkQj4D7WH0S
/k5z4Qf/cz+/8MR4l93ePmYVwKkEJD+fB8lpz/dpLFu211mhGGQXElduQffvijpL
YtJnhx9q/nF57Hv1k86HrN4eEEO7Gui2D2VTYTxt0NurId2iR5NJ9eljWCwygZKK
Ilq/j+TBGj73U8ZWaASozegVBwSfWjc6dB+3tldJfLwoLqI5RyHvjyMSweLNzZ+Z
2wlW8VJscjei4mWQ4yVZOdT1wukAiv/yExHQvu6AFMmDovq1Z7tFYBUrZXwr44gz
+SMegfhHY8xj5Kb5kaIDVe4hqpXY8Qsy1agPKcChR2TVLvrxnU64rKQJPJYyZGNX
cmXGxlkTIhielL8kAXmpULXTUCMLWg==
=vwPr
-----END PGP SIGNATURE-----

--4sjysix7pc3rleqw--

