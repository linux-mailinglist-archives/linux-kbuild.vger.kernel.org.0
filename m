Return-Path: <linux-kbuild+bounces-1138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7C686F8B3
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 676461C20C08
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F076819A;
	Mon,  4 Mar 2024 02:53:29 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B16417C9
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520809; cv=none; b=ZhwLTAsS6e1Ec3Zk3U583wRQRZUIbVsY14fMn7Lyxo27U84CeccaLeS16hJXsHLtPwulpE+7Syx/v2y+WXLJ8vrIu5rUvLeTaffNYcEhBynYShiCsPuyrgOIapfVrCcMzBSu2NdWxRC17TuMubGroqXDMiDb9iViq+ywH7cYlHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520809; c=relaxed/simple;
	bh=ew5HL4CNBhub4Gu3OYk0gt8BmPx7ieskVR/XPbAK1Go=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=JOrtAD23sgzPzv1GI19emgWXtxRe9ouwpxZN/0W1MQnXibPluiYlzQbJ4vQG+5Inyqm9K8dUVtQwkiL28wGWciYkgngw1VoZfCco+t2Hcmojd9CnPzoT5p3iy1kkaqZxF6IA3tnNNzc5qHDkytTmVNS8eRmsPkEydg5Qn4LvIE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242o2gX022158
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:50:08 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242o26M022157;
	Sun, 3 Mar 2024 18:50:02 -0800 (PST)
	(envelope-from ehem)
Message-Id: <e68dc4153f1ba6a71a937ca572d4b54588cb22f4.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 28/30] tools/build: modify uses of $(srctree) to assume
 trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
X-Spam-Level: *
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Date: Tue, 20 Feb 2024 09:13:37 -0800

This isn't much more than `find | sed` to adjust all uses of $(srctree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:

find . -name Makefile\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 tools/bootconfig/Makefile                   |   2 +-
 tools/bpf/Makefile                          |  12 +-
 tools/bpf/bpftool/Makefile                  |  18 +--
 tools/bpf/resolve_btfids/Makefile           |  12 +-
 tools/build/Makefile                        |   4 +-
 tools/build/Makefile.build                  |   2 +-
 tools/build/Makefile.feature                |   2 +-
 tools/build/Makefile.include                |   6 +-
 tools/build/tests/ex/Makefile               |   4 +-
 tools/counter/Makefile                      |   4 +-
 tools/gpio/Makefile                         |   2 +-
 tools/hv/Makefile                           |   2 +-
 tools/iio/Makefile                          |   2 +-
 tools/include/nolibc/Makefile               |   6 +-
 tools/lib/api/Makefile                      |  10 +-
 tools/lib/bpf/Makefile                      |  18 +--
 tools/lib/perf/Makefile                     |  22 ++--
 tools/lib/subcmd/Makefile                   |   6 +-
 tools/lib/symbol/Makefile                   |  10 +-
 tools/lib/thermal/Makefile                  |  22 ++--
 tools/objtool/Makefile                      |  14 +-
 tools/pci/Makefile                          |   2 +-
 tools/perf/Makefile.config                  |  22 ++--
 tools/perf/Makefile.perf                    | 134 ++++++++++----------
 tools/perf/arch/arm64/Makefile              |   6 +-
 tools/perf/arch/loongarch/Makefile          |   6 +-
 tools/perf/arch/mips/Makefile               |   2 +-
 tools/perf/arch/powerpc/Makefile            |   2 +-
 tools/perf/arch/s390/Makefile               |   2 +-
 tools/perf/arch/x86/Makefile                |   2 +-
 tools/power/acpi/Makefile.config            |   8 +-
 tools/power/acpi/Makefile.rules             |   2 +-
 tools/power/acpi/tools/acpidump/Makefile    |   2 +-
 tools/power/acpi/tools/pfrut/Makefile       |   2 +-
 tools/power/x86/intel-speed-select/Makefile |   2 +-
 tools/spi/Makefile                          |   2 +-
 tools/testing/selftests/nolibc/Makefile     |  24 ++--
 tools/thermal/lib/Makefile                  |  20 +--
 tools/thermal/thermal-engine/Makefile       |  10 +-
 tools/thermal/thermometer/Makefile          |   6 +-
 tools/usb/Makefile                          |   4 +-
 41 files changed, 220 insertions(+), 220 deletions(-)

diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 605c0798a83d..7907e7d7698e 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -9,7 +9,7 @@ srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 endif
 
-LIBSRC = $(srctree)/lib/bootconfig.c $(srctree)/include/linux/bootconfig.h
+LIBSRC = $(srctree)lib/bootconfig.c $(srctree)include/linux/bootconfig.h
 CFLAGS = -Wall -g -I$(CURDIR)/include
 
 ALL_TARGETS := bootconfig
diff --git a/tools/bpf/Makefile b/tools/bpf/Makefile
index b12ff0126cf6..0771aa15992c 100644
--- a/tools/bpf/Makefile
+++ b/tools/bpf/Makefile
@@ -9,8 +9,8 @@ MAKE = make
 INSTALL ?= install
 
 CFLAGS += -Wall -O2
-CFLAGS += -D__EXPORTED_HEADERS__ -I$(srctree)/tools/include/uapi \
-	  -I$(srctree)/tools/include
+CFLAGS += -D__EXPORTED_HEADERS__ -I$(srctree)tools/include/uapi \
+	  -I$(srctree)tools/include
 
 # This will work when bpf is built in tools env. where srctree
 # isn't set and when invoked from selftests build, where srctree
@@ -47,7 +47,7 @@ endif
 
 ifeq ($(check_feat),1)
 ifeq ($(FEATURES_DUMP),)
-include $(srctree)/tools/build/Makefile.feature
+include $(srctree)tools/build/Makefile.feature
 else
 include $(FEATURES_DUMP)
 endif
@@ -60,13 +60,13 @@ ifeq ($(feature-disassembler-init-styled), 1)
 CFLAGS += -DDISASM_INIT_STYLED
 endif
 
-$(OUTPUT)%.yacc.c: $(srctree)/tools/bpf/%.y
+$(OUTPUT)%.yacc.c: $(srctree)tools/bpf/%.y
 	$(QUIET_BISON)$(YACC) -o $@ -d $<
 
-$(OUTPUT)%.lex.c: $(srctree)/tools/bpf/%.l
+$(OUTPUT)%.lex.c: $(srctree)tools/bpf/%.l
 	$(QUIET_FLEX)$(LEX) -o $@ $<
 
-$(OUTPUT)%.o: $(srctree)/tools/bpf/%.c
+$(OUTPUT)%.o: $(srctree)tools/bpf/%.c
 	$(QUIET_CC)$(CC) $(CFLAGS) -c -o $@ $<
 
 $(OUTPUT)%.yacc.o: $(OUTPUT)%.yacc.c
diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index 34b55ae53d0a..f738b7e0f3be 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -13,7 +13,7 @@ else
   Q = @
 endif
 
-BPF_DIR = $(srctree)/tools/lib/bpf
+BPF_DIR = $(srctree)tools/lib/bpf
 
 ifneq ($(OUTPUT),)
   _OUTPUT := $(OUTPUT)
@@ -76,9 +76,9 @@ CFLAGS += $(filter-out -Wswitch-enum -Wnested-externs,$(EXTRA_WARNINGS))
 CFLAGS += -DPACKAGE='"bpftool"' -D__EXPORTED_HEADERS__ \
 	-I$(or $(OUTPUT),.) \
 	-I$(LIBBPF_INCLUDE) \
-	-I$(srctree)/kernel/bpf/ \
-	-I$(srctree)/tools/include \
-	-I$(srctree)/tools/include/uapi
+	-I$(srctree)kernel/bpf/ \
+	-I$(srctree)tools/include \
+	-I$(srctree)tools/include/uapi
 ifneq ($(BPFTOOL_VERSION),)
 CFLAGS += -DBPFTOOL_VERSION='"$(BPFTOOL_VERSION)"'
 endif
@@ -120,7 +120,7 @@ endif
 
 ifeq ($(check_feat),1)
 ifeq ($(FEATURES_DUMP),)
-include $(srctree)/tools/build/Makefile.feature
+include $(srctree)tools/build/Makefile.feature
 else
 include $(FEATURES_DUMP)
 endif
@@ -213,7 +213,7 @@ endif
 $(OUTPUT)%.bpf.o: skeleton/%.bpf.c $(OUTPUT)vmlinux.h $(LIBBPF_BOOTSTRAP)
 	$(QUIET_CLANG)$(CLANG) \
 		-I$(or $(OUTPUT),.) \
-		-I$(srctree)/tools/include/uapi/ \
+		-I$(srctree)tools/include/uapi/ \
 		-I$(LIBBPF_BOOTSTRAP_INCLUDE) \
 		-g -O2 -Wall -fno-stack-protector \
 		--target=bpf -c $< -o $@
@@ -231,10 +231,10 @@ endif
 
 CFLAGS += $(if $(BUILD_BPF_SKELS),,-DBPFTOOL_WITHOUT_SKELETONS)
 
-$(BOOTSTRAP_OUTPUT)disasm.o: $(srctree)/kernel/bpf/disasm.c
+$(BOOTSTRAP_OUTPUT)disasm.o: $(srctree)kernel/bpf/disasm.c
 	$(QUIET_CC)$(HOSTCC) $(HOST_CFLAGS) -c -MMD $< -o $@
 
-$(OUTPUT)disasm.o: $(srctree)/kernel/bpf/disasm.c
+$(OUTPUT)disasm.o: $(srctree)kernel/bpf/disasm.c
 	$(QUIET_CC)$(CC) $(CFLAGS) -c -MMD $< -o $@
 
 $(BPFTOOL_BOOTSTRAP): $(BOOTSTRAP_OBJS) $(LIBBPF_BOOTSTRAP)
