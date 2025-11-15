Return-Path: <linux-kbuild+bounces-9640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D24C6075A
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Nov 2025 15:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F00C135E973
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Nov 2025 14:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5EC2D9EF8;
	Sat, 15 Nov 2025 14:31:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CA0296BC3
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Nov 2025 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763217096; cv=none; b=fEsJT2K81eNAQYd8li+UKf0Oz7cy2jHqztDlT9sbopVd1A1oU7/5MWJWDs2T80otDkvNEruexDQpqroUdkq8D/Wu8gItDBuWWCFZUS8MArnRsgYIh8XGPuhAnFeoJlqHlpiZW68IoaqcmcHCIQ1QK+QLoO3G01VI8N6lDEqA3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763217096; c=relaxed/simple;
	bh=rH2mmmw2NQnHWrzH+7KshY2pip4EbGFdE6Q7uHk65B0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YaeAKJ4GZAugmUCibmJznk39CHXKEI7faNb7JaGwMvw9axWHEg2N9id5WYzESZMqN23X8tPBC/C7D9ZIdf3lp279t2yf/pyed/iUhc6iwW4m6Mx1mWZ7G5+O9QIEle6l++M/NKEbRWkfzbWxE4clee6+rxsp+JV0f2+7U+FTZt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vKHJJ-0007iq-MR; Sat, 15 Nov 2025 15:31:29 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vKHJI-000bLu-0r;
	Sat, 15 Nov 2025 15:31:28 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vKHJI-0000000HHrX-0pY6;
	Sat, 15 Nov 2025 15:31:28 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Sat, 15 Nov 2025 15:21:51 +0100
Subject: [PATCH] kbuild: add target to build a cpio containing modules
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAH6MGGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0NT3eSCzHzd3PyU0pzUYt2C7HRdc4MUC9NEM0sLS6MkJaC2gqLUtMw
 KsJHRsbW1AMG3FwhiAAAA
X-Change-ID: 20251115-cpio-modules-pkg-70d85a69892b
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

From: Sascha Hauer <s.hauer@pengutronix.de>

Add a new package target to build a cpio archive containing the kernel
modules. This is particularly useful to supplement an existing initramfs
with the kernel modules so that the root filesystem can be started with
all needed kernel modules without modifying it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Co-developed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 .gitignore               |  5 +++++
 Makefile                 |  2 +-
 scripts/Makefile.package | 17 +++++++++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 86a1ba0d90353962183b47c0c657ec877e5b2f9f..764d115400d90f0904b8f60ea8851a7860c16411 100644
--- a/.gitignore
+++ b/.gitignore
@@ -96,6 +96,11 @@ modules.order
 #
 /tar-install/
 
+#
+# modules directory (make cpio-modules-pkg)
+#
+/modules-install/
+
 #
 # pacman files (make pacman-pkg)
 #
diff --git a/Makefile b/Makefile
index fb4389aa5d5f1776f7bb5988102ed54f92491de7..19c7900d02ed5eee06f00820c138591b42e895e1 100644
--- a/Makefile
+++ b/Makefile
@@ -1583,7 +1583,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .objdiff \
-		  debian snap tar-install PKGBUILD pacman \
+		  debian snap tar-install modules-install PKGBUILD pacman \
 		  .config .config.old .version \
 		  Module.symvers \
 		  certs/signing_key.pem \
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 74bcb9e7f7a4516473481468a0fcf700c3bead33..20eec9e2dec4dda3fa0ef64a15b80dccdcb55f90 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -189,6 +189,22 @@ tar-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar
 tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
 	@:
 
+modules-install: FORCE
+	$(Q)$(MAKE) -f $(srctree)/Makefile
+	$(Q)rm -rf $@
+	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
+
+quiet_cmd_cpio = CPIO    $@
+      cmd_cpio = $(srctree)/usr/gen_initramfs.sh $< > $@
+
+modules-$(KERNELRELEASE)-$(ARCH).cpio: modules-install
+	$(Q)$(MAKE) -f $(srctree)/Makefile $(build)=usr cpio-data= usr/gen_init_cpio
+	$(call cmd,cpio)
+
+PHONY += cpio-modules-pkg
+cpio-modules-pkg: modules-$(KERNELRELEASE)-$(ARCH).cpio
+	@:
+
 # perf-tar*-src-pkg - generate a source tarball with perf source
 # ---------------------------------------------------------------------------
 
@@ -245,6 +261,7 @@ help:
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
 	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
 	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
+	@echo '  cpio-modules-pkg    - Build the kernel modules as cpio archive'
 	@echo '  perf-tar-src-pkg    - Build the perf source tarball with no compression'
 	@echo '  perf-targz-src-pkg  - Build the perf source tarball with gzip compression'
 	@echo '  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression'

---
base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
change-id: 20251115-cpio-modules-pkg-70d85a69892b

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


