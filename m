Return-Path: <linux-kbuild+bounces-8316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D381AB1DD37
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 20:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88255727833
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 18:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A170F2206A6;
	Thu,  7 Aug 2025 18:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cuhDNbmz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B021FF55
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Aug 2025 18:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754592913; cv=none; b=uVPLB4kYXovzQRYgNZYcA+PhbNRtQE0KZPyML1DrhnI1SI6J8JuPEd1C+ojtadE3mAvqdQ7A8H1AllVkaloHl1gV5uYh88K+Xke6/dydtgpu88+8DdZNYey6U9M2kTLmU+ZwVlm2zDI/6lZ7mulZ+oWJBGQ715+BmJbfkB7Q8FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754592913; c=relaxed/simple;
	bh=MVjQL1zXfauCX4t2xdRj8XWjntGP7DD4nwGdRIzf4IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dV3wYPJKZramSKxIoY7SJ5NTevNijT400xvM3kXmvTjoblu2PNMaseYfvj/TxRX7ZIdHwXLX8DxMb1g8OwPC1q5logkg6DVCrOCmGKX2A/dgiOHJCMWwgJvzGitw1fwm8eiyJnAffEId7AStfywjY+umyP0z1BwxJkQIu4IroXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cuhDNbmz; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 7 Aug 2025 20:55:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754592908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1nfWmyFZRY9zQ+jGVSq6NzX3t8OI1k9HDXqbAxjG7D4=;
	b=cuhDNbmz3Z0nYpkBkGpoUzXNsAYtj+Xfr9zrmgUbc5/AXvNQGse2IUl48JzBMoqjShV26Z
	bF3MukeCKFPcR4QjhLQZE5vSP5YkC5gXJJmolnexi5PjSU7CDeIfXz2D/BgrRosdW/+s9R
	tySpNVCLzCDYckLGjeIhLUueMmOX30I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Haoran lee <470658536@qq.com>, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mod/modpost: For CentOS 7/old binutils
 compatibility
Message-ID: <aJT2ieqflTEArKYm@fjasle.eu>
References: <tencent_6FE857803A1AAB21B71853A2E89626ABA407@qq.com>
 <20250807-elastic-transparent-kingfisher-8f7ada@l-nschier-aarch64>
 <20250807162238.GB2145434@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ysAbS6gdazat17Eu"
Content-Disposition: inline
In-Reply-To: <20250807162238.GB2145434@ax162>
X-Migadu-Flow: FLOW_OUT


--ysAbS6gdazat17Eu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 09:22:38AM -0700 Nathan Chancellor wrote:
> On Thu, Aug 07, 2025 at 12:51:59PM +0200, Nicolas Schier wrote:
> > On Tue, Jul 29, 2025 at 12:19:46AM +0800, Haoran lee wrote:
> > >=20
> > > Signed-off-by: Haoran Lee <470658536@qq.com>
> > > ---
> >=20
> > Please note that empty commit descriptions will not be accepted.
>=20
> Agreed, a clear description of the issue (including an error message)
> and logic of the fix is needed.
>=20
> > >  scripts/mod/modpost.c | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >=20
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index 5ca7c268294e..216647e2f301 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -30,6 +30,32 @@
> > > =20
> > >  #define MODULE_NS_PREFIX "module:"
> > > =20
> > > +/* CentOS 7 / old binutils compatibility */
> >=20
> > Since v6.16-rc1 the minimum binutils version has been lifted to=20
> > binutils-2.30 [1].
> >=20
> > [1]: https://git.kernel.org/torvalds/c/118c40b7b50340bf7ff7e0adee8e3
> >=20
> > Which binutils version do you have at CentOS 7 ?
>=20
> These values come from glibc's elf.h if I understand correctly, so I
> think this is more about compatibility with versions of glibc that do
> not have these relocations defined, rather than binutils.
>=20
> It appears these were all added in glibc 2.18 over ten years ago [1],
> whereas CentOS 7 appears to use glibc 2.17. There is some prior art to
> adding elf.h constants to modpost.c when they are not defined by elf.h
> but I am not sure if it is worth it in this case, as CentOS 7 has been
> EOL for over a year at this point (and I suspect the binutils / GCC
> version is already prohibitive for working on mainline).

ah, look what I found: https://lore.kernel.org/linux-kbuild/20240704134812.=
1511315-2-masahiroy@kernel.org/

According repology.org, CentOS 7 brings gcc 4.8.5 while v6.16 requires at
least gcc 8.  I am pretty sure that this patch will not be sufficient for
re-adding support for CentOS 7 - I doubt that its worth the effort.

Kind regards,
Nicolas

> If we do want to add these relocation defines, I think they should be
> added in order of their numerical value. I do not have a strong opinion
> either way.
>=20
> [1]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D08cbd996d33=
114ca50644d060fbe3a08260430fb



--ysAbS6gdazat17Eu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmiU9nkACgkQB1IKcBYm
Emms4xAAwFSb3/WymU6xlP3c7e7QsqLHZzhVoKmeT/Q0qmHyWf1tsDA9y28sW7Qa
GHTGuZY/nUP2AJrpjBbw5CbMHxgavF1FCbQX4IczGSVRwFtGsWWH7cPpZig6Vepd
A5PzOvNDVSe/6PMLRrOCISXSOwhosYpj13FyGuZF/N7zGWAsoBjbpV3XkWGj4Pty
R+cJl8BAfGiOal53APC1s2akBU3TlQqVOfC8HXeRDu8Os0RZsvRElJzzmR6/JObv
dYPbhq6qBU4SNLUXLm4c9Zs4kR/o8VkWrCE73XE/GkQ/DdSL0xI7Lcs9A7cSobFO
twxjnPWyiUsYW1VpqI5tLNwATEaqxjI61zRIcmNdEaDFc+OoQV0mvOcl/FS2IaxW
kHbX39mey/18DyLg9Tg+Z3cE2KXBAWKjerOSrTrKFKmE+uhaPLZDLYcnYsnf5Pni
Lnf2p9SNHzvu+AdC1BLtunuxJzz1XKqvCEOELq+vPuvYupVReJfxBii66kZQPwjj
nQUXJxgGg81w8ccwYd0/99dNmBMjTwHVI4gxMJt6moKdAl/AdRBIF6+6nG3VfUeC
8qwbTn2R1ihkpyIhrJx5kMRSR5Lk7e3TNcff/QnnfDnmajVud8xIwGxRMAvHya5/
fcujVPdxp5KMzDQCsOMyls+JBJwwcKCgMX9N9rqBGv9TsoYhfm0=
=Kj/4
-----END PGP SIGNATURE-----

--ysAbS6gdazat17Eu--

