Return-Path: <linux-kbuild+bounces-2968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28F950D94
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 22:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 928431F21A5E
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 20:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AF81A4F0A;
	Tue, 13 Aug 2024 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="rQ4vJqTc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6FF44C61;
	Tue, 13 Aug 2024 20:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579654; cv=none; b=TLtAKtQ2xOZYQn0T3Lk/qRNF1bSYzE64zwiLyxygJNy1cdAOP2rItMl6QGe8bp3fe14epMx45VKxF1uRs+L+L53THESyevTznIFG3ncr5ZuFdLMHbPT+/tSiCGjYC4u7hsK37DppkOmTX291eYiq9Pp8yoa/oL9eySlQgSoWbE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579654; c=relaxed/simple;
	bh=/SXSt9VbXqIM8kyDndi2gEtfqFn1BbcY/BP9EV1bxpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GipAYh2bhYnekFHEELvanSiJ/jcO6F6DckGrB8zGyFyJfRWXDac0Fbr9x4YD5+GWNYWoBj9de6RAU7zFj7u7/HzFd9j2mPGPlErCuNEVRiPhVEgV17nlZC1dzrW2bEJcf9vZsO4H1M+8iPXt1uJuxNDdVpPWjP/N9Yawow4a+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=rQ4vJqTc; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1723579619; x=1724184419; i=christian@heusel.eu;
	bh=/SXSt9VbXqIM8kyDndi2gEtfqFn1BbcY/BP9EV1bxpU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rQ4vJqTcdQI7gVYBjtZbXd3cl+3uqpHIc5oGThgJ3sCumM0qYdMV+bA1bci+Vdp1
	 vcHvCKWVQyKfJDnwO7siRvM7l5hUPXQgtq9Z9nFaoai/rRwwgOTXFww/Q0o3yBC6Y
	 9BOTskbkAxiEw8b4+j7xNSnthZ6O/MRwjIeDzLe2g0uGtItuSZRRUVH74A/kieo2S
	 dLmZ8eNQKqicEtA4EY4ZrBAwKLp/KeGab2dSae8LXiyZol/VZE01euqL/OrB44uP+
	 B+k9r8pJ0S6KPxRKIxUz7vuSNIzmVfNmEECJvTmNLbl3Cu6NdVdj6wiD0YRUiA0ze
	 /M662N69GXjoNz57BQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([80.140.201.142]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M89TB-1sYj0D3epn-007lih; Tue, 13 Aug 2024 22:06:58 +0200
Date: Tue, 13 Aug 2024 22:06:57 +0200
From: Christian Heusel <christian@heusel.eu>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <129eeb10-5fe2-4a7f-8edb-9d02e4330f59@heusel.eu>
References: <20240813011619.13857-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2lwwpyglkpsbvwfq"
Content-Disposition: inline
In-Reply-To: <20240813011619.13857-1-jose.fernandez@linux.dev>
X-Provags-ID: V03:K1:fsnF8B18ToL5IL4m3TjVOTMV+301kn0IcyFRMVf2+gqeNDg01ah
 5fjLAMNdXNoy3ezZrfX4iIIoJHTOpyAyL26GUlRYMJ6KAh/WfYaM3sRsPztC06RuZidgKGD
 y/44qg/FLTPITWP6pBs+6K9O1KU4wmPl27u2JsrhSOGAtbwfiZGZW2oxfVGbnuvT3a5bQCA
 MIPwq8+wWxvkWjB7/hWXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YSucZGpK7n8=;aHMKjeI1G14dL3+egY4rqf7jBkE
 xDgmavzOyr4ozse5w5PVDKqOjOm24WELBNcFpGXV4Jh/2O+0apQ8YnuwT7RufZ5UMxXgCECC/
 u09TviE48ZjJ7gxNB7R6BZVX6bBQ5rgu90b+Qi6Z83rIhLP12+w1o62FoNjbyqEr0e2ZmDyrJ
 Rpx03bnvk9MMsLhTKyg1/tRRzI/Q42uck7XVQ5671+HUOurz0gRJXwyzT4ig4tkWA1xvtxLJI
 YwoeI9LWgAohlwAynIp6glJD/PMuOj+TnswDhOnH4Src2kOMI+ALiD4GDwddFjglaF2DHbLOj
 DeMI2h2s36N6zO3C7IZZ4Wwjt0JDhx1Y4XoU3S+EwkPGRF5444K5KkGgCRTdCk7xOMRrD4KzM
 9ueDsYcJeuXjFM5HxHint2JOclGchNZod4WTzSy3YG35UIIMilo77LTAdjdAPdCkLylyfA6gN
 QRuO7yvS08jDPtkX8UPWLr1FZYyv5Mq8Uul5StxyqZ5QAEx69wGaUMOsQKgFwTT8JEsnLObKN
 2hz29WTzYcmIAnwuXTtYHfbp0nGlH5+utAvBD81+jnG/3QXjk0xH7+wsq6tXZvtMYfUmZsQDM
 DgROdziNYEOQv+1HpwstmShZgje5SkkNNRFqCY6q9jL4Kt/QJTz2BglbNi+6k4CKP62SCbzq9
 IbZHiIf5iHX1EjYe5nKZ+U9OsmagPUtvynMMtqmiho/qqBBDOyd79AmC8aUCPmqRL6rIh1Bvg
 e67zNC4oBu1J1+jE9+ZlkDTCu6xMRF/RA==


--2lwwpyglkpsbvwfq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/08/12 07:16PM, Jose Fernandez wrote:
> Introduce the PACMAN_EXTRAPACKAGES variable in PKGBUILD to allow users
> to specify which additional packages are built by the pacman-pkg target.
>=20
> Previously, the api-headers package was always included, and the headers
> package was included only if CONFIG_MODULES=3Dy. With this change, both
> headers and api-headers packages are included by default. Users can now
> control this behavior by setting PACMAN_EXTRAPACKAGES to a
> space-separated list of desired extra packages or leaving it empty to
> exclude all.
>=20
> For example, to build only the base package without extras:
>=20
> make pacman-pkg PACMAN_EXTRAPACKAGES=3D""
>=20
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>

Reviewed-by: Christian Heusel <christian@heusel.eu>
Tested-by: Christian Heusel <christian@heusel.eu>

--2lwwpyglkpsbvwfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAma7vOEACgkQwEfU8yi1
JYUxWA/+OKRM3CmmWjHAcJH5X58mltgn06iiuo34KcwFm2YKniqIY3qp1zDSzEmt
d4L+lD5ujgrsO73wq0nJS4CTD7HDWxP+8JEBkHC61BNQyiwPFurXUVzNdwEi2xQz
TUC5ORh9Id2CxAw2TOQPXBv6Vn15qiim1erunVcnGh1jY4xhWaS1305xc3/mx4uq
jV36oJwMQ6up8imIKKtXvhGQs6whBL9LPkAro+kToTX8zopD3W/PJviQHJRJy56w
pv0dXuF47HavkWCCTY/A5mswxbaWHf2UEpaexl0+/+LiL03/r+CCCI/sSn2Taktj
mP1ZZuvQdi5z9w5tky1vE8y1TXyfXIy8qkEcvv51knThEQ3Ybn+UTNr+8ptUinq4
vA9uDHY8T9ing3WTNxppJI06mKk4eq2DyuQRn6gXtXbXWeL/3J1qCbnlVeMmTcEF
HD4l2Lt898pfn+CVv8pjfM6qveJroz8vTXLclrUHBM0uCOw43nt8ycDkmfVep0Vj
flqcr5MqKI73u6ibC3RtEQROgNQxdbHTKSlvzf7JD2lFrFMvCs9IV+Y+7yKpECMT
ijQBMO0Gu07x3JO5DibpmGUwtTLGb18YRgSvxQF0bSJaN+smfTBZQtxE4PFSXX+x
6i3WX8WgfIFSkDySZwacZ5X3EwiTiweOR3ep6B9+0kFUP3kqLCo=
=bMfG
-----END PGP SIGNATURE-----

--2lwwpyglkpsbvwfq--

