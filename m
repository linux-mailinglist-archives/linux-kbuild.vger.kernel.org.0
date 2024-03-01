Return-Path: <linux-kbuild+bounces-1137-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB486F8B2
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2CDA2810D5
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C635F17C9;
	Mon,  4 Mar 2024 02:53:16 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F2119A
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520796; cv=none; b=g/fGrgCiWuJWR74py2Y8Pb/JfSYrwqkW1JsM3PoU38yQY7ISlMKsM+ShFA/CdravG66Atyir57DJ3JEYyYrURfdw+uZoRPWhtzLpQeNAjWPaZ1bJppiDbJRRr9tgfPjGY5ZAkDKDUXLNfIb2r/8loVa3ASBBPwdkZk6o6QcR4jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520796; c=relaxed/simple;
	bh=nbUSOmZ0+bdTCIVrYjtU7jKuIZ2QNiPhCORl70xUotQ=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=Jh8CfWR7LGDTSCjPbNixu6MKE/s84AVpEwjwI92pNsVq9OfSRTbA1la9FIAA6JdLbuGm+bWCW8cCPccUchkV30LT8F7Y5yFEHIbDwHQWqnEZe9GHp56qzo1NXTyEh66M+Z8m+fk/YGcHctiBGqbO+pEnNnH+M4xhf8K+gKwLdwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242pg7O022188
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:51:48 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242pf7M022187;
	Sun, 3 Mar 2024 18:51:41 -0800 (PST)
	(envelope-from ehem)
Message-Id: <cb592dbec84c0b00eba2e7c3cfb53dabd67ba6a3.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 11:48:49 -0800
Subject: [WIP PATCH 29/30] tools/build: modify uses of $(srctree) to assume
 trailing slash
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

find tools -name Kbuild\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 tools/testing/cxl/Kbuild         | 4 ++--
 tools/testing/cxl/test/Kbuild    | 2 +-
 tools/testing/nvdimm/Kbuild      | 4 ++--
 tools/testing/nvdimm/test/Kbuild | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/cxl/Kbuild b/tools/testing/cxl/Kbuild
index 030b388800f0..75069a04f29d 100644
--- a/tools/testing/cxl/Kbuild
+++ b/tools/testing/cxl/Kbuild
@@ -18,9 +18,9 @@ ldflags-y += --wrap=cxl_endpoint_parse_cdat
 DRIVERS := ../../../drivers
 CXL_SRC := $(DRIVERS)/cxl
 CXL_CORE_SRC := $(DRIVERS)/cxl/core
-ccflags-y := -I$(srctree)/drivers/cxl/
+ccflags-y := -I$(srctree)drivers/cxl/
 ccflags-y += -D__mock=__weak
-ccflags-y += -DTRACE_INCLUDE_PATH=$(CXL_CORE_SRC) -I$(srctree)/drivers/cxl/core/
+ccflags-y += -DTRACE_INCLUDE_PATH=$(CXL_CORE_SRC) -I$(srctree)drivers/cxl/core/
 
 obj-m += cxl_acpi.o
 
diff --git a/tools/testing/cxl/test/Kbuild b/tools/testing/cxl/test/Kbuild
index 6b1927897856..6da97dfb9cf0 100644
--- a/tools/testing/cxl/test/Kbuild
+++ b/tools/testing/cxl/test/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I$(srctree)/drivers/cxl/ -I$(srctree)/drivers/cxl/core
+ccflags-y := -I$(srctree)drivers/cxl/ -I$(srctree)drivers/cxl/core
 
 obj-m += cxl_test.o
 obj-m += cxl_mock.o
diff --git a/tools/testing/nvdimm/Kbuild b/tools/testing/nvdimm/Kbuild
index 91a3627f301a..c558ea1bf361 100644
--- a/tools/testing/nvdimm/Kbuild
+++ b/tools/testing/nvdimm/Kbuild
@@ -21,8 +21,8 @@ DRIVERS := ../../../drivers
 NVDIMM_SRC := $(DRIVERS)/nvdimm
 ACPI_SRC := $(DRIVERS)/acpi/nfit
 DAX_SRC := $(DRIVERS)/dax
-ccflags-y := -I$(srctree)/drivers/nvdimm/
-ccflags-y += -I$(srctree)/drivers/acpi/nfit/
+ccflags-y := -I$(srctree)drivers/nvdimm/
+ccflags-y += -I$(srctree)drivers/acpi/nfit/
 
 obj-$(CONFIG_LIBNVDIMM) += libnvdimm.o
 obj-$(CONFIG_BLK_DEV_PMEM) += nd_pmem.o
diff --git a/tools/testing/nvdimm/test/Kbuild b/tools/testing/nvdimm/test/Kbuild
index 003d48f5f24f..eaa3bed8360e 100644
--- a/tools/testing/nvdimm/test/Kbuild
+++ b/tools/testing/nvdimm/test/Kbuild
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I$(srctree)/drivers/nvdimm/
-ccflags-y += -I$(srctree)/drivers/acpi/nfit/
+ccflags-y := -I$(srctree)drivers/nvdimm/
+ccflags-y += -I$(srctree)drivers/acpi/nfit/
 
 obj-m += nfit_test.o
 obj-m += nfit_test_iomap.o
-- 
2.39.2


