Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E107BD893
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 12:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345769AbjJIKat (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 06:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345829AbjJIKas (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 06:30:48 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32812C5
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 03:30:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpnX6-00029v-Pt; Mon, 09 Oct 2023 12:30:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpnX4-000OLd-4m; Mon, 09 Oct 2023 12:30:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpnX3-00C8Mz-RZ; Mon, 09 Oct 2023 12:30:37 +0200
Date:   Mon, 9 Oct 2023 12:30:37 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        linux-kbuild@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mtd@lists.infradead.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eyfmrlif4aeodefl"
Content-Disposition: inline
In-Reply-To: <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--eyfmrlif4aeodefl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Changed email address for David Woodhouse from intel to infradead]

On Mon, Oct 09, 2023 at 10:43:46AM +0200, Arnd Bergmann wrote:
> On Mon, Oct 9, 2023, at 09:22, Masahiro Yamada wrote:
> > On Mon, Oct 9, 2023 at 5:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig <u.kleine-=
koenig@pengutronix.de> wrote:
> >>
> >> As described in the added code comment, a reference to .exit.text is ok
> >> for drivers registered via module_platform_driver_probe(). Make this
> >> explicit to prevent a section mismatch warning with
>=20
> >
> > We have thousands of module_platform_drivers.
> > I would be scared if they started to add __refdata.
> >
> > I am not sure if this is the right direction.
>=20
> For a normal module_platform_driver(), this would indeed be
> wrong, but as Uwe said above there is a special case for
> module_platform_driver_probe(), which implicitly sets the
> drv->driver.suppress_bind_attrs=3Dtrue flag.
>=20
> > In my understanding of the current DT overlay,
> > there is no way to create/remove a platform device dynamically.
> > I do not know if that will happen in the future.
>=20
> For drivers without suppress_bind_attrs, you can manually
> unbind the device from a driver, which in case of a loadable
> module ends up calling the .remove callback (this is fine),
> but in a built-in driver this would use a NULL pointer for
> .remove and cause unexpected behavior.

only a slight correction: As not having a remove callback can be fine
and platform_remove() only calls .remove (or .remove_new) when non-NULL
we're not hitting a NULL pointer dereference in the presence of

	.remove =3D __exit_p(somefunc),

But a problem can arise later if some resource isn't properly freed and
so it might be used at a later point in time which then most likely
oopses.

I didn't double check Arnd's list, but otherwise I agree to his
analysis.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eyfmrlif4aeodefl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUj1kwACgkQj4D7WH0S
/k6PWAf/U6JPgHawgWRjbbvmzteonFhuvNF2GMdSZ9xtW5chIxo+H2g0Zwvic4hx
2ZwF3ewJ9ZtSeMq2JZXlC8WV0RwE+zYoig5IDtf/73kVGS48oFPf7u7bppOaVWAG
5pCoCYa9p2c3BcXP21362rCufNKiqSNxVpuETfbIWaUYqCV8T+/5mKweFEuJ2TT1
3gauZoDBNKTNFUvZ3eV1u2m8dFWiqbvLeR1YfS6neIpup2caScqNxsTx+cT2rAJu
4+HimdiMvjB0oKI8gHOvdbYtbWLp6fM1olaiAYen0Gi7TtBXqKhPrY8OrkCayNOj
t5xetLTIRPMyd5H1jwQzvHCQTGUy+A==
=jxi7
-----END PGP SIGNATURE-----

--eyfmrlif4aeodefl--
