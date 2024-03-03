Return-Path: <linux-kbuild+bounces-1119-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410A286F882
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 650EE1C2085A
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306F615B7;
	Mon,  4 Mar 2024 02:21:41 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E32F138A
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518901; cv=none; b=LmCd563ssQxdrTRu7fMbUu28qHjFw4waj0SQcQtbDP05INpOJks1uvxQqBDZXj+U/FsXKh1abWwkVSJTeK3ZmQA+ZbKiQO9EMS9rnj08eXaQDO7IjT4s/OEQRgrfJFlaLr8xv+luUDfcpnYy3oP01klm52lEWQFIEEBAgSjP8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518901; c=relaxed/simple;
	bh=iwkVXTcvX+WkUrWCtl9RaAAum6baJMvTo/YcV4ZKM2s=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=k9dNV8SCPgWBmI25AGD9qY8GwXt008rUSWT2jZBka/sv34BKXfP+uFQXU3SuPDBTTWyaFweqIM3apSZLlvrNFueJNwLQUGrOPHU6uQHwtFYqvYpTK2NIpR3IaEKr4lyaM/N/NxJUzpvEIb87TTcfFh0UanZzTgzrcPzwaoK4a+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242Ivu7021886
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:19:03 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242Ivli021885;
	Sun, 3 Mar 2024 18:18:57 -0800 (PST)
	(envelope-from ehem)
Message-Id: <3b9bdcf7ff7b9d332e3b93e8335f124ed4e24998.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 09/30] build: modify uses of $(objtree) to assume trailing
 slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Date: Tue, 20 Feb 2024 09:13:37 -0800

This isn't much more than `find | sed` to adjust all uses of $(objtree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:
find . -name Makefile\* -print0 | xargs -0 sed -i -e's,$(objtree)$,$(objtree:%/=%),' -e's,$(objtree)\([^,/]\),$(objtree:%/=%)\1,g' -es',$(objtree)/,$(objtree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 Makefile                                    | 22 +++---
 arch/alpha/boot/Makefile                    |  4 +-
 arch/arm/boot/compressed/Makefile           |  2 +-
 arch/arm/vdso/Makefile                      |  2 +-
 arch/arm64/Makefile                         |  2 +-
 arch/arm64/kernel/Makefile                  |  2 +-
 arch/arm64/kvm/hyp/nvhe/Makefile            |  2 +-
 arch/loongarch/Makefile                     |  2 +-
 arch/mips/Makefile                          | 10 +--
 arch/mips/boot/Makefile                     |  4 +-
 arch/mips/boot/compressed/Makefile          | 18 ++---
 arch/parisc/Makefile                        |  4 +-
 arch/parisc/boot/Makefile                   |  2 +-
 arch/parisc/boot/compressed/Makefile        |  6 +-
 arch/powerpc/boot/Makefile                  |  2 +-
 arch/powerpc/kvm/Makefile                   |  2 +-
 arch/riscv/Makefile                         |  2 +-
 arch/um/Makefile                            |  6 +-
 arch/um/kernel/Makefile                     |  2 +-
 arch/x86/Makefile                           |  8 +--
 arch/x86/boot/Makefile                      |  2 +-
 arch/x86/boot/compressed/Makefile           |  6 +-
 arch/x86/realmode/rm/Makefile               |  2 +-
 arch/x86/tools/Makefile                     | 10 +--
 drivers/firmware/efi/libstub/Makefile.zboot |  2 +-
 drivers/scsi/aic7xxx/Makefile               |  4 +-
 kernel/gcov/Makefile                        |  2 +-
 rust/Makefile                               | 80 ++++++++++-----------
 samples/bpf/Makefile                        |  2 +-
 samples/bpf/Makefile.target                 |  4 +-
 samples/hid/Makefile                        |  2 +-
 samples/hid/Makefile.target                 |  4 +-
 32 files changed, 112 insertions(+), 112 deletions(-)

diff --git a/Makefile b/Makefile
index 1c09c7fb7839..ef6d00addeed 100644
--- a/Makefile
+++ b/Makefile
@@ -502,7 +502,7 @@ CLIPPY_DRIVER	= clippy-driver
 BINDGEN		= bindgen
 CARGO		= cargo
 PAHOLE		= pahole
-RESOLVE_BTFIDS	= $(objtree)/tools/bpf/resolve_btfids/resolve_btfids
+RESOLVE_BTFIDS	= $(objtree)tools/bpf/resolve_btfids/resolve_btfids
 LEX		= flex
 YACC		= bison
 AWK		= awk
@@ -534,9 +534,9 @@ LDFLAGS_vmlinux =
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
 		-I$(srctree)arch/$(SRCARCH)/include/uapi \
-		-I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
+		-I$(objtree)arch/$(SRCARCH)/include/generated/uapi \
 		-I$(srctree)include/uapi \
-		-I$(objtree)/include/generated/uapi \
+		-I$(objtree)include/generated/uapi \
                 -include $(srctree)include/linux/compiler-version.h \
                 -include $(srctree)include/linux/kconfig.h
 
@@ -544,9 +544,9 @@ USERINCLUDE    := \
 # Needed to be compatible with the O= option
 LINUXINCLUDE    := \
 		-I$(srctree)arch/$(SRCARCH)/include \
-		-I$(objtree)/arch/$(SRCARCH)/include/generated \
+		-I$(objtree)arch/$(SRCARCH)/include/generated \
 		$(if $(building_out_of_srctree),-I$(srctree)include) \
-		-I$(objtree)/include \
+		-I$(objtree)include \
 		$(USERINCLUDE)
 
 KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
@@ -561,7 +561,7 @@ KBUILD_CFLAGS += -fno-strict-aliasing
 
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_RUSTFLAGS := $(rust_common_flags) \
-		    --target=$(objtree)/scripts/target.json \
+		    --target=$(objtree)scripts/target.json \
 		    -Cpanic=abort -Cembed-bitcode=n -Clto=n \
 		    -Cforce-unwind-tables=n -Ccodegen-units=1 \
 		    -Csymbol-mangling-version=v0 \
