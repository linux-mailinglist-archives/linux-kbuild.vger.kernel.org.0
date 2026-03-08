Return-Path: <linux-kbuild+bounces-11685-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFaHOgHprWmb9QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11685-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0472324E5
	for <lists+linux-kbuild@lfdr.de>; Sun, 08 Mar 2026 22:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F05730059A2
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Mar 2026 21:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A889359A9B;
	Sun,  8 Mar 2026 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="q1zbBMWh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07334F498;
	Sun,  8 Mar 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773005049; cv=none; b=NZgdDHMG6fV2lRICFJ+V6Ef35x/BB3N6x0aK1EHyCW0CA5XxTZO24O52plYsoky2j69RXHcicJBB2LkUwsniWACtgfAxsP6QZuPmvqsE+9DTz+Es9H8tpEP/HP5tqRHfrIbSxD4jQ6//4Hp+TW32i13oy4miWz69VMS+ZENmeeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773005049; c=relaxed/simple;
	bh=OVCw2lloa52/3LAY7ZS7KGho3Qo9V87Zi0bQjk321xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YW8b9mj2K91x8fxXdeC7UzmdCVy/uuS/lDpWFVZ14lHxULOuIUtACwmRz59bnFo/GQVP7TxpYvW1BiHoQzOw6uDahHqpMnEvEiZry7Rigdhe+SMptANXG2SMKahHUYWDhoVsrsks4HJThHnCC5Fe6LHKiGGJFRtUqD8+OYiYPSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=q1zbBMWh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773005046;
	bh=OVCw2lloa52/3LAY7ZS7KGho3Qo9V87Zi0bQjk321xA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q1zbBMWhTd+g4ofSbLLO2+TBhfeOtwpvh9CKz2qvBj+Y8MxQG5aUJH4XtPDw/nIcY
	 I/iaRrCBR0IkgcWkj5SjIvTrStWn3zx5Lng2jopIfim5aG5jsBu0XdzSV5jCwEI2Ze
	 3IgPpvZ9tmdNyRXg+MTZhfdAcSr174P5H2+8k7dI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Mar 2026 22:24:04 +0100
Subject: [PATCH RFC 4/5] kbuild: uapi: provide a C++ compatible dummy
 definition of NULL
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260308-kbuild-uapi-c-v1-4-86aae09a7f1d@weissschuh.net>
References: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
In-Reply-To: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773005045; l=722;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OVCw2lloa52/3LAY7ZS7KGho3Qo9V87Zi0bQjk321xA=;
 b=NPZNlEGF4j6TEYivWhMyXkthkDtEXpZFvnQdHtEg6fZx2a+I/NwMF/uAfGFhRNHyU3TfMz8HU
 Gdyxh+ppn1hAIgN3XKjzI71XCr6zsHpavYrCg/YWbyxl/pSj+O5Bxxd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Queue-Id: CF0472324E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11685-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.931];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Action: no action

NULL works differently in C++ compared to C.

To allow testing the UAPI headers against C++ compilers, provide
a variant of NULL which works with those.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/dummy-include/stddef.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/usr/dummy-include/stddef.h b/usr/dummy-include/stddef.h
index a61703d1c896..525489daffe2 100644
--- a/usr/dummy-include/stddef.h
+++ b/usr/dummy-include/stddef.h
@@ -3,6 +3,11 @@
 #define _DUMMY_STDDEF_H
 
 #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
+
+#ifdef __cplusplus
+#define NULL 0
+#else
 #define NULL ((void *)0)
+#endif
 
 #endif /* _DUMMY_STDDEF_H */

-- 
2.53.0


