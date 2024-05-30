Return-Path: <linux-kbuild+bounces-1958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 238718D5465
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 May 2024 23:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4DA6B218A7
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 May 2024 21:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F3317E453;
	Thu, 30 May 2024 21:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mbosch.me header.i=@mbosch.me header.b="gugeDLVO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.mbosch.me (mail.mbosch.me [65.21.144.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3041761BE
	for <linux-kbuild@vger.kernel.org>; Thu, 30 May 2024 21:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717103580; cv=none; b=Vw0Q8x4et3ow10R9sgwRmXKteZNElRtsfqBLkhlUHk1P1m24esaP+PXLagrG9uTpKMr0EmYEKnsDnxy2UrQkwwEZWKxCbWztl5Gp+XTRQHM4fUw98WXJHjRPvfv4Di/eyC+UKhq91DQVRZ2GZheUwgAJVm6gdURu2HdCWi6c6Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717103580; c=relaxed/simple;
	bh=kKe89AJm6mIOiQchMAsvj6hUyjF98Hb5Zl6oYDPskPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eWz4YNj+70ktcfEItDoj8NwgtRqCHMNb114N/MIaIRPQtVdxrIMXzVfM56mDeDAtQvLedU16fWIhNTj41K5144xo3dJqNb6TQrfNk2tB52EEiiLVJZu8sfwGeax3RUdLSnPaf66oBPYH/zGLDOHe/+zkjRbeH/BForI5LIsWEu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mbosch.me; spf=pass smtp.mailfrom=mbosch.me; dkim=pass (1024-bit key) header.d=mbosch.me header.i=@mbosch.me header.b=gugeDLVO; arc=none smtp.client-ip=65.21.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mbosch.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mbosch.me
From: Maximilian Bosch <maximilian@mbosch.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mbosch.me; s=mail;
	t=1717103031; bh=NqTOUEnKDBNX3DOwCOEeVHf3vwklI4dQq7eioQUcXVY=;
	h=From:To:Cc:Subject:Date;
	b=gugeDLVOsBUy4BY60043G0rosLhgcVNAgQ9gc11EGLRCV847sSRLHFVt4eO5bwebq
	 8AufnJO3tiDTvzEmahqTII8gG9QQdd+Sf/h+5xPQGiORiCq7tmoR3Rlp0M00+//N80
	 l24mk7WaDn3zistJLBlg5EHGTdp/OfMVnq4o2eLA=
To: linux-kbuild@vger.kernel.org
Cc: "torvic9@mailbox.org" <torvic9@mailbox.org>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Maximilian Bosch <maximilian@mbosch.me>
Subject: [PATCH v2] kbuild: allow setting zstd compression level for modules
Date: Thu, 30 May 2024 23:03:15 +0200
Message-ID: <20240530210342.1540045-1-maximilian@mbosch.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "torvic9@mailbox.org" <torvic9@mailbox.org>

Zstd offers a very fine-grained control of compression ratios.
Add a Kconfig option that allows setting the desired compression
level for module compression.

Signed-off-by: Tor Vic <torvic9@mailbox.org>
Tested-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
Tested-by: Maximilian Bosch <maximilian@mbosch.me>
---
 kernel/module/Kconfig    | 8 ++++++++
 scripts/Makefile.modinst | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 33a2e991f608..076b18dd3941 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -317,6 +317,14 @@ config MODULE_COMPRESS_ZSTD
 
 endchoice
 
+config MODULE_COMPRESS_ZSTD_LEVEL
+	int "Compression level (1-19)"
+	depends on MODULE_COMPRESS_ZSTD
+	range 1 19
+	default 3
+	help
+	  Compression level used by zstd for compressing modules.
+
 config MODULE_DECOMPRESS
 	bool "Support in-kernel module decompression"
 	depends on MODULE_COMPRESS_GZIP || MODULE_COMPRESS_XZ || MODULE_COMPRESS_ZSTD
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index ab0c5bd1a60f..480d47eca36a 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -101,7 +101,7 @@ quiet_cmd_gzip = GZIP    $@
 quiet_cmd_xz = XZ      $@
       cmd_xz = $(XZ) --lzma2=dict=2MiB -f $<
 quiet_cmd_zstd = ZSTD    $@
-      cmd_zstd = $(ZSTD) -T0 --rm -f -q $<
+      cmd_zstd = $(ZSTD) -$(CONFIG_MODULE_COMPRESS_ZSTD_LEVEL) -T0 --rm -f -q $<
 
 $(dst)/%.ko.gz: $(dst)/%.ko FORCE
 	$(call cmd,gzip)
-- 
2.42.0


