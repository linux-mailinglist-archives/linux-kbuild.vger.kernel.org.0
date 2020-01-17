Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 564831409B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 13:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgAQM0u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jan 2020 07:26:50 -0500
Received: from ozlabs.org ([203.11.71.1]:48903 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726812AbgAQM0t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 07:26:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 47zgKd6pB0z9sRR; Fri, 17 Jan 2020 23:26:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579264005;
        bh=kurz+DTGyHKCLIvcZzXDHOZM5UqyeQHKPspRA/gpp50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TKh3IrbQ1yepznLeAk1CcT3rhzHe3vmWKwn5CHGDbZGSnZjOTHAcU9RLfsarsrxcI
         XfLCeX1zS2KhCU3GeA29/mdbe6L1IRTa8TPIubPcGpbTjFZkAV1EncUmATkK/PoSYI
         ks4QUlFQDk+0W6JDU6EZ5mFNC2Q6DQgx3ZaNAevI=
Date:   Fri, 17 Jan 2020 19:09:37 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     robh+dt@kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, sjg@chromium.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org,
        Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Message-ID: <20200117090937.GU54439@umbus>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E75mJrUy8lRi9cGN"
Content-Disposition: inline
In-Reply-To: <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--E75mJrUy8lRi9cGN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
> Hi David
>=20
> On 1/16/20 1:57 AM, David Gibson wrote:
> > On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrote:
> > > This commit adds the possibility to add build information for a DTB.
> > > Build information can be: build date, DTS version, "who built the DTB"
> > > (same kind of information that we get in Linux with the Linux banner).
> > >=20
> > > To do this, an extra option "-B" using an information file as argument
> > > has been added. If this option is used, input device tree is appended=
 with
> > > a new string property "Build-info". This property is built with infor=
mation
> > > found in information file given as argument. This file has to be gene=
rated
> > > by user and shouldn't exceed 256 bytes.
> > >=20
> > > Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> >=20
> > At the very least, this patch of the series will need to be sent to
> > upstream dtc first.
>=20
> Ok sorry. I thought that sending all the series would give more
> information.

That's fair enough, but in order to merge, you'll need to post against
upstream dtc.

> > I'm also not terribly clear on what you're trying to accomplish here,
> > and why it's useful.
>=20
> Let's take Kernel boot at example (but could be extend to other DTB "user=
s"
> like U-Boot). When Linux kernel booting we get a log that gives useful
> information about kernel image: source version, build date, people who bu=
ilt
> the kernel image, compiler version. This information is useful for debug =
and
> support. The aim is to get same kind of information but for the DTB.
>=20
> > Since you're doing this specifically for use with dtbs built in the
> > kernel build, could you just use a:
> > 	Build-info =3D /incbin/ "build-info.txt";
> > in each of the in-kernel .dts files?
>=20
> My first idea was to not modify all existing .dts files. Adding an extra
> option in dtc is (for me) the softer way to do it. I mean, compile
> information should come through compiler without modify .dts files outside
> from dtc. In this way it will be easy to everybody using dtc (inside our
> outside Linux tree) to add dtb build info (even if they don't how to writ=
e a
> dts file).

But you're not really having this information coming from the
compiler.  Instead you're adding a compiler option that just force
includes another file into the generated tree, and it's up to your
build scripts to put something useful into that file.

I don't really see that as preferable to modifying the .dts files.

I also dislike the fact that the option as proposed is much more
general than the name suggests, but also very similar too, but much
more specific than the existing /incbin/ option.

What might be better would be to have a dtc option which force appends
an extra .dts to the mail .dts compiled.  You can then put an overlay
template in that file, something like:

&{/} {
	linux,build-info =3D /incbin/ "build-info.txt;
}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--E75mJrUy8lRi9cGN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4hec4ACgkQbDjKyiDZ
s5JBkBAAqIBfwpRffu5P/FrP1ByZCpvCoDk8mmoWaN0k75RnPYkHuEoyj3NkVzv4
mpJ0+e5m8yGrrMollgWKrUT3qojPVUYuu/ztkx9nspAa5M2pFiM4P1dLt4n/CVoA
qdw/cHhCI1yQ4ws22P5mcw+rdJBegrdJgJNr14VqAy8uZsU8ANoNkmVIkAZO78kY
41Og23xr20h2UDj4is4aUwKRs5n9eSDFv8DWruoQQxgXUkaGlAsJKeCLfRkmuJ81
UnHq6Zkil0ueCvTJSmekz6dV29ius+uoAKZFWp6qMzUmVe4+amR3y1M0dLYXZjhU
SkeudGQVEakWnnQ/3YXKD170eRnbBEFD/d0V377Ns6BOApI+YD77KRyMKw+fMoGB
pK0HAxHf/rFIGke5H+dRJ+yGikPFKUuCuEvBoOB1/nAtj6aSR/HXqzGed0RQUvc5
D6kvvILwsLry55n4IDsmI+AUzTvRJwcOTmQ47BGAKmwoNaJbNoO55uXzpR5euSjG
+yQKirwMsQKXSM3HOx6D+nHpMKxBxPCN0m8s1+5/mJeFvrL3II3jouko+tDsx84A
7rbEEmBil4ggTtv5LOPJCX6v2Ps8WbsWfiOAkP3JqlT+RaGKA8kOo7VrwLoZWprj
NmCxLe1tG5MP8UM7NJvbf0dMoV5/pdfYEp1AiSH5dhAgsunnGas=
=HQxc
-----END PGP SIGNATURE-----

--E75mJrUy8lRi9cGN--
