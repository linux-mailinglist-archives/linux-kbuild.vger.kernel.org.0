Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15017247A01
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 00:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbgHQWJU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 18:09:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50968 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbgHQWJN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 18:09:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1AF0D1C0BB6; Tue, 18 Aug 2020 00:09:09 +0200 (CEST)
Date:   Tue, 18 Aug 2020 00:09:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Michael Witten <mfwitten@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        John Levon <john.levon@joyent.com>,
        John Levon <levon@movementarian.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Makefile: Yes. Finally remove
 '-Wdeclaration-after-statement'
Message-ID: <20200817220908.GA3701@amd>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
 <20200816175303.GB1236603@ZenIV.linux.org.uk>
 <20200817204223.GB12414@amd>
 <87lfid6kpi.fsf@x220.int.ebiederm.org>
 <CAHk-=wj04wKCjHz6b6d7N58xoS4AftnwTUBaXsEekQ5RhfWVnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <CAHk-=wj04wKCjHz6b6d7N58xoS4AftnwTUBaXsEekQ5RhfWVnw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-08-17 14:29:37, Linus Torvalds wrote:
> On Mon, Aug 17, 2020 at 2:15 PM Eric W. Biederman <ebiederm@xmission.com>=
 wrote:
> >
> > Does anyone remember why we added this warning?  I had always thought
> > it's purpose was to ensure we stayed within our chosen dialect of C.
>=20
> As far as I'm concerned, that's the primary motivation.
>=20
> I'm not seeing why we'd suddenly allow the "put variable declarations
> anywhere" when we've been able to keep from doing it until now.
>=20
> We're still building primarily good old K&R ANSI C, just with
> extensions. Wild variable placement doesn't seem like a useful
> extension.

I certainly hope we are not going back to good old K&R C :-).

Submitter believes "wild variable placement" can help with
#ifdefs.. and that may be actually good tradeoff.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl87AAQACgkQMOfwapXb+vKiVgCeIkXAgbXAQQ5tusMee++/3DR4
lz8AnRYXzPxLP4LdF9kvOHHKNW1y76Vk
=KDJT
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
