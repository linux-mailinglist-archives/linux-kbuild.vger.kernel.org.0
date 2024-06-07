Return-Path: <linux-kbuild+bounces-2024-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A658FFC00
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 08:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36D72B20FD7
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 06:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3E729CE1;
	Fri,  7 Jun 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5eDGq2W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DD11BC2F;
	Fri,  7 Jun 2024 06:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717740998; cv=none; b=dYiYx4SqHAMiEclFKwYfnn2c/4X2xlMNHJ9zU6JJRX2wdnBBCnqRWt8PsJvsG9DNQ25hOdeB9X9Y2H/pf698V+s+sJwP2LFMDfb24fFd1xL/5lZWcDbGIDZ0kWJKbOQhB3rOqA9u3/IYfYAfNwLct6BpWBFSnf7BcK1JRmbyy9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717740998; c=relaxed/simple;
	bh=qgHdQ12pGPqv4LQl2A25azzdtAo6RAm5OvuiMvQKvsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oqcyZcaIaU1yf6znlimhr1qdFmcvwSs23bIcSXjMnwrUywwFSiLAwf6dHimLQ7eGS7AyNLHzDy3LG5x0glEPenUUZiYUYZwpTJpAZuBkfEZ4lg0JoGo4y7Nf9vJa4MW26vx10WuMShkDNY0EWf9Onis/lMKCBFFvhAxxEx2d6xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5eDGq2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA9AC32786;
	Fri,  7 Jun 2024 06:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717740997;
	bh=qgHdQ12pGPqv4LQl2A25azzdtAo6RAm5OvuiMvQKvsQ=;
	h=From:To:Cc:Subject:Date:From;
	b=M5eDGq2WgpC2ptrYYfbhFd1t01HDMrMtZuAl1rxiC9JcCy7KZ4YF6/P6sjFFlpqXM
	 fXN9RKaiYm/hGMpSZBs5oaRZNiYlpLwf+8GhiM8+CE8xMt3EEqKNFQVthqnMrVzy0K
	 sHVG6gKTIC9I8i1h9Ah/GeV8vZp10qrQX1UEgpbnRTksYuvIgGH1m8FkclbLBDTMXr
	 ekv11RBOu1TFJr+bT1CB+6sYa1EH2PFvxc6lBqKvZ90QgfoCPyEJDEi+LWmRrB2ID5
	 FmBhvhfj4MNMzqt25WhSDw8Hli6LLvWRxd43MlsP4zCMNtDTiN6VBvrs9NboEZzJv3
	 QBipta5BEZJzA==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
Date: Fri,  7 Jun 2024 08:16:23 +0200
Message-Id: <20240607061629.530301-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building powerpc64le kernels with the kernel.org crosstool toolchains
no longer works as the linker attempts to build a big-endian vdso:

powerpc-linux/lib/gcc/powerpc-linux/12.3.0/../../../../powerpc-linux/bin/ld: arch/powerpc/kernel/vdso/sigtramp32-32.o: compiled for a little endian system and target is big endian
powerpc-linux/lib/gcc/powerpc-linux/12.3.0/../../../../powerpc-linux/bin/ld: failed to merge target specific data of file arch/powerpc/kernel/vdso/sigtramp32-32.o

Apparently creating the vdso.lds files from the lds.S files fails to
pass the -mlittle-endian argument here, so the output format gets set
wrong. Changing the conditional to check for CONFIG_CPU_LITTLE_ENDIAN
instead still works, as the kernel configuration definitions are visible.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm fairly sure this worked in the past, but I did not try to bisect the
issue.
---
 arch/powerpc/kernel/vdso/vdso32.lds.S | 2 +-
 arch/powerpc/kernel/vdso/vdso64.lds.S | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 426e1ccc6971..5845ea2d1cba 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -7,7 +7,7 @@
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
 
-#ifdef __LITTLE_ENDIAN__
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
 OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
 #else
 OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index bda6c8cdd459..82c418b18cce 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -7,7 +7,7 @@
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
 
-#ifdef __LITTLE_ENDIAN__
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
 OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
 #else
 OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
-- 
2.39.2


