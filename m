Return-Path: <linux-kbuild+bounces-12733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKJzH49212nTOAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12733-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 11:51:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6D03C8B82
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 11:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 313EA3083FCA
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 09:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B44D3B2FE3;
	Thu,  9 Apr 2026 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKTWW/KL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C903B4EB7
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728078; cv=none; b=ipje3j6eJJLQ/PJVtxykV4qaLJsWd/xSiGRPzgLSKM9jdV89pbAZ146p3ZsHuAktYUP72l70tu3scRTrmRiKlhrMZ0u8SZgTmgibzQogCIuNN4obaSDJ3wwOEnffQMQjKSiiZ/Zn4/UHDIl4IAE2UJOUSRz0OBTt1eMpbZ2cfvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728078; c=relaxed/simple;
	bh=lUWl+lC3ZTWfbfqCkq6mjsraLHT8mZsonHU35/L8+oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrIzLYYB7yHQvL1XOPrlqeYdnoSJT80J2DrLgZxZDcrvsJMS64j1nYZujWVHWmZatGXMJ9TiEr77rHEb+RLZKtjSkiIPi43hgAAFY3fRAGRcGoraFttr8tLEjDjN4MQ+5uWzPzlB0SpiL7TpB4ZxxiQsnkSJ1X2f86bvL0hxFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKTWW/KL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775728076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ql7/MeeYApvFYdz7A8mWP+9mGYFWCC0ombyyXlvAi20=;
	b=aKTWW/KL15++NuZKknOiQVxdni1fb3c8/v1Kt2oy9SzGb6+yUDkZzuGuWwBNSwhi2U/G0w
	KhhHMLb7RU5RAIV0gaSab843976Wa/sz6j4tZArtbQTRCpAL6fBUEedRjatKMiOb5zSrkm
	A1lDv6mIZE7z52bnJ4OXdzBaohlvuDg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-pnPby-BDMneIUUCstvaPUg-1; Thu,
 09 Apr 2026 05:47:52 -0400
X-MC-Unique: pnPby-BDMneIUUCstvaPUg-1
X-Mimecast-MFC-AGG-ID: pnPby-BDMneIUUCstvaPUg_1775728071
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E30A180049F;
	Thu,  9 Apr 2026 09:47:51 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.155])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF2F53000C1B;
	Thu,  9 Apr 2026 09:47:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 8/8] treewide: Stop defining __ASSEMBLY__ for assembler files
Date: Thu,  9 Apr 2026 11:47:08 +0200
Message-ID: <20260409094708.1687376-9-thuth@redhat.com>
In-Reply-To: <20260409094708.1687376-1-thuth@redhat.com>
References: <20260409094708.1687376-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12733-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thuth@redhat.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E6D03C8B82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thomas Huth <thuth@redhat.com>

All spots have been changed to __ASSEMBLER__ (i.e. the macro that
gets defined by the compiler), so we don't have to manually define
__ASSEMBLY__ now anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile                                         | 2 +-
 arch/arm64/kernel/vdso32/Makefile                | 1 -
 arch/loongarch/vdso/Makefile                     | 2 +-
 arch/mips/boot/compressed/Makefile               | 2 +-
 arch/mips/vdso/Makefile                          | 2 +-
 arch/powerpc/boot/Makefile                       | 2 +-
 arch/powerpc/platforms/cell/spufs/Makefile       | 2 +-
 arch/s390/Makefile                               | 2 +-
 arch/x86/boot/Makefile                           | 2 +-
 arch/x86/boot/compressed/Makefile                | 2 +-
 arch/x86/realmode/rm/Makefile                    | 2 +-
 arch/xtensa/kernel/Makefile                      | 2 +-
 drivers/firmware/efi/libstub/Makefile            | 2 +-
 drivers/net/wan/Makefile                         | 2 +-
 scripts/Makefile.build                           | 2 +-
 scripts/gfp-translate                            | 2 +-
 tools/testing/selftests/kvm/lib/riscv/handlers.S | 4 ----
 tools/testing/selftests/vDSO/vgetrandom-chacha.S | 2 --
 18 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index 4f54c56856386..b7cf60d7024dd 100644
--- a/Makefile
+++ b/Makefile
@@ -585,7 +585,7 @@ LINUXINCLUDE    := \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
 
-KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
+KBUILD_AFLAGS   := -fno-PIE
 
 KBUILD_CFLAGS :=
 KBUILD_CFLAGS += -std=gnu11
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 9d0efed91414c..6e6295f5983dc 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -82,7 +82,6 @@ VDSO_CFLAGS += -marm
 endif
 
 VDSO_AFLAGS := $(VDSO_CAFLAGS)
