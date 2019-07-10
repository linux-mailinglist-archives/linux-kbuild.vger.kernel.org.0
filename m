Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D70463F91
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2019 05:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfGJDKX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 23:10:23 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47976 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfGJDKX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 23:10:23 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x6A3935O010665;
        Wed, 10 Jul 2019 12:09:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x6A3935O010665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562728145;
        bh=yg87jS3mBO0kAMfLp5u/C6DBa8X2nswxL+kGhWPzUOg=;
        h=From:To:Cc:Subject:Date:From;
        b=kpnGlFpcSMzIQYPbVT4k8yuJ0iK5u1Xg9yTm6oCbld3FupuP6S1wqN5m09yY16Vyb
         p+EZEWObjcPRUcC8ZNRgb78GdWU5X66K931RHTcFRL16pdIqZ5Pjo/PKVFRvuB9fc2
         efVrduI/879i8wwwbc+qLCRighS32P9dsqCdu4XldXOIR7VF+tbaOtFWEqn2YguYM/
         Krf8Q+srAdM4lvqQdcnow7zRJag2Q2PU6Lg/VCGhKov4gLwlYZwdYPDmrAqkL7ywp9
         sjC8PIcD/F1p72iaglATkm1moBq5mTFfN2Vak+n4h2JK0Ob0Di9NHMngtEtAg4d8ol
         d7L24k4mo7GDQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-parisc@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>,
        linux-snps-arc@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: [PATCH] fixup! kbuild: remove obj and src from the top Makefile
Date:   Wed, 10 Jul 2019 12:09:01 +0900
Message-Id: <20190710030901.1836-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Merging today's kbuild tree would break arc, um, parisc.
I just noticed it now. I will fix it soon for tomorrow's linux-next.

If needed, this might be useful for today's linux-next.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arc/Makefile    |  2 +-
 arch/parisc/Makefile | 12 ++++++------
 arch/um/Makefile     |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 03a0b19c92cd..ee6d1184c2b1 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -19,7 +19,7 @@ ifdef CONFIG_ARC_CURR_IN_REG
 # any kernel headers, and missing the r25 global register
 # Can't do unconditionally because of recursive include issues
 # due to <linux/thread_info.h>
-LINUXINCLUDE	+=  -include ${src}/arch/arc/include/asm/current.h
+LINUXINCLUDE	+=  -include $(srctree)/arch/arc/include/asm/current.h
 endif
 
 cflags-y				+= -fsection-anchors
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 58d46665cad9..8acb8fa1f8d6 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -120,8 +120,8 @@ PALO := $(shell if (which palo 2>&1); then : ; \
 	elif [ -x /sbin/palo ]; then echo /sbin/palo; \
 	fi)
 
-PALOCONF := $(shell if [ -f $(src)/palo.conf ]; then echo $(src)/palo.conf; \
-	else echo $(obj)/palo.conf; \
+PALOCONF := $(shell if [ -f $(srctree)/palo.conf ]; then echo $(srctree)/palo.conf; \
+	else echo $(objtree)/palo.conf; \
 	fi)
 
 palo lifimage: vmlinuz
@@ -131,8 +131,8 @@ palo lifimage: vmlinuz
 		false; \
 	fi
 	@if test ! -f "$(PALOCONF)"; then \
-		cp $(src)/arch/parisc/defpalo.conf $(obj)/palo.conf; \
-		echo 'A generic palo config file ($(obj)/palo.conf) has been created for you.'; \
+		cp $(srctree)/arch/parisc/defpalo.conf $(objtree)/palo.conf; \
+		echo 'A generic palo config file ($(objree)/palo.conf) has been created for you.'; \
 		echo 'You should check it and re-run "make palo".'; \
 		echo 'WARNING: the "lifimage" file is now placed in this directory by default!'; \
 		false; \
@@ -162,10 +162,10 @@ vmlinuz: vmlinux
 endif
 
 install:
-	$(CONFIG_SHELL) $(src)/arch/parisc/install.sh \
+	$(CONFIG_SHELL) $(srctree)/arch/parisc/install.sh \
 			$(KERNELRELEASE) vmlinux System.map "$(INSTALL_PATH)"
 zinstall:
-	$(CONFIG_SHELL) $(src)/arch/parisc/install.sh \
+	$(CONFIG_SHELL) $(srctree)/arch/parisc/install.sh \
 			$(KERNELRELEASE) vmlinuz System.map "$(INSTALL_PATH)"
 
 CLEAN_FILES	+= lifimage
diff --git a/arch/um/Makefile b/arch/um/Makefile
index 273130cf91d1..d2daa206872d 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -73,7 +73,7 @@ KBUILD_AFLAGS += $(ARCH_INCLUDE)
 USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
 		$(ARCH_INCLUDE) $(MODE_INCLUDE) $(filter -I%,$(CFLAGS)) \
 		-D_FILE_OFFSET_BITS=64 -idirafter $(srctree)/include \
-		-idirafter $(obj)/include -D__KERNEL__ -D__UM_HOST__
+		-idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__
 
 #This will adjust *FLAGS accordingly to the platform.
 include $(ARCH_DIR)/Makefile-os-$(OS)
-- 
2.17.1

