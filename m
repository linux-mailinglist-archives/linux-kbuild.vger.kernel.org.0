Return-Path: <linux-kbuild+bounces-8224-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845E4B13BF4
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 15:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DCA13BF378
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 13:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0026E26A0A8;
	Mon, 28 Jul 2025 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yscf9AB0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5fhWGAN0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBBA26A091;
	Mon, 28 Jul 2025 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753710608; cv=none; b=l6XphEa5zbqYqyjupGnf3ccYB0vqxWZC0LIhpTAycyUayHVezRN2yBueXcJONiARHBJuzKDc31bwfEb5vVmTxC+BJZu78N0cpdvoQl+2Z38PGUrlUAUIQtCt8EC5hLhG4iH2xxQKA+DI4c/w1aDNvbfVb2dnxdHBKYyrkynBd68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753710608; c=relaxed/simple;
	bh=LsHkGtgxHUQSyTRiyZSRZl/XbqaRVfaN2VI9Uo4QE8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C5cqyxEL7zWRnfv4IiRFBh2h3ph+Iwu14isG5eCTq3lExdfhbSCEZyiCLlX4FxLb6yYF8pl6xn5YenKA8FN8+gdROjMr1JtG8TzqgWoS6Vw7jSUqaYFj16tvUVwiWlru2o6e5ghPtenOvLDSx/egJvK+f6j+PmikeNr2Sm8WODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yscf9AB0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5fhWGAN0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753710600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6BBq5p1cXLMtI7Ayy8NN84orKUGzwumMAlIBivLG7ms=;
	b=Yscf9AB04Be+kAJfhNDUwQoAJnCG6G2A+IaZNPQx2nv7aijiRJiSOgshuPfry5cVau3d3n
	dToP3My+yLPHClg6P+3liBEzQMR36RVxwwSCYC+LhbiYY+MsG+F5kUpccGpI1A/i2YSsNY
	WTsqLAw5J0CoKOinyVwcM2x+e51q9a9ha5K8ojXycT+BTTmVaxLMQfqZmz3egSMKN7Arz4
	8+3YdFrrnSEWHjsXCCxgjuNOx0VN3GkP8/5ej//BftInxootLAtER04IsKJ52P9Q4X7zlE
	l2x75P0CoxsbQ1nFcGNy4uFzbvZeo0wKxYlSK2/1EA3nOI6JuN4vKwLwnMSfVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753710600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6BBq5p1cXLMtI7Ayy8NN84orKUGzwumMAlIBivLG7ms=;
	b=5fhWGAN0KXldw7o9njnZOVtqAefF0nejeVpy8TOnYchi54rnSvQZZM4S4xSfI1Bw5Pbngo
	+fuXB5nIZknbWPAg==
Date: Mon, 28 Jul 2025 15:47:37 +0200
Subject: [PATCH v2] kbuild: userprogs: use correct linker when mixing clang
 and GNU ld
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250728-userprogs-clang-gnu-ld-v2-1-58464d681407@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAHh/h2gC/3WNzQqDMBCEX0X23C35qU3pyfcoHiRZ44IkkqhYx
 HdvKvTY4zfDfLNDpsSU4VntkGjlzDEUUJcK7NAFT8iuMCihamGUxqUMphR9RjuWHn1YcHRoOmn
 lvbePWjko4ylRz9spfrWFB85zTO/zZ5Xf9Ke8/VOuEiVqp50wkmrdmWbksMwpBt6ujqA9juMD+
 pP2mMAAAAA=
X-Change-ID: 20250723-userprogs-clang-gnu-ld-7a1c16fc852d
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753710464; l=1713;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=LsHkGtgxHUQSyTRiyZSRZl/XbqaRVfaN2VI9Uo4QE8A=;
 b=0YziVHsqKPdinX0gQcLsPz+gLcof4pnE3j/vNNO/TBiwrg/+lx3O4AekEUwSwGaS4J+rXVK9M
 1o7zlGP6+GSD3QRfQsS1CW8kxW1WR4g4FuDe960t9A9yfUxi9d3elfh
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
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Use plain ifdef instead of ifneq
- Rebase onto v6.16
- Pick up review tag from Nathan
- Link to v1: https://lore.kernel.org/r/20250724-userprogs-clang-gnu-ld-v1-1-3d3d071e53a7@linutronix.de
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 478f2004602da03c9039044e3288f24a13833cc7..7d24245d118c0e903119263b871d2e5c2759f48a 100644
--- a/Makefile
+++ b/Makefile
@@ -1134,7 +1134,7 @@ KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD
 KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 # userspace programs are linked via the compiler, use the correct linker
-ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
+ifdef CONFIG_CC_IS_CLANG
 KBUILD_USERLDFLAGS += --ld-path=$(LD)
 endif
 

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250723-userprogs-clang-gnu-ld-7a1c16fc852d

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


