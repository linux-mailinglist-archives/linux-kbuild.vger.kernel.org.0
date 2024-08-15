Return-Path: <linux-kbuild+bounces-2996-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16A952D28
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 13:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D8A91C23ACE
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 11:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23B91AC890;
	Thu, 15 Aug 2024 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GPEsySqG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBCC1AC88E
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723719732; cv=none; b=Wb3kyyJvet7NC0mLapIuN4M5wy5FIlvDie433LCcJvKOPZfWoJvMfD4VRfuDXsmeLUySLKZLjB50r5UoUkJz43FSDnwucsIHPdGYwKFlkv1fKq0koXZZEytZDDMj8U94LehbWEM+ay9Iu07lGGbG3u7TLH111Yt8Cr282nUJCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723719732; c=relaxed/simple;
	bh=hBzRs5/U6O6A+/he0HT9GCIp7fuNDTIsDLcMmPt/bzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2vgcgdLJW+TKCVT3QCeBNFrDfCNE6JC76jycD+hKOuLFrcPV6NYXZywOBeG3gVHRObe77EFWhtxiJFIbBrcACy3PKjmCxZNAP3uBrcY7LSzKH6AWdSmvOKqujAMxkYeGmDNgdnyD1l92e5BmFuQxo4M2Qr9yArDzfTq5mwGEtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GPEsySqG; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=6g4Ny
	Alr8+jrsKI+f9O4ZQoT+BG6BS8UIVqXt7/cDio=; b=GPEsySqGuDV/tZePnTMTr
	HtAGXwRFoVNqJYPbObBtdWhv9v+B1Qqo2XoR0IRl1d1NkxfHs7uaBm+j7K0zC8xY
	poHeJVIiLirIK8DYEL+7GQkNTJOTCZmhDlc7ONmMgksMCWtW7LSZqw+eVJ/9Q6bT
	Lb5T5psjE3KnyfuMHyuRdo=
Received: from ubuntu.localdomain (unknown [223.102.86.225])
	by gzga-smtp-mta-g2-5 (Coremail) with SMTP id _____wDXX0AM4L1mLZ95CA--.63293S2;
	Thu, 15 Aug 2024 19:01:34 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: linux-kbuild@vger.kernel.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 1/1] kbuild: Only build dtc if needed
Date: Thu, 15 Aug 2024 04:00:59 -0700
Message-ID: <20240815110059.4912-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXX0AM4L1mLZ95CA--.63293S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrWftF4UGFWxXr4xGF4fuFg_yoWrGF1fpa
	1Sk34Iv39xtrWxXa47CF18Xr15Ar4ktF1ruayUWr1kJFWkZr4S9FW2yr1fJry7JFy8Jr1r
	KrWYva47Jrn8GaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piFfOrUUUUU=
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXBM8jWXAnR9SBgAAsN

At present Linux always builds dtc if CONFIG_DTC is defined, even when
DTC is provided. The built dtc is not actually used, so this is a waste
of time.

Update the Makefile logic to build dtc and fdtoverlay only if DTC or
FDTOVERLAY is not provided.

Also, add an fdtoverlay wrapper to hide the actual path differences of
fdtoverlay from the make_fit.py script.

Refs:
  https://github.com/u-boot/u-boot/commit/93b196532254366f653b4d763f69e49ff193f06c
  https://github.com/torvalds/linux/commit/6b22b3d1614af1a775f2ef006009f15077592c9c

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring (Arm) <robh@kernel.org>
Cc: Simon Glass <sjg@chromium.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kbuild@vger.kernel.org
---
 Makefile              | 13 ++++++++++++-
 scripts/Makefile.lib  |  5 ++---
 scripts/fdtoverlay.sh |  7 +++++++
 scripts/make_fit.py   |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)
 create mode 100755 scripts/fdtoverlay.sh

diff --git a/Makefile b/Makefile
index 0a364e34f50b..6e56696e85a1 100644
--- a/Makefile
+++ b/Makefile
@@ -1419,9 +1419,20 @@ endif
 
 endif
 
+# The dtc and fdtoverlay are automatically built unless DTC or FDTOVERLAY is
+# provided.
+DTC_INTREE := $(objtree)/scripts/dtc/dtc
+DTC ?= $(DTC_INTREE)
+
+FDTOVERLAY_INTREE := $(objtree)/scripts/dtc/fdtoverlay
+FDTOVERLAY ?= $(FDTOVERLAY_INTREE)
+
 PHONY += scripts_dtc
 scripts_dtc: scripts_basic
-	$(Q)$(MAKE) $(build)=scripts/dtc
+	$(Q)if [ "$(DTC)" = "$(DTC_INTREE)" ] || \
+			[ "$(FDTOVERLAY)" = "$(FDTOVERLAY_INTREE)" ]; then \
+		$(MAKE) $(build)=scripts/dtc; \
+	fi
 
 ifneq ($(filter dt_binding_check, $(MAKECMDGOALS)),)
 export CHECK_DTBS=y
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index fe3668dc4954..04ba30dadc8f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -352,7 +352,6 @@ quiet_cmd_gzip = GZIP    $@
 
 # DTC
 # ---------------------------------------------------------------------------
-DTC ?= $(objtree)/scripts/dtc/dtc
 DTC_FLAGS += \
 	-Wno-unique_unit_address
 
@@ -415,10 +414,10 @@ DT_CHECK_CMD = $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR)
 # recorded in the .*.cmd file.
 ifneq ($(CHECK_DTBS),)
 quiet_cmd_fdtoverlay = DTOVLCH $@
-      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^) ; $(DT_CHECK_CMD) $@ || true
+      cmd_fdtoverlay = $(objtree)/scripts/fdtoverlay.sh -o $@ -i $(filter %.dtb %.dtbo, $^) ; $(DT_CHECK_CMD) $@ || true
 else
 quiet_cmd_fdtoverlay = DTOVL   $@
-      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^)
+      cmd_fdtoverlay = $(objtree)/scripts/fdtoverlay.sh -o $@ -i $(filter %.dtb %.dtbo, $^)
 endif
 
 $(multi-dtb-y): FORCE
diff --git a/scripts/fdtoverlay.sh b/scripts/fdtoverlay.sh
new file mode 100755
index 000000000000..5bd07c47c22a
--- /dev/null
+++ b/scripts/fdtoverlay.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# An fdtoverlay wrapper
+# scripts/make_fit.py uses the name of this script as a special marker.
+
+exec "${FDTOVERLAY}" "$@"
diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 4a1bb2f55861..37c4e1c8d5c6 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -238,7 +238,7 @@ def process_dtb(fname, args):
         with open(cmd_fname, 'r', encoding='ascii') as inf:
             cmd = inf.read()
 
-        if 'scripts/dtc/fdtoverlay' in cmd:
+        if '/scripts/fdtoverlay.sh ' in cmd:
             # This depends on the structure of the composite DTB command
             files = cmd.split()
             files = files[files.index('-i') + 1:]

base-commit: 6b0f8db921abf0520081d779876d3a41069dab95
-- 
2.45.1


