Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C228E5ADF8A
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Sep 2022 08:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233194AbiIFGOR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Sep 2022 02:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbiIFGOL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Sep 2022 02:14:11 -0400
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0AE6F55D;
        Mon,  5 Sep 2022 23:14:06 -0700 (PDT)
Received: from zoe.. (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 2866DVIC023845;
        Tue, 6 Sep 2022 15:13:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 2866DVIC023845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1662444815;
        bh=3unP9YrfuYedLZbL08g2GSUpfMyc5dUKdUKVRNWPMkw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TE2J7EZQd1FHfAuSp2omTnNOLDHzwS2M5ora4kBansJxUN+cRilCdeT7NK6XQklOA
         7Z64whgrjdLuC2obYI890AS54BS9u9ko/7jXITQmRBr/JSCJXi5Ivj3cUJhlUP3peN
         9h18UpIUgQl5b4UH627oUJiadxwKcBtvLU78AIlmvx3ZYxhRsWHns0DKW0LKah1LiE
         GKyUrff2yYs2NC/i4R4o7NsO5P5i+caIvVDLFQxwSkqhbiCuTaiRZNb6Tw+vla2B7R
         za3qLP9Apz8pDAHG7M+6qOECr2pLjR8NNjWMRlsmmncXw8Xm7CLlITihLS5Tiq7HEl
         FsDxvBupUkRCQ==
X-Nifty-SrcIP: [133.32.182.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 6/8] kbuild: unify two modpost invocations
Date:   Tue,  6 Sep 2022 15:13:11 +0900
Message-Id: <20220906061313.1445810-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906061313.1445810-1-masahiroy@kernel.org>
References: <20220906061313.1445810-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, modpost is executed twice; first for vmlinux, second
for modules.

This commit merges them.

Current build flow
==================

  1) build obj-y and obj-m objects
    2) link vmlinux.o
      3) modpost for vmlinux
        4) link vmlinux
          5) modpost for modules
            6) link modules (*.ko)

The build steps 1) through 6) are serialized, that is, modules are
built after vmlinux. You do not get benefits of parallel builds when
scripts/link-vmlinux.sh is being run.

New build flow
==============

  1) build obj-y and obj-m objects
    2) link vmlinux.o
      3) modpost for vmlinux and modules
        4a) link vmlinux
        4b) link modules (*.ko)

In the new build flow, modpost is invoked just once.

vmlinux and modules are built in parallel. One exception is
CONFIG_DEBUG_INFO_BTF_MODULES=y, where modules depend on vmlinux.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 Makefile                  | 30 ++++++++++---
 scripts/Makefile.modfinal |  2 +-
 scripts/Makefile.modpost  | 93 ++++++++++++---------------------------
 scripts/link-vmlinux.sh   |  3 --
 4 files changed, 53 insertions(+), 75 deletions(-)

diff --git a/Makefile b/Makefile
index e4c270256849..f9ee16bd212d 100644
--- a/Makefile
+++ b/Makefile
@@ -1162,7 +1162,7 @@ cmd_link-vmlinux =                                                 \
 	$(CONFIG_SHELL) $< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";    \
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
-vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
+vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) modpost FORCE
 	+$(call if_changed_dep,link-vmlinux)
 
 targets += vmlinux
@@ -1439,7 +1439,13 @@ endif
 # Build modules
 #
 
-modules: $(if $(KBUILD_BUILTIN),vmlinux) modules_prepare
+# *.ko are usually independent of vmlinux, but CONFIG_DEBUG_INFOBTF_MODULES
+# is an exception.
+ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+modules: vmlinux
+endif
+
+modules: modules_prepare
 
 # Target to prepare building external modules
 modules_prepare: prepare
@@ -1762,8 +1768,12 @@ targets += $(MODORDER)
 $(MODORDER): $(subdir-modorder) FORCE
 	$(call if_changed,modules_order)
 
-modules: modules_check
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+# KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
+# This is solely useful to speed up test compiles.
+modules: modpost
+ifneq ($(KBUILD_MODPOST_NOFINAL),1)
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
+endif
 
 PHONY += modules_check
 modules_check: $(MODORDER)
@@ -1794,6 +1804,11 @@ KBUILD_MODULES :=
 
 endif # CONFIG_MODULES
 
+PHONY += modpost
+modpost: $(if $(single-build),, $(if $(KBUILD_BUILTIN), vmlinux.o)) \
+	 $(if $(KBUILD_MODULES), modules_check)
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+
 # Single targets
 # ---------------------------------------------------------------------------
 # To build individual files in subdirectories, you can do like this:
@@ -1813,16 +1828,19 @@ single-ko := $(sort $(filter %.ko, $(MAKECMDGOALS)))
 single-no-ko := $(filter-out $(single-ko), $(MAKECMDGOALS)) \
 		$(foreach x, o mod, $(patsubst %.ko, %.$x, $(single-ko)))
 
-$(single-ko): single_modpost
+$(single-ko): single_modules
 	@:
 $(single-no-ko): descend
 	@:
 
 # Remove MODORDER when done because it is not the real one.
 PHONY += single_modpost
-single_modpost: $(single-no-ko) modules_prepare
+single_modules: $(single-no-ko) modules_prepare
 	$(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$m;) } > $(MODORDER)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+ifneq ($(KBUILD_MODPOST_NOFINAL),1)
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
+endif
 	$(Q)rm -f $(MODORDER)
 
 single-goals := $(foreach x, $(addprefix $(extmod_prefix), $(single-no-ko)), \
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 35100e981f4a..a3cf9e3647c9 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -55,7 +55,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
-$(modules): %.ko: %.o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
+$(modules): %.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
 	+$(call if_changed_except,ld_ko_o,vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 04ad00917b2f..d7d3138c5ecc 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -32,9 +32,6 @@
 # Step 4 is solely used to allow module versioning in external modules,
 # where the CRC of each module is retrieved from the Module.symvers file.
 
-# KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
-# This is solely useful to speed up test compiles
-
 PHONY := __modpost
 __modpost:
 
@@ -45,24 +42,23 @@ MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
+	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))					\
+	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)	\
 	-o $@
 
