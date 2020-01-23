Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E70146143
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jan 2020 06:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgAWFNZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jan 2020 00:13:25 -0500
Received: from ozlabs.org ([203.11.71.1]:53647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgAWFNZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jan 2020 00:13:25 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4839Qp1wQBz9sSL; Thu, 23 Jan 2020 16:13:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1579756402;
        bh=EndBGkPODenb5XpA0SDzQL0qO6AOtb8zZmjrL1qSQkk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Urb2nN2jTgJpLIgiBgErMo0isifQ5rrFdnx6dTAXMhpVjfzi4umWLayu+/LtEAEoa
         3XsZlrL0ItA+MlR1Kk4KuW42yuqMXcyXdCWYDkvIgdXj5WFQLKooRPRBVTYgMayQno
         a6402Djr5CHoQFc5NIgLYX0Gn8I5xQ1w1vk14rMU=
Date:   Thu, 23 Jan 2020 16:13:16 +1100
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
Message-ID: <20200123051316.GP2347@umbus.fritz.box>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <20200119063916.GD54439@umbus>
 <CAL_Jsq+-O0cpw9YtVGAjFWstu-=uXVgK0ccgyRj+bjR93gPriw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b5sSX5qSQrSInIHt"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+-O0cpw9YtVGAjFWstu-=uXVgK0ccgyRj+bjR93gPriw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--b5sSX5qSQrSInIHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 09:59:44AM -0600, Rob Herring wrote:
> On Sun, Jan 19, 2020 at 12:41 AM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
> > > On Fri, Jan 17, 2020 at 6:26 AM David Gibson
> > > <david@gibson.dropbear.id.au> wrote:
> > > >
> > > > On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
> > > > > Hi David
> > > > >
> > > > > On 1/16/20 1:57 AM, David Gibson wrote:
> > > > > > On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrot=
e:
> > > > > > > This commit adds the possibility to add build information for=
 a DTB.
> > > > > > > Build information can be: build date, DTS version, "who built=
 the DTB"
> > > > > > > (same kind of information that we get in Linux with the Linux=
 banner).
> > > > > > >
> > > > > > > To do this, an extra option "-B" using an information file as=
 argument
> > > > > > > has been added. If this option is used, input device tree is =
appended with
> > > > > > > a new string property "Build-info". This property is built wi=
th information
> > > > > > > found in information file given as argument. This file has to=
 be generated
> > > > > > > by user and shouldn't exceed 256 bytes.
> > > > > > >
> > > > > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> > > > > >
> > > > > > At the very least, this patch of the series will need to be sen=
t to
> > > > > > upstream dtc first.
> > > > >
> > > > > Ok sorry. I thought that sending all the series would give more
> > > > > information.
> > > >
> > > > That's fair enough, but in order to merge, you'll need to post agai=
nst
> > > > upstream dtc.
> > > >
> > > > > > I'm also not terribly clear on what you're trying to accomplish=
 here,
> > > > > > and why it's useful.
> > > > >
> > > > > Let's take Kernel boot at example (but could be extend to other D=
TB "users"
> > > > > like U-Boot). When Linux kernel booting we get a log that gives u=
seful
> > > > > information about kernel image: source version, build date, peopl=
e who built
> > > > > the kernel image, compiler version. This information is useful fo=
r debug and
> > > > > support. The aim is to get same kind of information but for the D=
TB.
> > > > >
> > > > > > Since you're doing this specifically for use with dtbs built in=
 the
