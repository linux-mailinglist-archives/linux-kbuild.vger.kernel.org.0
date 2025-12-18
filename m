Return-Path: <linux-kbuild+bounces-10172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52777CCDB62
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 22:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71FC73017F1D
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 21:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033C63074BA;
	Thu, 18 Dec 2025 21:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqOwRFXV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41659326D76;
	Thu, 18 Dec 2025 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766093858; cv=none; b=VQsK7uGSoi3oqH41qUcqyBOzL5tVg8YWOuOHzDIPyMcSTy06nw7iPFRnPObpg56EnAR/DhXZSdyd/EhKzFyITbK6rFEa2jvqjnxZhRjpwm2pJoPdTeLQJHRh1wd3yuNstb4BfyPiPpH3go5r39o6uJnurvukxjGMLcYRCZAKOC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766093858; c=relaxed/simple;
	bh=Iw0N4vdniXbG7LgRU/RPyc6F9LWD1FN8wtW/d5Wew7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVVUtFQFAOwl1bDTSYPUci3JTf77OiaEBVY7zbTR4WB4vY8spkvEX5EZP/QZOuUIkFrRbzsPAFQ5sshWqstSEMPVx+b+8M6z6i+T7TKBaliphIfXaRk6LcbrlA4BvO6o8w9QZK/XVCMZ+IQyvGybUJaqQgRXaE40cU4awEXcxvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqOwRFXV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45022C4CEFB;
	Thu, 18 Dec 2025 21:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766093857;
	bh=Iw0N4vdniXbG7LgRU/RPyc6F9LWD1FN8wtW/d5Wew7g=;
	h=Date:From:To:Cc:Subject:From;
	b=HqOwRFXVt+YclNTt1GQTkektIY60KlaHfdRxeW6b+skSN5AuETp3FNcAuhRvwXzsY
	 S6sRfAR0k7ECCrVpSvetEMN/1LJbwv9cSkC30ynTJURGpJTLaKKQdq0qvRJJbUuWCV
	 6r99sassIrI2E9YLONGH7xvjQM0sHWLjrfm8h1la1vBsh84p+E5SPR7HRJGdJMY77U
	 f9QbTn0SwjrVqWlKeBP18V6dniZi2d2Cjeawg6L8n9SjdzSal/4lumeQk0LGe4WhiZ
	 9ql6G1H1Yax5I3fd7RAFqmKE4YWW1LtN2PDFViIH1UQ3TUsI77fYujoU3ZHV0wMr0p
	 akHofjInFBE0Q==
Date: Thu, 18 Dec 2025 22:34:59 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Updating Kbuild tree and contacts
Message-ID: <aURzg3BliUOYxnhI@levanger>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gYUlLUBjoRLxmagy"
Content-Disposition: inline


--gYUlLUBjoRLxmagy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Nathan and I have to reorganize the kbuild branches a bit.  Can you
please update the branches for the kbuild tree

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
  (unchanged)

for linux-next to

  kbuild-for-next        and
  kbuild-fixes-for-next

Please let me know if there are any issues or questions.

Thsnks and kind regards
Nicolas

--gYUlLUBjoRLxmagy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmlEc3QACgkQB1IKcBYm
Emk+yxAAjEco32bmZBpWIIof6jX05C/K7Lrxa1EPKPrsr914Y9/bpzpYoWOMrXXu
omeNTxkN5LsSJxJigKrR6SVwSOgtrQENefcIIMu6AcWYwkDKJaG21pocMLIIKyW/
8/16tOamVcDQCfX2gs/NG7/1Cv4m+0NpBHVrEBu957/3kEtLF5zwAuCLhDHi5Wef
wKJAua4JINihDkPYlESbGZcR4Go9VX5CB0xTsQ7N/RT5uTiOaTl8xFvENjCOSUK7
Dt6mFbyJMb+QBRfAwVvAn9UL/rIGXthn2zWQV27cCAE5JrZykxru+xfoHmNpXTt9
6WimMB3+MGmy59lFhJIrfNlfB4OXlUBaP9JR4A/JRE8bxQlUj1LqoRNglt3Ks6fD
Wi//I3FWJojJDyFmIFqCkSrr/OqEvq8Arf0ibY/F0NU0wtLllF8Nuq95gTFzEubZ
lsNur3ivHG/Ytvlq8cRzgYuPyKJgAqCZAYdzMHWeYKIPZUAQ6eGS/OPDK+Xucd49
e9Eurotr9djbFy1Lzxl8v48lfA6Gsdcri97rx/ZZ1FVAvKG+TcEy3Gy11uYRg7I8
HqM5hJLtoY5LSVpoXq76TyX9bYP/0h5ovE/znbHpGdJTQe3hR8Ln/JMPfr0vUCnf
eX7AuPfFz1gk9bxNvE6GKDSLEpv+gD+T1+/aHBb7eE2TYGQShyk=
=L9PB
-----END PGP SIGNATURE-----

--gYUlLUBjoRLxmagy--

