Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0096F14F908
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 17:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgBAQu1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 11:50:27 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:63396 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgBAQu0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 11:50:26 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 011GnQ2o014749;
        Sun, 2 Feb 2020 01:49:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 011GnQ2o014749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580575767;
        bh=2NxFq9Bv3SimZFSdPAkhGtkqIhOM//TJTWBSuLxUhrw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uFHfzVrkhEnDlgxiiKBXdAmM/Kxui/o8lBEq4un2EIAPEYJ53e3f7MyeWEYbxre0h
         cl9HhPJzXamuYMLUiLzzvtMlJx6bJTDXvAXSDvWb13N89kY11sVRhULa2BvaVkfFdh
         M5CBZT4BCLwd6nWDl4LV7vDX5ldvBQplxAnEPuHvDxa/8+k8U4Zh0sSIUhtMkh06V4
         9+gh4VmeZUcaENncvRw/l1BQ1PiLeyZhmAS/lq8Cm2XxRxVcDf643oY8fmnyF1h+BR
         CeJSMv+HHmP3GC/AFAaFlUOyvt4hx+WDUdNWwjI7YArbE1ug/S9BWqcJeSEDdvBwQ0
         pSsiii37BQvgQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kbuild: rename hostprogs-y/always to hostprogs/always-y
Date:   Sun,  2 Feb 2020 01:49:24 +0900
Message-Id: <20200201164924.5487-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200201164924.5487-1-masahiroy@kernel.org>
References: <20200201164924.5487-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In old days, the "host-progs" syntax was used for specifying host
programs. It was renamed to the current "hostprogs-y" in 2004.

It is typically useful in scripts/Makefile because it allows Kbuild to
selectively compile host programs based on the kernel configuration.

This commit renames like follows:

  always       ->  always-y
  hostprogs-y  ->  hostprogs

So, scripts/Makefile will look like this:

  always-$(CONFIG_BUILD_BIN2C) += ...
  always-$(CONFIG_KALLSYMS)    += ...
      ...
  hostprogs := $(always-y) $(always-m)

I think this makes more sense because a host program is always a host
program, irrespective of the kernel configuration. We want to specify
which ones to compile by CONFIG options, so always-y will be handier.

The "always", "hostprogs-y", "hostprogs-m" will be kept for backward
compatibility for a while.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst  |  49 ++++--------
 Kbuild                              |   8 +-
 arch/alpha/boot/Makefile            |   2 +-
 arch/arm/vdso/Makefile              |   2 +-
 arch/arm64/kernel/vdso32/Makefile   |   4 +-
 arch/mips/boot/Makefile             |   2 +-
 arch/mips/boot/compressed/Makefile  |   4 +-
 arch/mips/boot/tools/Makefile       |   2 +-
 arch/mips/tools/Makefile            |   4 +-
 arch/mips/vdso/Makefile             |   2 +-
 arch/powerpc/boot/Makefile          |   4 +-
 arch/s390/tools/Makefile            |   4 +-
 arch/sparc/boot/Makefile            |   2 +-
 arch/sparc/vdso/Makefile            |   2 +-
 arch/x86/boot/Makefile              |   4 +-
 arch/x86/boot/compressed/Makefile   |   2 +-
 arch/x86/entry/vdso/Makefile        |   2 +-
 arch/x86/realmode/rm/Makefile       |   2 +-
 arch/x86/tools/Makefile             |   4 +-
 drivers/gpu/drm/radeon/Makefile     |   2 +-
 drivers/tty/vt/Makefile             |   2 +-
 drivers/video/logo/Makefile         |   2 +-
 drivers/zorro/Makefile              |   2 +-
 fs/unicode/Makefile                 |   2 +-
 lib/Makefile                        |   4 +-
 lib/raid6/Makefile                  |   2 +-
 net/bpfilter/Makefile               |   2 +-
 samples/bpf/Makefile                | 118 ++++++++++++++--------------
 samples/connector/Makefile          |   8 +-
 samples/hidraw/Makefile             |   6 +-
 samples/mei/Makefile                |   4 +-
 samples/pidfd/Makefile              |   4 +-
 samples/seccomp/Makefile            |   4 +-
 samples/uhid/Makefile               |   4 +-
 samples/vfs/Makefile                |   5 +-
 scripts/Makefile                    |  22 +++---
 scripts/Makefile.build              |   8 +-
 scripts/Makefile.clean              |   4 +-
 scripts/Makefile.host               |   8 +-
 scripts/Makefile.lib                |   6 +-
 scripts/basic/Makefile              |   4 +-
 scripts/dtc/Makefile                |   4 +-
 scripts/gcc-plugins/Makefile        |   2 +-
 scripts/genksyms/Makefile           |   4 +-
 scripts/kconfig/Makefile            |  10 +--
 scripts/mod/Makefile                |   4 +-
 scripts/selinux/genheaders/Makefile |   4 +-
 scripts/selinux/mdp/Makefile        |   4 +-
 usr/Makefile                        |   2 +-
 49 files changed, 172 insertions(+), 190 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index b1733b877025..0e0eb2c8da7d 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -28,7 +28,6 @@ This document describes the Linux kernel Makefiles.
 	   --- 4.3 Using C++ for host programs
 	   --- 4.4 Controlling compiler options for host programs
 	   --- 4.5 When host programs are actually built
-	   --- 4.6 Using hostprogs-$(CONFIG_FOO)
 
 	=== 5 Kbuild clean infrastructure
 
@@ -595,11 +594,11 @@ compilation stage.
 Two steps are required in order to use a host executable.
 
 The first step is to tell kbuild that a host program exists. This is
-done utilising the variable hostprogs-y.
+done utilising the variable "hostprogs".
 
 The second step is to add an explicit dependency to the executable.
 This can be done in two ways. Either add the dependency in a rule,
-or utilise the variable $(always).
+or utilise the variable "always-y".
 Both possibilities are described in the following.
 
 4.1 Simple Host Program
