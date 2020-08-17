Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10BD247839
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Aug 2020 22:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgHQUiR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 16:38:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40666 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgHQUiR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 16:38:17 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 7A8101C0BB8; Mon, 17 Aug 2020 22:38:14 +0200 (CEST)
Date:   Mon, 17 Aug 2020 22:38:14 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Joe Perches <joe@perches.com>
Cc:     Michael Witten <mfwitten@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile: Yes. Finally remove
 '-Wdeclaration-after-statement'
Message-ID: <20200817203814.GA12414@amd>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
 <61f8da080e5fac1bc23cdd68c43f199029c0a788.camel@perches.com>
 <23e2e6c2d3a24954bccb67a3186019b9@gmail.com>
 <7d0be10602e31e334ff41299c06f537880c55bd0.camel@perches.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <7d0be10602e31e334ff41299c06f537880c55bd0.camel@perches.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-08-16 21:19:23, Joe Perches wrote:
> On Mon, 2020-08-17 at 03:37 +0000, Michael Witten wrote:
> > Matters of  style should  probably not be  enforced by  the build
> > infrastructure; style is a matter for the maintainer to enforce:
>=20
> I rather doubt style advice should be taken from someone who
> right justifies fixed pitch block text.

Ad hominem?

You may be right but this is not fair discussion.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl866rUACgkQMOfwapXb+vI5AgCgqqvASaG2RCrVCqciC167K6Oo
Qx8An1XgZFI1HgUUND0IM0afkYps5Pis
=a5Ii
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
