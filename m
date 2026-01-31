Return-Path: <linux-kbuild+bounces-10960-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tN4IAdsffmnKVwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10960-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:29:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CCFC2AF7
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB572300C009
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 15:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3711B2D97B4;
	Sat, 31 Jan 2026 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmhYeM6J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AAC239E79;
	Sat, 31 Jan 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769873367; cv=none; b=nCu5Fyn4JmzYSfUblGLxwgc8KDCmSHfQK2bM07fJK+PYWcdlJ5kDppX4ehPwNbYdqjb2+SqlSPMq2UD+rDqq8zXu2kvz9uy+mHN7N4OpsB9Dh/bjx53Vb6xVJD4jJG7JoXUODYZ5uNLm6qrR+0b/QRrcY9yN6qhdEbcpJFOX2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769873367; c=relaxed/simple;
	bh=acjTxQ7ZtIJYhVbnvKI5A1vrHYzg6i/oc2uPkZzgZyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kD0/cGkoja90oRTdHkIxQa0QA9mwAs31/K5bUuPLH/V6N3v2+Td+Wq/YD7thtNcGlam1N4ydyqhDZmDDWVn+a3tVVmKVM+o7xCxvDoogsNw6zyOuOUQT9uVQrTHLZxC8xt1oNnY8CZVKAF4O5x0rlo4zzpr21K3GpRTwNiSqLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmhYeM6J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B42C4CEF1;
	Sat, 31 Jan 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769873366;
	bh=acjTxQ7ZtIJYhVbnvKI5A1vrHYzg6i/oc2uPkZzgZyo=;
	h=Date:From:To:Cc:Subject:From;
	b=qmhYeM6JO1AlTyQE562OagUFRBiaqAT8zo/6hvz8Pjec9eWNUotTW+2BRpT2jM9lV
	 j9L0SrSzzCnY5Oe0Qqf4lDWLQuo/nR0sI9Vz4ctTVGrJvHejU7V+kdG6kYz5FqcTg3
	 6HVHjM3J+BFQPY3dvzyEtt0a34OjXasjmzVYFAyTcMV4tBJecpOs7riK76oBYXw1cq
	 B02FJXLGYh/pUHFYTebgPEWkyec69On80ijhLbYKY9c+igtlgXtn24yENadG9nWAYg
	 yC5dE41/9i3Vl2GNQfDOqk7JI9x0cF6eXcSFY5Gdi80QOjvZ8Ggeyx52Z5DrgxKixR
	 fMao6JV3IYz2Q==
Date: Sat, 31 Jan 2026 16:29:14 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
	Ethan Zuo <yuxuan.zuo@outlook.com>,
	Holger Kiehl <Holger.Kiehl@dwd.de>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Rong Zhang <i@rong.moe>,
	Uday Shankar <ushankar@purestorage.com>
Subject: [GIT PULL] Kbuild fixes for v6.19-rc7
Message-ID: <aX4fytimtNnXTzQG@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
	Ethan Zuo <yuxuan.zuo@outlook.com>,
	Holger Kiehl <Holger.Kiehl@dwd.de>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Rong Zhang <i@rong.moe>,
	Uday Shankar <ushankar@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="68rGOsT7US5h8AJv"
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10960-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,dwd.de,kernel.org,infradead.org,rong.moe,purestorage.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rong.moe:email,outlook.com:email,infradead.org:email]
X-Rspamd-Queue-Id: 45CCFC2AF7
X-Rspamd-Action: no action


--68rGOsT7US5h8AJv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull these two Kbuild fixes for 6.19-rc8.

Thanks and best regards,
Nicolas

---

The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-3

for you to fetch changes up to 8e24994872361212531a952c93adb01c485148f1:

  kbuild: Do not run kernel-doc when building external modules (2026-01-31 16:12:01 +0100)

----------------------------------------------------------------
Kbuild fixes for 6.19, round 3

 - kbuild: rpm-pkg: Generate debuginfo package manually, allowing
   signed kernel modules in rpm package, again

 - kbuild: Fix permissions of modules.builtin.modinfo

 - kbuild: Do not run kernel-doc when building external modules

Cc: Ethan Zuo <yuxuan.zuo@outlook.com>
Cc: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Rong Zhang <i@rong.moe>
Cc: Uday Shankar <ushankar@purestorage.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

----------------------------------------------------------------
Ethan Zuo (1):
      kbuild: Fix permissions of modules.builtin.modinfo

Nathan Chancellor (2):
      kbuild: rpm-pkg: Generate debuginfo package manually
      kbuild: Do not run kernel-doc when building external modules

 scripts/Makefile.build      |  2 ++
 scripts/Makefile.vmlinux    |  3 ++-
 scripts/package/kernel.spec | 65 +++++++++++++++++++++------------------------
 3 files changed, 34 insertions(+), 36 deletions(-)

--68rGOsT7US5h8AJv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAml+H8kACgkQB1IKcBYm
EmndyBAA3wiGbA5yK7OqJ8y6F3hqI5eJ+Tmp1jPUzH+97c7G4MaS3+6yUkcnFqHy
OT/2K5WF7gR59dUZXeUWMf4Fh1UHSpR6eRnqLnaDMx8gIc/8sQDbeLbfacmVJhDS
s9SHMJ+or5YSHNj4PvfpodN/SXO72GT6b0pffCzUljAJwQ9XRJCXYKtBGelXpXng
t9zeLpNu04B6LqbJQum2ooKkd8t7Fx2hqoI4oEjVQtJOykvV+BrEwzHDPQPlWEvC
jHe/TpOqHlZI7caBdNRgXWB5+Mckk9a67EzejIrOK3YRJu7ZKfXEPbUT1HMh9wIc
xQBbKugT6ZBh/9w9FpBozQIdcukBcvRy45m3fZ/AToveNQt5uPeLYUcpboao7Nw2
Xp17URc38ErkpNJWYDuXR8NkULUOwP8XY44yw4buG0luWJ0NHJyWvBB5p8jhyidT
UxF4YnZbBYRoq7mBC/o00MtPgTlJo0lMQBBNyIUUKf6cm8EnBbWC/ksfZAIzylfL
fUnB/CX+0AR1/ipqh9Yltzjc2gLqKKRwtdndYnGHqNkQz8powMJOWU6FkpXzcZNg
8L7o6R5xI1hkOC2f2hwwH2/+1p26aH54bTyC94T7xQcUPay8peOpAAi0rO/bEbpJ
998of538yhwAK7T4567prM7GrFYirEJrE8tTewFopfXTrdkLQHc=
=v8cf
-----END PGP SIGNATURE-----

--68rGOsT7US5h8AJv--

