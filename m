Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0785E394A8C
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 May 2021 07:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhE2FSP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 May 2021 01:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhE2FSP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 May 2021 01:18:15 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBA1C061574;
        Fri, 28 May 2021 22:16:39 -0700 (PDT)
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4FsVCR54Q7z9sW4; Sat, 29 May 2021 15:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1622265395;
        bh=9W7EP2KVmTGbFSdQ+OaCesEwTE5wg3X5f+H11fjjHHo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MYRRZR8gDpdM+T1L7qJXrL9NouextTi+KmoUDpHAAGF0+KPNAZYgg03mXRW2AjmrE
         30RGn01woFa3kTAj9fZ7heLva7SPYgn3ZhO2TBTrJQIGlI2YbDVAmPYqlj+DmgC4Cl
         wjFgU+SPSxnGN5lAidRsCGRBwejY9ZtJXssa30+w=
Date:   Fri, 28 May 2021 13:45:35 +1000
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
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
Message-ID: <YLBnX4PeK51YwUJB@yekko>
References: <20210324223713.1334666-1-frowand.list@gmail.com>
 <20210327174035.GA291160@robh.at.kernel.org>
 <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
 <CAMuHMdXpGKMi-xv6hZQmmEw0JO=Q0WuvUzwJ2v0O28Tx5uW+sg@mail.gmail.com>
 <d1aefaae-7b12-b5fb-4b97-7230bd52c1be@gmail.com>
 <20210526061144.yvoaurpz75a3bsjr@vireshk-i7>
 <f651e95b-feef-5c86-edba-d6008bc80b34@gmail.com>
 <YK70Xsl1oXeEQpWZ@yekko>
 <CAMuHMdWdb2s08a=axC+m88gARSA3enOBnczsN59XL2F9yHXXYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gmPBfyWAmXOSQLgm"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWdb2s08a=axC+m88gARSA3enOBnczsN59XL2F9yHXXYA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--gmPBfyWAmXOSQLgm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 09:21:05AM +0200, Geert Uytterhoeven wrote:
65;6401;1c> On Thu, May 27, 2021 at 3:48 AM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> > On Wed, May 26, 2021 at 04:21:48PM -0500, Frank Rowand wrote:
> > > On 5/26/21 1:11 AM, Viresh Kumar wrote:
> > > > On 22-04-21, 13:54, Frank Rowand wrote:
> > > >> On 4/22/21 3:44 AM, Geert Uytterhoeven wrote:
> > > >>> On Mon, Mar 29, 2021 at 9:23 PM Frank Rowand <frowand.list@gmail.=
com> wrote:
> > > >>>> On 3/27/21 12:40 PM, Rob Herring wrote:
> > > >>>>> On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.co=
m wrote:
> > > >>>>>> From: Frank Rowand <frank.rowand@sony.com>
> > > >>>>>>
> > > >>>>>> Add Makefile rule to build .dtbo.o assembly file from overlay =
=2Edtso
> > > >>>>>> source file.
> > > >>>>>>
> > > >>>>>> Rename unittest .dts overlay source files to use .dtso suffix.
> > > >>>>>
> > > >>>>> I'm pretty lukewarm on .dtso...
> > > >>>>
> > > >>>> I was originally also, but I'm warming up to it.
> > > >>>
> > > >>> What's the status of this?
> > > >>
> > > >> I was planning to resend on top of the upcoming -rc1.
> > > >
> > > > Ping.
> > > >
> > >
> > > Thanks for the prod...
> > >
> > > The .dtso convention was added to the dtc compiler, then a patch was
> > > accepted to revert one mention of .dtso ,though there still remains
> > > two location where .dtbo is still recognized (guess_type_by_name() in
> > > dtc and the help text of the fdtoverlay program).
> > >
> > > It seems that the general .dtso and .dtbo were not popular, so I'm
> > > going to drop this patch instead of continuing to try to get it
> > > accepted.
> >
> > AFAICT .dtbo is moderately well established, and I think it's a good
> > convention, since it matters whether a blob is an overlay or base
> > tree, and it's not trivial to tell which is which.
>=20
> Indeed.
>=20
> > .dtso is much more recent,
>=20
> Is it?

Well, I wouldn't bet money on it, I just seem to remember encountering
=2Edtbo for some time before .dtso was mentioned.

> The oldest reference I could find is from May 2015:
> "[PATCH/RFC] kbuild: Create a rule for building device tree overlay objec=
ts"
> https://lore.kernel.org/linux-devicetree/1431431816-24612-1-git-send-emai=
l-geert+renesas@glider.be/

Hm, I think .dtbo is even older than that, but again, I wouldn't swear
to it.

> I have always used dtbo/dtso in my published overlays branches,
> referred from https://elinux.org/R-Car/DT-Overlays, and used by
> various people.
>=20
> > and I think there's much less value to it.
>=20
> IMHO the same reasoning as for dtb vs. dtbo applies to dts vs. dtso.
> It matters if the resulting blob will be an overlay or base tree,
> as the blob will have to be called .dtb or .dtbo.
> As dtc outputs to stdout by default, the caller has to provide the
> output filename, and thus needs to know.
> Even if dtc would name the output file based on the presence of
> "/plugin/" in the input file, the build system still needs to know
> for dependency tracking.

Hm, fair point.  I was thinking of the the /plugin/ tag as the
distinction, whereas dtb is binary and the distinction isn't even
marked in the header.  But you're right that even readable text labels
inside the file don't really help make(1).  So, I retract that
assertion.

> We also do have .dts vs. .dtsi.
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gmPBfyWAmXOSQLgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCwZ10ACgkQbDjKyiDZ
s5I/sBAA0JKiNiETmfLndzpQT9G9iqQKZ1b5A17zh5AnT4c+615XJR0DjNOyyIE7
IkVFsq2DyvcNBklAsoocoFDmxXs6pAx15tBn1vmmvJbeFhU2p59hjbdMDIF8Hx47
ouxt9fnkZTqeQWrUwFXcI7wvQ0xaWn9xySCbzykeql+9NSUbE2czNAiLKWl+NJy3
Twl7D6fuxpOYIrBRsv4bqAVgTyzYn4LeT21p/EmqDO9MFZUUftjrN8+c27Znz4qt
+Mq9QlSZkNTD7iGMxG3kjdfS7ExCaR3jZ3Y1oeNyx2n8jqyYw3VIgLOJL1xDGwHJ
scismnPo/lYJR3muiqOJTyWfuqyCwpqEAUEFU+4NEG31MzhgRSgjKBZfjDi+tmtO
jP+oBPM8VnSTbnimFee2IIUlkv1QekD1IWoBr2eeOY0PCKsi5Uds0JEAgCTfCuqK
C87v41BOsNooC+QBaWS5JcAtsX6FDZ4j5YYrEL9+pnOntoOKNnCDlnunolGcgy5q
HxAM68u+3GixptsgDarFM0pcssXbf8/hglsMlHmLuB1qioCexAMCD7/CXLil+ifZ
q9fNjRlI7WvUaNy5ldtnHrQatE+Gds9fx8cRPfh0zYAOpIyWp67+MKVHyKWYVmmX
z+RJdQ1/dF+CNn0nRlFR+QAs4PO4wXWJoIfMci+rKlT/9lANEwk=
=gl/K
-----END PGP SIGNATURE-----

--gmPBfyWAmXOSQLgm--
