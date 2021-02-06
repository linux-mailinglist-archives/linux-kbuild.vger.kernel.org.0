Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83088311C09
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 08:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhBFHxk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 02:53:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhBFHxj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 02:53:39 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A708DC06174A;
        Fri,  5 Feb 2021 23:52:59 -0800 (PST)
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4DXkzV3ggQz9sWH; Sat,  6 Feb 2021 18:52:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612597974;
        bh=DD7vsTmY2XV3VEcnTX/rJ823OPEo7EuM80koFXdOOzE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TWHESU5yJGlIoWBuCoaLgbaxLsAkTFRz3zf+wOaMNXlgXL7dwpW49o38R9e8nmekI
         Bl2ARMpnn2H6002ma3rs3ZG4ixjJ96ddkI5zcCAS9z5pFX9Ww6nrPu9YbcPVRroxfE
         PAra8uJ/zvGcH3fFNQ1JR/XI3FF7dTMT4ZsxzfDg=
Date:   Sat, 6 Feb 2021 18:28:06 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210206072806.GB61463@yekko.fritz.box>
References: <cover.1611904394.git.viresh.kumar@linaro.org>
 <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
 <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline
In-Reply-To: <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 02:55:07PM +0530, Viresh Kumar wrote:
> On 05-02-21, 10:02, Geert Uytterhoeven wrote:
> > Hi Viresh,
> >=20
> > Thanks for your patch
> > (which I only noticed because it appeared in dt-rh/for-next ;-)
> >=20
> > On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> =
wrote:
> > > Add support for building DT overlays (%.dtbo). The overlay's source f=
ile
> > > will have the usual extension, i.e. .dts, though the blob will have
> >=20
> > Why use .dts and not .dtso for overlays?
> > Because you originally (until v5) had a single rule for building .dtb
> > and .dtbo files?
>=20
> I am fine with doing that as well if Rob and David agree to it. Rob
> did suggest that at one point but we didn't do much about it later on
> for some reason.
>=20
> FWIW, this will also require a change in the DTC compiler.

Not really.  It would need a change to automatically recognize that
extension, but you can easily work around that by explicitly giving
the -I option to specify the input type.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAeRQYACgkQbDjKyiDZ
s5JkLhAAzH+0414Nc/d8Sv+xcg26psqIUt4Row7B2poP7C0p8FlgVkgTC3PnY6U9
3M0biNABYtcur8bMbj9h4DndMfpzjvreUMLIuXVHCigw0N6z28NHrDTbnjyCH8WG
IPmbkLEGUrjz+8qemir+YgxdepYEGUqHTp03IeL+jz8z6Hx/o0ywJpGs/bbkqz7/
sHnXHD9tRlVMs3VV2RlmKYa2oXFmMuFUHPIy1ZFDp9D8BgLSIEuO5I4gOtVPm2DN
+fLHBPclQ6NxLsRXGd3Wnw2A0g/fA+arWph1B6sDq+izrlQfT3PEbwRjCRaFM0H0
SWzs5Wk/92esT2ZvzysDzcJrZZ1Z1j1+Hs6q1k7XCwDwN53R8b+MJvm0NQ+LRpox
UUf4EnTkwyfd5FKyikIbud0SHnKSWfyA89E64yioXavoVKyE0yx+cW6jlEFX9QIj
WOu4mCN8SP6s2DQSY9lWQ+rJAJXZkdJExkyyNzyp+Gp5ha4sW6GkuFD7UsaeuqTe
q/yZYGOMLQLFwu6AxNoRdvBwhoe3W2RZvr0niVBsPNf4qTxFUMqptsXRf9GaD+hO
rwpmwVTEpmAZbDxSjKtSrRU3GJFqW1bLRq+XXhNAivuxQ8JGJycMBy49Dm7+DxLF
NnPUFRfsc0Rbswm+9ulAXxIrrlMsLOVQsBR9sFTyIcKEGAoITN0=
=gdcX
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
