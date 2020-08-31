Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA5E25810F
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 Aug 2020 20:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgHaSZJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 31 Aug 2020 14:25:09 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:32850 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgHaSZJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Aug 2020 14:25:09 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 07VIMj78001504;
        Tue, 1 Sep 2020 03:22:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 07VIMj78001504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598898166;
        bh=gDsWGmkcPm9WZCCqq0YASfbSSSRYZcdi2ssPSrYsKcY=;
        h=From:To:Cc:Subject:Date:From;
        b=IhZU2MnvJ7cGF9KHjklnkzDYggoJw15wUj3pFLZNEy0Mo1ectN0fiNrHR5Yi5r98w
         Aw29vLPyVa4PoFzaGGR7OaDGdRruW7jzanXrm5mgWBfQX9kzt3fZxRdMo+SSMqv7Wq
         fY2VaciLqDsWrElIqNwth4cbkrLx/ihzL8InqhsrIMxPgtOYRPTQd+GkNvR9wD8CbV
         C59ToNLdXYfTY4hI+9dEHsUggli+kQDrZxBcVg6UwfgfgOLBEvIDUoMGg1HOyyBWvH
         c7kDh4F1LsI93yNrr+MYTpYQCJx+dIFj2cCqIMqiL78QKk0p3PsRjb5bNZvsTqNg+M
         knl6RhtaDhykg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Greentime Hu <green.hu@gmail.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nick Hu <nickhu@andestech.com>,
        Paul Mackerras <paulus@samba.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] arch: vdso: add vdso linker script to 'targets' instead of extra-y
Date:   Tue,  1 Sep 2020 03:22:39 +0900
Message-Id: <20200831182239.480317-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The vdso linker script is preprocessed on demand.
Adding it to 'targets' is enough to include the .cmd file.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/kernel/vdso/Makefile     | 2 +-
 arch/arm64/kernel/vdso32/Makefile   | 2 +-
 arch/nds32/kernel/vdso/Makefile     | 2 +-
 arch/powerpc/kernel/vdso32/Makefile | 2 +-
 arch/powerpc/kernel/vdso64/Makefile | 2 +-
 arch/s390/kernel/vdso64/Makefile    | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 45d5cfe46429..7cd8aafbe96e 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -54,7 +54,7 @@ endif
 GCOV_PROFILE := n
 
 obj-y += vdso.o
-extra-y += vdso.lds
+targets += vdso.lds
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
 # Force dependency (incbin is bad)
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index d6adb4677c25..572475b7b7ed 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -155,7 +155,7 @@ asm-obj-vdso := $(addprefix $(obj)/, $(asm-obj-vdso))
 obj-vdso := $(c-obj-vdso) $(c-obj-vdso-gettimeofday) $(asm-obj-vdso)
 
 obj-y += vdso.o
-extra-y += vdso.lds
+targets += vdso.lds
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
 # Force dependency (vdso.s includes vdso.so through incbin)
diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Makefile
index 7c3c1ccb196e..55df25ef0057 100644
--- a/arch/nds32/kernel/vdso/Makefile
+++ b/arch/nds32/kernel/vdso/Makefile
@@ -20,7 +20,7 @@ GCOV_PROFILE := n
 
 
 obj-y += vdso.o
-extra-y += vdso.lds
+targets += vdso.lds
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
 # Force dependency
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 87ab1152d5ce..fd5072a4c73c 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -29,7 +29,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
 asflags-y := -D__VDSO32__ -s
 
 obj-y += vdso32_wrapper.o
-extra-y += vdso32.lds
+targets += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C -Upowerpc
 
 # Force dependency (incbin is bad)
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 38c317f25141..c737b3ea3207 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -17,7 +17,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
 asflags-y := -D__VDSO64__ -s
 
 obj-y += vdso64_wrapper.o
-extra-y += vdso64.lds
+targets += vdso64.lds
 CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
 
 # Force dependency (incbin is bad)
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index 4a66a1cb919b..d0d406cfffa9 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -25,7 +25,7 @@ $(targets:%=$(obj)/%.dbg): KBUILD_CFLAGS = $(KBUILD_CFLAGS_64)
 $(targets:%=$(obj)/%.dbg): KBUILD_AFLAGS = $(KBUILD_AFLAGS_64)
 
 obj-y += vdso64_wrapper.o
-extra-y += vdso64.lds
+targets += vdso64.lds
 CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
 
 # Disable gcov profiling, ubsan and kasan for VDSO code
-- 
2.25.1

