Return-Path: <linux-kbuild+bounces-13608-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YSBtOmObJGp+9QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13608-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Jun 2026 00:12:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2348864E756
	for <lists+linux-kbuild@lfdr.de>; Sun, 07 Jun 2026 00:12:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=U+xFl7O7;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13608-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13608-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7B8B301BCDD
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2026 22:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A6130C166;
	Sat,  6 Jun 2026 22:12:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C530D3F0;
	Sat,  6 Jun 2026 22:12:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780783966; cv=pass; b=Ov9DXse/AMDuSdSgAVMgMFZK2bhw7rUjxtOgtY+yPjNH5kIfP6p5KMs7VpHqAwLlg2wGJV1W0+IQS359tEbmAlsTpBcjueBiZ6M6lh6hWe+emeCXEciCFCC9VA1tBlB0+QZ1dxXMnThosax6MkeT0eOeNnXnPOTmgD+ySi8Nz4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780783966; c=relaxed/simple;
	bh=NDbnOK1YcDlWGtrDg2vMR3xMFaA6h8qhwmrN1nHInIo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lo6RXNh5KTmLsl9dKQArYUYukyI09GSZs9sh/NFdV6XsnQWT2G8zgjEigmKzK/tLrNfS2XfHWYUSMjgWwHCZPeXBa2u5G92+bEqCV5dBNJskh1uQhi7MV8qcamV6mdcPiVNE+8KSz/noxX2NQbWvmcy8njvi8EpNQZ2/ZU8Js/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=U+xFl7O7; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1780783961; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eTtDPpLON95tN1N0T6BzfKKiMX8EY5qLjFio3dUmUloK+XkblmAMpnrMpDBrkUDrGoeDK0Dnau/NiFojGwj57i4Zjn3wq/Cq45/ROZrAmFDf8JfnOs960iZyr9EfWzpdgTu1KqMr1YJFvbYXGy/vL/OVKVN3dACKTMVpBUNnvsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780783961; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4Bn2B1F6CYCi3/CjKiHP2JWhuEGiaFvc4sID+Ei40wk=; 
	b=lGmAy63u0s1L29aO5L8XuBMwyt3rF0dUvXfpG6duffPh+iXbF/8ksfNXTuG93WSdsOgF0AmB7Klm+HtlohUp0GaK0dcUWGCgbDMGnECINniIwrsPp73jlg/tZp4LUKGA6UYdFrFMMdVVdvk5zN2w5awdQEm9YlHcsOHpat/8tCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780783961;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=4Bn2B1F6CYCi3/CjKiHP2JWhuEGiaFvc4sID+Ei40wk=;
	b=U+xFl7O73oal53WP2tpg/riwbc1gJc/u3Er3OH126uTieLCWT36Nj9LnpkCPHocA
	CzKHwT50wy2lCBMo8G1JlVMP0R/S78+ktMQ6o3keek1Jt/lrEEzwhxpIHJiAIO3gGGc
	IUPXkL8IsxApJkvgcQsqWYb8RHPpoHuYu6kN2NjiIyVPLNqI4t5EZ3xqf+tSqgL5ifG
	2GYsM4Q3p0HdxdLjdyevGO+vNH+oGee5LNdfASDLr9p8gL8NxY22gnRuuT+mnFJSrNE
	5w8iJskl+HBBFHlF9BLA/UcHTly9zcXywLk3qffsOviJzWN1UeHD2HP3zMezm4XFWzQ
	+Npl6mP+mw==
Received: by mx.zohomail.com with SMTPS id 1780783958889562.111694282492;
	Sat, 6 Jun 2026 15:12:38 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/2] scripts/config: Use ERE (-E) and in-place editing (-i)
 in sed portably
Date: Sun, 07 Jun 2026 06:11:30 +0800
Message-Id: <20260607-config-sed-v1-0-2ff7e35de271@rong.moe>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKbJGoC/yXMTQ5AMBBA4avIrDXx01S4ilhoZzAWJR1EIu6uW
 H6L9y4QCkwCTXJBoIOFFx+Rpwm4qfcjKcZosAUanWtUbvEDj0oIlSlLo2usbIYEMVgDDXx+s7b
 7LbudyW3vAe77Ad0v3Y9uAAAA
X-Change-ID: b2d6414d-config-sed-633649d7b0de
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:i@rong.moe,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[i@rong.moe,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13608-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,austingroupbugs.net:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2348864E756

The use of Extended Regular Expressions and in-place editing was removed
by commit 83e8b90e1d2c ("scripts/config: use sed's POSIX interface").

Before that, the script used `-r' to enable ERE, which is indeed
non-portable. However, POSIX.1-2024 [1][2] has accepted `-E' as a
standard option to use ERE for matching, and major sed implementations
(GNU, FreeBSD, OpenBSD, NetBSD, macOS) have supported `-E' for over two
decades, so it makes no sense to use Basic Regular Expressions any more.
Hence, we can safely take the advantage of ERE and merge chained calls
to sed.

Before the said commit, the script used bare `-i' to enable ERE while
skipping creating a backup file. In fact, major sed implementations
have supported `-i' for over a decade. It's really doubtful if anyone
would still compile Linux on a Unix system without it. The issue is
more about how we use it:

FreeBSD and macOS disallow bare `-i'. To skip creating a backup, an
empty string ("zero-length extension") must be passed as a separate
argument following `-i'.

GNU and other BSDs accept bare `-i' to skip creating a backup, but
disallow passing a zero-length extension.

That being said, when thinking about it optimistically, using `-i' is
portable as long as a backup is created. Hence, creating a backup file
with a .swp extension (the same name as the current temporary file)
anyway makes it portable. The backup file will be deleted on exit.

A rough benchmark with ~1000 editions showed a 48.6% speedup (8.78s =>
4.51s, GNU sed) in total. The FreeBSD sed showed a similar speedup.

I split the series into two patches so that PATCH 2 can be dropped if
strong POSIX compliance is desired.

Link: https://pubs.opengroup.org/onlinepubs/9799919799/utilities/sed.html [1]
Link: https://austingroupbugs.net/view.php?id=528 [2]
Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (2):
      scripts/config: Use POSIX standard ERE (-E) in sed
      scripts/config: Use in-place editing (-i) in sed portably

 scripts/config | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)
---
base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
change-id: b2d6414d-config-sed-633649d7b0de

Thanks,
Rong


