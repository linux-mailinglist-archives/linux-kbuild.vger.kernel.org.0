Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7497B41F0
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Sep 2023 18:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbjI3QEb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Sep 2023 12:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234460AbjI3QEb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Sep 2023 12:04:31 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7969CB3
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 09:04:28 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmcS1-0006PE-Tj; Sat, 30 Sep 2023 18:04:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmcRy-00A5Xv-7C; Sat, 30 Sep 2023 18:04:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qmcRx-006XI8-TQ; Sat, 30 Sep 2023 18:04:13 +0200
Date:   Sat, 30 Sep 2023 18:04:13 +0200
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
        Arnd Bergmann <arnd@arndb.de>,
        James Clark <james.clark@arm.com>, kernel@pengutronix.de,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Subject: Re: section mismatch test doesn't work reliably on arm64
Message-ID: <20230930160413.an3xoejevwl73gkk@pengutronix.de>
References: <20230929081540.yija47lsj35xtj4v@pengutronix.de>
 <20230929174101.3oqx7yxskneuj4gs@pengutronix.de>
 <CAK7LNASkRnJsBdOaXdVizVWHLqYWoJWdzthuSNNEwhYLNYM2cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tcvnxsb3736tyzob"
Content-Disposition: inline
In-Reply-To: <CAK7LNASkRnJsBdOaXdVizVWHLqYWoJWdzthuSNNEwhYLNYM2cw@mail.gmail.com>
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


--tcvnxsb3736tyzob
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Sep 30, 2023 at 08:08:05PM +0900, Masahiro Yamada wrote:
> On Sat, Sep 30, 2023 at 2:41=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello,
> >
> > On Fri, Sep 29, 2023 at 10:15:40AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > by manual inspection I found a section mismatch in
> > > drivers/hwtracing/coresight/coresight-etm4x-core.c where
> > > etm4_platform_driver (which lives in ".data") contains a reference to
> > > etm4_remove_platform_dev() (which lives in ".exit.text").
> > >
> > > However building with CONFIG_DEBUG_SECTION_MISMATCH=3Dy +
> > > CONFIG_CORESIGHT_SOURCE_ETM4X=3Dy doesn't warn about that one.
> >
> > Arnd had the right hint in irc: If I do
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 34a5386d444a..070e53be1ea2 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1017,7 +1017,7 @@ static int secref_whitelist(const char *fromsec, =
const char *fromsym,
> >
> >         /* symbols in data sections that may refer to meminit/exit sect=
ions */
> >         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
> > -           match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_EXIT_SECTIO=
NS)) &&
> > +           match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_XXXEXIT_SEC=
TIONS)) &&
> >             match(fromsym, PATTERNS("*driver")))
> >                 return 0;
> >
> > I get a mismatch warning:
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: etm4x_amba_dr=
iver+0x98 (section: .data) -> etm4_remove_amba (section: .exit.text)
> > WARNING: modpost: vmlinux: section mismatch in reference: etm4_platform=
_driver+0x8 (section: .data) -> etm4_remove_platform_dev (section: .exit.te=
xt)
> > ERROR: modpost: Section mismatches detected.
> >
> > I remember that back in the times of CONFIG_HOTPLUG references to
> > ".devinit.text" and ".devexit.text" were ok. Is a reference to
> > .exit.text ever ok?
> >
> > I started an allyesconfig build on a few archs with the above patch
> > applied. This will take some time, when it's done I will report what it
> > found.
>=20
>=20
>=20
> allmodconfig on x86 detects several issues.
>=20
> [...]
> WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section
> mismatch in reference: adc3xxx_i2c_driver+0x10 (section: .data) ->
> adc3xxx_i2c_remove (section: .exit.text)

I checked just one of those, this is also a valid warning:

	static void __exit adc3xxx_i2c_remove(struct i2c_client *client)
	{
		...
	}

	static struct i2c_driver adc3xxx_i2c_driver =3D {
		...
		.remove =3D __exit_p(adc3xxx_i2c_remove),
		...
	};

so if adc3xxx_i2c_remove is discarded (happens with
CONFIG_SND_SOC_TLV320ADC3XXX=3Dy) no warning happens, but .remove is just
NULL and so if the driver is unbound no code runs and so it leaks
resources. My thought was that allyesconfig would catch all problems,
didn't consider driver authors to be that creative :-)

$(git grep -E '\.remove\s*=3D\s*__exit') suggests there are quite a few of
these ...

> Linus requires zero warning, so we cannot enable the modpost warning
> unless we fix all the sources of the warnings.
> That will need one or two dev cycles.
> =20
> If you want to turn on the warning now, you can surround the check
> with 'if (extra_warn) '.

OK, extra_warn is a nice compromise. Just keeping the build silent about
these real problems to allow a warning-free build sounds a bit like an
instance of Goodhart's law[1].

> Since commit 20ff36856fe00879f82de71fe6f1482ca1b72334
> it is possible to enable a modpost warning only under W=3D1 builds.

OK, I will rework the patch to only trigger on W=3D1.

Best regards
Uwe

[1] https://en.wikipedia.org/wiki/Goodhart%27s_law

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tcvnxsb3736tyzob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUYRvwACgkQj4D7WH0S
/k6qdwf8DlWZf4o8fcdshlCsg6EuuLhuiOQGAV72uMlHpAREDhrXO81aFFp1ixQd
yNX1BNHhcf5ZJuyq/nVIMlDZQYA+bRVu0Dt0bZvoe0Nc6eKRvIF7f6l+r72hOzNI
s+mNIZ+UajU3/ZmNjVSXsUSXXs6M+MVglPyty/3uwDM8KkdaCog7dXmGAD/QCNek
hBKhC7TpzVzZ+sE0PKbTVMqFeZkuQUO6N4KajAxpAhzMxhkqPjRwp8Q7mbgXhS6o
Ldz3zI6RQZghFNByVslesKG+pKq500z7MzrheMYo4EE2BpP2AJ5gz1B8s9/4QFR4
DD7+rjs4oG7tz+v8WvsbDEz2NdUeAw==
=shmm
-----END PGP SIGNATURE-----

--tcvnxsb3736tyzob--
