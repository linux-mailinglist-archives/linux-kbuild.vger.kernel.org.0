Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDFE2F9A29
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 07:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732775AbhARGwJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 01:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732766AbhARGwC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 01:52:02 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186CBC061573;
        Sun, 17 Jan 2021 22:51:22 -0800 (PST)
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4DK2WD1NNpz9sVr; Mon, 18 Jan 2021 17:51:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1610952680;
        bh=tFRtJs4KpfzYYQiSppq+uMOWBK9UNy+oy9n7m2ppFAk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=airdCw+oqeR3m2SovBJ0HyRwGvsMkiKzog6p+vgl3lkEV/GGpZCuSIHC1K4p7qY/y
         MMysyIh+mc1m9NUt2ho+RQsbxL44066DptV0xseJubxPEArDoV49xh0u6t6AKjqz8H
         gDYC1OozVeORnahJwz/Sy+DAz6btol/3AjoW0xh0=
Date:   Mon, 18 Jan 2021 17:30:25 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Message-ID: <20210118063025.GI2089552@yekko.fritz.box>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com>
 <20210114050309.wokrhw4o3cjxj5uo@vireshk-i7>
 <CAL_JsqJ=jxBo2JsjNTcBnV_8OrGjUc4ZQEpdVWsfFwWb9YzyFQ@mail.gmail.com>
 <20210115054450.ab2xrohlxg7nnzpn@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="itqfrb9Qq3wY07cp"
Content-Disposition: inline
In-Reply-To: <20210115054450.ab2xrohlxg7nnzpn@vireshk-i7>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--itqfrb9Qq3wY07cp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 11:14:50AM +0530, Viresh Kumar wrote:
> +David,
>=20
> On 14-01-21, 09:01, Rob Herring wrote:
> > On Wed, Jan 13, 2021 at 11:03 PM Viresh Kumar <viresh.kumar@linaro.org>=
 wrote:
> > >
> > > On 11-01-21, 09:46, Rob Herring wrote:
> > > > On Fri, Jan 8, 2021 at 2:41 AM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
> > > > >
> > > > > Now that fdtoverlay is part of the kernel build, start using it t=
o test
> > > > > the unitest overlays we have by applying them statically.
> > > >
> > > > Nice idea.
> > > >
> > > > > The file overlay_base.dtb have symbols of its own and we need to =
apply
> > > > > overlay.dtb to overlay_base.dtb alone first to make it work, whic=
h gives
> > > > > us intermediate-overlay.dtb file.
> > > >
> > > > Okay? If restructuring things helps we should do that. Frank?
> > >
> > > Frank, do we want to do something about it ? Maybe make overlay_base.=
dts an dtsi
> > > and include it from testcases.dts like the other ones ?
> >=20
> > No, because overlay_base.dts is an overlay dt.

So.. I was confused for a bit here, because the overlay_base.dts
you're discussing is the one in the kernel tree, not the one in the
dtc tree.

The kernel file is confusing to me.  It has the /plugin/ tag which
should be used for overlays, but the rest of the file looks like a
base tree rather than an overlay.  There's even a comment saying "Base
device tree that overlays will be applied against".  But it goes on to
talk about __fixups__ and __local__fixups__ which will never be
generated for a based tree.

Oh.. and then there's terminology confusion.  dtc has had compile time
resolved overlays for a very long time.  Those are usually .dtsi
files, and should generally not have /plugin/.

More recent is the support for run-time overlays - .dtbo output files,
which are usually generated from a .dts with /plugin/.  They usually
should *not* have a "/ { ... } " stanza, since that indicates the base
portion of the tree.

> What property of a file makes it an overlay ? Just the presence of
> /plugin/; ?

Yes and no.  Generally that's how it should work , but it looks to me
like the presence of /plugin/ there is just wrong.  /plugin/ basically
just activates some extra dtc features, though, so it is possible to
"manually" construct a valid overlay without it.

> David, we are talking about the overlay base[1] file here. The
> fdtoverlay tool
> fails to apply it to testcases.dts file (in the same directory) because n=
one of
> its nodes have the __overlay__ label and the dtc routine overlay_merge() =
[2]
> skips them intentionally.

testcases.dts also has /plugin/ and again, it's not really clear if
that's right.

The point of /plugin/ is that it will automatically generate the
__overlay__ subnodes from dtc's &label { ... } or &{/path} { ... }
syntax, so you wouldn't expect to see __overlay__ in the source.

> > I think we need an
> > empty, minimal base.dtb to apply overlay_base.dtbo to.
>=20
> One way out is adding an (almost-empty) testcase-data-2 in testcases.dtb,=
 that
