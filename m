Return-Path: <linux-kbuild+bounces-84-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66477F0B96
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 06:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C692B207CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Nov 2023 05:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BA220F4;
	Mon, 20 Nov 2023 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mGrwYJnT"
X-Original-To: linux-kbuild@vger.kernel.org
X-Greylist: delayed 481 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 19 Nov 2023 21:29:37 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF15AE3;
	Sun, 19 Nov 2023 21:29:37 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.48.251]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M7JrG-1qzSRp3Oii-007pR2; Mon, 20 Nov 2023 06:15:37 +0100
Received: from localhost.fjasle.eu (unknown [10.10.0.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by leknes.fjasle.eu (Postfix) with ESMTPS id 6B52A3EA3A;
	Mon, 20 Nov 2023 06:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1700457335; bh=3lMLQJorMuq6B08W72WZQdUrlPYs/kOXg6s6i91JDlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGrwYJnTiu+uRi1VfnfrQkVG7Sd06jcxvQiYF710lgVQfY2+d4vpLQz/ASzwLIt7+
	 xqgYIf/U/PBlkqN5g5GJu9AgJ9WlWMg4erPaLiNtttRtZl/IoO9SH18C2xZyz8avUG
	 0CtmE2G3bRJ37syiEUyA3PUfax75nGiODZzeNJeA=
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
	id E57F06AC; Mon, 20 Nov 2023 06:15:34 +0100 (CET)
Date: Mon, 20 Nov 2023 06:15:34 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] scripts: clean up IA-64 code
Message-ID: <ZVrrdhsjZuKJzK-l@bergen.fjasle.eu>
References: <20231118081334.1308242-1-masahiroy@kernel.org>
 <ZVp26K9b8Apuy3FD@fjasle.eu>
 <CAK7LNATj65c0beTb5oXMDskiaFnxp1hoMOF0yG15pGv7cujNEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C/HoAfnBXhbQiVdf"
Content-Disposition: inline
In-Reply-To: <CAK7LNATj65c0beTb5oXMDskiaFnxp1hoMOF0yG15pGv7cujNEg@mail.gmail.com>
X-Operating-System: Debian GNU/Linux trixie/sid
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:x0KRONtpSOd4AkYDReHWERJeRRCTo4wv5k0xPCFce0A4elJIO8O
 uHIP3X/N8VfMdOJTpNra88u8/zsotkyhztZvTorvNP4Fl2cq1gFADNla7aCQ/xc71PE9AV/
 gD0x+TevpHyvSKk45vLWNcpxSCXBW8/fNNHI2hO64YfLwQjJxPGdw9IA1pJccq9US+Zvd4T
 RYUmnqx7PxDE8CsA8A/Rg==
UI-OutboundReport: notjunk:1;M01:P0:JgPrZR0myS0=;EjImHojKBFvKcRIzmbuDsVFwuD2
 2FqO7v2bM3bixNaSo+a/wY8bAAGEz32Xmc+V8kJum50fEJrJ+69JN8D1cel/CgZmN3b6p4HxA
 iFoZmVZUH/vOrHanzvEpOi++GynmgTggTwFH9IojWkm2IjHfc87jI+ZR4ntePYwToevtRmL/l
 rBl1lVGPVRw3EdK2RbtU2jQLZIUT/HwQ8zn4VkY1XZBXi9s3rTyPRnlqKvsU+efEWSFNKq3jV
 vcvq3BBw27xb2vL17uLaNdNg3x5atjlIsyYV0w6BgCjYq3NtjPI/4AQgAKcahM23dq2vparUB
 KAnn0tHOlc+fxEM9zwZcSEzkvrzwtmwPHV9aeddZEFZuRXpbijU7ahaIkWLxmyTIyAjTAT6G4
 m1J9cAz43z0Ps52i5XuAwTyt7HS1p97R1Z8tTY8CHrQu8HhQ7uUb0EDefhB+eV0rpkvzcwekg
 Z7hn1tSw1tAOvEa6fHzMKRekR1KYl4jzjXvMGOq/ay34ybAdv1sqiRUElQ4XI9flAsCOG5pvZ
 oF3mcWELC9elaW+VL2buVRblTyeSSEKmGsctZTqnBLzHJJk2F8Dn3J5af+R/fvLXkgeKv1dqH
 wGo6BHM97UymBmfcrYLwXFfWqhxFLHsyX/g401UWZ/SvD8ACcudLIw8erjzagF1HzrSK+EwCU
 9K9visPhrqgeJymOBtcBQ3ZNMeo/5bsJCaIpGu1ojI0qd5KKtKGprDPHSx2wMvyN/0tGmq2H+
 XlldTUHnUqVCp142WEc91Bra1L25ugORYzmzP1J4XY4IjPZbKYOQqONp4QTLWR/HQViCrRfhE
 ckNLUG/pB+QWttY4L4KOIlQ+KqFgKFT/g3RZx0NodmKC+h1IsQmqb5lzAJl+GuS4MdI7Ng2cz
 DEeRgVFf/IMk4ug==


--C/HoAfnBXhbQiVdf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 20 Nov 2023 13:18:17 GMT, Masahiro Yamada wrote:
> On Mon, Nov 20, 2023 at 5:58=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu=
> wrote:
> >
> > On Sat, Nov 18, 2023 at 05:13:34PM +0900 Masahiro Yamada wrote:
> > > A little more janitorial work after commit cf8e8658100d ("arch: Remove
> > > Itanium (IA-64) architecture").
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/checkstack.pl        |  3 ---
> > >  scripts/gdb/linux/tasks.py   | 15 +++------------
> > >  scripts/head-object-list.txt |  1 -
> > >  scripts/kconfig/mconf.c      |  2 +-
> > >  scripts/kconfig/nconf.c      |  2 +-
> > >  scripts/package/kernel.spec  |  6 ------
> > >  scripts/package/mkdebian     |  2 +-
> > >  scripts/recordmcount.pl      |  7 -------
> > >  scripts/xz_wrap.sh           |  1 -
> > >  9 files changed, 6 insertions(+), 33 deletions(-)
> > >
> >
> > Thanks, looks good to me.  Might you want to also remove replace the la=
st
> > references in the kbuild files?
> >
> > scripts/recordmcount.c  uses cpp symbol EM_IA_64
>=20
> Thanks, I will remove it too.
>=20
> > Makefile                contains two comments with examples naming IA64
>=20
>=20
> Which line?  I could not spot them.

oh, sorry.  Something was weird on my side.  Makefile is clean, indeed.

Kind regards,
Nicolas

--C/HoAfnBXhbQiVdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmVa63EACgkQB1IKcBYm
EmkALA/+NEszFXyPP39yKOPYsCbUS8p4J0FBzA0uhdlvl+1DCBIS08+HFjxIluF1
Nzv1QZNGWSuLM5ZuQNb2QLQIsyzHIxNSp/jGe4pJq4UeJDAbzpypsFpFOp7qyIFc
8N3qlhy10SEuzkOlKPG+qHWv3bPPxacHP7I5erPV134sap/Ffs38O6f1aMNCDL9D
Kl/6KjyJFsPjDB0tJKcdaIvQhnnlLKyRgr6UOR6Fhn9U6+g2vEpstkfplt7YdoTB
5pmbrzh93qDfwMvryIWeBB2g2HQpDvALRJPIdggNbko9MhrFL7uCo0+pnJ1ttop/
Whe9OmdUHzt7cl9704YL+B4GLz1KyNxKNkxOM2Tz+wkJ8MNmqXSD5aKz0uekWbOF
mWklu0BIz5puSMO5K3YZOEd/M7jlnj+xbRJ4oa3HK2/dwpFHwjqwJRyz0PkyWcp7
dfI/fqQzE7IOJqxqyUsDnFaYQoHZyonN9iQrTllC2exdxRpp0c8E3wTcxuUxqQt7
IkrhxDJg+n9A3hLMkqjGLTXzb5e9uGg2Rpz/WRPHbu4gS8ekqchgvVvoEAwSxSg6
mxU4sNZ8sthYUextHCkklYiirpXZeE/LbFVxWDtdkxS/hH1JQ7dlChE+6lf//khT
a/iHuGMhpa51GOB/BAlh3b1LcSGlgl0ZUWbbey5lR4/rG/ENfSg=
=S12e
-----END PGP SIGNATURE-----

--C/HoAfnBXhbQiVdf--

