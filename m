Return-Path: <linux-kbuild+bounces-11473-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNdtIuQ7oWnqrQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11473-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97A1B34F9
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64CC5303D6B3
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 06:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523AF3ECBD6;
	Fri, 27 Feb 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="rhPeT7TB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E0E3D2FFD;
	Fri, 27 Feb 2026 06:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174289; cv=none; b=Qvm37+l/pIdCLsu5uSjgd8yaKnRV7qY07PdrEDz7YJ/Z7CJbYb7LhyKtz+z5DULqpQPmcHId2YvSp6UaFQXfan6nnW6t7M+ir2KAZ7zW/AuFfCIiOCQa8dU0RwyNUOfdBbGSUcIgUkZa2FG+ZoVxAFoFL35p9TaN3BVxkMErg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174289; c=relaxed/simple;
	bh=lYXlCSOlof3iJWlivc1wAhYnmrROuKYSuoCzxMjxJa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIHRcYWobCXtm74LvrXoVenQYtx+M54Jwevdm5uaQLpY9IAUlYOzfY1gyM1OADGex9Ek//UkqNmAPCcVLypelOlgJOYlQXv7lUYkSvFUbYk/pPP1v97sTmp5NyIPssoplMK9FDaCdKSE2pKL0+Lam5euqrTk3MVCxbVAHjKoAFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=rhPeT7TB; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772174283;
	bh=lYXlCSOlof3iJWlivc1wAhYnmrROuKYSuoCzxMjxJa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rhPeT7TB6hjpvbsxthhRBYTiTPvxyUPiwiGrh7T3T3mMHNhmyUV/iqnGfyj7NNOX2
	 Q24ARvy0/KoSwz9UW/vmArbTOVV7gpKMQ5WdjvwA/zl1tgoWcxeuigQTyRYhCnOgXo
	 7AS+EiTOLZ9U4vosJPAkjpRR5/uPFL1OoR2vp+wk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 27 Feb 2026 07:38:06 +0100
Subject: [PATCH 8/9] kbuild: uapi: simplify libc dependency logic
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-kbuild-uapi-libc-v1-8-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174282; l=1163;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lYXlCSOlof3iJWlivc1wAhYnmrROuKYSuoCzxMjxJa8=;
 b=bQzJfg6vPv/Fl1mpp1fejADgZOE9FVlE3s6iaCVo78XjmcBc671rlrMQvCmNVSkVY+L847PNy
 Iaj4CiAlek+AUtCl83xBDvJWI+u7n3Bol0OXNZILnqAP4SlaPKKzJUa
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11473-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:mid,weissschuh.net:dkim,weissschuh.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D97A1B34F9
X-Rspamd-Action: no action

The only left user of the condition inverts it.

Invert the condition completely and simplify its user.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/include/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index d352280b0e4a..845d06b63c2b 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -137,14 +137,14 @@ endif
 
 always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
-target-no-libc = $(filter-out $(uses-libc), $*.h)
+target-libc = $(filter $(uses-libc), $*.h)
 target-can-compile = $(filter-out $(no-header-test), $*.h)
 
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -Werror -x c /dev/null \
-			-nostdinc $(if $(target-no-libc), , -I $(srctree)/usr/dummy-include) \
+			-nostdinc $(if $(target-libc), -I $(srctree)/usr/dummy-include) \
 			$(if $(target-can-compile), -include $< -include $<); \
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@

-- 
2.53.0


