Return-Path: <linux-kbuild+bounces-9766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CEDC7B95A
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 20:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B86FD3A6916
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 19:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85F8305E14;
	Fri, 21 Nov 2025 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfmAomQ1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFD5303A21;
	Fri, 21 Nov 2025 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763754430; cv=none; b=Plysdjp6ya89/FcFB2ILX8kdYCsIM1t7pRG78lzRc1vDU2j/VBeUI6v76kOGiLmfrGcSTohEOqulsKK7gc6yis543oDM+KzrP0IWCm6K3mmmcrV/1FTXOugaqs6Z0k/X2ocxlGFUJNAWDJ7eMPYJdwThtb+4ty5HCbcehVJGjn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763754430; c=relaxed/simple;
	bh=qvxNDXBnJW5pDOHtl3UPlVB07TrxBrvozO1z55FStgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFO4Zq0tN1Muuh3dO2EXXDlSLLGpjeyHb+iuUz9pCUSO6rT96hLrnDS6TKQ8xQ2aYYo94A/5ax3y23HYMOycyZ15hhG+mtFVOr/wwe1JhCPurSRc2CpHjShSW3SwGS+jDJJrPA2BAkFXawtgVgtk0p3mdXoS1n8oB+8+AJk/vaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfmAomQ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BFCC19422;
	Fri, 21 Nov 2025 19:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763754430;
	bh=qvxNDXBnJW5pDOHtl3UPlVB07TrxBrvozO1z55FStgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfmAomQ1RNlmAmWELLIpp+qaJ+LVr1u2b6x2WmAqSoKyMRfYXbhJuIQnN2OncGiq7
	 Xf0EjWOyjkVm6N20L9Lh1221sgWcdGEklhP3L5naMPZgSAIn6X7Gf+cuaTpKQpm7bz
	 kwvJwPA5W+jhAC0cn/5DSeDJ/sQMlEAM+mfCRJZutmIrYINuecbIcaYn6nL8GeKQiC
	 jWFendJNflA81crbjXmOxH7dd/WXSpwLuJBhqtzNnUSgZF0+DUmiazesIrbt2v2VnL
	 XSsbRqdq3czR+oJQFX1RACVYK+/Dijg9ih/RzZc5lnA1Z4Pp8fgiHqw52fvo6IPJcZ
	 FuLZDfJNG6EjA==
Date: Fri, 21 Nov 2025 20:46:44 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
	linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] kbuild: fix compilation of dtb specified on command-line
 without make rule
Message-ID: <aSDBpKUe_nJq3h21@derry.ads.avm.de>
References: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
 <20251121064256.GB571346@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9FJ7FA6pfcAXCHU/"
Content-Disposition: inline
In-Reply-To: <20251121064256.GB571346@ax162>


--9FJ7FA6pfcAXCHU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 11:42:56PM -0700, Nathan Chancellor wrote:
> + Rob, as he reviewed e7e2941300d2
>=20
> On Thu, Nov 20, 2025 at 03:06:43PM +0100, Thomas De Schampheleire wrote:
> > Since commit e7e2941300d2 ("kbuild: split device tree build rules into
> > scripts/Makefile.dtbs"), it is no longer possible to compile a device t=
ree
> > blob that is not specified in a make rule
> > like:
> >     dtb-$(CONFIG_FOO) +=3D foo.dtb
> >=20
> > Before the mentioned commit, one could copy a dts file to e.g.
> > arch/arm64/boot/dts/ (or a new subdirectory) and then convert it to a d=
tb
> > file using:
> >     make ARCH=3Darm64 foo.dtb
> >=20
> > In this scenario, both 'dtb-y' and 'dtb-' are empty, and the inclusion =
of
> > scripts/Makefile.dtbs relies on 'targets' to contain the MAKECMDGOALS. =
The
> > value of 'targets', however, is only final later in the code.
> >=20
> > Move the conditional include of scripts/Makefile.dtbs down to where the
> > value of 'targets' is final.
> >=20
> > Fixes: e7e2941300d2 ("kbuild: split device tree build rules into script=
s/Makefile.dtbs")
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.c=
om>
>=20
> Huh, TIL that .c and .S files can be built in the same way...
>=20
>   $ touch init/foo.c init/bar.S
>   $ make init/foo.o init/bar.o
>   $ ls init/.foo.o.cmd init/.bar.o.cmd
>   init/.bar.o.cmd
>   init/.foo.o.cmd
>=20
> I do not necessarily love splitting up the conditional includes from
> each other but I am not sure it can be avoided... Nicolas, are you okay
> with me taking this as a fix or do you want to take it via kbuild-next?
> If the latter:
>=20
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I am ok with you taking it via kbuild-fixed, thanks.

Kind regards,
Nicolas

PS: If I combine this here with [1], [1] does not work any more.
[1]: https://lore.kernel.org/linux-kbuild/20251120204812.1983452-4-robh@ker=
nel.org

--9FJ7FA6pfcAXCHU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmkgwaQACgkQB1IKcBYm
EmmyiA/9HasZHH2qdhvYBgASuVc6gbPsoDMt85cQYFrfbuP+6CFLbjuoaIEU1MDh
wZGeaTGGf9+PtW7gJXkuiRsZ4bXKkKvffrULbYHoS03k3hmvANKFUJr630Vuwhzy
CrBdNR0+kh5Zl0mnRwy2se58YDo7iFxX9hilk0RYBJE2qz099j58S83yyEJYigWH
uD4C0b0LY7/CMQXg35m3gdoEbbFrX6woF/LUONy/q+Mmlh082fGzZijn2nXMvgCC
4encpoFWx8JrGFA3lCPlHSq2UP4cUxuFc4vzk0SmqpAkSr161R4DEYhNryzPBIgS
6/5tsE2FgYhdXWzMLcUOnovHWjAKPQh15dLTqvirbl+X+sJ8hWe0l77WHe/nSv7a
dmctr9pPnfwIO6m6KGaO3sQuniZw3XF2FV9j1OHnEgYNubARLhxB45ysgz6wjtGo
UEz6WnQ2fcwdSKSm9S90S/MIj5s+YRJ+D+qoR/M3WQVLTRpgyZP+p+t0B4lDHbP+
4KIGIi2JTV/oi7QKCwUr/zwvh9abPM0FWQxxAWF5LkHtLIwd2wajQNkqY5rGkgfB
NSMTzRu9nMh/OzjNmUSUxJU4o+iYSC5NDyZCeCjS3dW4SAnZQZgnlR3mKxNsq689
kcvdzVm9ckmNS+gRXDK+Rck2PAd0m04yr9ynqifzN+c6PVizrE0=
=of57
-----END PGP SIGNATURE-----

--9FJ7FA6pfcAXCHU/--

