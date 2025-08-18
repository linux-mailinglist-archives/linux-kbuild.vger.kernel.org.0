Return-Path: <linux-kbuild+bounces-8493-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9089B2979F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 06:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07332188E55E
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 04:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6718525D528;
	Mon, 18 Aug 2025 04:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jyAi2zTx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5412E253358;
	Mon, 18 Aug 2025 04:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755489712; cv=none; b=mx6W7VGyI+zXD/G9DCsc4P32qzp/8Wjo7muAgKrCcMkEUBl3pgydiMkmtSVXl26Fi8NT72sBTjnNLL9OwPH7dV8r9aBsJ8ItK/mMH9xje5ZHH51m8eIoxk4HlPuR3uDHl9ydr/c4EQW5zemXFf5n1uDYWBI275MD5sZBlWDr/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755489712; c=relaxed/simple;
	bh=nrmEJCoMuwYtFoxWhiybnwMBRWASv3Wr+PLPNb2f5y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LtEuxlBmfcdFwpTtN2fu6pM0Rrz+tLvC57SD4rIuEzATtgBSj5gSSzdBoZmi6R4yF7LsjYNQ7MdYPLCPZlns7UE2a+9hxOYc9P5E0JA8EnQ3tCty52OvgwuXOJx1pLOoZhy5GZ6iKSM8s2ySMvFW1pt1Yq9c7YNIrPuxpj/RaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jyAi2zTx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755489704;
	bh=WfOOvlr0+MAPH1A71JD+gU8R2p6rlYIbY0wcgyMExsc=;
	h=Date:From:To:Cc:Subject:From;
	b=jyAi2zTxPHmZVv2ONoIl9FUBdn4JX2CGob0BdXRN9+iEKiXILoIEwvOYbIuMJlU4h
	 nkWFEBjk/l8lS72VMbD4LTKyZO9MUgocclpQpf4oMKE21adA42mmdLmtBX48GE/52t
	 YI1X2r+ac7MNzIwzI9UHWYE4L5248agLmbKCu7wHXH3HUVhVLrbasO6f4XJ3JPO2fj
	 +Fd09uhSH+81G0EnEVQ47PlKsw4F0wrl5asp3I/mHtw1yC8PO7LvSFb716CaMsvTJE
	 2iHUA5LQbFt52gVJAxyh+UcG0CFPnAwPlVBv/0Gc1lC5kMax2W7QePl1wPTyGvXu6D
	 qBObn6d44+8tA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4zYN0yRvz4wbr;
	Mon, 18 Aug 2025 14:01:44 +1000 (AEST)
Date: Mon, 18 Aug 2025 14:01:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>,
 KBuild Mailing List <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250818140143.61b8c466@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ovvRU1uAHs_+LC_gn/Ukq7d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ovvRU1uAHs_+LC_gn/Ukq7d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (powerpc
allyesconfig) failed like this:

/usr/bin/ld: /usr/lib/gcc/powerpc64le-linux-gnu/14/../../../powerpc64le-lin=
ux-gnu/libgcc_s.so.1: error adding symbols: file in wrong format
collect2: error: ld returned 1 exit status
make[5]: *** [scripts/Makefile.userprogs:29: samples/pfsm/pfsm-wakeup] Erro=
r 1
make[5]: Target 'samples/pfsm/' not remade because of errors.

an so on for lots more ...

Caused by commit

  478494044bb4 ("kbuild: userprogs: also inherit byte order and ABI from ke=
rnel")

I have reverted that commit for today.

Build was done on ppc64le, POWER9

$ gcc --version
gcc (Debian 14.2.0-19) 14.2.0
$ ld --version
GNU ld (GNU Binutils for Debian) 2.44

CONFIG_VDSO32=3Dy
CONFIG_CPU_BIG_ENDIAN=3Dy
# CONFIG_CPU_LITTLE_ENDIAN is not set
CONFIG_PPC64_ELF_ABI_V2=3Dy
CONFIG_CC_HAS_ELFV2=3Dy
CONFIG_CC_HAS_PREFIXED=3Dy
CONFIG_CC_HAS_PCREL=3Dy
CONFIG_64BIT=3Dy

--=20
Cheers,
Stephen Rothwell

--Sig_/ovvRU1uAHs_+LC_gn/Ukq7d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiipacACgkQAVBC80lX
0GzE5gf+JSkPZUXCKeKLkMa8+U/jSaqBCuxpI8lQ/bq8xpq4occUxrr9a/sW0ken
r0LEHZW2QgUmAUXKnYYQIv1jQMyVGXnWsGc9x5VyX9BLIS9oAgZ9AP8SHeI8qhAu
XacIqu+hOQcQrcb/qFbuxqGzXDQL9bl+URUihfg5btQFRvkiM0Sx5uANtFl9xJXQ
R+EIClicTuzqyuNT25wnZQlICaJ41nek5kN9DAp30icC0EKQZugX+sE8KPHgN3I8
cNZ2b1tJHodL2c0LnzJ6AdISWvfTR2y3rLAWKGcs8S9REJVvo/ECUCcTwWu1/jDn
6Xny1dQM+VC+yWTSfHcoOgKFdWbrow==
=xYBS
-----END PGP SIGNATURE-----

--Sig_/ovvRU1uAHs_+LC_gn/Ukq7d--

