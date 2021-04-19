Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F7E364356
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 15:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240255AbhDSNRM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 09:17:12 -0400
Received: from maynard.decadent.org.uk ([95.217.213.242]:44082 "EHLO
        maynard.decadent.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240259AbhDSNPL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 09:15:11 -0400
X-Greylist: delayed 2467 seconds by postgrey-1.27 at vger.kernel.org; Mon, 19 Apr 2021 09:15:11 EDT
Received: from 99.247-246-81.adsl-dyn.isp.belgacom.be ([81.246.247.99] helo=deadeye)
        by maynard with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ben@decadent.org.uk>)
        id 1lYT5p-0005IK-Dg; Mon, 19 Apr 2021 14:33:33 +0200
Received: from ben by deadeye with local (Exim 4.94)
        (envelope-from <ben@decadent.org.uk>)
        id 1lYT5n-0003JW-OW; Mon, 19 Apr 2021 14:33:31 +0200
Message-ID: <06ffa2a690d57f867b4bc1b42f0026917b1dd3cd.camel@decadent.org.uk>
Subject: Re: [PATCH] kbuild: deb-pkg: change the source package name to
 'linux'
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Riku Voipio <riku.voipio@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>
Date:   Mon, 19 Apr 2021 14:33:27 +0200
In-Reply-To: <20210419070139.1515431-1-masahiroy@kernel.org>
References: <20210419070139.1515431-1-masahiroy@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-h4U6KCuXZF1fprjbESTT"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 81.246.247.99
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-h4U6KCuXZF1fprjbESTT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-04-19 at 16:01 +0900, Masahiro Yamada wrote:
> Change the source package name from 'linux-$(KERNELRELEASE)' to 'linux',
> which is aligned with the source package from the Debian community.

I would prefer that the source package name is *not* the same, so that
it is clearly distinguished from distribution packages.

Before commit 3716001bcb7f "deb-pkg: add source package" the binary
packages used to claim that the source package was "linux-upstream"
(although no such source package existed).  Could we use that instead?

Ben.

> The filenames will be changed as follows:
>=20
> [before]
> =C2=A0 linux-5.12.0-rc3+_5.12.0-rc3+-1.dsc
> =C2=A0 linux-5.12.0-rc3+_5.12.0-rc3+.orig.tar.gz
> =C2=A0 linux-5.12.0-rc3+_5.12.0-rc3+-1.diff.gz
>=20
> [After]
> =C2=A0 linux_5.12.0-rc3+-1.dsc
> =C2=A0 linux_5.12.0-rc3+.orig.tar.gz
> =C2=A0 linux_5.12.0-rc3+-1.diff.gz
>=20
> Commit 3716001bcb7f ("deb-pkg: add source package") introduced
> KDEB_SOURCENAME. If you are unhappy with the default name, you can
> override it via KDEB_SOURCENAME.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
> =C2=A0scripts/Makefile.package | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index f952fb64789d..c5834a480545 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -25,7 +25,7 @@ include $(srctree)/scripts/Kbuild.include
> =C2=A0
> =C2=A0# Remove hyphens since they have special meaning in RPM filenames
> =C2=A0KERNELPATH :=3D kernel-$(subst -,_,$(KERNELRELEASE))
> -KDEB_SOURCENAME ?=3D linux-$(KERNELRELEASE)
> +KDEB_SOURCENAME ?=3D linux
> =C2=A0KBUILD_PKG_ROOTCMD ?=3D"fakeroot -u"
> =C2=A0export KDEB_SOURCENAME
> =C2=A0# Include only those top-level files that are needed by make, plus =
the GPL copy

--=20
Ben Hutchings
Humour is the best antidote to reality.

--=-h4U6KCuXZF1fprjbESTT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmB9eJcACgkQ57/I7JWG
EQlHTQ//aFEOrq6ZVlpfOtVM8yveUT/loHYmXa6/l6AJ+5tEo1AMYv9YCIpNv7Fp
aE8oT0AyphJPUJ2oZ/nme5QiY0Jda2iP43WPnjK/5NzHM0wo16FBo4EuOXH2PR6T
geCm6SzK8+T8OUNLXkOwkaYBIDU75hDfUr4v64JEGau/PVuJ9ebyw6sefdiem2wd
7dFQHXSnSN/x5Atgri+FefQxcl+RI+ZXCmMraUK9Yvv0TFgSHJdQ7fJDpn9E57Ng
iLvUcscQJFKNUtHuu+X7++eSHbm9WxDvsy+ocjkf9DPNngCgWRcRdUJWoL2R9qZi
p04g5clr05JsYCHBfr/iE0d+bbXOwgL9FTa8pO+fEB6CtM3DDcmJ19I7D7XR/TqG
g/NZk1JeD+jgfOOQ9Wrb4lw9+ojd7sKwKHx/bJDi53IrcTBQHiOSn6PNcCKS+Z3K
9vqCfmnkVlh6vPcHsF3D0vzzYAtqM+dHYvxO9bYaPUBjtXr2zPseyprlAROipzE8
043xEh8/oh+az0agKIUHmrMAjXgEnNt0GhE7l137Rt+vi/+3IePdHzvGhMiDQx0K
8Pu9kZouga3xSB6W+x0fN0MseHxcbEom83QzjxsGLGyDjtV1NCpvWKkUl4JFtkUc
xA51r/p8H590rSlcvKMRIjvjGjwGkdZoTmNASDmGOntfdK78jUI=
=AvyP
-----END PGP SIGNATURE-----

--=-h4U6KCuXZF1fprjbESTT--
