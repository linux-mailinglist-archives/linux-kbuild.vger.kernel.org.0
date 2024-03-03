Return-Path: <linux-kbuild+bounces-1112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7986F863
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3D1C1F210FF
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B8D1378;
	Mon,  4 Mar 2024 02:09:27 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE85A31
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518167; cv=none; b=soI1VSq4C9VQ4UWC5FFWTT/ZL53zeViXxAqHekMHArvXhHrOhVbmxZbhF5p/Rg2vFPKFI2LaTF8U1XeX86SOT1r8BWTw61Yu6QTZKjJXs67ocICr8kEsJ5bjKaqK4wfRVeW/E8tS3OXR5UjnrWEeYuMzizjgEMjnxMSc+7Rz3YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518167; c=relaxed/simple;
	bh=zyIOidMJlyg+13uR5y4ivlEvslCAPE165DGDVSx20MQ=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=kqMkvyJmipv8p8MkTyV146JwzabKYpLmIvcCfJdqPuQvtm5YkzfgJ1QP4kf2C7130vyRtexn7Gaut0RQL2JwxnHD0n5P814S1QbWlQC9sefG5Ae1ytb2LnVwI2EWKgGLWfvG9Dko39COmlRmaRhJFe/7GuhKfKzZO3TjdUrhZSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 424297Sc021809
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:09:13 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 424296iS021808;
	Sun, 3 Mar 2024 18:09:06 -0800 (PST)
	(envelope-from ehem)
Message-Id: <638b391487bbaeb16e17666ee490d95dffb08d7b.1709508290.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 14:11:40 -0800
Subject: [WIP PATCH 03/30] build: handle optional trailing slash in $(srctree)
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
X-Spam-Level: *
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Required intermediate to continue function during intermediate steps.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
---
 Documentation/Makefile                     | 2 +-
 Documentation/devicetree/bindings/Makefile | 6 +++---
 Documentation/userspace-api/media/Makefile | 2 +-
 arch/arc/boot/dts/Makefile                 | 2 +-
 arch/csky/boot/dts/Makefile                | 2 +-
 arch/nios2/boot/dts/Makefile               | 2 +-
 arch/powerpc/boot/dts/Makefile             | 2 +-
 arch/powerpc/boot/dts/fsl/Makefile         | 2 +-
 arch/xtensa/boot/dts/Makefile              | 2 +-
 lib/Makefile                               | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 85d8deace4bf..d279c8b71280 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -21,7 +21,7 @@ SPHINXOPTS    =
 SPHINXDIRS    = .
 DOCS_THEME    =
 DOCS_CSS      =
