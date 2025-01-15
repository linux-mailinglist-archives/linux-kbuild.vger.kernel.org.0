Return-Path: <linux-kbuild+bounces-5490-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C2A123C4
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 13:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1C73A7F71
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 12:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061111DFEF;
	Wed, 15 Jan 2025 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="ftu7AYhU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2A42139C6;
	Wed, 15 Jan 2025 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736944348; cv=none; b=jjqdV53PhQVaEcqy8TyHuGZLA85yufLF914asyIOxWZkVhvhmWJzHg0HJdIdRG9lCCjQpTmZp9IENdwK/pez/l2mwpqxLChQT2D81GJ9nMC4ZTSE5yEtrbIentI4xf+uoyINO1kwdgS1gA7Iz044oSqsPjsekaYhN8EDqxpTX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736944348; c=relaxed/simple;
	bh=teRVM/zef6yxKmxqGUVSmS3J+7xef++XR2dpHMRbOyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOJsI1AKHVbfiE1xCH+XPA9LOogNPCFlAiP3E6mW2FhBljUvEwt9B1ypscOg/UCGxnlu0Ja5grWg/fExIfilp1UzIiJ8vT0/rfE3XFPirwWrpZN6gnFzkEVt7cf4B5rEE9eokG4N644MSYY8E2KG5WOfFMQsPwWwUlPoOLMHjxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=ftu7AYhU; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I/HhoSZkyx9wRmYxds6irdlwDqpgcVefL5lUu6B+L/g=; b=ftu7AYhUI2IohLtTnJF9ckG2jW
	c43NDVIpS9dh0oJQbzReth+XQ9e21huqlHnGaFpyKaJf3rHnaiaGdbfhpAwmGvXiLV3mze0AgmqBo
	QWbYHxwDN92m0blJ5N94s5Yl+lcihuJqqEPXnT7DI/xl4ppYtRUxwhQlDvVLzrck5Y/CQp43wpIwl
	ZuDqn1GSKr0y6ioFO3XhnHBQBq1LsRZmPyOVZ21X7grhuLiDvBySxdejc7omBdDVkU/k/rnC+j3PG
	25octr0lJgOjKGKF/pe5BiTE/8KDiJCHRCZxSo0UT5+4RGmxm08tdFuGXnbiZpH8HDa+EAzTnJkln
	Q5DN37pA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tY2En-00FTis-33;
	Wed, 15 Jan 2025 13:11:09 +0100
Date: Wed, 15 Jan 2025 13:11:06 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Add kconfig utility scripts
Message-ID: <Z4el2qEV1xZIMBfk@bergen>
References: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
 <20250108-diffconfig-validate-v1-1-4b3d8ee489da@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PZcjHei43lSAfEDQ"
Content-Disposition: inline
In-Reply-To: <20250108-diffconfig-validate-v1-1-4b3d8ee489da@linutronix.de>
X-Operating-System: Debian GNU/Linux 12.8
Jabber-ID: nicolas@jabber.no


--PZcjHei43lSAfEDQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 08 Jan 2025 13:34:28 GMT, Thomas Wei=DFschuh wrote:
> There are various utilities in scripts/ which work with kconfig=20
> files.
> These have currently no maintainer.
> As most patches for them are applied through kconfig/kbuild anyways,
> add an explicit maintainership entry.
>=20
> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30cbc3d44cd53e6b1a81d56161004d7ab825d7a9..2bd414fb3e6d6515b57a57a5f=
3d4d735137edcce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12385,6 +12385,9 @@ Q:	https://patchwork.kernel.org/project/linux-kbu=
ild/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git kbuild
>  F:	Documentation/kbuild/kconfig*
>  F:	scripts/Kconfig.include
> +F:	scripts/checkkconfigsymbols.py
> +F:	scripts/config
> +F:	scripts/diffconfig

Thanks!

Does it make sense to add scripts/extract-ikconfig also?  It does not=20
handle kconfig language at all, but linux-kbuild would probably still a=20
good place for review.

Nevertheless,

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas

--PZcjHei43lSAfEDQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmeHpdkACgkQB1IKcBYm
EmlGUxAAmvkLwwy+9QI8ZQmVjnI39yCWI7YxV4gJym7d92E5YCI14UtqxEs+Qr1G
Z2aKiRZcFwRdrtGEVKR6t6i1HFqtCM4/dK5Oz3CbHQ+VclFijhEb20z8HxGMReNU
f3a2wi0qxX4rG1d49SJ6v9IwYyP/62Qefbg2pPaauGRaxRcgCBU1ntZ0vY3OkP7/
KbASxOxcB+rrpcpvKVI+8s41y/WoxjEDF5XXXHhBuWTfx+LWypzkb8fSCWdmm2G7
90B4DcCw9ed5dRwVgqHN4fsiZurk0DsG2d1RQt5UNGIls/Xd/fUaiARILSVvgwp1
dlyaSJoFG3qZtOJTKwrkgGS7Gr9LRmnaCttgOI87KFSrPEyeMp3eacu4wr8RgFFY
t6lm8ufZ3TwrC7MJcNbB+otkUi1aogFqXQVN43TKaKEDkBO1rtoLT4EABJRJiTD2
BlQlAfmM1y8QglCr/UtPphlletIk0pyLhRvsS9PXEmtmn8/KPkPoFpk7xSICi8Nt
qN+1jq34KLD4StB8ggh9E8NPPY1Xj5dErPfvM0CvGZZbiT20gXuUGCprf0SavEML
r06K4UtzrgRvLMofjQJUzFhWFsWct1wtp+JbxFepYdOxsflHtnLTsvvuiZj2MVXm
QDvvc5Xx2Yx/cbx/UTk0BMDMfYC3EzuOIvuy7IMgmImgeKW1mB8=
=io3k
-----END PGP SIGNATURE-----

--PZcjHei43lSAfEDQ--

