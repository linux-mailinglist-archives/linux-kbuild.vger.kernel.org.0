Return-Path: <linux-kbuild+bounces-295-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 788DB809F23
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 10:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7BF1F212F0
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 09:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D314611713;
	Fri,  8 Dec 2023 09:21:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFE9171F
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Dec 2023 01:21:04 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBX2N-0002Kw-04; Fri, 08 Dec 2023 10:20:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBX2M-00ENvp-7x; Fri, 08 Dec 2023 10:20:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBX2L-00GLWC-Uo; Fri, 08 Dec 2023 10:20:45 +0100
Date: Fri, 8 Dec 2023 10:20:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: WARNING: modpost: drivers/input/mouse/amimouse: section mismatch
 in reference: amimouse_driver+0x4 (section: .data) -> amimouse_remove
 (section: .exit.text)
Message-ID: <20231208092045.rk7qta6g33ir7y5q@pengutronix.de>
References: <202312081423.p7XRxPsZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ubvdkgmmew7jif2p"
Content-Disposition: inline
In-Reply-To: <202312081423.p7XRxPsZ-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org


--ubvdkgmmew7jif2p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Dec 08, 2023 at 02:21:30PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   5e3f5b81de80c98338bcb47c233aebefee5a4801
> commit: f177cd0c15fcc7bdbb68d8d1a3166dead95314c8 modpost: Don't let "driv=
er"s reference .exit.*
> date:   10 weeks ago
> config: m68k-defconfig (https://download.01.org/0day-ci/archive/20231208/=
202312081423.p7XRxPsZ-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231208/202312081423.p7XRxPsZ-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312081423.p7XRxPsZ-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> WARNING: modpost: drivers/input/mouse/amimouse: section mismatch in re=
ference: amimouse_driver+0x4 (section: .data) -> amimouse_remove (section: =
=2Eexit.text)
> >> WARNING: modpost: drivers/parport/parport_amiga: section mismatch in r=
eference: amiga_parallel_driver+0x4 (section: .data) -> amiga_parallel_remo=
ve (section: .exit.text)
> >> WARNING: modpost: sound/oss/dmasound/dmasound_paula: section mismatch =
in reference: amiga_audio_driver+0x4 (section: .data) -> amiga_audio_remove=
 (section: .exit.text)

It's somewhat expected that a commit introducing a new warning triggers
new warnings for the offending drivers.

There are some more offenders than these. A quick look into these three
shows that the warning is a false positive (i.e. I don't expect that a
driver follows a link to a discarded function).

To fix this you either need a commit like

	141626dbc2e6 ("rtc: sh: Mark driver struct with __refdata to prevent secti=
on mismatch warning")

(if you really want continue using module_platform_driver_probe()), or
modernize the driver (at the cost of a slightly increased memory
footprint) with something like:

	1865913dd590 ("media: meson-ir-tx: Drop usage of platform_driver_probe()")

Addressing these is on my todo list, but not at it's top.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ubvdkgmmew7jif2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVy3+wACgkQj4D7WH0S
/k7BdAgAmeNRoYCaR8JTAtI7Gm7e7UCvR1/xFKybG97hTO/6J1F90rSiwX+YmdKl
qgWbJn7qxXCrENT4YzmI5aiSYXPxcq+rDm7NS1mBRNz4DrSRpeSYi3d5Mw3x1zaD
VHF5DjlqCvoqZeuPMDictElG9gT2eSjgi11sPhAvj+dWHlAAecv/Gfh7qNHh0BLF
wDXJ8MUJQmBDV9TMEh9EB2R55WuFC1sb7aXO/SNyf/Y1NUCtCQFDIlekYpHBz/Vb
eoi3LFs/n3O/EYTVf5LyklVvZk3feEdpLMmMgh6X/BjLIcaJoY3qhEiNKDqQ1su8
bpw36kgpKFauVxHEJdaAfKhYPeYj8w==
=PcJp
-----END PGP SIGNATURE-----

--ubvdkgmmew7jif2p--

