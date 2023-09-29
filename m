Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB077B390C
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Sep 2023 19:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbjI2RlQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Sep 2023 13:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjI2RlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2023 13:41:15 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6501B2
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2023 10:41:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmHUB-0006Ph-07; Fri, 29 Sep 2023 19:41:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmHU8-009rm0-SX; Fri, 29 Sep 2023 19:41:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmHU8-0061xc-Ig; Fri, 29 Sep 2023 19:41:04 +0200
Date:   Fri, 29 Sep 2023 19:41:01 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        James Clark <james.clark@arm.com>, kernel@pengutronix.de,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: section mismatch test doesn't work reliably on arm64
Message-ID: <20230929174101.3oqx7yxskneuj4gs@pengutronix.de>
References: <20230929081540.yija47lsj35xtj4v@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gyhzqoavgo4uhstj"
Content-Disposition: inline
In-Reply-To: <20230929081540.yija47lsj35xtj4v@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--gyhzqoavgo4uhstj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Sep 29, 2023 at 10:15:40AM +0200, Uwe Kleine-K=F6nig wrote:
> by manual inspection I found a section mismatch in
> drivers/hwtracing/coresight/coresight-etm4x-core.c where
> etm4_platform_driver (which lives in ".data") contains a reference to
> etm4_remove_platform_dev() (which lives in ".exit.text").
>=20
> However building with CONFIG_DEBUG_SECTION_MISMATCH=3Dy +
> CONFIG_CORESIGHT_SOURCE_ETM4X=3Dy doesn't warn about that one.

Arnd had the right hint in irc: If I do

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 34a5386d444a..070e53be1ea2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1017,7 +1017,7 @@ static int secref_whitelist(const char *fromsec, cons=
t char *fromsym,
=20
 	/* symbols in data sections that may refer to meminit/exit sections */
 	if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
-	    match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
+	    match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_XXXEXIT_SECTIONS)) &&
 	    match(fromsym, PATTERNS("*driver")))
 		return 0;
=20
I get a mismatch warning:

WARNING: modpost: vmlinux: section mismatch in reference: etm4x_amba_driver=
+0x98 (section: .data) -> etm4_remove_amba (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: etm4_platform_dri=
ver+0x8 (section: .data) -> etm4_remove_platform_dev (section: .exit.text)
ERROR: modpost: Section mismatches detected.

I remember that back in the times of CONFIG_HOTPLUG references to
".devinit.text" and ".devexit.text" were ok. Is a reference to
=2Eexit.text ever ok?

I started an allyesconfig build on a few archs with the above patch
applied. This will take some time, when it's done I will report what it
found.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gyhzqoavgo4uhstj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUXDC0ACgkQj4D7WH0S
/k6oGAf8CC809zwNNm6dHi+DVcoNDLQ+Hm4ZolSzMp/3H+7aZ003A2k2nNKCq93j
2n/PxxGFu6jPvsa3Hd9S8GRvurxkV8a3H9zSVhSWHKM0Us9Pj3x/BFOhUsRMR/fZ
WM83zlvAemiqpcOGXhhXT+8z08li1Mijh1vj3Pd7e/44+gdlDg3pnvdwzSv/klYy
8K3nInqRV1qTsKm4dXx5CgO3zElbmrdffHDNvVieCE7NZWWV2h64dvJwwY9MXHc6
MITXFSbJIk6vaA5hkWwMULGSstVCdjwGPsirQpoueG2OBV/dHekKKfLctU+CGtZe
3gSqZcWfNE68887NsNdE8r0Z/3Tjkg==
=IIWw
-----END PGP SIGNATURE-----

--gyhzqoavgo4uhstj--
