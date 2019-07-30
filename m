Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 759B17AD13
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 17:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732255AbfG3P7X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 11:59:23 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:60067 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729621AbfG3P7O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 11:59:14 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6UFx3Rb014915;
        Wed, 31 Jul 2019 00:59:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6UFx3Rb014915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564502345;
        bh=r9RuO6e70udYzmxw92TTE0QdUowGbnfuU8zyqiBmS+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mXQDXhmDrwJPFT4OqN0FKclTVqd6B/6tGUjdSFHdk+HgHOKJOFxDiz0XgBJS3kHg/
         AGli8U/93qn4gwNUUwe4IgW4KZACVqHZ3CiKSWEpZG55eu4anoG8aQWvfEHyGKhMfs
         dc3U7qMPCkcAsnJ0mWwSHVCmOBz3y3hlILRfS0srqs0cTVqXYkuo85NRx2HobOhPhF
         pIswhEf3XHqhOzHbhh4Jk5zqZqk8Bi+VEhiXyJkeIEO8CiG6PH4nXdD/4410DneP2q
         3eh0JHKGsSq6utUWVzxqh7VjUCb4p2SDpyAiUyIGoB14KbAZJAsFFaWBAU65RZ4Sai
         jq4Sfpbv1467g==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 4/4] kbuild: modpost: do not parse unnecessary rules for vmlinux modpost
Date:   Wed, 31 Jul 2019 00:59:02 +0900
Message-Id: <20190730155902.5557-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155902.5557-1-yamada.masahiro@socionext.com>
References: <20190730155902.5557-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit ff9b45c55b26 ("kbuild: modpost: read modules.order instead
of $(MODVERDIR)/*.mod"), 'make vmlinux' emits a warning, like this:

$ make defconfig vmlinux
  [ snip ]
  LD      vmlinux.o
cat: modules.order: No such file or directory
  MODPOST vmlinux.o
  MODINFO modules.builtin.modinfo
  KSYM    .tmp_kallsyms1.o
  KSYM    .tmp_kallsyms2.o
  LD      vmlinux
  SORTEX  vmlinux
  SYSMAP  System.map

When building only vmlinux, KBUILD_MODULES is not set. Hence, the
modules.order is not generated. For the vmlinux modpost, it is not
necessary at all.

Separate scripts/Makefile.modpost for the vmlinux/modules stages.
This works more efficiently because the vmlinux modpost does not
need to include .*.cmd files.

Fixes: ff9b45c55b26 ("kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 76 ++++++++++++++++++++++------------------
 scripts/link-vmlinux.sh  |  2 +-
 2 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index fdab32d6f552..92ed02d7cd5e 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -38,12 +38,39 @@
 # symbols in the final module linking stage
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 # This is solely useful to speed up test compiles
-PHONY := _modpost
-_modpost: __modpost
+
+PHONY := __modpost
+__modpost:
 
 include include/config/auto.conf
 include scripts/Kbuild.include
 
+kernelsymfile := $(objtree)/Module.symvers
+modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
+
+MODPOST = scripts/mod/modpost						\
+	$(if $(CONFIG_MODVERSIONS),-m)					\
+	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)			\
+	$(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)			\
+	$(if $(KBUILD_EXTMOD),-I $(modulesymfile))			\
+	$(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS)))	\
+	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))			\
+	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)			\
+	$(if $(KBUILD_MODPOST_WARN),-w)
+
+ifdef MODPOST_VMLINUX
+
+__modpost: vmlinux.o
+
+quiet_cmd_modpost = MODPOST $@
+      cmd_modpost = $(MODPOST) $@
+
+PHONY += vmlinux.o
+vmlinux.o:
+	$(call cmd,modpost)
+
+else
+
 # When building external modules load the Kbuild file to retrieve EXTRA_SYMBOLS info
 ifneq ($(KBUILD_EXTMOD),)
 
@@ -58,50 +85,27 @@ endif
 
 include scripts/Makefile.lib
 
-kernelsymfile := $(objtree)/Module.symvers
-modulesymfile := $(firstword $(KBUILD_EXTMOD))/Module.symvers
-
 modorder := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order
 
-# Step 1), find all modules listed in modules.order
-ifdef CONFIG_MODULES
+# find all modules listed in modules.order
 modules := $(sort $(shell cat $(modorder)))
-endif
 
 # Stop after building .o files if NOFINAL is set. Makes compile tests quicker
-_modpost: $(if $(KBUILD_MODPOST_NOFINAL), $(modules:.ko:.o),$(modules))
-
-# Step 2), invoke modpost
-#  Includes step 3,4
-modpost = scripts/mod/modpost                    \
- $(if $(CONFIG_MODVERSIONS),-m)                  \
- $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a,)       \
- $(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)   \
- $(if $(KBUILD_EXTMOD),-I $(modulesymfile))      \
- $(if $(KBUILD_EXTMOD),$(addprefix -e ,$(KBUILD_EXTRA_SYMBOLS))) \
- $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
- $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
- $(if $(KBUILD_MODPOST_WARN),-w)
-
-MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
+__modpost: $(if $(KBUILD_MODPOST_NOFINAL), $(modules:.ko:.o),$(modules))
+	@:
+
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - $(wildcard vmlinux)
 
 # We can go over command line length here, so be careful.
 quiet_cmd_modpost = MODPOST $(words $(modules)) modules
-      cmd_modpost = sed 's/ko$$/o/' $(modorder) | $(modpost) $(MODPOST_OPT) -s -T -
+      cmd_modpost = sed 's/ko$$/o/' $(modorder) | $(MODPOST)
 
-PHONY += __modpost
-__modpost:
-	$(call cmd,modpost) $(wildcard vmlinux)
-
-quiet_cmd_kernel-mod = MODPOST $@
-      cmd_kernel-mod = $(modpost) $@
-
-vmlinux.o: FORCE
-	$(call cmd,kernel-mod)
+PHONY += modules-modpost
+modules-modpost:
+	$(call cmd,modpost)
 
 # Declare generated files as targets for modpost
-$(modules:.ko=.mod.c): __modpost ;
-
+$(modules:.ko=.mod.c): modules-modpost
 
 # Step 5), compile all *.mod.c files
 
@@ -149,4 +153,6 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
+endif
+
 .PHONY: $(PHONY)
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a7124f895b24..915775eb2921 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -210,7 +210,7 @@ info LD vmlinux.o
 modpost_link vmlinux.o
 
 # modpost vmlinux.o to check for section mismatches
-${MAKE} -f "${srctree}/scripts/Makefile.modpost" vmlinux.o
+${MAKE} -f "${srctree}/scripts/Makefile.modpost" MODPOST_VMLINUX=1
 
 info MODINFO modules.builtin.modinfo
 ${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
-- 
2.17.1

