Return-Path: <linux-kbuild+bounces-4605-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3C9C304E
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D1D21C2090D
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C786B1474B9;
	Sun, 10 Nov 2024 01:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEh8VqkP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35C1474A4;
	Sun, 10 Nov 2024 01:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202621; cv=none; b=rd6qhNXUafIcERF0RUNvywHChny9jLnjmRh/sJhPsrC4PpWwLE4oBKUKr2sSjAn7Qk93RCnHMk8XEvokQcVzEVmLeTo+LpougB2mXQTONCcWKDFF7JI/v1W8CVHMVB6KQLKUWxXGbEm8hPxOFPiuT0xj3HVnpGv38ca+3wOKJxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202621; c=relaxed/simple;
	bh=6i1YYERXoeK4NchDSXf7fBlYYK9mmrlTiZyLP0h7vss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmPoa18T2Iyla4yj6h9CDtucJFo91+9bWielrK4j4LbAsCk1UgU43Hj8e9mXwo1Uw8REyFgW/faE2C4rcUNxPpXQXFMunMIv3vNF4Mxvpx4pVcqexPiYzuyJ0KvcSbt3TYTU3BYULjLy1QzfDEZc1fuLzOp+UAvZRKSzNcjNz9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEh8VqkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1433C4CED4;
	Sun, 10 Nov 2024 01:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202621;
	bh=6i1YYERXoeK4NchDSXf7fBlYYK9mmrlTiZyLP0h7vss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEh8VqkPzPuEgZNPH3JpYX1chq5w5yux7r0655wlb4LVkns8l8XFiXqVR5weZZ1v0
	 eMPSlFtK3Aq4//BKzP0+CHMzMoQUZLP2N5t2rry5sU237lkRIbIc+WsDDofMaGIYV0
	 haVd1X1MrizC+md/6FGJTuuwsbD9tx7d0f7pHwnnLbgE1CBQZkARbuvOpwWzg7K9jz
	 QEo1zLsNmSJvg0NsqbMhXOXAy/YThw6WwQ58t/CqE8Y9BhZQri+alX87/9SQxBvsDs
	 eLO0+qEMooWkS3o1ygYLpB0DJ2oJJRs792MCzfby3F/Bj1dFGdo9ahnZlwbBspUkru
	 fGUjf/+t+/bFw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 02/11] kbuild: add $(objtree)/ prefix to some in-kernel build artifacts
Date: Sun, 10 Nov 2024 10:34:30 +0900
Message-ID: <20241110013649.34903-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110013649.34903-1-masahiroy@kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$(objtree) refers to the top of the output directory of kernel builds.

This commit adds the explicit $(objtree)/ prefix to build artifacts
needed for building external modules.

This change has no immediate impact, as the top-level Makefile
currently defines:

  objtree         := .

This commit prepares for supporting the building of external modules
in a different directory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

