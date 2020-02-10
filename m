Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5169315831A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2020 19:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgBJS60 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Feb 2020 13:58:26 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:50192 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgBJS6Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 13:58:25 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 0D4AF1C259A; Mon, 10 Feb 2020 19:58:24 +0100 (CET)
Date:   Mon, 10 Feb 2020 19:58:23 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, youling257 <youling257@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/kallsyms: fix memory corruption caused by write
 over-run
Message-ID: <20200210185822.GA420@amd>
References: <20200210161852.842-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <20200210161852.842-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-02-11 01:18:52, Masahiro Yamada wrote:
> scripts/kallsyms crashes because memcpy() writes one more byte than
> allocated.
>=20
> Fixes: 8d60526999aa ("scripts/kallsyms: change table to store (strcut sym=
_entry *)")
> Reported-by: youling257 <youling257@gmail.com>
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Tested-by: Pavel Machek <pavel@ucw.cz>

Thanks!
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5Bp84ACgkQMOfwapXb+vIjYQCfedtM2eZCZ29z9ojkk2B0W2ML
1xcAoKkKc3GstwIw7jiXhejvrEAuVRQe
=ZKh/
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
