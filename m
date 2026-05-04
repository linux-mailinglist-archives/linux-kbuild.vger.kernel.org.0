Return-Path: <linux-kbuild+bounces-12982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL7rFLxo+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12982-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:37:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ACD4BB0B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BEA3302451E
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391D937DEB5;
	Mon,  4 May 2026 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="19x/oCdJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M/Uov3tW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B00037F000;
	Mon,  4 May 2026 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887221; cv=none; b=QWtWtcWq7+LM2fExO22BE0x7MR+qEQBp74iewphn8OSGmU5LeR44DlYoTPwZo4JrAr/DyKfIkMUM7lT4lgRLXTdbSsKKk5UM7XR5K5H5QJXAvx9zZIbVuqcCauUK18yXB8MHkMzn+Dd5UN7pf8FwQW1Sx2lnJeyJr9TVQTdqJzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887221; c=relaxed/simple;
	bh=/OTOG/yua90Lm6N+XVb5eKq3ag+BtIQRvIkh/Uh7nqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5U3wd6ZPCQbv60BNH4sDG8EgkmkqC1ZoSh2+ybzGBaxqGdtGzNxhOxzDNB17Be5MTva5AYaE1GWDtss8Jf6edG1caz4uiLMY9CfGETMcC9nUi4YfW3BqUYRLWygi4I/cAoySfoyzRiVTJAa0e/B7Y3C20GRGctAWRQkszQttrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=19x/oCdJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M/Uov3tW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRvGlWmW/ojdtGAUMoSosFz7deYXy8s7phdrC4jCvnM=;
	b=19x/oCdJuCt3sTu3vTApdQLhjebe/Ydk01U5DhSb0hNZkgEx21FnNsIhZxOGJVCESPAVsl
	LzmeqpUq0Jonmcm2OK6bLFurYJcZRvp2Zb3fWKq/tQ7MSfWRIa9LD+nzJsmxGiqUfVc7T7
	hWa6B/d+4MdRYx7xvQQ1gJpCmIZegN7WvktTAaNeJJWzg1vwJYyEWaBoM3QCehJvhrcG5O
	XquE6x/y7PPljUh1TVkHsvCuFRLtoXCA/mzNbJUkJs8YoVWAFs17BuyGjNxgL3z160gyxq
	K8xpIPXKEWoaxzoPb4lJOfD0jpiS3f5PLcBLsf2V89LmCRScbpjbYMAkD96Qfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRvGlWmW/ojdtGAUMoSosFz7deYXy8s7phdrC4jCvnM=;
	b=M/Uov3tWwMt7wja+O9d7V2NBb3AAHuPbGWW1qRdr/I9g5F06chKUTbdH2eVZUEigPOs/sW
	5rX+5REI0NZEUOAw==
Date: Mon, 04 May 2026 11:33:22 +0200
Subject: [PATCH v6 06/11] kunit: qemu_configs: loongarch: Enable LSX/LSAX
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-6-712d3d526d97@linutronix.de>
References: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
In-Reply-To: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Kees Cook <kees@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, workflows@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>, Nicolas Schier <nsc@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=938;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/OTOG/yua90Lm6N+XVb5eKq3ag+BtIQRvIkh/Uh7nqY=;
 b=BSBfbeny5Sp+nXeipSJPWFZtzmTsbG6naZ2YXu+Z/Sz6yPYCeqEBDHlnUD9xlFYWGXf+e9G0y
 2o11zIf8DsGDWXZYcZrsJ54Mn+Gvgit5Ozs+EfUJF5lomDn2OlZ/af8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: E7ACD4BB0B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,1wt.eu,weissschuh.net,linux.dev,lwn.net,zeniv.linux.org.uk,suse.cz,lst.de,davidgow.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12982-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The upcoming kunit UAPI framework will run userspace executables as part of
kunit. These may use the LSX or LASX instructions.

Make sure the kunit kernel can handle these instructions.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: David Gow <davidgow@google.com>
---
 tools/testing/kunit/qemu_configs/loongarch.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/kunit/qemu_configs/loongarch.py b/tools/testing/kunit/qemu_configs/loongarch.py
index a92422967d1d..1dba755284f1 100644
--- a/tools/testing/kunit/qemu_configs/loongarch.py
+++ b/tools/testing/kunit/qemu_configs/loongarch.py
@@ -11,6 +11,8 @@ CONFIG_PVPANIC_PCI=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_CPU_HAS_LSX=y
+CONFIG_CPU_HAS_LASX=y
 ''',
 			   qemu_arch='loongarch64',
 			   kernel_path='arch/loongarch/boot/vmlinux.elf',

-- 
2.53.0


