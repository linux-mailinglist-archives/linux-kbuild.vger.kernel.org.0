Return-Path: <linux-kbuild+bounces-4309-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D0B9ADD07
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 09:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E14B81C20A7F
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 07:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9135156997;
	Thu, 24 Oct 2024 07:05:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B3175568;
	Thu, 24 Oct 2024 07:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729753513; cv=none; b=fyelzNFDjqJbRs411lsOJrKb/NAiU2+GvJQg/cCbPMOw/bVyoYZhyCNmxxbO9T5v/SxJOhjclQ3bN0paQBbX3WdWhod8OTHOxYbOTnliJaq2GeMgltSbl/iDbjzNbxCPYjjzsXd2H081ZIJfLde5O1jeaj1b6s4qhzX6Gac0H5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729753513; c=relaxed/simple;
	bh=gbjQcn6dQivpXZ+ff7C1DgXvhxXdE4UcnY9CNJ7VstE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kg6C2bigEzg4EHVMmu9Mgz5xNyyUl4vEPr/y/kYMvTb+0c0cXOYTTZIbZYVBEjIyRm1CCwWUYIPHnMJfPQ3enzOAwKPo3nr3impDRuiaF52cMx1PHm7t2tLERTovuCMfnhWXMAE4Kyzb8KJFBGO5lzMzPezrZp0G6VC0QCguQco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id B02245F976;
	Thu, 24 Oct 2024 09:05:08 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] kconfig: qconf: use nullptr in C++11 code
Date: Thu, 24 Oct 2024 09:05:08 +0200
Message-ID: <4931256.GXAFRqVoOG@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To:
 <CAK7LNARSM=EDgHN9=j1-BXoeZ5aq8O+nCZeBUeGrvhq2+1fQvQ@mail.gmail.com>
References:
 <4960180.31r3eYUQgx@devpool47.emlix.com>
 <2286001.iZASKD2KPV@devpool47.emlix.com>
 <CAK7LNARSM=EDgHN9=j1-BXoeZ5aq8O+nCZeBUeGrvhq2+1fQvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1901925.tdWV9SEqCh";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1901925.tdWV9SEqCh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] kconfig: qconf: use nullptr in C++11 code
Date: Thu, 24 Oct 2024 09:05:08 +0200
Message-ID: <4931256.GXAFRqVoOG@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

On Mittwoch, 23. Oktober 2024 18:41:09 Mitteleurop=C3=A4ische Sommerzeit Ma=
sahiro=20
Yamada wrote:
> On Wed, Oct 23, 2024 at 3:35=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wro=
te:
> > This is type safe as it can't be accidentially assigned to something no=
t a
> > pointer.
>=20
> This is incomplete because there are more call sites that use
> 0 instead of nullptr.
>=20
> For example, you can replace nextItem(0) with nextItem(nullptr)
>=20
> Anyway, I do not need this patch for now because qconf is
> under refactoring, and I will remove a lot of code.
>=20
> Please come back with a more comprehensive patch
> some months later if you are still interested.

This was just some obvious cases I came accross, nothing complete. If you a=
re=20
going to touch code anyway I personally would recommend using nullptr whene=
ver=20
you touch that things anyway and maybe someone can clean up the rest later.=
=20
But this is nothing that does any change in behavior, so I'm fine with drop=
ping=20
it.

Regards,

Eike
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
--nextPart1901925.tdWV9SEqCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZxnxpAAKCRCr5FH7Xu2t
/DIhBACftH7ZJoGC4Lp8bNDBqqG2tylobHubHbmRbJEHmf5q3GsFEF+kbgUPr6v6
bPTOerEeHAp11GhM8BqIBb4k8iNKlhR8zfpTMzt8d33wFgfxJ/l404SLVxKSlubL
Z8om7TbxBIdPe+yukbpuukIxvheBkejpSUtzRFyrgRltRX3vfQ==
=VBKh
-----END PGP SIGNATURE-----

--nextPart1901925.tdWV9SEqCh--




