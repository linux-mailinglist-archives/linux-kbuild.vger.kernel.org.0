Return-Path: <linux-kbuild+bounces-8076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A70DB0B818
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Jul 2025 21:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF3403AA865
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Jul 2025 19:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD3820D51A;
	Sun, 20 Jul 2025 19:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s3GcqEp8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA91EA73
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Jul 2025 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753041590; cv=none; b=ZjJGO15sq2wutRvPYHPwREaSywomJxbIrMFToBm1d8unlncT5rfIt1tvPUqFF1ZyvmbRaSaRjAAvu2cHpi7tFqaB4N8s+jvTWcHMqGpdDdIXLusaU5YVdY4qMgO8R+m75nyVnth+OQEsJO90HGth9sOC7dhzQ5eGPshyi6GyH3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753041590; c=relaxed/simple;
	bh=Rr7gWtce0jtuqnCuffbrCSk5hpX8haog7UdUMZtr/XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQO7Uh1loMOU3/8q4+eZeSUbY5uLJAzvB6yvWaj9FcbnT0SQNZDj18g6W5XVzCkrXGjDvtn6NKM6PFmqN5QG1nApWkpiVnB341GlrLJZRDfb1/tyCC63iRBFCWejgAxN7GicJgS2m29wWjyiyHAZ1/Qhj57EqFAdOuH+mZyS70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s3GcqEp8; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 20 Jul 2025 21:59:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753041576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uTf7XST6BPozeS8E/BgyA7kC1BPVHLRfFuzJKUVb9Dc=;
	b=s3GcqEp8QlJ6ba4MD2podCyvja2NH6/Sy78vPxRc/CCbikqHotzN0JlR0MRKaPMSl022Yk
	EIb4WzMO4UU+WnIwnxdTLfWTk5lDw3x37dOGLhh6SuFXhesPWcnZWLYLUz7ZJ++1ZLkEuS
	4NvTaEGfkq7QmXHFWe0LEIyNM+52sV0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: =?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Sam James <sam@gentoo.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kheaders: make it possible to override TAR
Message-ID: <aH1KhpnXl0aRt8HB@fjasle.eu>
References: <20230412082743.350699-1-mgorny@gentoo.org>
 <277557da458c5fa07eba7d785b4f527cc37a023f.1752938644.git.sam@gentoo.org>
 <20250719201002.GA3285766@ax162>
 <5cd7b14179531cec3cdc8fe3c40a639ccf0be5c1.camel@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ylsw9MWxpNHiJNYm"
Content-Disposition: inline
In-Reply-To: <5cd7b14179531cec3cdc8fe3c40a639ccf0be5c1.camel@gentoo.org>
X-Migadu-Flow: FLOW_OUT


--ylsw9MWxpNHiJNYm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 09:08:20PM +0200 Micha=C5=82 G=C3=B3rny wrote:
> On Sat, 2025-07-19 at 16:10 -0400, Nathan Chancellor wrote:
[...]
> > I assume that other places that call tar within the build process are
> > not problematic because they do not use GNU specific options, such as
> > scripts/Makefile.package and scripts/package/install-extmod-build, or
> > maybe that people just have not tried building those packages with
> > bsdtar?
>=20
> Precisely.  We focused on the one place which actually breaks our build,
> to avoid touching too many subsystems simultaneously.  If this is
> desirable, I can look into replacing the other instances.

Without further investigation, I think it makes sense to use the same
tar-instance for all tar calls.  Thus, I'd appreciate if you could replace
those as well.

Kind regards,
Nicolas

--ylsw9MWxpNHiJNYm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmh9SoUACgkQB1IKcBYm
EmlXOQ//dKzInhTyJq5gXFuLkVNDcn3DhkY+vwZj94k0Mr1t3chfuWPeYWHBRBQq
Ctdkip6eSCgKuaVd6t53uDPP0HrhcFpCIqRpIvI1ZGynsqRV8fRLh+sHUJ6k0ywc
CIOCJLyNaMzXZTiskQDsKL1HszO36xjln8JIR7yPm3AcT5eeDFf08LaXmpFzlmA1
/zlmAbk/DraavjF0yIArd2HKLGDqW0vHOKuig7KV+1zAmEGMhEVbM93ygHgas9r3
bybypnQrZNUPt1o/faBZn1b7vRgQcBKtjSSaLOiUXNAWR+qKNbiyo+khDJA78gUD
hEpL/hEvM/SlukrKW5E+cPzCw8uzKaxDqGKJBFnKBp6vfCR65T8Z5KowN1g+a2rd
h552zIXdzuHcUHFSk12IocILwBHQE3k6DcnZq8qQzi0E0Mb8BbHAQHPYcuBQq0pB
fQf1yA+81BdIMaLYNIK22RzFXUWbSkPQ4Bc/n7PRBAIAAKYcx/QmlwcsHCdmr7K8
D6rXGmNI+3v1WrQOFzoUdiKojTbWfPDPfum6+TssVpKJmvHWLYFrzejQYzw/vc0M
Qu37ylfRK5CZ/OtyIbihAc4YVLEKakXhzfLDfjPw/8uVSvoQy+C3XW6cOUB4SOQH
MRBT5Gnm8YDk5IHKoQ/yR0hN622N5EYkBEqgz3+xB16gZIoNLgE=
=Dx5P
-----END PGP SIGNATURE-----

--ylsw9MWxpNHiJNYm--