@@ -251,7 +251,7 @@ $(OUTPUT)%.o: %.c
 
 feature-detect-clean:
 	$(call QUIET_CLEAN, feature-detect)
-	$(Q)$(MAKE) -C $(srctree)/tools/build/feature/ clean >/dev/null
+	$(Q)$(MAKE) -C $(srctree)tools/build/feature/ clean >/dev/null
 
 clean: $(LIBBPF)-clean $(LIBBPF_BOOTSTRAP)-clean feature-detect-clean
 	$(call QUIET_CLEAN, bpftool)
diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
index 4b8079f294f6..fdc6508ac5df 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -27,10 +27,10 @@ HOSTLD  ?= ld
 HOSTAR  ?= ar
 CROSS_COMPILE =
 
-OUTPUT ?= $(srctree)/tools/bpf/resolve_btfids/
+OUTPUT ?= $(srctree)tools/bpf/resolve_btfids/
 
-LIBBPF_SRC := $(srctree)/tools/lib/bpf/
-SUBCMD_SRC := $(srctree)/tools/lib/subcmd/
+LIBBPF_SRC := $(srctree)tools/lib/bpf/
+SUBCMD_SRC := $(srctree)tools/lib/subcmd/
 
 BPFOBJ     := $(OUTPUT)/libbpf/libbpf.a
 LIBBPF_OUT := $(abspath $(dir $(BPFOBJ)))/
