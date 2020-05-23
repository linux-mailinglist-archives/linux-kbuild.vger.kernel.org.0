Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451AE1DF3C9
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2020 03:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387427AbgEWBOd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 21:14:33 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50148 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387418AbgEWBOd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 21:14:33 -0400
Received: from [192.168.4.242] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1jcIk9-0002ik-PR; Sat, 23 May 2020 02:14:29 +0100
Received: from ben by deadeye with local (Exim 4.93)
        (envelope-from <ben@decadent.org.uk>)
        id 1jcIk9-007iMt-DS; Sat, 23 May 2020 02:14:29 +0100
Message-ID: <235c4776ddc5cbb94a45643098a50a20b14e530e.camel@decadent.org.uk>
Subject: Re: [PATCH] make builddeb invoke calls to linux-update-symlink
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>, Jason Self <j@jxself.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Date:   Sat, 23 May 2020 02:14:24 +0100
In-Reply-To: <CAK7LNAScfa9bqc3ViVX-+u3uJU=Zv_oWXCWdN6O_N_fw=AdQ5w@mail.gmail.com>
References: <20200510040616.2207-1-j@jxself.org>
         <CAK7LNAScfa9bqc3ViVX-+u3uJU=Zv_oWXCWdN6O_N_fw=AdQ5w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-DfmREO/+C/iuCFeOJvzV"
User-Agent: Evolution 3.36.2-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.168.4.242
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-DfmREO/+C/iuCFeOJvzV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-05-23 at 02:01 +0900, Masahiro Yamada wrote:
> Hi Ben,
>=20
> On Sun, May 10, 2020 at 1:06 PM Jason Self <j@jxself.org> wrote:
> > The official Debian kernel packages,
>=20
> I'd like to consult you.
> Does this patch look OK?

No, it doesn't.

> > in addition to running the
> > scripts in /etc/kernel, also runs linux-update-symlinks via the
> > postinst and postrm scripts. This maintains the /vmlinuz and
> > /initrd.img (if it uses an initramfs) symlinks. This change makes the
> > builddeb script generate those same calls.
> >=20
> > Signed-off-by: Jason Self <j@jxself.org>
> > ---
> >  scripts/package/builddeb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index 6df3c9f8b2da..f34c11c63ede 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -195,6 +195,14 @@ export DEB_MAINT_PARAMS=3D"\$*"
> >  # Tell initramfs builder whether it's wanted
> >  export INITRD=3D$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
> >=20
> > +$(case $script in
> > +postinst)
> > +        echo linux-update-symlinks install $version $installed_image_p=
ath
> > +        ;;
> > +postrm)
> > +        echo linux-update-symlinks remove $version $installed_image_pa=
th
> > +esac)

This doesn't handle upgrades properly.  The extra conditions in the
maintainer scripts for official Debian packages really are needed.

It's also not correct to assume that linux-update-symlinks is always
available.  If the generated linux-image package depends on "linux-base=20
(>=3D 4.1~)" then the postinst script can use it unconditionally.=20
However, the postrm script will always have to check whether it is
present.

Ben.

> >  test -d $debhookdir/$script.d && run-parts --arg=3D"$version" --arg=3D=
"/$installed_image_path" $debhookdir/$script.d
> >  exit 0
> >  EOF
> > --
> > 2.26.0
> >=20
>=20
>=20
--=20
Ben Hutchings
Every program is either trivial or else contains at least one bug



--=-DfmREO/+C/iuCFeOJvzV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl7IePAACgkQ57/I7JWG
EQmfwRAAm1jTB/oeOV+2t5vKf/0hDcKLgNRJOlgGo2mBndu4DScqOHag+o4QY3cE
GOsEG9VGnFzpZSW2y8gjCiAwvwIFu9nv3GW0IQxOGP7V1LO7xdb/+5jsIRPSfIyQ
dfGIeCV+fNFoe2cD5dvV5Kw7Ux7X5GQbdAfc8ZNbbT7VioklGvXs6tzjgphd7Jt0
cd8n0NNFd5mpO3IXRIwfaiff8RHEtzIB9n7W3EOOkx6XSdUFxu1MXOvAjtRS1RHJ
Ec8QAgCON5VzZFAO2bS6v+yWTdckjCksYXK9Tm+p8mQaKOStasyXbSBLYGJMaUQE
+aw171Vr44vuEIIX/3G62CooOZ1NL1lowKvs/50S95Wqb1zxuX+ND8rxe/qWJrDA
OS/40URnTehUW8rJh4Rb2faE+oA0gZ/DhKU5pfoxeuv7TIER38ZoTJwjLiUKJdzu
tXoXZktfNIYDCA/A3w37+F1mEvIQMy+hYnVU50LJpG6a7/olXAuPasU9g76t+nW5
FfZdMMsonOv3NEybMLCTw17wZddsKwo9OBudDGeQK1pebVJB1V6LRmfkilArWlEF
UHQVC9U0rU2b6ah6SfyCvlpyDJavp71jHHkAIPPqjcOe7jQ5yLHVatNkuLGVQCsV
7IPHsvyUCoRG67feIITRoEgzv2p7XymSaWD1jUSu8GBv5DSzeeY=
=XArB
-----END PGP SIGNATURE-----

--=-DfmREO/+C/iuCFeOJvzV--
