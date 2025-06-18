Return-Path: <linux-kbuild+bounces-7552-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F40AADF6DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 21:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E20B83A76AA
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 19:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A8120FA94;
	Wed, 18 Jun 2025 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jd4czJbq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B93085A0;
	Wed, 18 Jun 2025 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274954; cv=none; b=ZPvxvR3KVvwgxe+94ZtTjir5zZRwh2PnEgkooaDCqNeNL5XEL2FYhteFsRNW0HQpF3ylWp6A+CBEF4Ex2yb1L3y5W+YSYaDsTTOM8zmHTiEFt0eFS+TNIa2QVcJZ7kcTpDoaZNrC/6gVSgXyC0xG2hVv9Ez7bDDBsVWIMUDL7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274954; c=relaxed/simple;
	bh=db/nmU5G6ALn8w6ZNs2pM1XeBWieETxE4h87P5JvRfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cPiIQ2iCQ1cmvpUTKD2jLhk3G8bRvrcsv7Ay0GEAg6+2tqCVy660u0l8UMismkYZ8TZx8t5I3UDAnQig8vuIHWOIpYZOwvuaGjL/bGOApo4Ylz4v1aJIYML6RC9Lqurh9fwqX28fPVhRtgaj1xPWmJl23lbwggn7z4pneWzAr+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jd4czJbq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57860C4CEE7;
	Wed, 18 Jun 2025 19:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750274953;
	bh=db/nmU5G6ALn8w6ZNs2pM1XeBWieETxE4h87P5JvRfs=;
	h=From:Date:Subject:To:Cc:From;
	b=jd4czJbqw4lInFqHIc9vlDHolDLedomxUEEGNc8XP7/zYSrfZ+ALmfQZA01qmkaX/
	 SKttlTHgApd4mp4omSjZwiyHaOC5XCscKlCndjgza7BcOAHBuYKFRZWM1jhyYT+eKJ
	 T2Pvk8oUaLNMBgfxQqJgZrTiMbIL5c5x3IP+WmWFzPbmNBP/Uz+SuvKd3WHoZqOUiR
	 l6UR5gMFnIlPAOYDGFakt0BLrXCfed9tzWHFIOWigdW505HY0JVqCHgUzoNJrJCHsz
	 fU3H9MegzSzefU7O+QQHKOqRmV5bK9QETzaIjtyk7wV06vJn9OQZ7PMJuJn9e91XV6
	 8bT7Ft9El0o4Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 18 Jun 2025 12:29:09 -0700
Subject: [PATCH] ARM: Use an absolute path to unified.h in KBUILD_AFLAGS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-arm-expand-include-unified-h-path-v1-1-aef6eb4c44ca@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIQTU2gC/x3NQQqDMBBG4avIrDuQCAbpVUoXQ+a3GbBpSGoRx
 Lsbuvw27x3UUA2N7sNBFT9r9skd/jZQTJJfYNNuGt04ueBnlvpm7EWysuW4bgresi0G5cRFvom
 DQ5hEo4oH9U6pWGz/Px7P87wAGq/Kg3MAAAA=
X-Change-ID: 20250618-arm-expand-include-unified-h-path-60e65adcda1e
To: Russell King <linux@armlinux.org.uk>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, stable@vger.kernel.org, 
 KernelCI bot <bot@kernelci.org>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325; i=nathan@kernel.org;
 h=from:subject:message-id; bh=db/nmU5G6ALn8w6ZNs2pM1XeBWieETxE4h87P5JvRfs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnBwu0NotVRxoyTe/xvzsw2Ct5S8jM0ZEY7e5/+u+OJ9
 91TtZQ6SlkYxLgYZMUUWaofqx43NJxzlvHGqUkwc1iZQIYwcHEKwEQytjL895M3c52s0uJlZh9/
 x0uY26BHeL1fVfWnPxbn00yEPuXWMDK0vHHKtH9yXl7w+4vIcw5r8vO5jnEkvt1ytjrmtdUBhjR
 uAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit d5c8d6e0fa61 ("kbuild: Update assembler calls to use proper
flags and language target"), which updated as-instr to use the
'assembler-with-cpp' language option, the Kbuild version of as-instr
always fails internally for arch/arm with

  <command-line>: fatal error: asm/unified.h: No such file or directory
  compilation terminated.

because '-include' flags are now taken into account by the compiler
driver and as-instr does not have '$(LINUXINCLUDE)', so unified.h is not
found.

This went unnoticed at the time of the Kbuild change because the last
use of as-instr in Kbuild that arch/arm could reach was removed in 5.7
by commit 541ad0150ca4 ("arm: Remove 32bit KVM host support") but a
stable backport of the Kbuild change to before that point exposed this
potential issue if one were to be reintroduced.

Follow the general pattern of '-include' paths throughout the tree and
make unified.h absolute using '$(srctree)' to ensure KBUILD_AFLAGS can
be used independently.

Cc: stable@vger.kernel.org
Fixes: d5c8d6e0fa61 ("kbuild: Update assembler calls to use proper flags and language target")
Reported-by: KernelCI bot <bot@kernelci.org>
Closes: https://lore.kernel.org/CACo-S-1qbCX4WAVFA63dWfHtrRHZBTyyr2js8Lx=Az03XHTTHg@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 4808d3ed98e4..e31e95ffd33f 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -149,7 +149,7 @@ endif
 # Need -Uarm for gcc < 3.x
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
-KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include asm/unified.h -msoft-float
+KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
 KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
 
 CHECKFLAGS	+= -D__arm__

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250618-arm-expand-include-unified-h-path-60e65adcda1e

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


