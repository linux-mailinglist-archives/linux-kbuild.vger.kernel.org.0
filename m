Return-Path: <linux-kbuild+bounces-675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8483E058
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jan 2024 18:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28AFD1F252FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jan 2024 17:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DD42030A;
	Fri, 26 Jan 2024 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSfQhLxS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3DDAD53;
	Fri, 26 Jan 2024 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706290601; cv=none; b=HLPETf7AcZYZ68/9Tsuk2qu6ifzU76IBZDhtdaIbjEzY+jrjgDY2W3LzZgAMxSLWBXnOfw5B/VQSW89iTZZ10hd8qqZfJRqRRCxNXdjT+ZAFsWO2nxMxvVA+l0Q3ydVtLsqkIqCcPONtwRPIWaKmFegnAItHN+CzZrlBP+W2LpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706290601; c=relaxed/simple;
	bh=4iVM9+Je1Wsvrrm8yBmVzSmaL5OSsQ/orDrecbPYen8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JzmTQCkJs5eFvp3lUlJbhiaW2is8Hpj5ujmwmJDTsCWIvMY76Tv3M69qdxkBzwizwCuTf6p4umSw2aj/4vtto2s9kDHhZfyfZLO008CRhfbcu8KOfMhjVcDl1Me00GbAa2JjG9vZuAmsg+I5oxCbv5+d0f55sond4V77s7tO/6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSfQhLxS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C985EC43394;
	Fri, 26 Jan 2024 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706290601;
	bh=4iVM9+Je1Wsvrrm8yBmVzSmaL5OSsQ/orDrecbPYen8=;
	h=From:Date:Subject:To:Cc:From;
	b=eSfQhLxSwoBb3Kl5xmdZLqSuNuEh4sZLAQEbkIFuELSIvawi+eWE4VifIzKJCA1xN
	 ud1K2sDHZNEU+9NvzpLehMGrBwNA4FU/V6dfTCEcGsUFYvYx28DdLpnYMZWeJhtiHt
	 X+5wCY7lKxz5xbS0snMo2gaEI5jMmOH45EU6PgHKEsH9TXVOYxHjajQ70IUsmNEEYc
	 pZpno9hTFis1oZzYWC1I57fwnnTLaU1tGIlGe7G2trNV+pdTwa7eZgHkKgPwTE+CvH
	 bgA9Kf+bcqp1jm0MgmdiwKDSnypDEaJh3yKnN6nvrKvwJajC3jW70LmygRvcReN0VI
	 iSb3Ln+zquTMA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 26 Jan 2024 10:36:31 -0700
Subject: [PATCH 4.19] powerpc: Use always instead of always-y in for
 crtsavres.o
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-4-19-fix-lib-powerpc-backport-v1-1-f0de224db66b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ7ts2UC/x3M0QqDMAxA0V+RPC9iuiLTXxl7iDWdYWJLKttA/
 PeVPR643AOKmEqBsTnA5K1F01ZBlwbCwttTUOdqcJ3zHbkePdKAUb+46oQ5fcRywInDKyfbsY+
 eb+7KcySG+sgmtf3/7+BbGuBxnj+ZDa74dQAAAA==
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=nathan@kernel.org;
 h=from:subject:message-id; bh=4iVM9+Je1Wsvrrm8yBmVzSmaL5OSsQ/orDrecbPYen8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmb3664uenfguxwHdbUCL8t+sYm6TnH3/BZ2O1hYW21S
 LaVEj7RUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbyXYjhnz43z6GLhtYb33a+
 UVdp3nvb1mS73BMVQzv1rYUH5Jb+s2VkmCcRtPnbAR/3Y2wbl33v/vtp6Sc5ndnrDd86Vqz0nRX
 swg8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

This commit is for linux-4.19.y only, it has no direct upstream
equivalent.

Prior to commit 5f2fb52fac15 ("kbuild: rename hostprogs-y/always to
hostprogs/always-y"), always-y did not exist, making the backport of
mainline commit 1b1e38002648 ("powerpc: add crtsavres.o to always-y
instead of extra-y") to linux-4.19.y as commit b7b85ec5ec15 ("powerpc:
add crtsavres.o to always-y instead of extra-y") incorrect, breaking the
build with linkers that need crtsavres.o:

  ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory

Backporting the aforementioned kbuild commit is not suitable for stable
due to its size and number of conflicts, so transform the always-y usage
to an equivalent form using always, which resolves the build issues.

Fixes: b7b85ec5ec15 ("powerpc: add crtsavres.o to always-y instead of extra-y")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 6f1e57182876..f0aa6fc8c6b2 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -21,8 +21,8 @@ obj-$(CONFIG_PPC32)	+= div64.o copy_32.o crtsavres.o strlen_32.o
 # 64-bit linker creates .sfpr on demand for final link (vmlinux),
 # so it is only needed for modules, and only for older linkers which
 # do not support --save-restore-funcs
-ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
-always-$(CONFIG_PPC64)	+= crtsavres.o
+ifeq ($(call ld-ifversion, -lt, 225000000, y)$(CONFIG_PPC64),yy)
+always	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \

---
base-commit: b060cfd3f707ad3c8ae8322e1b149ba7e2cf33e0
change-id: 20240126-4-19-fix-lib-powerpc-backport-6f4a823adf1a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


