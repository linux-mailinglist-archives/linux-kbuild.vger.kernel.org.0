Return-Path: <linux-kbuild+bounces-11682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDn8OfzorWmb9QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11682-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F98A2324D6
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA2333005AA1
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 21:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DAB3563E8;
	Sun,  8 Mar 2026 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="D1VlyvgL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFEF3469F6;
	Sun,  8 Mar 2026 21:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773005049; cv=none; b=YkyubMm/QNErcSK/vlP2LdkicLlqq6KhIrw4nP7pueZ3/r+pxKcbN7fIJyZhJY3sDGnGcMEbf12ZnAWHyiVNqq+pQ/ROtB2nqlQTUCwqpiP2eEsUhT2Ifug7Y25VBcryA2v6sQ4TWFdW6xgZkMkNFhh9dOHwmTPxIktaPOIawEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773005049; c=relaxed/simple;
	bh=Ie8JyQr29CSVgjSQS2X0Z0dBIBrZdPaXfIGJOlLEwHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfKrCteEdic/To0KvftngLRtg8RocP5PWwkRDOhbJ9JG35gZTQaT7Y2HMGSmxN0g9I109ABDxUdvt57S7z74t3UxRONF1zHM+Vdt0X3um4zk5MHrd9Gira3uCmkT/K0dHn/1PRsYndH7X25fAxdd9yDHHyHKLoy6NpRiekUEZkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=D1VlyvgL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773005045;
	bh=Ie8JyQr29CSVgjSQS2X0Z0dBIBrZdPaXfIGJOlLEwHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D1VlyvgLIz87gV3RK1FKkEE2I3cuVHU6EU3BBXIyxMVcqamwddG57yQ57jF8QPbOw
	 cxh3InUgVxPTAVVwqyPtNSzRnVudL7oNFEFvsRqwnJuwOcIGOop+QKaulsO6YgQwCL
	 LUJWTpYcgx+oWJOoXlrWKHiHJ3mmGJi/+IRiiErM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Mar 2026 22:24:01 +0100
Subject: [PATCH RFC 1/5] kbuild: uapi: move some compiler arguments out of
 the command definition
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260308-kbuild-uapi-c-v1-1-86aae09a7f1d@weissschuh.net>
References: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
In-Reply-To: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773005045; l=1251;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Ie8JyQr29CSVgjSQS2X0Z0dBIBrZdPaXfIGJOlLEwHg=;
 b=WZH4lRI88tNFN2Djiy+PTrJVqBDBPOUiMKQsH89XeLk/xxo5O09yk37HdwwT9ml8AA2/mnTQn
 PoqlGgj9O66DHPGgVar5rMuCNQWvaQqzzpmSr3ybfTxFu1NvZtBI0OK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: 8F98A2324D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11682-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.928];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Action: no action

Simplify the definition of cmd_hdrtest by moving some of it to a new
variable. This will both enable the upcoming reuse of those flags
and also the extension of cmd_hdrtest.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/include/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 845d06b63c2b..0b1c9a4b0477 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -140,11 +140,13 @@ always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/
 target-libc = $(filter $(uses-libc), $*.h)
 target-can-compile = $(filter-out $(no-header-test), $*.h)
 
+hdrtest-flags = -fsyntax-only -Werror \
+		-nostdinc $(if $(target-libc), -I $(srctree)/usr/dummy-include)
+
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
-		$(CC) $(c_flags) -fsyntax-only -Werror -x c /dev/null \
-			-nostdinc $(if $(target-libc), -I $(srctree)/usr/dummy-include) \
+		$(CC) $(c_flags) $(hdrtest-flags) -x c /dev/null \
 			$(if $(target-can-compile), -include $< -include $<); \
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@

-- 
2.53.0


