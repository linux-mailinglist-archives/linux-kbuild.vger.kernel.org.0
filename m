Return-Path: <linux-kbuild+bounces-8424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB1B240C0
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 07:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59FE726E87
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 05:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B242C033C;
	Wed, 13 Aug 2025 05:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mo1Afdq0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106242BDC3E;
	Wed, 13 Aug 2025 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755064520; cv=none; b=QVDv6cVlOn7FN/CCVp+5UoZ0gUbzcwoY5ZrIPssotNE7W6Hw6wEZXhIv8UZT9yU6ya8U80e/l9e9ijRDaiTUOZIpRCNhaxJ/iMMecvJoMWg5VCQKIvumZuREtthVfSId3Wt2WEUmhykarNOCjypppuz07DJa8vF0WMNVIEB9wpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755064520; c=relaxed/simple;
	bh=sO1vwYkfY9O6dL9+/j8+8EuUOklUUJix+dkequt63/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5X/lh5J5J9DlnagBa8URE7R9FXNpRUpH9jh5/ddABaDwE4JBMnuO7cz4CImkD1bE2vC/FvSr6GkbUrCA8kicGFfjITN2nxkqRbevLmlQAK1w+bRmkt6d/GeAT/28mFwR0DR27l9HFm4P8N1bX8ScaeznQfKyCPyfq0suwGMAQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mo1Afdq0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C24C4CEED;
	Wed, 13 Aug 2025 05:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755064518;
	bh=sO1vwYkfY9O6dL9+/j8+8EuUOklUUJix+dkequt63/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mo1Afdq03LgTVw0yLxEkG2rXpJwyHqwslJFjcs08NE5IxNxIpIWGClQkQ5cCZ+jxx
	 C3w+T7zd7kXo5XHkQSVQP3oi0GzNtXkzAXIC+OSGZZbANUIyOj9CPn0TkrLTIBBh5i
	 7MMYXYZF2XUQByKO2lc2dr+iQWV694j/3NKvl3mR1+wTWkvMJzXUXhLsH5I4K73PGy
	 wuHTdwMl3CUF9iQCnvtNnUzSqK/cDepLe6v3JnAnnhYFKRTTkt4Oye9UisFPm9QlUY
	 kPTUxPG2RTHJVgjsVCqz9yOXjOaElaT4soVIhJtuFQaCVM3Rcgw/JERWUaXbWFP98T
	 y2NOwbKRH819A==
Date: Wed, 13 Aug 2025 07:54:56 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] kbuild: uapi: various fixes
Message-ID: <aJwosJCbyZoeD5DT@levanger>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
 <20250812234458.GA52733@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Q0UzoffVbWwsuTF"
Content-Disposition: inline
In-Reply-To: <20250812234458.GA52733@ax162>


--5Q0UzoffVbWwsuTF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 04:44:58PM -0700, Nathan Chancellor wrote:
> Hi Thomas,
>=20
> On Tue, Aug 12, 2025 at 07:33:03AM +0200, Thomas Wei=DFschuh wrote:
> > Various fixes and promotion of warnings to real errors.
> >=20
> > I didn't add Fixes: tags as digging up the original changes would be
> > cumbersome as the code moved a lot over the years.
> > Backporting this doesn't make sense anyways.
> >=20
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> > Thomas Wei=DFschuh (6):
> >       kbuild: uapi: rerun header tests when headers_check.pl changes
> >       kbuild: uapi: only update hdrtest output on success
> >       kbuild: uapi: fail header test on compiler warnings
> >       kbuild: uapi: upgrade warning on asm/types.h inclusion to error
> >       kbuild: uapi: upgrade check_sizetypes() warning to error
> >       kbuild: uapi: upgrade check_declarations() warning to error
>=20
> This series seems reasonable. I did a build of usr/ on arm64 and x86_64
> allmodconfig, which showed no issues. I will give Nicolas a few days to
> comment, after which I will apply these to the Kbuild tree so we can
> start soak testing in -next.

thanks.  With the exception of the already canceled patch 2, this looks
good to me.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

Kind regards,
Nicolas

--5Q0UzoffVbWwsuTF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmicKLAACgkQB1IKcBYm
EmltWQ//bgzDsjfSCRYr/eolGtdVnA4PpyLQyqtRAR7HHKrP/4xJwbr3isGZS/E+
/3lIKrAPr5brv8QhHbMjtFf+9eZ7vx5TGM69af2wddueo0fprkz7fdKy658Cfj8g
FIuNC/znnaSDjsx2p2cOUMMI0L38BRDFmmyuR5xXomTCSXc0sfPKE6DTvyCsqFB0
M+/egh4p6h4SUjBzun3pkeGevOEPoZytdvIU0IkWniomTbf1IRQ93tRjoL5cxOF/
VRMs2/3Zm/mlvD65gsStEeS0sxYE4LBMdUlDqlQqYxl/Pd7RfF7rfCIp1l8XXPXe
VFqTfHW5TDDSY4kD7klQ/qQuc/4nAzSXKLPe3XYxG9CrNiSzPTNdJo/0py4Ldieu
J53OsYfFva4R17qzLr0fHDIDxSm0rMxvGCEU2bqKJSlYFeLBFMOnyZj+aS1npfwz
JzWVEXor3QSbwh1A247GUDIxAKiZ7ZOHIxZCLD8bwufN6Cin11f0eD9PS5tugYEt
SYxkM7CA0kwCSSoMApyiWL5vhfpgsskTrW9Wt3C7luIEFNKf/INn8ySltbzAkTk8
UafeUgnvWBPJ0u4VwbqGt3dcAg2w6PgfVmz+6wyfb7mOvpm9aFZbtwDYOzSXgw0W
aH4PyQapDFmOM/5lPNX+mfQxuzup8RtWtwXpSZbQ1Fp+EVbYHzk=
=0NwX
-----END PGP SIGNATURE-----

--5Q0UzoffVbWwsuTF--

