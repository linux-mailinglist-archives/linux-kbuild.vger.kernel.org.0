Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACB1392487
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 May 2021 03:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbhE0Btw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 21:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbhE0Btv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 21:49:51 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FB4C061574;
        Wed, 26 May 2021 18:48:19 -0700 (PDT)
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4Fr9gz19RXz9sWT; Thu, 27 May 2021 11:48:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1622080095;
        bh=CwwSYy2UGUpk5/noX5wIu1wnFlK2n3ugbgWR/pkz5/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=puTbF4lXnr/OZQ+wd+1RybWOhK5UVwIKESuARowdcYTxPehsIF5SfI7uyJp6Gy2Kh
         tftql9o2sU5Nhk1MsZrmvstb6R9GKJOQNEHAedxww8/MsbkxKogEzkIALgFPkbKoGz
         zJdol6qr5NmGvstJJ1CzmW2NX/UwiNK/y5eklLzM=
Date:   Thu, 27 May 2021 11:22:38 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
Message-ID: <YK70Xsl1oXeEQpWZ@yekko>
References: <20210324223713.1334666-1-frowand.list@gmail.com>
 <20210327174035.GA291160@robh.at.kernel.org>
 <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
 <CAMuHMdXpGKMi-xv6hZQmmEw0JO=Q0WuvUzwJ2v0O28Tx5uW+sg@mail.gmail.com>
 <d1aefaae-7b12-b5fb-4b97-7230bd52c1be@gmail.com>
 <20210526061144.yvoaurpz75a3bsjr@vireshk-i7>
 <f651e95b-feef-5c86-edba-d6008bc80b34@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="I6Aq5wk2HGQbsO2b"
Content-Disposition: inline
In-Reply-To: <f651e95b-feef-5c86-edba-d6008bc80b34@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--I6Aq5wk2HGQbsO2b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 04:21:48PM -0500, Frank Rowand wrote:
> On 5/26/21 1:11 AM, Viresh Kumar wrote:
> > On 22-04-21, 13:54, Frank Rowand wrote:
> >> On 4/22/21 3:44 AM, Geert Uytterhoeven wrote:
> >>> Hi Frank, Rob,
> >>>
> >>> On Mon, Mar 29, 2021 at 9:23 PM Frank Rowand <frowand.list@gmail.com>=
 wrote:
> >>>> On 3/27/21 12:40 PM, Rob Herring wrote:
> >>>>> On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wr=
ote:
> >>>>>> From: Frank Rowand <frank.rowand@sony.com>
> >>>>>>
> >>>>>> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
> >>>>>> source file.
> >>>>>>
> >>>>>> Rename unittest .dts overlay source files to use .dtso suffix.
> >>>>>
> >>>>> I'm pretty lukewarm on .dtso...
> >>>>
> >>>> I was originally also, but I'm warming up to it.
> >>>
> >>> What's the status of this?
> >>
> >> I was planning to resend on top of the upcoming -rc1.
> >=20
> > Ping.
> >=20
>=20
> Thanks for the prod...
>=20
> The .dtso convention was added to the dtc compiler, then a patch was
> accepted to revert one mention of .dtso ,though there still remains
> two location where .dtbo is still recognized (guess_type_by_name() in
> dtc and the help text of the fdtoverlay program).
>=20
> It seems that the general .dtso and .dtbo were not popular, so I'm
> going to drop this patch instead of continuing to try to get it
> accepted.

AFAICT .dtbo is moderately well established, and I think it's a good
convention, since it matters whether a blob is an overlay or base
tree, and it's not trivial to tell which is which.

=2Edtso is much more recent, and I think there's much less value to it.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--I6Aq5wk2HGQbsO2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu9F4ACgkQbDjKyiDZ
s5JaVBAA1gXHAp5px0i2Klsic0Lp10EZebvmvg6Rj0QvWUz+160yV6yQ/oZ9QBLG
BXWJ6e2yuDyom0rW6JF+Zd23MmlsL6LaNxCf98DEQeOyfLhh7iqBANYypdlsPWfh
7jqW90K1Txk8gWb9HIoPWXCFH4EemkZR5wqhimEIa/U53H7oslxurkDU6iisZd3H
90RoySlLzrh/3WwAbrOi44/CUT398jd8p0pDnTsL3dBKsbXdjzK7L6106wOpkHwh
VAS8NJrWYzwflaW3Rb7s0/jzL5fs7eSbkpaWRlSBNQOcCc/RnDFciNVkma91qP4G
fa6P+Q/aid4zu2aOfW2c8QFwZjWD7jRKykISw4qhk1SfiaeAUFmz4oycjQu+JKzq
QPpadCI6O5pfQXG+pLC4RTe6QB/uarqe9ja+sPi011CNTMcaSjCTaAYiMzkGvn2z
QnyLuMQkgcRs5F8qWoCh73gwVMYEKAAbWEhwjTZGdG/5U1pl0O+CBGkPYY38VnAn
/TAJfXe6MTvjH2luWwx5VXEOhSiCQk+KdUmFoQJonO4CrJW3hrEw3kuOClyDOT9D
/7yIIE7Rir0YkMExiXtt1JYy4i2LES/4SnSY+9Se2trOJ3E0jmsJDqNuUFV23LwH
GyiLHdo/kwIRlEu0zWQii8ETyMjOVCF5ex9D1GM3N/QMp6J4zFQ=
=knx0
-----END PGP SIGNATURE-----

--I6Aq5wk2HGQbsO2b--
