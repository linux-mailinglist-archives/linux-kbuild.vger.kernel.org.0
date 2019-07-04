Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE49E5FD85
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 21:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfGDTt5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jul 2019 15:49:57 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:35162 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726805AbfGDTt5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jul 2019 15:49:57 -0400
Received: from [167.98.27.226] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1hj7jr-0003HC-Uq; Thu, 04 Jul 2019 20:49:52 +0100
Received: from ben by deadeye with local (Exim 4.92)
        (envelope-from <ben@decadent.org.uk>)
        id 1hj7jr-0007vM-EP; Thu, 04 Jul 2019 20:49:51 +0100
Message-ID: <432e997617a0669886cd9ea5ceac7c1a2173044b.camel@decadent.org.uk>
Subject: Re: [PATCH v2] builddeb: generate multi-arch friendly
 linux-libc-dev package
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Cedric Hombourger <Cedric_Hombourger@mentor.com>
Cc:     yamada.masahiro@socionext.com, isar-users@googlegroups.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, riku.voipio@linaro.org
Date:   Thu, 04 Jul 2019 20:49:51 +0100
In-Reply-To: <1562269332-132-1-git-send-email-Cedric_Hombourger@mentor.com>
References: <0ff3202ced2b501d6045157f1c7b50810c0571e5.camel@decadent.org.uk>
         <1562269332-132-1-git-send-email-Cedric_Hombourger@mentor.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-cA+bfsGVarVXhzkxUgz3"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-cA+bfsGVarVXhzkxUgz3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-04 at 21:42 +0200, Cedric Hombourger wrote:
> Debian-based distributions place libc header files in a machine
> specific directory (/usr/include/<libc-machine>) instead of
> /usr/include/asm to support installation of the linux-libc-dev
> package from multiple architectures. Move headers installed by
> "make headers_install" accordingly using Debian's tuple from
> dpkg-architecture.
>=20
> Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
> Reviewed-by: Henning Schild <henning.schild@siemens.com>
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

I haven't reviewed this version of the patch.

And this doesn't make a multi-arch package; you will have to add a
field to the package's control file too.

Ben.

> ---
>  scripts/package/builddeb | 8 ++++++++
>  scripts/package/mkdebian | 4 ++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b03dd56a4782..15a034e18c37 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -132,6 +132,14 @@ fi
>  if [ "$ARCH" !=3D "um" ]; then
>  	$MAKE -f $srctree/Makefile headers_check
>  	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH=3D"$libc_he=
aders_dir/usr"
> +	if [ -n "$debarch" ]; then
> +		# move asm headers to /usr/include/<libc-machine>/asm to match the str=
ucture
> +		# used by Debian-based distros (to support multi-arch) but only if ARC=
H was
> +		# translated to Debian's (debarch) - this is done by mkdebian
> +		host_arch=3D$(dpkg-architecture -a$debarch -qDEB_HOST_MULTIARCH)
> +		mkdir $libc_headers_dir/usr/include/$host_arch
> +		mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$ho=
st_arch/
> +	fi
>  fi
> =20
>  # Install the maintainer scripts
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 8351584cb24e..8ebcb7d67fd2 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -212,11 +212,11 @@ cat <<EOF > debian/rules
>  srctree ?=3D .
> =20
>  build:
> -	\$(MAKE) KERNELRELEASE=3D${version} ARCH=3D${ARCH} \
> +	\$(MAKE) KERNELRELEASE=3D${version} ARCH=3D${ARCH} debarch=3D${debarch}=
 \
>  	KBUILD_BUILD_VERSION=3D${revision} -f \$(srctree)/Makefile
> =20
>  binary-arch:
> -	\$(MAKE) KERNELRELEASE=3D${version} ARCH=3D${ARCH} \
> +	\$(MAKE) KERNELRELEASE=3D${version} ARCH=3D${ARCH} debarch=3D${debarch}=
 \
>  	KBUILD_BUILD_VERSION=3D${revision} -f \$(srctree)/Makefile intdeb-pkg
> =20
>  clean:
--=20
Ben Hutchings
Quantity is no substitute for quality, but it's the only one we've got.



--=-cA+bfsGVarVXhzkxUgz3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl0eWF8ACgkQ57/I7JWG
EQk4AA/9G5jY7ubQDfOO6pEMnOMb1V6QBMMDT+eIBVyiXxW4xBN7yFz6WjKLTC+k
mYeNcPWL1iI0Tl9LpAmsOKHffJYc1BWbjo46gDk1nP5s6V/Mc8qXVhKcHSYWTjnI
3upub1vcb6dWvimjeOubCCSM6mvwrRyxibwO7Cqr/vuWfcFK4JG5/bO9+3nri9zX
RKR2746PLfg5UBU1GrBvEtgBV5bXmOX11j6APOre9GHEw6j5zKB95jF+ufL6opqM
3KcRmg8gj+khqtOWoLMKc/U3cn4zvEmgROyU6Dv32c6EXD73AKov8A36WD5BwHb6
YtJ3MrfNFMSPgFTM3K/+vRTmwoV9bUcK4b4yhrl64yOMjk2GkuilO3o9+sDTmHiY
KRWQjeVbWMd2z4QlGYzcJ5qfxljuSegEzISnUhZcEAb7pxzPmq/CvJGGE0iSdQqa
2PC6jTXcM3ELZOmXIRcnTi8sog8DG7b3J2a/dHVnqkeklqRZBg/w9uTAcSvxKLv3
UnYhfj0bn0fFTZgfGoFWYkZSSk2vnXTJbYEGrzjDIhqTaW5xwU+9pMKwngO47ny0
vcNqsg6VDLzjFNWyGBt8pOq3DIq0Ud1D/j8c5Fod+Jlz3ScF3KLhq2YSqjU9iBVC
k5Tj8F/AR4HsjR7bJJ5YDO7fzpeHJj6ClCP1PqUEelc41hIK2bA=
=MsmZ
-----END PGP SIGNATURE-----

--=-cA+bfsGVarVXhzkxUgz3--
