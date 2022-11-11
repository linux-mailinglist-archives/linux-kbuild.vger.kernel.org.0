Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A95B66252EC
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Nov 2022 06:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiKKFJF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Nov 2022 00:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKKFJE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Nov 2022 00:09:04 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E735B59E
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 21:08:57 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.96.85]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MEmAV-1on2s31s9z-00GJou; Fri, 11 Nov 2022 06:07:56 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id 1EEA73C007;
        Fri, 11 Nov 2022 06:07:55 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id A0B586442; Fri, 11 Nov 2022 06:07:54 +0100 (CET)
Date:   Fri, 11 Nov 2022 06:07:54 +0100
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 2/3] MAINTAINERS: Remove Michal Marek from Kbuild
 maintainers
Message-ID: <Y23Yqpyj0yVd7cFG@bergen.fjasle.eu>
References: <20221110150425.164386-1-nicolas@fjasle.eu>
 <20221110150425.164386-3-nicolas@fjasle.eu>
 <CAKwvOd=U_viWP0gvs00thCeYMT1u5AqP7_Lp1rHEzb0Fx+S+Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VT/lJ43BMuHmAs/6"
Content-Disposition: inline
In-Reply-To: <CAKwvOd=U_viWP0gvs00thCeYMT1u5AqP7_Lp1rHEzb0Fx+S+Lw@mail.gmail.com>
Jabber-ID: nicolas@jabber.no
X-Operating-System: Debian GNU/Linux bookworm/sid
X-Provags-ID: V03:K1:P/ANMaHRAF5mXbHHXeEY2z3mR+V1J5vxsCeOy94uII41EeTEWNG
 SbEmgAryVvXYFNsChAySO2giZCYq+TG6Me6/UMoTaXCVtCqejo7sFGHcviNo04mqv04Zb6Y
 hCAmLVsbaUQhCuNfJ+5n6BitSkjP4d0MsMenyDcdl8thXVa1YR1kd/LNCKNl8GD48ZbQ1VW
 +El+t6rrG4nftXebQVJlg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9Jwx89OVtCQ=:Jt8sa3uN/dyt7KyexjoCan
 s50i3jMGFlIS/lurTQ+/wfOiFi+Dybx/FBw+YWKtBraTkw/FoTLXt/d+9UalGe7uYJJphpfA/
 3nbZckobnp1ANKa9jsohSx2lTsSOF6pZPpjlmaOzbjIaGW1aCbc6UagM+dZR0Ur42R6ipP2qR
 DQdLWarEIhCr4ax7wbt3tAsYdNfxyaoA2Qujkn7hLVcPWwwRJbAvbzAXn0JSYPJpazDkaGtfE
 TL5WQRdcT0KPWunkLQoSubKMGAykK8/xlIJ8cMZjz9r3VU6Bc+8HzupkakanWfWqXyG9WEUKg
 mKplQi53D5Va5ppB3zbcJl20zAKtkJeq8Yoq5urhDRfxkcDDng2iatpOUKp8JiF9255Ap4WEu
 xytrsqHu7SBh6YHDmUJ2tc6aO/mvmT6nPnmfteDMVEmCQ7TXtFdaPLcA0gDp5xCvMBPTnw+G2
 WQG3x7K+eHfE4M7rFYH7EEiOP/s39dEq5fXWYewiVd8b5y4SvAX6d/ZwQCHhYvaI/tTbRkvMP
 lKiJj+VCk7QtsiFHrvzbt9tlrAxezd04sGYfps6rQt71+g7nOT5ljmUlkOAmhdiS74W64T5Su
 4isyXD8ExoCZMUxk4RF0aR7TCkXww4QxGPzRuLZa6u0ZxBCJ1xGGqprOObFUvdIHrJ7/qfoYk
 P2rSaZpLp1rBNL3vINfAcfTWWICxocxJEGci0y7P+SZkKMWVmHApc5O0w/tjJHQJVs6dpYh6F
 2QZwMNwktclsReCOSdZZFXpE0m28ioe507TpnPcwqXHZt45ixBet2JepScobMkGAoSVB/rakE
 BeOwgSM
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--VT/lJ43BMuHmAs/6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On to. 10. nov. 2022 kl. 12.38 +0000 Nick Desaulniers wrote:
> On Thu, Nov 10, 2022 at 7:05 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > Remove Michal Marek from Kbuild maintainers as there is response since
> > October 2017.
>=20
> Randy mentioned that the word "no" is likely missing from the above.
>=20
> Also, Nathan mentioned to me once that CREDITS is perhaps a good place
> to enshrine maintainers emeritus, let's add an entry for Michal in
> this commit v2?

I wasn't aware of CREDITS at all, thanks for the suggestion.  Will be inclu=
ded
in v2.

> For a change like this, please make sure to CC the maintainer in question!
>=20
> Thank you for your service Michal.

yes, and I'm sorry for forgetting the CC on my own.

Nicolas


>=20
> >
> > Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> >  MAINTAINERS | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 61a6848192c5..45c88bb34b6b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11083,7 +11083,6 @@ F:      fs/autofs/
> >
> >  KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
> >  M:     Masahiro Yamada <masahiroy@kernel.org>
> > -M:     Michal Marek <michal.lkml@markovi.net>
> >  R:     Nick Desaulniers <ndesaulniers@google.com>
> >  R:     Nicolas Schier <nicolas@fjasle.eu>
> >  L:     linux-kbuild@vger.kernel.org
> > --
> > 2.37.2
> >
>=20
>=20
> --=20
> Thanks,
> ~Nick Desaulniers

--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--VT/lJ43BMuHmAs/6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmNt2KoACgkQB1IKcBYm
EmkfkBAAxJoHOK0/Zj4msE36KHVfNV7iexEpRcvqHBlZKKrOHS3Kxe0eD3r2FcCI
yyTqVr1WuFo11pTZ3dwejMOO8zsKq7hIHHI5d1B3TukEbb/sJxWsS9oPKjvJvzMm
P1gm3OQ1ckTkPurYmD0ZR8ogrPqbvyhWmzl9oEzQBTneSCMCYYnlZNr/jEQHw6M/
Vdj8nrfA08x0WJ3WHdXy7VYVkcLPP5O1ljN1vcD+qE+Z8/4aI3ypKnp/EUIzO7ZN
MvK4I8MjiFMLUmQu61wslahbEBIGbG7GC/T5AcPo/6ow/Nnrzw1+vG102E3KrwDY
wv6IXmBighdOu8kbW8Kl5CDoE/nlpPfdi4zQ3ZdSOoB5RJBRdmx21WNJc+1W361m
1nLcmp1OuEmV4qErNioY/ZNCDuyBAha8bLZYPtJcJYDseWHaXGxUnZv8uk3M3cDG
0F1MJ9XSWyBYt3tNcNBmLlOpD125HxZ1fMotmdBoXm8iLm4eiyzx8/uxEXFfXsJJ
4bHvW4QUv3PAMqVkbiMF1JuywJOE/k7K6ViRppQVYlhGU5EgTJasOqnCS3mK8vzW
zsh+Gd4NYinHPoPH4P6sVhs9U4eDybLqJPKlMOfjQt5jmvlrXG9AyPL8VcV/lRrl
+VboCRhMJ+c9VzsxwSz6L/hnNaVnkleSuX+Us2oWbFqHfNI/nSo=
=RGEk
-----END PGP SIGNATURE-----

--VT/lJ43BMuHmAs/6--
