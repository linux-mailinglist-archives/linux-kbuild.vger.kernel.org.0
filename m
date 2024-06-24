Return-Path: <linux-kbuild+bounces-2243-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2312914846
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 13:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E1E9281D2E
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 11:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A505137C33;
	Mon, 24 Jun 2024 11:15:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928DF130A79;
	Mon, 24 Jun 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227713; cv=none; b=u1IDek2o8PCs/+uYuT7FOFz1Ki62GP6wIJK8y/nirbfHge6ri04Sz4rOC2ryy4tI+2c29+3sg5iigZCci7mE/TiDm24KZf60dOx2lF55hsi22ffwCMnCLRR1g7D01rcc4ajMeP3Kl16e1TkqvmNH2Dvqa5Tl2ug5VJi/UaxpAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227713; c=relaxed/simple;
	bh=2z3Eqkol4JEiYQ5tJoZAaoWTE1bCIiqERw5USNnFyqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHatrxKpMQxI5hFFKJKlCB+AO50kGtLYsXHjoI3bdkytS1AicgC4dUiPfp1+a3mcO/ygXhHBqdJRpBmxae/vLhCYR0SdhTX4PQcbN6xMx9IeUHHHTm4ktVf8S64hK/3J89kZABM9Cv4iGEUa9Z7XiINR2+rn4m+B0qDoSkavnG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (cr-emlix.sta.goetel.net [81.20.112.87])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 4D3855F869;
	Mon, 24 Jun 2024 13:15:07 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Nicolas Schier <n.schier@avm.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Use $(obj)/%.cc to fix host C++ module builds
Date: Mon, 24 Jun 2024 13:14:58 +0200
Message-ID: <4576559.LvFx2qVVIh@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de>
References: <20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2330569.ElGaqSPkdT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2330569.ElGaqSPkdT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 24 Jun 2024 13:14:58 +0200
Message-ID: <4576559.LvFx2qVVIh@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de>
References: <20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de>
MIME-Version: 1.0

On Montag, 24. Juni 2024 13:12:14 MESZ Nicolas Schier wrote:
> Use $(obj)/ instead of $(src)/ prefix when building C++ modules for
> host, as explained in commit b1992c3772e6 ("kbuild: use $(src) instead
> of $(srctree)/$(src) for source directory").  This fixes build failures
> of 'xconfig':
>=20
>     $ make O=3Dbuild/ xconfig
>     make[1]: Entering directory '/data/linux/kbuild-review/build'
>       GEN     Makefile
>     make[3]: *** No rule to make target '../scripts/kconfig/qconf-moc.cc',
> needed by 'scripts/kconfig/qconf-moc.o'.  Stop.
>=20
> Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src) for
> source directory")
> Reported-by: Rolf Eike Beer <eb@emlix.com>
> Signed-off-by: Nicolas Schier <n.schier@avm.de>

Thanks, works for me.

Tested-by: Rolf Eike Beer <eb@emlix.com>

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
--nextPart2330569.ElGaqSPkdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZnlVMgAKCRCr5FH7Xu2t
/Fq4BACjgFonAJrrWCLHfZuZXRuL9At20+vxLyztALiBItlEzmAZvFaoD++uwlh0
JoqvNeHQWGkTPKfDvWO+T6Nnv1hMDBLNl4zG7e4Tc2htyXQr3WP1jA5ZLYV4Zqxg
SYEuSqukITD7qy/uyGhPRT340SRbVjxCu4mXio+EASJsqoV1aA==
=si0o
-----END PGP SIGNATURE-----

--nextPart2330569.ElGaqSPkdT--




