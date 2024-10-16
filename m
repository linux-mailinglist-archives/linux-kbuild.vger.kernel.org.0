Return-Path: <linux-kbuild+bounces-4146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE379A07F7
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 13:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C811F22156
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 11:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44622071ED;
	Wed, 16 Oct 2024 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNRExqbZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85A820605B;
	Wed, 16 Oct 2024 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076538; cv=none; b=btrFc619U/caggv6KhxmA7jevCw8srOQo9q913oIrbvPuiMQQTJmpR99PIdEu14SEMenb7BpOJelzflm54jLHbKqyx7n47vTLx3SBZBhfDd3jCx+WGMIiiRv+eBymgktt+iXg9SHDPjBMKFU0lriBKFgwX+NMoBEte0iTr/Mf9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076538; c=relaxed/simple;
	bh=am5o/KYY1etx3argiWIputsDa9TZyhUJ250fOWswMRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BV0z/ev+LBlK7M7U6ejLUi6+tF0q9FQSW9d2dIr6PtfhPEgiJ7wPg9QvUs4dOeb/DnJQGIIUbOhtb7QhisGyXYULJtckvWJu8GE20v5c78jP/75qj4dT/o8LrA3sL6YXd/svXC8xUfzTP7XDc/y8zPr7e9VMiwCASe1kmglr5d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNRExqbZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729076537; x=1760612537;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=am5o/KYY1etx3argiWIputsDa9TZyhUJ250fOWswMRM=;
  b=GNRExqbZ439bFH0Zs1DexKyuWyjIqavyxDfmMX8pgGee+flGOIRdFnQd
   IffyjmbZvWsd5/Sac3fg6QorXKdtW1RXNOllKU605jsFp0OIHgWDVQDTN
   HXcTj+73973+V0ABLK3KaV7xPz6WWZGe2d6TmcU7d/+pZaKBasyvbKoxg
   8h34V0umq/E1DKRvwreo3S0VZVL9g+CxFGvHElOnhx7om/thibMvWzJfE
   ffayN1qGw/X0N01x4HRXqGQgpXfaQ19UNmMWMEd6gTlaqB3LasgIfSiZB
   BR7nrDWISGVMRQvhH2wBi4uGLANCp+qq6vGFZeCGoDUDl4BFPe3AOXJ+9
   Q==;
X-CSE-ConnectionGUID: WYLQjZTzS0eCp8ifTYERqA==
X-CSE-MsgGUID: uk0zDcj7QYu1A1p3HCr5yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28717996"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="28717996"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:02:16 -0700
X-CSE-ConnectionGUID: mw/cg0N0QoyvOaYXhrs2zg==
X-CSE-MsgGUID: 6rjdik0ETVOn85RinJUveQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="77870298"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2024 04:02:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7A57D1AC; Wed, 16 Oct 2024 14:02:11 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Gow <davidgow@google.com>
Subject: [PATCH v2 1/1] platform/x86: intel: Add 'intel' prefix to the modules automatically
Date: Wed, 16 Oct 2024 13:59:51 +0300
Message-ID: <20241016105950.785820-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework Makefile to add 'intel' prefix to the modules automatically.
This removes a lot of boilerplate code in it and also makes robust
against mistypos in the prefix.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed obvious typos (LKP), Cc'ed to Kbuild ML (Ilpo), dropped RFC marker

Note to Kbuild people: TBH I rather want to have something like this
to be available on the level of Kbuild for any of the subdirectories
in question.

 drivers/platform/x86/intel/Makefile           | 68 ++++++++-----------
 .../intel/{intel_plr_tpmi.c => plr_tpmi.c}    |  0
 .../x86/intel/{tpmi.c => vsec_tpmi.c}         |  2 +-
 3 files changed, 30 insertions(+), 40 deletions(-)
 rename drivers/platform/x86/intel/{intel_plr_tpmi.c => plr_tpmi.c} (100%)
 rename drivers/platform/x86/intel/{tpmi.c => vsec_tpmi.c} (99%)

diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 74db065c82d6..78acb414e154 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -17,50 +17,40 @@ obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)	+= uncore-frequency/
 
 
 # Intel input drivers
-intel-hid-y				:= hid.o
-obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
-intel-vbtn-y				:= vbtn.o
-obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
+intel-target-$(CONFIG_INTEL_HID_EVENT)		+= hid.o
+intel-target-$(CONFIG_INTEL_VBTN)		+= vbtn.o
 
 # Intel miscellaneous drivers
