Return-Path: <linux-kbuild+bounces-8300-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F12FFB1BE02
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 02:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3EB7624A62
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 00:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97F3481CD;
	Wed,  6 Aug 2025 00:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VOFLfb6d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F4CA5A;
	Wed,  6 Aug 2025 00:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754441306; cv=none; b=NLtJyk5mSv3AwcaY+x0KZzSCaGWobfPQFe2RVgonB6B6vPi9WTET4nGLVQi8RmdGyhq+wyqExrcagZB7aiSNqb2zTBPJ5bgXw5pyCF0/vqYahlfDNPhAf32k4qNclFum91nxBLrpefGqoNcG/B36eyEa4P6WsJi/Ad0zsysxA3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754441306; c=relaxed/simple;
	bh=I06Td4etkQJlaWwY9h3MgLqkg0vCaGICma9kXMG0UKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdIkarZhat2EURuDZAeovSNRycJYEUaeK0p0XST1NxHRQdvimBx+HlKk528cAjBQGf9/XFAxaYJVGUJhbyGo4hyPxvS98+Tg+2UkUZ9HCphtUiCs9BtXbRp6qxdfmMpxe2J+OxhbsMn6YAGj68CCEDhIW2TJUH/BwxKsyc14Xcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VOFLfb6d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754441295;
	bh=I06Td4etkQJlaWwY9h3MgLqkg0vCaGICma9kXMG0UKA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VOFLfb6dDBeU5yI4LEPT3VT3xuOj1o2WrUQwLS4RNuuG8osCGoNNjDMwEmR+L8psl
	 wvimpJNyInsdhLfdK01pG1lzuwKNK94FeBeHtSmnft0wIAQyDlJn6PkI3TGnEhZcU5
	 XPZcaXJzHq1cVJ9m2sArTOOG7B/xvSMLTBOQoknvkAL/8yuLASVJOFmLRmrkmt1TMj
	 r++gMHBuM+ioTxgKWhED4NaZv2dskLDaUPTvjwftBK7rW93jeNq4d+7N2UTuU3Ia0s
	 nERpVqjQ3QS91VfxQsdJD0ceqjtlQspzBk582Cc7X2bSZZeiKArvCzWgXbZW6t9iW2
	 X9d4iPcNK7YXw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bxWqg1qJhz4xQ1;
	Wed,  6 Aug 2025 10:48:15 +1000 (AEST)
Date: Wed, 6 Aug 2025 10:48:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.17-rc1
Message-ID: <20250806104814.73fa19b9@canb.auug.org.au>
In-Reply-To: <CAK7LNARZivfd7=vU_vD4dtuLVXecYNyMv+TS+O99YGv1E0qR_Q@mail.gmail.com>
References: <CAK7LNAQW8b_HEQhWBzaQSPy=qDmKkqz6URtpJ+BYG8eq-sWRwA@mail.gmail.com>
	<20250806030434.10663c09@canb.auug.org.au>
	<CAK7LNARZivfd7=vU_vD4dtuLVXecYNyMv+TS+O99YGv1E0qR_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jsoQW79B_MLpydfNbjqn+oF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jsoQW79B_MLpydfNbjqn+oF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 6 Aug 2025 09:34:04 +0900 Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
>
> Sorry, I missed that, because it was not sent to kbuild ML.

Maybe I had better add the kbuild ML (linux-kbuild@vger.kernel.org?) to
my contacts for that tree.

> I will pick up and send a pull request take 2.

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/jsoQW79B_MLpydfNbjqn+oF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiSpk4ACgkQAVBC80lX
0GyWgwf/XtvBpkkow7LQ48CVfWxteg9uEl8dV0f3I5TY+G2yNxbTTCk23SheWqve
hcYUyPjWJckU33UIRj7SyJoLp77Z9YBnv1BEdu1p1idxrjqabCNvHT0WusBdRvX9
LsYr4/waSD2DbumrOlz7GZWMXLJ7HL1yrEPYQh81Nf6tBCNZ2yW/vX3pXYBgMenI
zbZXiWp6e0TexPI+7IdYOiZs75+HY3aXq5AEKxfwEh8iD1YJ9OsVZ4Vrm7HfNwRL
/51IGgEj07143rNwO4CMrKhI7acxZEY3rhMueYT/u61KtUgqN0srLW8Ri/M3kr0n
/bZHz8paQmiNmLezCafHDfJncd9iIg==
=UeS/
-----END PGP SIGNATURE-----

--Sig_/jsoQW79B_MLpydfNbjqn+oF--