@@ -1273,7 +1273,7 @@ headerdep:
 # Kernel headers
 
 #Default location for installed headers
-export INSTALL_HDR_PATH = $(objtree)/usr
+export INSTALL_HDR_PATH = $(objtree)usr
 
 quiet_cmd_headers_install = INSTALL $(INSTALL_HDR_PATH)/include
       cmd_headers_install = \
@@ -1352,11 +1352,11 @@ tools_silent=s
 endif
 
 tools/: FORCE
-	$(Q)mkdir -p $(objtree)/tools
+	$(Q)mkdir -p $(objtree)tools
 	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abs_objtree) subdir=tools -C $(srctree)tools/
 
 tools/%: FORCE
-	$(Q)mkdir -p $(objtree)/tools
+	$(Q)mkdir -p $(objtree)tools
 	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abs_objtree) subdir=tools -C $(srctree)tools/ $*
 
 # ---------------------------------------------------------------------------
@@ -1371,9 +1371,9 @@ kselftest-%: headers FORCE
 
 PHONY += kselftest-merge
 kselftest-merge:
-	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
+	$(if $(wildcard $(objtree).config),, $(error No .config exists, config your kernel first!))
 	$(Q)find $(srctree)tools/testing/selftests -name config -o -name config.$(UTS_MACHINE) | \
-		xargs $(srctree)scripts/kconfig/merge_config.sh -y -m $(objtree)/.config
+		xargs $(srctree)scripts/kconfig/merge_config.sh -y -m $(objtree).config
 	$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 
 # ---------------------------------------------------------------------------
diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index 37b7ec3f7a7d..ca962dca6750 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -14,8 +14,8 @@ targets		:= vmlinux.gz vmlinux \
 		   tools/bootpzh bootloader bootpheader bootpzheader 
 OBJSTRIP	:= $(obj)/tools/objstrip
 
-KBUILD_HOSTCFLAGS := -Wall -I$(objtree)/usr/include
-BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)$(obj)
+KBUILD_HOSTCFLAGS := -Wall -I$(objtree)usr/include
+BOOTCFLAGS	+= -I$(objtree)$(obj) -I$(srctree)$(obj)
 
 # SRM bootable image.  Copy to offset 512 of a partition.
 $(obj)/bootimage: $(addprefix $(obj)/tools/,mkbb lxboot bootlx) $(obj)/vmlinux.nh
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 8a468d737471..af7ff86e64ef 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -149,7 +149,7 @@ if [ $(words $(ZRELADDR)) -gt 1 -a "$(CONFIG_AUTO_ZRELADDR)" = "" ]; then \
 	false; \
 fi
 
-efi-obj-$(CONFIG_EFI_STUB) := $(objtree)/drivers/firmware/efi/libstub/lib.a
+efi-obj-$(CONFIG_EFI_STUB) := $(objtree)drivers/firmware/efi/libstub/lib.a
 
 $(obj)/vmlinux: $(obj)/vmlinux.lds $(obj)/$(HEAD) $(obj)/piggy.o \
 		$(addprefix $(obj)/, $(OBJS)) \
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 579bf0369e94..2681e6123e46 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -62,4 +62,4 @@ quiet_cmd_vdsold_and_vdso_check = LD      $@
       cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check)
 
 quiet_cmd_vdsomunge = MUNGE   $@
-      cmd_vdsomunge = $(objtree)/$(obj)/vdsomunge $< $@
+      cmd_vdsomunge = $(objtree)$(obj)/vdsomunge $< $@
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 23df63ec4182..1c64f1e9dd36 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -145,7 +145,7 @@ KBUILD_CPPFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 KBUILD_AFLAGS += -DKASAN_SHADOW_SCALE_SHIFT=$(KASAN_SHADOW_SCALE_SHIFT)
 
 libs-y		:= arch/arm64/lib/ $(libs-y)
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+libs-$(CONFIG_EFI_STUB) += $(objtree)drivers/firmware/efi/libstub/lib.a
 
 # Default target when executing plain make
 boot		:= arch/arm64/boot
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 467cb7117273..0fc7bec5c8ce 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -90,7 +90,7 @@ obj-y					+= head.o
 extra-y					+= vmlinux.lds
 
 ifeq ($(CONFIG_DEBUG_EFI),y)
-AFLAGS_head.o += -DVMLINUX_PATH="\"$(realpath $(objtree)/vmlinux)\""
+AFLAGS_head.o += -DVMLINUX_PATH="\"$(realpath $(objtree)vmlinux)\""
 endif
 
 # for cleaning
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 2250253a6429..113372b48a5d 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -15,7 +15,7 @@ ccflags-y += -fno-stack-protector	\
 	     $(DISABLE_STACKLEAK_PLUGIN)
 
 hostprogs := gen-hyprel
