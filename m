Return-Path: <linux-kbuild+bounces-8075-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E3B0B7E2
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Jul 2025 21:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A543B3AE6F2
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Jul 2025 19:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC3A1DF990;
	Sun, 20 Jul 2025 19:08:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A44B1C700C;
	Sun, 20 Jul 2025 19:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753038507; cv=none; b=a7SavvCBOVvY+f7hoIEUV9A/RorNxfPAV6UJ1hYFT2NIkGsSURUQd2Y6Jxs/YsWo3oj1+p7HbFwjSIOea9c3UQdqM0ZoJ68/eAM4x4CjGuVejdXY5L1Kfb+0khhmGWGhppXxCIvdDYIm9Vkxz8koKN31pC5LLLQNvE+Di0Spciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753038507; c=relaxed/simple;
	bh=o098JcNwqE9EQXxJ9VBHFsqHFPQ0jjzfsmYIL2+lOaw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=im2eZ58PzUBRRFyGleu7HgQKU9Grk/crQhJdxteEgGKE6dh8taAnb6poBCNENRIstuiTmk6QuuQk75u2GrB3nam6Sx7EzM2VVBrELpXsBeJfN1YHm5arenZ97TjIP0Mr8pyMvcW6smb4HDLmCxvbda0/PbVfcm/udYNC6I3Z6u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [192.168.0.1] (c144-156.icpnet.pl [85.221.144.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mgorny)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 22675340C53;
	Sun, 20 Jul 2025 19:08:23 +0000 (UTC)
Message-ID: <5cd7b14179531cec3cdc8fe3c40a639ccf0be5c1.camel@gentoo.org>
Subject: Re: [PATCH v3] kheaders: make it possible to override TAR
From: =?UTF-8?Q?Micha=C5=82_G=C3=B3rny?= <mgorny@gentoo.org>
To: Nathan Chancellor <nathan@kernel.org>, Sam James <sam@gentoo.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier
	 <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 20 Jul 2025 21:08:20 +0200
In-Reply-To: <20250719201002.GA3285766@ax162>
References: <20230412082743.350699-1-mgorny@gentoo.org>
	 <277557da458c5fa07eba7d785b4f527cc37a023f.1752938644.git.sam@gentoo.org>
	 <20250719201002.GA3285766@ax162>
Organization: Gentoo
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BLMLXisr0T9GZG1v6FDQ"
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-BLMLXisr0T9GZG1v6FDQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2025-07-19 at 16:10 -0400, Nathan Chancellor wrote:
> On Sat, Jul 19, 2025 at 04:24:05PM +0100, Sam James wrote:
> > From: Micha=C5=82 G=C3=B3rny <mgorny@gentoo.org>
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
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>=20
> I assume that other places that call tar within the build process are
> not problematic because they do not use GNU specific options, such as
> scripts/Makefile.package and scripts/package/install-extmod-build, or
> maybe that people just have not tried building those packages with
> bsdtar?

Precisely.  We focused on the one place which actually breaks our build,
to avoid touching too many subsystems simultaneously.  If this is
desirable, I can look into replacing the other instances.


--=20
Best regards,
Micha=C5=82 G=C3=B3rny

--=-BLMLXisr0T9GZG1v6FDQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQFGBAABCgAwFiEEx2qEUJQJjSjMiybFY5ra4jKeJA4FAmh9PqQSHG1nb3JueUBn
ZW50b28ub3JnAAoJEGOa2uIyniQO+RUH/jqKvDvlMnVbO4eD/1oms2I1Y8MhQYMG
O8Oj3vgS7EGCyO+oTnP98p8XXye9BgBZRm5uRVSLY/dU7dY520A8em58JPQ5B6RT
cy9pwIi4x2qCFG3+XpVhW3+Um8lYWr+CWNP3IEHIbM6ECiukyDOLeOgJwXkRpLph
QbBbZ8ojl1DeDNoG4E8mzKekMYe0O9XCk99Q6Lvr9GCFIVCVtIOu4IYiFd5tfCsv
/ZDUlD9EDXstpAuzhDzMbTE52tQKNr3W7PHkYVuxe6GwWtEj2XCPQOIsLvlRoeAz
qyrwDndTDhp9nYt39rNlrzUBGn4wIyYuB7V8tw9KkAGFSrIokF+mpD4=
=axnc
-----END PGP SIGNATURE-----

--=-BLMLXisr0T9GZG1v6FDQ--

