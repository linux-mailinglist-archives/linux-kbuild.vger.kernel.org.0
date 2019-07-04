Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D3F5F8E2
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 15:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfGDNKM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jul 2019 09:10:12 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:60892 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726791AbfGDNKM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jul 2019 09:10:12 -0400
Received: from [192.168.4.242] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1hj1V1-0006UL-4P; Thu, 04 Jul 2019 14:10:07 +0100
Received: from ben by deadeye with local (Exim 4.92)
        (envelope-from <ben@decadent.org.uk>)
        id 1hj1V0-000833-U3; Thu, 04 Jul 2019 14:10:06 +0100
Message-ID: <0ff3202ced2b501d6045157f1c7b50810c0571e5.camel@decadent.org.uk>
Subject: Re: [PATCH] builddeb: generate multi-arch friendly linux-libc-dev
 package
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Cedric Hombourger <Cedric_Hombourger@mentor.com>
Cc:     isar-users@googlegroups.com,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Riku Voipio <riku.voipio@linaro.org>
Date:   Thu, 04 Jul 2019 14:10:02 +0100
In-Reply-To: <CAK7LNASCmZyS11WkUWXLXVWgk-WU5JV=MMw=S6pXAzMhkVJ40Q@mail.gmail.com>
References: <1560752096-1323-1-git-send-email-Cedric_Hombourger@mentor.com>
         <CAK7LNASCmZyS11WkUWXLXVWgk-WU5JV=MMw=S6pXAzMhkVJ40Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-BZKpguClIp8ilfm1QdtD"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.168.4.242
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-BZKpguClIp8ilfm1QdtD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-04 at 09:43 +0900, Masahiro Yamada wrote:
> CCed a couple of people.
>=20
> On Mon, Jun 17, 2019 at 3:15 PM Cedric Hombourger
> <Cedric_Hombourger@mentor.com> wrote:
> > Debian-based distributions place libc header files in a machine
> > specific directory (/usr/include/<libc-machine>) instead of
> > /usr/include/asm to support installation of the linux-libc-dev
> > package from multiple architectures. Move headers installed by
> > "make headers_install" accordingly.
> >=20
> > Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
> > Reviewed-by: Henning Schild <henning.schild@siemens.com>
> > ---
> >  scripts/package/builddeb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index b03dd56a4782..8f7afb3a84e9 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -132,6 +132,11 @@ fi
> >  if [ "$ARCH" !=3D "um" ]; then
> >         $MAKE -f $srctree/Makefile headers_check
> >         $MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH=3D"=
$libc_headers_dir/usr"
> > +       # move asm headers to /usr/include/<libc-machine>/asm to match =
the structure
> > +       # used by Debian-based distros (to support multi-arch)
> > +       libc_mach=3D$($CC -dumpmachine)
> > +       mkdir $libc_headers_dir/usr/include/$libc_mach
> > +       mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/incl=
ude/$libc_mach/

This is wrong; the multiarch architecture tuple used in directory names
does not necessarily match the compiler's architecture tuple.  Firstly,
if you use a biarch compiler the compiler is only going to tell you the
default architecture.  Secondly, on i386 the minimum processor is i586
or i686 but the multiarch architecture tuple is still "i386-linux-gnu"
(and there might be other cases like this).

So, the correct command is:

    dpkg-architecture -a$debarch -qDEB_HOST_MULTIARCH

> >  fi
> >=20
> >  # Install the maintainer scripts
>=20
> I am not sure but,
> I just worried about the backward compatibility...
> Was this previously broken?

Debian has had multiarch support since Debian 7 "wheezy", and older
versions are no longer supported.  So I think this change is fine to
make unconditionally.

The current linux-libc-dev packages build by "make deb-pkg" are
"broken" in that multiple architectures can't be co-installed with each
other, whereas this genrally can be done with the linux-libc-dev
packages provided by Debian-based distributions.  However, co-
installation is only allowed if the version strings and contents of
common files in the packages are identical, and I don't know whether
that's going to be true for those generated by "make deb-pkg".

> I guess debian is using own control file
> instead of the one in upstream kernel.

We maintain multiple configurations, a meaningful changelog, tools
packages, etc.  So "make deb-pkg" is not used for official kernel
packages but we recommend it for custom kernels.

> So, this is almost a matter for developers, I think.
>=20
> How did debian-base distros managed this before,
> and will this introduce no breakage?

On the Debian side a similar change was made in Debian 7 "wheezy".  In
Ubuntu I believe it was done earlier as they modified dpkg to support
multiarch before us.

> Ben,
> Could you comment on this?

Ben.

--=20
Ben Hutchings
Quantity is no substitute for quality, but it's the only one we've got.

--=-BZKpguClIp8ilfm1QdtD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl0d+qoACgkQ57/I7JWG
EQlj5w/6A7Dpm2f0EbQF+Zdnfmf9gTCl8GGkRIuZ5I6YNr4t4SwUAptrZs8R34Zj
RHemXnL7F/H1Baw3nAtbO9GE+76vatgwtdkhRC6B7fwNxPhUOgkGnbN8sZ+67qmu
yuJ4Ap2IGagPh6D21APIF4s4XzEA7rD0B1kJUO0H7VKeztM58zuUnPiDmmXg4/YZ
whgnLfJyUDDyny6HUdFJ2lvTeVOFYN0MWSKwqyR8mEDoAoCzcKX+OyFbs+Fu3Lys
CgGjip3wpIshqibwUxVUzqq+qLTmfCuTsT7Vd/s/aBf3bD/8qNphL8zO2AsLrHdP
RlwXzRZ9Sq+GajvHGcJqwdz+azF/oJfOCse138+HrK5lmt2RSxr9f1Zgqf9P/Pve
eJy51IWmIKvEBiIx3bAATfwu8g61LlOepHZZooOT0zSQ5RZmoyj/WOPQRAyO6kyq
tu/CVG0sbrOl0kEUEdfTFnCJKPGyK9KlTYdF6oXVXsaojIBsqM8IT6KrYQ7s08M2
di8T9P/2+a1Q/d7it0ngt5itBJ3ZBos3yG7oYl+HKxPXP1ITj0h71jUyIC8nCFjb
gDzEPHr+0Pp6GNsVG6lfBO9aLJ9QHHj8v28QNSWjuhq2GtF1rEfwefADbtJuZnag
bA/So3i8ExEK4yxZ/PJqwKiMJoP0M/3Qs0jyd4uA7rLGuBv8HDM=
=xBtL
-----END PGP SIGNATURE-----

--=-BZKpguClIp8ilfm1QdtD--