-HOST_EXTRACFLAGS += -I$(objtree)/include
+HOST_EXTRACFLAGS += -I$(objtree)include
 
 lib-objs := clear_page.o copy_page.o memcpy.o memset.o
 lib-objs := $(addprefix ../../../lib/, $(lib-objs))
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 983aa2b1629a..d5d0bd0b0b08 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -130,7 +130,7 @@ CHECKFLAGS += $(shell $(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -dM -E -x c /dev
 endif
 
 libs-y += arch/loongarch/lib/
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+libs-$(CONFIG_EFI_STUB) += $(objtree)drivers/firmware/efi/libstub/lib.a
 
 drivers-y		+= arch/loongarch/crypto/
 
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 2eaf5ad2beb6..90960f2c7e76 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -286,7 +286,7 @@ ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
 endif
 
-entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
+entry-y				= $(shell $(objtree)arch/mips/tools/elf-entry vmlinux)
 cflags-y			+= -I$(srctree)arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
@@ -530,13 +530,13 @@ endef
 .PHONY: $(generic_defconfigs)
 $(generic_defconfigs):
 	$(Q)$(CONFIG_SHELL) $(srctree)scripts/kconfig/merge_config.sh \
-		-m -O $(objtree) $(srctree)arch/$(ARCH)/configs/generic_defconfig $^ | \
+		-m -O $(objtree:%/=%) $(srctree)arch/$(ARCH)/configs/generic_defconfig $^ | \
 		grep -Ev '^#'
-	$(Q)cp $(KCONFIG_CONFIG) $(objtree)/.config.$@
+	$(Q)cp $(KCONFIG_CONFIG) $(objtree).config.$@
 	$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig \
-		KCONFIG_CONFIG=$(objtree)/.config.$@ >/dev/null
+		KCONFIG_CONFIG=$(objtree).config.$@ >/dev/null
 	$(Q)$(CONFIG_SHELL) $(srctree)arch/$(ARCH)/tools/generic-board-config.sh \
-		$(srctree:%/=%) $(objtree) $(objtree)/.config.$@ $(KCONFIG_CONFIG) \
+		$(srctree:%/=%) $(objtree:%/=%) $(objtree).config.$@ $(KCONFIG_CONFIG) \
 		"$(origin BOARDS)" $(BOARDS)
 	$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 
diff --git a/arch/mips/boot/Makefile b/arch/mips/boot/Makefile
index a11867bc02fa..2909bfc1a9fe 100644
--- a/arch/mips/boot/Makefile
+++ b/arch/mips/boot/Makefile
@@ -159,10 +159,10 @@ targets += vmlinux.lzo.itb
 
 quiet_cmd_itb-image = ITB     $@
       cmd_itb-image = \
-		env PATH="$(objtree)/scripts/dtc:$(PATH)" \
+		env PATH="$(objtree)scripts/dtc:$(PATH)" \
 		$(BASH) $(MKIMAGE) \
 		-D "-I dts -O dtb -p 500 \
-			--include $(objtree)/arch/mips \
+			--include $(objtree)arch/mips \
 			--warning no-unit_address_vs_reg" \
 		-f $(2) $@
 
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 741f195bc9e8..aee5cdd90e1e 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -111,13 +111,13 @@ quiet_cmd_zld = LD      $@
 quiet_cmd_strip = STRIP   $@
       cmd_strip = $(STRIP) -s $@
 
-$(objtree)/vmlinuz: $(src)/ld.script $(vmlinuzobjs-y) $(obj)/calc_vmlinuz_load_addr
+$(objtree)vmlinuz: $(src)/ld.script $(vmlinuzobjs-y) $(obj)/calc_vmlinuz_load_addr
 	$(call cmd,zld)
 	$(call cmd,strip)
 
-objboot := $(objtree)/arch/mips/boot
+objboot := $(objtree)arch/mips/boot
 
-$(objboot)/vmlinuz: $(objtree)/vmlinuz FORCE
+$(objboot)/vmlinuz: $(objtree)vmlinuz FORCE
 
 #
 # Some DECstations need all possible sections of an ECOFF executable
@@ -130,7 +130,7 @@ endif
 hostprogs += ../elf2ecoff
 
 ifdef CONFIG_32BIT
-	VMLINUZ = $(objtree)/vmlinuz
+	VMLINUZ = $(objtree)vmlinuz
 else
 	VMLINUZ = $(objboot)/vmlinuz.32
 endif
@@ -140,7 +140,7 @@ targets += ../vmlinuz.32
 quiet_cmd_32 = OBJCOPY $@
       cmd_32 = $(OBJCOPY) -O $(32bit-bfd) $(OBJCOPYFLAGS) $< $@
 
-$(objboot)/vmlinuz.32: $(objtree)/vmlinuz
+$(objboot)/vmlinuz.32: $(objtree)vmlinuz
 	$(call cmd,32)
 
 targets += ../vmlinuz.ecoff
@@ -155,14 +155,14 @@ targets += ../vmlinuz.bin
 
 OBJCOPYFLAGS_vmlinuz.bin := $(OBJCOPYFLAGS) -O binary
 
-$(objboot)/vmlinuz.bin: $(objtree)/vmlinuz
+$(objboot)/vmlinuz.bin: $(objtree)vmlinuz
 	$(call cmd,objcopy)
 
 targets += ../vmlinuz.srec
 
 OBJCOPYFLAGS_vmlinuz.srec := $(OBJCOPYFLAGS) -S -O srec
 
-$(objboot)/vmlinuz.srec: $(objtree)/vmlinuz
+$(objboot)/vmlinuz.srec: $(objtree)vmlinuz
 	$(call cmd,objcopy)
 
 targets += ../uzImage.bin
@@ -208,10 +208,10 @@ targets += ../vmlinuz.itb
 
 quiet_cmd_itb-image = ITB     $@
       cmd_itb-image = \
-		env PATH="$(objtree)/scripts/dtc:$(PATH)" \
+		env PATH="$(objtree)scripts/dtc:$(PATH)" \
 		$(BASH) $(MKIMAGE) \
 		-D "-I dts -O dtb -p 500 \
-			--include $(objtree)/arch/mips \
+			--include $(objtree)arch/mips \
 			--warning no-unit_address_vs_reg" \
 		-f $(2) $@
 
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 2f25adc486ec..4cb0518c2d9d 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -128,7 +128,7 @@ PALO := $(shell if (which palo 2>&1); then : ; \
 	fi)
 
 PALOCONF := $(shell if [ -f $(srctree)palo.conf ]; then echo $(srctree)palo.conf; \
-	else echo $(objtree)/palo.conf; \
+	else echo $(objtree)palo.conf; \
 	fi)
 
 palo lifimage: vmlinuz
@@ -138,7 +138,7 @@ palo lifimage: vmlinuz
 		false; \
 	fi
 	@if test ! -f "$(PALOCONF)"; then \
-		cp $(srctree)arch/parisc/defpalo.conf $(objtree)/palo.conf; \
+		cp $(srctree)arch/parisc/defpalo.conf $(objtree)palo.conf; \
 		echo 'A generic palo config file ($(objree)/palo.conf) has been created for you.'; \
 		echo 'You should check it and re-run "make palo".'; \
 		echo 'WARNING: the "lifimage" file is now placed in this directory by default!'; \
diff --git a/arch/parisc/boot/Makefile b/arch/parisc/boot/Makefile
index 657f967240ee..e677fcf441a5 100644
--- a/arch/parisc/boot/Makefile
+++ b/arch/parisc/boot/Makefile
@@ -10,7 +10,7 @@ subdir- := compressed
 $(obj)/image: vmlinux FORCE
 	$(call if_changed,objcopy)
 
-$(obj)/bzImage: $(if $(CONFIG_KERNEL_UNCOMPRESSED),$(objtree)/vmlinux,$(obj)/compressed/vmlinux) FORCE
+$(obj)/bzImage: $(if $(CONFIG_KERNEL_UNCOMPRESSED),$(objtree)vmlinux,$(obj)/compressed/vmlinux) FORCE
 	$(call if_changed,objcopy)
 
 $(obj)/compressed/vmlinux: FORCE
diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compressed/Makefile
index a294a1b58ee7..5560074b0cbd 100644
--- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -35,15 +35,15 @@ quiet_cmd_sizes = GEN $@
 $(obj)/sizes.h: vmlinux FORCE
 	$(call if_changed,sizes)
 
-AFLAGS_head.o += -I$(objtree)/$(obj) -DBOOTLOADER
+AFLAGS_head.o += -I$(objtree)$(obj) -DBOOTLOADER
 $(obj)/head.o: $(obj)/sizes.h
 
-CFLAGS_misc.o += -I$(objtree)/$(obj)
+CFLAGS_misc.o += -I$(objtree)$(obj)
 $(obj)/misc.o: $(obj)/sizes.h
 
 AFLAGS_real2.o += -DBOOTLOADER
 
-CPPFLAGS_vmlinux.lds += -I$(objtree)/$(obj) -DBOOTLOADER
+CPPFLAGS_vmlinux.lds += -I$(objtree)$(obj) -DBOOTLOADER
 $(obj)/vmlinux.lds: $(obj)/sizes.h
 
 OBJCOPYFLAGS_vmlinux.bin := -R .comment -R .note -S
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index bb3f791da736..f8cafb8aabf2 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -99,7 +99,7 @@ BOOTCFLAGS	+= -fno-stack-protector
 endif
 
 BOOTCFLAGS	+= -include $(srctree)include/linux/compiler_attributes.h
-BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)$(obj)
+BOOTCFLAGS	+= -I$(objtree)$(obj) -I$(srctree)$(obj)
 
 DTC_FLAGS	?= -p 1024
 
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 1aa3983516d8..05a5e48ce86b 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -11,7 +11,7 @@ common-objs-y += powerpc.o emulate_loadstore.o
 obj-$(CONFIG_KVM_EXIT_TIMING) += timing.o
 obj-$(CONFIG_KVM_BOOK3S_HANDLER) += book3s_exports.o
 
-AFLAGS_booke_interrupts.o := -I$(objtree)/$(obj)
+AFLAGS_booke_interrupts.o := -I$(objtree)$(obj)
 
 kvm-e500-objs := \
 	$(common-objs-y) \
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 267fbdd74613..989884c1a915 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -132,7 +132,7 @@ KBUILD_IMAGE	:= $(boot)/Image.gz
 endif
 
 libs-y += arch/riscv/lib/
-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+libs-$(CONFIG_EFI_STUB) += $(objtree)drivers/firmware/efi/libstub/lib.a
 
 ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)
