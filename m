Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5D3366280
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Apr 2021 01:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbhDTXcI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Apr 2021 19:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234414AbhDTXcI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Apr 2021 19:32:08 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4976CC06174A
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Apr 2021 16:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :MIME-Version:Date:Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=byX5Iz+OeIBr/Add8UU1Breb/+hp8GRFzsUFMWD+UKc=; b=lCoxREqGKqCwWRupcqujoQHXLy
        GoeE+vkiEeiZso3i8m+nIk+5h8DsbCg01mg/rEbHzeR/k2AdwSnrb6Zfu+ODAOAQBqo8msU0+xFou
        k4RHbiXCM+z+qhiwE/0Wo9Bgi1VfSlskhLCWttf7W02RK02evoH2FnoihWF+fgxEYlWn279NzWsbM
        SJjTQyjr0ZwN13zbpH66X6+SQQBsF1agzFGsfMP8j3VrPjM6sZvSWjBCQ9B0G2ahfJW/XOfWj2Q0t
        xqTTM3A31PTo7+jZYZid1xjMsnpVNLvPVaEJoOKYjXuYQxspzLcDk9qjxG0d2b18Za+DDhy6KFm9k
        ACePof0Q==;
Received: from [2601:1c0:6280:3f0::df68]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lYzq8-00DGTM-8G; Tue, 20 Apr 2021 23:31:33 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: powerpc{32,64} randconfigs
To:     PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
Message-ID: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
Date:   Tue, 20 Apr 2021 16:31:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

Is there a way to do this?

$ make ARCH=powerpc randconfig # and force PPC32

and separately
$ make ARCH=powerpc randconfig # and force PPC64


I suppose that I could do something like this (for PPC64):

$ make ARCH=powerpc randconfig
$ ./scripts/config -d PPC32 -e PPC64
$ make ARCH=powerpc olddefconfig
$ make ARCH=powerpc all

but that's awkward and sort of defeats the randomness -- i.e.,
the randomness is done before the ARCH=PPC{32,64} is forced,
and then some of the config items won't be valid during the
'make olddefconfig'.

If the answer is No, then I will try to make a patch (at least
for local use) that does something like x86 does for
i386 | x86_64, or sparc does for sparc32 | sparc64.

[time passes]

OK, I have a patch that seems for work as far as setting
PPC32=y or PPC64=y... but it has a problem during linking
of vmlinux:

crosstool/gcc-9.3.0-nolibc/powerpc-linux/bin/powerpc-linux-ld:./arch/powerpc/kernel/vmlinux.lds:6: syntax error

and the (bad) generated vmlinux.lds file says (at line 6):

OUTPUT_ARCH(1:common)

while it should say:

OUTPUT_ARCH(powerpc:common)

Does anyone have any ideas about this problem?

The ARCH=ppc32 / ARCH=ppc64 patch is below FYI.
It is missing an update to Documentation/kbuild/kbuild.rst (aliases).


thanks.
-- 
---
 Makefile                               |    8 ++++++++
 arch/powerpc/Makefile                  |   14 +++++++-------
 arch/powerpc/kernel/vdso64/Makefile    |    2 +-
 arch/powerpc/platforms/Kconfig.cputype |    5 +++--
 4 files changed, 19 insertions(+), 10 deletions(-)

--- linux-next-20210420.orig/Makefile
+++ linux-next-20210420/Makefile
@@ -411,6 +411,14 @@ ifeq ($(ARCH),sh64)
        SRCARCH := sh
 endif
 
+# Additional ARCH settings for powerpc
+ifeq ($(ARCH),ppc32)
+        SRCARCH := powerpc
+endif
+ifeq ($(ARCH),ppc64)
+        SRCARCH := powerpc
+endif
+
 export cross_compiling :=
 ifneq ($(SRCARCH),$(SUBARCH))
 cross_compiling := 1
--- linux-next-20210420.orig/arch/powerpc/platforms/Kconfig.cputype
+++ linux-next-20210420/arch/powerpc/platforms/Kconfig.cputype
@@ -1,11 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 config PPC32
 	bool
-	default y if !PPC64
+	default y if !PPC64 || "$(ARCH)" = "ppc32"
 	select KASAN_VMALLOC if KASAN && MODULES
 
 config PPC64
-	bool "64-bit kernel"
+	bool "64-bit kernel" if "$(ARCH)" = "powerpc"
+	default y if "$(ARCH)" = "ppc64"
 	select ZLIB_DEFLATE
 	help
 	  This option selects whether a 32-bit or a 64-bit kernel
--- linux-next-20210420.orig/arch/powerpc/kernel/vdso64/Makefile
+++ linux-next-20210420/arch/powerpc/kernel/vdso64/Makefile
@@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-bu
 asflags-y := -D__VDSO64__ -s
 
 targets += vdso64.lds
-CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
+CPPFLAGS_vdso64.lds += -P -C -U$(SRCARCH)
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
--- linux-next-20210420.orig/arch/powerpc/Makefile
+++ linux-next-20210420/arch/powerpc/Makefile
@@ -204,7 +204,7 @@ endif
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
-KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
+KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(SRCARCH) $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
 KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
@@ -279,7 +279,7 @@ BOOT_TARGETS2 := zImage% dtbImage% treeI
 
 PHONY += $(BOOT_TARGETS1) $(BOOT_TARGETS2)
 
-boot := arch/$(ARCH)/boot
+boot := arch/$(SRCARCH)/boot
 
 $(BOOT_TARGETS1): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
@@ -297,8 +297,8 @@ bootwrapper_install:
 # without the .config suffix.
 define merge_into_defconfig
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(ARCH)/configs/$(config).config)
+		-m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(1) \
+		$(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 endef
 
@@ -378,7 +378,7 @@ ppc64_book3e_allmodconfig:
 
 define archhelp
   @echo '* zImage          - Build default images selected by kernel config'
-  @echo '  zImage.*        - Compressed kernel image (arch/$(ARCH)/boot/zImage.*)'
+  @echo '  zImage.*        - Compressed kernel image (arch/$(SRCARCH)/boot/zImage.*)'
   @echo '  uImage          - U-Boot native image format'
   @echo '  cuImage.<dt>    - Backwards compatible U-Boot image for older'
   @echo '                    versions which do not support device trees'
@@ -389,12 +389,12 @@ define archhelp
   @echo '                    (your) ~/bin/$(INSTALLKERNEL) or'
   @echo '                    (distribution) /sbin/$(INSTALLKERNEL) or'
   @echo '                    install to $$(INSTALL_PATH) and run lilo'
-  @echo '  *_defconfig     - Select default config from arch/$(ARCH)/configs'
+  @echo '  *_defconfig     - Select default config from arch/$(SRCARCH)/configs'
   @echo ''
   @echo '  Targets with <dt> embed a device tree blob inside the image'
   @echo '  These targets support board with firmware that does not'
   @echo '  support passing a device tree directly.  Replace <dt> with the'
-  @echo '  name of a dts file from the arch/$(ARCH)/boot/dts/ directory'
+  @echo '  name of a dts file from the arch/$(SRCARCH)/boot/dts/ directory'
   @echo '  (minus the .dts extension).'
 endef
 

