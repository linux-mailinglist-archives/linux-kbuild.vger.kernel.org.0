Return-Path: <linux-kbuild+bounces-1712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA88C8B635D
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2024 22:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 614AC1F2103B
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2024 20:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18ED5140E50;
	Mon, 29 Apr 2024 20:16:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2597813BC0D
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Apr 2024 20:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714421806; cv=none; b=oSi+P1zivCWgevOi5ItkkKM1XMsK/4lfZY0VW8Mi02WMBjxgiQNv6zp33LnMd1E0FDTODSBkdGYvqiA3Kemc2C4PAxSQStBXJoNcwEfII+5id/wZfqA86edD22cBmzgcig9oF+BvnGqHdqqQqo8cxy20odDI0kKVgw8r2vXysTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714421806; c=relaxed/simple;
	bh=9Z6hwUBZ/WEOq+foMsWJii18o0YOvzDHqJrltxy4GkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmTI8r0iPgD9IUMsddLUCHJxvXveOi1PYTTYyh5yfhIUC8jx9Z0ZRDKkIGzrLW9KlsPqYUAnvxsHo2WlmwyCaNbiQp2/xZ09onV6lHwmuf5GZMCkH1f1yENbPoz9GvEcnvDE3xKyJXeVZsjLusdtc4sRXtYnFoZcYnpcakOSlxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XQT-00079z-Au; Mon, 29 Apr 2024 22:16:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XQQ-00F2gc-Ht; Mon, 29 Apr 2024 22:16:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1XQQ-00Bitk-1X;
	Mon, 29 Apr 2024 22:16:34 +0200
Date: Mon, 29 Apr 2024 22:16:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, kernel@pengutronix.de, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] hwrng: mxc-rnga: Drop usage of platform_driver_probe()
Message-ID: <wu6kc2ctezq476pc3gebgiikml6xvf3ipqawdiiccq4vixdl2r@4qv55vvr4kr5>
References: <20240324103759.228009-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lqy4jh7losfpq2te"
Content-Disposition: inline
In-Reply-To: <20240324103759.228009-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org


--lqy4jh7losfpq2te
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Mar 24, 2024 at 11:37:59AM +0100, Uwe Kleine-K=F6nig wrote:
> There are considerations to drop platform_driver_probe() as a concept
> that isn't relevant any more today. It comes with an added complexity
> that makes many users hold it wrong. (E.g. this driver should have mark
> the driver struct with __refdata.)
>=20
> Convert the driver to the more usual module_platform_driver().
>=20
> This fixes a W=3D1 build warning:
>=20
> 	WARNING: modpost: drivers/char/hw_random/mxc-rnga: section mismatch in r=
eference: mxc_rnga_driver+0x10 (section: .data) -> mxc_rnga_remove (section=
: .exit.text)
>=20
> with CONFIG_HW_RANDOM_MXC_RNGA=3Dm.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Gentle ping?! Who is the one to pick up this patch (or give feedback to
it)?

I want to change modpost to emit this type of warning also for W=3D0
builds. For that it would be good to have this patch applied first.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lqy4jh7losfpq2te
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYwACEACgkQj4D7WH0S
/k70fwf+MTI/7Nuhap7iK+foJCAwx6AArL0Sw1WSAS/yVv2kQ1Q4KKd0D4HMS/cd
gViIqcb0Iu7JVJRui//DdbXkgzMRjkoceZELDMM/yHx+YiAKQAdRFMlq1sspphQ9
mxEDcS8WoBFK6maAuevBwKt9rgiF7l6CtBKYgIQAITP584xUV572+EXv35tag1Dl
zHOiIr7D8MJkwUQEIYb1pbBmbXoFv9otFjL88Xoi3yRDbkuXSK4IT5fVt3f0EJct
e2Dr0uUv/07w4fsR4qqhbAPS1Mu9GlMj6hZZGdkImGT18XO4YsSV+4A4a9a17Td9
+tUTpo3wPvw6bVxdllnTD3nUVuIHbQ==
=+L3M
-----END PGP SIGNATURE-----

--lqy4jh7losfpq2te--