@@ -612,7 +611,7 @@ Both possibilities are described in the following.
 
 	Example::
 
-		hostprogs-y := bin2hex
+		hostprogs := bin2hex
 
 	Kbuild assumes in the above example that bin2hex is made from a single
 	c-source file named bin2hex.c located in the same directory as
@@ -630,7 +629,7 @@ Both possibilities are described in the following.
 	Example::
 
 		#scripts/lxdialog/Makefile
-		hostprogs-y   := lxdialog
+		hostprogs     := lxdialog
 		lxdialog-objs := checklist.o lxdialog.o
 
 	Objects with extension .o are compiled from the corresponding .c
@@ -650,7 +649,7 @@ Both possibilities are described in the following.
 	Example::
 
 		#scripts/kconfig/Makefile
-		hostprogs-y   := qconf
+		hostprogs     := qconf
 		qconf-cxxobjs := qconf.o
 
 	In the example above the executable is composed of the C++ file
@@ -662,7 +661,7 @@ Both possibilities are described in the following.
 	Example::
 
 		#scripts/kconfig/Makefile
-		hostprogs-y   := qconf
+		hostprogs     := qconf
 		qconf-cxxobjs := qconf.o
 		qconf-objs    := check.o
 
@@ -710,7 +709,7 @@ Both possibilities are described in the following.
 	Example::
 
 		#drivers/pci/Makefile
-		hostprogs-y := gen-devlist
+		hostprogs := gen-devlist
 		$(obj)/devlist.h: $(src)/pci.ids $(obj)/gen-devlist
 			( cd $(obj); ./gen-devlist ) < $<
 
@@ -718,47 +717,31 @@ Both possibilities are described in the following.
 	$(obj)/gen-devlist is updated. Note that references to
 	the host programs in special rules must be prefixed with $(obj).
 
-	(2) Use $(always)
+	(2) Use always-y
 
 	When there is no suitable special rule, and the host program
-	shall be built when a makefile is entered, the $(always)
+	shall be built when a makefile is entered, the always-y
 	variable shall be used.
 
 	Example::
 
 		#scripts/lxdialog/Makefile
-		hostprogs-y   := lxdialog
-		always        := $(hostprogs-y)
+		hostprogs     := lxdialog
+		always-y      := $(hostprogs)
 
 	This will tell kbuild to build lxdialog even if not referenced in
 	any rule.
 
-4.6 Using hostprogs-$(CONFIG_FOO)
----------------------------------
-
-	A typical pattern in a Kbuild file looks like this:
-
-	Example::
-
-		#scripts/Makefile
-		hostprogs-$(CONFIG_KALLSYMS) += kallsyms
-
-	Kbuild knows about both 'y' for built-in and 'm' for module.
-	So if a config symbol evaluates to 'm', kbuild will still build
-	the binary. In other words, Kbuild handles hostprogs-m exactly
-	like hostprogs-y. But only hostprogs-y is recommended to be used
-	when no CONFIG symbols are involved.
-
 5 Kbuild clean infrastructure
 =============================
 
 "make clean" deletes most generated files in the obj tree where the kernel
 is compiled. This includes generated files such as host programs.
-Kbuild knows targets listed in $(hostprogs-y), $(hostprogs-m), $(always),
-$(extra-y) and $(targets). They are all deleted during "make clean".
-Files matching the patterns "*.[oas]", "*.ko", plus some additional files
-generated by kbuild are deleted all over the kernel src tree when
-"make clean" is executed.
+Kbuild knows targets listed in $(hostprogs), $(always-y), $(always-m),
+$(always-), $(extra-y), $(extra-) and $(targets). They are all deleted
+during "make clean". Files matching the patterns "*.[oas]", "*.ko", plus
+some additional files generated by kbuild are deleted all over the kernel
+source tree when "make clean" is executed.
 
 Additional files or directories can be specified in kbuild makefiles by use of
 $(clean-files).
diff --git a/Kbuild b/Kbuild
index 3109ac786e76..fa441b98c9f6 100644
--- a/Kbuild
+++ b/Kbuild
@@ -7,7 +7,7 @@
 
 bounds-file := include/generated/bounds.h
 
-always  := $(bounds-file)
+always-y := $(bounds-file)
 targets := kernel/bounds.s
 
 $(bounds-file): kernel/bounds.s FORCE
@@ -28,7 +28,7 @@ $(timeconst-file): kernel/time/timeconst.bc FORCE
 
 offsets-file := include/generated/asm-offsets.h
 
-always  += $(offsets-file)
+always-y += $(offsets-file)
 targets += arch/$(SRCARCH)/kernel/asm-offsets.s
 
 arch/$(SRCARCH)/kernel/asm-offsets.s: $(timeconst-file) $(bounds-file)
@@ -39,7 +39,7 @@ $(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s FORCE
 #####
 # Check for missing system calls
 
-always += missing-syscalls
+always-y += missing-syscalls
 
 quiet_cmd_syscalls = CALL    $<
       cmd_syscalls = $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags)
@@ -50,7 +50,7 @@ missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
 #####
 # Check atomic headers are up-to-date
 
-always += old-atomics
+always-y += old-atomics
 
 quiet_cmd_atomics = CALL    $<
       cmd_atomics = $(CONFIG_SHELL) $<
diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index 991e023a6fc4..d8dba85e606c 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -8,7 +8,7 @@
 # Copyright (C) 1994 by Linus Torvalds
 #
 
-hostprogs-y	:= tools/mkbb tools/objstrip
+hostprogs	:= tools/mkbb tools/objstrip
 targets		:= vmlinux.gz vmlinux \
 		   vmlinux.nh tools/lxboot tools/bootlx tools/bootph \
 		   tools/bootpzh bootloader bootpheader bootpzheader 
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 1babb392e70a..d3c9f03e7e79 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -5,7 +5,7 @@
 ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
 include $(srctree)/lib/vdso/Makefile
 
