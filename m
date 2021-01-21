Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E433E2FE328
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 07:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbhAUGpK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 01:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbhAUGog (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 01:44:36 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83514C0613C1;
        Wed, 20 Jan 2021 22:43:56 -0800 (PST)
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4DLtCC2807z9sWg; Thu, 21 Jan 2021 17:43:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1611211431;
        bh=f/xtaWh7e4rADud+eV43gL9MZJQJ41Y2/cBit7jRpIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I/REnNaGaKdk+/b6ZmtFkTbr5jOK3tGbva5+dwrA7QkZ48I6wuyrm5KmlfxvPak39
         zzvWkjA3waR/CDX/f+zjzaNeD/2bvHn/IbZWLgzXEnlQBFc3UywuSEvWnJec6xNSOE
         deRsySiupsqu58XEfCUbX1ZlYs05QxYQ0sgeDOXc=
Date:   Thu, 21 Jan 2021 17:41:24 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        pantelis.antoniou@konsulko.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Message-ID: <20210121064124.GM5174@yekko.fritz.box>
References: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <20210119022154.2338781-1-frowand.list@gmail.com>
 <20210119080546.dzec3jatsz2662qs@vireshk-i7>
 <f7133d16-510b-f730-a43b-89edab08aabe@gmail.com>
 <20210120050606.b2m4jssh73wexybx@vireshk-i7>
 <95cfc497-3d12-fd46-6e42-2a77612236ea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bZ2MuwyI/0uB8yuJ"
Content-Disposition: inline
In-Reply-To: <95cfc497-3d12-fd46-6e42-2a77612236ea@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--bZ2MuwyI/0uB8yuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 11:00:17PM -0600, Frank Rowand wrote:
>=20
> +David
>=20
> so I don't have to repeat this in another thread
>=20
> On 1/19/21 11:06 PM, Viresh Kumar wrote:
> > On 19-01-21, 09:44, Frank Rowand wrote:
> >> No.  overlay_base.dts is intentionally compiled into a base FDT, not
> >> an overlay.  Unittest intentionally unflattens this FDT in early boot,
> >> in association with unflattening the system FDT.  One key intent
> >> behind this is to use the same memory allocation method that is
> >> used for the system FDT.
> >>
> >> Do not try to convert overlay_base.dts into an overlay.
> >=20
> > Okay, but why does it have /plugin/; specified in it then ?
>=20
> OK, so I sortof lied about overlay_base.dts not being an overlay.  It is
> a Frankenstein monster or a Schrodinger's dts/dtb.  It is not a normal
> object.  Nobody who is not looking at how it is abused inside unittest.c
> should be trying to touch it or understand it.

In that case, it absolutely should not be used as your standard base
dtb.

Note that overlays in general rely on particular details of the base
dtb they apply to - they'll need certain symbols and expect certain
paths to be there.  So applying random overlays to a "standard" base
dtb sounds destined to failure anyway.

Also, whatever they hell you're doing with testcases.dts sounds like a
terrible idea to begin with.

> unittest.c first unflattens overlay_base.dtb during early boot.  Then lat=
er
> it does some phandle resolution using the overlay metadata from overlay_b=
ase.
> Then it removes the overlay metadata from the in kernel devicetree data
> structure.  It is a hack, it is ugly, but it enables some overlay unit
> tests.
>=20
> Quit trying to change overlay_base.dts.
>=20
> In my suggested changes to the base patch I put overlay_base.dtb in the
> list of overlays for fdtoverlay to apply (apply_static_overlay in the
> Makefile) because overlay_base.dts is compiled as an overlay into
> overlay_base.dtb and it can be applied on top of the base tree
> testcases.dtb.  This gives a little bit more testcase data for
> fdtoverlay from an existing dtb.
>=20
> If you keep trying to change overlay_base.dts I will just tell you
> to remove overlay_base.dtb from apply_static_overlay, and then the
> test coverage will become smaller.  I do not see that as a good change.
>=20
> If you want more extensive testing of fdtoverlay, then create your
> own specific test cases from scratch and submit patches for them
> to the kernel or to the dtc compiler project.
>=20
> >=20
> > And shouldn't we create two separate dtb-s now, static_test.dtb and
> > static_overlay_test.dtb ? As fdtoverlay will not be able to merge it wi=
th
> > testcase.dtb anyway.
> >=20
> > Or maybe we can create another file static_overlay.dts (like testcases.=
dts)
> > which can include both testcases.dts and overlay_base.dts, and then we =
can
> > create static_test.dtb out of it ? That won't impact the runtime tests =
at all.
> >=20
>=20
> Stop trying to use all of the unittest .dts test data files.  It is conve=
nient
> that so many of them can be used in their current form.  That is goodness
> and nice leveraging.  Just ignore the .dts test data files that are not
> easily consumed by fdtoverlay.
>=20
> The email threads around the various versions of this patch series show h=
ow
> normal devicetree knowledgeable people look at the contents of some of the
> .dts test data files and think that they are incorrect.  That is because
> the way that unittest uses them is not normal.  Trying to modify one or t=
wo
> of the many unittest .dts test data files so that they are usable by both
> the static fdtoverlay and the run time unittest is not worth it.
>=20
> -Frank
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bZ2MuwyI/0uB8yuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAJIhQACgkQbDjKyiDZ
s5KQug//WNZC6if+14D8n0zTFBT4SyEOFDoTExrCjdJo9q5TfxwOAFKP0M9dEPPO
hd4F+sKIPR76qRuNpjCT0EmtUi28M4HeWN4yXA9saGh/7S5trpoRnvAhzvwvIUmM
m5TdwgU1F2kYpYMDMYBAzPVZoR7Hcuck/8qFtd69KhPNBXjqtP4GB4mb9vnnlKmc
vifyu+YyCoqmJ2qXYLAnFgyBfzLBTIzZwjRiBXSOuQT8G3F9ytZgS/Y2sztYVia9
VusSecQeYDViKV1WrwDPFrjMN4ZmqD4StSQyeoF3DlBkNmVCLqyTHAAqfwjhkOgG
u1KoCZBzxT0HGyNomqy4Ss5e05rbZ+q4E4tLt/22wUFZ8apwU3TBXg8tXHqjZDyO
ObdnPtZsFMWeMwxA2Qi5CwoqZIKpz6zmNrAz7srSVGBGzpUcWn7ZqUdcUh/ow5Sy
ucSGletYuaXhBwp2vgfoZqseShOtWBVqNZ8vhc205b4jTPgT8poHGqYwskdQx8mj
t2vS8Szt5e8HoPnSifU6gCH9KFWIFleTiuVRm7eJ8u/DBtc765Kgvdw56j5OsBV8
/FLSjx9Y/4bGoApF1/UqFjX/sK+7ngX8gSIKojFc6URDTokR6/2gNCTPt0sqI6XM
Q5K3x4s1S2xVKVuNPqci78TSvUEt3jkjb0jLqHdFx14SYMns7lM=
=GnG+
-----END PGP SIGNATURE-----

--bZ2MuwyI/0uB8yuJ--
