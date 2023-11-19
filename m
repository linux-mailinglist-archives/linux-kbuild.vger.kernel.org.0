Return-Path: <linux-kbuild+bounces-78-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F467F0908
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 21:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C849B1C20831
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 20:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70C411CB2;
	Sun, 19 Nov 2023 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="XPIbiOQx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DFAE5;
	Sun, 19 Nov 2023 12:58:58 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.48.251]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M6lxe-1qykrc2S34-008GuM; Sun, 19 Nov 2023 21:58:18 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 9F4B13EA1A; Sun, 19 Nov 2023 21:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1700427496; bh=uYn77hM0H6KVAg5lQGBA7vCO9k4bMUeck3pbHfQlxTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPIbiOQxT2EaJ4Wc3bsifRPSQJhFUpD7e+MsF0MBAH1b1K7fyHlD3LFTTQpIMe3O1
	 x6lZH+WvQzhq2F1eeI2E27VxXJeSeR7Unfhj5AblMkraB4iciAOAL8E3R3OlSMhLK2
	 mrxZDQ/dgniSAsZMa8DuGZD5Rc9xYFdBMPveLgy0=
Date: Sun, 19 Nov 2023 21:58:16 +0100
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
Message-ID: <ZVp26K9b8Apuy3FD@fjasle.eu>
References: <20231118081334.1308242-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OFAv1nkqeaC5sKyW"
Content-Disposition: inline
In-Reply-To: <20231118081334.1308242-1-masahiroy@kernel.org>
X-Provags-ID: V03:K1:Hn0qeTsXXnloRaa4fRETC0OhlP3ch1AWY9/NCkbsFhUDN6Dbcqx
 rhmzHm445z5OF6H8Btlhgt61cCEd0mc5va2yJeboZryLalSHRwvKe0abLxdA074ODdVJN87
 d9kYlttfzGbCUaVxWnZSLCZ88TC0aIKc4VBModlL5TvCxDbk68zCZz652g5huT3XxAinNCf
 h0RLGXcCuobdXL2nXqioA==
UI-OutboundReport: notjunk:1;M01:P0:cDQrlwLPm2M=;VGpOEJKBsNj44z/pKGqdJ5bs33U
 33bihiAjWxZZ1nttw5IVB29DTczAVPEH/jENnKvBVNJM3d3g12cKtAhe5ZZkGa8IPcyIfcu7F
 figeLOzwXPwyxCnBik0b+gfiFUYXwbCH6Df7S2OFZd7zLhBqh6Iu32ftfddnqLxLqzysh4doE
 VvDpTjyayLUAA/hPbcFfxLxsfxvfCRFmGL/lCNOzejedrNiUDXXg2t4Pqvp0DJvLd5C3UBX4r
 pn5O5fslvJJHxy81yZdknHUpBDqwGESrq0qw4wC6lSYm3fs0Gv5KmRJvFzq9yN0+zSxWFeXls
 bsrW5GaT/ZQImwuohN9psGcsdqKPCW7rXyhtwZ/1IVlE4RYLzNzvQXh9eHUlvgCV6fES6OuTj
 mcokQPY3IyvS7JXf8SDOEKVspA4UrK8UJdH/NtZdRbS5IoysozxwuL/N/WJIn9VVG2iyRCP3s
 PAC4uGLn4jn04FpiSxDdHFZ8gvyNRGMgfYHfADgcRVZA1RW5Tf7xfKpxmaJ6Tc7OFj9WZX77e
 6ReAFHSArFLa2oD8o5ShqsFrscWNE73P1tMLIzD/zYSbQpEnzy/NzqLemczvpJIEwix69YiiM
 wUaCODw4HNnjudPTkFEq5Y0GR/3yTey3ll6h7JEVn2Vdcq4zijDnFqWJm/mCMGl5xNywny/q7
 i0Kb7Fj4Go33dCB/9/AYf56QKDrvhgZusdLDAeUplpwp47NoJanegPe20MdMgFtXnUUQF1sOR
 d6rKcS75gF0XpCD5IWe2UvkjhpX69VgWfDHvdR+C5wBjnXBfHllqoxvJVnSy6Sjl04T1pUJuo
 aJ4S7NpgGSN3qbQBwiQQnEaIyV4nmX1GpqzgywtEw0BMId375X4E5cvxkcu8h3KFf/5VJ2IN+
 qI4Flfc7W6zR2Uw==


--OFAv1nkqeaC5sKyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 05:13:34PM +0900 Masahiro Yamada wrote:
> A little more janitorial work after commit cf8e8658100d ("arch: Remove
> Itanium (IA-64) architecture").
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  scripts/checkstack.pl        |  3 ---
>  scripts/gdb/linux/tasks.py   | 15 +++------------
>  scripts/head-object-list.txt |  1 -
>  scripts/kconfig/mconf.c      |  2 +-
>  scripts/kconfig/nconf.c      |  2 +-
>  scripts/package/kernel.spec  |  6 ------
>  scripts/package/mkdebian     |  2 +-
>  scripts/recordmcount.pl      |  7 -------
>  scripts/xz_wrap.sh           |  1 -
>  9 files changed, 6 insertions(+), 33 deletions(-)
>=20

Thanks, looks good to me.  Might you want to also remove replace the last
references in the kbuild files?

scripts/recordmcount.c  uses cpp symbol EM_IA_64
Makefile                contains two comments with examples naming IA64
scripts/checkstack.pl   still holds credits for its (now removed) IA64 port,
                        but that might have been left by intention

Nevertheless:

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas

--OFAv1nkqeaC5sKyW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmVadt4ACgkQB1IKcBYm
Emlj9xAAmRehY+XVR6LyugIXBFSK9TJYdTtQUKcpxd9TAFWY714LP1UMqgmWTdFk
IXOcXOjg4Esln9fOt9QQXu3R2ABk+YYQxkfG6cZo+soL1M4Tr6jPuQ+9D0RZBLGo
U5+U5EtQsfuXedygTsO3RZa2eIxTun7p7ubatA1igrXpUykfiFWAaZzancxzuYFE
wWzuD8xU00D6VVB4pM2e5B5geW+ne/SPuBfiYXsSm1GxgI/PTmZ8I09UVy15IGgI
qC8uxSseA3g0MCZTqzntuQUAii73Fl70rWKaGibCyKPPH6+/TeizTZHV72OnKUJh
oSB+2NDGVqXA3hqo/gJvxyX3mZiO5FXV2NtygEwmwo1BZGd9lX/DLVxidUP56+CU
v52ZNUqZv5fA71VYAeoIARCQ55Cjfx+cxhUgutGUb05GEd2Mj4aai4g3EzCJ3Dkr
AFMTxb+0uLI2b6kdK/naWnAlGxGn927pKEHW6nOIjCcwaqXvc0nuXoKn9LtDv4h5
R2DYj5WoKLQGS+Udmd2mJqmOYVYYMJ1o6JsEQqPgmmAWzwdhw/FeJlHrsiMVv/0u
lRit7nU5cWLK9r2ZVrFezDHG0L2bFkoyZUYLRZPq72YavHSWZTXA3mjbaY5sItd3
p5xtQGgMn4QTbAM9khTny4T48XirYokI+VOSttcPRau7ujP3cRI=
=DYXv
-----END PGP SIGNATURE-----

--OFAv1nkqeaC5sKyW--