-obj-$(CONFIG_INTEL_ISHTP_ECLITE)	+= ishtp_eclite.o
-intel_int0002_vgpio-y			:= int0002_vgpio.o
-obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
-intel_oaktrail-y			:= oaktrail.o
-obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
-intel_sdsi-y				:= sdsi.o
-obj-$(CONFIG_INTEL_SDSI)		+= intel_sdsi.o
-intel_vsec-y				:= vsec.o
-obj-$(CONFIG_INTEL_VSEC)		+= intel_vsec.o
+intel-target-$(CONFIG_INTEL_INT0002_VGPIO)	+= int0002_vgpio.o
+intel-target-$(CONFIG_INTEL_ISHTP_ECLITE)	+= ishtp_eclite.o
+intel-target-$(CONFIG_INTEL_OAKTRAIL)		+= oaktrail.o
+intel-target-$(CONFIG_INTEL_SDSI)		+= sdsi.o
+intel-target-$(CONFIG_INTEL_VSEC)		+= vsec.o
 
 # Intel PMIC / PMC / P-Unit drivers
-intel_bxtwc_tmu-y			:= bxtwc_tmu.o
-obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
-intel_crystal_cove_charger-y		:= crystal_cove_charger.o
-obj-$(CONFIG_X86_ANDROID_TABLETS)	+= intel_crystal_cove_charger.o
-intel_bytcrc_pwrsrc-y			:= bytcrc_pwrsrc.o
-obj-$(CONFIG_INTEL_BYTCRC_PWRSRC)	+= intel_bytcrc_pwrsrc.o
-intel_chtdc_ti_pwrbtn-y			:= chtdc_ti_pwrbtn.o
-obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
-intel_chtwc_int33fe-y			:= chtwc_int33fe.o
-obj-$(CONFIG_INTEL_CHTWC_INT33FE)	+= intel_chtwc_int33fe.o
-intel_mrfld_pwrbtn-y			:= mrfld_pwrbtn.o
-obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
-intel_punit_ipc-y			:= punit_ipc.o
-obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
+intel-target-$(CONFIG_INTEL_BYTCRC_PWRSRC)	+= bytcrc_pwrsrc.o
+intel-target-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= bxtwc_tmu.o
+intel-target-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= chtdc_ti_pwrbtn.o
+intel-target-$(CONFIG_INTEL_CHTWC_INT33FE)	+= chtwc_int33fe.o
+intel-target-$(CONFIG_X86_ANDROID_TABLETS)	+= crystal_cove_charger.o
+intel-target-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= mrfld_pwrbtn.o
+intel-target-$(CONFIG_INTEL_PUNIT_IPC)		+= punit_ipc.o
 
 # TPMI drivers
-intel_vsec_tpmi-y			:= tpmi.o
-obj-$(CONFIG_INTEL_TPMI)		+= intel_vsec_tpmi.o
-obj-$(CONFIG_INTEL_PLR_TPMI)		+= intel_plr_tpmi.o
-
-intel_tpmi_power_domains-y		:= tpmi_power_domains.o
-obj-$(CONFIG_INTEL_TPMI_POWER_DOMAINS)	+= intel_tpmi_power_domains.o
+intel-target-$(CONFIG_INTEL_PLR_TPMI)		+= plr_tpmi.o
+intel-target-$(CONFIG_INTEL_TPMI_POWER_DOMAINS)	+= tpmi_power_domains.o
+intel-target-$(CONFIG_INTEL_TPMI)		+= vsec_tpmi.o
 
 # Intel Uncore drivers
-intel-rst-y				:= rst.o
-obj-$(CONFIG_INTEL_RST)			+= intel-rst.o
-intel-smartconnect-y			:= smartconnect.o
-obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
-intel_turbo_max_3-y			:= turbo_max_3.o
-obj-$(CONFIG_INTEL_TURBO_MAX_3)		+= intel_turbo_max_3.o
+intel-target-$(CONFIG_INTEL_RST)		+= rst.o
+intel-target-$(CONFIG_INTEL_SMARTCONNECT)	+= smartconnect.o
+intel-target-$(CONFIG_INTEL_TURBO_MAX_3)	+= turbo_max_3.o
+
+# Add 'intel' prefix to each module listed in intel-target-*
+define INTEL_OBJ_TARGET
+intel-$(1)-y := $(1).o
+obj-$(2) += intel-$(1).o
+endef
+
+$(foreach target, $(basename $(intel-target-y)), $(eval $(call INTEL_OBJ_TARGET,$(target),y)))
+$(foreach target, $(basename $(intel-target-m)), $(eval $(call INTEL_OBJ_TARGET,$(target),m)))
diff --git a/drivers/platform/x86/intel/intel_plr_tpmi.c b/drivers/platform/x86/intel/plr_tpmi.c
similarity index 100%
rename from drivers/platform/x86/intel/intel_plr_tpmi.c
rename to drivers/platform/x86/intel/plr_tpmi.c
diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
similarity index 99%
rename from drivers/platform/x86/intel/tpmi.c
rename to drivers/platform/x86/intel/vsec_tpmi.c
index 486ddc9b3592..c637e32048a3 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * intel-tpmi : Driver to enumerate TPMI features and create devices
+ * Driver to enumerate TPMI features and create devices
  *
  * Copyright (c) 2023, Intel Corporation.
  * All Rights Reserved.
-- 
2.43.0.rc1.1336.g36b5255a03ac


