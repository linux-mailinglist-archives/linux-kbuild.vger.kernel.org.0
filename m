Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C51913976C
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2020 18:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgAMRVw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jan 2020 12:21:52 -0500
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:48996 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727331AbgAMRVw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jan 2020 12:21:52 -0500
Received: from [167.98.27.226] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1ir3PQ-0003Wh-7G; Mon, 13 Jan 2020 17:21:48 +0000
Received: from ben by deadeye with local (Exim 4.93)
        (envelope-from <ben@decadent.org.uk>)
        id 1ir3PP-0006Hu-53; Mon, 13 Jan 2020 17:21:47 +0000
Message-ID: <7da5750c40489dcb6cd8eef0307ee8d8df2e134e.camel@decadent.org.uk>
Subject: Re: [PATCH 4/7] builddeb: avoid invoking sub-shells where possible
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Riku Voipio <riku.voipio@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Date:   Mon, 13 Jan 2020 17:21:42 +0000
In-Reply-To: <20200113064841.3946-4-masahiroy@kernel.org>
References: <20200113064841.3946-1-masahiroy@kernel.org>
         <20200113064841.3946-4-masahiroy@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-5xTkXbuWkzmw9uzJDDqI"
User-Agent: Evolution 3.34.1-2+b1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-5xTkXbuWkzmw9uzJDDqI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-01-13 at 15:48 +0900, Masahiro Yamada wrote:
[...]
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
> +	find arch/$SRCARCH -name include -type f

This command is wrong.  We currently find all files under all
directories named "include" under arch/$SRCARCH.  (arc, arm and xtensa
have some per-platform include directories in additional to the per-
architecture include directory.)

> +
> +	if [ -d arch/$SRCARCH/scripts ]; then
> +		find arch/$SRCARCH/scripts -type f
> +	fi
> +) > debian/hdrsrcfiles
> +
> +{
> +	if is_enabled CONFIG_STACK_VALIDATION; then
> +		find tools/objtool -type f -executable
> +	fi
> +
> +	find arch/$SRCARCH/include Module.symvers include scripts -type f
> +
> +	if is_enabled CONFIG_GCC_PLUGINS; then
> +		find scripts/gcc-plugins -name \*.so -o -name gcc-common.h
> +	fi

This is reverting patch 1.

Ben.

> +} > debian/hdrobjfiles
> +
>  destdir=3D$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"
> -(cd $srctree; tar -c -f - -T -) < debian/hdrsrcfiles | (cd $destdir; tar=
 -xf -)
> -tar -c -f - -T - < debian/hdrobjfiles | (cd $destdir; tar -xf -)
> +tar -c -f - -C $srctree -T debian/hdrsrcfiles | tar -xf - -C $destdir
> +tar -c -f - -T debian/hdrobjfiles | tar -xf - -C $destdir
>  cp $KCONFIG_CONFIG $destdir/.config # copy .config manually to be where =
it's expected to be
>  ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/module=
s/$version/build"
>  rm -f debian/hdrsrcfiles debian/hdrobjfiles
--=20
Ben Hutchings
Unix is many things to many people,
but it's never been everything to anybody.



--=-5xTkXbuWkzmw9uzJDDqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl4cpyYACgkQ57/I7JWG
EQn8RA/+MvFILc/TXIuAD7Q0354QjqwAlnNjJfOYuXMF9FssZmeonWq1noeukziT
NARCC+pwcwfuI+ExMNZfNM4Ex82RPsUy2AaFfBCUsgkBmkgSEHw6G+LODkP1b6xz
DJewH4O0ZSI1hFktFGyPc85bBnFwD9JqM3FItJ5JkvTeWfo79MP+khFStlh7VfrM
eDn2GNy6RwkxDJO4x0rrIwycBZ27nB2ZVZccDiEmnLZ3jjX0T61nNj8t6yztK0OZ
onBGfUUW9Hlr3scxWqu3sJc52WJV9iZRy9nuNi3o7aA+dTDqCkm8AKrIpKq7P8QJ
le9A5O/BEXxuDQnXG7KkD/Ur2RFu6HK8L0wA6yS7ejfGoIIlg9iRwJM8NH1bXcu6
YwSyDvexYp26hD+DyFT+jsyQSlvegqBJj1Ii0mf79/cFggALAFuGzjuRSuv/W/Cw
z+Cav+a1DmsmE8aRqOLYJV+Z3ZUuuGh2UJa4o742jxn5bUZvr8kXysmQ7cQ/8xpd
q2sHNdgFOYCwAF5HbVx6KFDDw6EXcB64GGKhVpmX58ufVDEttKdNdn90mhb8hHS9
O6kn87ru8Kl+oJ4SMNeUVci34CF3JBggWFWOlqMDf96JVSqVcPC9n3tNGEONw//0
N+uh/C8MkKMyQ1x3v8bADQ2fhTulH7xcACXSCKEclyFFK09KMmI=
=4FCT
-----END PGP SIGNATURE-----

--=-5xTkXbuWkzmw9uzJDDqI--
