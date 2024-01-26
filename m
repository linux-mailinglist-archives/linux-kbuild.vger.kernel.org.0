Return-Path: <linux-kbuild+bounces-676-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4978883E05F
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jan 2024 18:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CC101C22EC6
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jan 2024 17:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CB21DDF8;
	Fri, 26 Jan 2024 17:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiFWv8C1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADBC20312;
	Fri, 26 Jan 2024 17:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706290627; cv=none; b=Nb4jEXJBYyGSYL/nBuvDYrtRCHAqlzZOULzmh2JQgNTCfyaSzhqzyxUsYt66qqARC2rAwNh+8MbxZyhzXfYhamvE8suaEFjCxtsSg+IotTkLE2beQLizk73/U/ni7m1jjWqvYwldC+cmFPvbKclgOp35ZXcq6/8a5kbf/4g8ovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706290627; c=relaxed/simple;
	bh=3QIZ72FdmNJxfJTI/wVAKy9oUIOLAXdb3QQ7TUnEfjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bkwSJg09ayyZ0Uci/sFXDodfTsupRxIfSG7DOfj1c6UXQ74Kxv0CqW/C3UXajo2e2Pdd5QDuPAE6my31R+GGdtm/C9dtyEH14zEqQuPH4ZemGvp2LVrvn2OlELkptDNtRAf1TtIZeaAuUJkeBfjzwEhSFEW9lGz5nwZwqTIkZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiFWv8C1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76CBC43394;
	Fri, 26 Jan 2024 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706290627;
	bh=3QIZ72FdmNJxfJTI/wVAKy9oUIOLAXdb3QQ7TUnEfjI=;
	h=From:Date:Subject:To:Cc:From;
	b=ZiFWv8C125lFdQlkGCn4RlFCr72xq+O1KSrF/kqcxrs0CmrPPBHDKC6IsO+SsoWaz
	 9AjoYDuBQb9/P5aNO0NJSmPBildJr+jW9bVWjjogctBh7d8M9H+f9Cm2R3kuPOpBIh
	 jhrM8kFdwEyZfptJc7epu4g4UH+ez7lzHUDVf3tOuC/ngiwKKj4LR408FiNYDaj8Xm
	 KfTyhhSAENkVxVN700MWdfH34Z5RcUwWWP2j+sikMoI54Igc4ITYZrpmUdUNmUhyk1
	 Ag4RNmZpDAb4CkjTGcWOmx4pBKrh+zF7GQ4RLO3mjFB9pKoIlTCLpLvzOiQgiRc1ud
	 79cUSuZ3G28WA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 26 Jan 2024 10:37:02 -0700
Subject: [PATCH 5.4] powerpc: Use always instead of always-y in for
 crtsavres.o
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-5-4-fix-lib-powerpc-backport-v1-1-2c110ed18b1d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL3ts2UC/x3MQQqDMBBA0avIrDuiaaLYq0gXOhl1UEyYiC2Id
 2/o8sHnX5BYhRO8iguUT0kS9oz6UQAtwz4zis8GUxlb1aZBhxYn+eImI8bwYY2E40BrDHpg513
 bNvbpaSLIi6ic2/++B1daeN/3D0kY9YBzAAAA
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1893; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3QIZ72FdmNJxfJTI/wVAKy9oUIOLAXdb3QQ7TUnEfjI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmb3x5iPR34rc9j+ta/2RVm3c/PbLkk47q8Qu3aYl3Xj
 KsHRerqOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE+A8zMmxUSn0utdna4Yzs
 U9XnR1W7/sxWeLXTXKj85RcvOYmV044y/GZh3jDnRcOyS1au4vdt9L99X/PO++h8tisnCn4dvJw
 aLcIIAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

This commit is for linux-5.4.y only, it has no direct upstream
equivalent.

Prior to commit 5f2fb52fac15 ("kbuild: rename hostprogs-y/always to
hostprogs/always-y"), always-y did not exist, making the backport of
mainline commit 1b1e38002648 ("powerpc: add crtsavres.o to always-y
instead of extra-y") to linux-5.4.y as commit 245da9eebba0 ("powerpc:
add crtsavres.o to always-y instead of extra-y") incorrect, breaking the
build with linkers that need crtsavres.o:

  ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory

Backporting the aforementioned kbuild commit is not suitable for stable
due to its size and number of conflicts, so transform the always-y usage
to an equivalent form using always, which resolves the build issues.

Fixes: 245da9eebba0 ("powerpc: add crtsavres.o to always-y instead of extra-y")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 7c603839fe28..841e6ed30f13 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -34,8 +34,8 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
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
base-commit: f0602893f43a54097fcf22bd8c2f7b8e75ca643e
change-id: 20240126-5-4-fix-lib-powerpc-backport-9d577643dcfc

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


