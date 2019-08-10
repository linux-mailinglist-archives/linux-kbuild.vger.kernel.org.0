Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E95DA88C0D
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfHJPyo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:54:44 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:34507 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfHJPyo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:44 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7AFrG93009713;
        Sun, 11 Aug 2019 00:53:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7AFrG93009713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565452404;
        bh=hGsks6/xTqefvtoV6rav816BO3YdGgcz9HfhUMQ+tCs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1rhNgl5nfXqK6aeESp/h9w3WhtoFqScmp9Gbi6Gg4d2OpfHgasNr+c4WOr8KiSyG0
         QJZSSZBxPrJ65ky6+VdLsM5LEahCr6vwYY7dhKTbL1zqASYt+2IhfKfNs7X0VhCEdZ
         +gmsGEQV5pkSUSi2p5maUGZnGG9gjwnKP/DjdR2pwW8/ZqzAEIRWD1nDBZ2sGVlaN7
         QztjR3jW4R1VxPlWK/A20OkbmdS4REuwUw8UWRfCxjkqgn8TK9lrmQhGSd65JjR8+c
         5rZ83I0/UCd6mNvP0V2Lwfa43wKBj/Fr0e2jZURlg6qXMEjy18PMVFRQ5Oncqr/nmy
         Cnw49yVtePhoA==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] kbuild: unify vmlinux-dirs and module-dirs rules
Date:   Sun, 11 Aug 2019 00:53:04 +0900
Message-Id: <20190810155307.29322-9-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The in-kernel build and external module build have similar code
for descending into sub-directories.

Factor out the code into the common place.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index 706ca0d633df..e60c09d57b30 100644
--- a/Makefile
+++ b/Makefile
@@ -1016,6 +1016,8 @@ vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
 		     $(patsubst %/,%,$(filter %/, $(init-) $(core-) \
 			$(drivers-) $(net-) $(libs-) $(virt-))))
 
+build-dirs	:= $(vmlinux-dirs)
+
 init-y		:= $(patsubst %/, %/built-in.a, $(init-y))
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
 drivers-y	:= $(patsubst %/, %/built-in.a, $(drivers-y))
@@ -1038,7 +1040,7 @@ vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
 # Recurse until adjust_autoksyms.sh is satisfied
 PHONY += autoksyms_recursive
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-autoksyms_recursive: $(vmlinux-deps) modules.order
+autoksyms_recursive: descend modules.order
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
 	  "$(MAKE) -f $(srctree)/Makefile vmlinux"
 endif
@@ -1070,17 +1072,7 @@ targets := vmlinux
 
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
-$(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
-
-# Handle descending into subdirectories listed in $(vmlinux-dirs)
-# Preset locale variables to speed up the build process. Limit locale
-# tweaks to this spot to avoid wrong language settings when running
-# make menuconfig etc.
-# Error messages still appears in the original language
-
-PHONY += $(vmlinux-dirs)
-$(vmlinux-dirs): prepare
-	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
+$(sort $(vmlinux-deps)): descend ;
 
 filechk_kernel.release = \
 	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
@@ -1302,13 +1294,13 @@ modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order modules.builtin
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
 
-modules.order: $(vmlinux-dirs)
-	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
+modules.order: descend
+	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
 
-modbuiltin-dirs := $(addprefix _modbuiltin_, $(vmlinux-dirs))
+modbuiltin-dirs := $(addprefix _modbuiltin_, $(build-dirs))
 
 modules.builtin: $(modbuiltin-dirs)
-	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
+	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
 
 PHONY += $(modbuiltin-dirs)
 # tristate.conf is not included from this Makefile. Add it as a prerequisite
@@ -1618,12 +1610,9 @@ $(objtree)/Module.symvers:
 	echo "           is missing; modules will have no dependencies and modversions."; \
 	echo )
 
-module-dirs := $(addprefix _module_,$(KBUILD_EXTMOD))
-PHONY += $(module-dirs) modules
-$(module-dirs): prepare
-	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@) need-modorder=1
-
-modules: $(module-dirs) $(objtree)/Module.symvers
+build-dirs := $(KBUILD_EXTMOD)
+PHONY += modules
+modules: descend $(objtree)/Module.symvers
 	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
@@ -1665,6 +1654,16 @@ help:
 PHONY += prepare
 endif # KBUILD_EXTMOD
 
+# Handle descending into subdirectories listed in $(build-dirs)
+# Preset locale variables to speed up the build process. Limit locale
+# tweaks to this spot to avoid wrong language settings when running
+# make menuconfig etc.
+# Error messages still appears in the original language
+PHONY += descend $(build-dirs)
+descend: $(build-dirs)
+$(build-dirs): prepare
+	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
+
 clean: $(clean-dirs)
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
-- 
2.17.1

