Return-Path: <linux-kbuild+bounces-12638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEGnEeIC0WmNDQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12638-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Apr 2026 14:24:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7439B12F
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Apr 2026 14:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00D5A300D321
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Apr 2026 12:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009662DFA25;
	Sat,  4 Apr 2026 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="o7fnwOAx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE1A21A447;
	Sat,  4 Apr 2026 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305395; cv=none; b=KiJsnmd6ZJzjxSmwpjZpedfR+6xFymhxZV6RIHOLCOD4Wz2xa8QHllFDwTmlzrJ3Ln+k2sODWSTfxOf23AefX6fvL3XUN65ri3xMZYN+AVg1AOO/aKdujjT8mX9XD6wgXB3xTrimBW+ifHctMqVe8NIqFb5Bol88SPzGGP4h9Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305395; c=relaxed/simple;
	bh=sMTHo7j3ExMZNWyfQsHIC/bqLtEtXoOmzsjPCYaxOfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sCTqtvMWA6jJU4BA9hen+pDAMDrU/FKN93AvwnpaTWBmgtwfWYBBemf13DtADS5fAPEJtMLhhLkg+xl0gbBnDo0pcPuC3rxn52K8qSRwK5cHF0AbWQvNi9GzFX0+jF2jUn1sjH5cFXfQz/Bgpc8i1MNe0iKbtCoS2vCpW2mJy2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=o7fnwOAx; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775305392;
	bh=sMTHo7j3ExMZNWyfQsHIC/bqLtEtXoOmzsjPCYaxOfc=;
	h=From:Date:Subject:To:Cc:From;
	b=o7fnwOAxjpSf9KhmYyVIPl+ZYcO0OjrQYq9UMK3sUXXqxfyVuIHKzgaMynCU3fA05
	 McGVXh8pw2+t02gUrMHdW0KAvHYVvv/XfPC/tUb8uHGsg5D+jUYWrqYNxOhvHCBXix
	 Rksv/f0C+bggviEs0SDUIae2kr6avh5aoes8WOJM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Apr 2026 14:23:10 +0200
Subject: [PATCH] checksyscalls: fail on all intermediate errors
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260404-checksyscalls-set-e-v1-1-206400e78668@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxG4auQrm1SByPiVYwLKL9QJWimSCCEu
 zvq8lu8t5IjGpzO2UoRk7k9h4T9LiPtqqEFW5NMQcJRDpKzdtCHL65V3zs7RgaXempUtJBQ5pT
 KV8TN5t/1cv3b3/UdOn5XtG0fyV1giXcAAAA=
X-Change-ID: 20260403-checksyscalls-set-e-9c8dc0c70293
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775305392; l=986;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=sMTHo7j3ExMZNWyfQsHIC/bqLtEtXoOmzsjPCYaxOfc=;
 b=1fgVOO6PptfAkeKREa3HYb5XXqMxjY6HNzYYGeAdAyNVvEqarEk6f0Mo7351hGtCYiOmt3LXd
 mbFT7CMc598DZOJrGFPsUPY52uENx6p7pGDgGKApOO8RDdqupsPqQTI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12638-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,sashiko.dev:url,checksyscalls.sh:url]
X-Rspamd-Queue-Id: 8DB7439B12F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make sure that a failure of any intermediate step also fails the
overall execution.

Link: https://sashiko.dev/#/patchset/20260402-kbuild-missing-syscalls-v3-0-6641be1de2db%40weissschuh.net
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Niclas, could you move this before commit a414e4ba513f ("checksyscalls:
only run when necessary"), or merge it into that commit?
---
 scripts/checksyscalls.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index a6d0882f07e1..e2970421c1ff 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -10,6 +10,8 @@
 # checksyscalls.sh gcc gcc-options
 #
 
+set -e
+
 reference_table="$(dirname $0)/../arch/x86/entry/syscalls/syscall_32.tbl"
 
 ignore_list() {

---
base-commit: 95f4197e0e5d68e54e9f4aba8e85249c69bad7a7
change-id: 20260403-checksyscalls-set-e-9c8dc0c70293

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


