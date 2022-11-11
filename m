Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1406252EA
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Nov 2022 06:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiKKFGR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Nov 2022 00:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKKFGQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Nov 2022 00:06:16 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE9466CAA
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 21:06:08 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.96.85]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZCKd-1oX29Y1whd-00V5tD; Fri, 11 Nov 2022 06:05:37 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id 8AF7B3C007;
        Fri, 11 Nov 2022 06:05:32 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 1EB1F6442; Fri, 11 Nov 2022 06:05:32 +0100 (CET)
Date:   Fri, 11 Nov 2022 06:05:32 +0100
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/3] MAINTAINERS: Remove Michal Marek from Kbuild
 maintainers
Message-ID: <Y23YHECjMDu5oUPO@bergen.fjasle.eu>
References: <20221110150425.164386-1-nicolas@fjasle.eu>
 <20221110150425.164386-3-nicolas@fjasle.eu>
 <dfeb3422-a184-de5f-0e2a-0a1a233024ae@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2yYHlmABt0m/IQQX"
Content-Disposition: inline
In-Reply-To: <dfeb3422-a184-de5f-0e2a-0a1a233024ae@infradead.org>
Jabber-ID: nicolas@jabber.no
X-Operating-System: Debian GNU/Linux bookworm/sid
X-Provags-ID: V03:K1:2hmnDdR1k2zZ/RsJBPecIljL9q8UVy7DBEnrfXaLK+hjBfmdaiV
 OsQFCBXFWwB2mwMPNEayOpATeFmCsQ7MoDnKtKRBI+iFdLnvwRK2wcZo/aAIfN4agAPpmN3
 NA1vBuV8tgtbKpxcPKwIJc2O3TMkIsZEXVP68COtnZG9RxvGZCGI/Ezn517yETEXA0dXDD5
 NCcCI+7IQ4hm+YHPCiWJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WB+2zkBkigQ=:T+l2mhnu6gEHJfwuw2R7zd
 IVt5Eb24VDr8hOSj+VOOGwK9bgv5uPgTYpRpjuRKQzMum7U3sohnGK4ujbGUzhWyKyKhVb6Ix
 LYh+ymf+0yJ23TRYceeeWyoA6k0hX3AP7VoMPwFyvMz18WyR7/QEoAdLi1vhZzYgDKmPjbEUM
 qncfi+FpAhPd7COu5YkUDI/BuGi9AAnR264kAlTIRxpg8xpgJXh9CHjMjDRAvTI7uWtwT3stm
 N0/qCX6MUPt5wstgv7r4At1pD35INNJUsY6xNJmYDHeq9oIgHYyiNq6W+9+sOFNVb8a4IOJHC
 2VrSqpcolhnP0SiigIVJGEWXiPFhOTZfukEGQswe6/f914/ditoJzQopIVBM3IMShj0bx96nc
 Qan17YREkQ/sMEZtFni9z9SKrV3AyblZJm+p/oQ/3ZTKBWJJY7EFbIDTMdjc8pKX5r6C5xOdl
 6tIG1bGnKJ+fr0uvr2kJUgljDu5bSVsh2DFlSYlgtfPFXdARX5gMUoVEWmNuz6MqyPVWbsp9A
 n1W+VEEjnqwpCGvh1YI2KAFfzyOOjkN+vxxGd5huBsbX7sqnzbohJZFJZ3i9lyMOlyPJvjXJd
 7Zk2R/tjtaQAVwQu6GHYUkifGcQ3j08Myq7vxIjLC/4+yQ1MunD6GMmJxuByAJ2n/tkSJTNp8
 653MCc43BLJkeNVwAKe5nCXwnAkZ59YzkOdhoQJ1n0Xei4RJKXrN4UHHZ9eG4TuR1otNOF3zZ
 70jKSzAim2Y2tWjAPi3I93J4DwVC3F0bCnhlzG2mrJYcebg7upKfvh3Iy3tgIqSYWnyTVAGT8
 GLW4pP4+ZYBR3cfopAQxjZrJDTlOY09tyw5cMfvKln7F3LyqkxgGH1V0wV1FCvf0cjDYjfCe/
 6aKy7lMeZ22Zxk4pVCZD1bFzknE3IzG8ZHyQWyFCVRSJK3qdt3Niatf0253x9+Hu6d2bA7vbB
 x97xch8u5luUotvT5ZcXX/pcul4hYZsy6DHhbEL+vzoP2a+KpgBi5+Zws7lhL7t2XIukddUPj
 1hHR4gRIJd6NKkMTg59QMEHbXPHWw2lLf6nLA2dckTvq6/Q0hge8QIuz/XyqMXaw4/hrARbjK
 NI37gTrnOqgh3rhncd/oLEPAqaVFFKN6a1/aA+D6MjeHdMa/XFKkc846TYRMV3zYXJ8dNlSkq
 7SoMYiFP+Nyk03uGiQFnka6QK4h3fw/k8+p6lccoGA4hmXEn8b6ooV/HFr/s55jR/kkgc4Tij
 a9WHkT5Dsy/Da03F1zpLkJclHvngaNwpi9yU+XB3wvG/BSdB8JzRVweIWTo1Ysb6ei4n9lGXB
 ikFn+MQO
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--2yYHlmABt0m/IQQX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On to. 10. nov. 2022 kl. 10.55 +0000 Randy Dunlap wrote:
> On 11/10/22 07:04, Nicolas Schier wrote:
> > Remove Michal Marek from Kbuild maintainers as there is response since
>=20
>                                                        is no response sin=
ce
> ?