diff --git a/arch/um/Makefile b/arch/um/Makefile
index 6f8eb24b04d3..2e45df97632e 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -70,15 +70,15 @@ KBUILD_AFLAGS += $(ARCH_INCLUDE)
 USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
 		$(ARCH_INCLUDE) $(MODE_INCLUDE) $(filter -I%,$(CFLAGS)) \
 		-D_FILE_OFFSET_BITS=64 -idirafter $(srctree)include \
-		-idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__
+		-idirafter $(objtree)include -D__KERNEL__ -D__UM_HOST__
 
 #This will adjust *FLAGS accordingly to the platform.
 include $(srctree)$(ARCH_DIR)/Makefile-os-Linux
 
 KBUILD_CPPFLAGS += -I$(srctree)$(HOST_DIR)/include \
 		   -I$(srctree)$(HOST_DIR)/include/uapi \
-		   -I$(objtree)/$(HOST_DIR)/include/generated \
-		   -I$(objtree)/$(HOST_DIR)/include/generated/uapi
+		   -I$(objtree)$(HOST_DIR)/include/generated \
+		   -I$(objtree)$(HOST_DIR)/include/generated/uapi
 
 # -Derrno=kernel_errno - This turns all kernel references to errno into
 # kernel_errno to separate them from the libc errno.  This allows -fno-common
diff --git a/arch/um/kernel/Makefile b/arch/um/kernel/Makefile
index c99b3d0b1014..c893d2a1a47b 100644
--- a/arch/um/kernel/Makefile
+++ b/arch/um/kernel/Makefile
@@ -36,7 +36,7 @@ targets := config.c config.tmp capflags.c
 # Be careful with the below Sed code - sed is pitfall-rich!
 # We use sed to lower build requirements, for "embedded" builders for instance.
 
-$(obj)/config.tmp: $(objtree)/.config FORCE
+$(obj)/config.tmp: $(objtree).config FORCE
 	$(call if_changed,quote1)
 
 quiet_cmd_quote1 = QUOTE   $@
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 473c46ffb7f3..14716d6012a6 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -284,8 +284,8 @@ ifeq ($(CONFIG_X86_DECODER_SELFTEST),y)
 	$(Q)$(MAKE) $(build)=arch/x86/tools posttest
 endif
 	$(Q)$(MAKE) $(build)=$(boot) $(KBUILD_IMAGE)
