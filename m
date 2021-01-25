Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A41B302484
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 12:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbhAYL5a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 06:57:30 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:54132 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727628AbhAYLre (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 06:47:34 -0500
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 806E13B3CA6;
        Mon, 25 Jan 2021 11:18:25 +0000 (UTC)
X-Originating-IP: 82.64.171.251
Received: from debamax.com (82-64-171-251.subs.proxad.net [82.64.171.251])
        (Authenticated sender: cyril@debamax.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 12DFDE0015;
        Mon, 25 Jan 2021 11:15:21 +0000 (UTC)
Date:   Mon, 25 Jan 2021 12:15:20 +0100
From:   Cyril Brulebois <cyril@debamax.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
Message-ID: <20210125111520.mgqe7u7fh5425ywl@debamax.com>
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ofa4awvws3i5ofl4"
Content-Disposition: inline
In-Reply-To: <20210125105757.661240-1-uwe@kleine-koenig.org>
Organization: DEBAMAX
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--ofa4awvws3i5ofl4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> (2021-01-25):
> Adding the -@ switch to dtc results in the binary devicetrees containing
> a list of symbolic references and their paths. This is necessary to
> apply device tree overlays e.g. on Raspberry Pi as described on
> https://www.raspberrypi.org/documentation/configuration/device-tree.md.
>=20
> Obviously the downside of this change is an increas of the size of the

(as spotted by Uwe right after sending =E2=86=92) increase

> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
>=20
> 	$ du -s arch/arm/boot/dts*
> 	101380	arch/arm/boot/dts-pre
> 	114308	arch/arm/boot/dts-post
>=20
> so this is in average an increase of 12.8% in size.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>

Tested-by: Cyril Brulebois <cyril@debamax.com>

with:
 - a Raspberry Pi CM3
 - a carrier board designed after the official IO Board V3
 - an RTC accessible over I=C2=B2C, made functional via a DTB overlay, that
   can only be enabled once bcm2710-rpi-cm3.dtb has been generated with
   this patch applied.


Cheers,
--=20
Cyril Brulebois -- Debian Consultant @ DEBAMAX -- https://debamax.com/

--ofa4awvws3i5ofl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEHoutkuoaze1Qayc7lZpsmSeGm2EFAmAOqEgACgkQlZpsmSeG
m2EYRg//Ttps1FB0wJtShgYHbgdND6zCuwZEC6czYsmR8JkWlyQCHr90v9PYAjAv
pCAHkOwNTUa0gg6w9KGnBvzBI2kl+s4xoiFj4ZibJp4+vkDCnCz4KjKAIiJPuSzx
LihFWimirdBHgkQAxwUptSMQVB2XhuDUOK9rj92ck4Qd7PAO3/hq2x/U09Sewmxv
H93lAjv50CGjkHESjQ/15B9Ke2cHmcMs4mY0yn0TXIofgSWuafCjTJZD2jDvd7v6
jPSDdEM9jsbm5TdY7FUz4FwLkvRAOc1hfYNKpZG9DNtvB0AJZx26b/z762bavUbW
xTGzjs3cz4oQG6Geq5CPIES7JuO9zYOjbaBaNqUYUGunFhgVZZOdjTD3YpviaFD2
Fqng3IP4EgNr4ETv7Ff27wdK4kSXsWO5g4AU7+7722+0M9xgXTXnaHb/1dYPmHEh
dkk7O1BCk2ycWWhsNNvBaabIqxN3Ys9c2AuG5hwAlNEdSQykY5NUpf1nVqnNCDZJ
W+QJJcrQkUYoig3RKCgMTTwibCSHElyPh56khB8VaB4KiixVs6N3FMTntDyACVc/
Gypym8G87hnFOEcJLrjggx2h+1xUDNEUgAyEiw0hQY3FRSZDQgl6KuNugF7fg5Uy
87Up4uMbrc+X4mgNVBp2sNPKNME686Z2WFGZZ6eqlHKZt2IzKS8=
=j3ki
-----END PGP SIGNATURE-----

--ofa4awvws3i5ofl4--
