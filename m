Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFBB7B2D94
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Sep 2023 10:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbjI2IQG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Sep 2023 04:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbjI2IQG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2023 04:16:06 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B211A5
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2023 01:16:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qm8f4-0004kR-Bq; Fri, 29 Sep 2023 10:15:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qm8f0-009lpW-Fs; Fri, 29 Sep 2023 10:15:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qm8f0-005rq0-6K; Fri, 29 Sep 2023 10:15:42 +0200
Date:   Fri, 29 Sep 2023 10:15:40 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        coresight@lists.linaro.org, kernel@pengutronix.de,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: section mismatch test doesn't work reliably on arm64
Message-ID: <20230929081540.yija47lsj35xtj4v@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vzh3zilouipaaja3"
Content-Disposition: inline
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


--vzh3zilouipaaja3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

by manual inspection I found a section mismatch in
drivers/hwtracing/coresight/coresight-etm4x-core.c where
etm4_platform_driver (which lives in ".data") contains a reference to
etm4_remove_platform_dev() (which lives in ".exit.text").

However building with CONFIG_DEBUG_SECTION_MISMATCH=3Dy +
CONFIG_CORESIGHT_SOURCE_ETM4X=3Dy doesn't warn about that one.

	$ objdump -Dr drivers/hwtracing/coresight/coresight-etm4x-core.o | grep -A=
7 etm4_platform_driver
	0000000000000158 <etm4_platform_driver>:
		...
				158: R_AARCH64_ABS64	.text+0x2524
				160: R_AARCH64_ABS64	.exit.text+0x124
				188: R_AARCH64_ABS64	.rodata.str1.8+0x2e0
	 1a8:	00000001 	udf	#1
		...
				1b0: R_AARCH64_ABS64	.rodata+0x2ae8

A similar issue in the same file is etm4x_amba_driver referencing
etm4_remove_amba().

I guess the problem is that the information about the reference is only
stored in the relocation entry?! I shortly looked at modpost.c, but I
don't know enough about elf and that code to fix that.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vzh3zilouipaaja3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUWh6wACgkQj4D7WH0S
/k6Qowf/f+iowNrFUS33oPp1p7qNnqGX8tNSukoaVXel4FIBmtrdIWmFUyxeaX3g
Y1TVuthP6pM/Sg2kFTpmF/oqFCasg5FJQFukHEpMtI/DZSWr6aRGGXdFjtlOBDFc
XHJLFBJ0R11EYO/8iTqNow9x7ItpM19sETFBq+oXtwvOnw6FEBhrOJJM6BuBsK3v
FpsFn6lfVYvej3Kfy8XrW3jw+uR2dbugZKA3PIvxOpiiz/btOtBDApicR8qicAZJ
TJcyixYtdhRsiuYvXzJ49kcwFMVJ48fvuxLN5cZWESgiNyZbOHnE9rFcVvwetFfd
yGj5V36VxP4GZg1/VBcQRxE9pLFrig==
=cbX9
-----END PGP SIGNATURE-----

--vzh3zilouipaaja3--
