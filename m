Return-Path: <linux-kbuild+bounces-9783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B74C7E743
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 21:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 065EA4E3708
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 20:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809CC2561A7;
	Sun, 23 Nov 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erp63ult"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E821CFFA;
	Sun, 23 Nov 2025 20:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763930254; cv=none; b=tR2zqiptvc81K+Dh3UvSbkhlUh8JSjG7Be16UO7LdSlKo/3rNa79gQ1CElvzc0882NZQ28cpT9lU9Fa0bPd91FGNQ6ty9FXzz3uddKcopWcbo7tDmqliBm/zH7lVEDK0AYDHF7NQRdhmxtamg2iCyZS2Hp5Wl3ywus9yT0dnO0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763930254; c=relaxed/simple;
	bh=TieJwcXr+/aTZj4wc4j+GA/U6txwYo1FguFJVFzDgpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7gqEHpnszB9fZslnoCXYTjZUBaERTwYow0LAUJjlIbFkwyR5Ugx66RhOXPanWMwYIEaw1YXDqVE/h1oCw9LO4TwfoN8wKSEKd8AY0wURVHTYI1gMRPdxu6D2IXv5QQF7PtJuQwt2yiS9op2Mk1A3/SFVQ0fzKq8AmDJm7uY5eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erp63ult; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78276C113D0;
	Sun, 23 Nov 2025 20:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763930253;
	bh=TieJwcXr+/aTZj4wc4j+GA/U6txwYo1FguFJVFzDgpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erp63ultzxQUoGSqe43oDQ+BP0joVjCXqf6xiD4Y4Ybj4xnCL0lP5pbbDfcYDNdwx
	 nftHVTsodjyQQQ8EDdBQzLrnyPzZ/VbWp5cafzlDNVcx3hX5g5XawRx5FUkAeHS1Vr
	 PLpM/qn8VQSWhzZLSC2F67cD3l5Ksj2G6HXVMwXFjCnUWX1sXCs3xRjRkaT75D4tLX
	 X22jcfXEziBA9/G75DIPXZd0LSxPkiduq+d8NkGKE+TiOWawcYvZe6KzxIwd+u+3vL
	 16fSQY4bKMEgq9LvgJ+jC4BlXUTkhRPaHlGxWTnnK/QM8BNLUlzV77ClZUsVmXKBqn
	 AeuNof1+RjT0Q==
Date: Sun, 23 Nov 2025 21:34:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] kbuild: deb-pkg: Allow packages to be excluded from
 bindeb-pkg
Message-ID: <aSNvz2rzpt2PE9t8@levanger>
References: <20251123183647.76559-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uNN/4sRHZmnidjq9"
Content-Disposition: inline
In-Reply-To: <20251123183647.76559-1-maz@kernel.org>


--uNN/4sRHZmnidjq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 06:36:47PM +0000, Marc Zyngier wrote:
> The bindeb-pkg target generates a number of individual packages:
> the kernel package itself, the debug package, the kernel and libc
> header packages.
>=20
> It is at times useful to not generate all the packages, such as
> the debug package, even if the kernel configuration has CONFIG_DEBUG.
>=20
> For this purpose, let the user provide a DEB_EXCLUDE_PKG environment
> variable that can contain exclusion patterns for some of the build
> artefacts. This saves precious cycles when repeatedly building packages
> for testing purposes, where not all packages are strictly necessary.
>=20
> The default behaviour, with no variable defined, is of course unchanged.
>=20
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

thanks for your suggestion.  Could you please check whether the usual
Debian build profiles are sufficient for your needs, e.g.:

    DEB_BUILD_PROFILES=3D"pkg.linux-upstream.nokernelheaders pkg.linux-upst=
ream.nokerneldbg" make bindeb-pkg

I do like that we have the Debian build profiles [1] mechanism here, and
would rather extend it, if neccessary, instead of implementing a
different approach additionally.

Kind regards,
Nicolas


[1]: https://wiki.debian.org/BuildProfileSpec

--uNN/4sRHZmnidjq9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmkjb6wACgkQB1IKcBYm
Emmj5xAAoVgf7xb9TCSDnpAzvVemrtbULeVRrgyKUl4bTAk8ybNNy3vOMXFQ/+LX
X9ROxUVpWOYtZPSBEgYoIr8GpTmTPT22qmdjXTM809dhZ+Dm5iC0A8n5vy1+YnOZ
RXaH6jM00yVvq0g+BPv0KHopJMSldfYcfvm50qUAnfYGXIIViRljVajmlloP9iv8
BD+O/5bWOShgRavA7ngneLjXHWt2XSVadSRLXKp0Tu0qNdB0+1uLYe6rfR4wuHVu
X2uYqLaeKlHgRRZar2eF1IvcQdhnM1A0jejcFvaPJjWV1WFbKDnt0gWY5SeFBC5Y
9cZdDQbTV0GAKvn06z0LSfC82y0otOlhgfCbaQ8jz3nRobaYZOB3BkoVOzE/L7lu
mPJltHsW2Ab3Mr2FWga/WJWToE4Hw+EJGeyDCxRERwJv2O1nxZa7mP4VqyeITEzj
VrHru+IwCO7ijDSsMpWmamy0SGHiyfvN1F0369Lm8DOHDjeF/BuyBqxOQDUtBj/n
625o54m7xovAhcCiu21AoSCCNdGDAef0EGoTFSklRCgn4Bu028JTDiXckIMMEF5+
wZ6C435SbCnRE/0he91BCzRt/2PZOLStr7YguKhJ93ZvGDjZ5c14QBbV01OZaNHo
MnSzi9KeCLO2Bl5flcTgj8rIS2fyW64vvO2TurJFvYP1FfbRm2E=
=FstN
-----END PGP SIGNATURE-----

--uNN/4sRHZmnidjq9--

