Return-Path: <linux-kbuild+bounces-9833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97467C8524A
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 14:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DE9F4E04A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 13:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CE33246E0;
	Tue, 25 Nov 2025 13:18:41 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34BA2EB5D4
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076721; cv=none; b=dyh1xjH3f60/dYGjNTmcyoed7n3f+oeSeNbR1liKJ+xsBQTvkCHRJvCtrZSjKBG1Z1KrQ/Dr4BSxOesmOycVYtVSKWxGFMjsn9/OAsN+/Ms+86LxDdzCl0XDYFNe1yJC668oV4EdQReWvNFgSBHtrhNpMnc4RUIuvCsqQv0d2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076721; c=relaxed/simple;
	bh=U3A6Xd9TSpMn+xkgCiCwE8rYfDb5pBA+PsQtjpsv/A0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laGagOnrrZ0tZtGkPaDfqyf2gcu5f35zKyYSIb9tWgfHt2KabEb/61yxdqv3FSoxRjvPvgS71tpVZP94SOqIDzRhfCPLEMTsjqXISmqBNo+w/VNfBnSxoK921izdDzW0t6HHvwMHi0YkcGOcciecR4eclExv1rh3QW9mjkahtOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-00041j-Uo; Tue, 25 Nov 2025 14:18:30 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-002PEZ-24;
	Tue, 25 Nov 2025 14:18:30 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-0000000243F-2N7T;
	Tue, 25 Nov 2025 14:18:30 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 25 Nov 2025 14:18:20 +0100
Subject: [PATCH v2 2/2] kbuild: add target to build a cpio containing
 modules
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-cpio-modules-pkg-v2-2-aa8277d89682@pengutronix.de>
References: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
In-Reply-To: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
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
Reviewed-by: Simon Glass <sjg@chromium.org>
Tested-by: Simon Glass <sjg@chromium.org>
Co-developed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 scripts/Makefile.package | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 74bcb9e7f7a4516473481468a0fcf700c3bead33..83bfcf7cb09fd2d69b97e0c19a2b99c728835e8d 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -189,6 +189,25 @@ tar-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar
 tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
 	@:
 
+# modules-cpio-pkg - generate an initramfs with the modules
+# ---------------------------------------------------------------------------
+
+.tmp_modules_cpio: FORCE
+	$(Q)$(MAKE) -f $(srctree)/Makefile
+	$(Q)rm -rf $@
+	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
+
+quiet_cmd_cpio = CPIO    $@
+      cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
+
+modules-$(KERNELRELEASE)-$(ARCH).cpio: .tmp_modules_cpio
+	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
+	$(call cmd,cpio)
+
+PHONY += modules-cpio-pkg
+modules-cpio-pkg: modules-$(KERNELRELEASE)-$(ARCH).cpio
+	@:
+
 # perf-tar*-src-pkg - generate a source tarball with perf source
 # ---------------------------------------------------------------------------
 
@@ -245,6 +264,7 @@ help:
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
 	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
 	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
+	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
 	@echo '  perf-tar-src-pkg    - Build the perf source tarball with no compression'
 	@echo '  perf-targz-src-pkg  - Build the perf source tarball with gzip compression'
 	@echo '  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression'

-- 
2.47.3


