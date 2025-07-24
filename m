Return-Path: <linux-kbuild+bounces-8123-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0EB103A8
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 10:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD1B154307A
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 08:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09097274B52;
	Thu, 24 Jul 2025 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sbpvaIPK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G1Teq49N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A7519C558;
	Thu, 24 Jul 2025 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345990; cv=none; b=nVWSFVzwG9jWs0ha11/ppRaAYqIz82s0Oxn+P4D406M9/ffJ9UOANulNdrXSlk9Slxf7EZjyo7r/M1bVUy46amd5K7XC8xC9R3MWA7wGFPilTKkWWjUNjgoHb1ZLPxXJ88Y65iGCnnIFPXqNotr9I0gE97psGtBMumtPl+ZjWa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345990; c=relaxed/simple;
	bh=MJLE6/9GrtAoL8Z6/CW5hi4mg67Rc804aigsDt5ADus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jn5K49tcbvLwUtnremEK8alp5qrYoSRoVGy8sdrUrT6Q22BpooEQN/G3JEv0PzwKcAmFK+hxYTf16Tb8thkQSoEDTQDtgEEsDxmQXQOjdrl8coMkW/aQKJjspUP6c6BC53mBVadmOMebLsJOuu4e6Er1JlvKPuZEKv5lraUFkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sbpvaIPK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G1Teq49N; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753345981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UfeioyuXM8H0P6HgUkIxbe8RCaVnHlA5q+CSI585x/I=;
	b=sbpvaIPK7InFYNHJ0JkqjMwxsmHbWrK0Jno/KH7hOXIXvNS5/MayeSWlO4mn/dLbzkWKCr
	ut5lvfIj/iO28wdgIgiuthVUoPu0Hm8y/A8f7H0MhLY/d4xTriVv0jTPVb3rcpRHvlJK5c
	En0w0/RjMVWFQ2EdpFfWDA1h15SwVBbE8yahLPHjLBrJ08DaBPTfQ0tDXYzAfobkR3d1as
	iCXrqDifLhIXIJ6u82Jur4E8MZNA4YvW3WKZkCZ1k0HvXTRfaRcFTFk6pwjtIlx5moKSG5
	WQGyOv4YPxggVbZiwj0DMm0/0PgNc66/wZb8+KMOJ5I1EWnBljlPavIVulChEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753345981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UfeioyuXM8H0P6HgUkIxbe8RCaVnHlA5q+CSI585x/I=;
	b=G1Teq49NAvO8Eti6NRHlIsvHzATkmURy2dLjPPapdyG/zav2IdU7rvz1x8E4FWdfGvMDFO
	/PQ5X8yCds8AbgDQ==
Date: Thu, 24 Jul 2025 10:32:45 +0200
Subject: [PATCH] kbuild: userprogs: use correct linker when mixing clang
 and GNU ld
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250724-userprogs-clang-gnu-ld-v1-1-3d3d071e53a7@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAKzvgWgC/x2MWwqAIBAAryL73UIaPegq0YfoZgtioRhBdPeWP
 odh5oFCmanArB7IdHHhIwnoRoHbbQqE7IXBtKZvR9NhleDMRyjoongMqWL0OFrt9LC5qTceJD4
 zbXz/42V93w9jSpEraAAAAA==
X-Change-ID: 20250723-userprogs-clang-gnu-ld-7a1c16fc852d
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753345978; l=1626;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MJLE6/9GrtAoL8Z6/CW5hi4mg67Rc804aigsDt5ADus=;
 b=qaIF6ywpRrUzrfQT+7wrpIVIQw0YEwmtjKzlLlo1xofu68a9rSegteyI/AtdaOl7NwiBYqsGV
 kyltxUY2SBTBdshcyPRIhPe25PtHntMaiMVa+Go0gzdS7m62qSuLHJI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The userprogs infrastructure does not expect clang being used with GNU ld
and in that case uses /usr/bin/ld for linking, not the configured $(LD).
This fallback is problematic as it will break when cross-compiling.
Mixing clang and GNU ld is used for example when building for SPARC64,
as ld.lld is not sufficient; see Documentation/kbuild/llvm.rst.

Relax the check around --ld-path so it gets used for all linkers.

Fixes: dfc1b168a8c4 ("kbuild: userprogs: use correct lld when linking through clang")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Nathan, you originally proposed the check for $(CONFIG_LD_IS_LLD) [0],
could you take a look at this?

[0] https://lore.kernel.org/all/20250213175437.GA2756218@ax162/
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c09766beb7eff4780574682b8ea44475fc0a5188..e300c6546c845c300edb5f0033719963c7da8f9b 100644
--- a/Makefile
+++ b/Makefile
@@ -1134,7 +1134,7 @@ KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD
 KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 # userspace programs are linked via the compiler, use the correct linker
-ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
+ifneq ($(CONFIG_CC_IS_CLANG),)
 KBUILD_USERLDFLAGS += --ld-path=$(LD)
 endif
 

---
base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
change-id: 20250723-userprogs-clang-gnu-ld-7a1c16fc852d

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


