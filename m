Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25DB9AFD7C
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2019 15:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbfIKNPA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 09:15:00 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57486 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727302AbfIKNPA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 09:15:00 -0400
Received: from [148.69.85.38] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1i82SW-00064R-40; Wed, 11 Sep 2019 14:14:56 +0100
Received: from ben by deadeye with local (Exim 4.92.1)
        (envelope-from <ben@decadent.org.uk>)
        id 1i82SV-0004pm-BQ; Wed, 11 Sep 2019 14:14:55 +0100
Message-ID: <0c7c99639df61572aeb37c461df4cca101f78d3a.camel@decadent.org.uk>
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible
 builds
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        ab@php.net
Date:   Wed, 11 Sep 2019 14:14:50 +0100
In-Reply-To: <21a058586badfd42df46d94d539aae08658cde5b.camel@decadent.org.uk>
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
         <CAK7LNAT-p0NX8JQ+R221L2SkRgiV7=-TheBVaUtNp4vmkG0OYQ@mail.gmail.com>
         <21a058586badfd42df46d94d539aae08658cde5b.camel@decadent.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-C5Aouu8r1Nq+h74YLRpu"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 148.69.85.38
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-C5Aouu8r1Nq+h74YLRpu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-11 at 14:04 +0100, Ben Hutchings wrote:
> On Wed, 2019-09-11 at 21:17 +0900, Masahiro Yamada wrote:
> > Hi Ben,
> >=20
> >=20
> > Thanks for this.
> > Please let me add some comments.
> >=20
> >=20
> > On Wed, Sep 11, 2019 at 8:54 PM Ben Hutchings <ben@decadent.org.uk> wro=
te:
> [...]
> > > +Absolute filenames
> > > +------------------
> > > +
> > > +When the kernel is built out-of-tree, debug information may include
> > > +absolute filenames for the source files.  The ``__FILE__`` macro may
> > > +also expand to an absolute filename.  This must be overridden by
> > > +including `prefix-map options`_ in the `KCFLAGS`_ variable.
> >=20
> > Do you mean -fmacro-prefix-map ?
>=20
> No, I mean -ffile-prefix-map or the older -fdebug-prefix-map.
>=20
> > If so, it is already taken care of by the top Makefile.
> > If you use GCC 8 or newer, it is automatically added to
> > KBUILD_CFLAGS.
>=20
> Ah, that's helpful.  So, I suppose I should just mention
> -fdebug-prefix-map here and warn that __FILE__ will still be a proble
> if using older compiler versions.

My revised text for this section is:

---
When the kernel is built out-of-tree, debug information may include
absolute filenames for the source files.  This must be overridden by
including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.

Depending on the compiler used, the ``__FILE__`` macro may also expand
to an absolute filename in an out-of-tree build.  Kbuild automatically
uses the ``-fmacro-prefix-map`` option to prevent this, if it is
supported.

The Reproducible Builds web site has more information about these
`prefix-map options`_.
---

Does that look OK to you?

> > > +Generated files in source packages
> > > +----------------------------------
> > > +
> > > +The build processes for some programs under the ``tools/``
> > > +subdirectory do not completely support out-of-tree builds.  This may
> > > +cause source packages built using e.g. ``make rpm-pkg`` to include
> > > +generated files and so be unreproducible.  It may be necessary to
> > > +clean the source tree completely (``make mrproper`` or
> > > +``git clean -d -f -x``) before building a source package.
> >=20
> > Currently, the source package building does not support
> > out-of-tree build anyway.
>=20
> Yes, I realise that.
>=20
> > 'make O=3Dfoo rpm-pkg' fails with an error message.
> >=20
> > Building in a pristine source will solve the issue.
> [...]
>=20
> The issue I'm thinking about is that an out-of-tree build, prior to the
> package build, *should* leave the source pristine and sometimes does
> not.
>=20
> For Debian's official kernel packages, we build a binary package of the
> upstream source, and at some times this has unexpectedly included some=
=20
> generated files.  I believe a similar issue would affect the upstream
> package scripts.

My revised text for this section is:

---
The build processes for some programs under the ``tools/``
subdirectory do not completely support out-of-tree builds.  This may
cause a later source package build using e.g. ``make rpm-pkg`` to
include generated files.  You should ensure the source tree is
pristine by running ``make mrproper`` or ``git clean -d -f -x`` before
building a source package.
---

Ben.

--=20
Ben Hutchings
The obvious mathematical breakthrough [to break modern encryption]
would be development of an easy way to factor large prime numbers.
                                                           - Bill Gates



--=-C5Aouu8r1Nq+h74YLRpu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl1480oACgkQ57/I7JWG
EQmFLw//b3L8fYb9OG8ydAE10gzk9eukvpK9GjkONAzrxhOWfFF81M7nH5ODcKKn
6P2xo0yWdrb30VrOA5zALy7nftuSXdu18HmNaEycorashZ5i3SpCFZcKZLo4jUo5
DiCFYXoxPAs95vMBseRdqT/OzF9HoRtKiipKgWZLPUamELed9pZ1SJJ7MWisgqU+
QzjnXB7gofSai6dw7/bumVRWAOAnAYfTil+8uzX782s5tQ9llH/3Xxi1EH+lc/pr
xWgcmM09NO/nLKTCLQxHFLT4Lsy32+J3Tl2jDNk7ZiwcWfVOpUPrIhfhwaTK19z+
OdqbDXizgFXRUrkYlpMo2OdpbTk+Ib6Q7x7FEHAN6InH738zZ6ODILj3Rf/H4r03
mnSXMvkom42QMzsmnq2PAHxAw+6puCZnqjJHkW7SQQGqlVbh32pmBpHo+0XpF7/5
2cMRsHBZzNy4uJHuty3n5xxpXs3lhOmoV0MBek1d/qDkwiowCo8MmkbZzuMwrgQF
cWStVI646WybzarFlnR1uKca9xfQlaO7wgDGSZIbj13odrG7SLQS8QN2ATwSuiT9
sgj/j643lbaI73/hOPn1DYvM74ZiYHsUJx5e9vi1PfzK4ISOyJK+gA8eG0/E47i2
2UaY5SpoVdra/z76wqOib4dm19xjA0XrH4etrVGHq5yP0jqWntY=
=TJRO
-----END PGP SIGNATURE-----

--=-C5Aouu8r1Nq+h74YLRpu--