-_SPHINXDIRS   = $(sort $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
+_SPHINXDIRS   = $(sort $(patsubst $(srctree:%/=%)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
 SPHINX_CONF   = conf.py
 PAPER         =
 BUILDDIR      = $(obj)/output
diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 129cf698fa8a..d22bd9ec8dbf 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -55,7 +55,7 @@ define rule_chkdt
 	$(call cmd,mk_schema)
 endef
 
-DT_DOCS = $(patsubst $(srctree)/%,%,$(shell $(find_all_cmd)))
+DT_DOCS = $(patsubst $(srctree:%/=%)/%,%,$(shell $(find_all_cmd)))
 
 override DTC_FLAGS := \
 	-Wno-avoid_unnecessary_addr_size \
@@ -71,8 +71,8 @@ $(obj)/processed-schema.json: $(DT_DOCS) $(src)/.yamllint check_dtschema_version
 	$(call if_changed_rule,chkdt)
 
 always-y += processed-schema.json
-always-$(CHECK_DT_BINDING) += $(patsubst $(srctree)/$(src)/%.yaml,%.example.dts, $(CHK_DT_DOCS))
-always-$(CHECK_DT_BINDING) += $(patsubst $(srctree)/$(src)/%.yaml,%.example.dtb, $(CHK_DT_DOCS))
+always-$(CHECK_DT_BINDING) += $(patsubst $(srctree:%/=%)/$(src)/%.yaml,%.example.dts, $(CHK_DT_DOCS))
+always-$(CHECK_DT_BINDING) += $(patsubst $(srctree:%/=%)/$(src)/%.yaml,%.example.dtb, $(CHK_DT_DOCS))
 
 # Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
 # build artifacts here before they are processed by scripts/Makefile.clean
diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 3d8aaf5c253b..863c08c2d925 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -16,7 +16,7 @@ gen_rst = \
 	echo ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
 	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
 
-quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree)/%,%,$<)'; \
+quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree:%/=%)/%,%,$<)'; \
 	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
 
 silent_gen_rst = ${gen_rst}
diff --git a/arch/arc/boot/dts/Makefile b/arch/arc/boot/dts/Makefile
index 4237aa5de3a3..5b27c668afe1 100644
--- a/arch/arc/boot/dts/Makefile
+++ b/arch/arc/boot/dts/Makefile
@@ -10,7 +10,7 @@ obj-y   += $(builtindtb-y).dtb.o
 dtb-y := $(builtindtb-y).dtb
 
 # for CONFIG_OF_ALL_DTBS test
-dtstree	:= $(srctree)/$(src)
+dtstree	:= $(srctree:%/=%)/$(src)
 dtb-	:= $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
 
 # board-specific dtc flags
diff --git a/arch/csky/boot/dts/Makefile b/arch/csky/boot/dts/Makefile
index 5f1f55e911ad..fdb7571758a2 100644
--- a/arch/csky/boot/dts/Makefile
+++ b/arch/csky/boot/dts/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtstree	:= $(srctree)/$(src)
+dtstree	:= $(srctree:%/=%)/$(src)
 
 dtb-y := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/nios2/boot/dts/Makefile b/arch/nios2/boot/dts/Makefile
index e9e31bb40df8..1093e2111af0 100644
--- a/arch/nios2/boot/dts/Makefile
+++ b/arch/nios2/boot/dts/Makefile
@@ -2,5 +2,5 @@
 
 obj-y := $(patsubst %.dts,%.dtb.o,$(CONFIG_NIOS2_DTB_SOURCE))
 
-dtstree		:= $(srctree)/$(src)
+dtstree		:= $(srctree:%/=%)/$(src)
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index fb335d05aae8..211b96e6ee6d 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -2,5 +2,5 @@
 
 subdir-y += fsl
 
-dtstree		:= $(srctree)/$(src)
+dtstree		:= $(srctree:%/=%)/$(src)
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index 3bae982641e9..ee7110fbbdbe 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-dtstree		:= $(srctree)/$(src)
+dtstree		:= $(srctree:%/=%)/$(src)
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/xtensa/boot/dts/Makefile b/arch/xtensa/boot/dts/Makefile
index 720628c0d8b9..9f69eaee2188 100644
--- a/arch/xtensa/boot/dts/Makefile
+++ b/arch/xtensa/boot/dts/Makefile
@@ -10,5 +10,5 @@
 obj-$(CONFIG_OF) += $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_SOURCE))
 
 # for CONFIG_OF_ALL_DTBS test
-dtstree	:= $(srctree)/$(src)
+dtstree	:= $(srctree:%/=%)/$(src)
 dtb-	:= $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/lib/Makefile b/lib/Makefile
index 6b09731d8e61..8511d8006fd1 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -413,7 +413,7 @@ obj-$(CONFIG_FIRMWARE_TABLE) += fw_table.o
 
 # FORTIFY_SOURCE compile-time behavior tests
 TEST_FORTIFY_SRCS = $(wildcard $(srctree)/$(src)/test_fortify/*-*.c)
-TEST_FORTIFY_LOGS = $(patsubst $(srctree)/$(src)/%.c, %.log, $(TEST_FORTIFY_SRCS))
+TEST_FORTIFY_LOGS = $(patsubst $(srctree:%/=%)/$(src)/%.c, %.log, $(TEST_FORTIFY_SRCS))
 TEST_FORTIFY_LOG = test_fortify.log
 
 quiet_cmd_test_fortify = TEST    $@
-- 
2.39.2


