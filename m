Return-Path: <linux-kbuild+bounces-11469-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIY3HNY7oWnqrQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11469-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD21B34D9
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECD343063AFC
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 06:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93CA37648D;
	Fri, 27 Feb 2026 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="n+lObUaX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6550F36215F;
	Fri, 27 Feb 2026 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174286; cv=none; b=m+IA4nozznd654pmPXYLxKPujnozMq9yMbiyUeeh5IafcfMw0VMshlixL6Fp7df3Pa8vRoz+xj8a0EhwGzG/RtHUvvwKKJquygAaos/sEacWSIGrvhGl3rhHQnXh8bQ/CF9GmeAFEhKgWwoM/yNHoJ2UOspUbReq+52knLiNYiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174286; c=relaxed/simple;
	bh=YuQ1Co+OkVPuKnZ7K5F11NNnxW5YJpFGZZQ0qhiE+B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3by18Brk3DW+cGwvVh+Vj7CrPT7CxTaoVJs0UTI7RwZRnhKD9ah6x/LDLYxlQkr9P3+Pv1uzCeGpbqF22AcrKCkpiEM0NsPTYnzRqgMEzgi00cOsC44N2vJtyMh3682+M+6aphAWXWcTHZ7G4MxN1XXzD84HMJJw91FECkcKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=n+lObUaX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772174282;
	bh=YuQ1Co+OkVPuKnZ7K5F11NNnxW5YJpFGZZQ0qhiE+B8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n+lObUaXzVGd1Y3zCN8z9caS4OzXqzI7rqHZuiU1C3t4dVcroLihYThTlB8C4EOmq
	 os/0UsC5/rK9fWrca5ja3godalcPcpB3WPhCFA17StYZHu8jkW1y3GNectanRUYyNb
	 NZJ8jYCzBxVJXG2B77W11OpM2t3SfEVUup54I0fk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 27 Feb 2026 07:38:01 +0100
Subject: [PATCH 3/9] kbuild: uapi: deduplicate linux/bpf_perf_event.h
 exclusions
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-kbuild-uapi-libc-v1-3-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174282; l=1025;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=YuQ1Co+OkVPuKnZ7K5F11NNnxW5YJpFGZZQ0qhiE+B8=;
 b=q60QBQ4V9i7XOSCSInFML6wrE//rzsaQb97vuhVw3dMw2XpfEL0iUm08i/8r9ZBo9vYutxLj9
 yH7RAtvp14MCZNuWHGdEYC58fGIKW2PjoSn8BiEMfmS7dlMOx7ixbZm
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
	TAGGED_FROM(0.00)[bounces-11469-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 33FD21B34D9
X-Rspamd-Action: no action

This header is excluded for multiple architectures.
Use a single exclusion for all of them.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/include/Makefile | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 595996eefcc6..ae365d32269a 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -48,11 +48,7 @@ no-header-test += xen/privcmd.h
 
 # More headers are broken in some architectures
 
-ifeq ($(SRCARCH),arc)
-no-header-test += linux/bpf_perf_event.h
-endif
-
-ifeq ($(SRCARCH),openrisc)
+ifneq ($(filter arc openrisc xtensa, $(SRCARCH)),)
 no-header-test += linux/bpf_perf_event.h
 endif
 
@@ -61,10 +57,6 @@ no-header-test += asm/uctx.h
 no-header-test += asm/fbio.h
 endif
 
-ifeq ($(SRCARCH),xtensa)
-no-header-test += linux/bpf_perf_event.h
-endif
-
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
 no-header-test += asm-generic/%
 

-- 
2.53.0


