Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDF12A0CEB
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Oct 2020 18:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgJ3R5r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Oct 2020 13:57:47 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:45826 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725922AbgJ3R5r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Oct 2020 13:57:47 -0400
X-Greylist: delayed 2588 seconds by postgrey-1.27 at vger.kernel.org; Fri, 30 Oct 2020 13:57:47 EDT
Received: from [192.168.4.242] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1kYXz3-0005F1-TH; Fri, 30 Oct 2020 17:14:37 +0000
Received: from ben by deadeye with local (Exim 4.94)
        (envelope-from <ben@decadent.org.uk>)
        id 1kYXz3-000y9q-CV; Fri, 30 Oct 2020 17:14:37 +0000
Message-ID: <12abc099c30681e88107bb468ba1795f197f02f8.camel@decadent.org.uk>
Subject: Re: [PATCH] builddeb: Fix build on non-Debian/Ubuntu distros
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Petr Vorel <petr.vorel@gmail.com>, linux-kbuild@vger.kernel.org
Cc:     Guillem Jover <guillem@hadrons.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 30 Oct 2020 17:14:32 +0000
In-Reply-To: <20201030165607.290612-1-petr.vorel@gmail.com>
References: <20201030165607.290612-1-petr.vorel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-GjghaIPeX2ZZ3tcMSHlW"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.168.4.242
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-GjghaIPeX2ZZ3tcMSHlW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-10-30 at 17:56 +0100, Petr Vorel wrote:
> This fixes make bindeb-pkg for RPM based distros, which don't have
> dpkg-dev (and thus not /usr/bin/dpkg-buildpackage), which sets
> $DEB_RULES_REQUIRES_ROOT.
>=20
> Fixes: 3e8541803624 ("builddeb: Enable rootless builds")

This doesn't seem to fix a bug, and in fact it would introduce one.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[...]
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -37,7 +37,7 @@ create_package() {
>                 | xargs -r0 md5sum > DEBIAN/md5sums"
> =20
>         # Fix ownership and permissions
> -       if [ "$DEB_RULES_REQUIRES_ROOT" =3D "no" ]; then
> +       if [ -z "$DEB_RULES_REQUIRES_ROOT" -o "$DEB_RULES_REQUIRES_ROOT" =
=3D "no" ]; then
>                 dpkg_deb_opts=3D"--root-owner-group"
>         else
>                 chown -R root:root "$pdir"

This is the wrong default behaviour; it will cause a regression with
older versions of dpkg that don't support this option.

If you invoke this script directly and do not use dpkg-buildpackage
(which I don't think is really supported anyway) then you must either
do so as root or use fakeroot (as dpkg-buildpackage does by default).

Ben.

--=20
Ben Hutchings
The first rule of tautology club is the first rule of tautology club.


--=-GjghaIPeX2ZZ3tcMSHlW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl+cSfkACgkQ57/I7JWG
EQn1XhAAn0pBMvr3Tm5pd2fmYwwy9gwWQ2j+cWQYv5KJm+obKThy4+yFglKlRc50
cOa+2GGdxA+In48SNBjRUsw7jYPFLUS+to6L0lnrWvi5nNNq/DOEoxTwh1u348YY
KXviYb5DNXTNf1i378EzFcXMV/Vb93RuqqTrQV+Ha3U6HXMTPthTbdSwkdbaBl+9
gFahbmSMDWBn+4qT/KRWpUEcilhRlv76iLeA7v0MvDydLTYzMdy0QLvdNe3u6Etb
q/2olK+igEUweHShAqfCyRdou8Qdw51rZQwzPH7x4fDTUiVfs5hH2xNKAx/OSyAq
OGhdPSn8ALJ7sHZpbJr8M467fTqlO5ddslRtTRiiWg55kCJFmV2eJRXh+eoV0V7x
wpdEK52MVlqwcJeylt07uRe6tikPnUZvYaoZy3gj4dKhQVhQvJQoEsx+oogNSv8+
VuYCdkqX5bwD+K0X9bRVK3nbi+BbBT30NVKLLztOo2ViHTktCf3sWCPaZ7ZdzX6z
7ViVkQTWZNkXjElMpopHz1dQeKe9cacX/eIZG1620564Fdiev/VYkFnRyktAE0HB
hJRMaKTvKVkeL8lNJZW5urn7oA53H2FpDR9sTLZOq2DAcuRjbvCqno20dSDp0/sw
mpTMCaF2d0RuHS0ePXi4BqOaEKM88t82OkTRy0TqtnoKtWZyS3Q=
=/V1E
-----END PGP SIGNATURE-----

--=-GjghaIPeX2ZZ3tcMSHlW--