-ifdef MODPOST_VMLINUX
-
-quiet_cmd_modpost = MODPOST $@
-      cmd_modpost = $(MODPOST) $<
-
-vmlinux.symvers: vmlinux.o
-	$(call cmd,modpost)
+# 'make -i -k' ignores compile errors, and builds as many modules as possible.
+ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
+MODPOST += -n
+endif
 
-__modpost: vmlinux.symvers
+ifeq ($(KBUILD_EXTMOD),)
 
 # Generate the list of in-tree objects in vmlinux
 # ---------------------------------------------------------------------------
 
 # This is used to retrieve symbol versions generated by genksyms.
 ifdef CONFIG_MODVERSIONS
-vmlinux.symvers: .vmlinux.objs
+vmlinux.symvers Module.symvers: .vmlinux.objs
 endif
 
 # Ignore libgcc.a
@@ -83,24 +79,12 @@ targets += .vmlinux.objs
 .vmlinux.objs: $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS) FORCE
 	$(call if_changed,vmlinux_objs)
 
-else
-
-ifeq ($(KBUILD_EXTMOD),)
-
-input-symdump := vmlinux.symvers
-output-symdump := modules-only.symvers
-
-quiet_cmd_cat = GEN     $@
-      cmd_cat = cat $(real-prereqs) > $@
-
-ifneq ($(wildcard vmlinux.symvers),)
-
-__modpost: Module.symvers
-Module.symvers: vmlinux.symvers modules-only.symvers FORCE
-	$(call if_changed,cat)
-
-targets += Module.symvers
+vmlinux.o-if-present := $(wildcard vmlinux.o)
+output-symdump := vmlinux.symvers
 
+ifdef KBUILD_MODULES
+output-symdump := $(if $(vmlinux.o-if-present), Module.symvers, modules-only.symvers)
+missing-input := $(filter-out $(vmlinux.o-if-present),vmlinux.o)
 endif
 
 else
@@ -112,56 +96,35 @@ src := $(obj)
 # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
 include $(or $(wildcard $(src)/Kbuild), $(src)/Makefile)
 
-# modpost option for external modules
-MODPOST += -e
-
-input-symdump := Module.symvers $(KBUILD_EXTRA_SYMBOLS)
+module.symvers-if-present := $(wildcard Module.symvers)
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
+missing-input := $(filter-out $(module.symvers-if-present), Module.symvers)
 
-endif
-
-existing-input-symdump := $(wildcard $(input-symdump))
-
-# modpost options for modules (both in-kernel and external)
-MODPOST += \
-	$(addprefix -i ,$(existing-input-symdump)) \
-	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS)) \
-	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
-
-# 'make -i -k' ignores compile errors, and builds as many modules as possible.
-ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
-MODPOST += -n
-endif
+MODPOST += -e $(addprefix -i ,$(module.symvers-if-present) (KBUILD_EXTRA_SYMBOLS))
 
-# Clear VPATH to not search for *.symvers in $(srctree). Check only $(objtree).
-VPATH :=
-$(input-symdump):
-	@echo >&2 'WARNING: Symbol version dump "$@" is missing.'
-	@echo >&2 '         Modules may not have dependencies or modversions.'
-	@echo >&2 '         You may get many unresolved symbol warnings.'
+endif # ($(KBUILD_EXTMOD),)
 
-# KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined symbols
-ifneq ($(KBUILD_MODPOST_WARN)$(filter-out $(existing-input-symdump), $(input-symdump)),)
+ifneq ($(KBUILD_MODPOST_WARN)$(missing-input),)
 MODPOST += -w
 endif
 
+modorder-if-needed := $(if $(KBUILD_MODULES), $(MODORDER))
+
 # Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 quiet_cmd_modpost = MODPOST $@
-      cmd_modpost = sed 's/ko$$/o/' $< | $(MODPOST) -T -
-
-$(output-symdump): $(MODORDER) $(input-symdump) FORCE
-	$(call if_changed,modpost)
+      cmd_modpost = \
+	$(if $(missing-input), \
+		echo >&2 "WARNING: $(missing-input) is missing."; \
+		echo >&2 "         Modules may not have dependencies or modversions."; \
+		echo >&2 "         You may get many unresolved symbol warnings.";) \
+	sed 's/ko$$/o/' $(or $(modorder-if-needed), /dev/null) | $(MODPOST) $(vmlinux.o-if-present) -T -
 
 targets += $(output-symdump)
+$(output-symdump): $(modorder-if-needed) $(vmlinux.o-if-present) $(moudle.symvers-if-present) FORCE
+	$(call if_changed,modpost)
 
 __modpost: $(output-symdump)
-ifneq ($(KBUILD_MODPOST_NOFINAL),1)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
-endif
-
-endif
-
 PHONY += FORCE
 FORCE:
 
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 07486f90d5e2..6a197d8a88ac 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -214,9 +214,6 @@ if [ "$1" = "clean" ]; then
 	exit 0
 fi
 
-# modpost vmlinux.o to check for section mismatches
-${MAKE} -f "${srctree}/scripts/Makefile.modpost" MODPOST_VMLINUX=1
-
 info MODINFO modules.builtin.modinfo
 ${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
 info GEN modules.builtin
-- 
2.34.1

