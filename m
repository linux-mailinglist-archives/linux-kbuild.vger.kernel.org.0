Return-Path: <linux-kbuild+bounces-9631-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54754C5D6D4
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8179C4ED3A7
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 13:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495CF31D727;
	Fri, 14 Nov 2025 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Irm7vNu6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EYFv4yzM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E50531C56D;
	Fri, 14 Nov 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127850; cv=none; b=EsEf2F26wAy/zUdH6y5w3KwHuU1yEAstor2IQUHs3Fsx+eRcyZfyEFaJK16V4eZFq3mowddDsbkpQr+xJk3Ezq3nQkJ1E/bcsOj8X+0EklL/X422NMI4WFM/TXi/qhX4/c8BZRxot7t3DQzHt03iSURDyLH1BXws/z3ohc0qZgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127850; c=relaxed/simple;
	bh=rcMnsX+Vh0ajIFhxLjMhfH8p4M1MQ2IzwPyJNkmsGaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5atw+QMbiiVaLNvEoCzr9A/1OstXfcGYYdxW+i8GQ47hNwH387105cS8HZ5/IRWFTyJUlYGiZCmaQ9mZ6Oo/t96WGhHNtmDZawiugnBjNMQlh+ULrk3CRX45Y2HwCBz+xpAw/ZblFs/RM2xQnEkWIzd7hHLN4ZNVCpX0yTcfLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Irm7vNu6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EYFv4yzM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763127847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vwc56hjtuazj/+GR6nUE0ZFLKGkZMFAF/H+hEEe0//M=;
	b=Irm7vNu6Whb0e2SZ40WXLxCCBvASPli0FbFV/DMbxznyqGbuYlNRvu2zTH9yCBAVLOfKNY
	sfv5lHB83OF5LRq2qKxOdTuv0uMQToVHUYxQVIo9dKfwTo9btn8ChyZDQL65yJELMqwG+2
	wiFNVj19Va5I+3DeQiB4vtJPolp6RG6/FtYE/4wgmAu7YJzFifNh0EYKeorM/FfxuhfjiZ
	Tf+PVeTMhkAU8iJmRdPWA0oZdvBIgLyS4grj+tDj9q5Lfm0G7nofK0pc4pj5+5FCah0wgu
	j3jKdhE3lcv6Umjhkc2V6uQmceUw5cxW/+67R6V6yDECw/BQVHbYid01ZHiKrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763127847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vwc56hjtuazj/+GR6nUE0ZFLKGkZMFAF/H+hEEe0//M=;
	b=EYFv4yzM4KUYMkL0HGGUr9zboXL9nrMewaWyFgRR+kdPx4Xqi27ICWnFqcUQgDuGcwrjgB
	sMYj0wS1IQ7jl0Cw==
Date: Fri, 14 Nov 2025 14:43:58 +0100
Subject: [PATCH v3 3/3] kbuild: allow architectures to override CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-kbuild-userprogs-bits-v3-3-4dee0d74d439@linutronix.de>
References: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
In-Reply-To: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763127841; l=2338;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=rcMnsX+Vh0ajIFhxLjMhfH8p4M1MQ2IzwPyJNkmsGaI=;
 b=EtLegc3uyI194hw+XnBdz/rKTZqcEoYt1DqUpPRvM2dqbBs62WV1ZYof0zQoQbhWCXwFnIHS5
 sSqIJEYGaqnAibE1cFvjWr9JsaMDPyKbsOsUWDo+TcoGk1bfi8Iaet4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic test for CC_CAN_LINK assumes that all architectures use -m32
and -m64 to switch between 32-bit and 64-bit compilation. This is overly
simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
also require byte order handling (-mlittle-endian, -EL). Expressing all
of the different possibilities will be very complicated and brittle.
Instead allow architectures to supply their own logic which will be
easy to understand and evolve.

Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
to be implemented as kconfig does not allow the reuse of string options.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile     | 13 +++++++++++--
 init/Kconfig |  4 ++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..36e7154c66cbd4772883a84d57676c615e4480a3 100644
--- a/Makefile
+++ b/Makefile
@@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
 LDFLAGS_vmlinux	+= --emit-relocs --discard-none
 endif
 
-# Align the bit size of userspace programs with the kernel
-USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
+# Align the architecture of userspace programs with the kernel
+USERFLAGS_FROM_KERNEL := --target=%
+
+ifdef CONFIG_ARCH_USERFLAGS
+KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
+KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
+else
+# If not overridden also inherit the bit size
+USERFLAGS_FROM_KERNEL += -m32 -m64
+endif
+
 KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
diff --git a/init/Kconfig b/init/Kconfig
index 7b722e714d5c5a0580467914b226dc0700ec0797..4a2ae3cfbf26525a60936d9b29a74ef4319ba3a5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,8 +82,12 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config ARCH_HAS_CC_CAN_LINK
+	bool
+
 config CC_CAN_LINK
 	bool
+	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
 	default $(cc_can_link_user,$(m64-flag)) if 64BIT
 	default $(cc_can_link_user,$(m32-flag))
 

-- 
2.51.0


