Return-Path: <linux-kbuild+bounces-10352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93CCE8127
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 20:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87FF83011EE5
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 19:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31B5204C36;
	Mon, 29 Dec 2025 19:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS2RAeTw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896B91474CC;
	Mon, 29 Dec 2025 19:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767037390; cv=none; b=uDGOdANl0LabU3BWvpmKiPCQqRiTv0Wz/vyGFTk0KEsrggGgOXaDxXc26i3pLRd9tGn+m/XIFsIyXM65bJeb+JqltnEP1SC/HDDBewl9ZahRzEtsF3vUmWbdOca96u7i5ZXB9gyAi7cgM/Vw5iunLecac1yBGrXioJbMK5ZK3Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767037390; c=relaxed/simple;
	bh=5vvnujn2OnwfieNSyeQLpY47dadaMLnj7Z8iRbj2qCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WP/dgRqNro0944mA8k5cZ/oCjvRQucyesW+EBvk6LHzmUUaKhasRE8XDbZrsbWSMvqsi1ntNwgwOfHXM8/uTXCbt+n1OEULbpUVXk/KAiTq9Sv3fSOe04HN2Zms+H/cncd1nY6dgxKRtAc1z9jvt+GMUdWOCcdV1bLGOpPwMksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS2RAeTw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D19DC4CEF7;
	Mon, 29 Dec 2025 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767037389;
	bh=5vvnujn2OnwfieNSyeQLpY47dadaMLnj7Z8iRbj2qCY=;
	h=Date:From:To:Cc:Subject:From;
	b=OS2RAeTwM4DDT7040RLSDcyzfZsW/XGUCIvj4qmzD/oIt6xVZZ1RI4vl5ChKuPdMo
	 8pRsmCw68HpiVXKIngcTWfCstpGTQwhWB7Aa2PHtBSp26IplpZtHf4h0Hm2HepDbX0
	 hag8nnwdnAo2Iw8H9QIIR2VeyWkHNKVQeS5CpB5Gkeb8faQVArw/6mwTLrs/DQ/5tU
	 QGslECP7B02k9LLgQdDqojoCssuGCmnKEeSXKWt/Ow+B0HufYsd24cQj88U8yM5z+I
	 oc0PPw+b3VevoCGgMkgeNkr+3QMWLFZ7sT+DAElvqNiwTAMOX6xdDWqwMpcE42VZ/D
	 6FC5kzfzNAKkQ==
Date: Mon, 29 Dec 2025 20:37:44 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: [GIT PULL] Kbuild fixes for v6.19-rc4
Message-ID: <aVLYiDvJ1jsEAV9n@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/APPZB/qMopI2H4"
Content-Disposition: inline


--z/APPZB/qMopI2H4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull these three Kbuild fixes for 6.19-rc4.

Thanks and best regards,
Nicolas


The following changes since commit 9448598b22c50c8a5bb77a9103e2d49f134c9578:

  Linux 6.19-rc2 (2025-12-21 15:52:04 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-1

for you to fetch changes up to 1f4ea4838b13c3b2278436a8dcb148e3c23f4b64:

  mcb: Add missing modpost build support (2025-12-27 20:48:01 +0100)

----------------------------------------------------------------
First round of Kbuild fixes for v6.19

 - Revert commit 9362d34acf91 ("scripts/clang-tools: Handle included .c
   files in gen_compile_commands") which is reported to cause false
   entries for some files.

 - Fix compilation of dtb specified on command-line without make rule

 - mcb: Add missing modpost build support

Signed-off-by: Nicolas Schier <nsc@kernel.org>

----------------------------------------------------------------
Jose Javier Rodriguez Barbarin (1):
      mcb: Add missing modpost build support

Nicolas Schier (1):
      Revert "scripts/clang-tools: Handle included .c files in gen_compile_commands"

Thomas De Schampheleire (1):
      kbuild: fix compilation of dtb specified on command-line without make rule

 scripts/Makefile.build                      |  26 +++---
 scripts/clang-tools/gen_compile_commands.py | 135 ++--------------------------
 scripts/mod/devicetable-offsets.c           |   3 +
 scripts/mod/file2alias.c                    |   9 ++
 4 files changed, 33 insertions(+), 140 deletions(-)

--z/APPZB/qMopI2H4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmlS2HoACgkQB1IKcBYm
EmmdnRAA2yDa/uj+LxND2WaCdskgRiF6Yv2y4mG50gVFEuK+Gym2ikrxAGaZBmsl
Na5kDQZlPkn1/S0H/oRJ8ly92gHmVxyASbGSDlR/yumbG5MUy7bPWvwFEm1unekY
msdlK+k1heLhKBvRggRE1dZsQ7pfNI1N8efqExfdFDxhV02zcTtVkD0mLhhlJQ+d
EvXDl2ljUzIzNU+Nj3kHsStqMEnUXLrKkFvTT9TdtREp63PxleW1U7aWBnbaEXcv
jrwMuESDN3ePhT16uh1ngxlaMk/iNovNzD2U8zVtUzRXPI0kYxyJUPIe72JFxznk
i0q20nGRg8WdX7tcZYxiM5infq14xST3a17Mn5kAb2A5QSzI1w2Wafc/8G1Z/Jk1
Nbqh2siAkbblgfAYdixLs/OhC/Z0YbL8jWamYmNBL0ZM0waoKyV+lztZmD77cZsi
H03beTyIQKr1iDqFV43fT3yvTErzVcx855J1QOA+f9mFVof+RR6sGqAydZlc4j+Z
GwMpJXveSxpdHFoyF/8eh/vGjUcaaATI/pBqDZCWjiyMPDFOBVp5X36P8re3/MFy
0ETouDzc6GqjdevdLv3K6H6PqpzHDZmqbIR0GlXs3v5qa1dQJDJkCv7HYUG1BRF0
iGiVn0iJSBaJ+RYRGkdn+Mtqsc+4mku3+nH5OZTTqx0E8JKqYSU=
=3RS1
-----END PGP SIGNATURE-----

--z/APPZB/qMopI2H4--

