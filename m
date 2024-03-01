Return-Path: <linux-kbuild+bounces-1110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C852C86F861
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E2A5281193
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A6AA31;
	Mon,  4 Mar 2024 02:06:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E63517C8
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709517974; cv=none; b=iWiQgJElMxhX0z/ZZZtz0KjuxMoeFmjYAc/t5KkRq+z6DNicHhEg1ZRdN0IOIqtUTLMS8RZaFwVkX8FgEuG8EPramhCyIqZnF5eMuvA0BsvHxezfBmpCEkIi6UppW6qcZX/TYY6pvw2ynYW4jpEMUQAHAKEXYRO3J/xbKoztDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709517974; c=relaxed/simple;
	bh=9aTIDHkQyxHF8IM7cM53O3K9FCt8qU+zNb9sG3ojeOA=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=stnQmDALUMG7bdYghQ1gDHcOsrpfPhkr2inJAeaxbLHxsghcMFU7SJ1L7OAROEFdO87qe5J5BAlBT5Mp/2PGKDleZBbYz4709XLjpsCQ8Ho/KI0Ktl0j6+3Sr8Vc8AVrJCJvAb/Bpjh0E5b9QgvbAz4uuiYlazn3BXnQ1t0UX08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42425obc021786
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:05:56 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 42425nKP021785;
	Sun, 3 Mar 2024 18:05:49 -0800 (PST)
	(envelope-from ehem)
Message-Id: <2173c7fa03e24291f2f59423d77a3cb175317688.1709508290.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 12:51:01 -0800
Subject: [WIP PATCH 01/30] build: replace uses of $(abspath ) with existing
 variables
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

As $(abs_objtree) and $(abs_srctree) already exist, $(abspath )
shouldn't be used with $(objtree) or $(srctree).

Fixes: 0e1aa629f1ce ("kbuild: Do not clean resolve_btfids if the output does not exist")
Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
I believe this is pretty much all fixes, but 0e1aa629f1ce was the most
recent one.
---
 Documentation/Makefile     |  8 ++++----
 Makefile                   |  8 ++++----
 rust/Makefile              | 14 +++++++-------
 samples/bpf/Makefile       |  2 +-
 samples/hid/Makefile       |  2 +-
 scripts/gdb/linux/Makefile |  2 +-
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 3885bbe260eb..85d8deace4bf 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -82,19 +82,19 @@ loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
 quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
       cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
 	PYTHONDONTWRITEBYTECODE=1 \
-	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
+	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abs_srctree)/$(src)/$5/$(SPHINX_CONF) \
 	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
 	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
 	$(SPHINXBUILD) \
 	-b $2 \
-	-c $(abspath $(srctree)/$(src)) \
+	-c $(abs_srctree)/$(src) \
 	-d $(abspath $(BUILDDIR)/.doctrees/$3) \
 	-D version=$(KERNELVERSION) -D release=$(KERNELRELEASE) \
 	$(ALLSPHINXOPTS) \
-	$(abspath $(srctree)/$(src)/$5) \
+	$(abs_srctree)/$(src)/$5 \
 	$(abspath $(BUILDDIR)/$3/$4) && \
 	if [ "x$(DOCS_CSS)" != "x" ]; then \
-		cp $(if $(patsubst /%,,$(DOCS_CSS)),$(abspath $(srctree)/$(DOCS_CSS)),$(DOCS_CSS)) $(BUILDDIR)/$3/_static/; \
+		cp $(if $(patsubst /%,,$(DOCS_CSS)),$(abs_srctree)/$(DOCS_CSS),$(DOCS_CSS)) $(BUILDDIR)/$3/_static/; \
 	fi
 
 YNL_INDEX:=$(srctree)/Documentation/networking/netlink_spec/index.rst
diff --git a/Makefile b/Makefile
index 6cdb5717bfe0..a7696f13bece 100644
--- a/Makefile
+++ b/Makefile
@@ -1337,7 +1337,7 @@ endif
 
 PHONY += resolve_btfids_clean
 
-resolve_btfids_O = $(abspath $(objtree))/tools/bpf/resolve_btfids
+resolve_btfids_O = $(abs_objtree)/tools/bpf/resolve_btfids
 
 # tools/bpf/resolve_btfids directory might not exist
 # in output directory, skip its clean in that case
@@ -1353,11 +1353,11 @@ endif
 
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abs_objtree) subdir=tools -C $(srctree)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abs_objtree) subdir=tools -C $(srctree)/tools/ $*
 
 # ---------------------------------------------------------------------------
 # Kernel selftest
@@ -1757,7 +1757,7 @@ all: misc-check
 PHONY += scripts_gdb
 scripts_gdb: prepare0
 	$(Q)$(MAKE) $(build)=scripts/gdb
-	$(Q)ln -fsn $(abspath $(srctree)/scripts/gdb/vmlinux-gdb.py)
+	$(Q)ln -fsn $(abs_srctree)/scripts/gdb/vmlinux-gdb.py
 
 ifdef CONFIG_GDB_SCRIPTS
 all: scripts_gdb
