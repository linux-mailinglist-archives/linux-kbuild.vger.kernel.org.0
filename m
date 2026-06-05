Return-Path: <linux-kbuild+bounces-13601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ILbHIm4KI2rogwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13601-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 19:42:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BC264A44E
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 19:42:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mbEdX2Yc;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13601-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13601-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE02D3017394
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 17:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFBF38398F;
	Fri,  5 Jun 2026 17:38:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C25392812;
	Fri,  5 Jun 2026 17:38:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780681125; cv=none; b=eWJr55JwIEsN5ZdFiuUlIOn1r+aQ2wR+M8J42oZb6K9j8jZg+o/+Kp+ct/OrAYbKY0uk3j7xvyniOzYDwohiP9f5pjl0PJOVtgwUzD5FdaoC5N2LsUXrqw4nmNkKFrII9X0UvIwm4dccOLss2yqE6TEYJNHOR6cOuU4POWQEjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780681125; c=relaxed/simple;
	bh=Jzqfy52nhoRfZI63I1SLmuE3x9hsjVFzT9kz8j2Bb3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ippiDJUEO1tQNRDSnclol8q/ywT67WEug7sdSE5t0Cp4s7rfPax8Vw4ysJeSIPs/+Pa1U02uJ2ElkcZLo5eJ1257i7px2y0tH6XK6E/0qlUOVnb2B1IDcFYEdvjADlNXjMGmkJ7B/md1o1jHOLP+u3a+ASYRJgR6SOPMZ2Mxdrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbEdX2Yc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 56BDE1F00893;
	Fri,  5 Jun 2026 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780681122;
	bh=a7zK7QTVNJZEn3fKvorqlfclNo4WH/lsG9SttNRnTPA=;
	h=Date:From:To:Cc:Subject;
	b=mbEdX2YcADh+LhV5dl9WG2Tw+A+4CAh38nI5sNwa8MrzlGYBb/5plvEoRLUGKDthz
	 3mUAzkOXJqmxLJsHHkTd+ZGmakJ/SsJCAvejoVpdbh/SzomoL+guxFxYVFS7bKpZzw
	 uVumhJbCmj6B6HOJiN++ynRccMfrpi1GDoiDOTTEJhMGUaFmeYYZVw0/BioJlZT2D1
	 X4H7m5E+WBCKFWgPRlZHQKQv09MoYuaLDauXOm8SeAL1mdRuGO5q7ff1z2VGjCIVnZ
	 Ggr5eeFazHbq9KdGclLM7QLqa/i5e+gx2vlEK5aIA8/skoDmqBT+KUfR4UQtTbNSf3
	 ebgFOW8kPprhA==
Date: Fri, 5 Jun 2026 19:38:35 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Zhou Yuhang <zhouyuhang1010@163.com>,
	Zhou Yuhang <zhouyuhang@kylinos.cn>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.1 #3
Message-ID: <aiMJm3Fcph8hwlul@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Zhou Yuhang <zhouyuhang1010@163.com>,
	Zhou Yuhang <zhouyuhang@kylinos.cn>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NkS82kwRmutn48BZ"
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:nathan@kernel.org,m:zhouyuhang1010@163.com,m:zhouyuhang@kylinos.cn,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13601-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,163.com,kylinos.cn,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,levanger:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03BC264A44E


--NkS82kwRmutn48BZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull this third round of Kbuild fixes for v7.1-rc7.  It's only a
single simple commit that fixes the currently broken kconfig selftests.
I hope you consider this fix important enough.

If there are any issues, please let me know.

Thanks and kind regards,
Nicolas



The following changes since commit e43ffb69e0438cddd72aaa30898b4dc446f664f8:

  Linux 7.1-rc6 (2026-05-31 15:14:24 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git t=
ags/kbuild-fixes-7.1-3

for you to fetch changes up to 65b09bfa8aa7ebe087093b591525385efb2d58b0:

  kconfig: Fix repeated include selftest expectation (2026-06-05 19:24:49 +=
0200)

----------------------------------------------------------------
Third round for Kbuild fixes for 7.1

  - kconfig: Fix repeated include selftest expectation

    Fixes the currently broken kconfig tests

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Zhou Yuhang <zhouyuhang1010@163.com>
Cc: Zhou Yuhang <zhouyuhang@kylinos.cn>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

----------------------------------------------------------------
Zhou Yuhang (1):
      kconfig: Fix repeated include selftest expectation

 scripts/kconfig/tests/err_repeated_inc/expected_stderr | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--=20
Nicolas

--NkS82kwRmutn48BZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmojCZsACgkQB1IKcBYm
EmlhSw//TgQROgEQCEUEpngpPlZBN68LSXYa5PaCIGTuNvi4FGJ8OJN7vjG/qmz1
tZ7wziIdVbAYAOfC6yhbYF+aTcYMavGTBBjZRtDKyZD/BevWcHsjR/bBeDW8qxRH
+TPZHZbj/UAWXj7XlRpKYX/v7MFH9RQ9sckwSK0pVE/fCW+8FdA6YwS0OjQMiZPE
h0TtCo24FeBPlIsr+88sDwRy7QGUiCI3o9E64mMU8pE4SNi+se/lkwYAUPLVXcYe
PSNPAm4mTBkajcSn4iuQJrl6frK0HqMnklXXy7bFuhBwhYD0b0YjXvC92lZij0Tl
uAxuA29DZzavQRgYbf8J/w9PcPgNWf+TI9M/1df1jVILTwuN1oRRrBemh8fY173P
oIG6OFfYeEdSJtDlmfMqa6yIKS0MTEWZjmdav6kqsuGOtvFMPiDLMMVRup0BX+Tb
+WTsScJlK+x6h8rj6hLSZ/vBbLGipcdwPv23yApimAN6gbCpQMppJp6SzXmY7YVY
FmaLLsfxaOdqaxTIMUuvowAFQMUbk35NQK6PV/g+Wws8+qGwQc+wWEp7jVSxmtMm
emnuXee+Ga9VDGIUuRYw1nb1OLOa8u2v+lH3VJWH0XUoDRwGLOb055fNq88fjmEV
ee3aUFkJJaJw1l4002E4yn9GqAkj1dq3GYF6J+fQ7vCxhKy55uE=
=4GQA
-----END PGP SIGNATURE-----

--NkS82kwRmutn48BZ--

