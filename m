Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E2D440ACD
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Oct 2021 19:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhJ3R7o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Oct 2021 13:59:44 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:44890 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbhJ3R7n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Oct 2021 13:59:43 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 19UHu9ZN031733;
        Sun, 31 Oct 2021 02:56:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 19UHu9ZN031733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1635616570;
        bh=qkGeLWQC26K1A738fV8OMPZP57XqUFsp45igjPTx/bg=;
        h=From:To:Cc:Subject:Date:From;
        b=r347laL2nS42a2UnSdjwFIWAJZPlL7JdUQ0HRPBC6zkd4u0Lr3rMlJekr4+Oi57Jk
         H7FVwmUorrRuwiGn1u5+BcdbknzZw1VAVJ9mMKuo004rgpojvEMs3/Ih4eYUuIxAiR
         L0og2PtGWKdGT7fv0SVg7QlDLvKBMUpZCp+Ux9a/eMG5EZvhmo7/qcinVHfuYDUHV2
         n0CniivUkMj/HenAMuvjUlwCZqQSZuqf88e4XqB9mCIYx0p1HNjQXDYiFNjGctYYCy
         UcW2ILIMjNUqBU1Z0LHr+7RSbOB44BqySJcVygqWDw4z104GsDvvIccInt9sw3iysU
         y41UwOJDXQ1kQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org, patches@arm.linux.org.uk
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Subject: [PATCH] sh: decompressor: do not copy source files while building
Date:   Sun, 31 Oct 2021 02:56:04 +0900
Message-Id: <20211030175604.1716611-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
builds") stated, copying source files during the build time may not
end up with as clean code as expected.

Do similar for sh to clean up the Makefile and .gitignore.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sh/boot/compressed/.gitignore |  5 -----
 arch/sh/boot/compressed/Makefile   | 24 ++++++------------------
 arch/sh/boot/compressed/ashiftrt.S |  2 ++
 arch/sh/boot/compressed/ashldi3.c  |  2 ++
 arch/sh/boot/compressed/ashlsi3.S  |  2 ++
 arch/sh/boot/compressed/ashrsi3.S  |  2 ++
 arch/sh/boot/compressed/lshrsi3.S  |  2 ++
 scripts/remove-stale-files         |  5 +++++
 8 files changed, 21 insertions(+), 23 deletions(-)
 create mode 100644 arch/sh/boot/compressed/ashiftrt.S
 create mode 100644 arch/sh/boot/compressed/ashldi3.c
 create mode 100644 arch/sh/boot/compressed/ashlsi3.S
 create mode 100644 arch/sh/boot/compressed/ashrsi3.S
 create mode 100644 arch/sh/boot/compressed/lshrsi3.S

diff --git a/arch/sh/boot/compressed/.gitignore b/arch/sh/boot/compressed/.gitignore
index 37aa53057369..cd16663bc7c8 100644
--- a/arch/sh/boot/compressed/.gitignore
+++ b/arch/sh/boot/compressed/.gitignore
@@ -1,7 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ashiftrt.S
-ashldi3.c
-ashlsi3.S
-ashrsi3.S
-lshrsi3.S
 vmlinux.bin.*
diff --git a/arch/sh/boot/compressed/Makefile b/arch/sh/boot/compressed/Makefile
index 589d2d8a573d..2f53babd9249 100644
--- a/arch/sh/boot/compressed/Makefile
+++ b/arch/sh/boot/compressed/Makefile
@@ -5,12 +5,12 @@
 # create a compressed vmlinux image from the original vmlinux
 #
 
+OBJECTS := head_32.o misc.o cache.o piggy.o \
+	   ashiftrt.o ashldi3.o ashrsi3.o ashlsi3.o lshrsi3.o
+
 targets		:= vmlinux vmlinux.bin vmlinux.bin.gz \
 		   vmlinux.bin.bz2 vmlinux.bin.lzma \
-		   vmlinux.bin.xz vmlinux.bin.lzo \
-		   head_32.o misc.o piggy.o
-
-OBJECTS = $(obj)/head_32.o $(obj)/misc.o $(obj)/cache.o
+		   vmlinux.bin.xz vmlinux.bin.lzo $(OBJECTS)
 
 GCOV_PROFILE := n
 
@@ -33,21 +33,9 @@ ccflags-remove-$(CONFIG_MCOUNT) += -pg
 LDFLAGS_vmlinux := --oformat $(ld-bfd) -Ttext $(IMAGE_OFFSET) -e startup \
 		   -T $(obj)/../../kernel/vmlinux.lds
 
-#
-# Pull in the necessary libgcc bits from the in-kernel implementation.
-#
-lib1funcs-y	:= ashiftrt.S ashldi3.c ashrsi3.S ashlsi3.S lshrsi3.S
-lib1funcs-obj   := \
-	$(addsuffix .o, $(basename $(addprefix $(obj)/, $(lib1funcs-y))))
-
-lib1funcs-dir		:= $(srctree)/arch/$(SRCARCH)/lib
-
-KBUILD_CFLAGS += -I$(lib1funcs-dir) -DDISABLE_BRANCH_PROFILING
-
-$(addprefix $(obj)/,$(lib1funcs-y)): $(obj)/%: $(lib1funcs-dir)/% FORCE
-	$(call cmd,shipped)
+KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 
-$(obj)/vmlinux: $(OBJECTS) $(obj)/piggy.o $(lib1funcs-obj) FORCE
+$(obj)/vmlinux: $(addprefix $(obj)/, $(OBJECTS)) FORCE
 	$(call if_changed,ld)
 
 $(obj)/vmlinux.bin: vmlinux FORCE
diff --git a/arch/sh/boot/compressed/ashiftrt.S b/arch/sh/boot/compressed/ashiftrt.S
new file mode 100644
index 000000000000..0f3b291a3f4b
--- /dev/null
+++ b/arch/sh/boot/compressed/ashiftrt.S
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include "../../lib/ashiftrt.S"
diff --git a/arch/sh/boot/compressed/ashldi3.c b/arch/sh/boot/compressed/ashldi3.c
new file mode 100644
index 000000000000..7cebd646df83
--- /dev/null
+++ b/arch/sh/boot/compressed/ashldi3.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../lib/ashldi3.c"
diff --git a/arch/sh/boot/compressed/ashlsi3.S b/arch/sh/boot/compressed/ashlsi3.S
new file mode 100644
index 000000000000..e354262b275f
--- /dev/null
+++ b/arch/sh/boot/compressed/ashlsi3.S
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include "../../lib/ashlsi3.S"
diff --git a/arch/sh/boot/compressed/ashrsi3.S b/arch/sh/boot/compressed/ashrsi3.S
new file mode 100644
index 000000000000..e564be9a4dcd
--- /dev/null
+++ b/arch/sh/boot/compressed/ashrsi3.S
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include "../../lib/ashrsi3.S"
diff --git a/arch/sh/boot/compressed/lshrsi3.S b/arch/sh/boot/compressed/lshrsi3.S
new file mode 100644
index 000000000000..5a8281b7e516
--- /dev/null
+++ b/arch/sh/boot/compressed/lshrsi3.S
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include "../../lib/lshrsi3.S"
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index eb630ee287c3..ad5ba3ee1f5e 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -28,4 +28,9 @@ if [ -n "${building_out_of_srctree}" ]; then
 	do
 		rm -f arch/arm/boot/compressed/${f}
 	done
+
+	for f in ashiftrt.S ashldi3.c ashrsi3.S ashlsi3.S lshrsi3.S
+	do
+		rm -f arch/sh/boot/compressed/${f}
+	done
 fi
-- 
2.30.2