> will make it work.
>=20
> > And then fdtoverlay needs a fix to apply overlays to the root node?
>=20
> It isn't just root node I think, but any node for which the __overlay__ l=
abel
> isn't there.
>=20
> So this can make it all work if everyone is fine with it:
>=20
> diff --git a/drivers/of/unittest-data/overlay_base.dts b/drivers/of/unitt=
est-data/overlay_base.dts
> index 99ab9d12d00b..59172c4c9e5a 100644
> --- a/drivers/of/unittest-data/overlay_base.dts
> +++ b/drivers/of/unittest-data/overlay_base.dts
> @@ -11,8 +11,7 @@
>   * dtc will create nodes "/__symbols__" and "/__local_fixups__".
>   */
> =20
> -/ {
> -       testcase-data-2 {
> +       &overlay_base {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <1>;
> =20
> @@ -89,5 +88,3 @@ retail_1: vending@50000 {
>                 };
> =20
>         };
> -};
> -
> diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest=
-data/testcases.dts
> index a85b5e1c381a..539dc7d9eddc 100644
> --- a/drivers/of/unittest-data/testcases.dts
> +++ b/drivers/of/unittest-data/testcases.dts
> @@ -11,6 +11,11 @@ node-remove {
>                         };
>                 };
>         };
> +
> +       overlay_base: testcase-data-2 {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +       };
>=20
> -------------------------8<-------------------------
>=20
> And then we can do this to the Makefile over my changes.
>=20
> -------------------------8<-------------------------
>=20
> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data=
/Makefile
> index 9f3eb30b78f1..8cc23311b778 100644
> --- a/drivers/of/unittest-data/Makefile
> +++ b/drivers/of/unittest-data/Makefile
> @@ -41,7 +41,6 @@ DTC_FLAGS_testcases +=3D -Wno-interrupts_property
> =20
>  # Apply all overlays (except overlay_bad_* as they are not supposed to a=
pply and
>  # fail build) statically with fdtoverlay
> -intermediate-overlay   :=3D overlay.dtb
>  master                 :=3D overlay_0.dtb overlay_1.dtb overlay_2.dtb \
>                            overlay_3.dtb overlay_4.dtb overlay_5.dtb \
>                            overlay_6.dtb overlay_7.dtb overlay_8.dtb \
> @@ -50,15 +49,12 @@ master                      :=3D overlay_0.dtb overla=
y_1.dtb overlay_2.dtb \
>                            overlay_gpio_01.dtb overlay_gpio_02a.dtb \
>                            overlay_gpio_02b.dtb overlay_gpio_03.dtb \
>                            overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
> -                          intermediate-overlay.dtb
> +                          overlay_base.dtb overlay.dtb
> =20
>  quiet_cmd_fdtoverlay =3D fdtoverlay $@
>        cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
> =20
> -$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(o=
bj)/,$(intermediate-overlay))
> -       $(call if_changed,fdtoverlay)
> -
>  $(obj)/master.dtb: $(obj)/testcases.dtb $(addprefix $(obj)/,$(master))
>         $(call if_changed,fdtoverlay)
> =20
> -always-$(CONFIG_OF_OVERLAY) +=3D intermediate-overlay.dtb master.dtb
> +always-$(CONFIG_OF_OVERLAY) +=3D master.dtb
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--itqfrb9Qq3wY07cp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAFKv8ACgkQbDjKyiDZ
s5Ls2w//V0qovioMz01yEeSmT1WLEPFLjd6Cn/P45TwBdX50BRK1S7cRU1NczQKK
GUgnnXtvyWvNGG0MWEiEa645OReQ7V5wMOErvHjfW5ZfO9ioRHNsmBGNqqPtwSmt
LJSPR5leGeNb986Y/ZoWJyfYNovb+2g1qJafpVsYRC2qvSVxKfpJRCkc2p1cqR7Z
WYXaktarEkPYpKDUb+yEXrV9Br2mgrO3rMTFico/aKXH5ktzk8PxdI/2+1d1WnVj
h6/mzaFyEXmSrPi+FBJChuMN2Rj/PNsDFKw7myE9aDs6wjbzdvyVQjRyOmSKQNj1
m2zS41GgqPPssLThSN0UVhTrUHQLPOqVBApMpXj0HwMxxTU+zymrHzuYEQIxQi44
mNL8pnCHZbsREs4nm0MGHpOvkYR+S5d9zoclqWADALwSBhBW00pT0AoshxC12XsL
0L/19Q1McCeqOOF8w1NvRg2SgrAPHyoD2SwdJuoRF34Zbyjopm5qMOzGC5sYgURZ
jOhOM+K2WWzBN/BBANnT8rnfUAAqg4eeiqoMMcj1XQRk5keA+QwRY58l2K4pgEom
imD1O5xiFUb/qjWZPX+C0k6+BOG79IQO/iPW6nsa/dPc4TAPdd46Gt8VthiwlSjJ
46rZyCghdoZTkPVA42kmYPd/obdAP0YY9t0E9dNipNTOpwHQrgU=
=DUTA
-----END PGP SIGNATURE-----

--itqfrb9Qq3wY07cp--
