Return-Path: <linux-kbuild+bounces-12885-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PceNa6K72kPCgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12885-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 18:11:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 964684760C6
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 18:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E1EA301FCAB
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 16:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5382D34E761;
	Mon, 27 Apr 2026 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="sVy+2WOs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83451346E6C;
	Mon, 27 Apr 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305958; cv=none; b=krx5diTucX8C9B12n4CVpJ5sDdnf0X0K+SkcJVROh4n1rC5kw/Fpy3HARF11BuLGkJHVnW+XVo/o0x9doTpYeVXcjNtbqEvsjE55DmbZSimfPuvk30oZWFlax+TRFsfTGTL20jav2z1cIisynoeVFb87EndqeDxFN4kKk0vqO9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305958; c=relaxed/simple;
	bh=KDqdcpwLRgMcJZZ9U4l5WYgq5WaDe7InhUdteuY4YUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W0ll32C7IDziyvt4ySrVRyXv+bl3svDgBWxwlNIYSl3LzyECuTlV9Ye8aiCbhHBsQdgRuWQjCedHtsZk9Z9/VULjvFcmOFjTDZt8UiQ8FHiTJ46YDhZQizeXqtXmAjhcdJjUfwvNKrPrz/m29ohkxpc5iI9rYFH8qP4AkLm5g3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=sVy+2WOs; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777305953;
	bh=KDqdcpwLRgMcJZZ9U4l5WYgq5WaDe7InhUdteuY4YUw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sVy+2WOs6id/L1QgiCb4xTlWL/j70DW2kGIQdlGMktuVoXJ31gGcvMktldrQ3Do/J
	 z+q6DgmUnn2SrQpNvzDvOdrZTnT3mY8wJSHgARTC8sJizq1lS9X7QxPCQjrtZdpBMf
	 L2JuNAG5IWrPTqWmHEOr4hc5StObt8Jfq1XlXkqw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 27 Apr 2026 18:04:57 +0200
Subject: [PATCH 2/2] kunit: qemu_configs: Add or1k / openrisc configuration
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-kunit-or1k-v1-2-9d3109e991e8@weissschuh.net>
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
In-Reply-To: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777305952; l=998;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KDqdcpwLRgMcJZZ9U4l5WYgq5WaDe7InhUdteuY4YUw=;
 b=fvthQpQdUVU5xSX+VQMUdvkUiGXWFoydb3pelGO/xhYPuS/TnyyKmxV9G3HC6Vg8Yg7nK/IGH
 7VTMREdU3XIAEiUl4+caVWS9NCaql+HUjHbi3DxouKHYpc2fiPUcFew
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: 964684760C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12885-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,linux.dev,davidgow.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,weissschuh.net:dkim,weissschuh.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add a basic configuration to run kunit tests on or1k / openrisc.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/kunit/qemu_configs/or1k.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/kunit/qemu_configs/or1k.py b/tools/testing/kunit/qemu_configs/or1k.py
new file mode 100644
index 000000000000..dfbbad0f9076
--- /dev/null
+++ b/tools/testing/kunit/qemu_configs/or1k.py
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+from ..qemu_config import QemuArchParams
+
+QEMU_ARCH = QemuArchParams(linux_arch='openrisc',
+			   kconfig='''
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+''',
+			   qemu_arch='or1k',
+			   kernel_path='vmlinux',
+			   kernel_command_line='console=ttyS0',
+			   extra_qemu_params=[
+					    '-machine', 'virt',
+                        '-m', '512',
+			  ])

-- 
2.53.0