> > > > > > kernel build, could you just use a:
> > > > > >     Build-info =3D /incbin/ "build-info.txt";
> > > > > > in each of the in-kernel .dts files?
> > > > >
> > > > > My first idea was to not modify all existing .dts files. Adding a=
n extra
> > > > > option in dtc is (for me) the softer way to do it. I mean, compile
> > > > > information should come through compiler without modify .dts file=
s outside
> > > > > from dtc. In this way it will be easy to everybody using dtc (ins=
ide our
> > > > > outside Linux tree) to add dtb build info (even if they don't how=
 to write a
> > > > > dts file).
> > > >
> > > > But you're not really having this information coming from the
> > > > compiler.  Instead you're adding a compiler option that just force
> > > > includes another file into the generated tree, and it's up to your
> > > > build scripts to put something useful into that file.
> > > >
> > > > I don't really see that as preferable to modifying the .dts files.
> > > >
> > > > I also dislike the fact that the option as proposed is much more
> > > > general than the name suggests, but also very similar too, but much
> > > > more specific than the existing /incbin/ option.
> > > >
> > > > What might be better would be to have a dtc option which force appe=
nds
> > > > an extra .dts to the mail .dts compiled.  You can then put an overl=
ay
> > > > template in that file, something like:
> > > >
> > > > &{/} {
> > > >         linux,build-info =3D /incbin/ "build-info.txt;
> > > > }
> > >
> > > I like this suggestion either as an include another dts file or an
> > > overlay.
> >
> > Sorry, to be clear what I'm talking about here is just including
> > another dts file, and using the compile-type overlay syntax.  This is
> > not the same as .dtbo style runtime overlays (though the final result
> > is about the same in this case).
>=20
> Ah, okay. That's probably easier to implement.
>=20
> > > The latter could be useful as a way to maintain current dtb
> > > files while splitting the source files into base and overlay dts
> > > files.
> > >
> > > But no, let's not prepend this with 'linux'. It's not a property
> > > specific for Linux to consume.
> >
> > It's not really about who consumes it.  It's about defining a
> > namespace for the new property to exist in, since it's not part of a
> > relevant standard (if we wanted to make it such, we should pin down
> > what goes in there with much more precision).
>=20
> I can't think of any cases of the 'linux' prefix not being about who
> consumes it. And we often end up dropping 'linux' because it turns out
> to not be Linux specific. I don't care to see u-boot,build-info,
> freebsd,build-info, etc. when a given dtb can only have 1 of those.

But all other vendor prefixes are about who generated or specified the
information, not who consumes it, e.g. "ibm,XXX", "fsl,YYY", etc.

> My intent is this property name is added to the DT spec, but I don't
> agree we should define what's in it beyond a string. It is information
> that is useful for humans identifying what the dtb was built from.
>=20
> Rob
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--b5sSX5qSQrSInIHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4pK2wACgkQbDjKyiDZ
s5LRthAAvnFwh1/QPJTb0Pk4hrdDgI4GYCc5H1CNQDjh9ROoEpnEJD2wOfkq7aGK
qt0MyXulz6qZDYfmK19gCU+FSP76kij4OfX9aqh0C9gpnMRrqu9Shye0mbFT5iwR
0DFHxmnwyc9xG6HGtVSi3i85yAOYOKubQ95uwgrj5jdXtONhCmYlnC6UeXd4ATDd
ykta/FyqAR7lLOJz+9Mdu6lsWoeqOoKe4RWr5fGnQ9PFviJtxr0HCYGpwwuZ4+tQ
sPzjBUZ8gJu5btg39Zok883IZi4iK148EpZH/9l+zlHfpMKzajx48cKrjgZO5Va4
Rp0f6NOm8jBQZQ2DnuvN3BDR0WjAcGtUpyczxIf7LEPuLGd3e+LiAVrT7esbx2qc
bi31Ci2IYed1YmtjfJLmaPmqtBU4/5f/IiYFD87c5JHJjTO33gp0eIELOG9FeQFF
Yrgm1QknHecNd3BODgk8CObZnYGISy7d4hu1JY3/BMe1v2LCUZfahlyPIHF5qipK
p98NCmbkzOjoE3C6J5RU7ewALKxauLJq1n1eUMBk8nR+TdsaxEIGkDVRA2upK0+U
EgygPrWIu7LFp5cxMNEmZVXIHdzW+ZcCfOBxaO9Bp7zea5HTCLXS1HSFQbrc86wj
nmcZjyWAqxtuxgjPOKdhEKLo0gO0c5jCnWQvecghxdNR7aFO/hs=
=bV2o
-----END PGP SIGNATURE-----

--b5sSX5qSQrSInIHt--
