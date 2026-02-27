Return-Path: <linux-kbuild+bounces-11475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB/LCg88oWnsrQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11475-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:39:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B81221B3549
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6751F309F1ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 06:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969B63ED11B;
	Fri, 27 Feb 2026 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZUZg+IrQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D763B961B;
	Fri, 27 Feb 2026 06:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174290; cv=none; b=JCgA33opuggwdmltGxi6im7gTIG0epDxOVtFl30aXOKgB0Jl0c8iyChKITDRZx7nYuVnNUj04LoUY9WwRzYFK7UI3sZvbJuXO3QNi5iC8tTUcaS35LFIX2dEdUdIV+sTAIigtnlT0te+GU/YBxifDaxvGcS65Qz0TRU5FqCwgho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174290; c=relaxed/simple;
	bh=bkXGwvvaOvc0BEh/UPqlv0oKwlhbzEGpNzwjMPjItm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bfFoY70vx1KY5ZPc0n3+ZvQ/pVLvYC92oUViq9Xp3i//78nlFKebXapqxyk41+N01OSUQ8T+XDIVGTdfjORhQOHGHpcFK93/ybz/P/PeNXLJaYClZm04LnVeNIfv7XF7UJC4JmOz/tBwPMg3g9pnVlwKv0b9D4b/QHFryEykWXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ZUZg+IrQ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772174283;
	bh=bkXGwvvaOvc0BEh/UPqlv0oKwlhbzEGpNzwjMPjItm8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZUZg+IrQbZIv5UkzEK+Njg+e09jDUUZkY/oWCQ3ZpkU5C5RRAatNSMMGbDZjn/ASH
	 LupyXk67UKjK+86JtWYnj3niQ28654dWTv3CRnNHBKC2B+Xa/7A+IcTKQfN1nLnECV
	 I0FVJyccIhriBFr/7xAQ6s90G5oHIpZIl82Gv24c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 27 Feb 2026 07:38:07 +0100
Subject: [PATCH 9/9] kbuild: uapi: remove now unneeded guard headers
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-kbuild-uapi-libc-v1-9-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174282; l=1090;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=bkXGwvvaOvc0BEh/UPqlv0oKwlhbzEGpNzwjMPjItm8=;
 b=rYE5gUNrshLbWx7rPwMmoa1PUEr8jFZdzgkTzSi4rkRdR9eLPLv92HKnFmFq1AnNKisEsjSDh
 zV4KjucMC2EA6czxzuumwfoCOZYd1CXyWB9V8WRSvcHfiK5K7BkkORT
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11475-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:mid,weissschuh.net:dkim,weissschuh.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B81221B3549
X-Rspamd-Action: no action

The test compilation does not allow usage of the toolchain headers
anymore, so these dummy headers are not needed anymore.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/dummy-include/stdbool.h | 7 -------
 usr/dummy-include/stdlib.h  | 7 -------
 2 files changed, 14 deletions(-)

diff --git a/usr/dummy-include/stdbool.h b/usr/dummy-include/stdbool.h
deleted file mode 100644
index 54ff9e9c90ac..000000000000
--- a/usr/dummy-include/stdbool.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _STDBOOL_H
-#define _STDBOOL_H
-
-#error "Please do not include <stdbool.h> from exported headers"
-
-#endif /* _STDBOOL_H */
diff --git a/usr/dummy-include/stdlib.h b/usr/dummy-include/stdlib.h
deleted file mode 100644
index e8c21888e371..000000000000
--- a/usr/dummy-include/stdlib.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _STDLIB_H
-#define _STDLIB_H
-
-#error "Please do not include <stdlib.h> from exported headers"
-
-#endif /* _STDLIB_H */

-- 
2.53.0


