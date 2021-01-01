Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9394E2E842B
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Jan 2021 17:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbhAAQPe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Jan 2021 11:15:34 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:58182 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbhAAQPd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jan 2021 11:15:33 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 14CCD1C0B76; Fri,  1 Jan 2021 17:14:36 +0100 (CET)
Date:   Fri, 1 Jan 2021 17:14:35 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux 5.11-rc1
Message-ID: <20210101161435.GA344@duo.ucw.cz>
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
 <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
> >
> > > $ dpkg -L kmod | grep bin | grep depmod
> > > /sbin/depmod
> > >
> > > $ which depmod
> > > [ empty ]
> > >
> > > $ echo $PATH
> > > /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin=
:/usr/local/games:/usr/games
>=20
> Ok, I think this is a broken setup that has a separate /sbin but does
> not have it in the PATH.

That's how it is supposed to work, AFAICT. It is so on Debian here,
for example.

/sbin is for management commands, why would I have it in PATH when
running as normal user?

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+9KawAKCRAw5/Bqldv6
8oR2AJwNWlbT6Y/VRd58r8pV8n0lmqtyFACgoOZfS000gn3VJnW+nd6daPb3S34=
=7/wk
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
