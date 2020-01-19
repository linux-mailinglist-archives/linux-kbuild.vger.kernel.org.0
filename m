Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01C6141CA0
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Jan 2020 07:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgASGlP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Jan 2020 01:41:15 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47209 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbgASGlP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Jan 2020 01:41:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 480lYz0zN6z9sRR; Sun, 19 Jan 2020 17:41:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579416071;
        bh=ZJ/xYJ5wpESqE5uf0LWIWHInaiHGexmbonhCseCk2tg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BzcCdKt6wbcH1+xKyJK7QLsYAnnWX6jdRetXhTy3ZgIOF89Mh4HogbAzZ4j36xRng
         cKg1f5faC1ijMnw4VvGcfLeOceAc7JuZ1dLmp6kXQ3ME2tgT+fhCJgZphwD2qihhdp
         5w5Cb0UesKEUIycmZeKh/kz1DLVnFFdYDL1fXCc0=
Date:   Sun, 19 Jan 2020 16:39:16 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Message-ID: <20200119063916.GD54439@umbus>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/7F8UcOhwbEJvS7n"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--/7F8UcOhwbEJvS7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
> On Fri, Jan 17, 2020 at 6:26 AM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
> > > Hi David
> > >
> > > On 1/16/20 1:57 AM, David Gibson wrote:
> > > > On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrote:
> > > > > This commit adds the possibility to add build information for a D=
TB.
> > > > > Build information can be: build date, DTS version, "who built the=
 DTB"
> > > > > (same kind of information that we get in Linux with the Linux ban=
ner).
> > > > >
> > > > > To do this, an extra option "-B" using an information file as arg=
ument
> > > > > has been added. If this option is used, input device tree is appe=
nded with
> > > > > a new string property "Build-info". This property is built with i=
nformation
> > > > > found in information file given as argument. This file has to be =
generated
> > > > > by user and shouldn't exceed 256 bytes.
> > > > >
> > > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> > > >
> > > > At the very least, this patch of the series will need to be sent to
> > > > upstream dtc first.
> > >
> > > Ok sorry. I thought that sending all the series would give more
> > > information.
> >
> > That's fair enough, but in order to merge, you'll need to post against
> > upstream dtc.
> >
> > > > I'm also not terribly clear on what you're trying to accomplish her=
e,
> > > > and why it's useful.
> > >
> > > Let's take Kernel boot at example (but could be extend to other DTB "=
users"
> > > like U-Boot). When Linux kernel booting we get a log that gives useful
> > > information about kernel image: source version, build date, people wh=
o built
> > > the kernel image, compiler version. This information is useful for de=
bug and
> > > support. The aim is to get same kind of information but for the DTB.
> > >
> > > > Since you're doing this specifically for use with dtbs built in the
> > > > kernel build, could you just use a:
> > > >     Build-info =3D /incbin/ "build-info.txt";
> > > > in each of the in-kernel .dts files?
> > >
> > > My first idea was to not modify all existing .dts files. Adding an ex=
tra
> > > option in dtc is (for me) the softer way to do it. I mean, compile
> > > information should come through compiler without modify .dts files ou=
tside
> > > from dtc. In this way it will be easy to everybody using dtc (inside =
our
> > > outside Linux tree) to add dtb build info (even if they don't how to =
write a
> > > dts file).
> >
> > But you're not really having this information coming from the
> > compiler.  Instead you're adding a compiler option that just force
> > includes another file into the generated tree, and it's up to your
> > build scripts to put something useful into that file.
> >
> > I don't really see that as preferable to modifying the .dts files.
> >
> > I also dislike the fact that the option as proposed is much more
> > general than the name suggests, but also very similar too, but much
> > more specific than the existing /incbin/ option.
> >
> > What might be better would be to have a dtc option which force appends
> > an extra .dts to the mail .dts compiled.  You can then put an overlay
> > template in that file, something like:
> >
> > &{/} {
> >         linux,build-info =3D /incbin/ "build-info.txt;
> > }
>=20
> I like this suggestion either as an include another dts file or an
> overlay.

Sorry, to be clear what I'm talking about here is just including
another dts file, and using the compile-type overlay syntax.  This is
not the same as .dtbo style runtime overlays (though the final result
is about the same in this case).

> The latter could be useful as a way to maintain current dtb
> files while splitting the source files into base and overlay dts
> files.
>=20
> But no, let's not prepend this with 'linux'. It's not a property
> specific for Linux to consume.

It's not really about who consumes it.  It's about defining a
namespace for the new property to exist in, since it's not part of a
relevant standard (if we wanted to make it such, we should pin down
what goes in there with much more precision).

This is specific to files built in the Linux tree, hence my suggestion
of "linux", whoever ends up consuming them.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/7F8UcOhwbEJvS7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4j+ZEACgkQbDjKyiDZ
s5IzcA/+IyEwTDYdDd6VKWlGKJQEhbs/IyFPI3YP75Tdtkb9dwd/Q71XD+NmmY1u
8+4df67hhQGyaD3IJuPjLWIJEFnYm/X89l1a2P4tbz0EQ+pQGzSFE16Z/IR1NCE0
9zeYqOkrm2my7jTZHMUyunFbnTu1tSxjNQ6tHHITOWMJUjIYqimacFa3Fb6FFreo
aAh4c2vOvla8qrCYN582f7aSTkFkLiy3Ifom0WtWz1YIqtaiUnWBTTozULZCRlQN
Y/MQJ8yA64eIAO/WXbOFVFWIStWt7p/kASGEHotkrI3+JnKxxPD0vdmhjOfe6e1k
FnVWFXrKWhDlbGY7F4epUUxMQPJZFizbH7YrnEPfE8ojvXkALxVJNc0Rj8C/2CGD
nc42tciqKGUlKCqt3Z/sBwjX5SsEPeK/7edxMo99MVxXGxt8LcVQSapVWKjGwiKH
WiupM00CdLuNbgffsogfTtMpHBbwsgnn6G9r9HCs24Vul58hRXOj7MbfEgylb6Rz
fisW47lTYGZSneIrjnJI4yw8zcey0WdYjz24hsIaWqxwpowIhs4E714O7Q8xLMSj
XBPeFU1iGMUusjlKA491LNKmrJ9ovKvZ3zUsIfqktgKIHLQ3H2BPf69H93OpYefr
7uPBk8TSrzpUVo/Sua+Z3KQorYyDcqcpqCZkdZWMSnjIf1AB0JA=
=yRUO
-----END PGP SIGNATURE-----

--/7F8UcOhwbEJvS7n--