-hostprogs-y := vdsomunge
+hostprogs := vdsomunge
 
 obj-vdso := vgettimeofday.o datapage.o note.o
 
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 76b327f88fbb..04df57b43cb1 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -115,9 +115,9 @@ VDSO_LDFLAGS += $(call cc32-ldoption,-fuse-ld=bfd)
 
 # Borrow vdsomunge.c from the arm vDSO
 # We have to use a relative path because scripts/Makefile.host prefixes
-# $(hostprogs-y) with $(obj)
+# $(hostprogs) with $(obj)
 munge := ../../../arm/vdso/vdsomunge
-hostprogs-y := $(munge)
+hostprogs := $(munge)
 
 c-obj-vdso := note.o
 c-obj-vdso-gettimeofday := vgettimeofday.o
diff --git a/arch/mips/boot/Makefile b/arch/mips/boot/Makefile
index 4ed45ade32a1..a3da2c5d63c2 100644
--- a/arch/mips/boot/Makefile
+++ b/arch/mips/boot/Makefile
@@ -21,7 +21,7 @@ endif
 drop-sections := .reginfo .mdebug .comment .note .pdr .options .MIPS.options
 strip-flags   := $(addprefix --remove-section=,$(drop-sections))
 
-hostprogs-y := elf2ecoff
+hostprogs := elf2ecoff
 
 suffix-y			:= bin
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index d859f079b771..0df0ee8a298d 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -84,7 +84,7 @@ $(obj)/piggy.o: $(obj)/dummy.o $(obj)/vmlinux.bin.z FORCE
 HOSTCFLAGS_calc_vmlinuz_load_addr.o += $(LINUXINCLUDE)
 
 # Calculate the load address of the compressed kernel image
-hostprogs-y := calc_vmlinuz_load_addr
+hostprogs := calc_vmlinuz_load_addr
 
 ifneq ($(zload-y),)
 VMLINUZ_LOAD_ADDRESS := $(zload-y)
@@ -112,7 +112,7 @@ ifdef CONFIG_MACH_DECSTATION
 endif
 
 # elf2ecoff can only handle 32bit image
-hostprogs-y += ../elf2ecoff
+hostprogs += ../elf2ecoff
 
 ifdef CONFIG_32BIT
 	VMLINUZ = vmlinuz
diff --git a/arch/mips/boot/tools/Makefile b/arch/mips/boot/tools/Makefile
index 5f8e737348eb..592e05a51a4a 100644
--- a/arch/mips/boot/tools/Makefile
+++ b/arch/mips/boot/tools/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-hostprogs-y	+= relocs
+hostprogs	+= relocs
 relocs-objs	+= relocs_32.o
 relocs-objs	+= relocs_64.o
 relocs-objs	+= relocs_main.o
diff --git a/arch/mips/tools/Makefile b/arch/mips/tools/Makefile
index aaef688749f5..b851e5dcc65a 100644
--- a/arch/mips/tools/Makefile
+++ b/arch/mips/tools/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
-hostprogs-y := elf-entry
+hostprogs := elf-entry
 PHONY += elf-entry
 elf-entry: $(obj)/elf-entry
 	@:
 
-hostprogs-$(CONFIG_CPU_LOONGSON3_WORKAROUNDS) += loongson3-llsc-check
+hostprogs += loongson3-llsc-check
 PHONY += loongson3-llsc-check
 loongson3-llsc-check: $(obj)/loongson3-llsc-check
 	@:
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index b2a2e032dc99..aa89a41dc5dd 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -100,7 +100,7 @@ $(obj)/%.so.raw: OBJCOPYFLAGS := -S
 $(obj)/%.so.raw: $(obj)/%.so.dbg.raw FORCE
 	$(call if_changed,objcopy)
 
-hostprogs-y := genvdso
+hostprogs := genvdso
 
 quiet_cmd_genvdso = GENVDSO $@
 define cmd_genvdso
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index dfbd7f22eef5..0556bf4fc9e9 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -224,7 +224,7 @@ $(patsubst %.S,%.o, $(filter %.S, $(src-boot))): %.o: %.S FORCE
 $(obj)/wrapper.a: $(obj-wlib) FORCE
 	$(call if_changed,bootar)
 
-hostprogs-y	:= addnote hack-coff mktree
+hostprogs	:= addnote hack-coff mktree
 
 targets		+= $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a)
 extra-y		:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
@@ -464,7 +464,7 @@ WRAPPER_BINDIR := /usr/sbin
 INSTALL := install
 
 extra-installed		:= $(patsubst $(obj)/%, $(DESTDIR)$(WRAPPER_OBJDIR)/%, $(extra-y))
