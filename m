Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2A4AFD5D
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2019 15:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfIKNEk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 09:04:40 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57388 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727302AbfIKNEk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 09:04:40 -0400
Received: from [148.69.85.38] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1i82IW-0005VU-7D; Wed, 11 Sep 2019 14:04:36 +0100
Received: from ben by deadeye with local (Exim 4.92.1)
        (envelope-from <ben@decadent.org.uk>)
        id 1i82IU-0004cj-LP; Wed, 11 Sep 2019 14:04:34 +0100
Message-ID: <21a058586badfd42df46d94d539aae08658cde5b.camel@decadent.org.uk>
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible
 builds
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        ab@php.net
Date:   Wed, 11 Sep 2019 14:04:29 +0100
In-Reply-To: <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
         <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-QTdYwm36GNbQ//qlVjyL"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 148.69.85.38
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-QTdYwm36GNbQ//qlVjyL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-11 at 21:17 +0900, Masahiro Yamada wrote:
> Hi Ben,
>=20
>=20
> Thanks for this.
> Please let me add some comments.
>=20
>=20
> On Wed, Sep 11, 2019 at 8:54 PM Ben Hutchings <ben@decadent.org.uk> wrote=
:
[...]
> > +Absolute filenames
> > +------------------
> > +
> > +When the kernel is built out-of-tree, debug information may include
> > +absolute filenames for the source files.  The ``__FILE__`` macro may
> > +also expand to an absolute filename.  This must be overridden by
> > +including `prefix-map options`_ in the `KCFLAGS`_ variable.
>=20
> Do you mean -fmacro-prefix-map ?

No, I mean -ffile-prefix-map or the older -fdebug-prefix-map.

> If so, it is already taken care of by the top Makefile.
> If you use GCC 8 or newer, it is automatically added to
> KBUILD_CFLAGS.

Ah, that's helpful.  So, I suppose I should just mention
-fdebug-prefix-map here and warn that __FILE__ will still be a proble
if using older compiler versions.

> > +Generated files in source packages
> > +----------------------------------
> > +
> > +The build processes for some programs under the ``tools/``
> > +subdirectory do not completely support out-of-tree builds.  This may
> > +cause source packages built using e.g. ``make rpm-pkg`` to include
> > +generated files and so be unreproducible.  It may be necessary to
> > +clean the source tree completely (``make mrproper`` or
> > +``git clean -d -f -x``) before building a source package.
>=20
> Currently, the source package building does not support
> out-of-tree build anyway.

Yes, I realise that.

> 'make O=3Dfoo rpm-pkg' fails with an error message.
>=20
> Building in a pristine source will solve the issue.
[...]

The issue I'm thinking about is that an out-of-tree build, prior to the
package build, *should* leave the source pristine and sometimes does
not.

For Debian's official kernel packages, we build a binary package of the
upstream source, and at some times this has unexpectedly included some=20
generated files.  I believe a similar issue would affect the upstream
package scripts.

Ben.

--=20
Ben Hutchings
The obvious mathematical breakthrough [to break modern encryption]
would be development of an easy way to factor large prime numbers.
                                                           - Bill Gates


--=-QTdYwm36GNbQ//qlVjyL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl148N4ACgkQ57/I7JWG
EQmehxAAmj7AUQ/OZVK3DAa0/jDsYlo2jdkXwZTDFhKxve70PBWXXpjSwGHakyGz
+ox4OkloGUpK3/gLGhihZUal+3U3vxdvS4NjuBB8s6Ka/E+p/PnVBToXJEI8GOg7
PRfNFwEcfjIjgsJ50ZT40ijU+f6yD5AdBxnJRQHhFAkJhJTiH0sGKA1J9qPnrJkk
NQ9mLgf7XlrjeSkdtKbUt5GhgNETq9L+GWA3z7kQczQw/c3Mn80/ca3rAeXwNfV8
fq96hueX18CPOjcSl62kg3KXhW0RkRovR/hhr4Fwt9OPKFd6HU9GfyF3iri8GJXi
SHvs/Bzh/UlJuTMf5RXBaGru/fNRcsZBFjWUjdb3eG1qM1aZ9iYvXQoaRnAyfjn+
DszzW27icgt4G212KuPuuGAhAD7JVuGOLBkOW4iNX1onO3sJObCDfyx1mNZqusei
85Eu/mTg4QmHHVhYDjuKIRMMz8QuU/tkvMc/k/zXfLVA/jNCpM9G9wyoFR6exlE/
kcZP8jh33Nxcg1CRkieMSp7Bb+NRH+vt3J5SjYHaUZIwJfT440t9dL1ajIdUNqMR
4/fUqw+Z3thFl+VY6xR7jgjoJP/SrMf4MuMpHMuHQ+LTxrJcS3wM9dpw8tQFQgsP
DISBccLrwpPNRYKYfq9L7AOyBuzMJGTS2Z6SK5CRpX8GR1HVts0=
=8pIU
-----END PGP SIGNATURE-----

--=-QTdYwm36GNbQ//qlVjyL--