-	$(Q)mkdir -p $(objtree)/arch/$(UTS_MACHINE)/boot
-	$(Q)ln -fsn ../../x86/boot/bzImage $(objtree)/arch/$(UTS_MACHINE)/boot/$@
+	$(Q)mkdir -p $(objtree)arch/$(UTS_MACHINE)/boot
+	$(Q)ln -fsn ../../x86/boot/bzImage $(objtree)arch/$(UTS_MACHINE)/boot/$@
 
 $(BOOT_TARGETS): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $@
@@ -322,8 +322,8 @@ archprepare: $(orc_hash_h)
 endif
 
 archclean:
-	$(Q)rm -rf $(objtree)/arch/i386
-	$(Q)rm -rf $(objtree)/arch/x86_64
+	$(Q)rm -rf $(objtree)arch/i386
+	$(Q)rm -rf $(objtree)arch/x86_64
 
 define archhelp
   echo  '* bzImage		- Compressed kernel image (arch/x86/boot/bzImage)'
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 6be0a94013cf..c1666938b30f 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -99,7 +99,7 @@ $(obj)/zoffset.h: $(obj)/compressed/vmlinux FORCE
 	$(call if_changed,zoffset)
 
 
-AFLAGS_header.o += -I$(objtree)/$(obj)
+AFLAGS_header.o += -I$(objtree)$(obj)
 $(obj)/header.o: $(obj)/zoffset.h
 
 LDFLAGS_setup.elf	:= -m elf_i386 -z noexecstack -T
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 1cf9666f3d6e..583212d0961f 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -54,9 +54,9 @@ KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
 KBUILD_CFLAGS += -include $(srctree)include/linux/hidden.h
 
 # sev.c indirectly includes inat-table.h which is generated during
-# compilation and stored in $(objtree). Add the directory to the includes so
+# compilation and stored in $(objtree:%/=%). Add the directory to the includes so
 # that the compiler finds it even with out-of-tree builds (make O=/some/path).
-CFLAGS_sev.o += -I$(objtree)/arch/x86/lib/
+CFLAGS_sev.o += -I$(objtree)arch/x86/lib/
 
 KBUILD_AFLAGS  := $(KBUILD_CFLAGS) -D__ASSEMBLY__
 GCOV_PROFILE := n
@@ -116,7 +116,7 @@ vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/mem.o
 
 vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
 vmlinux-objs-$(CONFIG_EFI_MIXED) += $(obj)/efi_mixed.o
-vmlinux-objs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
+vmlinux-objs-$(CONFIG_EFI_STUB) += $(objtree)drivers/firmware/efi/libstub/lib.a
 
 $(obj)/vmlinux: $(vmlinux-objs-y) FORCE
 	$(call if_changed,ld)
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index 61f038b91bda..da6d7f292d29 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -51,7 +51,7 @@ targets += realmode.lds
 $(obj)/realmode.lds: $(obj)/pasyms.h
 
 LDFLAGS_realmode.elf := -m elf_i386 --emit-relocs -T
-CPPFLAGS_realmode.lds += -P -C -I$(objtree)/$(obj)
+CPPFLAGS_realmode.lds += -P -C -I$(objtree)$(obj)
 
 targets += realmode.elf
 $(obj)/realmode.elf: $(obj)/realmode.lds $(REALMODE_OBJS) FORCE
diff --git a/arch/x86/tools/Makefile b/arch/x86/tools/Makefile
index 224c6f3c48a5..39a89339371a 100644
--- a/arch/x86/tools/Makefile
+++ b/arch/x86/tools/Makefile
@@ -17,7 +17,7 @@ reformatter = $(srctree)arch/x86/tools/objdump_reformat.awk
 chkobjdump = $(srctree)arch/x86/tools/chkobjdump.awk
 
 quiet_cmd_posttest = TEST    $@
-      cmd_posttest = $(OBJDUMP) -d -j .text $(objtree)/vmlinux | $(AWK) -f $(reformatter) | $(obj)/insn_decoder_test $(posttest_64bit) $(posttest_verbose)
+      cmd_posttest = $(OBJDUMP) -d -j .text $(objtree)vmlinux | $(AWK) -f $(reformatter) | $(obj)/insn_decoder_test $(posttest_64bit) $(posttest_verbose)
 
 quiet_cmd_sanitytest = TEST    $@
       cmd_sanitytest = $(obj)/insn_sanity $(posttest_64bit) -m 1000000
@@ -29,14 +29,14 @@ posttest: $(obj)/insn_decoder_test vmlinux $(obj)/insn_sanity
 hostprogs += insn_decoder_test insn_sanity
 
 # -I needed for generated C source and C source which in the kernel tree.
-HOSTCFLAGS_insn_decoder_test.o := -Wall -I$(srctree)tools/arch/x86/lib/ -I$(srctree)tools/arch/x86/include/ -I$(objtree)/arch/x86/lib/
+HOSTCFLAGS_insn_decoder_test.o := -Wall -I$(srctree)tools/arch/x86/lib/ -I$(srctree)tools/arch/x86/include/ -I$(objtree)arch/x86/lib/
 
-HOSTCFLAGS_insn_sanity.o := -Wall -I$(srctree)tools/arch/x86/lib/ -I$(srctree)tools/arch/x86/include/ -I$(objtree)/arch/x86/lib/
+HOSTCFLAGS_insn_sanity.o := -Wall -I$(srctree)tools/arch/x86/lib/ -I$(srctree)tools/arch/x86/include/ -I$(objtree)arch/x86/lib/
 
 # Dependencies are also needed.
-$(obj)/insn_decoder_test.o: $(srctree)tools/arch/x86/lib/insn.c $(srctree)tools/arch/x86/lib/inat.c $(srctree)tools/arch/x86/include/asm/inat_types.h $(srctree)tools/arch/x86/include/asm/inat.h $(srctree)tools/arch/x86/include/asm/insn.h $(objtree)/arch/x86/lib/inat-tables.c
+$(obj)/insn_decoder_test.o: $(srctree)tools/arch/x86/lib/insn.c $(srctree)tools/arch/x86/lib/inat.c $(srctree)tools/arch/x86/include/asm/inat_types.h $(srctree)tools/arch/x86/include/asm/inat.h $(srctree)tools/arch/x86/include/asm/insn.h $(objtree)arch/x86/lib/inat-tables.c
 