@@ -68,8 +68,8 @@ LIBELF_FLAGS := $(shell $(HOSTPKG_CONFIG) libelf --cflags 2>/dev/null)
 LIBELF_LIBS  := $(shell $(HOSTPKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
 
 HOSTCFLAGS_resolve_btfids += -g \
-          -I$(srctree)/tools/include \
-          -I$(srctree)/tools/include/uapi \
+          -I$(srctree)tools/include \
+          -I$(srctree)tools/include/uapi \
           -I$(LIBBPF_INCLUDE) \
           -I$(SUBCMD_INCLUDE) \
           $(LIBELF_FLAGS)
@@ -77,7 +77,7 @@ HOSTCFLAGS_resolve_btfids += -g \
 LIBS = $(LIBELF_LIBS) -lz
 
 export srctree OUTPUT HOSTCFLAGS_resolve_btfids Q HOSTCC HOSTLD HOSTAR
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 $(BINARY_IN): fixdep FORCE prepare | $(OUTPUT)
 	$(Q)$(MAKE) $(build)=resolve_btfids
diff --git a/tools/build/Makefile b/tools/build/Makefile
index cdebad6f1bfb..9313bec644fa 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -4,7 +4,7 @@ srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 endif
 
-include $(srctree)/tools//scripts/Makefile.include
+include $(srctree)tools//scripts/Makefile.include
 
 define allow-override
   $(if $(or $(findstring environment,$(origin $(1))),\
@@ -26,7 +26,7 @@ endif
 export Q srctree CC LD
 
 MAKEFLAGS := --no-print-directory
-build     := -f $(srctree)/tools/build/Makefile.build dir=. obj
+build     := -f $(srctree)tools/build/Makefile.build dir=. obj
 
 all: $(OUTPUT)fixdep
 
diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
index 5fb3fb3d97e0..1c3e66d0d111 100644
--- a/tools/build/Makefile.build
+++ b/tools/build/Makefile.build
@@ -32,7 +32,7 @@ ifneq ($(findstring s,$(short-opts)),)
   quiet=silent_
 endif
 
-build-dir := $(srctree)/tools/build
+build-dir := $(srctree)tools/build
 
 # Define $(fixdep) for dep-cmd function
 ifeq ($(OUTPUT),)
diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 64df118376df..e80182583305 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-feature_dir := $(srctree)/tools/build/feature
+feature_dir := $(srctree)tools/build/feature
 
 ifneq ($(OUTPUT),)
   OUTPUT_FEATURES = $(OUTPUT)feature/
diff --git a/tools/build/Makefile.include b/tools/build/Makefile.include
index 8dadaa0fbb43..77303082ef54 100644
--- a/tools/build/Makefile.include
+++ b/tools/build/Makefile.include
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
-build := -f $(srctree)/tools/build/Makefile.build dir=. obj
+build := -f $(srctree)tools/build/Makefile.build dir=. obj
 
 fixdep:
-	$(Q)$(MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= $(OUTPUT)fixdep
+	$(Q)$(MAKE) -C $(srctree)tools/build CFLAGS= LDFLAGS= $(OUTPUT)fixdep
 
 fixdep-clean:
-	$(Q)$(MAKE) -C $(srctree)/tools/build clean
+	$(Q)$(MAKE) -C $(srctree)tools/build clean
 
 .PHONY: fixdep
diff --git a/tools/build/tests/ex/Makefile b/tools/build/tests/ex/Makefile
index fee032e06a85..4625a5f66d3f 100644
--- a/tools/build/tests/ex/Makefile
+++ b/tools/build/tests/ex/Makefile
@@ -6,13 +6,13 @@ export AR      := ar
 
 ex:
 
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 ex: ex-in.o libex-in.o
 	$(CC) -o $@ $^
 
 ex.%: fixdep FORCE
-	make -f $(srctree)/tools/build/Makefile.build dir=. $@
+	make -f $(srctree)tools/build/Makefile.build dir=. $@
 
 ex-in.o: fixdep FORCE
 	make $(build)=ex
diff --git a/tools/counter/Makefile b/tools/counter/Makefile
index 3d23639fa8fc..f168ee29e1d1 100644
--- a/tools/counter/Makefile
+++ b/tools/counter/Makefile
@@ -13,7 +13,7 @@ endif
 MAKEFLAGS += -r
 
 override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include \
-	 -I$(srctree)/tools/include
+	 -I$(srctree)tools/include
 
 ALL_TARGETS := counter_example counter_watch_events
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
@@ -21,7 +21,7 @@ ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 all: $(ALL_PROGRAMS)
 
 export srctree OUTPUT CC LD CFLAGS
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 #
 # We need the following to be outside of kernel tree
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index 0828ee9e8a16..bb8a00912b28 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -24,7 +24,7 @@ ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 all: $(ALL_PROGRAMS)
 
 export srctree OUTPUT CC LD CFLAGS
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 #
 # We need the following to be outside of kernel tree
diff --git a/tools/hv/Makefile b/tools/hv/Makefile
index 6b9f42743c57..d23712ea2b1b 100644
--- a/tools/hv/Makefile
+++ b/tools/hv/Makefile
@@ -25,7 +25,7 @@ ALL_SCRIPTS := hv_get_dhcp_info.sh hv_get_dns_info.sh hv_set_ifconfig.sh
 all: $(ALL_PROGRAMS)
 
 export srctree OUTPUT CC LD CFLAGS
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 HV_KVP_DAEMON_IN := $(OUTPUT)hv_kvp_daemon-in.o
 $(HV_KVP_DAEMON_IN): FORCE
diff --git a/tools/iio/Makefile b/tools/iio/Makefile
index f4f64a152457..689bb2e46b26 100644
--- a/tools/iio/Makefile
+++ b/tools/iio/Makefile
@@ -20,7 +20,7 @@ ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 all: $(ALL_PROGRAMS)
 
 export srctree OUTPUT CC LD CFLAGS
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 #
 # We need the following to be outside of kernel tree
diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 372a17bf7d36..2ae81266354f 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -9,7 +9,7 @@ endif
 
 # when run as make -C tools/ nolibc_<foo> the arch is not set
 ifeq ($(ARCH),)
-include $(srctree)/scripts/subarch.include
+include $(srctree)scripts/subarch.include
 ARCH = $(SUBARCH)
 endif
 
@@ -85,8 +85,8 @@ headers:
 	fi > $(OUTPUT)sysroot/include/arch.h
 
 headers_standalone: headers
-	$(Q)$(MAKE) -C $(srctree) headers
-	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
+	$(Q)$(MAKE) -C $(srctree:%/=%) headers
+	$(Q)$(MAKE) -C $(srctree:%/=%) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
 
 clean:
 	$(call QUIET_CLEAN, nolibc) rm -rf "$(OUTPUT)sysroot"
diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index 74e774984d83..94d9f62dc377 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -6,7 +6,7 @@ ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-#$(info Determined 'srctree' to be $(srctree))
+#$(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 CC ?= $(CROSS_COMPILE)gcc
@@ -48,8 +48,8 @@ ifneq ($(WERROR),0)
 endif
 
 CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-CFLAGS += -I$(srctree)/tools/lib/api
-CFLAGS += -I$(srctree)/tools/include
+CFLAGS += -I$(srctree)tools/lib/api
+CFLAGS += -I$(srctree)tools/include
 
 RM = rm -f
 
@@ -70,8 +70,8 @@ libdir_SQ = $(subst ','\'',$(libdir))
 all:
 
 export srctree OUTPUT CC LD CFLAGS V
-include $(srctree)/tools/build/Makefile.include
-include $(srctree)/tools/scripts/Makefile.include
+include $(srctree)tools/build/Makefile.include
+include $(srctree)tools/scripts/Makefile.include
 
 all: fixdep $(LIBFILE)
 
diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 66970cf138fc..f42227ac10bd 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -21,7 +21,7 @@ ifndef building_out_of_srctree
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-#$(info Determined 'srctree' to be $(srctree))
+#$(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 INSTALL = install
@@ -33,7 +33,7 @@ INSTALL = install
 DESTDIR ?=
 DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
 
-include $(srctree)/tools/scripts/Makefile.arch
+include $(srctree)tools/scripts/Makefile.arch
 
 ifeq ($(LP64), 1)
   libdir_relative = lib64
@@ -49,7 +49,7 @@ man_dir_SQ = '$(subst ','\'',$(man_dir))'
 export man_dir man_dir_SQ INSTALL
 export DESTDIR DESTDIR_SQ
 
-include $(srctree)/tools/scripts/Makefile.include
+include $(srctree)tools/scripts/Makefile.include
 
 # copy a bit from Linux kbuild
 
@@ -61,7 +61,7 @@ ifndef VERBOSE
 endif
 
 INCLUDES = -I$(or $(OUTPUT),.) \
-	   -I$(srctree)/tools/include -I$(srctree)/tools/include/uapi
+	   -I$(srctree)tools/include -I$(srctree)tools/include/uapi
 
 export prefix libdir src obj
 
@@ -109,7 +109,7 @@ MAKEOVERRIDES=
 all:
 
 export srctree OUTPUT CC LD CFLAGS V
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 SHARED_OBJDIR	:= $(OUTPUT)sharedobjs/
 STATIC_OBJDIR	:= $(OUTPUT)staticobjs/
@@ -156,9 +156,9 @@ $(BPF_IN_SHARED): force $(BPF_GENERATED)
 $(BPF_IN_STATIC): force $(BPF_GENERATED)
 	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(STATIC_OBJDIR)
 
-$(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
-	$(QUIET_GEN)$(srctree)/scripts/bpf_doc.py --header \
-		--file $(srctree)/tools/include/uapi/linux/bpf.h > $(BPF_HELPER_DEFS)
+$(BPF_HELPER_DEFS): $(srctree)tools/include/uapi/linux/bpf.h
+	$(QUIET_GEN)$(srctree)scripts/bpf_doc.py --header \
+		--file $(srctree)tools/include/uapi/linux/bpf.h > $(BPF_HELPER_DEFS)
 
 $(OUTPUT)libbpf.so: $(OUTPUT)libbpf.so.$(LIBBPF_VERSION)
 
@@ -275,7 +275,7 @@ force:
 
 cscope:
 	ls *.c *.h > cscope.files
-	cscope -b -q -I $(srctree)/include -f cscope.out
+	cscope -b -q -I $(srctree)include -f cscope.out
 
 tags:
 	$(RM) -f TAGS tags
diff --git a/tools/lib/perf/Makefile b/tools/lib/perf/Makefile
index 3e998b2af153..17eac6b79b70 100644
--- a/tools/lib/perf/Makefile
+++ b/tools/lib/perf/Makefile
@@ -11,7 +11,7 @@ ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-#$(info Determined 'srctree' to be $(srctree))
+#$(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 INSTALL = install
@@ -23,8 +23,8 @@ INSTALL = install
 DESTDIR ?=
 DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
 
-include $(srctree)/tools/scripts/Makefile.include
-include $(srctree)/tools/scripts/Makefile.arch
+include $(srctree)tools/scripts/Makefile.include
+include $(srctree)tools/scripts/Makefile.arch
 
 ifeq ($(LP64), 1)
   libdir_relative = lib64
@@ -62,12 +62,12 @@ else
 endif
 
 INCLUDES = \
--I$(srctree)/tools/lib/perf/include \
--I$(srctree)/tools/lib/ \
--I$(srctree)/tools/include \
--I$(srctree)/tools/arch/$(SRCARCH)/include/ \
--I$(srctree)/tools/arch/$(SRCARCH)/include/uapi \
--I$(srctree)/tools/include/uapi
+-I$(srctree)tools/lib/perf/include \
+-I$(srctree)tools/lib/ \
+-I$(srctree)tools/include \
+-I$(srctree)tools/arch/$(SRCARCH)/include/ \
+-I$(srctree)tools/arch/$(SRCARCH)/include/uapi \
+-I$(srctree)tools/include/uapi
 
 # Append required CFLAGS
 override CFLAGS += $(EXTRA_WARNINGS)
@@ -81,7 +81,7 @@ all:
 export srctree OUTPUT CC LD CFLAGS V
 export DESTDIR DESTDIR_SQ
 
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 VERSION_SCRIPT := libperf.map
 
@@ -96,7 +96,7 @@ LIBPERF_PC := $(OUTPUT)libperf.pc
 
 LIBPERF_ALL := $(LIBPERF_A) $(OUTPUT)libperf.so*
 
-LIB_DIR := $(srctree)/tools/lib/api/
+LIB_DIR := $(srctree)tools/lib/api/
 
 ifneq ($(OUTPUT),)
 ifneq ($(subdir),)
diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index fdd0bf03fd6d..44a4b50929e4 100644
--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -6,7 +6,7 @@ ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-#$(info Determined 'srctree' to be $(srctree))
+#$(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 CC ?= $(CROSS_COMPILE)gcc
@@ -51,7 +51,7 @@ endif
 
 CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE
 
-CFLAGS += -I$(srctree)/tools/include/
+CFLAGS += -I$(srctree)tools/include/
 
 CFLAGS += $(EXTRA_WARNINGS) $(EXTRA_CFLAGS)
 
@@ -72,7 +72,7 @@ libdir_SQ = $(subst ','\'',$(libdir))
 all:
 
 export srctree OUTPUT CC LD CFLAGS V
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 all: fixdep $(LIBFILE)
 
diff --git a/tools/lib/symbol/Makefile b/tools/lib/symbol/Makefile
index 1f2390d1c0e0..7fbc8de86ad6 100644
--- a/tools/lib/symbol/Makefile
+++ b/tools/lib/symbol/Makefile
@@ -6,7 +6,7 @@ ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-#$(info Determined 'srctree' to be $(srctree))
+#$(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 CC ?= $(CROSS_COMPILE)gcc
@@ -49,8 +49,8 @@ endif
 
 CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 
-CFLAGS += -I$(srctree)/tools/lib
-CFLAGS += -I$(srctree)/tools/include
+CFLAGS += -I$(srctree)tools/lib
+CFLAGS += -I$(srctree)tools/include
 
 RM = rm -f
 
@@ -71,8 +71,8 @@ libdir_SQ = $(subst ','\'',$(libdir))
 all:
 
 export srctree OUTPUT CC LD CFLAGS V
-include $(srctree)/tools/build/Makefile.include
-include $(srctree)/tools/scripts/Makefile.include
+include $(srctree)tools/build/Makefile.include
+include $(srctree)tools/scripts/Makefile.include
 
 all: fixdep $(LIBFILE)
 
diff --git a/tools/lib/thermal/Makefile b/tools/lib/thermal/Makefile
index 8c78b2540156..3cf489bda603 100644
--- a/tools/lib/thermal/Makefile
+++ b/tools/lib/thermal/Makefile
@@ -11,7 +11,7 @@ ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-# $(info Determined 'srctree' to be $(srctree))
+# $(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 INSTALL = install
@@ -23,8 +23,8 @@ INSTALL = install
 DESTDIR ?=
 DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
 
-include $(srctree)/tools/scripts/Makefile.include
-include $(srctree)/tools/scripts/Makefile.arch
+include $(srctree)tools/scripts/Makefile.include
+include $(srctree)tools/scripts/Makefile.arch
 
 ifeq ($(LP64), 1)
   libdir_relative = lib64
@@ -61,12 +61,12 @@ endif
 
 INCLUDES = \
 -I/usr/include/libnl3 \
--I$(srctree)/tools/lib/thermal/include \
--I$(srctree)/tools/lib/ \
--I$(srctree)/tools/include \
--I$(srctree)/tools/arch/$(SRCARCH)/include/ \
--I$(srctree)/tools/arch/$(SRCARCH)/include/uapi \
--I$(srctree)/tools/include/uapi
+-I$(srctree)tools/lib/thermal/include \
+-I$(srctree)tools/lib/ \
+-I$(srctree)tools/include \
+-I$(srctree)tools/arch/$(SRCARCH)/include/ \
+-I$(srctree)tools/arch/$(SRCARCH)/include/uapi \
+-I$(srctree)tools/include/uapi
 
 # Append required CFLAGS
 override CFLAGS += $(EXTRA_WARNINGS)
@@ -82,7 +82,7 @@ all:
 export srctree OUTPUT CC LD CFLAGS V
 export DESTDIR DESTDIR_SQ
 
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 VERSION_SCRIPT := libthermal.map
 
@@ -99,7 +99,7 @@ LIBTHERMAL_ALL := $(LIBTHERMAL_A) $(OUTPUT)libthermal.so*
 THERMAL_UAPI := include/uapi/linux/thermal.h
 
 $(THERMAL_UAPI): FORCE
-	ln -sf $(srctree)/$@ $(srctree)/tools/$@
+	ln -sf $(srctree)$@ $(srctree)tools/$@
 
 $(LIBTHERMAL_IN): FORCE
 	$(Q)$(MAKE) $(build)=libthermal
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 714bf362b59c..4774f7d27bc3 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -7,7 +7,7 @@ srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 endif
 
-LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
+LIBSUBCMD_DIR = $(srctree)tools/lib/subcmd/
 ifneq ($(OUTPUT),)
   LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
 else
@@ -23,11 +23,11 @@ LIBELF_LIBS  := $(shell $(HOSTPKG_CONFIG) libelf --libs 2>/dev/null || echo -lel
 
 all: $(OBJTOOL)
 
-INCLUDES := -I$(srctree)/tools/include \
-	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
-	    -I$(srctree)/tools/arch/$(SRCARCH)/include	\
-	    -I$(srctree)/tools/objtool/include \
-	    -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
+INCLUDES := -I$(srctree)tools/include \
+	    -I$(srctree)tools/arch/$(HOSTARCH)/include/uapi \
+	    -I$(srctree)tools/arch/$(SRCARCH)/include	\
+	    -I$(srctree)tools/objtool/include \
+	    -I$(srctree)tools/objtool/arch/$(SRCARCH)/include \
 	    -I$(LIBSUBCMD_OUTPUT)/include
 # Note, EXTRA_WARNINGS here was determined for CC and not HOSTCC, it
 # is passed here to match a legacy behavior.
@@ -59,7 +59,7 @@ endif
 
 export BUILD_ORC
 export srctree OUTPUT CFLAGS SRCARCH AWK
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 $(OBJTOOL_IN): fixdep $(LIBSUBCMD) FORCE
 	$(Q)$(CONFIG_SHELL) ./sync-check.sh
diff --git a/tools/pci/Makefile b/tools/pci/Makefile
index 913c9d29bfb2..abcf0a36550e 100644
--- a/tools/pci/Makefile
+++ b/tools/pci/Makefile
@@ -22,7 +22,7 @@ SCRIPTS := pcitest.sh
 all: $(ALL_PROGRAMS)
 
 export srctree OUTPUT CC LD CFLAGS
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 #
 # We need the following to be outside of kernel tree
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index aa55850fbc21..032ddb6dad71 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 ifeq ($(src-perf),)
-src-perf := $(srctree)/tools/perf
+src-perf := $(srctree)tools/perf
 endif
 
 ifeq ($(obj-perf),)
@@ -24,7 +24,7 @@ ifeq ($(CC_NO_CLANG), 0)
   CFLAGS += -Wthread-safety
 endif
 
-include $(srctree)/tools/scripts/Makefile.arch
+include $(srctree)tools/scripts/Makefile.arch
 
 $(call detected_var,SRCARCH)
 
@@ -198,7 +198,7 @@ endif
 FEATURE_CHECK_CFLAGS-libzstd := $(LIBZSTD_CFLAGS)
 FEATURE_CHECK_LDFLAGS-libzstd := $(LIBZSTD_LDFLAGS)
 
-FEATURE_CHECK_CFLAGS-bpf = -I. -I$(srctree)/tools/include -I$(srctree)/tools/arch/$(SRCARCH)/include/uapi -I$(srctree)/tools/include/uapi
+FEATURE_CHECK_CFLAGS-bpf = -I. -I$(srctree)tools/include -I$(srctree)tools/arch/$(SRCARCH)/include/uapi -I$(srctree)tools/include/uapi
 # include ARCH specific config
 -include $(src-perf)/arch/$(SRCARCH)/Makefile
 
@@ -206,7 +206,7 @@ ifdef PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
   CFLAGS += -DHAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
 endif
 
-include $(srctree)/tools/scripts/utilities.mak
+include $(srctree)tools/scripts/utilities.mak
 
 ifeq ($(call get-executable,$(FLEX)),)
   dummy := $(error Error: $(FLEX) is missing on this system, please install it)
@@ -348,7 +348,7 @@ ifeq ($(FEATURES_DUMP),)
 # We will display at the end of this Makefile.config, using $(call feature_display_entries)
 # As we may retry some feature detection here, see the disassembler-four-args case, for instance
   FEATURE_DISPLAY_DEFERRED := 1
-include $(srctree)/tools/build/Makefile.feature
+include $(srctree)tools/build/Makefile.feature
 else
 include $(FEATURES_DUMP)
 endif
@@ -365,11 +365,11 @@ endif
 
 INC_FLAGS += -I$(src-perf)/util/include
 INC_FLAGS += -I$(src-perf)/arch/$(SRCARCH)/include
-INC_FLAGS += -I$(srctree)/tools/include/
-INC_FLAGS += -I$(srctree)/tools/arch/$(SRCARCH)/include/uapi
-INC_FLAGS += -I$(srctree)/tools/include/uapi
-INC_FLAGS += -I$(srctree)/tools/arch/$(SRCARCH)/include/
-INC_FLAGS += -I$(srctree)/tools/arch/$(SRCARCH)/
+INC_FLAGS += -I$(srctree)tools/include/
+INC_FLAGS += -I$(srctree)tools/arch/$(SRCARCH)/include/uapi
+INC_FLAGS += -I$(srctree)tools/include/uapi
+INC_FLAGS += -I$(srctree)tools/arch/$(SRCARCH)/include/
+INC_FLAGS += -I$(srctree)tools/arch/$(SRCARCH)/
 
 # $(obj-perf)      for generated common-cmds.h
 # $(obj-perf)/util for generated bison/flex headers
@@ -1221,7 +1221,7 @@ template_dir = share/perf-core/templates
 STRACE_GROUPS_DIR = share/perf-core/strace/groups
 htmldir = share/doc/perf-doc
 tipdir = share/doc/perf-tip
-srcdir = $(srctree)/tools/perf
+srcdir = $(srctree)tools/perf
 ifeq ($(prefix),/usr)
 sysconfdir = /etc
 ETC_PERFCONFIG = $(sysconfdir)/perfconfig
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 4ff08babcecc..626b07d34c9f 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -146,7 +146,7 @@ export LC_COLLATE LC_NUMERIC
 ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
-#$(info Determined 'srctree' to be $(srctree))
+#$(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 ifneq ($(objtree),)
@@ -249,7 +249,7 @@ endif
 export srctree OUTPUT RM CC CXX LD AR CFLAGS CXXFLAGS V BISON FLEX AWK
 export HOSTCC HOSTLD HOSTAR HOSTCFLAGS SHELLCHECK
 
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 ifeq ($(force_fixdep),1)
 goals := $(filter-out all sub-make, $(MAKECMDGOALS))
@@ -262,12 +262,12 @@ sub-make: fixdep
 
 else # force_fixdep
 
-LIBAPI_DIR      = $(srctree)/tools/lib/api/
-LIBBPF_DIR      = $(srctree)/tools/lib/bpf/
-LIBSUBCMD_DIR   = $(srctree)/tools/lib/subcmd/
-LIBSYMBOL_DIR   = $(srctree)/tools/lib/symbol/
-LIBPERF_DIR     = $(srctree)/tools/lib/perf/
-DOC_DIR         = $(srctree)/tools/perf/Documentation/
+LIBAPI_DIR      = $(srctree)tools/lib/api/
+LIBBPF_DIR      = $(srctree)tools/lib/bpf/
+LIBSUBCMD_DIR   = $(srctree)tools/lib/subcmd/
+LIBSYMBOL_DIR   = $(srctree)tools/lib/symbol/
+LIBPERF_DIR     = $(srctree)tools/lib/perf/
+DOC_DIR         = $(srctree)tools/perf/Documentation/
 
 # Set FEATURE_TESTS to 'all' so all possible feature checkers are executed.
 # Without this setting the output feature dump file misses some features, for
@@ -283,7 +283,7 @@ include Makefile.config
 endif
 
 ifeq ($(config),0)
-include $(srctree)/tools/scripts/Makefile.arch
+include $(srctree)tools/scripts/Makefile.arch
 -include arch/$(SRCARCH)/Makefile
 endif
 
@@ -453,7 +453,7 @@ export INSTALL SHELL_PATH
 
 SHELL = $(SHELL_PATH)
 
-arm64_gen_sysreg_dir := $(srctree)/tools/arch/arm64/tools
+arm64_gen_sysreg_dir := $(srctree)tools/arch/arm64/tools
 ifneq ($(OUTPUT),)
   arm64_gen_sysreg_outdir := $(OUTPUT)
 else
@@ -468,18 +468,18 @@ arm64-sysreg-defs-clean:
 	$(Q)$(MAKE) -C $(arm64_gen_sysreg_dir) O=$(arm64_gen_sysreg_outdir) \
 		clean > /dev/null
 
-beauty_linux_dir := $(srctree)/tools/perf/trace/beauty/include/linux/
-linux_uapi_dir := $(srctree)/tools/include/uapi/linux
-asm_generic_uapi_dir := $(srctree)/tools/include/uapi/asm-generic
-arch_asm_uapi_dir := $(srctree)/tools/arch/$(SRCARCH)/include/uapi/asm/
-x86_arch_asm_uapi_dir := $(srctree)/tools/arch/x86/include/uapi/asm/
-x86_arch_asm_dir := $(srctree)/tools/arch/x86/include/asm/
+beauty_linux_dir := $(srctree)tools/perf/trace/beauty/include/linux/
+linux_uapi_dir := $(srctree)tools/include/uapi/linux
+asm_generic_uapi_dir := $(srctree)tools/include/uapi/asm-generic
+arch_asm_uapi_dir := $(srctree)tools/arch/$(SRCARCH)/include/uapi/asm/
+x86_arch_asm_uapi_dir := $(srctree)tools/arch/x86/include/uapi/asm/
+x86_arch_asm_dir := $(srctree)tools/arch/x86/include/asm/
 
 beauty_outdir := $(OUTPUT)trace/beauty/generated
 beauty_ioctl_outdir := $(beauty_outdir)/ioctl
 drm_ioctl_array := $(beauty_ioctl_outdir)/drm_ioctl_array.c
-drm_hdr_dir := $(srctree)/tools/include/uapi/drm
-drm_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/drm_ioctl.sh
+drm_hdr_dir := $(srctree)tools/include/uapi/drm
+drm_ioctl_tbl := $(srctree)tools/perf/trace/beauty/drm_ioctl.sh
 
 # Create output directory if not already present
 _dummy := $(shell [ -d '$(beauty_ioctl_outdir)' ] || mkdir -p '$(beauty_ioctl_outdir)')
@@ -488,179 +488,179 @@ $(drm_ioctl_array): $(drm_hdr_dir)/drm.h $(drm_hdr_dir)/i915_drm.h $(drm_ioctl_t
 	$(Q)$(SHELL) '$(drm_ioctl_tbl)' $(drm_hdr_dir) > $@
 
 fadvise_advice_array := $(beauty_outdir)/fadvise_advice_array.c
-fadvise_advice_tbl := $(srctree)/tools/perf/trace/beauty/fadvise.sh
+fadvise_advice_tbl := $(srctree)tools/perf/trace/beauty/fadvise.sh
 
 $(fadvise_advice_array): $(linux_uapi_dir)/in.h $(fadvise_advice_tbl)
 	$(Q)$(SHELL) '$(fadvise_advice_tbl)' $(linux_uapi_dir) > $@
 
 fsmount_arrays := $(beauty_outdir)/fsmount_arrays.c
-fsmount_tbls := $(srctree)/tools/perf/trace/beauty/fsmount.sh
+fsmount_tbls := $(srctree)tools/perf/trace/beauty/fsmount.sh
 
 $(fsmount_arrays): $(linux_uapi_dir)/fs.h $(fsmount_tbls)
 	$(Q)$(SHELL) '$(fsmount_tbls)' $(linux_uapi_dir) > $@
 
 fspick_arrays := $(beauty_outdir)/fspick_arrays.c
-fspick_tbls := $(srctree)/tools/perf/trace/beauty/fspick.sh
+fspick_tbls := $(srctree)tools/perf/trace/beauty/fspick.sh
 
 $(fspick_arrays): $(linux_uapi_dir)/fs.h $(fspick_tbls)
 	$(Q)$(SHELL) '$(fspick_tbls)' $(linux_uapi_dir) > $@
 
 fsconfig_arrays := $(beauty_outdir)/fsconfig_arrays.c
-fsconfig_tbls := $(srctree)/tools/perf/trace/beauty/fsconfig.sh
+fsconfig_tbls := $(srctree)tools/perf/trace/beauty/fsconfig.sh
 
 $(fsconfig_arrays): $(linux_uapi_dir)/fs.h $(fsconfig_tbls)
 	$(Q)$(SHELL) '$(fsconfig_tbls)' $(linux_uapi_dir) > $@
 
 pkey_alloc_access_rights_array := $(beauty_outdir)/pkey_alloc_access_rights_array.c
-asm_generic_hdr_dir := $(srctree)/tools/include/uapi/asm-generic/
-pkey_alloc_access_rights_tbl := $(srctree)/tools/perf/trace/beauty/pkey_alloc_access_rights.sh
+asm_generic_hdr_dir := $(srctree)tools/include/uapi/asm-generic/
+pkey_alloc_access_rights_tbl := $(srctree)tools/perf/trace/beauty/pkey_alloc_access_rights.sh
 
 $(pkey_alloc_access_rights_array): $(asm_generic_hdr_dir)/mman-common.h $(pkey_alloc_access_rights_tbl)
 	$(Q)$(SHELL) '$(pkey_alloc_access_rights_tbl)' $(asm_generic_hdr_dir) > $@
 
 sndrv_ctl_ioctl_array := $(beauty_ioctl_outdir)/sndrv_ctl_ioctl_array.c
-sndrv_ctl_hdr_dir := $(srctree)/tools/include/uapi/sound
-sndrv_ctl_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/sndrv_ctl_ioctl.sh
+sndrv_ctl_hdr_dir := $(srctree)tools/include/uapi/sound
+sndrv_ctl_ioctl_tbl := $(srctree)tools/perf/trace/beauty/sndrv_ctl_ioctl.sh
 
 $(sndrv_ctl_ioctl_array): $(sndrv_ctl_hdr_dir)/asound.h $(sndrv_ctl_ioctl_tbl)
 	$(Q)$(SHELL) '$(sndrv_ctl_ioctl_tbl)' $(sndrv_ctl_hdr_dir) > $@
 
 sndrv_pcm_ioctl_array := $(beauty_ioctl_outdir)/sndrv_pcm_ioctl_array.c
-sndrv_pcm_hdr_dir := $(srctree)/tools/include/uapi/sound
-sndrv_pcm_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/sndrv_pcm_ioctl.sh
+sndrv_pcm_hdr_dir := $(srctree)tools/include/uapi/sound
+sndrv_pcm_ioctl_tbl := $(srctree)tools/perf/trace/beauty/sndrv_pcm_ioctl.sh
 
 $(sndrv_pcm_ioctl_array): $(sndrv_pcm_hdr_dir)/asound.h $(sndrv_pcm_ioctl_tbl)
 	$(Q)$(SHELL) '$(sndrv_pcm_ioctl_tbl)' $(sndrv_pcm_hdr_dir) > $@
 
 kcmp_type_array := $(beauty_outdir)/kcmp_type_array.c
-kcmp_hdr_dir := $(srctree)/tools/include/uapi/linux/
-kcmp_type_tbl := $(srctree)/tools/perf/trace/beauty/kcmp_type.sh
+kcmp_hdr_dir := $(srctree)tools/include/uapi/linux/
+kcmp_type_tbl := $(srctree)tools/perf/trace/beauty/kcmp_type.sh
 
 $(kcmp_type_array): $(kcmp_hdr_dir)/kcmp.h $(kcmp_type_tbl)
 	$(Q)$(SHELL) '$(kcmp_type_tbl)' $(kcmp_hdr_dir) > $@
 
 kvm_ioctl_array := $(beauty_ioctl_outdir)/kvm_ioctl_array.c
-kvm_hdr_dir := $(srctree)/tools/include/uapi/linux
-kvm_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/kvm_ioctl.sh
+kvm_hdr_dir := $(srctree)tools/include/uapi/linux
+kvm_ioctl_tbl := $(srctree)tools/perf/trace/beauty/kvm_ioctl.sh
 
 $(kvm_ioctl_array): $(kvm_hdr_dir)/kvm.h $(kvm_ioctl_tbl)
 	$(Q)$(SHELL) '$(kvm_ioctl_tbl)' $(kvm_hdr_dir) > $@
 
 socket_arrays := $(beauty_outdir)/socket.c
-socket_tbl := $(srctree)/tools/perf/trace/beauty/socket.sh
+socket_tbl := $(srctree)tools/perf/trace/beauty/socket.sh
 
 $(socket_arrays): $(linux_uapi_dir)/in.h $(beauty_linux_dir)/socket.h $(socket_tbl)
 	$(Q)$(SHELL) '$(socket_tbl)' $(linux_uapi_dir) $(beauty_linux_dir) > $@
 
 sockaddr_arrays := $(beauty_outdir)/sockaddr.c
-sockaddr_tbl := $(srctree)/tools/perf/trace/beauty/sockaddr.sh
+sockaddr_tbl := $(srctree)tools/perf/trace/beauty/sockaddr.sh
 
 $(sockaddr_arrays): $(beauty_linux_dir)/socket.h $(sockaddr_tbl)
 	$(Q)$(SHELL) '$(sockaddr_tbl)' $(beauty_linux_dir) > $@
 
 vhost_virtio_ioctl_array := $(beauty_ioctl_outdir)/vhost_virtio_ioctl_array.c
-vhost_virtio_hdr_dir := $(srctree)/tools/include/uapi/linux
-vhost_virtio_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/vhost_virtio_ioctl.sh
+vhost_virtio_hdr_dir := $(srctree)tools/include/uapi/linux
+vhost_virtio_ioctl_tbl := $(srctree)tools/perf/trace/beauty/vhost_virtio_ioctl.sh
 
 $(vhost_virtio_ioctl_array): $(vhost_virtio_hdr_dir)/vhost.h $(vhost_virtio_ioctl_tbl)
 	$(Q)$(SHELL) '$(vhost_virtio_ioctl_tbl)' $(vhost_virtio_hdr_dir) > $@
 
 perf_ioctl_array := $(beauty_ioctl_outdir)/perf_ioctl_array.c
-perf_hdr_dir := $(srctree)/tools/include/uapi/linux
-perf_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/perf_ioctl.sh
+perf_hdr_dir := $(srctree)tools/include/uapi/linux
+perf_ioctl_tbl := $(srctree)tools/perf/trace/beauty/perf_ioctl.sh
 
 $(perf_ioctl_array): $(perf_hdr_dir)/perf_event.h $(perf_ioctl_tbl)
 	$(Q)$(SHELL) '$(perf_ioctl_tbl)' $(perf_hdr_dir) > $@
 
 madvise_behavior_array := $(beauty_outdir)/madvise_behavior_array.c
-madvise_hdr_dir := $(srctree)/tools/include/uapi/asm-generic/
-madvise_behavior_tbl := $(srctree)/tools/perf/trace/beauty/madvise_behavior.sh
+madvise_hdr_dir := $(srctree)tools/include/uapi/asm-generic/
+madvise_behavior_tbl := $(srctree)tools/perf/trace/beauty/madvise_behavior.sh
 
 $(madvise_behavior_array): $(madvise_hdr_dir)/mman-common.h $(madvise_behavior_tbl)
 	$(Q)$(SHELL) '$(madvise_behavior_tbl)' $(madvise_hdr_dir) > $@
 
 mmap_flags_array := $(beauty_outdir)/mmap_flags_array.c
-mmap_flags_tbl := $(srctree)/tools/perf/trace/beauty/mmap_flags.sh
+mmap_flags_tbl := $(srctree)tools/perf/trace/beauty/mmap_flags.sh
 
 $(mmap_flags_array): $(linux_uapi_dir)/mman.h $(asm_generic_uapi_dir)/mman.h $(asm_generic_uapi_dir)/mman-common.h $(mmap_flags_tbl)
 	$(Q)$(SHELL) '$(mmap_flags_tbl)' $(linux_uapi_dir) $(asm_generic_uapi_dir) $(arch_asm_uapi_dir) > $@
 
 mremap_flags_array := $(beauty_outdir)/mremap_flags_array.c
-mremap_flags_tbl := $(srctree)/tools/perf/trace/beauty/mremap_flags.sh
+mremap_flags_tbl := $(srctree)tools/perf/trace/beauty/mremap_flags.sh
 
 $(mremap_flags_array): $(linux_uapi_dir)/mman.h $(mremap_flags_tbl)
 	$(Q)$(SHELL) '$(mremap_flags_tbl)' $(linux_uapi_dir) > $@
 
 mount_flags_array := $(beauty_outdir)/mount_flags_array.c
-mount_flags_tbl := $(srctree)/tools/perf/trace/beauty/mount_flags.sh
+mount_flags_tbl := $(srctree)tools/perf/trace/beauty/mount_flags.sh
 
 $(mount_flags_array): $(linux_uapi_dir)/fs.h $(mount_flags_tbl)
 	$(Q)$(SHELL) '$(mount_flags_tbl)' $(linux_uapi_dir) > $@
 
 move_mount_flags_array := $(beauty_outdir)/move_mount_flags_array.c
-move_mount_flags_tbl := $(srctree)/tools/perf/trace/beauty/move_mount_flags.sh
+move_mount_flags_tbl := $(srctree)tools/perf/trace/beauty/move_mount_flags.sh
 
 $(move_mount_flags_array): $(linux_uapi_dir)/fs.h $(move_mount_flags_tbl)
 	$(Q)$(SHELL) '$(move_mount_flags_tbl)' $(linux_uapi_dir) > $@
 
 
 mmap_prot_array := $(beauty_outdir)/mmap_prot_array.c
-mmap_prot_tbl := $(srctree)/tools/perf/trace/beauty/mmap_prot.sh
+mmap_prot_tbl := $(srctree)tools/perf/trace/beauty/mmap_prot.sh
 
 $(mmap_prot_array): $(asm_generic_uapi_dir)/mman.h $(asm_generic_uapi_dir)/mman-common.h $(mmap_prot_tbl)
 	$(Q)$(SHELL) '$(mmap_prot_tbl)' $(asm_generic_uapi_dir) $(arch_asm_uapi_dir) > $@
 
 prctl_option_array := $(beauty_outdir)/prctl_option_array.c
-prctl_hdr_dir := $(srctree)/tools/include/uapi/linux/
-prctl_option_tbl := $(srctree)/tools/perf/trace/beauty/prctl_option.sh
+prctl_hdr_dir := $(srctree)tools/include/uapi/linux/
+prctl_option_tbl := $(srctree)tools/perf/trace/beauty/prctl_option.sh
 
 $(prctl_option_array): $(prctl_hdr_dir)/prctl.h $(prctl_option_tbl)
 	$(Q)$(SHELL) '$(prctl_option_tbl)' $(prctl_hdr_dir) > $@
 
 usbdevfs_ioctl_array := $(beauty_ioctl_outdir)/usbdevfs_ioctl_array.c
-usbdevfs_ioctl_tbl := $(srctree)/tools/perf/trace/beauty/usbdevfs_ioctl.sh
+usbdevfs_ioctl_tbl := $(srctree)tools/perf/trace/beauty/usbdevfs_ioctl.sh
 
 $(usbdevfs_ioctl_array): $(linux_uapi_dir)/usbdevice_fs.h $(usbdevfs_ioctl_tbl)
 	$(Q)$(SHELL) '$(usbdevfs_ioctl_tbl)' $(linux_uapi_dir) > $@
 
 x86_arch_prctl_code_array := $(beauty_outdir)/x86_arch_prctl_code_array.c
-x86_arch_prctl_code_tbl := $(srctree)/tools/perf/trace/beauty/x86_arch_prctl.sh
+x86_arch_prctl_code_tbl := $(srctree)tools/perf/trace/beauty/x86_arch_prctl.sh
 
 $(x86_arch_prctl_code_array): $(x86_arch_asm_uapi_dir)/prctl.h $(x86_arch_prctl_code_tbl)
 	$(Q)$(SHELL) '$(x86_arch_prctl_code_tbl)' $(x86_arch_asm_uapi_dir) > $@
 
 x86_arch_irq_vectors_array := $(beauty_outdir)/x86_arch_irq_vectors_array.c
-x86_arch_irq_vectors_tbl := $(srctree)/tools/perf/trace/beauty/tracepoints/x86_irq_vectors.sh
+x86_arch_irq_vectors_tbl := $(srctree)tools/perf/trace/beauty/tracepoints/x86_irq_vectors.sh
 
 $(x86_arch_irq_vectors_array): $(x86_arch_asm_dir)/irq_vectors.h $(x86_arch_irq_vectors_tbl)
 	$(Q)$(SHELL) '$(x86_arch_irq_vectors_tbl)' $(x86_arch_asm_dir) > $@
 
 x86_arch_MSRs_array := $(beauty_outdir)/x86_arch_MSRs_array.c
-x86_arch_MSRs_tbl := $(srctree)/tools/perf/trace/beauty/tracepoints/x86_msr.sh
+x86_arch_MSRs_tbl := $(srctree)tools/perf/trace/beauty/tracepoints/x86_msr.sh
 
 $(x86_arch_MSRs_array): $(x86_arch_asm_dir)/msr-index.h $(x86_arch_MSRs_tbl)
 	$(Q)$(SHELL) '$(x86_arch_MSRs_tbl)' $(x86_arch_asm_dir) > $@
 
 rename_flags_array := $(beauty_outdir)/rename_flags_array.c
-rename_flags_tbl := $(srctree)/tools/perf/trace/beauty/rename_flags.sh
+rename_flags_tbl := $(srctree)tools/perf/trace/beauty/rename_flags.sh
 
 $(rename_flags_array): $(linux_uapi_dir)/fs.h $(rename_flags_tbl)
 	$(Q)$(SHELL) '$(rename_flags_tbl)' $(linux_uapi_dir) > $@
 
 arch_errno_name_array := $(beauty_outdir)/arch_errno_name_array.c
-arch_errno_hdr_dir := $(srctree)/tools
-arch_errno_tbl := $(srctree)/tools/perf/trace/beauty/arch_errno_names.sh
+arch_errno_hdr_dir := $(srctree)tools
+arch_errno_tbl := $(srctree)tools/perf/trace/beauty/arch_errno_names.sh
 
 $(arch_errno_name_array): $(arch_errno_tbl)
 	$(Q)$(SHELL) '$(arch_errno_tbl)' '$(patsubst -%,,$(CC))' $(arch_errno_hdr_dir) > $@
 
 sync_file_range_arrays := $(beauty_outdir)/sync_file_range_arrays.c
-sync_file_range_tbls := $(srctree)/tools/perf/trace/beauty/sync_file_range.sh
+sync_file_range_tbls := $(srctree)tools/perf/trace/beauty/sync_file_range.sh
 
 $(sync_file_range_arrays): $(linux_uapi_dir)/fs.h $(sync_file_range_tbls)
 	$(Q)$(SHELL) '$(sync_file_range_tbls)' $(linux_uapi_dir) > $@
 
-TESTS_CORESIGHT_DIR := $(srctree)/tools/perf/tests/shell/coresight
+TESTS_CORESIGHT_DIR := $(srctree)tools/perf/tests/shell/coresight
 
 tests-coresight-targets: FORCE
 	$(Q)$(MAKE) -C $(TESTS_CORESIGHT_DIR)
@@ -697,13 +697,13 @@ PERF_IN := $(OUTPUT)perf-in.o
 PMU_EVENTS_IN := $(OUTPUT)pmu-events/pmu-events-in.o
 export NO_JEVENTS
 
-build := -f $(srctree)/tools/build/Makefile.build dir=. obj
+build := -f $(srctree)tools/build/Makefile.build dir=. obj
 
 $(PERF_IN): prepare FORCE
 	$(Q)$(MAKE) $(build)=perf
 
 $(PMU_EVENTS_IN): FORCE prepare
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=pmu-events obj=pmu-events
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=pmu-events obj=pmu-events
 
 $(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
 	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
@@ -798,25 +798,25 @@ prepare: $(LIBBPF)
 endif
 
 $(OUTPUT)%.o: %.c prepare FORCE
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=$(build-dir) $@
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=$(build-dir) $@
 
 $(OUTPUT)%.i: %.c prepare FORCE
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=$(build-dir) $@
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=$(build-dir) $@
 
 $(OUTPUT)%.s: %.c prepare FORCE
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=$(build-dir) $@
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=$(build-dir) $@
 
 $(OUTPUT)%-bison.o: %.c prepare FORCE
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=$(build-dir) $@
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=$(build-dir) $@
 
 $(OUTPUT)%-flex.o: %.c prepare FORCE
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=$(build-dir) $@
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=$(build-dir) $@
 
 $(OUTPUT)%.o: %.S prepare FORCE
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=$(build-dir) $@
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=$(build-dir) $@
 
 $(OUTPUT)%.i: %.S prepare FORCE
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=$(build-dir) $@
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=$(build-dir) $@
 
 $(OUTPUT)perf-%: %.o $(PERFLIBS)
 	$(QUIET_LINK)$(CC) $(CFLAGS) -o $@ $(LDFLAGS) $(filter %.o,$^) $(LIBS)
@@ -844,7 +844,7 @@ ifndef NO_JVMTI
 LIBJVMTI_IN := $(OUTPUT)jvmti/jvmti-in.o
 
 $(LIBJVMTI_IN): FORCE
-	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=jvmti obj=jvmti
+	$(Q)$(MAKE) -f $(srctree)tools/build/Makefile.build dir=jvmti obj=jvmti
 
 $(OUTPUT)$(LIBJVMTI): $(LIBJVMTI_IN)
 	$(QUIET_LINK)$(CC) $(LDFLAGS) -shared -Wl,-soname -Wl,$(LIBJVMTI) -o $@ $<
@@ -1103,7 +1103,7 @@ endif
 CLANG_OPTIONS = -Wall
 CLANG_SYS_INCLUDES = $(call get_sys_includes,$(CLANG),$(CLANG_TARGET_ARCH))
 BPF_INCLUDE := -I$(SKEL_TMP_OUT)/.. -I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES)
-TOOLS_UAPI_INCLUDE := -I$(srctree)/tools/include/uapi
+TOOLS_UAPI_INCLUDE := -I$(srctree)tools/include/uapi
 
 ifneq ($(WERROR),0)
   CLANG_OPTIONS += -Werror
diff --git a/tools/perf/arch/arm64/Makefile b/tools/perf/arch/arm64/Makefile
index fab3095fb5d0..12b4eeaa6e87 100644
--- a/tools/perf/arch/arm64/Makefile
+++ b/tools/perf/arch/arm64/Makefile
@@ -12,9 +12,9 @@ HAVE_KVM_STAT_SUPPORT := 1
 
 out    := $(OUTPUT)arch/arm64/include/generated/asm
 header := $(out)/syscalls.c
-incpath := $(srctree)/tools
-sysdef := $(srctree)/tools/arch/arm64/include/uapi/asm/unistd.h
-sysprf := $(srctree)/tools/perf/arch/arm64/entry/syscalls/
+incpath := $(srctree)tools
+sysdef := $(srctree)tools/arch/arm64/include/uapi/asm/unistd.h
+sysprf := $(srctree)tools/perf/arch/arm64/entry/syscalls/
 systbl := $(sysprf)/mksyscalltbl
 
 # Create output directory if not already present
diff --git a/tools/perf/arch/loongarch/Makefile b/tools/perf/arch/loongarch/Makefile
index c392e7af4743..73af6d9b0dd1 100644
--- a/tools/perf/arch/loongarch/Makefile
+++ b/tools/perf/arch/loongarch/Makefile
@@ -11,9 +11,9 @@ PERF_HAVE_JITDUMP := 1
 
 out    := $(OUTPUT)arch/loongarch/include/generated/asm
 header := $(out)/syscalls.c
-incpath := $(srctree)/tools
-sysdef := $(srctree)/tools/arch/loongarch/include/uapi/asm/unistd.h
-sysprf := $(srctree)/tools/perf/arch/loongarch/entry/syscalls/
+incpath := $(srctree)tools
+sysdef := $(srctree)tools/arch/loongarch/include/uapi/asm/unistd.h
+sysprf := $(srctree)tools/perf/arch/loongarch/entry/syscalls/
 systbl := $(sysprf)/mksyscalltbl
 
 # Create output directory if not already present
diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
index 8bc09072e3d6..6c4cbf0ee3af 100644
--- a/tools/perf/arch/mips/Makefile
+++ b/tools/perf/arch/mips/Makefile
@@ -6,7 +6,7 @@ endif
 # Syscall table generation for perf
 out    := $(OUTPUT)arch/mips/include/generated/asm
 header := $(out)/syscalls_n64.c
-sysprf := $(srctree)/tools/perf/arch/mips/entry/syscalls
+sysprf := $(srctree)tools/perf/arch/mips/entry/syscalls
 sysdef := $(sysprf)/syscall_n64.tbl
 systbl := $(sysprf)/mksyscalltbl
 
diff --git a/tools/perf/arch/powerpc/Makefile b/tools/perf/arch/powerpc/Makefile
index 840ea0e59287..9d68539d38fe 100644
--- a/tools/perf/arch/powerpc/Makefile
+++ b/tools/perf/arch/powerpc/Makefile
@@ -14,7 +14,7 @@ PERF_HAVE_JITDUMP := 1
 out    := $(OUTPUT)arch/powerpc/include/generated/asm
 header32 := $(out)/syscalls_32.c
 header64 := $(out)/syscalls_64.c
-sysprf := $(srctree)/tools/perf/arch/powerpc/entry/syscalls
+sysprf := $(srctree)tools/perf/arch/powerpc/entry/syscalls
 sysdef := $(sysprf)/syscall.tbl
 systbl := $(sysprf)/mksyscalltbl
 
diff --git a/tools/perf/arch/s390/Makefile b/tools/perf/arch/s390/Makefile
index 74bffbea03e2..592019a7b814 100644
--- a/tools/perf/arch/s390/Makefile
+++ b/tools/perf/arch/s390/Makefile
@@ -12,7 +12,7 @@ PERF_HAVE_JITDUMP := 1
 
 out    := $(OUTPUT)arch/s390/include/generated/asm
 header := $(out)/syscalls_64.c
-sysprf := $(srctree)/tools/perf/arch/s390/entry/syscalls
+sysprf := $(srctree)tools/perf/arch/s390/entry/syscalls
 sysdef := $(sysprf)/syscall.tbl
 systbl := $(sysprf)/mksyscalltbl
 
diff --git a/tools/perf/arch/x86/Makefile b/tools/perf/arch/x86/Makefile
index 5a9f9a7bf07d..3ef9f6309b9a 100644
--- a/tools/perf/arch/x86/Makefile
+++ b/tools/perf/arch/x86/Makefile
@@ -13,7 +13,7 @@ PERF_HAVE_JITDUMP := 1
 generated := $(OUTPUT)arch/x86/include/generated
 out       := $(generated)/asm
 header    := $(out)/syscalls_64.c
-sys       := $(srctree)/tools/perf/arch/x86/entry/syscalls
+sys       := $(srctree)tools/perf/arch/x86/entry/syscalls
 systbl    := $(sys)/syscalltbl.sh
 
 # Create output directory if not already present
diff --git a/tools/power/acpi/Makefile.config b/tools/power/acpi/Makefile.config
index 7df61e8ad7be..82d9c110b079 100644
--- a/tools/power/acpi/Makefile.config
+++ b/tools/power/acpi/Makefile.config
@@ -8,12 +8,12 @@
 ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
-#$(info Determined 'srctree' to be $(srctree))
+#$(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
-include $(srctree)/../../scripts/Makefile.include
+include $(srctree)../../scripts/Makefile.include
 
-OUTPUT=$(srctree)/
+OUTPUT=$(srctree)
 ifeq ("$(origin O)", "command line")
 	OUTPUT := $(O)/tools/power/acpi/
 endif
@@ -66,7 +66,7 @@ WARNINGS += $(call cc-supports,-Wstrict-prototypes)
 WARNINGS += $(call cc-supports,-Wdeclaration-after-statement)
 
 KERNEL_INCLUDE := $(OUTPUT)include
-ACPICA_INCLUDE := $(srctree)/../../../drivers/acpi/acpica
+ACPICA_INCLUDE := $(srctree)../../../drivers/acpi/acpica
 CFLAGS += -D_LINUX -I$(KERNEL_INCLUDE) -I$(ACPICA_INCLUDE)
 CFLAGS += $(WARNINGS)
 MKDIR = mkdir
diff --git a/tools/power/acpi/Makefile.rules b/tools/power/acpi/Makefile.rules
index b71aada77688..0b5d85814a94 100644
--- a/tools/power/acpi/Makefile.rules
+++ b/tools/power/acpi/Makefile.rules
@@ -17,7 +17,7 @@ $(KERNEL_INCLUDE):
 	$(ECHO) "  MKDIR   " $(subst $(OUTPUT),,$@)
 	$(QUIET) mkdir -p $(KERNEL_INCLUDE)
 	$(ECHO) "  CP      " $(subst $(OUTPUT),,$@)
-	$(QUIET) cp -rf $(srctree)/../../../include/acpi $(KERNEL_INCLUDE)/
+	$(QUIET) cp -rf $(srctree)../../../include/acpi $(KERNEL_INCLUDE)/
 
 $(objdir)%.o: %.c $(KERNEL_INCLUDE)
 	$(ECHO) "  CC      " $(subst $(OUTPUT),,$@)
diff --git a/tools/power/acpi/tools/acpidump/Makefile b/tools/power/acpi/tools/acpidump/Makefile
index 886bba6c58cd..454b88e6cccb 100644
--- a/tools/power/acpi/tools/acpidump/Makefile
+++ b/tools/power/acpi/tools/acpidump/Makefile
@@ -46,7 +46,7 @@ TOOL_OBJS = \
 
 include ../../Makefile.rules
 
-install-man: $(srctree)/man/acpidump.8
+install-man: $(srctree)man/acpidump.8
 	$(ECHO) "  INST    " acpidump.8
 	$(QUIET) $(INSTALL_DATA) -D $< $(DESTDIR)$(mandir)/man8/acpidump.8
 uninstall-man:
diff --git a/tools/power/acpi/tools/pfrut/Makefile b/tools/power/acpi/tools/pfrut/Makefile
index 61c1a96fd433..d55f054b70b8 100644
--- a/tools/power/acpi/tools/pfrut/Makefile
+++ b/tools/power/acpi/tools/pfrut/Makefile
@@ -15,7 +15,7 @@ TOOL_OBJS = \
 
 include ../../Makefile.rules
 
-install-man: $(srctree)/man/pfrut.8
+install-man: $(srctree)man/pfrut.8
 	$(ECHO) "  INST    " pfrut.8
 	$(QUIET) $(INSTALL_DATA) -D $< $(DESTDIR)$(mandir)/man8/pfrut.8
 uninstall-man:
diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
index fcb13e08effe..33c4da825170 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -22,7 +22,7 @@ ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 all: $(ALL_PROGRAMS)
 
 export srctree OUTPUT CC LD CFLAGS
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 #
 # We need the following to be outside of kernel tree
diff --git a/tools/spi/Makefile b/tools/spi/Makefile
index c511864f270b..fe730d944b2e 100644
--- a/tools/spi/Makefile
+++ b/tools/spi/Makefile
@@ -20,7 +20,7 @@ ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 all: $(ALL_PROGRAMS)
 
 export srctree OUTPUT CC LD CFLAGS
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 #
 # We need the following to be outside of kernel tree
diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index acfd59dcba56..99eebfb35468 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -17,11 +17,11 @@ srctree := $(patsubst %tools/testing/selftests/,%,$(dir $(CURDIR)))
 endif
 
 ifeq ($(ARCH),)
-include $(srctree)/scripts/subarch.include
+include $(srctree)scripts/subarch.include
 ARCH = $(SUBARCH)
 endif
 
-objtree ?= $(srctree)
+objtree ?= $(srctree:%/=%)
 
 # XARCH extends the kernel's ARCH with a few variants of the same
 # architecture that only differ by the configuration, the toolchain
@@ -65,7 +65,7 @@ IMAGE_ppc64le    = arch/powerpc/boot/zImage
 IMAGE_riscv      = arch/riscv/boot/Image
 IMAGE_s390       = arch/s390/boot/bzImage
 IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
-IMAGE            = $(objtree)/$(IMAGE_$(XARCH))
+IMAGE            = $(objtree)$(IMAGE_$(XARCH))
 IMAGE_NAME       = $(notdir $(IMAGE))
 
 # default kernel configurations that appear to be usable
@@ -197,8 +197,8 @@ sysroot: sysroot/$(ARCH)/include
 sysroot/$(ARCH)/include:
 	$(Q)rm -rf sysroot/$(ARCH) sysroot/sysroot
 	$(QUIET_MKDIR)mkdir -p sysroot
-	$(Q)$(MAKE) -C $(srctree) outputmakefile
-	$(Q)$(MAKE) -C $(srctree)/tools/include/nolibc ARCH=$(ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
+	$(Q)$(MAKE) -C $(srctree:%/=%) outputmakefile
+	$(Q)$(MAKE) -C $(srctree)tools/include/nolibc ARCH=$(ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
 	$(Q)mv sysroot/sysroot sysroot/$(ARCH)
 
 ifneq ($(NOLIBC_SYSROOT),0)
@@ -208,7 +208,7 @@ nolibc-test: nolibc-test.c nolibc-test-linkage.c sysroot/$(ARCH)/include
 else
 nolibc-test: nolibc-test.c nolibc-test-linkage.c
 	$(QUIET_CC)$(CC) $(CFLAGS) $(LDFLAGS) -o $@ \
-	  -nostdlib -static -include $(srctree)/tools/include/nolibc/nolibc.h nolibc-test.c nolibc-test-linkage.c -lgcc
+	  -nostdlib -static -include $(srctree)tools/include/nolibc/nolibc.h nolibc-test.c nolibc-test-linkage.c -lgcc
 endif
 
 libc-test: nolibc-test.c nolibc-test-linkage.c
@@ -230,7 +230,7 @@ run-user: nolibc-test
 	$(Q)$(REPORT) $(CURDIR)/run.out
 
 initramfs.cpio: kernel nolibc-test
-	$(QUIET_GEN)echo 'file /init nolibc-test 755 0 0' | $(objtree)/usr/gen_init_cpio - > initramfs.cpio
+	$(QUIET_GEN)echo 'file /init nolibc-test 755 0 0' | $(objtree)usr/gen_init_cpio - > initramfs.cpio
 
 initramfs: nolibc-test
 	$(QUIET_MKDIR)mkdir -p initramfs
@@ -238,17 +238,17 @@ initramfs: nolibc-test
 	$(Q)cp nolibc-test initramfs/init
 
 defconfig:
-	$(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
+	$(Q)$(MAKE) -C $(srctree:%/=%) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
 	$(Q)if [ -n "$(EXTRACONFIG)" ]; then \
-		$(srctree)/scripts/config --file $(objtree)/.config $(EXTRACONFIG); \
-		$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) olddefconfig < /dev/null; \
+		$(srctree)scripts/config --file $(objtree)/.config $(EXTRACONFIG); \
+		$(MAKE) -C $(srctree:%/=%) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) olddefconfig < /dev/null; \
 	fi
 
 kernel:
-	$(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) < /dev/null
+	$(Q)$(MAKE) -C $(srctree:%/=%) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) < /dev/null
 
 kernel-standalone: initramfs
-	$(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs < /dev/null
+	$(Q)$(MAKE) -C $(srctree:%/=%) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs < /dev/null
 
 # run the tests after building the kernel
 run: kernel initramfs.cpio
diff --git a/tools/thermal/lib/Makefile b/tools/thermal/lib/Makefile
index f5323c5a9ca0..20fbfc945cff 100644
--- a/tools/thermal/lib/Makefile
+++ b/tools/thermal/lib/Makefile
@@ -11,7 +11,7 @@ ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-# $(info Determined 'srctree' to be $(srctree))
+# $(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 INSTALL = install
@@ -23,8 +23,8 @@ INSTALL = install
 DESTDIR ?=
 DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
 
-include $(srctree)/tools/scripts/Makefile.include
-include $(srctree)/tools/scripts/Makefile.arch
+include $(srctree)tools/scripts/Makefile.include
+include $(srctree)tools/scripts/Makefile.arch
 
 ifeq ($(LP64), 1)
   libdir_relative = lib64
@@ -61,12 +61,12 @@ endif
 
 INCLUDES = \
 -I/usr/include/libnl3 \
--I$(srctree)/tools/lib/thermal/include \
--I$(srctree)/tools/lib/ \
--I$(srctree)/tools/include \
--I$(srctree)/tools/arch/$(SRCARCH)/include/ \
--I$(srctree)/tools/arch/$(SRCARCH)/include/uapi \
--I$(srctree)/tools/include/uapi
+-I$(srctree)tools/lib/thermal/include \
+-I$(srctree)tools/lib/ \
+-I$(srctree)tools/include \
+-I$(srctree)tools/arch/$(SRCARCH)/include/ \
+-I$(srctree)tools/arch/$(SRCARCH)/include/uapi \
+-I$(srctree)tools/include/uapi
 
 # Append required CFLAGS
 override CFLAGS += $(EXTRA_WARNINGS)
@@ -81,7 +81,7 @@ all:
 export srctree OUTPUT CC LD CFLAGS V
 export DESTDIR DESTDIR_SQ
 
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 PATCHLEVEL    = $(LIBTHERMAL_TOOLS_PATCHLEVEL)
 EXTRAVERSION  = $(LIBTHERMAL_TOOLS_EXTRAVERSION)
diff --git a/tools/thermal/thermal-engine/Makefile b/tools/thermal/thermal-engine/Makefile
index 5bc3bc70a418..bd80095adc5b 100644
--- a/tools/thermal/thermal-engine/Makefile
+++ b/tools/thermal/thermal-engine/Makefile
@@ -5,15 +5,15 @@ ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-# $(info Determined 'srctree' to be $(srctree))
+# $(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 CFLAGS = -Wall -Wextra
-CFLAGS += -I$(srctree)/tools/thermal/lib
-CFLAGS += -I$(srctree)/tools/lib/thermal/include
+CFLAGS += -I$(srctree)tools/thermal/lib
+CFLAGS += -I$(srctree)tools/lib/thermal/include
 
-LDFLAGS = -L$(srctree)/tools/thermal/lib
-LDFLAGS += -L$(srctree)/tools/lib/thermal
+LDFLAGS = -L$(srctree)tools/thermal/lib
+LDFLAGS += -L$(srctree)tools/lib/thermal
 LDFLAGS += -lthermal_tools
 LDFLAGS += -lthermal
 LDFLAGS += -lconfig
diff --git a/tools/thermal/thermometer/Makefile b/tools/thermal/thermometer/Makefile
index 624359d3503c..686f1ac8f341 100644
--- a/tools/thermal/thermometer/Makefile
+++ b/tools/thermal/thermometer/Makefile
@@ -5,13 +5,13 @@ ifeq ($(srctree),)
 srctree := $(dir $(CURDIR))
 srctree := $(dir $(srctree:%/=%))
 srctree := $(dir $(srctree:%/=%))
-# $(info Determined 'srctree' to be $(srctree))
+# $(info Determined 'srctree' to be $(srctree:%/=%))
 endif
 
 CFLAGS = -Wall -Wextra
-CFLAGS += -I$(srctree)/tools/thermal/lib
+CFLAGS += -I$(srctree)tools/thermal/lib
 
-LDFLAGS = -L$(srctree)/tools/thermal/lib
+LDFLAGS = -L$(srctree)tools/thermal/lib
 LDFLAGS += -lthermal_tools
 LDFLAGS += -lconfig
 
diff --git a/tools/usb/Makefile b/tools/usb/Makefile
index 6f80415d04be..c092182a31e5 100644
--- a/tools/usb/Makefile
+++ b/tools/usb/Makefile
@@ -13,7 +13,7 @@ endif
 # (this improves performance and avoids hard-to-debug behaviour);
 MAKEFLAGS += -r
 
-override CFLAGS += -O2 -Wall -Wextra -g -D_GNU_SOURCE -I$(OUTPUT)include -I$(srctree)/tools/include
+override CFLAGS += -O2 -Wall -Wextra -g -D_GNU_SOURCE -I$(OUTPUT)include -I$(srctree)tools/include
 override LDFLAGS += -lpthread
 
 ALL_TARGETS := testusb ffs-test
@@ -22,7 +22,7 @@ ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 all: $(ALL_PROGRAMS)
 
 export srctree OUTPUT CC LD CFLAGS
-include $(srctree)/tools/build/Makefile.include
+include $(srctree)tools/build/Makefile.include
 
 TESTUSB_IN := $(OUTPUT)testusb-in.o
 $(TESTUSB_IN): FORCE
-- 
2.39.2


