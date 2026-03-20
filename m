Return-Path: <linux-kbuild+bounces-12093-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ5OOxt6vWmt9wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12093-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 17:47:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D7D2DDF33
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 17:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0EDE3052AE7
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 16:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E483B27CF;
	Fri, 20 Mar 2026 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="btywK7L7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2451E39A803;
	Fri, 20 Mar 2026 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024634; cv=none; b=d29/EWQ35ZBTBB9UxOnM+W8GQ2bkY0SXrritap2PpyJGG5RwVEW7PHAhCYyzcQxb1RUsYtolou43kxQQsBsF92Ul+CO2/uXrPXSw2bSiJxHQo+I9jqd4jug4niNsuH6HsUEedJxzJRvLZWxIf9ilqV6KDT7dDzUeO9TcZxSVzss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024634; c=relaxed/simple;
	bh=YkAj8hwpSGdid4m9MHPUaSQA3lVLJr4kfX+jT9FR3LE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OrvVCwX8K+Mckl8sg6oK7lpEKtJK9HwOVwGVB0CHe3yDp9wKToS4gSzmx2hDmgfwt3bz/hsQk0tXd/Ojg8erex3ex7qwEAAiHgdRue6M6wlMB0A4kryp4OO6Vekdeg7AT9rl0YtY1t0B6mEvdPSe0WXmR540xkzY5u9dc9Qjss4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=btywK7L7; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774024624;
	bh=YkAj8hwpSGdid4m9MHPUaSQA3lVLJr4kfX+jT9FR3LE=;
	h=From:Subject:Date:To:Cc:From;
	b=btywK7L7Ts/y4dn9KdhEDIysDHR2L3YUv+Rq1PaXnTcvIC4S74CPR/HJZcnm/6s+O
	 qzWW8fSCEWTsmaaQTm6/uIkDubb0/I/ylfw6aTAa63vLvz6AF6PukIRTfY0r/2/vXd
	 +4okF4THC6jfMnp1EHt4REjoCBLJh4t0Z1I7GKkE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] kbuild: vdso_install: drop build ID architecture
 allow-list
Date: Fri, 20 Mar 2026 17:36:52 +0100
Message-Id: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gasf7yKuKg21WCp0qgI4t0tL
 t9i5gGhwCTQJQ8Eulh48xEqTWBatJ8J2URDnuV1VqgW1/FkZ/AysiF7ObRzWJa6qlrVkG0sxHI
 PZPn+r/3wvh/tK5KzZQAAAA==
X-Change-ID: 20260318-kbuild-vdso-install-44a55817ef7f
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774024622; l=729;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=YkAj8hwpSGdid4m9MHPUaSQA3lVLJr4kfX+jT9FR3LE=;
 b=fqDFNKHvIEjwxdVM6l0XOqR6tLsyPGQ/IcN4o1cFQgL0YdW7+3b4RaPNaNdS98fT0JPhm/2l4
 87p/1wcS7bRArCTKqp5bCGvKX4QIC2wLazDsGwY66PhiRO/EL38KdDo
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12093-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Queue-Id: A9D7D2DDF33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This list is incomplete. Instead of maintaining it manually,
detect a vDSO with build ID automatically and handle it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      kbuild: vdso_install: split out the readelf invocation
      kbuild: vdso_install: hide readelf warnings
      kbuild: vdso_install: gracefully handle images without build ID
      kbuild: vdso_install: drop build ID architecture allow-list

 scripts/Makefile.vdsoinst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 5acf9666477e24e026c54ded89e69cff6596ced8
change-id: 20260318-kbuild-vdso-install-44a55817ef7f

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