-$(obj)/insn_sanity.o: $(srctree)tools/arch/x86/lib/insn.c $(srctree)tools/arch/x86/lib/inat.c $(srctree)tools/arch/x86/include/asm/inat_types.h $(srctree)tools/arch/x86/include/asm/inat.h $(srctree)tools/arch/x86/include/asm/insn.h $(objtree)/arch/x86/lib/inat-tables.c
+$(obj)/insn_sanity.o: $(srctree)tools/arch/x86/lib/insn.c $(srctree)tools/arch/x86/lib/inat.c $(srctree)tools/arch/x86/include/asm/inat_types.h $(srctree)tools/arch/x86/include/asm/inat.h $(srctree)tools/arch/x86/include/asm/insn.h $(objtree)arch/x86/lib/inat-tables.c
 
 HOST_EXTRACFLAGS += -I$(srctree)tools/include
 hostprogs	+= relocs
diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
index a8b73dfb17fb..6565242b0419 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -50,7 +50,7 @@ AFLAGS_zboot-header.o += -DMACHINE_TYPE=IMAGE_FILE_MACHINE_$(EFI_ZBOOT_MACH_TYPE
 $(obj)/zboot-header.o: $(srctree)drivers/firmware/efi/libstub/zboot-header.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a
+ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)drivers/firmware/efi/libstub/lib.a
 
 LDFLAGS_vmlinuz.efi.elf := -T $(srctree)drivers/firmware/efi/libstub/zboot.lds
 $(obj)/vmlinuz.efi.elf: $(obj)/vmlinuz.o $(ZBOOT_DEPS) FORCE
diff --git a/drivers/scsi/aic7xxx/Makefile b/drivers/scsi/aic7xxx/Makefile
index 1928c3ff81fe..e16db3f12ef9 100644
--- a/drivers/scsi/aic7xxx/Makefile
+++ b/drivers/scsi/aic7xxx/Makefile
@@ -59,7 +59,7 @@ $(obj)/aic7xxx_seq.h: $(src)/aic7xxx.seq $(src)/aic7xxx.reg $(obj)/aicasm/aicasm
 			      $(aicasm-7xxx-opts-y) -o $(obj)/aic7xxx_seq.h \
 			      $(srctree)$(src)/aic7xxx.seq
 
-$(aic7xxx-gen-y): $(objtree)/$(obj)/aic7xxx_seq.h
+$(aic7xxx-gen-y): $(objtree)$(obj)/aic7xxx_seq.h
 	@true
 else
 $(obj)/aic7xxx_reg_print.c: $(src)/aic7xxx_reg_print.c_shipped
@@ -77,7 +77,7 @@ $(obj)/aic79xx_seq.h: $(src)/aic79xx.seq $(src)/aic79xx.reg $(obj)/aicasm/aicasm
 			      $(aicasm-79xx-opts-y) -o $(obj)/aic79xx_seq.h \
 			      $(srctree)$(src)/aic79xx.seq
 
-$(aic79xx-gen-y): $(objtree)/$(obj)/aic79xx_seq.h
+$(aic79xx-gen-y): $(objtree)$(obj)/aic79xx_seq.h
 	@true
 else
 $(obj)/aic79xx_reg_print.c: $(src)/aic79xx_reg_print.c_shipped
diff --git a/kernel/gcov/Makefile b/kernel/gcov/Makefile
index 0c53d1930044..6a9ce19b793e 100644
--- a/kernel/gcov/Makefile
+++ b/kernel/gcov/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -DSRCTREE='"$(srctree:%/=%)"' -DOBJTREE='"$(objtree)"'
+ccflags-y := -DSRCTREE='"$(srctree:%/=%)"' -DOBJTREE='"$(objtree:%/=%)"'
 
 obj-y := base.o fs.o
 obj-$(CONFIG_CC_IS_GCC) += gcc_base.o gcc_4_7.o
diff --git a/rust/Makefile b/rust/Makefile
index 749619e4cfc3..c0d0765a821b 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # Where to place rustdoc generated documentation
-rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
+rustdoc_output := $(objtree)Documentation/output/rust/rustdoc
 
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o
 always-$(CONFIG_RUST) += exports_core_generated.h
@@ -75,11 +75,11 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abs_objtree) \
 	$(RUSTDOC) $(if $(rustdoc_host),$(rust_common_flags),$(rust_flags)) \
-		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		$(rustc_target_flags) -L$(objtree)$(obj) \
 		--output $(rustdoc_output) \
 		--crate-name $(subst rustdoc-,,$@) \
 		$(if $(rustdoc_host),,--sysroot=/dev/null) \
-		@$(objtree)/include/generated/rustc_cfg $<
+		@$(objtree)include/generated/rustc_cfg $<
 
 # The `html_logo_url` and `html_favicon_url` forms of the `doc` attribute
 # can be used to specify a custom logo. However:
@@ -127,7 +127,7 @@ rustdoc-alloc: $(src)/alloc/lib.rs rustdoc-core rustdoc-compiler_builtins FORCE
 	$(call if_changed,rustdoc)
 
 rustdoc-kernel: private rustc_target_flags = --extern alloc \
-    --extern build_error --extern macros=$(objtree)/$(obj)/libmacros.so \
+    --extern build_error --extern macros=$(objtree)$(obj)/libmacros.so \
     --extern bindings --extern uapi
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-macros \
     rustdoc-compiler_builtins rustdoc-alloc $(obj)/libmacros.so \
@@ -138,11 +138,11 @@ quiet_cmd_rustc_test_library = RUSTC TL $<
       cmd_rustc_test_library = \
 	OBJTREE=$(abs_objtree) \
 	$(RUSTC) $(rust_common_flags) \
