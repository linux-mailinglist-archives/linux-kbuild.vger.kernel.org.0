Return-Path: <linux-kbuild+bounces-4308-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE69ADCFF
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 09:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10C41F22287
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 07:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34906173355;
	Thu, 24 Oct 2024 07:02:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3827142633;
	Thu, 24 Oct 2024 07:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729753355; cv=none; b=rkFOiDmajxBL/w+7lcRIWFEl5X+eFf9qc0nshQTaIl8p7JNBsfmctW5T0mVTE19e9FNY673gnj69L8O/GMcStae+3WaticDxSiHZ5nazmynH6jYB3r2jLqCtJRqTzXegjuunt9gjk79f/fy5/2HMwp2kB8MTJxRgmr+W1CEUnfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729753355; c=relaxed/simple;
	bh=afXpT0+7HSVgaX3feHHP2jt3s5tAXbnj2lrXFSQyYrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UVgNLT8qdAPgF/3Gak6Nw/nKZmuPuMWO6Zw0W4w5ZlEQqiI3b+ROrTBUCK7AN5h1BX8x/n7yQ4OuAVfYdndnDvq97fiY7mfur27allqFBbcEIAvN+4KigfOaYlw8u8FNiFBLAxLRf4ipkRae0xrlhPU0gInO6Myn1I1H8OFxhlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 463D05F976;
	Thu, 24 Oct 2024 09:02:24 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/7] kconfig: qconf: use QByteArray API instead of manually
 constructing a string
Date: Thu, 24 Oct 2024 09:02:19 +0200
Message-ID: <6093864.lOV4Wx5bFT@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To:
 <CAK7LNAT_LUBhg3aoX1iumO8vCoiLFfMTJ3xpDkHhM2A3U3HCyw@mail.gmail.com>
References:
 <4960180.31r3eYUQgx@devpool47.emlix.com>
 <CAK7LNAQdRdzbwciav5ewA2P9X=r6CeMb55zRny5QWCe62gR73w@mail.gmail.com>
 <CAK7LNAT_LUBhg3aoX1iumO8vCoiLFfMTJ3xpDkHhM2A3U3HCyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4959497.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4959497.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2024 09:02:19 +0200
Message-ID: <6093864.lOV4Wx5bFT@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

On Mittwoch, 23. Oktober 2024 21:07:41 Mitteleurop=C3=A4ische Sommerzeit Ma=
sahiro=20
Yamada wrote:
> On Thu, Oct 24, 2024 at 1:37=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
=2Eorg>=20
wrote:
> > On Wed, Oct 23, 2024 at 3:29=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> w=
rote:
> > > Using a naked char[] here isn't necessary as QByteArray has a nice API
> > > for all of this. Calling constData() will also always return a
> > > 0-terminated string so no further handling is required. And then the
> > > whole manual memory handling can go away as QByteArray will care for
> > > this when it goes out of scope.
> > >=20
> > > Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> > > ---
> >=20
> > I do not need this patch because I can refactor this function even deep=
er.
> >=20
> > I have locally kept several clean-up patches, but I have not got around=
 to
> > submitting them.
> >=20
> > I will send some of them later.
>=20
> https://lore.kernel.org/linux-kbuild/20241023181823.138524-12-masahiroy@k=
ern
> el.org/T/#u

Even better, thanks!
=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner
--nextPart4959497.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZxnw+wAKCRCr5FH7Xu2t
/ERtA/9Osc6KWA4bFPciz+JJOs9jgRBdH4hjNeKxgHU8F2prdBBDPrZVOUbWcx4l
Z1tsOpp2yYQXMiJ3YFMOD6QFU2iG3OOuxy2qKoy9nrTB+MCIkBltwyh5+qbIXbjy
rhWmNAPEjdJmbfGwT8hbr39BYGtzlHrpVHOBkcXEv+DrcYjeYA==
=Kf0z
-----END PGP SIGNATURE-----

--nextPart4959497.31r3eYUQgx--




