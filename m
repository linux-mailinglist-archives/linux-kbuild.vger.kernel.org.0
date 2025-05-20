Return-Path: <linux-kbuild+bounces-7166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A28ABD70E
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 13:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1817F17B1D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 11:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F8027C875;
	Tue, 20 May 2025 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pZ1Dj1H4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234C26738B;
	Tue, 20 May 2025 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747741155; cv=none; b=GkUIH0leZmy5qvyWZmVjFgmFKrtJYVtuemRltM2FxS9J3aU6ePu8rEySlpoXhCwoPMXTVBwJ7Jh6SluUmPkJzH6LSVmFEse2FIfG8BD747gl/VRCc15al787QL1oUHZmB5hg5j0vbaJ33Z2SlbSddaIFipCrMmdC5ay8ZvyL5E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747741155; c=relaxed/simple;
	bh=0ckXESPmy56qefBczM+kDRhj+1MO6ts6V2d771eEkCo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RRawKF2dPN22ixTThDARFIHCQZ6irCzaGms+n6qAox70FbWvRXjzAQCERWpInUZw8LBULirHBWsP8yfS66NPWJ+FGV/ajq18rAXgdM3jaSK7GXmurxZfurfFNdoW5Nta43WHbpQuq3tUk1egxVu2AcHIN8KG+9zTkfsVgGYUOQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pZ1Dj1H4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747741148;
	bh=isXZU+uZtSED1OfnliPgQkBj45lD0diwEJrlIXtWn7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pZ1Dj1H4ulNQ7kGt5wvwxN0bP5VTtRc5PKewajYxbJ/WaSgj4ces2etZJNAPYZdj3
	 COvyYXhqwJegHRs2op6KmiTx5WhOz5PjiLHOosuW3evJSnDQwb2ntvroRtepo+cpCv
	 3pchQQ8xJLv16CNLyt7Pn4dV07SPaLYmA6xKBxliUjTrfsyxC9XVAkQOhkXKNRyPPm
	 1EgvJmiYq/2bx3lbPuZhB+aEXwtM/IwbNWEXLW6dsYU0YkilMdq/ug+hJLDky3mEgK
	 M8I+yg7usAgqUa9Bj4VvC8eD5Gqc+mLgyGZExNMQ+XuttnHxsrtTIvWLSRvR5n9ID2
	 dFKcP9I8XGkKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b1syg26XMz4xQ0;
	Tue, 20 May 2025 21:39:07 +1000 (AEST)
Date: Tue, 20 May 2025 21:39:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Nicolas Schier
 <nicolas.schier@linux.dev>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: kerneldoc.py: don't use Sphinx logger
Message-ID: <20250520213906.6ec263d8@canb.auug.org.au>
In-Reply-To: <20250520111956.1db9db88@sal.lan>
References: <cover.1747719873.git.mchehab+huawei@kernel.org>
	<6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org>
	<7bbe75ff-548f-4ffd-9522-59d1518d6c72@infradead.org>
	<20250520095037.3dc39685@sal.lan>
	<590981da-4d37-464f-a52e-ba163d3ecbc5@gmail.com>
	<20250520111956.1db9db88@sal.lan>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6D2avqjLhsiENX9knPfToA9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6D2avqjLhsiENX9knPfToA9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

I do appreciate your work on the document system.  Particularly you
have made the process much faster.  However, see below.

On Tue, 20 May 2025 11:19:56 +0200 Mauro Carvalho Chehab <mchehab+huawei@ke=
rnel.org> wrote:
>
> If by "innocent typo" you mean removing/renaming/moving a file from
> the Kernel tree without updating Makefiles, or adding them with wrong
> names, then yes: I do think this should be fatal for the affected "make"=
=20
> targets. The quickest such build issues are caught, the best for everyone.

They are found if you leave them as warnings and just continue on.  I
have been finding them by when the current python version just crashes
(without any useful message before your current change) I rerun the
htmldocs using the perl version to get the name of the missing file and
then report it so it can be fixed.  But the perl version continues on
and produces all the other warnings so I can compare with the previous
and only report new errors/warnigs.  Sometime these reports are not
foxed for days or weeks (or months).

So, please, now that you are producing more warnings, make a missing
file just a warning (or at least continue on).  I have enough to do
every day without having to run "make htmldocs" more than once.

--=20
Cheers,
Stephen Rothwell

--Sig_/6D2avqjLhsiENX9knPfToA9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgsadoACgkQAVBC80lX
0GzHewf7BV0JJMGCOQmObOrtJSh/grehBjDOzcfMC9XJQyfkvhdrdsgqx1TNh6cp
ZEl+HR0GKkaJljAhN+59QzVhNkLivGEGhSF7F30ZTo7Wy+FMtH+NJcmOVr6BIVUW
Lp6HcSB/yqObkxH0uFo8OCaE6pF6fXt/Qd5s8NBTMv1cjhh9m4qMR2wBVWuSl0T1
XPO0DVyBFKZhaLWCUbDhFBuLWl1rzHol/mp2y1VMS6Pn2eZWVQvGgGIVYQWBPIkh
d5qY+hbrLyiOpNFiPbMZZeAOIVSSng8navSKXJcrAJSaiG/E2d2xU8xPbui+AdTM
YcRyOmnSfBRUSBCquyTtyON+v4L6hQ==
=HPCw
-----END PGP SIGNATURE-----

--Sig_/6D2avqjLhsiENX9knPfToA9--

