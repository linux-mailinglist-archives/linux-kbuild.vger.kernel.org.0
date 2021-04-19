Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCFD364E63
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Apr 2021 01:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhDSXEN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 19:04:13 -0400
Received: from terminus.zytor.com ([198.137.202.136]:60849 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230333AbhDSXED (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 19:04:03 -0400
Received: from tazenda.hos.anvin.org ([IPv6:2601:646:8602:8be0:7285:c2ff:fefb:fd4])
        (authenticated bits=0)
        by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 13JN30Cq2438940
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 19 Apr 2021 16:03:10 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 13JN30Cq2438940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2021032801; t=1618873390;
        bh=FeYH7NmQRC4B/56T9jR2uJ+i2ddOCU/O6iet/fTQm7Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yPY9KcSRAjIERWHPU24rnT0wXFEfR+pcYOQri1/h3UskL3qcFPy+e96d1PNTXKx7v
         7pQ4Gd3QzUtM+p6naxZvB+vuwnb1n0G8ABD6wHvlJXeigX0XCDYg5GFUDyAoOoTU5I
         SHkZDBAFNA1HWAooD3su3wAOzACPKqqZLiBVX7/TzKYFuoVBOdaopPQGj5caOv65lX
         P66m1jAdWg55lJ8BDo4TFCG6DFZmfLUEStA0jZ4ZhLioxs3IdxOoHVKSElFKxqikrf
         WSqLNGsPCYUFGnPAyuHzJRlkkGoMaIfzMw+1hyDfYVSN5OO3Wc6bVtSqpGbrPgSxmp
         tUeioOHHOR28Q==
From:   "H. Peter Anvin" <hpa@zytor.com>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
        "H. Peter Anvin (Intel)" <hpa@zytor.com>
Subject: [PATCH v2 2/3] usr, modules: Add build target for creating a modules initramfs image
Date:   Mon, 19 Apr 2021 16:02:51 -0700
Message-Id: <20210419230252.1583169-3-hpa@zytor.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419230252.1583169-1-hpa@zytor.com>
References: <20210419230252.1583169-1-hpa@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Some distributions really cannot be booted without modules
anymore. To allow an externally built kernel to be run, it is handy to
be able to create an initramfs image with all the modules, that can
appended to an existing initramfs image (preferrably without any
modules, but not necessarily, since the /lib/modules path includes the
kernel version.)

This image is generated in usr/modules.img.

Since this image may end up being rather large, change the default for
CONFIG_INITRAMFS_COMPRESSION_*. We already have a special case in the
Makefile to not re-compress an existing initramfs image; add the very
small default builtin initramfs as another case to suppress the
compression. To avoid losing the default compression setting, add a
separate variable for the possibly overridden builtin initramfs
compression method.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 Makefile       | 17 ++++++++++++-----
 usr/.gitignore |  3 +++
 usr/Kconfig    | 31 +++++++++++++++++--------------
 usr/Makefile   | 39 +++++++++++++++++++++++++++++++++++----
 4 files changed, 67 insertions(+), 23 deletions(-)

diff --git a/Makefile b/Makefile
index 4730cf156f6b..89e40760384d 100644
--- a/Makefile
+++ b/Makefile
@@ -622,7 +622,7 @@ KBUILD_MODULES :=
 KBUILD_BUILTIN := 1
 
 # If we have only "make modules", don't compile built-in objects.
-ifeq ($(MAKECMDGOALS),modules)
+ifeq (modules,$(MAKECMDGOALS))
   KBUILD_BUILTIN :=
 endif
 
@@ -630,7 +630,8 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps %compile_commands.json clang-%,$(MAKECMDGOALS)),)
+ifneq ($(filter all modules nsdeps %compile_commands.json clang-% \
+	modules.img usr/modules.img,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
 endif
 
@@ -1461,15 +1462,17 @@ modules_prepare: prepare
 PHONY += modules_install
 modules_install: _modinst_ _modinst_post
 
+INSTALL_MOD_LN ?= ln -s
+
 PHONY += _modinst_
 _modinst_:
 	@rm -rf $(MODLIB)/kernel
 	@rm -f $(MODLIB)/source
 	@mkdir -p $(MODLIB)/kernel
-	@ln -s $(abspath $(srctree)) $(MODLIB)/source
+	@$(INSTALL_MOD_LN) $(abspath $(srctree)) $(MODLIB)/source
 	@if [ ! $(objtree) -ef  $(MODLIB)/build ]; then \
-		rm -f $(MODLIB)/build ; \
-		ln -s $(CURDIR) $(MODLIB)/build ; \
+		rm -rf $(MODLIB)/build ; \
+		$(INSTALL_MOD_LN) $(CURDIR) $(MODLIB)/build ; \
 	fi
 	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
 	@cp -f modules.builtin $(MODLIB)/
@@ -1489,6 +1492,10 @@ modules_sign:
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modsign
 endif
 
+# initramfs image containing all modules
+modules.img usr/modules.img: modules
+	$(Q)$(MAKE) $(build)=usr usr/modules.img
+
 else # CONFIG_MODULES
 
 # Modules not configured
diff --git a/usr/.gitignore b/usr/.gitignore
index 935442ed1eb2..14e2fae88d8a 100644
--- a/usr/.gitignore
+++ b/usr/.gitignore
@@ -2,3 +2,6 @@
 gen_init_cpio
 initramfs_data.cpio
 /initramfs_inc_data
+/modules
+modules.cpio
+modules.img
diff --git a/usr/Kconfig b/usr/Kconfig
index 8bbcf699fe3b..625372682b5e 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -109,18 +109,23 @@ config RD_ZSTD
 	  If unsure, say N.
 
 choice
-	prompt "Built-in initramfs compression mode"
-	depends on INITRAMFS_SOURCE != ""
-	help
-	  This option allows you to decide by which algorithm the builtin
-	  initramfs will be compressed.  Several compression algorithms are
-	  available, which differ in efficiency, compression and
-	  decompression speed.  Compression speed is only relevant
-	  when building a kernel.  Decompression speed is relevant at
-	  each boot. Also the memory usage during decompression may become
-	  relevant on memory constrained systems. This is usually based on the
-	  dictionary size of the algorithm with algorithms like XZ and LZMA
-	  featuring large dictionary sizes.
+	prompt "Preferred initramfs compression mode"
+	default INITRAMFS_COMPRESSION_XZ   if RD_XZ
+	default INITRAMFS_COMPRESSION_GZIP if RD_GZIP
+	default INITRAMFS_COMPRESSION_LZO  if RD_LZO
+	default INITRAMFS_COMPRESSION_LZ4  if RD_LZ4
+	default INITRAMFS_COMPRESSION_NONE
+	help
+	  This option allows you to decide by which algorithm the
+	  builtin initramfs and usr/modules.img will be compressed.
+	  Several compression algorithms are available, which differ
+	  in efficiency, compression and decompression speed.
+	  Compression speed is only relevant when building a kernel.
+	  Decompression speed is relevant at each boot. Also the
+	  memory usage during decompression may become relevant on
+	  memory constrained systems. This is usually based on the
+	  dictionary size of the algorithm with algorithms like XZ and
+	  LZMA featuring large dictionary sizes.
 
 	  High compression options are mostly useful for users who are
 	  low on RAM, since it reduces the memory consumption during
@@ -130,8 +135,6 @@ choice
 	  compression tool to compress the generated initram cpio file for
 	  embedding.
 
-	  If in doubt, select 'None'
-
 config INITRAMFS_COMPRESSION_GZIP
 	bool "Gzip"
 	depends on RD_GZIP
diff --git a/usr/Makefile b/usr/Makefile
index b1a81a40eab1..6257ba8690a3 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -22,12 +22,14 @@ obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
 $(obj)/initramfs_data.o: $(obj)/initramfs_inc_data
 
 ramfs-input := $(strip $(shell echo $(CONFIG_INITRAMFS_SOURCE)))
+ramfs-compress := $(compress-y)
 cpio-data :=
 
 # If CONFIG_INITRAMFS_SOURCE is empty, generate a small initramfs with the
-# default contents.
+# default contents. No point in compressing it separately from the kernel.
 ifeq ($(ramfs-input),)
 ramfs-input := $(srctree)/$(src)/default_cpio_list
+ramfs-compress := shipped
 endif
 
 ifeq ($(words $(ramfs-input)),1)
@@ -42,7 +44,7 @@ endif
 # .cpio.*, use it directly as an initramfs, and avoid double compression.
 ifeq ($(words $(subst .cpio.,$(space),$(ramfs-input))),2)
 cpio-data := $(ramfs-input)
-compress-y := shipped
+ramfs-compress := shipped
 endif
 
 endif
@@ -76,14 +78,43 @@ quiet_cmd_initfs = GEN     $@
 # 2) There are changes in which files are included (added or deleted)
 # 3) If gen_init_cpio are newer than initramfs_data.cpio
 # 4) Arguments to gen_initramfs.sh changes
-$(obj)/initramfs_data.cpio: $(src)/gen_initramfs.sh $(obj)/gen_init_cpio $(deps_initramfs) FORCE
+$(obj)/initramfs_data.cpio: $(src)/gen_initramfs.sh $(obj)/gen_init_cpio \
+			    $(deps_initramfs) FORCE
 	$(call if_changed,initfs)
 
 endif
 
 $(obj)/initramfs_inc_data: $(cpio-data) FORCE
-	$(call if_changed,$(compress-y))
+	$(call if_changed,$(ramfs-compress))
 
 targets += initramfs_data.cpio initramfs_inc_data
 
 subdir-$(CONFIG_UAPI_HEADER_TEST) += include
+
+# modules.img: an initramfs image containing all the modules
+quiet_cmd_modinst = MODINST $(obj)/modules
+      cmd_modinst = \
+	rm -rf '$(obj)/modules' && \
+	$(MAKE) -f '$(srctree)/Makefile' O='$(objtree)' \
+		INSTALL_MOD_PATH='$(obj)/modules' \
+		INSTALL_MOD_LN=: modules_install
+
+quiet_cmd_modcpio = MODCPIO $@
+      cmd_modcpio = \
+	$(CONFIG_SHELL) $< -o $@ \
+	$(if $(CONFIG_INITRAMFS_ROOT_UID), -u $(CONFIG_INITRAMFS_ROOT_UID)) \
+	$(if $(CONFIG_INITRAMFS_ROOT_GID), -g $(CONFIG_INITRAMFS_ROOT_GID)) \
+	'$(obj)/modules'
+
+modules_order := \
+	$(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD),$(objtree))/modules.order
+
+$(obj)/modules.cpio: $(src)/gen_initramfs.sh $(obj)/gen_init_cpio \
+	$(modules_order) FORCE
+	$(call if_changed,modinst)
+	$(call if_changed,modcpio)
+
+$(obj)/modules.img: $(obj)/modules.cpio FORCE
+	$(call if_changed,$(compress-y))
+
+targets += modules.cpio modules.img modules
-- 
2.30.2

