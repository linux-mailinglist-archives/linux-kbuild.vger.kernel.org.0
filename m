Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D26B9141C9D
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Jan 2020 07:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgASGlO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Jan 2020 01:41:14 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725895AbgASGlN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Jan 2020 01:41:13 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 480lYz1Lbfz9sRs; Sun, 19 Jan 2020 17:41:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579416071;
        bh=bXW8TlAw5ljP1KuFXsqAjJMreM+vJSvzWkAfts/6mZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wnz/GsAWtQSYcwLb3Z7NJJqVC3Keme+Ea2hmR44IG+OMyLS9wkNSlGmdTC4tMO0TM
         apqU8SzLFyQmDdTiDK2QawcnrbPq5dRpPWU306VwkPZ+ZWLbN9FrH+CCJmzBYI/KFS
         RYSNBemmnHK/sn2ATMVLXLO0WzFjqpNnKTNUHTKM=
Date:   Sun, 19 Jan 2020 16:40:45 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Message-ID: <20200119064045.GE54439@umbus>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <c78545d9-cd91-9b18-2b85-07ce5f87ca04@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YCGSkTKVt49j0xAo"
Content-Disposition: inline
In-Reply-To: <c78545d9-cd91-9b18-2b85-07ce5f87ca04@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--YCGSkTKVt49j0xAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2020 at 04:11:19PM +0100, Alexandre Torgue wrote:
> David, Rob,
>=20
> On 1/17/20 3:43 PM, Rob Herring wrote:
> > On Fri, Jan 17, 2020 at 6:26 AM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >=20
> > > On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
> > > > Hi David
> > > >=20
> > > > On 1/16/20 1:57 AM, David Gibson wrote:
> > > > > On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrote:
> > > > > > This commit adds the possibility to add build information for a=
 DTB.
> > > > > > Build information can be: build date, DTS version, "who built t=
he DTB"
> > > > > > (same kind of information that we get in Linux with the Linux b=
anner).
> > > > > >=20
> > > > > > To do this, an extra option "-B" using an information file as a=
rgument
> > > > > > has been added. If this option is used, input device tree is ap=
pended with
> > > > > > a new string property "Build-info". This property is built with=
 information
> > > > > > found in information file given as argument. This file has to b=
e generated
> > > > > > by user and shouldn't exceed 256 bytes.
> > > > > >=20
> > > > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> > > > >=20
> > > > > At the very least, this patch of the series will need to be sent =
to
> > > > > upstream dtc first.
> > > >=20
> > > > Ok sorry. I thought that sending all the series would give more
> > > > information.
> > >=20
> > > That's fair enough, but in order to merge, you'll need to post against
> > > upstream dtc.
>=20
> ok
>=20
> > >=20
> > > > > I'm also not terribly clear on what you're trying to accomplish h=
ere,
> > > > > and why it's useful.
> > > >=20
> > > > Let's take Kernel boot at example (but could be extend to other DTB=
 "users"
> > > > like U-Boot). When Linux kernel booting we get a log that gives use=
ful
> > > > information about kernel image: source version, build date, people =
who built
> > > > the kernel image, compiler version. This information is useful for =
debug and
> > > > support. The aim is to get same kind of information but for the DTB.
> > > >=20
> > > > > Since you're doing this specifically for use with dtbs built in t=
he
> > > > > kernel build, could you just use a:
> > > > >      Build-info =3D /incbin/ "build-info.txt";
> > > > > in each of the in-kernel .dts files?
> > > >=20
> > > > My first idea was to not modify all existing .dts files. Adding an =
extra
> > > > option in dtc is (for me) the softer way to do it. I mean, compile
> > > > information should come through compiler without modify .dts files =
outside
> > > > from dtc. In this way it will be easy to everybody using dtc (insid=
e our
> > > > outside Linux tree) to add dtb build info (even if they don't how t=
o write a
> > > > dts file).
> > >=20
> > > But you're not really having this information coming from the
> > > compiler.  Instead you're adding a compiler option that just force
> > > includes another file into the generated tree, and it's up to your
> > > build scripts to put something useful into that file.
> > >=20
> > > I don't really see that as preferable to modifying the .dts files.
>=20
> I agree. I took example on kernel version info. It doesn't come from gcc =
but
> from auto-generated file. I thought it was the easier way to process. But=
 I
> understand your concerns. As it is not generated by dtc itself, dtc should
> not be modified.
>=20
> > >=20
> > > I also dislike the fact that the option as proposed is much more
> > > general than the name suggests, but also very similar too, but much
> > > more specific than the existing /incbin/ option.
> > >=20
> > > What might be better would be to have a dtc option which force appends
> > > an extra .dts to the mail .dts compiled.  You can then put an overlay
> > > template in that file, something like:
> > >=20
> > > &{/} {
> > >          linux,build-info =3D /incbin/ "build-info.txt;
> > > }
> >=20
> > I like this suggestion either as an include another dts file or an
> > overlay. The latter could be useful as a way to maintain current dtb
> > files while splitting the source files into base and overlay dts
> > files.
>=20
> First suggestion will imply to modify an huge part of dts file (not a big
> modification but a lot :)).

I'm not exactly sure what you're meaning by the "first suggestion" here.

> Second one (dtbo) sounds good. In this case this dtso will be created from
> build-info.txt and applied when dtb is built. So no impacts on current dts
> file. I'm right ?

This is not a dtbo, it's using the compile time overlaying syntax.

=2Edtbo would be useless for this purpose, since the build information
would be detached from the built dtb.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YCGSkTKVt49j0xAo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4j+ewACgkQbDjKyiDZ
s5KsdQ/9E6rrP0hYsD5nX8o7IW6qgB6v2bR/F4ld0SIbu4JS/qY7CcSXcsX6GrCH
vU35wpmiII5j6u2bLp6gvO7ualE7A/2xxxX1HAv2ilam4WlfD61jQB2PooSdO0z1
16Dk5yBzQfgPHB/uws4l1vTZFTUmBAHMGYxYLH98vhGBvo0jm3pglSKKSqQtIEjn
UOktQWvRHigFDSfCMnVU1M2ZDHPiuYKAt+TnaAoY6Jabq8TuZLyRqHcXY4EVGgMT
eZfNDDuOQxzx6sr+3S8o9BkGTF/OSgOxAX/czmSC9VT+mF6jf+/mg+Rk0PefirPs
p+iwyvcSTHfq6YDjdrZaJ1h7dRO3qJyjjaBq185mc16QCx/BQo5/gHsoO3/9vnnP
NbMGN0ArIIIvPLqJq7lPWyvg+h72D3zfJfaz286H78gd325EbnqnqXXeWVTQEik3
imhp0ttc+3+724MXPwq+kfca9s/ytjtC2usMLSLe50vVsyCqJmhBuoTaLpmJwpHU
ZASML/WdL/EYYh0Ab9snx7orL8LtVjHjAzgkZAc3P9rFZHkqUctxpkBEzx6j7UTr
GwJkha4clJhCdxmscW8PeaGWZp0WNhDkgg9KJnZ8o3Atvbhb+auVuLHJCEfGKQ1v
qT400xmw5w1Dn5WRVs4KC+4oVvtsyoN3SWgWEuq0wF1OEvwezPY=
=JnME
-----END PGP SIGNATURE-----

--YCGSkTKVt49j0xAo--
