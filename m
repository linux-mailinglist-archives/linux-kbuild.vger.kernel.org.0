Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C6B2FFCF7
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 07:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbhAVGuF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 01:50:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43065 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbhAVGt5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 01:49:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4DMVGz2TNGz9sVF; Fri, 22 Jan 2021 17:49:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1611298155;
        bh=oQR2S4ROGJ/SaMWvZTeUe6GZ+oSDsT/AQoYniKUVQZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o9eBv5tgJMz7YuomxAo5VrRMT4+M67ZLPz9Z+u2qab/N5f29uTDXdbaFaNPTuvVdr
         MHBasgVyKS7MxTYUY2Apik9qKvgGpVQP7qoff/8JliSuj1DTQNHnlwq6BX5XoJXIck
         lFLAl/Fdm1JaEhLbY9/y4oTtGNx7ERxxuZiDSFYc=
Date:   Fri, 22 Jan 2021 17:34:55 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
Message-ID: <20210122063455.GE4400@yekko.fritz.box>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
 <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
 <20210120051740.yph4v7zldvs7szdz@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Content-Disposition: inline
In-Reply-To: <20210120051740.yph4v7zldvs7szdz@vireshk-i7>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 10:47:40AM +0530, Viresh Kumar wrote:
> +David.
>=20
> On 19-01-21, 11:12, Frank Rowand wrote:
> > On 1/12/21 2:28 AM, Viresh Kumar wrote:
> > > We will start building overlays for platforms soon in the kernel and
> > > would need fdtoverlay tool going forward. Lets start fetching and
> > > building it.
> > >=20
> > > While at it, also remove fdtdump.c file, which isn't used by the kern=
el.
> > >=20
> > > V4:
> > > - Don't fetch and build fdtdump.c
> > > - Remove fdtdump.c
> > >=20
> > > Viresh Kumar (3):
> > >   scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
> > >   scripts: dtc: Build fdtoverlay tool
> > >   scripts: dtc: Remove the unused fdtdump.c file
> > >=20
> > >  scripts/dtc/Makefile             |   6 +-
> > >  scripts/dtc/fdtdump.c            | 163 -----------------------------=
--
> > >  scripts/dtc/update-dtc-source.sh |   6 +-
> > >  3 files changed, 8 insertions(+), 167 deletions(-)
> > >  delete mode 100644 scripts/dtc/fdtdump.c
> > >=20
> >=20
> > My first inclination was to accept fdtoverlay, as is, from the upstream
> > project.
> >=20
> > But my experiences debugging use of fdtoverlay against the existing
> > unittest overlay files has me very wary of accepting fdtoverlay in
> > it's current form.
> >=20
> > As an exmple, adding an overlay that fails to reply results in the
> > following build messages:
> >=20
> >    linux--5.11-rc> make zImage
> >    make[1]: Entering directory '/local/frowand_nobackup/src/git_linus/b=
uild/dragon_linus_5.11-rc'
> >      GEN     Makefile
> >      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scrip=
ts/checksyscalls.sh
> >      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scrip=
ts/atomic/check-atomics.sh
> >      CHK     include/generated/compile.h
> >      FDTOVERLAY drivers/of/unittest-data/static_test.dtb
> >=20
> >    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTF=
OUND
> >    make[4]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/d=
rivers/of/unittest-data/Makefile:96: drivers/of/unittest-data/static_test.d=
tb] Error 1
> >    make[3]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/s=
cripts/Makefile.build:496: drivers/of/unittest-data] Error 2
> >    make[2]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/s=
cripts/Makefile.build:496: drivers/of] Error 2
> >    make[1]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/M=
akefile:1805: drivers] Error 2
> >    make[1]: Leaving directory '/local/frowand_nobackup/src/git_linus/bu=
ild/dragon_linus_5.11-rc'
> >    make: *** [Makefile:185: __sub-make] Error 2
> >=20
> >=20
> > The specific error message (copied from above) is:
> >=20
> >    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTF=
OUND
> >=20
> > which is cryptic and does not even point to the location in the overlay=
 that
> > is problematic.  If you look at the source of fdtoverlay / libfdt, you =
will
> > find that FDT_ERR_NOTFOUND may be generated in one of many places.
> >=20
> > I do _not_ want to do a full review of fdtoverlay, but I think that it =
is
> > reasonable to request enhancing fdtoverlay in the parent project to gen=
erate
> > usable error messages before enabling fdtoverlay in the Linux kernel tr=
ee.

That's... actually much harder than it sounds.  fdtoverlay is
basically a trivial wrapper around the fdt_overlay_apply() function in
libfdt.  Matching the conventions of the rest of the library, really
it's only way to report errors is a single error code.

Returning richer errors is not an easy problem in a C library,
especially one designed to be usable in embedded systems, without an
allocator or much else available.

Of course it would be possible to write a friendly command line tool
specifically for applying overlays, which could give better errors.
fdtoverlay as it stands isn't really that - it was pretty much written
just to invoke fdt_overlay_apply() in testcases.

> > fdtoverlay in it's current form adds a potential maintenance burden to =
me
> > (as the overlay maintainer).  I now have the experience of how difficul=
t it
> > was to debug the use of fdtoverlay in the context of the proposed patch=
 to
> > use it with the devicetree unittest overlay .dtb files.
> >=20
> > -Frank
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAKcg8ACgkQbDjKyiDZ
s5K7OQ/+IyVyWMa/f4/HD38/TgC7EzN+DMeEtHZK8A1z93dhGsJ2GTyOkU0Cx1yI
PsrLdCR5lxoo3zJkMys+Qe0gvPvfM++K3AQZ7UD70GmIgfE24RpbwUbbiZLJHTOR
e/bjllZjyc2PNcWjgbJNhCOop9uwg+Ff5iBfj/Opk4Kmms5U3ng5utRhXSf3y9yq
hUXQC1B3u3/C20qKAIM3DqAaLqChkK2BqQDm8dWQgcnWln3LtCrVUjyH2N+g3Pl3
8P8RofdUKJC5GhyMlPyZaFVsOZqp07K47A6nmzFyk7LuH8MnsJLpCsCtrO7hbL0S
t3LhqNd+EjsT2+xGNfSDTmi1gQwgpD5DHHGhcuXkr7NxcdbWbaLj+OMeuf44/c2q
q4h+ucL/Fc0gRSdme/xMcHSM/mPcHa20kaHrt9a6z/XKu5HnHka14fmMV4DssCqX
gIITEXmtIfxAXOhH3C0lTyWDxzw5Y/ez+KckKkDF25M/HL8t0WDJPa7MFQmGAnvl
f/GP9oFDakGtTtNcUXpXTfq4pKwPrDRQNq4teZKrjzjthZNoZYwqb+p6Rwn24NYb
jnIw9Xr7JVjR5iXoG2GL5+HhpLD9bouhdurfZMi9zeSU09UXuhze6wJZ0NdSuFqj
ngGc6yHLqoPfNCsHBKfhDkBXEh5WLiHsNqtZKs+xo3ZbehNWQhc=
=NJeB
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
