Return-Path: <linux-kbuild+bounces-9055-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E0BC6D10
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 00:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90BB406568
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 22:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500322C3774;
	Wed,  8 Oct 2025 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTFGcpRJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E82C3769;
	Wed,  8 Oct 2025 22:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759963630; cv=none; b=piL0XW/TLRj6a4sWTzO4oG/5CaDeZfgo4+ocAtXaE0f/Wsk7vJbCVL7g7NiEJhFHNdWHxQJh9HWRDKtQv8BMe37JMcMb/CQE2Wzmmdf5Uvetrl+jMMcEZV6JjVjftRHLiThmrEMdvNByXwREO67DcV77lsGC9PUpDfC5onMEZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759963630; c=relaxed/simple;
	bh=MmSj15jHMzn0CKEQNU4y1JyA4D5YNuL1L+U1napVCas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VRsgGX1qBt/mGM7KZw2+OEFocbcrYOKq1kGcn3uaFAZ5FgVeJjG1JTQnWLDyvDVMebgTcqChzSj5wkKwvjB3Ju5338nl0Bbjcxt6u3dukkh5ghC0ilvkddaEgWWJpym6dMPbiIjjVhXF9bMcuMtb5VDWdgD/w0fwdFV1r9w/zhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTFGcpRJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C09EC4CEE7;
	Wed,  8 Oct 2025 22:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759963629;
	bh=MmSj15jHMzn0CKEQNU4y1JyA4D5YNuL1L+U1napVCas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jTFGcpRJy/Fmwjac4Cwvj3PDjM7MxlvEenLl66dxqHmmEEst5webr3bi4J0MBh5xG
	 GEGEDpBg05c0Z7DmepQEdeWG08RYxyuTWB1Myh+2hhgpJsiKLHdjsy1dPd+g7xIWHr
	 1caI2XAJTtKGphza6d3CQyqVUofrBtElrX25YS13M95UO6Ezys9X+f0pDfTHibdapS
	 mrrlbuMZpiJggo7ZIMdpRVQAx1MFrpVjq5oFQfzIYCbSR+R7jRVhPMMaf/KWKpdcql
	 Cm/RC/DDDsTQfO03gB7RB0KbicBdojGqKIx08trEZEe+Ts/7BaQIS8ePvg2GP475wF
	 RWCNmCAvIFdew==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 08 Oct 2025 15:46:46 -0700
Subject: [PATCH 3/3] s390/vmlinux.lds.S: Move .vmlinux.info to end of
 allocatable sections
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-kbuild-fix-modinfo-regressions-v1-3-9fc776c5887c@kernel.org>
References: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
In-Reply-To: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3481; i=nathan@kernel.org;
 h=from:subject:message-id; bh=MmSj15jHMzn0CKEQNU4y1JyA4D5YNuL1L+U1napVCas=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnPXj4+eXjv8cDtK+zll+zqMDx73uJE4RYpN+OJz5cws
 02ePP/C+o5SFgYxLgZZMUWW6seqxw0N55xlvHFqEswcViaQIQxcnAIwkS5bhj98vYdaLW+0W//q
 qOopcljM1Bzz1PNAg4Oh5fEZkkff1+9jZDj67smfQxUboxVkvG9e03zLEjd9u06D8JTweHPXaRc
 uuTAAAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building s390 defconfig with binutils older than 2.32, there are
several warnings during the final linking stage:

  s390-linux-ld: .tmp_vmlinux1: warning: allocated section `.got.plt' not in segment
  s390-linux-ld: .tmp_vmlinux2: warning: allocated section `.got.plt' not in segment
  s390-linux-ld: vmlinux.unstripped: warning: allocated section `.got.plt' not in segment
  s390-linux-objcopy: vmlinux: warning: allocated section `.got.plt' not in segment
  s390-linux-objcopy: st7afZyb: warning: allocated section `.got.plt' not in segment

binutils commit afca762f598 ("S/390: Improve partial relro support for
64 bit") [1] in 2.32 changed where .got.plt is emitted, avoiding the
warning.

The :NONE in the .vmlinux.info output section description changes the
segment for subsequent allocated sections. Move .vmlinux.info right
above the discards section to place all other sections in the previously
defined segment, .data.

Fixes: 30226853d6ec ("s390: vmlinux.lds.S: explicitly handle '.got' and '.plt' sections")
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=afca762f598d453c563f244cd3777715b1a0cb72 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/kernel/vmlinux.lds.S | 44 +++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index feecf1a6ddb4..d74d4c52ccd0 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -214,6 +214,28 @@ SECTIONS
 	DWARF_DEBUG
 	ELF_DETAILS
 
+	/*
+	 * Make sure that the .got.plt is either completely empty or it
+	 * contains only the three reserved double words.
+	 */
+	.got.plt : {
+		*(.got.plt)
+	}
+	ASSERT(SIZEOF(.got.plt) == 0 || SIZEOF(.got.plt) == 0x18, "Unexpected GOT/PLT entries detected!")
+
+	/*
+	 * Sections that should stay zero sized, which is safer to
+	 * explicitly check instead of blindly discarding.
+	 */
+	.plt : {
+		*(.plt) *(.plt.*) *(.iplt) *(.igot .igot.plt)
+	}
+	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
+	.rela.dyn : {
+		*(.rela.*) *(.rela_*)
+	}
+	ASSERT(SIZEOF(.rela.dyn) == 0, "Unexpected run-time relocations (.rela) detected!")
+
 	/*
 	 * uncompressed image info used by the decompressor
 	 * it should match struct vmlinux_info
@@ -244,28 +266,6 @@ SECTIONS
 #endif
 	} :NONE
 
-	/*
-	 * Make sure that the .got.plt is either completely empty or it
-	 * contains only the three reserved double words.
-	 */
-	.got.plt : {
-		*(.got.plt)
-	}
-	ASSERT(SIZEOF(.got.plt) == 0 || SIZEOF(.got.plt) == 0x18, "Unexpected GOT/PLT entries detected!")
-
-	/*
-	 * Sections that should stay zero sized, which is safer to
-	 * explicitly check instead of blindly discarding.
-	 */
-	.plt : {
-		*(.plt) *(.plt.*) *(.iplt) *(.igot .igot.plt)
-	}
-	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
-	.rela.dyn : {
-		*(.rela.*) *(.rela_*)
-	}
-	ASSERT(SIZEOF(.rela.dyn) == 0, "Unexpected run-time relocations (.rela) detected!")
-
 	/* Sections to be discarded */
 	DISCARDS
 	/DISCARD/ : {

-- 
2.51.0