diff --git a/rust/Makefile b/rust/Makefile
index 9d2a16cc91cb..0a7c278abf0b 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -73,7 +73,7 @@ alloc-cfgs = \
 
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
-	OBJTREE=$(abspath $(objtree)) \
+	OBJTREE=$(abs_objtree) \
 	$(RUSTDOC) $(if $(rustdoc_host),$(rust_common_flags),$(rust_flags)) \
 		$(rustc_target_flags) -L$(objtree)/$(obj) \
 		--output $(rustdoc_output) \
@@ -136,7 +136,7 @@ rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-macros \
 
 quiet_cmd_rustc_test_library = RUSTC TL $<
       cmd_rustc_test_library = \
-	OBJTREE=$(abspath $(objtree)) \
+	OBJTREE=$(abs_objtree) \
 	$(RUSTC) $(rust_common_flags) \
 		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
 		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
@@ -161,7 +161,7 @@ rusttestlib-uapi: $(src)/uapi/lib.rs rusttest-prepare FORCE
 
 quiet_cmd_rustdoc_test = RUSTDOC T $<
       cmd_rustdoc_test = \
-	OBJTREE=$(abspath $(objtree)) \
+	OBJTREE=$(abs_objtree) \
 	$(RUSTDOC) --test $(rust_common_flags) \
 		@$(objtree)/include/generated/rustc_cfg \
 		$(rustc_target_flags) $(rustdoc_test_target_flags) \
@@ -173,7 +173,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
       cmd_rustdoc_test_kernel = \
 	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
 	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
-	OBJTREE=$(abspath $(objtree)) \
+	OBJTREE=$(abs_objtree) \
 	$(RUSTDOC) --test $(rust_flags) \
 		@$(objtree)/include/generated/rustc_cfg \
 		-L$(objtree)/$(obj) --extern alloc --extern kernel \
@@ -195,7 +195,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 # so for the moment we skip `-Cpanic=abort`.
 quiet_cmd_rustc_test = RUSTC T  $<
       cmd_rustc_test = \
-	OBJTREE=$(abspath $(objtree)) \
+	OBJTREE=$(abs_objtree) \
 	$(RUSTC) --test $(rust_common_flags) \
 		@$(objtree)/include/generated/rustc_cfg \
 		$(rustc_target_flags) --out-dir $(objtree)/$(obj)/test \
@@ -242,7 +242,7 @@ quiet_cmd_rustsysroot = RUSTSYSROOT
 	cp -r $(srctree)/$(src)/alloc/* \
 		$(objtree)/$(obj)/test/sysroot/lib/rustlib/src/rust/library/alloc/src; \
 	echo '\#!/bin/sh' > $(objtree)/$(obj)/test/rustc_sysroot; \
-	echo "$(RUSTC) --sysroot=$(abspath $(objtree)/$(obj)/test/sysroot) \"\$$@\"" \
+	echo "$(RUSTC) --sysroot=$(abs_objtree)/$(obj)/test/sysroot \"\$$@\"" \
 		>> $(objtree)/$(obj)/test/rustc_sysroot; \
 	chmod u+x $(objtree)/$(obj)/test/rustc_sysroot; \
 	$(CARGO) -q new $(objtree)/$(obj)/test/dummy; \
@@ -400,7 +400,7 @@ $(obj)/libmacros.so: $(src)/macros/lib.rs $(obj)/core.o FORCE
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
       cmd_rustc_library = \
-	OBJTREE=$(abspath $(objtree)) \
+	OBJTREE=$(abs_objtree) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=obj=$@ \
diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index 933f6c3fe6b0..8b53249aa73a 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-BPF_SAMPLES_PATH ?= $(abspath $(srctree)/$(src))
+BPF_SAMPLES_PATH ?= $(abs_srctree)/$(src)
 TOOLS_PATH := $(BPF_SAMPLES_PATH)/../../tools
 
 pound := \#
diff --git a/samples/hid/Makefile b/samples/hid/Makefile
index 9f7fe29dd749..8af8a52d0ab7 100644
--- a/samples/hid/Makefile
+++ b/samples/hid/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-HID_SAMPLES_PATH ?= $(abspath $(srctree)/$(src))
+HID_SAMPLES_PATH ?= $(abs_srctree)/$(src)
 TOOLS_PATH := $(HID_SAMPLES_PATH)/../../tools
 
 pound := \#
diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
index 48941faa6ea6..52b5c961a6b1 100644
--- a/scripts/gdb/linux/Makefile
+++ b/scripts/gdb/linux/Makefile
@@ -5,7 +5,7 @@ ifdef building_out_of_srctree
 symlinks := $(patsubst $(srctree)/$(src)/%,%,$(wildcard $(srctree)/$(src)/*.py))
 
 quiet_cmd_symlink = SYMLINK $@
-      cmd_symlink = ln -fsn $(patsubst $(obj)/%,$(abspath $(srctree))/$(src)/%,$@) $@
+      cmd_symlink = ln -fsn $(patsubst $(obj)/%,$(abs_srctree)/$(src)/%,$@) $@
 
 always-y += $(symlinks)
 $(addprefix $(obj)/, $(symlinks)): FORCE
-- 
2.39.2