-		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
+		@$(objtree)include/generated/rustc_cfg $(rustc_target_flags) \
 		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
-		--out-dir $(objtree)/$(obj)/test --cfg testlib \
-		--sysroot $(objtree)/$(obj)/test/sysroot \
-		-L$(objtree)/$(obj)/test \
+		--out-dir $(objtree)$(obj)/test --cfg testlib \
+		--sysroot $(objtree)$(obj)/test/sysroot \
+		-L$(objtree)$(obj)/test \
 		--crate-name $(subst rusttest-,,$(subst rusttestlib-,,$@)) $<
 
 rusttestlib-build_error: $(src)/build_error.rs rusttest-prepare FORCE
@@ -163,32 +163,32 @@ quiet_cmd_rustdoc_test = RUSTDOC T $<
       cmd_rustdoc_test = \
 	OBJTREE=$(abs_objtree) \
 	$(RUSTDOC) --test $(rust_common_flags) \
-		@$(objtree)/include/generated/rustc_cfg \
+		@$(objtree)include/generated/rustc_cfg \
 		$(rustc_target_flags) $(rustdoc_test_target_flags) \
-		--sysroot $(objtree)/$(obj)/test/sysroot $(rustdoc_test_quiet) \
-		-L$(objtree)/$(obj)/test --output $(rustdoc_output) \
+		--sysroot $(objtree)$(obj)/test/sysroot $(rustdoc_test_quiet) \
+		-L$(objtree)$(obj)/test --output $(rustdoc_output) \
 		--crate-name $(subst rusttest-,,$@) $<
 
 quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
       cmd_rustdoc_test_kernel = \
-	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
-	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
+	rm -rf $(objtree)$(obj)/test/doctests/kernel; \
+	mkdir -p $(objtree)$(obj)/test/doctests/kernel; \
 	OBJTREE=$(abs_objtree) \
 	$(RUSTDOC) --test $(rust_flags) \
-		@$(objtree)/include/generated/rustc_cfg \
-		-L$(objtree)/$(obj) --extern alloc --extern kernel \
+		@$(objtree)include/generated/rustc_cfg \
+		-L$(objtree)$(obj) --extern alloc --extern kernel \
 		--extern build_error --extern macros \
 		--extern bindings --extern uapi \
 		--no-run --crate-name kernel -Zunstable-options \
 		--sysroot=/dev/null \
-		--test-builder $(objtree)/scripts/rustdoc_test_builder \
+		--test-builder $(objtree)scripts/rustdoc_test_builder \
 		$< $(rustdoc_test_kernel_quiet); \
-	$(objtree)/scripts/rustdoc_test_gen
+	$(objtree)scripts/rustdoc_test_gen
 
 %/doctests_kernel_generated.rs %/doctests_kernel_generated_kunit.c: \
     $(src)/kernel/lib.rs $(obj)/kernel.o \
-    $(objtree)/scripts/rustdoc_test_builder \
-    $(objtree)/scripts/rustdoc_test_gen FORCE
+    $(objtree)scripts/rustdoc_test_builder \
+    $(objtree)scripts/rustdoc_test_gen FORCE
 	$(call if_changed,rustdoc_test_kernel)
 
 # We cannot use `-Zpanic-abort-tests` because some tests are dynamic,
@@ -197,12 +197,12 @@ quiet_cmd_rustc_test = RUSTC T  $<
       cmd_rustc_test = \
 	OBJTREE=$(abs_objtree) \
 	$(RUSTC) --test $(rust_common_flags) \
-		@$(objtree)/include/generated/rustc_cfg \
-		$(rustc_target_flags) --out-dir $(objtree)/$(obj)/test \
-		--sysroot $(objtree)/$(obj)/test/sysroot \
-		-L$(objtree)/$(obj)/test \
+		@$(objtree)include/generated/rustc_cfg \
+		$(rustc_target_flags) --out-dir $(objtree)$(obj)/test \
+		--sysroot $(objtree)$(obj)/test/sysroot \
+		-L$(objtree)$(obj)/test \
 		--crate-name $(subst rusttest-,,$@) $<; \
-	$(objtree)/$(obj)/test/$(subst rusttest-,,$@) $(rust_test_quiet) \
+	$(objtree)$(obj)/test/$(subst rusttest-,,$@) $(rust_test_quiet) \
 		$(rustc_test_run_flags)
 
 rusttest: rusttest-macros rusttest-kernel
@@ -236,22 +236,22 @@ rusttest: rusttest-macros rusttest-kernel
 #     `-Zbuild-std` and related hacks are not needed.
 quiet_cmd_rustsysroot = RUSTSYSROOT
       cmd_rustsysroot = \
