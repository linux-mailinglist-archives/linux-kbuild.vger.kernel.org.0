Return-Path: <linux-kbuild+bounces-3601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8AE97B14A
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D45B1F21927
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2B5192D9E;
	Tue, 17 Sep 2024 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAWXa3CM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFB192D8F;
	Tue, 17 Sep 2024 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582682; cv=none; b=UTSiHAysM4I4lO2CpcC4lhd3Da6SUs5z/wbXOGkcoTmXWfz2SlEtdX1Bwje2XHVmT7/MwPQES0Cwe4ltZwS8VA6fHEYjXjX2nN7I+qzrGfMPiXFd5VF+SJBkh/ZFstjF9gl4r+wr/qUbu2epo2j9rZc/wmAlET78gBwX6JvBwus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582682; c=relaxed/simple;
	bh=sHAeApIqfGlTqapdYcO1A9RoNWPGiHzfamf04FN3TXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfhadMkElLGCM7fl0p0tVroUR1xN6TeQjQHtIOQLVWkwSOBnQ5Nt2B+gpKICFKnF/JJta9RBmdaEPLMrwmM4swN4Z25/f7nJrhgcqFkI1FnhKr7v1+R/g3mrHJlqJSYdNjPw2Z7TLKKkr42fhoqVrqG2l1nt2zD/PbYPKTS79AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAWXa3CM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AF5C4CECF;
	Tue, 17 Sep 2024 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582682;
	bh=sHAeApIqfGlTqapdYcO1A9RoNWPGiHzfamf04FN3TXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vAWXa3CM6bRnk2tcv0VM8xus1m2aTcJ4Ezr1niZCoBOikv643tfUQo++zFf3nyeRD
	 Clj166vJaIk/hzTqNqD1X4dwK0Zu5S4KycUa47I+rRhW9OYtFCNxTYNCAIcW6v6FXS
	 RZGFoerGLHHvz5r+DylcvjYvHcwZQy+M/vISpIYlycFIvgnmOFdcbzif7dVAmVMZla
	 srCtee5Wx9c6j2X8U7/GKmHbG3yaafF8olPSB801Q67Bm06o1iK9ECDmGOAkyRsIWg
	 nEuoEDLTn7Xi0ZqTybXbkHpVoiSuOwfYa4/v5g0nVgnYRKnb/iJhXZMynO2f6fxlHu
	 DNBOunYiKEgdA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 14/23] kbuild: add $(objtree)/ prefix to some in-kernel build artifacts
Date: Tue, 17 Sep 2024 23:16:42 +0900
Message-ID: <20240917141725.466514-15-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$(objtree) refers to the top of the output directory of kernel builds.

This commit adds the explicit (objtree)/ prefix to build artifacts
needed for building external modules.

This change has no immediate impact, as the top-level Makefile
currently defines:

  objtree         := .

However, it prepares for supporting the building of external modules
in a different directory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                  | 10 +++++-----
 scripts/Kbuild.include    |  2 +-
 scripts/Makefile.build    |  4 ++--
 scripts/Makefile.modfinal | 14 +++++++-------
 scripts/Makefile.modinst  |  2 +-
 scripts/Makefile.modpost  | 12 ++++++------
 scripts/depmod.sh         |  4 ++--
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/Makefile b/Makefile
index ee9ad0f0960f..c923bea7043b 100644
--- a/Makefile
+++ b/Makefile
@@ -354,7 +354,7 @@ else # !mixed-build
 include $(srctree)/scripts/Kbuild.include
 
 # Read KERNELRELEASE from include/config/kernel.release (if it exists)
-KERNELRELEASE = $(call read-file, include/config/kernel.release)
+KERNELRELEASE = $(call read-file, $(objtree)/include/config/kernel.release)
 KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
 export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
 
@@ -717,7 +717,7 @@ endif
 export KBUILD_MODULES KBUILD_BUILTIN
 
 ifdef need-config
-include include/config/auto.conf
+include $(objtree)/include/config/auto.conf
 endif
 
 ifeq ($(KBUILD_EXTMOD),)
@@ -780,13 +780,13 @@ else # !may-sync-config
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
index 8403eba15457..6e8954cbf53a 100644
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
index 4d81ed9af294..2d39d452c49e 100644
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


