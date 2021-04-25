Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EAB36A53F
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Apr 2021 09:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhDYHIu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Apr 2021 03:08:50 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:50377 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhDYHIu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Apr 2021 03:08:50 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 13P77E6F032328;
        Sun, 25 Apr 2021 16:07:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 13P77E6F032328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619334435;
        bh=e6ebiU5ULjsvQr300Dk6h49ie/rrrFWrO2lUQXq6JzM=;
        h=From:To:Cc:Subject:Date:From;
        b=I4BunMKeL0Ue5l5vmpDu7RlRqPy/iEWvFuaLJjK5Dz84pf1tUbGmZxRlAj9gfCjxt
         JL7jroB+Ns3eoTwNDnRgGTQuYmdzpM34IekuYKyIQgX1mebLosKS/typ40B2Aw2yFP
         /2hZY0sidDJq/DKkE6OfzGHXP7I145Su6bZ9Jqt3b6aIqRqqBQ98JDhAN7t6t2enua
         eJNOU6HqpDZaTNlYiyzTpCE566HaZj9aISKGNvHt2wn49M+ninryGrrvH/tOhrfvrY
         95PpII7S/IBYwCUOTuqn0+qXiqwAwAUB2NW6tWgaVfO6mm2GwNrTrm2W2jW6A6J7oV
         Xi8CQU8wn2tfw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add a script to remove stale generated files
Date:   Sun, 25 Apr 2021 16:07:12 +0900
Message-Id: <20210425070712.1202472-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We maintain .gitignore and Makefiles so build artifacts are properly
ignored by Git, and cleaned up by 'make clean'. However, the code is
always changing; generated files are often moved to another directory,
or removed when they become unnecessary. Such garbage files tend to be
left over in the source tree because people usually git-pull without
cleaning the tree.

This is not only the noise for 'git status', but also a build issue
in some cases.

One solution is to remove a stale file like commit 223c24a7dba9 ("kbuild:
Automatically remove stale <linux/version.h> file") did. Such workaround
should be removed after a while, but we forget about that if we scatter
the workaround code in random places.

So, this commit adds a new script to collect cleanings of stale files.

As a start point, move the code in arch/arm/boot/compressed/Makefile
into this script.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                          |  6 +++++-
 arch/arm/boot/compressed/Makefile |  7 -------
 scripts/remove-stale-files        | 31 +++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 8 deletions(-)
 create mode 100755 scripts/remove-stale-files

diff --git a/Makefile b/Makefile
index b14483742a67..e970c8adf272 100644
--- a/Makefile
+++ b/Makefile
@@ -1202,7 +1202,7 @@ PHONY += prepare archprepare
 
 archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
 	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h \
-	include/generated/autoconf.h
+	include/generated/autoconf.h remove-stale-files
 
 prepare0: archprepare
 	$(Q)$(MAKE) $(build)=scripts/mod
@@ -1211,6 +1211,10 @@ prepare0: archprepare
 # All the preparing..
 prepare: prepare0 prepare-objtool prepare-resolve_btfids
 
+PHONY += remove-stale-files
+remove-stale-files:
+	$(Q)$(srctree)/scripts/remove-stale-files
+
 # Support for using generic headers in asm-generic
 asm-generic := -f $(srctree)/scripts/Makefile.asm-generic obj
 
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index fd94e27ba4fa..182b300e3f8a 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -96,13 +96,6 @@ endif
 $(foreach o, $(libfdt_objs) atags_to_fdt.o fdt_check_mem_start.o, \
 	$(eval CFLAGS_$(o) := -I $(srctree)/scripts/dtc/libfdt -fno-stack-protector))
 
-# These were previously generated C files. When you are building the kernel
-# with O=, make sure to remove the stale files in the output tree. Otherwise,
-# the build system wrongly compiles the stale ones.
-ifdef building_out_of_srctree
-$(shell rm -f $(addprefix $(obj)/, fdt_rw.c fdt_ro.c fdt_wip.c fdt.c))
-endif
-
 targets       := vmlinux vmlinux.lds piggy_data piggy.o \
 		 lib1funcs.o ashldi3.o bswapsdi2.o \
 		 head.o $(OBJS)
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
new file mode 100755
index 000000000000..c3eb81c3f7de
--- /dev/null
+++ b/scripts/remove-stale-files
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+set -e
+
+# When you move, remove or rename generated files, you probably also update
+# .gitignore and cleaning rules in the Makefile. This is the right thing
+# to do. However, people usually do 'git pull', 'git bisect', etc. without
+# running 'make clean'. Then, the stale generated files are left over, often
+# causing build issues.
+#
+# Also, 'git status' shows such stale build artifacts as untracked files.
+# What is worse, some people send a wrong patch to get them back to .gitignore
+# without checking the commit history.
+#
+# So, when you (re)move generated files, please move the cleaning rules from
+# the Makefile to this script. This is run before Kbuild starts building
+# anything, so people will not be annoyed by such garbage files.
+#
+# This script is not intended to grow endlessly. Rather, it is a temporary scrap
+# yard. Stale files stay in this file for a while (for some release cycles?),
+# then will be really dead and removed from the code base entirely.
+
+# These were previously generated source files. When you are building the kernel
+# with O=, make sure to remove the stale files in the output tree. Otherwise,
+# the build system wrongly compiles the stale ones.
+if [ -n "${building_out_of_srctree}" ]; then
+	for f in fdt_rw.c fdt_ro.c fdt_wip.c fdt.c
+	do
+		rm -f arch/arm/boot/compressed/${f}
+	done
+fi
-- 
2.27.0