-	rm -rf $(objtree)/$(obj)/test; \
-	mkdir -p $(objtree)/$(obj)/test; \
-	cp -a $(rustc_sysroot) $(objtree)/$(obj)/test/sysroot; \
+	rm -rf $(objtree)$(obj)/test; \
+	mkdir -p $(objtree)$(obj)/test; \
+	cp -a $(rustc_sysroot) $(objtree)$(obj)/test/sysroot; \
 	cp -r $(srctree)$(src)/alloc/* \
-		$(objtree)/$(obj)/test/sysroot/lib/rustlib/src/rust/library/alloc/src; \
-	echo '\#!/bin/sh' > $(objtree)/$(obj)/test/rustc_sysroot; \
+		$(objtree)$(obj)/test/sysroot/lib/rustlib/src/rust/library/alloc/src; \
+	echo '\#!/bin/sh' > $(objtree)$(obj)/test/rustc_sysroot; \
 	echo "$(RUSTC) --sysroot=$(abs_objtree)/$(obj)/test/sysroot \"\$$@\"" \
-		>> $(objtree)/$(obj)/test/rustc_sysroot; \
-	chmod u+x $(objtree)/$(obj)/test/rustc_sysroot; \
-	$(CARGO) -q new $(objtree)/$(obj)/test/dummy; \
-	RUSTC=$(objtree)/$(obj)/test/rustc_sysroot $(CARGO) $(cargo_quiet) \
+		>> $(objtree)$(obj)/test/rustc_sysroot; \
+	chmod u+x $(objtree)$(obj)/test/rustc_sysroot; \
+	$(CARGO) -q new $(objtree)$(obj)/test/dummy; \
+	RUSTC=$(objtree)$(obj)/test/rustc_sysroot $(CARGO) $(cargo_quiet) \
 		test -Zbuild-std --target $(rustc_host_target) \
-		--manifest-path $(objtree)/$(obj)/test/dummy/Cargo.toml; \
-	rm $(objtree)/$(obj)/test/sysroot/lib/rustlib/$(rustc_host_target)/lib/*; \
-	cp $(objtree)/$(obj)/test/dummy/target/$(rustc_host_target)/debug/deps/* \
-		$(objtree)/$(obj)/test/sysroot/lib/rustlib/$(rustc_host_target)/lib
+		--manifest-path $(objtree)$(obj)/test/dummy/Cargo.toml; \
+	rm $(objtree)$(obj)/test/sysroot/lib/rustlib/$(rustc_host_target)/lib/*; \
+	cp $(objtree)$(obj)/test/dummy/target/$(rustc_host_target)/debug/deps/* \
+		$(objtree)$(obj)/test/sysroot/lib/rustlib/$(rustc_host_target)/lib
 
 rusttest-prepare: FORCE
 	$(call if_changed,rustsysroot)
@@ -360,7 +360,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_flags = \
     --blocklist-type '.*' --allowlist-var '' \
     --allowlist-function 'rust_helper_.*'
 $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_cflags = \
-    -I$(objtree)/$(obj) -Wno-missing-prototypes -Wno-missing-declarations
+    -I$(objtree)$(obj) -Wno-missing-prototypes -Wno-missing-declarations
 $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ; \
     sed -Ei 's/pub fn rust_helper_([a-zA-Z0-9_]*)/#[link_name="rust_helper_\1"]\n    pub fn \1/g' $@
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
@@ -405,7 +405,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=obj=$@ \
 		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
-		--crate-type rlib -L$(objtree)/$(obj) \
+		--crate-type rlib -L$(objtree)$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
 		--sysroot=/dev/null \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
@@ -415,7 +415,7 @@ rust-analyzer:
 		--cfgs='core=$(core-cfgs)' --cfgs='alloc=$(alloc-cfgs)' \
 		$(abs_srctree) $(abs_objtree) \
 		$(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
-		$(if $(KBUILD_EXTMOD),$(extmod_prefix),$(objtree))/rust-project.json
+		$(if $(KBUILD_EXTMOD),$(extmod_prefix),$(objtree:%/=%))/rust-project.json
 
 redirect-intrinsics = \
 	__addsf3 __eqsf2 __gesf2 __lesf2 __ltsf2 __mulsf3 __nesf2 __unordsf2 \
diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index e3951cfe3d10..9b7a7d48def7 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -176,7 +176,7 @@ TPROGS_CFLAGS += $(call try-run,\
 	printf "int main() { return 0; }" |\
 	$(CC) -Werror -fsanitize=bounds -x c - -o "$$TMP",-fsanitize=bounds,)
 
-TPROGS_CFLAGS += -I$(objtree)/usr/include
+TPROGS_CFLAGS += -I$(objtree)usr/include
 TPROGS_CFLAGS += -I$(srctree)tools/testing/selftests/bpf/
 TPROGS_CFLAGS += -I$(LIBBPF_INCLUDE)
 TPROGS_CFLAGS += -I$(srctree)tools/include
diff --git a/samples/bpf/Makefile.target b/samples/bpf/Makefile.target
index 7621f55e2947..399f46ed77de 100644
--- a/samples/bpf/Makefile.target
+++ b/samples/bpf/Makefile.target
@@ -40,10 +40,10 @@ tprog-cobjs	:= $(addprefix $(obj)/,$(tprog-cobjs))
 _tprogc_flags   = $(TPROGS_CFLAGS) \
                  $(TPROGCFLAGS_$(basetarget).o)
 
-# $(objtree)/$(obj) for including generated headers from checkin source files
+# $(objtree)$(obj) for including generated headers from checkin source files
 ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
-_tprogc_flags   += -I $(objtree)/$(obj)
+_tprogc_flags   += -I $(objtree)$(obj)
 endif
 endif
 
diff --git a/samples/hid/Makefile b/samples/hid/Makefile
index 28078ce84d65..da7d37138b85 100644
--- a/samples/hid/Makefile
+++ b/samples/hid/Makefile
@@ -45,7 +45,7 @@ TPROGS_CFLAGS += -Wall -O2
 TPROGS_CFLAGS += -Wmissing-prototypes
 TPROGS_CFLAGS += -Wstrict-prototypes
 
-TPROGS_CFLAGS += -I$(objtree)/usr/include
+TPROGS_CFLAGS += -I$(objtree)usr/include
 TPROGS_CFLAGS += -I$(LIBBPF_INCLUDE)
 TPROGS_CFLAGS += -I$(srctree)tools/include
 
diff --git a/samples/hid/Makefile.target b/samples/hid/Makefile.target
index 7621f55e2947..399f46ed77de 100644
--- a/samples/hid/Makefile.target
+++ b/samples/hid/Makefile.target
@@ -40,10 +40,10 @@ tprog-cobjs	:= $(addprefix $(obj)/,$(tprog-cobjs))
 _tprogc_flags   = $(TPROGS_CFLAGS) \
                  $(TPROGCFLAGS_$(basetarget).o)
 
-# $(objtree)/$(obj) for including generated headers from checkin source files
+# $(objtree)$(obj) for including generated headers from checkin source files
 ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
-_tprogc_flags   += -I $(objtree)/$(obj)
+_tprogc_flags   += -I $(objtree)$(obj)
 endif
 endif
 
-- 
2.39.2


