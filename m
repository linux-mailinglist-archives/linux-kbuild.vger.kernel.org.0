Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FBE21137E
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2020 21:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgGATbK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 15:31:10 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:50090 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgGATbJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 15:31:09 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 061JTbQ8006662;
        Thu, 2 Jul 2020 04:29:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 061JTbQ8006662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593631778;
        bh=Ghsk/6q3IUm5LtJ33X5K2JCyxaLZ1tT51ub8VEalKoo=;
        h=From:To:Cc:Subject:Date:From;
        b=n/cMAt/XqaN+wpQkLjiprsZ5IOffenllFJGXDw7DZTUHrYfO4dT9SeDNr5RGJvfo5
         Nu/3KSxofR1bU7jcw/sMn+ez3PhaZfH5VoK9x4PfSJYCFKj3lvwFVqTmI21DJlDGfl
         NNNJRa06rrubFSJFCm57PMOJuYjduC5OW/ufY6vzpQ51yKTS00UI5mlv/602ITYf8E
         vuKnYSu8we48aHWOB3M2uVRtqKdk56xJIisKSPExK+Ld8V2lo3Zeuo1RfFxJAjEJsM
         TMhSVRamtMPEoELKYZq1fqHZo9EC0W3LnLwtskdcFeRolPzEuBGGIoI1t5+XjY8Fy5
         EekD6pUmzI1sw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, Guan Xuetao <gxt@pku.edu.cn>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: do not export LDFLAGS_vmlinux
Date:   Thu,  2 Jul 2020 04:29:36 +0900
Message-Id: <20200701192936.1397152-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When you clean the build tree for ARCH=arm, you may see the following
error message:

$ make -j24 ARCH=arm clean
  CLEAN   arch/arm/crypto
  CLEAN   arch/arm/kernel
  CLEAN   arch/arm/mach-at91
  CLEAN   arch/arm/mach-omap2
  CLEAN   arch/arm/vdso
  CLEAN   certs
  CLEAN   lib
  CLEAN   usr
  CLEAN   net/wireless
  CLEAN   drivers/firmware/efi/libstub
nm: 'arch/arm/boot/compressed/../../../../vmlinux': No such file
/bin/sh: 1: arithmetic expression: expecting primary: " "
  CLEAN   arch/arm/boot/compressed
  CLEAN   drivers/scsi
  CLEAN   drivers/tty/vt
  CLEAN   arch/arm/boot
  CLEAN   vmlinux.symvers modules.builtin modules.builtin.modinfo

Even if you run the same command again, the error message is not shown
despite vmlinux is already gone.

To reproduce it, the parallel option -j is needed. Single thread
cleaning always executes 'archclean', 'vmlinuxclean' in this order,
so vmlinux still exists when arch/arm/boot/compressed/ is cleaned.

Looking at arch/arm/boot/compressed/Makefile does not help understand
the reason of the error message. Both KBSS_SZ and LDFLAGS_vmlinux are
assigned with '=' operator, hence, they are not expanded until they are
used. Obviously, 'make clean' does not use them.

In fact, the root cause exists in the top Makefile:

  export LDFLAGS_vmlinux

Since LDFLAGS_vmlinux is an exported variable, LDFLAGS_vmlinux in
arch/arm/boot/compressed/Makefile is expanded when scripts/Makefile.clean
has a command to execute. This is why the error message shows up only
when there exist build artifacts in arch/arm/boot/compressed/.

Adding 'unexport LDFLAGS_vmlinux' to arch/arm/boot/compressed/Makefile
will fix it as far as ARCH=arm is concerned, but I believe the proper
fix is to get rid of 'export LDFLAGS_vmlinux' from the top Makefile.

LDFLAGS_vmlinux in the top Makefile contains linker flags for the top
vmlinux. LDFLAGS_vmlinux in arch/arm/boot/compressed/Makefile is for
arch/arm/boot/compressed/vmlinux. They just happen to have the same
variable name, but are used for different purposes. Exporting the former
bothers the decompressor Makefiles.

This commit passes LDFLAGS_vmlinux to scripts/link-vmlinux.sh via a
command line parameter instead of via an environment variable. LD and
KBUILD_LDFLAGS are exported, but I did the same for consistency. Anyway,
they must be included in cmd_link-vmlinux to allow if_changed to detect
the changes in LD or KBUILD_LDFLAGS.

The following Makefiles are not affected:

  arch/arm/boot/compressed/Makefile
  arch/h8300/boot/compressed/Makefile
  arch/nios2/boot/compressed/Makefile
  arch/parisc/boot/compressed/Makefile
  arch/s390/boot/compressed/Makefile
  arch/sh/boot/compressed/Makefile
  arch/sh/boot/romimage/Makefile
  arch/x86/boot/compressed/Makefile

They use ':=' or '=' to clear the LDFLAGS_vmlinux inherited from the
top Makefile.

We need to take a closer look at the impact to unicore32 and xtensa.

arch/unicore32/boot/compressed/Makefile only uses '+=' operator for
LDFLAGS_vmlinux. So, the decompressor previously inherited the linker
flags from the top Makefile.

However, commit 70fac51feaf2 ("unicore32 additional architecture files:
boot process") was merged before commit 1f2bfbd00e46 ("kbuild: link of
vmlinux moved to a script"). So, I believe this is rather a bug fix of
1f2bfbd00e46.

arch/xtensa/boot/boot-elf/Makefile is also affected, but this is a fix
for the same reason. It did not inherit LDFLAGS_vmlinux when commit
4bedea945451 ("[PATCH] xtensa: Architecture support for Tensilica Xtensa
Part 2") was merged. I deleted $(LDFLAGS_vmlinux), which is now empty.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                           | 3 +--
 arch/xtensa/boot/boot-elf/Makefile | 2 +-
 scripts/link-vmlinux.sh            | 4 ++++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5496a32dffa6..075f2f943180 100644
--- a/Makefile
+++ b/Makefile
@@ -1100,7 +1100,6 @@ KBUILD_VMLINUX_OBJS += $(patsubst %/,%/built-in.a, $(drivers-y))
 
 export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
-export LDFLAGS_vmlinux
 # used by scripts/Makefile.package
 export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) LICENSES arch include scripts tools)
 
@@ -1132,7 +1131,7 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
 # Final link of vmlinux with optional arch pass after final link
 cmd_link-vmlinux =                                                 \
-	$(CONFIG_SHELL) $< $(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) ;    \
+	$(CONFIG_SHELL) $< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";    \
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
 vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
index 12ae1e91cb75..c6538d3321b9 100644
--- a/arch/xtensa/boot/boot-elf/Makefile
+++ b/arch/xtensa/boot/boot-elf/Makefile
@@ -25,7 +25,7 @@ $(obj)/Image.o: vmlinux.bin $(OBJS)
 		$(OBJS) $@
 
 $(obj)/../Image.elf: $(obj)/Image.o $(obj)/boot.lds
-	$(Q)$(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) \
+	$(LD) $(KBUILD_LDFLAGS) \
 		-T $(obj)/boot.lds \
 		--build-id=none \
 		-o $@ $(obj)/Image.o
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 7eaf70d58488..16c7818b3e19 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -30,6 +30,10 @@
 # Error out on error
 set -e
 
+LD="$1"
+KBUILD_LDFLAGS="$2"
+LDFLAGS_vmlinux="$3"
+
 # Nice output in kbuild format
 # Will be supressed by "make -s"
 info()
-- 
2.25.1

