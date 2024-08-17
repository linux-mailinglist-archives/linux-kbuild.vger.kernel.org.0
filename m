Return-Path: <linux-kbuild+bounces-3059-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D460955707
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 11:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0B6E1C20B92
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 09:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883E3143723;
	Sat, 17 Aug 2024 09:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="mQ8H7gcb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3949B657;
	Sat, 17 Aug 2024 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723888326; cv=none; b=LzMXJ4P5hkBOpH4xHwyZeckd5VLB5PfynQXJ5FA02oxInUwnaZ2A1WFhBdJ97Vk932H2YlfKk5Uk4NtQYVydNHe8KzleA+4uAh8KDmCZZwdOcTnQwW0N0rREmxVdDrwmer7dDqyAKQEOpuGzLdvz8WXHXxY+9voA3aCgbiztZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723888326; c=relaxed/simple;
	bh=xjWlUFVmeQ23qcC324Mc2c2clJQ3PH40N8vkcZMGXR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnuhOIm5NyJ+//c67dq0l3IhH9d4vh/hmOjMyuTmqSZXdDThmVWWq775SmvItd2We6GLuiKN39TMuPt85GGk+/ewj9LT4CoWYmtCgCkpidSAnCAlROkMsDoKWQxmiA/mP2nbl9cR7UjJt3Gh8Bcwmy2atYc3QO1H0dKuK34Jf6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=mQ8H7gcb; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1723888311; x=1724493111; i=christian@heusel.eu;
	bh=oMUGAIt4wJO/Qz2qLrUrZ9XzvtHMs5LXUqRu8V3ddDw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mQ8H7gcbtoUo5tvL4SIud6nne6K7ptCtNGlxjaVpU5IUwijkzeLCJ0kPXb993uyu
	 l8/ikTx5LiSHsP+Tb/5/y7r+4beOJfWHiW/oNQC9K9j5mUX1UxGzD918m0skGJhSh
	 tA2SG9BBWGEYqt8+FfxjOX46C0iJhu551z5RZShl9bBDEDkrzZIEn2hvJAjw9kzuA
	 CBvdxeoJ5E3Dpyw6BJyvauduYfy7a31Yvl28O06zTYunbSl1UN/tBlRwstWdgQvki
	 QQIf+V3mO1dypA2wZj7NXoh6JMS42teOAZK0yWNK5jz9l3U2gnIg4ZX6MmnzadVIp
	 pg+QASLeUy3amY/cOw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([78.42.228.106]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N7gfa-1s2E3Z1dDu-00rgfV; Sat, 17 Aug 2024 11:51:51 +0200
Date: Sat, 17 Aug 2024 11:51:50 +0200
From: Christian Heusel <christian@heusel.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 1/2] kbuild: pacman-pkg: move common commands to a
 separate function
Message-ID: <6d501e4e-0190-4f01-83c3-4196090d743c@heusel.eu>
References: <20240816141844.1217356-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ybrorihy2233pm4z"
Content-Disposition: inline
In-Reply-To: <20240816141844.1217356-1-masahiroy@kernel.org>
X-Provags-ID: V03:K1:8YPYlkt9nij3L2S+XAhKw+YCyaGGal1PNjX7N5pPyMZNbuM0ZfA
 GKRk6CDmcvbkEo6J+WoRS+Y2hU+Jb3g2thGgxHC9l2iiPqEC9PK+w6iXak9hew5vuLqiC4j
 WM3e8LGWmCjjrnjGqV8KPSYjTEWY0Qu6PPCAyj79vyDCseACDdl9rRAthcf718G4xznRo6l
 jrgRyqNxMpnb/c3pKQKYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4vDseV98pBU=;Z1ORGJs0wH6mk1eTAA+9x8BrrdL
 UShGgq+4LsjUEwur3xpQUevCp0cPoPgaVw8mRUK7L3+zN1m3rUGmOw3thoN7kvfNQrxIwC7Ap
 yy0fCQNp//e2lA3i+ciuuovRsVrUD7LnjmuihsaXK5SkZYdkd1tGcTok4oQZ9udGoW43ndq39
 Dg9GRYTc8rnD6cIbMYJm4OS5QJ+r1CvtRyYCJbt7RQZAFZvwm/1Eik6LXiO4lFnWr2OvhIs1P
 RFpf2xdpLzouL6iwkQhHXPoUkmYYyTZBkHjNcdfVfgG0jbtq0+1k7kzvAO9WC8yPHwef7b3Q8
 OZOjluj8CaNzRYh/OxPFcvFRbv8ahYQyRvAwELgdcfLgWWEY8CNAvy+WrLLsrH3123zMLwic5
 qvZdZkubcLHWozDivlw1nscoHn/x02auuWG0YNOulMvWH6PxBXWzUycq9JUE8p5ZhAYuR71MR
 Qx7qf86EBYApa7r5A3oQ3F+R7mGOoj7tiZwWqQ+9zGiWRKlsUpElKn3lyUu39U4SFZNlrM9CB
 mWHBeCLtUYvvW3kZ39QK4tkfPETHt//wuYTj+vX1rQB6CDTeBG8+ArXT3IKH3ctRYpVOYMkmf
 kjQJlZ5qIJJpmrBQFA1KJznY+hfn7eO3WSc0LU0P8X4o8mph4mo7awfDSvX1V4h4BtPxEdTQy
 V8FFkgGP+ZjsbNICVeHQWOa7y3AcNlH+y1UHP2W/zos1NG+TELtAS9A5SINakJzYsWeJl09aV
 VAiYDeZGJzn1fN7eBG7WL40e1pTHb/nJQ==


--ybrorihy2233pm4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/08/16 11:18PM, Masahiro Yamada wrote:
> All build and package functions share the following commands:
>=20
>   export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
>   cd "${objtree}"
>=20
> Factor out the common code.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Christian Heusel <christian@heusel.eu>

--ybrorihy2233pm4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmbAcrYACgkQwEfU8yi1
JYUFBxAA30G3r1vC1VHcuC8uuTPsxXNES/nZMV+0x/Ljf1STuyWlgPcpU8wryPWr
EAz/gt4hHpofNuICBmBzspO+PwqXDIasTjBZS3yWBMs632vOF67DBThniO6fhZ0E
9QeML37492v7ISaqehp75g9G8fH94m57eF3Y34tTBkt5tb874F2Kk1G9HOv+CkJQ
Ro33S6o0LwX0HY4JYcfu+UYAhJgohZEzHMfO+F86RXnP43YlwU3Gv6x/z2NvuVio
QQktEvQN9nni1yRUeAeh6SYxskw+Wq1+W1utuVswGULvlZNqt8F6aXS+V/Zx6NBh
BO8jet//1rDXWfJRu+oCrIdpWohzJwpyErzUu5lVhxiy85b2epTv4fBE49YvfPq3
Ek8cQK6Sx+12w17A9OLil5QQRSmBodO6PRYHOr4gzoIjI60euONnCHho7YUCDNrd
vZgUyMbG0dh1Ad8AtqQpfCw6QhMaEjx3hlZF2MeeMciJVGVewY2M8LF3YRl98w4g
eIcOiITiD2FmVwo7FzKfZRcJYtA2XLlvmloUeFmQqXaZcq3KukO/sAwzvNm//Ab3
dBYzLjvB5ULkenowg1vtrfWcWM0b+1TGuU7Iu44yuIGnm/nisu8FJ9r6H48zPc43
Lp/HxGepcQrWVBx6W86x6ZciVk07SZ32HJGEmAGzEzSl+2ck27k=
=9VEo
-----END PGP SIGNATURE-----

--ybrorihy2233pm4z--

