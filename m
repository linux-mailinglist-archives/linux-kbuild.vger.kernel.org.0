Return-Path: <linux-kbuild+bounces-1115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94FE86F87A
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51FA28107B
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C27EDF;
	Mon,  4 Mar 2024 02:18:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E3F138A
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518689; cv=none; b=Ec8LElbM90zCq3EJ0fNRItkihPbvKHtLhb6L7RJEglHAgOyzW/N98ho7AJ8ziDTugrnJfd6zKgLicmRHaHzGM2cdDBA5u+ckrDCl3E5OhRMHNQSQTh7wxHJxzY5AvLXCD0i7brdNfEMSWEkEsC/jt35h8vru/sZyWz7o04HeSGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518689; c=relaxed/simple;
	bh=3VWcGTz5TDo0NG7Shkceqhq1Q+IJzYQ8jh8EfDmKVHQ=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=KGZsgGAC5MKEDnMBPt630ajqsSi96a3ZXQScRqMdFN2IwfnIzliJ6kOT7+Q13WrkR+W6P5QK+fWPzLXc1UqnfV1GkLeCUyB+0DNFNa4xKttrl1up/boWSevcaCvK/ZWDKbn1LqX5ESKTgDN1qOwKJtiWaxRVpl0FYue9/aSp9Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242E2w0021841
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:14:08 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242E2BK021840;
	Sun, 3 Mar 2024 18:14:02 -0800 (PST)
	(envelope-from ehem)
Message-Id: <4116e51c26376efa4d6108c205a918c0e6569051.1709508290.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 11:48:49 -0800
Subject: [WIP PATCH 06/30] build: modify uses of $(srctree) to assume trailing
 slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

This isn't much more than `find | sed` to adjust all uses of $(srctree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:

find . -name Kbuild\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 arch/arm/Kbuild                  | 2 +-
 arch/mips/Kbuild                 | 2 +-
 arch/mips/Kbuild.platforms       | 2 +-
 drivers/gpu/drm/nouveau/Kbuild   | 2 +-
 drivers/scsi/cxgbi/cxgb3i/Kbuild | 4 ++--
 drivers/scsi/cxgbi/cxgb4i/Kbuild | 4 ++--
 include/uapi/Kbuild              | 6 +++---
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/Kbuild b/arch/arm/Kbuild
index b506622e7e23..a2205b97791f 100644
--- a/arch/arm/Kbuild
+++ b/arch/arm/Kbuild
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_FPE_NWFPE)		+= nwfpe/
 # Put arch/arm/fastfpe/ to use this.
-obj-$(CONFIG_FPE_FASTFPE)	+= $(patsubst $(srctree)/$(src)/%,%,$(wildcard $(srctree)/$(src)/fastfpe/))
+obj-$(CONFIG_FPE_FASTFPE)	+= $(patsubst $(srctree)$(src)/%,%,$(wildcard $(srctree)$(src)/fastfpe/))
 obj-$(CONFIG_VFP)		+= vfp/
 obj-$(CONFIG_XEN)		+= xen/
 obj-$(CONFIG_VDSO)		+= vdso/
diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
index e2d623621a00..4aa066d63a9e 100644
--- a/arch/mips/Kbuild
+++ b/arch/mips/Kbuild
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # platform specific definitions
-include $(srctree)/arch/mips/Kbuild.platforms
+include $(srctree)arch/mips/Kbuild.platforms
 obj-y := $(platform-y)
 
 # make clean traverses $(obj-) without having included .config, so
diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index a2311c4bce6a..cd8439f4d51c 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -33,4 +33,4 @@ platform-$(CONFIG_SNI_RM)		+= sni/
 platform-$(CONFIG_MACH_TX49XX)		+= txx9/
 
 # include the platform specific files
-include $(patsubst %/, $(srctree)/arch/mips/%/Platform, $(platform-y))
+include $(patsubst %/, $(srctree)arch/mips/%/Platform, $(platform-y))
diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index cf6b3a80c0c8..9038528a80d6 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -1,4 +1,4 @@
-NOUVEAU_PATH ?= $(srctree)
+NOUVEAU_PATH ?= $(srctree:%/=%)
 
 # SPDX-License-Identifier: MIT
 ccflags-y += -I $(NOUVEAU_PATH)/$(src)/include
diff --git a/drivers/scsi/cxgbi/cxgb3i/Kbuild b/drivers/scsi/cxgbi/cxgb3i/Kbuild
index 8d8a43f5ea80..abeec066f908 100644
--- a/drivers/scsi/cxgbi/cxgb3i/Kbuild
+++ b/drivers/scsi/cxgbi/cxgb3i/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y += -I$(srctree)/drivers/net/ethernet/chelsio/cxgb3
-ccflags-y += -I$(srctree)/drivers/net/ethernet/chelsio/libcxgb
+ccflags-y += -I$(srctree)drivers/net/ethernet/chelsio/cxgb3
+ccflags-y += -I$(srctree)drivers/net/ethernet/chelsio/libcxgb
 
 obj-$(CONFIG_SCSI_CXGB3_ISCSI) += cxgb3i.o
diff --git a/drivers/scsi/cxgbi/cxgb4i/Kbuild b/drivers/scsi/cxgbi/cxgb4i/Kbuild
index fd3e0c964de6..f256cac0fcdc 100644
--- a/drivers/scsi/cxgbi/cxgb4i/Kbuild
+++ b/drivers/scsi/cxgbi/cxgb4i/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y += -I$(srctree)/drivers/net/ethernet/chelsio/cxgb4
-ccflags-y += -I$(srctree)/drivers/net/ethernet/chelsio/libcxgb
+ccflags-y += -I$(srctree)drivers/net/ethernet/chelsio/cxgb4
+ccflags-y += -I$(srctree)drivers/net/ethernet/chelsio/libcxgb
 
 obj-$(CONFIG_SCSI_CXGB4_ISCSI) += cxgb4i.o
diff --git a/include/uapi/Kbuild b/include/uapi/Kbuild
index 61ee6e59c930..4b8401173ef5 100644
--- a/include/uapi/Kbuild
+++ b/include/uapi/Kbuild
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
-ifeq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/a.out.h),)
+ifeq ($(wildcard $(srctree)arch/$(SRCARCH)/include/uapi/asm/a.out.h),)
 no-export-headers += linux/a.out.h
 endif
 
-ifeq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/kvm.h),)
+ifeq ($(wildcard $(srctree)arch/$(SRCARCH)/include/uapi/asm/kvm.h),)
 no-export-headers += linux/kvm.h
 endif
 
-ifeq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/kvm_para.h),)
+ifeq ($(wildcard $(srctree)arch/$(SRCARCH)/include/uapi/asm/kvm_para.h),)
 ifeq ($(wildcard $(objtree)/arch/$(SRCARCH)/include/generated/uapi/asm/kvm_para.h),)
 no-export-headers += linux/kvm_para.h
 endif
-- 
2.39.2


