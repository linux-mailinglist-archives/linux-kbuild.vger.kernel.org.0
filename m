Return-Path: <linux-kbuild+bounces-11472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GAAGOQ7oWnsrQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11472-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A631B34F7
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28524304F552
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 06:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375723603F0;
	Fri, 27 Feb 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YQQ4yYiI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EFE3D34B8;
	Fri, 27 Feb 2026 06:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174289; cv=none; b=HkHuTf23LNBi3VrwIv8y3jFaPfQI42MAAIF0p+IUGjGDYrjqL47BmG0q62CapG9Oj0LBMitpaNSY2gDxy9KjnOoxvx185MWEWmdKNUqSFnN3yyTWTst0QwUifGCvpQC1nxwOSa8A8j02AmZ/WRQuR72bWvm19piVe9Ig6jZ4OJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174289; c=relaxed/simple;
	bh=5euz4oG3DtJPSjkMeCCtIJ6pr0AEmkKUMdnkYJbyKiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=br/gnTYmruu4zhiiu9RAQohQF9KXpbIzmDiE9LFwAIqcnnEHkj9BmjEN2hB/NBLKSLYGyICauWVSeyG/qnUNxw3JdHtd0NK9euYoBSnNQsXKIhR3HM1kGvTISwc1iD1ipoC/RnugQOia/YnEz3NGPp16Mpj2+lP6ka1GVP6Iip4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YQQ4yYiI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772174283;
	bh=5euz4oG3DtJPSjkMeCCtIJ6pr0AEmkKUMdnkYJbyKiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YQQ4yYiIjIAD+o6Q5RxbDzqQV9hkj+dVsu54d604cJsYp3QAySghPlegyl/2fbNyF
	 XHrfycI0rkcCOTYrnScBLQUjGpuBVIHVEENPisMJAcJQ+cYzOteHiS24Hv0Dg1aQ0S
	 GoOSyGm/zBH/5JIEx7DJFSW5gZg9rq48a7EQ+pSo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 27 Feb 2026 07:38:05 +0100
Subject: [PATCH 7/9] kbuild: uapi: use custom stub headers instead of libc
 ones
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-kbuild-uapi-libc-v1-7-c17de0d19776@weissschuh.net>
References: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
In-Reply-To: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174282; l=1306;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5euz4oG3DtJPSjkMeCCtIJ6pr0AEmkKUMdnkYJbyKiU=;
 b=fcz9Q164tToL+6VPjEC2UrR6k3HEnDMCnBW+p97brquheut3aeHcsyamnoqiSgTKR6kXl/cLT
 R5aNcFE4mOuBS9rVXDAW3gqM73mpxnrfLudB4J/qEaLxysmoqWnRwhx
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11472-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:mid,weissschuh.net:dkim,weissschuh.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07A631B34F7
X-Rspamd-Action: no action

Now that custom stub headers are provided for all libc headers used from
the UAPI headers, the dependency on the toolchain libc can be dropped.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/include/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index fdc79cffcc97..d352280b0e4a 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -138,14 +138,13 @@ endif
 always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
 target-no-libc = $(filter-out $(uses-libc), $*.h)
-target-can-compile = $(and $(filter-out $(no-header-test), $*.h), \
-                           $(or $(CONFIG_CC_CAN_LINK), $(target-no-libc)))
+target-can-compile = $(filter-out $(no-header-test), $*.h)
 
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -Werror -x c /dev/null \
-			$(if $(target-no-libc), -nostdinc, -I $(srctree)/usr/dummy-include) \
+			-nostdinc $(if $(target-no-libc), , -I $(srctree)/usr/dummy-include) \
 			$(if $(target-can-compile), -include $< -include $<); \
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@

-- 
2.53.0


