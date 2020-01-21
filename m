Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 128D61444F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 20:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgAUTVv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 14:21:51 -0500
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:48314 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726229AbgAUTVv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 14:21:51 -0500
Received: from [167.98.27.226] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1itz5u-0006e1-KM; Tue, 21 Jan 2020 19:21:46 +0000
Received: from ben by deadeye with local (Exim 4.93)
        (envelope-from <ben@decadent.org.uk>)
        id 1itz5t-000s5J-IG; Tue, 21 Jan 2020 19:21:45 +0000
Message-ID: <cea3ceee6be7c9554f139db6e96c99f2a5b93be2.camel@decadent.org.uk>
Subject: Re: [PATCH v2 4/7] builddeb: avoid invoking sub-shells where
 possible
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Riku Voipio <riku.voipio@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Date:   Tue, 21 Jan 2020 19:21:40 +0000
In-Reply-To: <20200115162529.11089-4-masahiroy@kernel.org>
References: <20200115162529.11089-1-masahiroy@kernel.org>
         <20200115162529.11089-4-masahiroy@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-c0jm8Kxk4TXRWPcuaVA9"
User-Agent: Evolution 3.34.1-2+b1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-c0jm8Kxk4TXRWPcuaVA9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-01-16 at 01:25 +0900, Masahiro Yamada wrote:
> The commands surrounded by ( ... ) is run in a sub-shell, but you do
> not have to spawn a sub-shell for every single line.
>=20
> Use just one ( ... ) for creating debian/hdrsrcfiles.
>=20
> For tar, use -C option instead.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
> Changes in v2:
>  - fix misconversion pointed out by Ben
>=20
>  scripts/package/builddeb | 39 ++++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 9b92745bf13a..7d7e0abe62b6 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -165,21 +165,34 @@ EOF
>  done
> =20
>  # Build kernel header package
> -(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > debia=
n/hdrsrcfiles
> -(cd $srctree; find include scripts -type f -o -type l) >> debian/hdrsrcf=
iles
> -(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platfo=
rms -o -name Platform) >> debian/hdrsrcfiles
> -(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -=
type d) -type f) >> debian/hdrsrcfiles
> -if is_enabled CONFIG_STACK_VALIDATION; then
> -	echo tools/objtool/objtool >> debian/hdrobjfiles
> -fi
> -find arch/$SRCARCH/include Module.symvers include scripts -type f >> deb=
ian/hdrobjfiles
> -if is_enabled CONFIG_GCC_PLUGINS; then
> -	find scripts/gcc-plugins -name \*.so >> debian/hdrobjfiles
> -fi
> +(
> +	cd $srctree
> +	find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
> +	find include scripts -type f -o -type l
> +	find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name =
Platform
> +	find arch/$SRCARCH/include -type f
[...]

This last command is still wrong as I commented on v1.  I think it
should be:

	find $(find arch/$SRCARCH -name include -type d) -type f

Ben.

--=20
Ben Hutchings
If God had intended Man to program,
we'd have been born with serial I/O ports.


--=-c0jm8Kxk4TXRWPcuaVA9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl4nT0UACgkQ57/I7JWG
EQnMOBAArgnep2r0QD4Res2c+lz3YeICSSIRvzCHX2c9rK8QwcvZGAUp+CZNO+hR
4vzKq1PABowe89AlIby9wpHG7MXcdl2DagA0Q70FiFnaG3rve3DlngPglXhY8Ytf
Zp/UfnyJ2LoUI9Ge9W1SnHdQOMbJy/VwJFiXXmtU5AnOvlB0J8t08h0fKx7BNGOe
7kvjnejvAqHV+HFGZuzN3ccawcGrHAp7DLyX7luTJjRDsrnH7wtIF/6MHT23RvxK
rzOuQGZXVil8D80YkbwvldPqJe/LwMmTiu6p5JXkExxI7nv6Euvk1dqftnPsFWin
gIsYlkdxNXyDGMgOpwz3z+KEZJ3QOLcRRZCljFgwn12A/wjBaRgWITZz0Q65ejyT
thTOP/8gyNsOQJhvwt6zeE52cBnkhkLwDznzUeRijluVWyq8flWAGfdiD10EwgGT
7kC7c6IFN5JpEzLrfMVsTpkLvYZ1b5qBlZ18dRl5HIkHwN88XPEeLunNfeRotfnb
YGJ6e4EQtKWJ+mzUVDdFCiLBZS2gHhMXdc9tBV+iWjMeFlUqbsBJamhyc/i/3scA
Y2bZEoaKd7BKLjSHD6SljmXhXMlm6V2cwCLLEBs/d7auIsuXl6uVcPxXqyK5UgJI
2iAeYMZtXPy1h/vTyXLPtIpoUpIzf9CQBFlMS4sz4i0S46V4Mi8=
=+ysJ
-----END PGP SIGNATURE-----

--=-c0jm8Kxk4TXRWPcuaVA9--
