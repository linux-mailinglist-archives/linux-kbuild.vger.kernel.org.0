Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A16312FE323
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 07:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbhAUGoi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 01:44:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbhAUGof (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 01:44:35 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4DLtCB5Rlxz9sVk; Thu, 21 Jan 2021 17:43:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1611211430;
        bh=pBBSMXuxBB+p5rfNgeBN8mfyddkOc7DxMG4elSoPAOg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ghevZNhFSIHu88CoobWGVo1cr6jnc6NZotnX3ZBp4LGmAA7tIPjZsyeBNxVDKpTKC
         BQ74iPhotubQemKucihHrW32E+j9xdJPtQk5FTl5OmMNfb9KAfGYHl1yCaClsqx6wj
         ULAO4PqGxI7cmfPY+jYguifBfFtKkrzt4ervFSDg=
Date:   Thu, 21 Jan 2021 17:25:10 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH V5 4/5] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210121062510.GH5174@yekko.fritz.box>
References: <cover.1611124778.git.viresh.kumar@linaro.org>
 <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
 <20210121004955.GE5174@yekko.fritz.box>
 <20210121041300.ocerhqaieytj6gds@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rCwQ2Y43eQY6RBgR"
Content-Disposition: inline
In-Reply-To: <20210121041300.ocerhqaieytj6gds@vireshk-i7>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--rCwQ2Y43eQY6RBgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 09:43:00AM +0530, Viresh Kumar wrote:
> On 21-01-21, 11:49, David Gibson wrote:
> > If you're using overlays, you probably need the -@ flag, for both the
> > base file and the overlays, which AFAICT is not already the case.
>=20
> I think the idea was to do that in the platform specific Makefiles,
> unless I have misunderstood that from earlier discussions. So a
> platform may want to do that per-file or just enable it for the entire
> platform.

Hm, ok.  Any platform that does anything with dtbo files is likely to
want it, though.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rCwQ2Y43eQY6RBgR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAJHkQACgkQbDjKyiDZ
s5Kr0A/9Ho+X/IGM5PoeQ3SGhL4nJEuNbMHeOPrJfTQyMnQbqbma3SSxQSbKPfEz
nZ8RkE8RPvuJuOHleGqw7sP8WQ6W6V9xn9PD8yijUc45NmtyIYtP5KWi/Tw2L24m
CFj18/nBR4Twbe8BSiD7nHFLbu8ChPvWChKQX5ViANNE3pV5pNWK5P0gB7AmoPrh
WzJ47l4K7Kxb0LGk/FkmAA0zRO/EYkQSvB3JvIlvHHJhDwj4PxhzubWkTKUnN5jd
P0GLfrwC1WOzn/RuubEjXv4DMLF2rgay30eBKmy3O0hOumL7vOlHfDgmgUVIFjiE
HaIfP+otOcCgLfdCzzMJhngPOxLNqttWz7XH9E+oLig03Gxd2RYveXFYzFJwAC7R
vNtQM38mPHeKxIldatAaZHPdVr8RGjaRP13jRzINKyULe99u7GJRXi3jMsmkmxiK
RyzjVdfpvROPKuGBs+OLl/41jZ/WN51YtyS+sU5XchlrtKpaKPI/4yrqqUwMw6oL
e+I/MSA8hsltmUEdmo8DLcoG/eBPoucmk7JL67Ys3MB7hr+0RlmN/l2WannV/L6y
QoMg6Oxx7Y6eYxHtZeK0J42QskMQXekpfoF/VvVZcEKvxMk6j7v4fG2dF2hwhso4
h12cY91isN7eROjwonaUsFw1O3bJk3w0G5CYcRBnFcc4L+qZ0zA=
=dv40
-----END PGP SIGNATURE-----

--rCwQ2Y43eQY6RBgR--
