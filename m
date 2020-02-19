Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 673021637F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2020 01:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgBSAEj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 19:04:39 -0500
Received: from ozlabs.org ([203.11.71.1]:45959 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgBSAEj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 19:04:39 -0500
Received: by ozlabs.org (Postfix, from userid 1034)
        id 48MdJ54Bddz9sRk; Wed, 19 Feb 2020 11:04:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1582070677;
        bh=Mv6GHAx7R7ozUWxEOVr4jhO7uG4SlhIDpVyQSxenvS4=;
        h=From:To:Cc:Subject:Date:From;
        b=rqIYKgRkqs1dPsPwa1dIRESd0qm4SIM73lWKrAhvv3LP2E92GXuXAQv07EjqXFQvd
         RuMOd1KNA+0InEXuLKlvII+4tbW5u+L1C1FFSbbGjc6tTB7/wTONtbrsBydKZKWnA6
         ky5EBcBsl8tCTeHSee6xsCtzxOVZ8xO+KZDj2Oi2MY5TXUOhDiRT2LO1gInTSVLzJt
         KpIjjGmE/VsIBl1/g4iml1AOkelgPpohKFH5cYhUHzUpoPA5zaSnOEZd11mrfAwoaD
         ennMqqSWY8k8vEu0qMv7SQJBstG8Ny8NHTnEWcCHBmbsz8GgfSM2pfDtW7EgObX8jH
         7rdk2+mVpvJRg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     linuxppc-dev@ozlabs.org
Cc:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
Date:   Wed, 19 Feb 2020 11:04:34 +1100
Message-Id: <20200219000434.15872-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some of our phony targets are not marked as such. This can lead to
confusing errors, eg:

  $ make clean
  $ touch install
  $ make install
  make: 'install' is up to date.
  $

Fix it by adding them to the PHONY variable which is marked phony in
the top-level Makefile, or in scripts/Makefile.build for the boot
Makefile.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile      | 6 ++++++
 arch/powerpc/boot/Makefile | 2 ++
 2 files changed, 8 insertions(+)

v2: Use PHONY variable in boot/Makefile as well.

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f35730548e42..cbe5ca4f0ee5 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -298,6 +298,7 @@ $(BOOT_TARGETS2): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
 
+PHONY += bootwrapper_install
 bootwrapper_install:
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
@@ -403,9 +404,11 @@ define archhelp
   @echo '  (minus the .dts extension).'
 endef
 
+PHONY += install
 install:
 	$(Q)$(MAKE) $(build)=$(boot) install
 
+PHONY += vdso_install
 vdso_install:
 ifdef CONFIG_PPC64
 	$(Q)$(MAKE) $(build)=arch/$(ARCH)/kernel/vdso64 $@
@@ -425,6 +428,7 @@ archprepare: checkbin
 ifdef CONFIG_STACKPROTECTOR
 prepare: stack_protector_prepare
 
+PHONY += stack_protector_prepare
 stack_protector_prepare: prepare0
 ifdef CONFIG_PPC64
 	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
@@ -436,10 +440,12 @@ endif
 ifdef CONFIG_SMP
 prepare: task_cpu_prepare
 
+PHONY += task_cpu_prepare
 task_cpu_prepare: prepare0
 	$(eval KBUILD_CFLAGS += -D_TASK_CPU=$(shell awk '{if ($$2 == "TASK_CPU") print $$3;}' include/generated/asm-offsets.h))
 endif
 
+PHONY += checkbin
 # Check toolchain versions:
 # - gcc-4.6 is the minimum kernel-wide version so nothing required.
 checkbin:
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 0556bf4fc9e9..c53a1b8bba8b 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -445,6 +445,8 @@ install: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
 zInstall: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
 	sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)" $^
 
+PHONY += install zInstall
+
 # anything not in $(targets)
 clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
 	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
-- 
2.21.1

