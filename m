Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A487A6461E7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Dec 2022 20:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiLGT5F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Dec 2022 14:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiLGT5E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Dec 2022 14:57:04 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DD95E3CD
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Dec 2022 11:56:56 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.96.114]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Moex5-1oaWG10y3F-00p4C8; Wed, 07 Dec 2022 20:56:40 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 6269B3C1B0; Wed,  7 Dec 2022 20:56:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1670442993; bh=zF9yRG/58zxxS72P8ir1zBtZ/6ArJpUol8Q4guKkhfk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e0e0/FF3vyDTVI95++FaPrQD2IOJhoUj0s+kKTokp/P/uqRo8PU6Lb/r3ewwvwD4T
         jPNd2ESFUhPMoY3oOvdJ4dgHuXadkZ1AKxaZUGKhjeLbZ6E09HUTiXWwEltOSZ0HPB
         IV2ezPpWaqQLLqahXEt9EXYjWsL0v1J/2A3x7HHQ=
Date:   Wed, 7 Dec 2022 20:56:29 +0100
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Dmitry Goncharov <dgoncharov@users.sf.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [v3] kbuild: Port silent mode detection to future gnu make.
Message-ID: <Y5Dv7Q3+D0nAHFJ2@fjasle.eu>
References: <CAG+Z0CvbeLYoY0DpPK14inUMTat=zkRLJgqZ4mW0c10Vf_d6ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZU/Rhb3PYODrVVT6"
Content-Disposition: inline
In-Reply-To: <CAG+Z0CvbeLYoY0DpPK14inUMTat=zkRLJgqZ4mW0c10Vf_d6ow@mail.gmail.com>
X-Provags-ID: V03:K1:4wiTHNDCjyznjX0KdfhRhAGIVjA5zld4jGAkbtNx/peD/xzgwIS
 8Okd6jyS+BKFXsGK4y/BRSr0p3DayfwJkxfiiK6EkgMOb11sfMRiKn2AwY39vf1J0KfOC/0
 FTVNm7bzre/X2iFt6esdj6vtBe9FvflOgB7+pntKaeJCS6w3aV+q+HdI6edImgSQYvz5pcH
 7nQ+t0yA5capN8Zg9/XOQ==
UI-OutboundReport: notjunk:1;M01:P0:M3TPLspy8lg=;YUIdmyoXhk5QZGG+StspqbaG5ns
 ZWEeH+PtRk7N1VnErQICOyrxLf2MVqRAkjQfbhD5X18Ay1CM46heHaIwo1/zVMqtiSfMNarLu
 pYeNevBGKzvoFoX8PN1H+i+zY5rZ9QXTTQOmNCNr36aXi6sV6wwXTE+QBhsxXbB/qFY5ssRsc
 FnPYe4Y1hjH0enpEG5wOlZ9xu+vXpgShqQwqlte1ZRaLxhUhQyBlsCPQt8VZKOohk4nAOEnAG
 5O0p2Nd7uDt7qGCtwZC1+ZmXWaVf442PYqs0oxyHGYotUFmekGFWmNRxHtdTW5nJ3hUF62CHV
 xSDtxIWLF7Z4xMvuaZbohxXZvABgm6xQrOfgvz1sn85gXTGji97AUpQYEkMKuc/wWtcNz5sYW
 TOv0fHJwflxkU2aMT+s+ssi6KYNb8L46dYz3d/6XcA2Tu0ih4HjiPioXOKxUDXX9BK5Ee0Nmq
 ZScmMxMp8tdPRpNRg1DwHYJJ+hmmfl6eFVpaQUNM1DQh1uSkfMvG5N20FlLWxGZ5q4XTmeuoK
 DsYvQH2iSN5mVscbz8Hs1hIGNhoph5ulg9W8AnYIvnFZVuePgIzdARnOaRGhbqgvyfQUdGlSH
 MHLPmh1jF2O1eKprCuUy0dmkFCbMFP1Yr49FptgUxNYth1PWmwCu2bmI8KLW/GM8i+Kxh+Wou
 UL4W9plWEy9Wd+od70B/p7w92xCd8+j3hCP0xsFvcA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--ZU/Rhb3PYODrVVT6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 04:48:19PM -0500 Dmitry Goncharov wrote:
