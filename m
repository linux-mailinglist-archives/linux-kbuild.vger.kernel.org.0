Return-Path: <linux-kbuild+bounces-8107-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B831B0EA9E
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 08:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41C7A1637C5
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 06:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9900A264A65;
	Wed, 23 Jul 2025 06:28:30 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F417BA6;
	Wed, 23 Jul 2025 06:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252110; cv=none; b=bASlvL0RxiR/15Iu6Uo4y2HdftXZ03aVc0Cdun7Xt0Jmg9Lh+2Wtw9oXRlGWZ7N3aff3Xqjn+L22SRNLzyaUjSqF/2XmNKWZnHj1Ev7LhpidWXJFfr+khxfoXOqVUst8MZH5HLrkqHyrqve6Cn/AMvvwvHx1llWZ2GdLn4r3DoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252110; c=relaxed/simple;
	bh=gXGQcekBerAG79WCEWyjCM2dnXbcfuYoLMEPkmOyLAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s89uaZUga3zU1eQkiicw0vtmDrwsBMIiygce4zxPHyn8DuBELcbu35bB5pp+t0YHZjNWwh9xF/SaCvaJkKGNsZRZuUWktawdF8A9/fmVP0WSH++cYoNplrHNB7k4AEffiTwDiMhdH1t3O1KSy0AmUM6d8n6FHJTbpidFyKfJo+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.53.4)
	(envelope-from <n.schier@avm.de>)
	id 68807f53-f4f0-7f0000032729-7f000001a584-1
	for <multiple-recipients>; Wed, 23 Jul 2025 08:21:07 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 23 Jul 2025 08:21:07 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 830C9808B9;
	Wed, 23 Jul 2025 08:21:07 +0200 (CEST)
Received: from l-nschier-aarch64.ads.avm.de (unknown [IPv6:fde4:4c1b:acd5:6472::1])
	by buildd.core.avm.de (Postfix) with ESMTPS id 12EF718F071;
	Wed, 23 Jul 2025 08:21:07 +0200 (CEST)
Date: Wed, 23 Jul 2025 08:21:05 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] kconfig: nconf: Fix uncleared lines on help screens
Message-ID: <20250723-tentacled-quaint-honeybee-daeadc@l-nschier-aarch64>
References: <20250722172837.140328-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+cZPhhw0P+MpjApe"
Content-Disposition: inline
In-Reply-To: <20250722172837.140328-1-shankari.ak0208@gmail.com>
Organization: AVM GmbH
X-purgate-ID: 149429::1753251667-2D59F952-B0ED1819/0/0
X-purgate-type: clean
X-purgate-size: 2059
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean


--+cZPhhw0P+MpjApe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 10:58:37PM +0530, Shankari Anand wrote:
> Commit 1b92b18ec419 ("kconfig: nconf: Ensure null termination where
> strncpy is used") introduced a regression where
> help screens (F1, F2, F3) no longer properly clear short lines of text,
> resulting in duplicated or trailing content when lines are overwritten.
>=20
> Revert the null-termination change to match
> the actual length of the copied string.
>=20
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/lkml/CAK7LNAT54nvwYmTy20Ep8U2kr4thn68yYWX=
i9R-d3Yx3iXs=3DBg@mail.gmail.com/T/#
> Fixes: 1b92b18ec419 ("kconfig: nconf: Ensure null termination where strnc=
py is used")
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Tested-by: Nicolas Schier <n.schier@avm.de>
Acked-by: Nicolas Schier <n.schier@avm.de>

--+cZPhhw0P+MpjApe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmiAf00ACgkQiMa8nIia
bbgaAQ//WXc3j3gkQJHVKPg46w2qWgsybzw3j/pvOnX9GH8mTyfLrMYZDLBzBheM
5cslXSzXn/V+d0HSy8YQGfI3ifp8RqMNbCIPkA5c/TLsZaoxDZSfPJw2vilgekPT
jjCu+t+HXPICq+fOwyvGfmSty5JT7zbv5RI24rNjl6nyUkOrtldynhygxyBy0djU
/AuzilkOrR+Yomga6hoSGfQu2r2HTje5QeIGHJrcpZRog6uAn6227dw1ui2Z2Rs/
T07w0xw+UIKU/vtlgNYNjQCMAS1iCbed5ILFk7EKGcMsZ4PCwsF2C35bg1zx6JvR
zWdaDpke2yjglVvBRoSFtTFYx0hmUBhrXlH5ZiwoXxWhjbMXYbkgbLC+AHqckpis
3RA4y1FGC3F8kzlnMD696VGZejWncINDL7ph+FnbGNol2/TkrN3ilf7lWVG8Al1B
Ux+r/xryepaNEjjUBmfKNmJjvoc+Mj2R8sRVUuP1TaGcpjSCx3HhqbVTZd4YceMf
XLcuXSKVW1Tg8h0TfJgmfFXWAQ9NMWe0BSUc3WRn2Vanblp/zNNVdprKT1clF/GR
qHvP5l5brvWmWlj+y10EQpOTjEOf8UUfZQD14mMDBRt87qjJ3FBicg5Q/+r0rRVr
o3jEwLyBKi8BPd6lvZExmtsOuqMnztFgBAMn2LNC9tB4/7Kc+eE=
=pODO
-----END PGP SIGNATURE-----

--+cZPhhw0P+MpjApe--

