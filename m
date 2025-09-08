Return-Path: <linux-kbuild+bounces-8759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A80B482FF
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 05:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A8D3BABD3
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 03:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0939520299B;
	Mon,  8 Sep 2025 03:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gKZ/c9x4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2D453A7;
	Mon,  8 Sep 2025 03:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757303361; cv=none; b=Q0JUjw5urgdUU9KFqy7sUgUvZkhSwenRvpwaOjpt9cDcq0hRtQeZvrfEDA1SxViOzJ+uGudVEL4FvV+3CW1qsRxGle8Jjxegq6NK/sN8IMwgWv2PRU2iakpkjOVpTTBxfBn9TWm2qx0lxMP642Av+irHT8/h7UXwqMsL2uwlsfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757303361; c=relaxed/simple;
	bh=o6yubI9o8aQSb1ZmwwN/UUkGxPQtv1/ashNFOWuq/wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iigvkmRORr3YxJuvfPnnBZneL7STcO5vPtTs95180itmD56wC96f7mcPc3/1/KgEac8ak64Gt4jp6IjdLLCrDUj1ZatHg2cqRgsATNiuN17L9Txwf6Y3CiXA/+/DC1uQ/sEAkP7b+yHjeNFtO75ULm/0MyAhONBkPBlUzEJuAeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gKZ/c9x4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757303354;
	bh=vaew1mC3B+NoBNmlS8eQeiWBtsJew4atsMEh6lHY5JA=;
	h=Date:From:To:Cc:Subject:From;
	b=gKZ/c9x4RFtwQoXDXT3GkMCBwHvR9Sy61za2HokSiKhGdX+DsEeY7yJyhlOIkNjhv
	 67r1NJEM68CneGugnlHroi6ZFIzmM+MuXpYhhHb7mEk/zqhsV9Wb3d4FrABtnq7lHu
	 s/vR63LKnch01509miPacp2LHnI22vWSAyCIxnV281tKjTYIk8UECwJeNIr4TeI2it
	 tlV1WjEMEjEHmKX9z0z7hs+2V6nxz3lXAKh4LWhSd7YP/ZmiFBDhC42FybxhvonaTg
	 4vExAjHnyk5wfJSRIw6gsx1u2z9JeS7xLp85/O7CJ5E3iluduQ0tFCFL8KJwdTXf5G
	 m/uTEoip3gGFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKtHG5lHrz4w9v;
	Mon,  8 Sep 2025 13:49:14 +1000 (AEST)
Date: Mon, 8 Sep 2025 13:49:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 KBuild Mailing List <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the kbuild tree with Lnus' tree
Message-ID: <20250908134913.68778b7b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fw2=JFUgtBQWYDmbqI7ullH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Fw2=JFUgtBQWYDmbqI7ullH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  41f9049cff32 ("riscv: Only allow LTO with CMODEL_MEDANY")

from Lnus' tree and commit:

  6578a1ff6aa4 ("riscv: Remove version check for LTO_CLANG selects")

from the kbuild tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/Kconfig
index 51dcd8eaa243,850ba4b4b534..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -64,9 -64,8 +64,8 @@@ config RISC
  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
  	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
  	select ARCH_SUPPORTS_HUGETLBFS if MMU
- 	# LLD >=3D 14: https://github.com/llvm/llvm-project/issues/50505
- 	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >=3D 140000 && CMODEL_MEDA=
NY
- 	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >=3D 140000
 -	select ARCH_SUPPORTS_LTO_CLANG
++	select ARCH_SUPPORTS_LTO_CLANG if CMODEL_MEDANY
+ 	select ARCH_SUPPORTS_LTO_CLANG_THIN
  	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
  	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU

--Sig_/Fw2=JFUgtBQWYDmbqI7ullH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+UjkACgkQAVBC80lX
0Gyh6wf/W4PirpeQLG/DIUC+aO9J8jIOEEBHrxmvVIEaHw60/JkhBD3cr4G2TPf2
ee2Gcc12keswNPkDmBdByS1RU4GfpiCKkdBgucg+OedQ4/nsuL+MjQWT/e9b/bCh
1sFq8aWqOVg8jqlKVfb2+1tOr8jSeaiBiYjgt6Zx9Pg9/uwfCCK4i/GgjSD/Yf5Z
cq0B29lUDKJAHu8yGZEkhhmRPtNt7w37OiOInjJzG0ORLhlmuicIT4nc+JVi1qWL
+gomb1C34oRZDd1pLUc30wRiwf80md2qmJ2OsChho+WFuiiv+bvBjWSo+WaPaDe0
mNFul8+eav84U0JXKVUdMCopb7YEAg==
=w1EF
-----END PGP SIGNATURE-----

--Sig_/Fw2=JFUgtBQWYDmbqI7ullH--

