Return-Path: <linux-kbuild+bounces-5491-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B7A123D7
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 13:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24B7D3A6BB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 12:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8792139C6;
	Wed, 15 Jan 2025 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="qV9SkdJO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E8A2475C7;
	Wed, 15 Jan 2025 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736944531; cv=none; b=bkbr8f9wWwD2JJMmFxQJdbk5qTWsfLmZj0L1HfjDwvEurUsx45fZz1xk72tUb4jkFx0waKsK3KQKIK8/ORgce1/dUEQ6ceru1t3Zh1uvgB31UP1MhgJLzG10TSf/ID/u1S4Mj5vUuvlaKTG8rSqfxTldGXSekEXMJHjxzuuFfMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736944531; c=relaxed/simple;
	bh=nuNXwCDZ9bvQmoZ9IicK/vcl0P5xeuGaqK07PVp8YPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqGRVLJnv5qTPBFkeChAzopWax7hhKfd6P5QjkQEtznKIWl+QojdT3S3h41rWX/XoqpbR36rU1Qs6PmVydgbkfTXq5Pji30ddDcH6q521CG4kGA2t+1JHaiE2dNQAzk62dy1px5oYXBoWyVezmhI+tnTW6RJNVrx1g840f1WIEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=qV9SkdJO; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+/wIvcBDKKow2Nfm0Z2nStKAt93sbuscVhWRMA6XTb8=; b=qV9SkdJO6ocomKkCOqIiYRPa8s
	MZ/5zqe/6g/nm3/+z5gXy2xMKvnyTfpEzn6EETCPz71jRYzNqk74dWj62ZAhdg+Vo+98DzdFCot1A
	7w1jyhXBm/yiIB/tZftTgkyz5RqIjEwqBdTz2AIuFbsZjy30lrSjvyLZmICPpKHuG+S0pTFxRiqgA
	T72RSdifzfUYnrZsq63m+Uv7RK1LN0XXw9oYU96Vs4jrVI44Q63EiS3kssTOKWFUSqW17ZVxlft+B
	CNM8xdWnuOAWqnvXezimgmmBJwmsByjAgShx/9ssSe39VRmulnk87x9p6tQQKTU9BpEyNl7h1zC/1
	tJWt6ixA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tY2cC-00FfpL-IW;
	Wed, 15 Jan 2025 13:35:20 +0100
Date: Wed, 15 Jan 2025 13:35:17 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] diffconfig: add verification mode
Message-ID: <Z4erhR6TSGMrq4cs@bergen>
References: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
 <20250108-diffconfig-validate-v1-2-4b3d8ee489da@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kbeBRtfRcb04ULSS"
Content-Disposition: inline
In-Reply-To: <20250108-diffconfig-validate-v1-2-4b3d8ee489da@linutronix.de>
X-Operating-System: Debian GNU/Linux 12.8
Jabber-ID: nicolas@jabber.no


--kbeBRtfRcb04ULSS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 08 Jan 2025 13:34:29 GMT, Thomas Wei=C3=9Fschuh wrote:
> When creating kconfig files from defconfig files or snippets some items
> from the reference config may be silently omitted when dependency
> constraints are not met.
> Manual validation is necessary to make sure that the expected items are
> present in the new configuration. As the constraints can change over
> time, this validation has to be repeated.
> Extend the diffconfig script with a validation mode that can be used to
> perform those validation easily and in an automated manner.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  scripts/diffconfig | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>=20
> diff --git a/scripts/diffconfig b/scripts/diffconfig
> index 43f0f3d273ae7178086f03038780ba103fd9970b..95cb0282f6db2873ef32804d3=
61ef6db8a7bc8ce 100755
> --- a/scripts/diffconfig
> +++ b/scripts/diffconfig
> @@ -24,6 +24,10 @@ Changed items show the old and new values on a single =
line.
>  If -m is specified, then output will be in "merge" style, which has the
>  changed and new values in kernel config option format.
> =20
> +If -v is specified, then diffconfig will validate that config2 is a supe=
rset of
> +of config1. Only items from config1 not in config2 are printed.
> +If items are missing from config2 diffconfig will exit with code 2.
> +
>  If no config files are specified, .config and .config.old are used.
> =20
>  Example usage:
> @@ -77,6 +81,11 @@ def show_diff():
>          merge_style =3D 1
>          sys.argv.remove("-m")
> =20
> +    validate =3D 0
> +    if "-v" in sys.argv:
> +        validate =3D 1
> +        sys.argv.remove("-v")
> +
>      argc =3D len(sys.argv)
>      if not (argc=3D=3D1 or argc =3D=3D 3):
>          print("Error: incorrect number of arguments or unrecognized opti=
on")
> @@ -123,11 +132,15 @@ def show_diff():
>          print_config("->", config, a[config], b[config])
>          del b[config]

I think I'd move the early-exit for validate=3D1 here, and would leave the =
rest
as is.  But this is only personal preference.

Thanks for the nice idea!

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas


> =20
> -    # now print items in b but not in a
> -    # (items from b that were in a were removed above)
> -    new =3D sorted(b.keys())
> -    for config in new:
> -        print_config("+", config, None, b[config])
> +    if not validate:
> +        # now print items in b but not in a
> +        # (items from b that were in a were removed above)
> +        new =3D sorted(b.keys())
> +        for config in new:
> +            print_config("+", config, None, b[config])
> +
> +    if validate and (old or changed):
> +        sys.exit(2)

> =20
>  def main():
>      try:
>=20
> --=20
> 2.47.1
>=20
>=20

--=20
Nicolas Schier
=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--kbeBRtfRcb04ULSS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmeHq0oACgkQB1IKcBYm
Emk04RAAk6gUW65ou/7Q/2n2ZVExllQ0H3l91iq02v9oBmUaYFm+7HBpM4EwMuu7
0aPmo8G8P5ETehQSTfvGcrzGBzT6TPgeEDY+/8XX5NZPjp6hcV/btTXyLEr0ifSO
7IwHQJyqMRvQu4umbqxLxognXDDCVEJYDsarcJB6jmOfcDTCiTTggpz1OValCZzk
KHnM7rl/pCmjKSWoUNK89LftelCcH466ociCD2ZV2QReOfp1H2gSvOxcCWrHnhZC
48fyFL8frgQ9V8geVxT1B5lAl/egbTXIL1gf+X6fxD74+Qce4hbC8Ir3Tz+gPcZ/
29Aeu/qcQbMMKpzy40OBbnsPuDo52GzurFwyIYFAygZg9UrRMwa+Egi4DGg+hc9G
zGZdJt0RY96EnaplLKfmmCZ6GMehJbODz8DVsC8vnujLoRbKaSPOtUQSwaqDFzkw
cwbtEXg6p0XAJ+GWrKQOoETTTXUlcvMjM8NFeUiHwK/vsbubC6Xc3xRVgmYdHuEX
3/NxpE+uRDkS419r6cSlFMazACnJId2XheAVJiK90XLYsNmri0zkYLH6lD2d7Ocw
N7iiLZSecWioGmtAajpAypeYB70pP8nl+fKaT0gETCzxP0suq6dUGB2qATJSTDCf
8LAxxJBeGQFkSd/N+0ClfXA0edL7GcOIYMTvHUwjb8fBvOJaiUA=
=shcM
-----END PGP SIGNATURE-----

--kbeBRtfRcb04ULSS--

