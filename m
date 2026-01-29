Return-Path: <linux-kbuild+bounces-10929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO1/D6ufe2nOGAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10929-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 18:58:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D96B34EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 18:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D3FC3030E91
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 17:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D62A3542D1;
	Thu, 29 Jan 2026 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="F+8ErVFu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7231347BA5;
	Thu, 29 Jan 2026 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709216; cv=pass; b=PZrNhKgGFiQmELkYS0AVFpYtpIYI7HmRpl9kaW/rmJS9Dyg2cgJ/QtUYudytHe818iFBISsGVE7y/Y2apj5bnan8C5R1fCxoBiP4sH5Tk4EQQMZAo4FASNebuu6uv1TUr4AbyHM24drzK0Qgh0l7al7mJeUb8BNL1FBa6UOTBpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709216; c=relaxed/simple;
	bh=3jh6etQiQN7UEAuOT5VdLbdscjAco6a+KyWUy0JnVxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/caNhjDOOGWMQio2aYMuU9aAGHVpjdpY/9Bom4vDOta6yq4tOFD8jMwuRF2B4W5mhP6WXpwHUnpnjcGU+f6h/rL3AdIlJVoN3IFK7lWFNgQbNIQPYlS0Y6THGNdbLpX676xD6x7sJXemNPZpn25jE/km3zEcPaCIE+oEgrwTWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=F+8ErVFu; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1769709208; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eZ7qQ4JsnDvFq9WNBvDUuwz4EePilS+ZRQvoafFsQ2e05mB/NPfqumYFVRMGyMiBorv1eNC5EjiTsp+58vbU6luLNW5jxnkEXLIiL+Q4xu+08Ap/NNgNnaM6ESpai7RCLeRRtVDJ968otMLMfe3yBN1ujL5WCwHMqqckFpROa6M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769709208; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wOOEMhqBiXsW8iDycMxJvq81k1WheMa77UICYBRvLDk=; 
	b=KV+GYdJRvRIduZ5eTMulNRnX/wUFcJZsNwOQ8A+mROfMES+KrznwnowqKrC7kYFISdvokQl7Q/VKXvh9byIwC8soks5BX2z8p4R4wPrCSQzj+OrmSYT5zx5/Tdg58HrdDRGJ0BXEQ8BN1h2OKcEh1eM8DM5kLvFjFTJ87sjugTk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769709208;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wOOEMhqBiXsW8iDycMxJvq81k1WheMa77UICYBRvLDk=;
	b=F+8ErVFuELjFZSYHwjRKTisaxhkUXY8pnCLiugvBTd4QrfDy95PNhULuQyaiQKyk
	eotodxV2+GBZ6pD4Z9lPzeFdVKR8M8gbqGTRERE0nEzne00PEKkmeAJCyzznoEiDftN
	AZwsGGe14BmlkRIaSr3OG+kWerbOQeG03ey54aK0=
Received: by mx.zohomail.com with SMTPS id 1769709206483614.1258651630211;
	Thu, 29 Jan 2026 09:53:26 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Rong Zhang <i@rong.moe>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: install-extmod-build: Add missing python libraries
Date: Fri, 30 Jan 2026 01:49:55 +0800
Message-ID: <20260129175321.415295-1-i@rong.moe>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10929-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email,rong.moe:dkim,rong.moe:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 90D96B34EE
X-Rspamd-Action: no action

scripts/lib has been moved to tools/lib/python recently. Since then, I
got a regression while building out-of-tree modules with W=<anything>
(1/2/3/c/e):

  $ make -C /lib/modules/6.19.0-rc6/build/ M="$(pwd)" modules V=1 W=1
  [...]
  make -f /usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build obj=. need-builtin=1 need-modorder=1
  # CC [M]  mod.o
  [...]
  # cmd_checkdoc mod.o
  PYTHONDONTWRITEBYTECODE=1 python3 /usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py -none mod.c
  Traceback (most recent call last):
    File "/usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py", line 339, in <module>
      main()
      ~~~~^^
    File "/usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py", line 295, in main
      from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  ModuleNotFoundError: No module named 'kdoc'
  make[3]: *** [/usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build:287: mod.o] Error 1

Fix it by installing python libraries from tools/lib/python.

Fixes: 778b8ebe5192 ("docs: Move the python libraries to tools/lib/python")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 scripts/package/install-extmod-build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 2576cf7902dbb..a15de610afed3 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -20,6 +20,7 @@ mkdir -p "${destdir}"
 (
 	cd "${srctree}"
 	echo Makefile
+	echo tools/lib/python # required by scripts
 	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
 	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d -print
 	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform

base-commit: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
-- 
2.51.0


