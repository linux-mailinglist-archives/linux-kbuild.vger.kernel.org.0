Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A543046A6
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 19:40:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390536AbhAZRV6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 12:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389555AbhAZHV6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 02:21:58 -0500
X-Greylist: delayed 73382 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Jan 2021 23:21:12 PST
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org [IPv6:2a01:4f8:c0c:3a97::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F52C061573;
        Mon, 25 Jan 2021 23:21:12 -0800 (PST)
Received: from antares.kleine-koenig.org (localhost [127.0.0.1])
        by antares.kleine-koenig.org (Postfix) with ESMTP id 46AFDADE69D;
        Tue, 26 Jan 2021 08:21:09 +0100 (CET)
Received: from antares.kleine-koenig.org ([94.130.110.236])
        by antares.kleine-koenig.org (antares.kleine-koenig.org [94.130.110.236]) (amavisd-new, port 10024)
        with ESMTP id V7DnAz6ZVq0I; Tue, 26 Jan 2021 08:21:07 +0100 (CET)
Received: from taurus.defre.kleine-koenig.org (unknown [IPv6:2a02:8071:b5ad:20fc:e287:a8e4:9290:29e6])
        by antares.kleine-koenig.org (Postfix) with ESMTPSA;
        Tue, 26 Jan 2021 08:21:07 +0100 (CET)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        cyril@debamax.com, Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
 <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
From:   =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
Message-ID: <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
Date:   Tue, 26 Jan 2021 08:20:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Md9uBspQZ8si26wbTEXGrXNDQsO6WS1FX"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Md9uBspQZ8si26wbTEXGrXNDQsO6WS1FX
Content-Type: multipart/mixed; boundary="bIO7wac1lK89xpNlKc4oBcYpFRZsCPvJE";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, cyril@debamax.com,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Message-ID: <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
 <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
In-Reply-To: <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>

--bIO7wac1lK89xpNlKc4oBcYpFRZsCPvJE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello Masahiro,

On 1/25/21 10:53 PM, Masahiro Yamada wrote:
> On Mon, Jan 25, 2021 at 8:07 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koeni=
g.org> wrote:
>>
>> Adding the -@ switch to dtc results in the binary devicetrees containi=
ng
>> a list of symbolic references and their paths. This is necessary to
>> apply device tree overlays e.g. on Raspberry Pi as described on
>> https://www.raspberrypi.org/documentation/configuration/device-tree.md=
=2E
>>
>> Obviously the downside of this change is an increas of the size of the=

>> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
>>
>>          $ du -s arch/arm/boot/dts*
>>          101380  arch/arm/boot/dts-pre
>>          114308  arch/arm/boot/dts-post
>>
>> so this is in average an increase of 12.8% in size.
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>=20
>=20
> (CCing DT ML.)

makes sense, thanks.

> https://www.spinics.net/lists/linux-kbuild/msg27904.html
>=20
> See Rob's comment:
>=20
> "We've already rejected doing that. Turning on '-@' can grow the dtb
> size by a significant amount which could be problematic for some
> boards."

The patch was created after some conversation on irc which continued
after I sent the patch. I added the participating parties to Cc:.

The (relevant) followups were:

Geert suggested to always generate the symbols and provide a way to
strip the symbols for installation if and when they are not needed.

Rob said: "I'm less concerned with the size increases, but rather that
labels go from purely source syntax to an ABI. I'd rather see some
decision as to which labels are enabled or not."

And then I learned with hints from Rob and Geert that symbols are not
really necessary for overlays, you just cannot use named labels. But
using

	target-path =3D "/soc/i2c@23473245";

or

	target =3D <&{/soc/i2c@23473245}>;

instead of

	target =3D <&i2c1>;

works fine. (And if you need to add a phandle the &{/path/to/node}
construct should work, too (but I didn't test).) Using labels is a tad=20
nicer, but the problem I wanted to address with my patch now has a known =

different solution.

Best regards
Uwe


--bIO7wac1lK89xpNlKc4oBcYpFRZsCPvJE--

--Md9uBspQZ8si26wbTEXGrXNDQsO6WS1FX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAPwtwACgkQwfwUeK3K
7AlKXwgAm+kcs8YKGPW7BkNgCAJ44hDVJaUMseUumkbzSu+J7mJb/cEZ0bG87K+J
SzhQcJQ2LoASq0ZMg6dTn2PyqBDv63nnKmHiFVa+3z9J9EWPK+ZvZSyvoX0PLjiO
/IoBG+Vaei0hav2poeDjBdSWybhP567KYiYPkrmlbUyt9Aq6fgaEqgOGnnaZbxII
YOJ51Aec1JjAzlb8uD9dOYPmNKAFqlfONfBcr9abIACfc6FEKQytp/yvn6UvkHrL
tdP1lubPpzJXFJp8Md4yCPRRUbTpB8b7qvLXIge0YVUeU641roNdDnX9TY818ffA
qXrWfwyBKeMboKt30RTEfkHmEmIDew==
=nA4F
-----END PGP SIGNATURE-----

--Md9uBspQZ8si26wbTEXGrXNDQsO6WS1FX--