> Port silent mode detection to the future (post make-4.4) versions of gnu =
make.
>=20
> Makefile contains the following piece of make code to detect if option -s=
 is
> specified on the command line.
>=20
> ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>=20
>=20
> This code is executed by make at parse time and assumes that MAKEFLAGS
> does not contain command line variable definitions.
> Currently if the user defines a=3Ds on the command line, then at build on=
ly
> time MAKEFLAGS contains " -- a=3Ds".
> However, starting with commit dc2d963989b96161472b2cd38cef5d1f4851ea34
> MAKEFLAGS contains command line definitions at both parse time and
> build time.
>=20
> This '-s' detection code then confuses a command line variable
> definition which contains letter 's' with option -s.
>=20
> $ # old make
> $ make net/wireless/ocb.o a=3Ds
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
> $ # this a new make which defines makeflags at parse time
> $ ~/src/gmake/make/l64/make net/wireless/ocb.o a=3Ds
> $
>=20
> We can see here that the letter 's' from 'a=3Ds' was confused with -s.
>=20
> This patch checks for presence of -s using a method recommended by the
> make manual here
> https://www.gnu.org/software/make/manual/make.html#Testing-Flags.
>=20
>=20
> Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
> Reported-by: Jan Palus <jpalus+gnu@fastmail.com>
> Link: https://lists.gnu.org/archive/html/bug-make/2022-11/msg00190.html
>=20
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618..fbd9ff4a61e7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -93,10 +93,17 @@ endif
>=20
>  # If the user is running make -s (silent mode), suppress echoing of
>  # commands
> +# make-4.0 (and later) keep single letter options in the 1st word of MAK=
EFLAGS.
>=20
> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
> -  quiet=3Dsilent_
> -  KBUILD_VERBOSE =3D 0
> +ifeq ($(filter 3.%,$(MAKE_VERSION)),)
> +silence:=3D$(findstring s,$(firstword -$(MAKEFLAGS)))
> +else
> +silence:=3D$(findstring s,$(filter-out --%,$(MAKEFLAGS)))
> +endif
> +
> +ifeq ($(silence),s)
> +quiet=3Dsilent_
> +KBUILD_VERBOSE =3D 0

Thanks for that patch.  Following its development was quite interesting!

Are there some (possibly unwritten) style recommendations for Linux
Makefiles/Kbuilds, e.g. regarding spaces around assignment operators and af=
ter
commas?

Personally, I would have liked to see those spaces here as I think it would=
 be
better for style consistency.

Kind regards,
Nicolas


--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--ZU/Rhb3PYODrVVT6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmOQ7+UACgkQB1IKcBYm
EmkgpRAAjd1PZXlZXQzFOrkCFvHN7H41t0qptpCEQxYojld4x4AALR4Xf3WvXVlo
ju5ObUXxnm44K/g20I680fhdDLjkav64sIBE9pCvdC1xIAiavy6EydJWSOx0HwXV
mgBQQd3k8wqT/CkJsJclRjmXb3RfEAaqEdckCgT7Z8CORUoWE/t3cdKU804Fly+4
b0/lxGxiGuxGwUTFNsEAyx2hOA8F+DgdyCAAWTYY2bLfdCI+hRpyzP1/GopgxmF+
Viz4Gw4fg+V4DnahxjDM+0rOsMI1WX6r1PeLjC58q9HHPuGW4cPpZ13AF8NRsCnk
SaVm2We82AJV+ROwQ/9dIU4/QZvMvID+6L0GFi/7Zge2N5/0B41wGIhsqNu/hBUB
81ZKAbaGlJyq35CNTSzGJzou/aqz/Q+Eu3EBAGs0l+wJIZGQLO9/93DMKnZ3Bpb3
G1QA3p37S5XBx1nSPv68bjBkTf2dRsLP8yKJZbcGQf2fsvESuad3ZFqAJoO/96eN
WKQffh+JPBtnJw478JOlzm0czaOK883f+IfRbYIiCbHaDV2WEkjjUNQv/5GhpkqV
7X6+PxNcWdU0PqxvUNndPzzn+iYFA7IRuPgD/gUSg0OMxAYOoV7EmADyRciqj9n4
zod/86O4TLdCOjtFZl6smWmRd7WM/IKArRexp0dvUDHRfFy39Y0=
=YPDT
-----END PGP SIGNATURE-----

--ZU/Rhb3PYODrVVT6--
