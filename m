Return-Path: <linux-kbuild+bounces-11043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLWACYoChWkV7gMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11043-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 21:50:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3DEF7446
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 21:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C3F2301911D
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Feb 2026 20:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C5732ED2A;
	Thu,  5 Feb 2026 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AoTid/2V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B9E32E758;
	Thu,  5 Feb 2026 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770324613; cv=none; b=I7pm7Vuw7XdvESFQsVrswkO9jHz6q9WxTM+XqQbtDmWEztO5QkF/9ce2Uj1MMbh0cVmX+KGBIGitt+S6ZM+JJgIWx9RkW324jpXuZuanEhDCmHxAzlsCvtjekhEfi4S3IYmJ8g8vKB6s7IZ0rFfl50EMLR0MwaL1Ws7eHY7oPRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770324613; c=relaxed/simple;
	bh=FOKStVXwHToQPTBdU79yJAc5b60ZmuhjblvqKg4rnDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gSmnosTRHC43zFw0dHjbHM1wwbtW4K3rNWD02s8s3I6guV2nclSGBwyuy22YvhOmIkCl08FxaLK6ijb9IWnk8l8mYZnBhaG+uEwUXdCWn0F/IjKkkvO8oEMTIqZ/9BnOXs244P/m8Qlo8nhUld92u9T4CzSOxueXnEjfZRXZTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AoTid/2V; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1770324604;
	bh=FOKStVXwHToQPTBdU79yJAc5b60ZmuhjblvqKg4rnDg=;
	h=From:Date:Subject:To:Cc:From;
	b=AoTid/2V876iC9b3yd1QeX6R2UY3dr+VyhgXRDCRiKWVjaeiAw2zHps3DIg2sfaNj
	 FPv4ps5Iok/3hhj1AMJmrKRhSooUklwSqymF55RBPNw0A/51hzdzUngDYUvGj4A6qA
	 KQk9xuuVHGX3LjdxfpCMaqAydRszE+M2EKz+7bA0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 05 Feb 2026 21:49:58 +0100
Subject: [PATCH] kbuild: remove dependency of run-command on config
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-kbuild-run-command-v1-1-b8cbbc3db270@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBuwoVp0lWiROtZQWShFIN49a
 fkW/yeIHIQjDFWCwI9EOX1BU1dg1tkvjGKLgRT1ilSHm75ltxhuj+Y8jtlbdNrqhgy3ruuhhFd
 gJ+8/HaecP1UwbkVkAAAA
X-Change-ID: 20260205-kbuild-run-command-fbdb12ce4f56
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770324604; l=1129;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=FOKStVXwHToQPTBdU79yJAc5b60ZmuhjblvqKg4rnDg=;
 b=cTmWNhXZ/fTuxyVs6jwdCst7BX+OUvmTd9PXJd3xU7Qmds6otK9wG0ScO/aTNW4bgEhSBB2kG
 jVplfChS3ymBqeugvpQjobQV1+7K7siHL87pc4uiYaUXbh/BMLqQo8I
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11043-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B3DEF7446
X-Rspamd-Action: no action

The run-command target does not always require a kernel configuration
to be present.

Drop the dependency so it can be executed without one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 93831019c17b..a1f3b7d98188 100644
--- a/Makefile
+++ b/Makefile
@@ -295,7 +295,8 @@ no-dot-config-targets := $(clean-targets) \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile rustavailable rustfmt rustfmtcheck
+			 outputmakefile rustavailable rustfmt rustfmtcheck \
+			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/

---
base-commit: c7c88b20cd4226af0c9fbdb365fb6f221501c7da
change-id: 20260205-kbuild-run-command-fbdb12ce4f56

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


