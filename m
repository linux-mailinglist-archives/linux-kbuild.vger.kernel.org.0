Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3D7169A60
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Feb 2020 23:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgBWWBZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 Feb 2020 17:01:25 -0500
Received: from ozlabs.org ([203.11.71.1]:35501 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgBWWBZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Feb 2020 17:01:25 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 48QfKZ3rhhz9sR4; Mon, 24 Feb 2020 09:01:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1582495282;
        bh=offKD/tuqL/DSDa2v25Jc0IM7BprqmjMf6LCeNiIZbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LwL/iptBEMCarj+f3q8Os3B2TZTfsaK9r0ubJJ13bhD5UKGSewVyTATKgRL6ybTw6
         TZ6r3y3evxFJ2T7GHqr77PmlzWNZc74Q2JYKrMRZpOZtmz7niIl6Ti9OpZmYSBayjZ
         TBuqRBuLuno8PmSPypNw+iutg3ImuBykUAEZ9CMI=
Date:   Mon, 24 Feb 2020 08:59:36 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, sjg@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org,
        Ian Lepore <ian@freebsd.org>
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
Message-ID: <20200223215936.GB1751@umbus.fritz.box>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-2-alexandre.torgue@st.com>
 <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 11:52:34AM -0600, Frank Rowand wrote:
> On 2/21/20 10:14 AM, Alexandre Torgue wrote:
> > This commit adds a new script to create a file (in dts file directory) =
with
> > some information (date, Linux version, user). This file could then be u=
sed
> > to populate "build-info" property in every dts file that would use this
> > build information:
> >=20
> > Example:
> >=20
> > / {
> > 	...
> > 	build-info =3D /incbin/("dtb-build.txt");
>=20
> s/.txt/.dtsi/

I don't think that makes sense.  This is an /incbin/ not an /include/
so the text file is *not* dts information.

> and same wherever the file name is used.
>=20
>=20
> > 	...
> > };
> >=20
> > Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> >=20
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index bae62549e3d2..a5af84ef4ffc 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -246,6 +246,7 @@ quiet_cmd_gzip =3D GZIP    $@
> >  # DTC
> >  # --------------------------------------------------------------------=
-------
> >  DTC ?=3D $(objtree)/scripts/dtc/dtc
> > +DTB_GEN_INFO ?=3D $(objtree)/scripts/gen_dtb_build_info.sh
> > =20
> >  # Disable noisy checks by default
> >  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> > @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
> > =20
> >  quiet_cmd_dtc =3D DTC     $@
> >  cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
> > +	$(DTB_GEN_INFO) $(src) ; \
> >  	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< =
; \
> >  	$(DTC) -O $(2) -o $@ -b 0 \
> >  		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> > diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info=
=2Esh
> > new file mode 100755
> > index 000000000000..0cd8bd98e410
> > --- /dev/null
> > +++ b/scripts/gen_dtb_build_info.sh
> > @@ -0,0 +1,10 @@
> > +#!/bin/bash
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +set -o nounset
> > +
> > +DTB_DIR=3D$1
> > +DTB_COMPILE_BY=3D$(whoami | sed 's/\\/\\\\/')
> > +DTB_INFO=3D"From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\=
0"
>=20
> I would remove the filler words "From", "by", "the", and the trailing
> period ('.').
>=20
> <bikeshed>
> You might consider using a format more like the Linux
> kernel version line, which puts parenthesis around the
> compiled by info.
> </bikeshed>
>=20
> -Frank
>=20
> > +
> > +printf "$DTB_INFO" > "$DTB_DIR/dtb-build.txt"
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5S9cMACgkQbDjKyiDZ
s5L+uA/+Ijah4iblw6QeplPNZ0j5P3vPdvAPrnFrpiCY6faeGB25BQpakMQSxYd7
AUVpiyiW7OO5Re1VP7+A7M3RIeR2ZN8Yl7dQsb2Evpbs4cB4LyRfmZCLUebEkUuY
lOSjFCIwLrM7InrWM2cS3Xim0i5jC9m1SB7TKAG+VQCT+ahF3rHSfoqKDADyoEov
M6zVCPvPCnw8UF8JsciD3vn1ehO8MFNWDPxJmVl+FqXGn/woSD6CXqMRFOhkMILe
qIThs0v1fGeKAKZgNnzfblAT8MHwOWIEq/uCDKktxsEFXe0Htb5m7O+jblm2jAyE
XviDax1jJkzAn8LcJaguDZhekE5AbG4cimW2NV9Y4qYDqcKrUKxJlZxNC+7rAypV
nlry93xwydvEHISHa2AB7zHOM0BTYlRBOYQRmFrwZO1uc9h4MV2K1P5LAtxRki/h
gXnKoekE8bkqs6/9P0bTRQ9PpyKs/sYZpUcZmzezuwkopRjHLv1ohlJj/x6dZb9w
X+FkHVdFs0cREO9nGTUeCvm/rfe+ntpnJzG9iBkOwIj1XVZQQu19CXBYoSAP5uX+
vsxZH83B//jEMEj/oMYgdFbKxZqxoaFwJxBMRZSHFEHAQ9h+wCQS/tXmHqXvPTWJ
ds7GSr5+Cv03afxPFENdyX69B1a3YFGT2qDKgln3YuRVs8Ww5no=
=v1oI
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
