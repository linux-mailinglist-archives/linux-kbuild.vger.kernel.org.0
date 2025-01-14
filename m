Return-Path: <linux-kbuild+bounces-5479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE0DA10777
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 14:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27AB17A1699
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8252361DF;
	Tue, 14 Jan 2025 13:11:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBC1236A91;
	Tue, 14 Jan 2025 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736860296; cv=none; b=YRNuFfRA/DQqe3bT8k+FsacjyfQm6I7AAmGt5HMa1T8SZEiX95ntnwSXh9xtAtejdNuC/CFXnasvSEp2MNzw2wo7hLr2PbJbA7uMvFUqjpAULs4JURZE/D83mvjNvuTkTrr0FlS9hIUWYwbRonCzBAWw9cbQwjEKkWHuVebxwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736860296; c=relaxed/simple;
	bh=bb01RFVYnLNPJeRvAiSESvhXrqtKFLtaApA2++tFoJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gRF9AJQMQMl4PK+nZvk4ycc63S8mb395f8Gr/9Gzx9xcvMyP84iS1TretxNPmhr/vtmYJhWz2vFYnKPn9W5/YUBrlpevysskHBDMaryNLCQX2jB/bl3neOMCuHoPrnmdI3yi+ZHWBrA2C4r4iLyy8K2fe/6hXL7njVtiRQg51jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id EEA805F9B1;
	Tue, 14 Jan 2025 14:03:57 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] kconfig: qconf: remove overloaded constructor
Date: Tue, 14 Jan 2025 14:03:57 +0100
Message-ID: <13679214.uLZWGnKmhe@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To:
 <CAK7LNAQq29ws6+vNUzqfUr867q8h4EbWzx6SQgHB0YzaZ2LcEw@mail.gmail.com>
References:
 <5843611.DvuYhMxLoT@devpool47.emlix.com>
 <2207289.irdbgypaU6@devpool47.emlix.com>
 <CAK7LNAQq29ws6+vNUzqfUr867q8h4EbWzx6SQgHB0YzaZ2LcEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2972144.e9J7NaK4W3";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2972144.e9J7NaK4W3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] kconfig: qconf: remove overloaded constructor
Date: Tue, 14 Jan 2025 14:03:57 +0100
Message-ID: <13679214.uLZWGnKmhe@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

On Freitag, 10. Januar 2025 18:29:06 Mitteleurop=C3=A4ische Normalzeit Masa=
hiro=20
Yamada wrote:
> On Thu, Dec 19, 2024 at 4:23=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wro=
te:
> > No extra implementation is needed for this variant, provide a default
> > argument to the matching sibling instead.
>=20
> I am not sure if this is equivalent conversion
> because you are changing goParent(true)
> into goParent(false).

It is not, for exactly that reason. Found that out the hard way, i.e. it=20
crashes in some situations which I didn't notice before. I'll send an updat=
ed=20
patch.

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
--nextPart2972144.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZ4ZgvQAKCRCr5FH7Xu2t
/Md5A/kB2j07HxATFL4xv7+tq+JoQQ52YWlTrvArSJygjxC1m3hdz20zw9Z5E1UU
Il2tBSJS+PEpZUJ0IZJ/PH1Cky9RWCh7RTON9VVvHusVJ1ZpZeTLewgrvO3Muaqm
xt71wH2ODGG+Bc1PC/sNNtWG+RxyOBybi2i9GwV/2qByPyo0KQ==
=L4gv
-----END PGP SIGNATURE-----

--nextPart2972144.e9J7NaK4W3--




