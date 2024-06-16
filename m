Return-Path: <linux-kbuild+bounces-2138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE7909E44
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 17:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184701F214E5
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 15:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5522F746E;
	Sun, 16 Jun 2024 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="CwvJx6kD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593114A81;
	Sun, 16 Jun 2024 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718553376; cv=none; b=m1XCPTnPZcUllT7NfiCo7IDa/BRPGXRnC63pnKUusul+0/dm4kFghTdOzqRm1Ggoiy/HWIWMbUIRmcN1aQGW88fKNkzwxCHtJlrCrXaCMqgQFdhkdz4cVVMYq3jkNQxkoPDTgDJa2E9uFlH2nbCaZSn3OrDetMxkJ4bfDkY01po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718553376; c=relaxed/simple;
	bh=aWlbf4v4BZx1SCQ2pnzqlMa9hnkkve273zFrppp4+/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vpwf9qcPRfyTMQtwVsPP7MZiyDuUjksiQ8FnOTMJznp0sU2rQIfYV6UM7HroSYHHKKboDu6UruyVzPbcJtKBX8z1GosmNnv16HK4Gs0ZPDRWIPOunMe5o7L8ENcOxlw8oLDKZPkOvw0mC75bxYcIItQEFvy2gzKm10IlLBJ000o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=CwvJx6kD; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=epgY0CWZGRWX9cG3rGGhfS4F7GuIuahi+q/0phSIS7c=; b=CwvJx6kDN1zrYDPzW+SU8eA4rc
	RoXKCSmFfma6bETJLo8LYwLarKyRU6ZX5uRn9DkKFuatHXCk/UfE9goxqnf2GHA5SH8EmQCHboud6
	cx37QRRF33kdhoXXSwuK/RcEpjJ3sFrVsmkQcb5gxro9y0zshoUznfptqtgbauW6aQR6CRPqoE1Kt
	fRZHLTNf6MKtF2AtSZioqW/yCyJpM3jH1oL8fySM0Yt7kfch53v8M5VwwNXub48hXVS95eKr36rMs
	HME89bHDaAeb3xEm4lGnrXciNhXu/t5BNcE3adazaRsHGiYfUC7jMSDMVNhQr7XI2qYuOSwZYEKoI
	1XYfnbaQ==;
Received: from [2001:9e8:9e2:3f01:3235:adff:fed0:37e6] (port=33542 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sIsEY-0091Ez-V6;
	Sun, 16 Jun 2024 17:55:59 +0200
Date: Sun, 16 Jun 2024 17:55:56 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: package: add -e and -u options to shell
 scripts
Message-ID: <20240616-dandelion-lynx-of-philosophy-6be45f@lindesnes>
References: <20240611160938.3511096-1-masahiroy@kernel.org>
 <20240611160938.3511096-2-masahiroy@kernel.org>
 <CAK7LNAQyPRKes7=wNtYXre+nU=5-1oZ-g1uzbjFMFd2e10jFjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="96ku8o6c42x5JWqi"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQyPRKes7=wNtYXre+nU=5-1oZ-g1uzbjFMFd2e10jFjA@mail.gmail.com>


--96ku8o6c42x5JWqi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 12:21:15AM +0900, Masahiro Yamada wrote:
> On Wed, Jun 12, 2024 at 1:09=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
=2Eorg> wrote:
> >
> > Set -e to make these scripts fail on the first error.
> >
> > Set -u because these scripts are invoked by Makefile, and do not work
> > properly without necessary variables defined.
> >
> > Remove the explicit "test -n ..." from scripts/package/install-extmod-b=
uild.
> >
> > Both options are described in POSIX. [1]
> >
> > [1]: https://pubs.opengroup.org/onlinepubs/009604499/utilities/set.html
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
>=20
>=20
>=20
> Setting -u needs more careful review and test.
>=20
>=20
> This patch will break 'make deb-pkg'.
>=20
>=20
> ./scripts/package/mkdebian: 150: KDEB_PKGVERSION: parameter not set
>=20
>=20
>=20
>=20
> To set -u, scripts/package/mkdebian needs code refactoring.
>=20
>=20
>=20
> I will keep scripts/package/mkdebian untouched.

uh, I missed that during the review.  Do you want to refactor mkdebian
in large scale, or is an explicit fallback definition possibly
acceptable for you?

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index ecfeb34b99aa..7e3878197041 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -7,5 +7,17 @@
 set -eu
=20
+# Optional user-specified environment variables
+
+# Set target Debian architecture (skip auto-detection)
+: "${KBUILD_DEBARCH:=3D}"
+
+# Set target Debian distribution (skipping auto-detection)
+: "${KDEB_CHANGELOG_DIST:=3D}"
+
+# Overwrite the automatically determined package version.
+: ${KDEB_PKGVERSION:=3D}
+
+
 is_enabled() {
        grep -q "^$1=3Dy" include/config/auto.conf
 }



Kind regards,
Nicolas

--96ku8o6c42x5JWqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmZvCwkACgkQB1IKcBYm
Emm2KA//XwZc5KqS+S05fECn6wHG7SKgN34oQCaRIZp+m1gDy1b0Wq//XRd9RIxB
0g8SREFV6ej4ZCtWlRZNK56iF+f4Lx6d0PBstbKkBmt0hJwfdG3vY9HoSjUbCjG1
u5O0kFtHPa1fX5ogBVT1NdgBgKCVRPh9OHKGVG1z4uONcHuMgHUIxAatoob7AZUZ
tUuT802g1C/51/AGVncQh0E21rKZf8IK4IUKp29CFPWgDQDkiecXCTqxa+9FK/v3
ABmSovJ5MuDrg5o1V3lk+Amky8rSPaNwTCKgALqADAyntCoogDH3Q5QL6VxIjArC
FDI6pfD0TAIGk5cAil6H6PXdCPkjKPYaxC5LqB1w0rNpfmdgTQY8akEGTG0xq0sn
GIuveUle1tP/OgFS5W3xiVzOHSYZ4SvgZs6ZeViaT/eem5xru12L2dTP5P7iRdpI
AUG3Q/ynoH5p08I0d52jLajgNqmTGT5EXfP39M36S/QRRIutH9JSjtru7zthEKVz
ZhGaWOKrJdNTCdn5pbd/1pVEDgE9TkfKlIiwhjD56dxQ6sW9PzCD+1BccSd4ZWgD
o3iSbc0oUikhGMU8lFFXYl+tWg3r17pgkZPjO30eWodDX8ErJSlJzR0MJeGJ2/Rf
PS1NLty3/AiR/xraq6Vts5TyOcQ37kQiJMw+9yfh51cbKeOYGdc=
=1OYK
-----END PGP SIGNATURE-----

--96ku8o6c42x5JWqi--