-VDSO_AFLAGS += -D__ASSEMBLY__
 
 # From arm vDSO Makefile
 VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 294c16b9517fd..b3e37d3323cd2 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -29,7 +29,7 @@ cflags-vdso := $(ccflags-vdso) \
 	$(call cc-option, -fasynchronous-unwind-tables) \
 	$(call cc-option, -fno-stack-protector)
 aflags-vdso := $(ccflags-vdso) \
-	-D__ASSEMBLY__ -Wa,-gdwarf-2
+	-Wa,-gdwarf-2
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index e0b8ec9a95162..41ec115d4795b 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -30,7 +30,7 @@ endif
 KBUILD_CFLAGS := $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
 
-KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
+KBUILD_AFLAGS := $(KBUILD_AFLAGS) \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) \
 	-DKERNEL_ENTRY=$(VMLINUX_ENTRY_ADDRESS)
 
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 69d4593f64fee..d6685a36c6b43 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -33,7 +33,7 @@ cflags-vdso := $(ccflags-vdso) \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
 	$(call cc-option, -fno-asynchronous-unwind-tables)
 aflags-vdso := $(ccflags-vdso) \
-	-D__ASSEMBLY__ -Wa,-gdwarf-2
+	-Wa,-gdwarf-2
 
 ifneq ($(c-gettimeofday-y),)
 CFLAGS_vgettimeofday.o = -include $(c-gettimeofday-y)
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index f1a4761ebd44b..5a75d4fd468cb 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -80,7 +80,7 @@ BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
 		   $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
 		   -fomit-frame-pointer -fno-builtin -fPIC
 
-BOOTAFLAGS	:= $(BOOTTARGETFLAGS) -D__ASSEMBLY__
+BOOTAFLAGS	:= $(BOOTTARGETFLAGS)
 
 BOOTARFLAGS	:= -crD
 
diff --git a/arch/powerpc/platforms/cell/spufs/Makefile b/arch/powerpc/platforms/cell/spufs/Makefile
index 52e4c80ec8d03..c13928aea20c6 100644
--- a/arch/powerpc/platforms/cell/spufs/Makefile
+++ b/arch/powerpc/platforms/cell/spufs/Makefile
@@ -16,7 +16,7 @@ SPU_AS		:= $(SPU_CROSS)gcc
 SPU_LD		:= $(SPU_CROSS)ld
 SPU_OBJCOPY	:= $(SPU_CROSS)objcopy
 SPU_CFLAGS	:= -O2 -Wall -I$(srctree)/include -D__KERNEL__
-SPU_AFLAGS	:= -c -D__ASSEMBLY__ -I$(srctree)/include -D__KERNEL__
+SPU_AFLAGS	:= -c -I$(srctree)/include -D__KERNEL__
 SPU_LDFLAGS	:= -N -Ttext=0x0
 
 $(obj)/switch.o: $(obj)/spu_save_dump.h $(obj)/spu_restore_dump.h
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index d78ad6885ca2a..4fef55ae6e903 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -18,7 +18,7 @@ KBUILD_CFLAGS	+= -fPIC
 LDFLAGS_vmlinux	:= $(call ld-option,-no-pie)
 extra_tools	:= relocs
 aflags_dwarf	:= -Wa,-gdwarf-2
-KBUILD_AFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64 -D__ASSEMBLY__
+KBUILD_AFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64
 ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),$(aflags_dwarf))
 endif
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 3f9fb3698d669..b343ef5ee9951 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -52,7 +52,7 @@ targets += cpustr.h
 # ---------------------------------------------------------------------------
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
-KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index b8b2b7bea1d31..a0bf38874c2de 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -52,7 +52,7 @@ KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 # that the compiler finds it even with out-of-tree builds (make O=/some/path).
 CFLAGS_sev-handle-vc.o += -I$(objtree)/arch/x86/lib/
 
-KBUILD_AFLAGS  := $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS  := $(KBUILD_CFLAGS)
 
 KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
 KBUILD_LDFLAGS += $(call ld-option,--no-ld-generated-unwind-info)
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index a0fb39abc5c86..20bbe1af05acd 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -65,5 +65,5 @@ $(obj)/realmode.relocs: $(obj)/realmode.elf FORCE
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP -D_WAKEUP \
 		   -I$(srctree)/arch/x86/boot
-KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
diff --git a/arch/xtensa/kernel/Makefile b/arch/xtensa/kernel/Makefile
index d3ef0407401f6..ece4ae6dea97d 100644
--- a/arch/xtensa/kernel/Makefile
+++ b/arch/xtensa/kernel/Makefile
@@ -39,7 +39,7 @@ sed-y = -e ':a; s/\*(\([^)]*\)\.text\.unlikely/*(\1.literal.unlikely .{text}.unl
 	-e 's/\.{text}/.text/g'
 
 quiet_cmd__cpp_lds_S = LDS     $@
-cmd__cpp_lds_S = $(CPP) $(cpp_flags) -P -C -Uxtensa -D__ASSEMBLY__ \
+cmd__cpp_lds_S = $(CPP) $(cpp_flags) -P -C -Uxtensa \
 		 -DLINKER_SCRIPT $< | sed $(sed-y) >$@
 
 $(obj)/vmlinux.lds: $(src)/vmlinux.lds.S FORCE
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index e386ffd009b7e..33e83e39a7f48 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -62,7 +62,7 @@ KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 # `-fdata-sections` flag from KBUILD_CFLAGS_KERNEL
 KBUILD_CFLAGS_KERNEL := $(filter-out -fdata-sections, $(KBUILD_CFLAGS_KERNEL))
 
-KBUILD_AFLAGS			:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
+KBUILD_AFLAGS			:= $(KBUILD_CFLAGS)
 
 lib-y				:= efi-stub-helper.o gop.o secureboot.o tpm.o \
 				   file.o mem.o random.o randomalloc.o pci.o \
diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
index 00e9b7ee1e012..4233143534465 100644
--- a/drivers/net/wan/Makefile
+++ b/drivers/net/wan/Makefile
@@ -57,7 +57,7 @@ $(obj)/wanxlfw.bin: $(obj)/wanxlfw.o FORCE
 	$(call if_changed,m68kld_bin_o)
 
 quiet_cmd_m68kas_o_S = M68KAS  $@
-      cmd_m68kas_o_S = $(M68KCC) -D__ASSEMBLY__ -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $@ $<
+      cmd_m68kas_o_S = $(M68KCC) -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $@ $<
 
 $(obj)/wanxlfw.o: $(src)/wanxlfw.S FORCE
 	$(call if_changed_dep,m68kas_o_S)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3652b85be5459..df26ed7905d08 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -441,7 +441,7 @@ targets += $(lib-y) $(always-y)
 # ---------------------------------------------------------------------------
 quiet_cmd_cpp_lds_S = LDS     $@
       cmd_cpp_lds_S = $(CPP) $(cpp_flags) -P -U$(ARCH) \
-	                     -D__ASSEMBLY__ -DLINKER_SCRIPT -o $@ $<
+	                     -DLINKER_SCRIPT -o $@ $<
 
 $(obj)/%.lds: $(src)/%.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
diff --git a/scripts/gfp-translate b/scripts/gfp-translate
index 8385ae0d5af93..f6353795fdca3 100755
--- a/scripts/gfp-translate
+++ b/scripts/gfp-translate
@@ -73,7 +73,7 @@ echo Parsing: $GFPMASK
 #include <stdio.h>
 
 // Try to fool compiler.h into not including extra stuff
-#define __ASSEMBLY__	1
+#define __ASSEMBLER__	1
 
 #include <generated/autoconf.h>
 #include <linux/gfp_types.h>
diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
index b787b982e922a..c8cc2d695f483 100644
--- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
+++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
@@ -3,10 +3,6 @@
  * Copyright (c) 2023 Intel Corporation
  */
 
-#ifndef __ASSEMBLY__
-#define __ASSEMBLY__
-#endif
-
 #include <asm/csr.h>
 
 .macro save_context
diff --git a/tools/testing/selftests/vDSO/vgetrandom-chacha.S b/tools/testing/selftests/vDSO/vgetrandom-chacha.S
index 16f985b089d45..42839c5cf5ec4 100644
--- a/tools/testing/selftests/vDSO/vgetrandom-chacha.S
+++ b/tools/testing/selftests/vDSO/vgetrandom-chacha.S
@@ -3,8 +3,6 @@
  * Copyright (C) 2024 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
-#define __ASSEMBLY__
-
 #if defined(__aarch64__)
 #include "../../../../arch/arm64/kernel/vdso/vgetrandom-chacha.S"
 #elif defined(__loongarch__)
-- 
2.53.0