-hostprogs-installed	:= $(patsubst %, $(DESTDIR)$(WRAPPER_BINDIR)/%, $(hostprogs-y))
+hostprogs-installed	:= $(patsubst %, $(DESTDIR)$(WRAPPER_BINDIR)/%, $(hostprogs))
 wrapper-installed	:= $(DESTDIR)$(WRAPPER_BINDIR)/wrapper
 dts-installed		:= $(patsubst $(dtstree)/%, $(DESTDIR)$(WRAPPER_DTSDIR)/%, $(wildcard $(dtstree)/*.dts))
 
diff --git a/arch/s390/tools/Makefile b/arch/s390/tools/Makefile
index b5e35e8f999a..f9dd47ff9ac4 100644
--- a/arch/s390/tools/Makefile
+++ b/arch/s390/tools/Makefile
@@ -10,8 +10,8 @@ PHONY += kapi
 
 kapi:	$(kapi-hdrs-y)
 
-hostprogs-y		    += gen_facilities
-hostprogs-y		    += gen_opcode_table
+hostprogs		    += gen_facilities
+hostprogs		    += gen_opcode_table
 
 HOSTCFLAGS_gen_facilities.o += $(LINUXINCLUDE)
 
diff --git a/arch/sparc/boot/Makefile b/arch/sparc/boot/Makefile
index ec8cd703b708..380e2b018992 100644
--- a/arch/sparc/boot/Makefile
+++ b/arch/sparc/boot/Makefile
@@ -7,7 +7,7 @@
 ROOT_IMG	:= /usr/src/root.img
 ELFTOAOUT	:= elftoaout
 
-hostprogs-y	:= piggyback
+hostprogs	:= piggyback
 targets		:= tftpboot.img image zImage vmlinux.aout
 clean-files	:= System.map
 
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 997ffe46e953..708cb6304c2d 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -41,7 +41,7 @@ $(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) FORCE
 	$(call if_changed,vdso)
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
-hostprogs-y			+= vdso2c
+hostprogs += vdso2c
 
 quiet_cmd_vdso2c = VDSO2C  $@
       cmd_vdso2c = $(obj)/vdso2c $< $(<:%.dbg=%) $@
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 748b6d28a91d..012b82fc8617 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -45,8 +45,8 @@ setup-y		+= video-vesa.o
 setup-y		+= video-bios.o
 
 targets		+= $(setup-y)
-hostprogs-y	:= tools/build
-hostprogs-$(CONFIG_X86_FEATURE_NAMES) += mkcpustr
+hostprogs	:= tools/build
+hostprogs	+= mkcpustr
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include \
 		    -include include/generated/autoconf.h \
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 56aa5fa0a66b..26050ae0b27e 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -58,7 +58,7 @@ KBUILD_LDFLAGS += $(shell $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" \
 endif
 LDFLAGS_vmlinux := -T
 
-hostprogs-y	:= mkpiggy
+hostprogs	:= mkpiggy
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
 
 sed-voffset := -e 's/^\([0-9a-fA-F]*\) [ABCDGRSTVW] \(_text\|__bss_start\|_end\)$$/\#define VO_\2 _AC(0x\1,UL)/p'
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 2b75e80f6b41..433a1259f61d 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -59,7 +59,7 @@ $(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) FORCE
 	$(call if_changed,vdso_and_check)
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include -I$(srctree)/include/uapi -I$(srctree)/arch/$(SUBARCH)/include/uapi
-hostprogs-y			+= vdso2c
+hostprogs += vdso2c
 
 quiet_cmd_vdso2c = VDSO2C  $@
       cmd_vdso2c = $(obj)/vdso2c $< $(<:%.dbg=%) $@
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index f60501a384f9..99b6332ba540 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -12,7 +12,7 @@ OBJECT_FILES_NON_STANDARD	:= y
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
 KCOV_INSTRUMENT		:= n
 
-always := realmode.bin realmode.relocs
+always-y := realmode.bin realmode.relocs
 
 wakeup-objs	:= wakeup_asm.o wakemain.o video-mode.o
 wakeup-objs	+= copy.o bioscall.o regs.o
diff --git a/arch/x86/tools/Makefile b/arch/x86/tools/Makefile
index 09af7ff53044..55b1ab378974 100644
--- a/arch/x86/tools/Makefile
+++ b/arch/x86/tools/Makefile
@@ -26,7 +26,7 @@ posttest: $(obj)/insn_decoder_test vmlinux $(obj)/insn_sanity
 	$(call cmd,posttest)
 	$(call cmd,sanitytest)
 
-hostprogs-y	+= insn_decoder_test insn_sanity
+hostprogs += insn_decoder_test insn_sanity
 
 # -I needed for generated C source and C source which in the kernel tree.
 HOSTCFLAGS_insn_decoder_test.o := -Wall -I$(objtree)/arch/x86/lib/ -I$(srctree)/arch/x86/include/uapi/ -I$(srctree)/arch/x86/include/ -I$(srctree)/arch/x86/lib/ -I$(srctree)/include/uapi/
@@ -39,7 +39,7 @@ $(obj)/insn_decoder_test.o: $(srctree)/arch/x86/lib/insn.c $(srctree)/arch/x86/l
 $(obj)/insn_sanity.o: $(srctree)/arch/x86/lib/insn.c $(srctree)/arch/x86/lib/inat.c $(srctree)/arch/x86/include/asm/inat_types.h $(srctree)/arch/x86/include/asm/inat.h $(srctree)/arch/x86/include/asm/insn.h $(objtree)/arch/x86/lib/inat-tables.c
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
-hostprogs-y	+= relocs
+hostprogs	+= relocs
 relocs-objs     := relocs_32.o relocs_64.o relocs_common.o
 PHONY += relocs
 relocs: $(obj)/relocs
diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
index 1973d976c220..11c97edde54d 100644
--- a/drivers/gpu/drm/radeon/Makefile
+++ b/drivers/gpu/drm/radeon/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-hostprogs-y := mkregtable
+hostprogs := mkregtable
 targets := rn50_reg_safe.h r100_reg_safe.h r200_reg_safe.h rv515_reg_safe.h r300_reg_safe.h r420_reg_safe.h rs600_reg_safe.h r600_reg_safe.h evergreen_reg_safe.h cayman_reg_safe.h
 
 quiet_cmd_mkregtable = MKREG   $@
diff --git a/drivers/tty/vt/Makefile b/drivers/tty/vt/Makefile
index 329ca336b8ee..fe30ce512819 100644
--- a/drivers/tty/vt/Makefile
+++ b/drivers/tty/vt/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_HW_CONSOLE)		+= vt.o defkeymap.o
 # Files generated that shall be removed upon make clean
 clean-files := consolemap_deftbl.c defkeymap.c
 
-hostprogs-y += conmakehash
+hostprogs += conmakehash
 
 quiet_cmd_conmk = CONMK   $@
       cmd_conmk = $(obj)/conmakehash $< > $@
diff --git a/drivers/video/logo/Makefile b/drivers/video/logo/Makefile
index bcda657493a4..895c60b8402e 100644
--- a/drivers/video/logo/Makefile
+++ b/drivers/video/logo/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_SPU_BASE)			+= logo_spe_clut224.o
 
 # How to generate logo's
 
-hostprogs-y := pnmtologo
+hostprogs := pnmtologo
 
 # Create commands like "pnmtologo -t mono -n logo_mac_mono -o ..."
 quiet_cmd_logo = LOGO    $@
diff --git a/drivers/zorro/Makefile b/drivers/zorro/Makefile
index b360ac4ea846..91ba82e633e7 100644
--- a/drivers/zorro/Makefile
+++ b/drivers/zorro/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_ZORRO)	+= zorro.o zorro-driver.o zorro-sysfs.o
 obj-$(CONFIG_PROC_FS)	+= proc.o
 obj-$(CONFIG_ZORRO_NAMES) +=  names.o
 
-hostprogs-y 		:= gen-devlist
+hostprogs		:= gen-devlist
 
 # Files generated that shall be removed upon make clean
 clean-files := devlist.h
diff --git a/fs/unicode/Makefile b/fs/unicode/Makefile
index d46e9baee285..b88aecc86550 100644
--- a/fs/unicode/Makefile
+++ b/fs/unicode/Makefile
@@ -35,4 +35,4 @@ $(obj)/utf8data.h: $(src)/utf8data.h_shipped FORCE
 endif
 
 targets += utf8data.h
-hostprogs-y += mkutf8data
+hostprogs += mkutf8data
diff --git a/lib/Makefile b/lib/Makefile
index 23ca78d43d24..8508143d3b76 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -239,8 +239,8 @@ obj-$(CONFIG_ASN1) += asn1_decoder.o
 
 obj-$(CONFIG_FONT_SUPPORT) += fonts/
 
-hostprogs-y	:= gen_crc32table
-hostprogs-y	+= gen_crc64table
+hostprogs	:= gen_crc32table
+hostprogs	+= gen_crc64table
 clean-files	:= crc32table.h
 clean-files	+= crc64table.h
 
diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 0083b5cc646c..b4c0df6d706d 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -10,7 +10,7 @@ raid6_pq-$(CONFIG_ALTIVEC) += altivec1.o altivec2.o altivec4.o altivec8.o \
 raid6_pq-$(CONFIG_KERNEL_MODE_NEON) += neon.o neon1.o neon2.o neon4.o neon8.o recov_neon.o recov_neon_inner.o
 raid6_pq-$(CONFIG_S390) += s390vx8.o recov_s390xc.o
 
-hostprogs-y	+= mktables
+hostprogs	+= mktables
 
 ifeq ($(CONFIG_ALTIVEC),y)
 altivec_flags := -maltivec $(call cc-option,-mabi=altivec)
diff --git a/net/bpfilter/Makefile b/net/bpfilter/Makefile
index aa945ab5b655..36580301da70 100644
--- a/net/bpfilter/Makefile
+++ b/net/bpfilter/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the Linux BPFILTER layer.
 #
 
-hostprogs-y := bpfilter_umh
+hostprogs := bpfilter_umh
 bpfilter_umh-objs := main.o
 KBUILD_HOSTCFLAGS += -I $(srctree)/tools/include/ -I $(srctree)/tools/include/uapi
 HOSTCC := $(CC)
diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index b0e8adf7eb01..79b0fee6943b 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -111,65 +111,65 @@ ibumad-objs := bpf_load.o ibumad_user.o $(TRACE_HELPERS)
 hbm-objs := bpf_load.o hbm.o $(CGROUP_HELPERS)
 
 # Tell kbuild to always build the programs
-always := $(tprogs-y)
-always += sockex1_kern.o
-always += sockex2_kern.o
-always += sockex3_kern.o
-always += tracex1_kern.o
-always += tracex2_kern.o
-always += tracex3_kern.o
-always += tracex4_kern.o
-always += tracex5_kern.o
-always += tracex6_kern.o
-always += tracex7_kern.o
-always += sock_flags_kern.o
-always += test_probe_write_user_kern.o
-always += trace_output_kern.o
-always += tcbpf1_kern.o
-always += tc_l2_redirect_kern.o
-always += lathist_kern.o
-always += offwaketime_kern.o
-always += spintest_kern.o
-always += map_perf_test_kern.o
-always += test_overhead_tp_kern.o
-always += test_overhead_raw_tp_kern.o
-always += test_overhead_kprobe_kern.o
-always += parse_varlen.o parse_simple.o parse_ldabs.o
-always += test_cgrp2_tc_kern.o
-always += xdp1_kern.o
-always += xdp2_kern.o
-always += xdp_router_ipv4_kern.o
-always += test_current_task_under_cgroup_kern.o
-always += trace_event_kern.o
-always += sampleip_kern.o
-always += lwt_len_hist_kern.o
-always += xdp_tx_iptunnel_kern.o
-always += test_map_in_map_kern.o
-always += tcp_synrto_kern.o
-always += tcp_rwnd_kern.o
-always += tcp_bufs_kern.o
-always += tcp_cong_kern.o
-always += tcp_iw_kern.o
-always += tcp_clamp_kern.o
-always += tcp_basertt_kern.o
-always += tcp_tos_reflect_kern.o
-always += tcp_dumpstats_kern.o
-always += xdp_redirect_kern.o
-always += xdp_redirect_map_kern.o
-always += xdp_redirect_cpu_kern.o
-always += xdp_monitor_kern.o
-always += xdp_rxq_info_kern.o
-always += xdp2skb_meta_kern.o
-always += syscall_tp_kern.o
-always += cpustat_kern.o
-always += xdp_adjust_tail_kern.o
-always += xdp_fwd_kern.o
-always += task_fd_query_kern.o
-always += xdp_sample_pkts_kern.o
-always += ibumad_kern.o
-always += hbm_out_kern.o
-always += hbm_edt_kern.o
-always += xdpsock_kern.o
+always-y := $(tprogs-y)
+always-y += sockex1_kern.o
+always-y += sockex2_kern.o
+always-y += sockex3_kern.o
+always-y += tracex1_kern.o
+always-y += tracex2_kern.o
+always-y += tracex3_kern.o
+always-y += tracex4_kern.o
+always-y += tracex5_kern.o
+always-y += tracex6_kern.o
+always-y += tracex7_kern.o
+always-y += sock_flags_kern.o
+always-y += test_probe_write_user_kern.o
+always-y += trace_output_kern.o
+always-y += tcbpf1_kern.o
+always-y += tc_l2_redirect_kern.o
+always-y += lathist_kern.o
+always-y += offwaketime_kern.o
+always-y += spintest_kern.o
+always-y += map_perf_test_kern.o
+always-y += test_overhead_tp_kern.o
+always-y += test_overhead_raw_tp_kern.o
+always-y += test_overhead_kprobe_kern.o
+always-y += parse_varlen.o parse_simple.o parse_ldabs.o
+always-y += test_cgrp2_tc_kern.o
+always-y += xdp1_kern.o
+always-y += xdp2_kern.o
+always-y += xdp_router_ipv4_kern.o
+always-y += test_current_task_under_cgroup_kern.o
+always-y += trace_event_kern.o
+always-y += sampleip_kern.o
+always-y += lwt_len_hist_kern.o
+always-y += xdp_tx_iptunnel_kern.o
+always-y += test_map_in_map_kern.o
+always-y += tcp_synrto_kern.o
+always-y += tcp_rwnd_kern.o
+always-y += tcp_bufs_kern.o
+always-y += tcp_cong_kern.o
+always-y += tcp_iw_kern.o
+always-y += tcp_clamp_kern.o
+always-y += tcp_basertt_kern.o
+always-y += tcp_tos_reflect_kern.o
+always-y += tcp_dumpstats_kern.o
+always-y += xdp_redirect_kern.o
+always-y += xdp_redirect_map_kern.o
+always-y += xdp_redirect_cpu_kern.o
+always-y += xdp_monitor_kern.o
+always-y += xdp_rxq_info_kern.o
+always-y += xdp2skb_meta_kern.o
+always-y += syscall_tp_kern.o
+always-y += cpustat_kern.o
+always-y += xdp_adjust_tail_kern.o
+always-y += xdp_fwd_kern.o
+always-y += task_fd_query_kern.o
+always-y += xdp_sample_pkts_kern.o
+always-y += ibumad_kern.o
+always-y += hbm_out_kern.o
+always-y += hbm_edt_kern.o
+always-y += xdpsock_kern.o
 
 ifeq ($(ARCH), arm)
 # Strip all except -D__LINUX_ARM_ARCH__ option needed to handle linux
diff --git a/samples/connector/Makefile b/samples/connector/Makefile
index 6ad71620e503..b785cbde5ffa 100644
--- a/samples/connector/Makefile
+++ b/samples/connector/Makefile
@@ -2,12 +2,8 @@
 obj-$(CONFIG_SAMPLE_CONNECTOR) += cn_test.o
 
 # List of programs to build
-ifdef CONFIG_SAMPLE_CONNECTOR
-hostprogs-y := ucon
-endif
-
-# Tell kbuild to always build the programs
-always := $(hostprogs-y)
+hostprogs := ucon
+always-y := $(hostprogs)
 
 HOSTCFLAGS_ucon.o += -I$(objtree)/usr/include
 
diff --git a/samples/hidraw/Makefile b/samples/hidraw/Makefile
index dec1b22adf54..8bd25f77671f 100644
--- a/samples/hidraw/Makefile
+++ b/samples/hidraw/Makefile
@@ -1,9 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # List of programs to build
-hostprogs-y := hid-example
-
-# Tell kbuild to always build the programs
-always := $(hostprogs-y)
+hostprogs := hid-example
+always-y := $(hostprogs)
 
 HOSTCFLAGS_hid-example.o += -I$(objtree)/usr/include
 
diff --git a/samples/mei/Makefile b/samples/mei/Makefile
index 27f37efdadb4..f5b9d02be2cd 100644
--- a/samples/mei/Makefile
+++ b/samples/mei/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (c) 2012-2019, Intel Corporation. All rights reserved.
 
-hostprogs-y := mei-amt-version
+hostprogs := mei-amt-version
 
 HOSTCFLAGS_mei-amt-version.o += -I$(objtree)/usr/include
 
-always := $(hostprogs-y)
+always-y := $(hostprogs)
 
 all: mei-amt-version
diff --git a/samples/pidfd/Makefile b/samples/pidfd/Makefile
index 0ff97784177a..ee2979849d92 100644
--- a/samples/pidfd/Makefile
+++ b/samples/pidfd/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-hostprogs-y := pidfd-metadata
-always := $(hostprogs-y)
+hostprogs := pidfd-metadata
+always-y := $(hostprogs)
 HOSTCFLAGS_pidfd-metadata.o += -I$(objtree)/usr/include
 all: pidfd-metadata
diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
index 009775b52538..89279e8b87df 100644
--- a/samples/seccomp/Makefile
+++ b/samples/seccomp/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 ifndef CROSS_COMPILE
-hostprogs-y := bpf-fancy dropper bpf-direct user-trap
+hostprogs := bpf-fancy dropper bpf-direct user-trap
 
 HOSTCFLAGS_bpf-fancy.o += -I$(objtree)/usr/include
 HOSTCFLAGS_bpf-fancy.o += -idirafter $(objtree)/include
@@ -40,5 +40,5 @@ HOSTLDLIBS_bpf-fancy += $(MFLAG)
 HOSTLDLIBS_dropper += $(MFLAG)
 HOSTLDLIBS_user-trap += $(MFLAG)
 endif
-always := $(hostprogs-y)
+always-y := $(hostprogs)
 endif
diff --git a/samples/uhid/Makefile b/samples/uhid/Makefile
index 8c9bc9f98d37..5f44ea40d6d5 100644
--- a/samples/uhid/Makefile
+++ b/samples/uhid/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # List of programs to build
-hostprogs-y := uhid-example
+hostprogs := uhid-example
 
 # Tell kbuild to always build the programs
-always := $(hostprogs-y)
+always-y := $(hostprogs)
 
 HOSTCFLAGS_uhid-example.o += -I$(objtree)/usr/include
diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
index e21c9f6fe9be..65acdde5c117 100644
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@ -1,11 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # List of programs to build
-hostprogs-y := \
+hostprogs := \
 	test-fsmount \
 	test-statx
 
-# Tell kbuild to always build the programs
-always := $(hostprogs-y)
+always-y := $(hostprogs)
 
 HOSTCFLAGS_test-fsmount.o += -I$(objtree)/usr/include
 HOSTCFLAGS_test-statx.o += -I$(objtree)/usr/include
diff --git a/scripts/Makefile b/scripts/Makefile
index 4d41f48e7376..5e75802b1a44 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -7,14 +7,14 @@
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include
 
-hostprogs-$(CONFIG_BUILD_BIN2C)  += bin2c
-hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
-hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
-hostprogs-$(CONFIG_BUILDTIME_TABLE_SORT) += sorttable
-hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
-hostprogs-$(CONFIG_MODULE_SIG_FORMAT) += sign-file
-hostprogs-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += extract-cert
-hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) += insert-sys-cert
+always-$(CONFIG_BUILD_BIN2C)			+= bin2c
+always-$(CONFIG_KALLSYMS)			+= kallsyms
+always-$(BUILD_C_RECORDMCOUNT)			+= recordmcount
+always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
+always-$(CONFIG_ASN1)				+= asn1_compiler
+always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
+always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)		+= extract-cert
+always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
@@ -30,10 +30,10 @@ HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
 HOSTLDLIBS_sorttable = -lpthread
 endif
 
-always		:= $(hostprogs-y) $(hostprogs-m)
+hostprogs := $(always-y) $(always-m)
 
-# The following hostprogs-y programs are only build on demand
-hostprogs-y += unifdef
+# The following programs are only built on demand
+hostprogs += unifdef
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a562d695f0fa..a1730d42e5f3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -16,6 +16,8 @@ obj-m :=
 lib-y :=
 lib-m :=
 always :=
+always-y :=
+always-m :=
 targets :=
 subdir-y :=
 subdir-m :=
@@ -44,7 +46,7 @@ include $(kbuild-file)
 include scripts/Makefile.lib
 
 # Do not include host rules unless needed
-ifneq ($(hostprogs-y)$(hostprogs-m)$(hostlibs-y)$(hostlibs-m)$(hostcxxlibs-y)$(hostcxxlibs-m),)
+ifneq ($(hostprogs)$(hostlibs-y)$(hostlibs-m)$(hostcxxlibs-y)$(hostcxxlibs-m),)
 include scripts/Makefile.host
 endif
 
@@ -348,7 +350,7 @@ $(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
 	$(call if_changed_rule,as_o_S)
 
 targets += $(filter-out $(subdir-obj-y), $(real-obj-y)) $(real-obj-m) $(lib-y)
-targets += $(extra-y) $(MAKECMDGOALS) $(always)
+targets += $(extra-y) $(always-y) $(MAKECMDGOALS)
 
 # Linker scripts preprocessor (.lds.S -> .lds)
 # ---------------------------------------------------------------------------
@@ -490,7 +492,7 @@ else
 
 __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
 	 $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
-	 $(subdir-ym) $(always)
+	 $(subdir-ym) $(always-y)
 	@:
 
 endif
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index e367eb95c5c0..1e4206566a82 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -28,8 +28,8 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
 # directory
 
 __clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
-		   $(always) $(targets) $(clean-files)   \
-		   $(hostprogs-y) $(hostprogs-m) $(hostprogs-) \
+		   $(always) $(always-y) $(always-m) $(always-) $(targets) $(clean-files)   \
+		   $(hostprogs) $(hostprogs-y) $(hostprogs-m) $(hostprogs-) \
 		   $(hostlibs-y) $(hostlibs-m) $(hostlibs-) \
 		   $(hostcxxlibs-y) $(hostcxxlibs-m)
 
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 4c51c95d40f4..3b7121d43324 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -24,21 +24,21 @@ $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
 # Both C and C++ are supported, but preferred language is C for such utilities.
 #
 # Sample syntax (see Documentation/kbuild/makefiles.rst for reference)
-# hostprogs-y := bin2hex
+# hostprogs := bin2hex
 # Will compile bin2hex.c and create an executable named bin2hex
 #
-# hostprogs-y    := lxdialog
+# hostprogs     := lxdialog
 # lxdialog-objs := checklist.o lxdialog.o
 # Will compile lxdialog.c and checklist.c, and then link the executable
 # lxdialog, based on checklist.o and lxdialog.o
 #
-# hostprogs-y      := qconf
+# hostprogs       := qconf
 # qconf-cxxobjs   := qconf.o
 # qconf-objs      := menu.o
 # Will compile qconf as a C++ program, and menu as a C program.
 # They are linked as C++ code to the executable qconf
 
-__hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
+__hostprogs := $(sort $(hostprogs))
 host-cshlib := $(sort $(hostlibs-y) $(hostlibs-m))
 host-cxxshlib := $(sort $(hostcxxlibs-y) $(hostcxxlibs-m))
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index d10f7a03e0ee..bae62549e3d2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -4,6 +4,8 @@ asflags-y  += $(EXTRA_AFLAGS)
 ccflags-y  += $(EXTRA_CFLAGS)
 cppflags-y += $(EXTRA_CPPFLAGS)
 ldflags-y  += $(EXTRA_LDFLAGS)
+always-y   += $(always)
+hostprogs  += $(hostprogs-y) $(hostprogs-m)
 
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
@@ -59,6 +61,8 @@ subdir-obj-y := $(filter %/built-in.a, $(obj-y))
 real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
 real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
 
+always-y += $(always-m)
+
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
 extra-y				+= $(dtb-y)
@@ -72,7 +76,7 @@ endif
 # Add subdir path
 
 extra-y		:= $(addprefix $(obj)/,$(extra-y))
-always		:= $(addprefix $(obj)/,$(always))
+always-y	:= $(addprefix $(obj)/,$(always-y))
 targets		:= $(addprefix $(obj)/,$(targets))
 modorder	:= $(addprefix $(obj)/,$(modorder))
 obj-m		:= $(addprefix $(obj)/,$(obj-m))
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index 7c9cb80d097b..290dd27d2809 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -2,5 +2,5 @@
 #
 # fixdep: used to generate dependency information during build process
 
-hostprogs-y	:= fixdep
-always		:= $(hostprogs-y)
+hostprogs	:= fixdep
+always-y	:= $(hostprogs)
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index b5a5b1c548c9..3acbb410904c 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # scripts/dtc makefile
 
-hostprogs-$(CONFIG_DTC) := dtc
-always		:= $(hostprogs-y)
+hostprogs		:= dtc
+always-$(CONFIG_DTC)	:= $(hostprogs)
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 		   srcpos.o checks.o util.o
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index aa0d0ec6936d..f2ee8bd7abc6 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -23,7 +23,7 @@ $(objtree)/$(obj)/randomize_layout_seed.h: FORCE
 targets = randomize_layout_seed.h randomize_layout_hash.h
 
 $(HOSTLIBS)-y := $(foreach p,$(GCC_PLUGIN),$(if $(findstring /,$(p)),,$(p)))
-always := $($(HOSTLIBS)-y)
+always-y := $($(HOSTLIBS)-y)
 
 $(foreach p,$($(HOSTLIBS)-y:%.so=%),$(eval $(p)-objs := $(p).o))
 
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 78629f515e78..d328de1e10ee 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-hostprogs-y	:= genksyms
-always		:= $(hostprogs-y)
+hostprogs	:= genksyms
+always-y	:= $(hostprogs)
 
 genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index fbeb62ae3401..5887ceb6229e 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -157,11 +157,11 @@ HOSTCFLAGS_lexer.lex.o	:= -I $(srctree)/$(src)
 HOSTCFLAGS_parser.tab.o	:= -I $(srctree)/$(src)
 
 # conf: Used for defconfig, oldconfig and related targets
-hostprogs-y	+= conf
+hostprogs	+= conf
 conf-objs	:= conf.o $(common-objs)
 
 # nconf: Used for the nconfig target based on ncurses
-hostprogs-y	+= nconf
+hostprogs	+= nconf
 nconf-objs	:= nconf.o nconf.gui.o $(common-objs)
 
 HOSTLDLIBS_nconf	= $(shell . $(obj)/nconf-cfg && echo $$libs)
@@ -171,7 +171,7 @@ HOSTCFLAGS_nconf.gui.o	= $(shell . $(obj)/nconf-cfg && echo $$cflags)
 $(obj)/nconf.o $(obj)/nconf.gui.o: $(obj)/nconf-cfg
 
 # mconf: Used for the menuconfig target based on lxdialog
-hostprogs-y	+= mconf
+hostprogs	+= mconf
 lxdialog	:= $(addprefix lxdialog/, \
 		     checklist.o inputbox.o menubox.o textbox.o util.o yesno.o)
 mconf-objs	:= mconf.o $(lxdialog) $(common-objs)
@@ -183,7 +183,7 @@ $(foreach f, mconf.o $(lxdialog), \
 $(addprefix $(obj)/, mconf.o $(lxdialog)): $(obj)/mconf-cfg
 
 # qconf: Used for the xconfig target based on Qt
-hostprogs-y	+= qconf
+hostprogs	+= qconf
 qconf-cxxobjs	:= qconf.o
 qconf-objs	:= images.o $(common-objs)
 
@@ -199,7 +199,7 @@ $(obj)/%.moc: $(src)/%.h $(obj)/qconf-cfg
 	$(call cmd,moc)
 
 # gconf: Used for the gconfig target based on GTK+
-hostprogs-y	+= gconf
+hostprogs	+= gconf
 gconf-objs	:= gconf.o images.o $(common-objs)
 
 HOSTLDLIBS_gconf    = $(shell . $(obj)/gconf-cfg && echo $$libs)
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 42c5d50f2bcc..296b6a3878b2 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 OBJECT_FILES_NON_STANDARD := y
 
-hostprogs-y	:= modpost mk_elfconfig
-always		:= $(hostprogs-y) empty.o
+hostprogs	:= modpost mk_elfconfig
+always-y	:= $(hostprogs) empty.o
 
 modpost-objs	:= modpost.o file2alias.o sumversion.o
 
diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
index e8c533140981..70cf8d95d07c 100644
--- a/scripts/selinux/genheaders/Makefile
+++ b/scripts/selinux/genheaders/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-hostprogs-y	:= genheaders
+hostprogs	:= genheaders
 HOST_EXTRACFLAGS += \
 	-I$(srctree)/include/uapi -I$(srctree)/include \
 	-I$(srctree)/security/selinux/include
 
-always		:= $(hostprogs-y)
+always-y	:= $(hostprogs)
diff --git a/scripts/selinux/mdp/Makefile b/scripts/selinux/mdp/Makefile
index 8a1269a9d0ba..3026f3c2aa2b 100644
--- a/scripts/selinux/mdp/Makefile
+++ b/scripts/selinux/mdp/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-hostprogs-y	:= mdp
+hostprogs	:= mdp
 HOST_EXTRACFLAGS += \
 	-I$(srctree)/include/uapi -I$(srctree)/include \
 	-I$(srctree)/security/selinux/include -I$(objtree)/include
 
-always		:= $(hostprogs-y)
+always-y	:= $(hostprogs)
 clean-files	:= policy.* file_contexts
diff --git a/usr/Makefile b/usr/Makefile
index 244862bfb765..18aed2ab98da 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -52,7 +52,7 @@ ifeq ($(cpio-data),)
 
 cpio-data := $(obj)/initramfs_data.cpio
 
-hostprogs-y := gen_init_cpio
+hostprogs := gen_init_cpio
 
 # .initramfs_data.cpio.d is used to identify all files included
 # in initramfs and to detect if any files are added/removed.
-- 
2.17.1

