Return-Path: <linux-kbuild+bounces-11470-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AksN+s7oWnsrQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11470-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 567781B3515
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5636B30CFC07
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 06:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA19E37B407;
	Fri, 27 Feb 2026 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nGlfX5dZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9DB36493C;
	Fri, 27 Feb 2026 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174286; cv=none; b=Di/jCNBGcuWGk7YfeOeF3pNqe3Ns3DoJvIftpNS65GQUmfF6xXsA2XNLVJxnLbeAfGmu18KH6WO2WvoCfL6UsBwSM3HARbTY0zKQUoy58Z8MSbYAxnX9NlSPzT8g8RxbWiyo3Mt1QopWolq/Qhr9UMlWwd8HiNOgpTaerqRV878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174286; c=relaxed/simple;
	bh=o8GAc9X7vTYuGqD0kl7IxEia6dLJdWHxFZArSAvnNcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWNR4FBtkrl41a5DhH1pYbxzUqKmTtmF8jIYioYhtdnm3UWrQQd39sUGoWqx59GWnwHs5YDUVNTsddL0ER1ChI60QnbC0WGE6t6h8mXIVXNArjfDUD6Xt1X4gn+iyTru+2p4fTY8/cNOdsVeOn5RSvGKz1PT39gxAekUf/i9cDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nGlfX5dZ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772174283;
	bh=o8GAc9X7vTYuGqD0kl7IxEia6dLJdWHxFZArSAvnNcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nGlfX5dZy4ZwFblK3X9+eCti0WS7QDn4O8mLne8ZehqYkV153228rt4a64P6UMvdw
	 hTv4PHgQtfPOwwudGfxgLo2M+j8iCt6NoyG8ZGR7jKWyTm8EhHY7SvDZrk3OIz5qbg
	 uY8pJOrWfSGjyi7c7W7Ne3PsVMNyQ8C2w8hsvmQ8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 27 Feb 2026 07:38:03 +0100
Subject: [PATCH 5/9] kbuild: uapi: only use dummy-include for headers which
 use libc
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-kbuild-uapi-libc-v1-5-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174282; l=1322;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=o8GAc9X7vTYuGqD0kl7IxEia6dLJdWHxFZArSAvnNcA=;
 b=hbg6GN/STo4hUupuF5YD0wP6Sfo7x3vG0cC6WY87paYSM+7xFhzUJ4Ni/JgniZHnLm07cb7BG
 1HI2TcezfHGD/j3WFGdZGwiUkhzGsoFQBkVCKKctMHiOfGxQFa6ZPyA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11470-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:mid,weissschuh.net:dkim,weissschuh.net:email]
X-Rspamd-Queue-Id: 567781B3515
X-Rspamd-Action: no action

The headers which do not rely on libc are using built using -nostdinc.
For them the dummy headers are pointless.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/include/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index a8619aa85c87..fdc79cffcc97 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -8,7 +8,7 @@
 # We cannot go as far as adding -Wpedantic since it emits too many warnings.
 UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
 
-override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj) -I $(srctree)/usr/dummy-include
+override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj)
 
 # The following are excluded for now because they fail to build.
 #
@@ -145,7 +145,7 @@ target-can-compile = $(and $(filter-out $(no-header-test), $*.h), \
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -Werror -x c /dev/null \
-			$(if $(target-no-libc), -nostdinc) \
+			$(if $(target-no-libc), -nostdinc, -I $(srctree)/usr/dummy-include) \
 			$(if $(target-can-compile), -include $< -include $<); \
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@

-- 
2.53.0