oh yes, will be fixed in v2.  Thanks.

Nicolas


>=20
> > October 2017.
> >=20
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 61a6848192c5..45c88bb34b6b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11083,7 +11083,6 @@ F:	fs/autofs/
> > =20
> >  KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
> >  M:	Masahiro Yamada <masahiroy@kernel.org>
> > -M:	Michal Marek <michal.lkml@markovi.net>
> >  R:	Nick Desaulniers <ndesaulniers@google.com>
> >  R:	Nicolas Schier <nicolas@fjasle.eu>
> >  L:	linux-kbuild@vger.kernel.org
>=20
> --=20
> ~Randy

--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--2yYHlmABt0m/IQQX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmNt2BYACgkQB1IKcBYm
EmnZxw//SzLagHgKZWDGscZuLx1/W7tXNl+/JsbfyZyIQU4G1THjKNLJNk8+BQBE
aT8EU0Vityr50fCWCUxG5GsUGIHPhAR5OGHx2iC4UT8RGjhVG6QE1qZFyNPKHLf+
9nNq54wCXF3rNVn0Lwa1d9ZhsUxS/C4YU8q1G90Z2rEvA3KgLJBp5K+yyWSpZZTZ
nqUi4Vt4HYOpT9Hu8WZn0QkigT4V0m1fJcojz6ZfneiR3d24ise04ECqm6OfOc6P
TVYulg/MyAFV1WMxRlZgHJgt+aTwSn+SG8imP/Jb8EmM2PpKewGNPPWJjorHPZPk
3votWKle+aXTBa/oHaL9BpuFZ/WNsreID0wgFdl5PvxELsHPc+l6IRflWaR2eKpm
9q1A8UzC68y2WhD+leMvbE1qZOy5fgIVHM0H7Ak0/gRxhtMGAzmNIIayFps6/Nlp
FbOvHkA22vKxfQRo2/d3XhQ6JyT4/hj/0Wzn1L67yhuiXjvvap8bWjFpsCCG4W3A
MIlL4EI58JWnOanAflZ+h7HwZ2Z7f6zTI/fRPZZUVKVqpiB7IsOJfexWutif/0kc
w5uLyy57gbuZvmiqKONON7pfS7gm7wuRRmNqNrFYORFEnyqs2yI7l4KAG8oOWD/n
Zr8pzfpeBM4QggIGWF8DmvHdx4enrukEtrsXq7Z/2P79JXF4CKg=
=yL/L
-----END PGP SIGNATURE-----

--2yYHlmABt0m/IQQX--
