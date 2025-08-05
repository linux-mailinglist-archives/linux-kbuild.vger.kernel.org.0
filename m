Return-Path: <linux-kbuild+bounces-8297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A01B1B8E9
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 19:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EAB418A131E
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 17:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B038520FAB6;
	Tue,  5 Aug 2025 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VFbgCYjm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CD42AD14;
	Tue,  5 Aug 2025 17:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754413484; cv=none; b=dDQsj4DTLjkg1XHI0A2JJCUuJGR0LSVbU5XwDcavie3MTEd2dd7euaR4O+KZP9tikSSbUvrjTz02FYxsy/KyT/GRduO1NDn2TwuNSKxl+udldXt6QIQd2YuO9cgKnF0HBNoblIM3D5JR1yb4d48YG46ERr+QSwhIOmjZL9EKFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754413484; c=relaxed/simple;
	bh=Ab3Qv+mozGqtdtSWHmeNbL0iBe2pPQ6BF4NZ57OFjiU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsJmyokBJ1c73Wi816ESUhfYuq3z3D2JT2HIzsJ7TMcca+yZ3oBrvRR7ZhlmKTJ8hzREjwj9B5SV1xXINV0bTsLYA8LZJZCoXoYAkNLI3bucJVL7+61FCIAi4SAjrztFXTuSWN83T43tQn9d2Gk+Dz10jIIswBb7sDHwldy1WqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VFbgCYjm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754413478;
	bh=GIVg5rF8VOyNngYSI34wBxodNdqe8OxlGs2MxACqFvo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VFbgCYjmF0/yISVzF54I6fWTPwMHnBKVchQH0ctHvr7O2z1YGktGCkawz7dnF0akn
	 ilgWJ9r/HnkAWqVfufyeSMqMB7AjoBBfbQ55BRH+OdOXeaQcLYGLDMX6kpI8nBdnWy
	 3PJ3+iC4AzQLJoMv8nhqkIl5KawJ3TgsOpqcftTcDgF+rHuP9YARkVfEOLcD40vmet
	 D2Vcc9zHc91TzCdUv0RXtcx35w9yfFUbYFQN7zGuQbe2I6Cg/LyxWGOTR1WnYbL96U
	 Cs3mXMf+uHwTsPpV811fOhMqjvAYpPLZM80YWmhRn2IVktrmuugZLCkB4Wd2WGCZnl
	 YNqBnBq+dyvfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bxKXj5Qghz4w2R;
	Wed,  6 Aug 2025 03:04:37 +1000 (AEST)
Date: Wed, 6 Aug 2025 03:04:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.17-rc1
Message-ID: <20250806030434.10663c09@canb.auug.org.au>
In-Reply-To: <CAK7LNAQW8b_HEQhWBzaQSPy=qDmKkqz6URtpJ+BYG8eq-sWRwA@mail.gmail.com>
References: <CAK7LNAQW8b_HEQhWBzaQSPy=qDmKkqz6URtpJ+BYG8eq-sWRwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YZmDheFdPL9__=4_Xb=WN75";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YZmDheFdPL9__=4_Xb=WN75
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 6 Aug 2025 01:27:35 +0900 Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
>
> ----------------------------------------------------------------
> Alexey Gladkov (6):
>       s390: vmlinux.lds.S: Reorder sections
>       scsi: Always define blogic_pci_tbl structure
>       pinctrl: meson: Fix typo in device table macro
>       modpost: Add modname to mod_device_table alias
>       modpost: Create modalias for builtin modules

Did you miss this: https://lore.kernel.org/linux-next/20250730161223.637834=
58@canb.auug.org.au/

--=20
Cheers,
Stephen Rothwell

--Sig_/YZmDheFdPL9__=4_Xb=WN75
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiSOaIACgkQAVBC80lX
0GxRlgf+OS/A49zGYd5zmBnP301wNyhlPLiIC41ajEohEZYjbtqIHN9E6oorGI/D
xo3melpoeS3i1eT4G9aAWkiUq0BbbZcMRpcxPZCWu6NrHe6lh4pMyuks9mf2vapZ
0CfPJXjSD9XlUWPeYhPUkjtthYWzFB52JUqWwKEG3oFXkAQJmD7VGO1OXtP9aO+y
UtZ3GkjZFsSYgq+3/Ej7zofzNHCUjaIknbsqRUinL+PAa2jANtJVf1uQnBd6TDVa
v9XcyqyaYEb1J2pWL22FTzBw3QtDMAVOgxYN+ut+E9ycMqMilzIWWHSVGWQjjip+
x8wRfJVfrdgF62ZdsA/Mtpf2retPiQ==
=JjtR
-----END PGP SIGNATURE-----

--Sig_/YZmDheFdPL9__=4_Xb=WN75--

