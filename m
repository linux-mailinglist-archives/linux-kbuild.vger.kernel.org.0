Return-Path: <linux-kbuild+bounces-6193-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB87A63725
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 20:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC4FB16C54D
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 19:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E760A1AAA2F;
	Sun, 16 Mar 2025 19:09:21 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E0F1A840A;
	Sun, 16 Mar 2025 19:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.191.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742152161; cv=none; b=VrYFY6o83052eRFM7TB+wdmXriAcwH7WtonIZDILBakz+2gwTTh4a0xd8FdsxbrybRG2cmuJ1k95VYxr8nU5sIYrbgf2NFvQeNIigz5Ao+owdRQdWOpvO1KU2qPJIWuwx5lMZeZDYFRiNd4zK5X5XRcIMHSSM0J3b3igTi2YqQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742152161; c=relaxed/simple;
	bh=7K0CKKSEQCj2Z31ffJIY+LQcS/jTWa6MowDTW+qfLiI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BN4rjwvnDAkXG607Wh/YoslLLannK58lqMzHqi2WgSsXtBIX3W9CvzvD91A2WEEQ9mDgUPgLnNC8REyBbHKkBhvyr63ZjSyKFCGKOQBC9TZhqqrZXlFNayLmgyFjJeTPrLwGb8ZPIG7L3oOAhaqNejCXhof3vn/6hi4LJTkrf9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk; spf=pass smtp.mailfrom=decadent.org.uk; arc=none smtp.client-ip=65.21.191.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1tttLn-009DD6-1E;
	Sun, 16 Mar 2025 19:08:43 +0000
Received: from ben by deadeye with local (Exim 4.98)
	(envelope-from <ben@decadent.org.uk>)
	id 1tttLm-00000002R5p-12M0;
	Sun, 16 Mar 2025 20:08:42 +0100
Message-ID: <d250e864d6d81cc02e2599f710872f72d58a3c29.camel@decadent.org.uk>
Subject: Re: [PATCH v2] kbuild: make all file references relative to source
 root
From: Ben Hutchings <ben@decadent.org.uk>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier	 <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Gleixner	 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov	 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin"	 <hpa@zytor.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Sun, 16 Mar 2025 20:08:37 +0100
In-Reply-To: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CLWj+1c9T7wgjA6qpkHc"
User-Agent: Evolution 3.55.3-1 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-CLWj+1c9T7wgjA6qpkHc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2025-03-15 at 14:20 +0100, Thomas Wei=C3=9Fschuh wrote:
> -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> Other references, for example in debug information, are not affected.
> This makes handling of file references in the compiler outputs harder to
> use and creates problems for reproducible builds.
>=20
> Switch to -ffile-prefix map which affects all references.

This appears to cover all the C sources, but not quite all the assembly
sources:

[...]

> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -54,7 +54,7 @@ targets +=3D cpustr.h
> =20
>  KBUILD_CFLAGS	:=3D $(REALMODE_CFLAGS) -D_SETUP
>  KBUILD_AFLAGS	:=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
> -KBUILD_CFLAGS	+=3D $(call cc-option,-fmacro-prefix-map=3D$(srctree)/=3D)
> +KBUILD_CFLAGS	+=3D $(call cc-option,-ffile-prefix-map=3D$(srctree)/=3D)
[...]

I think this addition to KBUILD_CFLAGS needs to be done before the
assignment to KBUILD_AFLAGS.

Also, in some older versions of gcc the -ffile-prefix-map option didn't
affect assembly sources - gas only understands --debug-prefix-map and
gcc did not do the necessary conversion.  But this works properly since
at least gcc 12, so I wouldn't worry too much about it.

Ben.

--=20
Ben Hutchings
Lowery's Law:
        If it jams, force it. If it breaks, it needed replacing anyway.

--=-CLWj+1c9T7wgjA6qpkHc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmfXIbUACgkQ57/I7JWG
EQk/QxAAp1QI6wF/LXIDuaISL+X/2y+Le4q0YYynsOz3YXaov9KeE4yBzGl40w2Y
eEtVRYpDF1v8q3ZI/0fNDNm2xiQVZGmQwrNhGNvxb3eSd3ISkaKid4vMYCo1s/+i
ON2CWMxAO9JUQBTekvTSF8swzxHgHXoLZS4jgZdd8MKhTsrBHiUMLqNY1HVmkIEf
utkrapxDtB63Qw8y0O8nXTtqvDmoyhPl4+Rzra9IjWu8f9v+Dni3h5CVGhLm8xXX
rgb5MgT/pkGURqbJKAMsT2KqTuIqdg0iwFOjUko/Qg3hXNP/a1Fp6z04/UtWjmJj
KVYLAD9NuagraWlNMqT/1ekfBUergLpphCnHeeT5wdvgkWFfWcdz+UZbhN6GGaOU
KLYgjkH7/Szs8Fl7+Qu2IYImSNDMFzaYrVQV8DttRjbGHajHHHDj73EHxADCXFXu
9zh02iX1MWvLR27lAr8INlLVuQSwoloSqm5FCmmkaZHRG1GzhrhtTtYMDm/XB/4/
fj1Q0uNDkoy0hBieu/qsXb/Q8tiBDj2FY1rC0ksAgX/cd6VHKunwUAWl8cCqE6Wn
CjMLkq+4axSgdjp/46uzePRgD0RzdfdEo4bq/b8A4/Nw07Sxr0uzVybDodwdY4Sh
aekBTPuTDDEKnY50M3WAlD52ONd1PNOQl5WfmTh+1X4S5b4jXE0=
=mQGT
-----END PGP SIGNATURE-----

--=-CLWj+1c9T7wgjA6qpkHc--

