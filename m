Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9857CD0F
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jul 2019 21:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfGaToW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Jul 2019 15:44:22 -0400
Received: from sauhun.de ([88.99.104.3]:44572 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727482AbfGaToW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jul 2019 15:44:22 -0400
Received: from localhost (p54B33080.dip0.t-ipconnect.de [84.179.48.128])
        by pokefinder.org (Postfix) with ESMTPSA id 1F9E42C270A;
        Wed, 31 Jul 2019 21:44:20 +0200 (CEST)
Date:   Wed, 31 Jul 2019 21:44:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
Message-ID: <20190731194419.GB4084@kunai>
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
In-Reply-To: <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Javier,

thank you for providing the extra information.

(And Kieran, thanks for the patch!)

> The other option is to remove i2c_of_match_device() and don't make OF mat=
ch
> to fallback to i2c_of_match_device_sysfs(). This is what happens in the A=
CPI
> case, since i2c_device_match() just calls acpi_driver_match_device() dire=
ctly
> and doesn't have a wrapper function that fallbacks to sysfs matching.
>=20
> In this case an I2C device ID table would be required if the devices have=
 to
> be instantiated through sysfs. That way the I2C table would be used both =
for
> auto-loading and also to match the device when it doesn't have an of_node.

That would probably mean that only a minority of drivers will not add an I2C
device ID table because it is easy to add an you get the sysfs feature?

Then we are back again with the situation that most drivers will have
multiple tables. With the minor change that the I2C device id table is
not required anymore by the core, but it will be just very useful to
have? Or?

> If the former is the correct way to solve this then the patch looks good =
to me.
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

For this actual patch from Kieran, I'd like to hear an opinion from the
people maintaining modpost. The aproach looks okay to me, yet I can't
tell how "easy" we are with adding new types like 'i2c_of'.

Thanks everyone,

   Wolfram


--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1B75MACgkQFA3kzBSg
KbbU8w//dvqEPnqPyKnvyM5J6IbOToq7hML3V6OFjYE77Tq2I6WxoRI938OiLZQ8
zDMkansmVtC33fuRDoQBNy1QXwT8RAggj9OJ6qLP3phJxI426Q3NAO4kyAgYbNfP
59y+Ek7fbM5jrnUZgeAlskR09H6Ji+v6FRaiDAmWRAL1hwQM8/LZ6dB/JqizpA/Z
jZgu4W9OY+sdGtO81seJp1DoAMgsf/bWm7qX9n1Dz0vOzH+GMzqGgO+rmb6u+8DQ
YTfOrrNXeAvnU71ttt78YXHon/Y3mSMD5CfYoIY1cYjvLV/LZuXdeYU0tMWCk0dQ
xO1debrcAM8yAAdITXoYPnXiPeUFq3i6/VnZUXVpx4cWIo+UAtYlGbbC9aUL0RWg
Janfacmuql1pq8ozpkYMz3e2oJxoaqTSjFW1Arw1JSJSrvySp5WG9tik9qXPrMv4
NS5HlNP+odj/3PzIqH27sBHgNPhns6oBmzeJDzRDSfhBx1/GogS2F/zxanRBscfL
bjV7LqWBd3MTbJI7LvJoSEYnE77nZSzuuNu5VWQWEE0zioFc6N0TCqboo7XgLfLo
AsYRT5LWZHZVDdxEqCfptSyB1boQCsdHJi8k4Dw6xRy7Txa+n4nFSr8sjc0IR0IQ
B6AtHRIQqwJkKVKeUccKydMsQHtN40wUsIQu2EcPOBhiPkquAFk=
=3ETA
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
