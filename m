Return-Path: <linux-kbuild+bounces-8248-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36796B15034
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 17:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DC87166858
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 15:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5477328F51A;
	Tue, 29 Jul 2025 15:33:29 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16F128A1C4;
	Tue, 29 Jul 2025 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753803209; cv=none; b=g72AuelhqFtd+1FysQFa2Q4thPypWUXnwODQiJe18rIpKRxSUUVyhrsLzGC5DzfqcSuw6Qk+jFRzFVxIv4vjadW7X6AYT42o7+gRIWd95x7jnOxtrDZTJt8K7TUneUk/MCyDYqxc9KAR77Vo9wEc/S3oKpud86/xwKFwPqI0Nko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753803209; c=relaxed/simple;
	bh=5CA6jqP9l+11PjO7p/V5HDvQgXMQpXP8whct/xKMVF4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MfItbpuVXudBzrCOURavTVpn5TMYZKrQ1WXLwDjeL8g7pBYHLT+YPVZfNogU6QQ/HysxfJk/CGPz65PbQIoe/Cfz2lkRGr7a+YREI6N33hlgb3jtwIsG2L6vIbaS1VlClzy7H6qZ55jY61abBEpsIHdjrzy1MOIy100JQKGtiMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.0.1] (c144-141.icpnet.pl [85.221.144.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C60C7340DF2;
	Tue, 29 Jul 2025 15:33:25 +0000 (UTC)
Message-ID: <1a063f9ee31b007254f725d5c3dedf81c515de78.camel@gentoo.org>
Subject: Re: [PATCH v4] kheaders: make it possible to override TAR
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Sam James <sam@gentoo.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 29 Jul 2025 17:33:22 +0200
In-Reply-To: <CAK7LNASYnfW8hyTYY1vySeUgg2tCJc17Rkz4C=sVCNhpiNO2GA@mail.gmail.com>
References: 
	<CAK7LNATotYMHVgNHkQcT33qQK+fdZAjoQpdJqtKKWT18uJcPXg@mail.gmail.com>
	 <20250729132500.343778-1-mgorny@gentoo.org>
	 <CAK7LNASYnfW8hyTYY1vySeUgg2tCJc17Rkz4C=sVCNhpiNO2GA@mail.gmail.com>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oppdaqqR6eUH0fiUliya"
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-oppdaqqR6eUH0fiUliya
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-07-29 at 22:43 +0900, Masahiro Yamada wrote:
> On Tue, Jul 29, 2025 at 10:25=E2=80=AFPM Micha=C5=82 G=C3=B3rny <mgorny@g=
entoo.org> wrote:
> >=20
> > Commit 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226 ("kheaders: make header=
s
> > archive reproducible") introduced a number of options specific to GNU
> > tar to the `tar` invocation in `gen_kheaders.sh` script.  This causes
> > the script to fail to work on systems where `tar` is not GNU tar.  This
> > can occur e.g. on recent Gentoo Linux installations that support using
> > bsdtar from libarchive instead.
> >=20
> > Add a `TAR` make variable to make it possible to override the tar
> > executable used, e.g. by specifying:
> >=20
> >   make TAR=3Dgtar
> >=20
> > Link: https://bugs.gentoo.org/884061
> > Reported-by: Sam James <sam@gentoo.org>
> > Tested-by: Sam James <sam@gentoo.org>
> > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org>
> > Signed-off-by: Sam James <sam@gentoo.org>
> > ---
>=20
>=20
> Applied to linux-kbuild.
> Thanks.

Thanks a lot.  I'll try to find some time in the future to look into
other uses of tar, for consistency.

--=20
Best regards,
Micha=C5=82 G=C3=B3rny

--=-oppdaqqR6eUH0fiUliya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmiI6cISHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQOgoMIAK+QwJjK7jPpjfnlf+xnzbSnY6js/eO9
i+LkIfJ7btW+8eynIHIgWdJVAZ0vWPX63XL7BFaBHwWprFnMbVN1k5gxFQ8e+4+y
BlwJBn56xjZacU1uZLSQPQQnbgscF3k2B013ImU4IVujxdftokNhrMCw0lBXQVJh
Y4RSI9hmUvivj3vDHNQ3Ge0QBsATm0Wy2eMU6HAGcYJYqLSX+uvoUbdxAuR17gYh
qkRFLgLxNJevEh2pUTU4z+I6f5oLyaZcHZ3M0xXueCFB7fiTjLEF3yFrxW6Ajldm
3rn2/NVU1AbTen5L/0HeZuNY6EOfEb/ATBt41EqtdGCNC2hPYsmxBJE=
=v6g0
-----END PGP SIGNATURE-----

--=-oppdaqqR6eUH0fiUliya--

