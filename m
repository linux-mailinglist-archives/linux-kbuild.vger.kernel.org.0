Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D67B3E1777
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 17:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhHEPCx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 11:02:53 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:23689 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhHEPCx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 11:02:53 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 175F13YC019006;
        Fri, 6 Aug 2021 00:01:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 175F13YC019006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628175664;
        bh=/sZqN7YYOQzerHeaIfHq5IfDh5zbKuKicEifD7PVFaA=;
        h=From:To:Cc:Subject:Date:From;
        b=Mo8HJV5AZnRz+AkF+qbp1D58uzEhoM49ic5mWOQkKtLh0vL3XgjbowgqPGK6TKC1u
         f7Ka0M7a30Zx6D1BYXulS0eMz0dFqXqKN9IAz9Y7t8W0ZLwRQ0tVbpoOTErkQFZWY6
         mKr18UScOHZX9SYYZZKJP4dWAy30VUGeQR0cZE1bYMcse7amTAkiU23sMBXv4Y8ema
         +lWG7fPIizxEmc9JuPbv3pYaZFGIx0SLNWa7JIJeDFdP1Nt+yMSkYkceeV94FL/m0o
         W6tsiYI/ru59yDcEQ2cph1ycvHXgXjJgyDy8B5qH5pQwc8x5pbPNcbxnDbKPjey83s
         4CnAww2LtLUXA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH] kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
Date:   Fri,  6 Aug 2021 00:01:02 +0900
Message-Id: <20210805150102.131008-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
and it should be used only for that purpose.

LLVM_IAS is checked in some places to determine the assembler type,
but it is not precise.

 $ make CC=gcc LLVM_IAS=1

... will use the GNU assembler since LLVM_IAS=1 is effective only when
$(CC) is clang.

Of course, the combination of CC=gcc and LLVM_IAS=1 does not make
sense, but the build system can be more robust against such insane
input.

Commit ba64beb17493a ("kbuild: check the minimum assembler version in
Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
because Kconfig checks the version string from the assembler in use.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile            | 2 +-
 arch/riscv/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4ab151060931..8b56c9692c3c 100644
--- a/Makefile
+++ b/Makefile
@@ -844,7 +844,7 @@ else
 DEBUG_CFLAGS	+= -g
 endif
 
-ifneq ($(LLVM_IAS),1)
+ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
 endif
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index bc74afdbf31e..dcfbd2a87d41 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -41,7 +41,7 @@ endif
 ifeq ($(CONFIG_LD_IS_LLD),y)
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
-ifneq ($(LLVM_IAS),1)
+ifndef CONFIG_AS_IS_LLVM
 	KBUILD_CFLAGS += -Wa,-mno-relax
 	KBUILD_AFLAGS += -Wa,-mno-relax
 endif
-- 
2.30.2