Changes in v2:
  - Add more $(objtree)/ to arch/*/Makefile

 Makefile                  | 10 +++++-----
 arch/arm/Makefile         |  4 ++--
 arch/arm64/Makefile       |  2 +-
 arch/powerpc/Makefile     |  4 ++--
 arch/riscv/Makefile       |  2 +-
 scripts/Kbuild.include    |  2 +-
 scripts/Makefile.build    |  4 ++--
 scripts/Makefile.modfinal | 14 +++++++-------
 scripts/Makefile.modinst  |  2 +-
 scripts/Makefile.modpost  | 12 ++++++------
 scripts/depmod.sh         |  4 ++--
 11 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/Makefile b/Makefile
index 891d28e54791..9b8f4f4cb01b 100644
--- a/Makefile
+++ b/Makefile
@@ -354,7 +354,7 @@ else # !mixed-build
 include $(srctree)/scripts/Kbuild.include
 
 # Read KERNELRELEASE from include/config/kernel.release (if it exists)
-KERNELRELEASE = $(call read-file, include/config/kernel.release)
+KERNELRELEASE = $(call read-file, $(objtree)/include/config/kernel.release)
 KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
 export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
 
@@ -720,7 +720,7 @@ endif
 export KBUILD_MODULES KBUILD_BUILTIN
 
 ifdef need-config
-include include/config/auto.conf
+include $(objtree)/include/config/auto.conf
 endif
 
 ifeq ($(KBUILD_EXTMOD),)
@@ -783,13 +783,13 @@ else # !may-sync-config
 # and include/config/auto.conf but do not care if they are up-to-date.
 # Use auto.conf to show the error message
 
-checked-configs := include/generated/autoconf.h include/generated/rustc_cfg include/config/auto.conf
+checked-configs := $(addprefix $(objtree)/, include/generated/autoconf.h include/generated/rustc_cfg include/config/auto.conf)
 missing-configs := $(filter-out $(wildcard $(checked-configs)), $(checked-configs))
 
 ifdef missing-configs
-PHONY += include/config/auto.conf
+PHONY += $(objtree)/include/config/auto.conf
 
-include/config/auto.conf:
+$(objtree)/include/config/auto.conf:
 	@echo   >&2 '***'
 	@echo   >&2 '***  ERROR: Kernel configuration is invalid. The following files are missing:'
 	@printf >&2 '***    - %s\n' $(missing-configs)
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index aafebf145738..00ca7886b18e 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -264,13 +264,13 @@ stack_protector_prepare: prepare0
 		-mstack-protector-guard=tls \
 		-mstack-protector-guard-offset=$(shell	\
 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}'\
-				include/generated/asm-offsets.h))
+				$(objtree)/include/generated/asm-offsets.h))
 else
 stack_protector_prepare: prepare0
 	$(eval SSP_PLUGIN_CFLAGS := \
 		-fplugin-arg-arm_ssp_per_task_plugin-offset=$(shell	\
 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}'\
-				include/generated/asm-offsets.h))
+				$(objtree)/include/generated/asm-offsets.h))
 	$(eval KBUILD_CFLAGS += $(SSP_PLUGIN_CFLAGS))
 	$(eval GCC_PLUGINS_CFLAGS += $(SSP_PLUGIN_CFLAGS))
 endif
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 9efd3f37c2fd..358c68565bfd 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -71,7 +71,7 @@ stack_protector_prepare: prepare0
 				-mstack-protector-guard-reg=sp_el0	  \
 				-mstack-protector-guard-offset=$(shell	  \
 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
-					include/generated/asm-offsets.h))
+				$(objtree)/include/generated/asm-offsets.h))
 endif
 
 ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index bbfe4a1f06ef..321b596d2550 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -402,9 +402,9 @@ prepare: stack_protector_prepare
 PHONY += stack_protector_prepare
 stack_protector_prepare: prepare0
 ifdef CONFIG_PPC64
-	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
+	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
 else
-	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
+	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' $(objtree)/include/generated/asm-offsets.h))
 endif
 endif
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d469db9f46f4..a08cfeb6cbf9 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -129,7 +129,7 @@ stack_protector_prepare: prepare0
 				-mstack-protector-guard-reg=tp		  \
 				-mstack-protector-guard-offset=$(shell	  \
 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
-					include/generated/asm-offsets.h))
+				$(objtree)/include/generated/asm-offsets.h))
 endif
 
 # arch specific predefines for sparse
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index ed8a7493524b..8c311b997e24 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -205,7 +205,7 @@ if_changed_dep = $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
 
 cmd_and_fixdep =                                                             \
 	$(cmd);                                                              \
-	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
+	$(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
 	rm -f $(depfile)
 
 # Usage: $(call if_changed_rule,foo)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f423a1faf50..64cd046f8fd8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -34,7 +34,7 @@ subdir-asflags-y :=
 subdir-ccflags-y :=
 
 # Read auto.conf if it exists, otherwise ignore
--include include/config/auto.conf
+-include $(objtree)/include/config/auto.conf
 
 include $(srctree)/scripts/Kbuild.include
 include $(srctree)/scripts/Makefile.compiler
@@ -107,7 +107,7 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(obj)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
-genksyms = scripts/genksyms/genksyms		\
+genksyms = $(objtree)/scripts/genksyms/genksyms	\
 	$(if $(1), -T $(2))			\
 	$(if $(KBUILD_PRESERVE), -p)		\
 	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 1482884ec3ca..6d8aa3059ee2 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -6,7 +6,7 @@
 PHONY := __modfinal
 __modfinal:
 
-include include/config/auto.conf
+include $(objtree)/include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
 # for c_flags
@@ -37,15 +37,15 @@ quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o =							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
 		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
-		-T scripts/module.lds -o $@ $(filter %.o, $^)
+		-T $(objtree)/scripts/module.lds -o $@ $(filter %.o, $^)
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
-	if [ ! -f vmlinux ]; then					\
+	if [ ! -f $(objtree)/vmlinux ]; then				\
 		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
 	else								\
-		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base vmlinux $@; \
-		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
+		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base $(objtree)/vmlinux $@; \
+		$(RESOLVE_BTFIDS) -b $(objtree)/vmlinux $@;		\
 	fi;
 
 # Same as newer-prereqs, but allows to exclude specified extra dependencies
@@ -57,8 +57,8 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
-%.ko: %.o %.mod.o $(extmod_prefix).module-common.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
-	+$(call if_changed_except,ld_ko_o,vmlinux)
+%.ko: %.o %.mod.o $(extmod_prefix).module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
+	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index d97720943189..6fa9af4a25b4 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -6,7 +6,7 @@
 PHONY := __modinst
 __modinst:
 
-include include/config/auto.conf
+include $(objtree)/include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
 install-y :=
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 44936ebad161..12e7c15d099c 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -35,10 +35,10 @@
 PHONY := __modpost
 __modpost:
 
-include include/config/auto.conf
+include $(objtree)/include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
-MODPOST = scripts/mod/modpost
+MODPOST = $(objtree)/scripts/mod/modpost
 
 modpost-args =										\
 	$(if $(CONFIG_MODULES),-M)							\
@@ -119,11 +119,11 @@ include $(kbuild-file)
 
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
 
-ifeq ($(wildcard Module.symvers),)
-missing-input := Module.symvers
+ifeq ($(wildcard $(objtree)/Module.symvers),)
+missing-input := $(objtree)/Module.symvers
 else
-modpost-args += -i Module.symvers
-modpost-deps += Module.symvers
+modpost-args += -i $(objtree)/Module.symvers
+modpost-deps += $(objtree)/Module.symvers
 endif
 
 modpost-args += -e $(addprefix -i , $(KBUILD_EXTRA_SYMBOLS))
diff --git a/scripts/depmod.sh b/scripts/depmod.sh
index e22da27fe13e..3c34fecacbc8 100755
--- a/scripts/depmod.sh
+++ b/scripts/depmod.sh
@@ -12,7 +12,7 @@ KERNELRELEASE=$1
 
 : ${DEPMOD:=depmod}
 
-if ! test -r System.map ; then
+if ! test -r "${objtree}/System.map" ; then
 	echo "Warning: modules_install: missing 'System.map' file. Skipping depmod." >&2
 	exit 0
 fi
@@ -25,7 +25,7 @@ if [ -z $(command -v $DEPMOD) ]; then
 	exit 0
 fi
 
-set -- -ae -F System.map
+set -- -ae -F "${objtree}/System.map"
 if test -n "$INSTALL_MOD_PATH"; then
 	set -- "$@" -b "$INSTALL_MOD_PATH"
 fi
-- 
2.43.0


