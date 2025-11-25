Return-Path: <linux-kbuild+bounces-9834-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E23D7C85253
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 14:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 952534E216A
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 13:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93EA31A814;
	Tue, 25 Nov 2025 13:18:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BBA324700
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076726; cv=none; b=pBiEv3gob4dF3DICBScJKgziPSMk4KXyFtCi1uLaBMxazKUH7w6DzlM2bVAWmJVn849tFdKTx2pDVOsiKoZ9B1jjOK8JzAaYFHCh6RR2Kk5dY4EhwjBYJ9zwuSz5U/nnwPda8paLOxV4sSOvN9BJroolxiVfM9/aWD0SwDuM/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076726; c=relaxed/simple;
	bh=icIRvzjKSFAtU7+vHUdJjpXmUbPgNbo4d8PtONv30/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSK07uzaKiQBKfTbosSwtLJlbjdKVPO6hazbagF78GI2k2cuz4EQ/1RkKFE9BJ0NZKnkAGfMIacTSByGHKolBp9DOViNnuXxhx8eRq+teIzySCnDflxuNHu3D+gi3SkdfcJw9VvSQfNdBS2Wn95wSVOKgz8jU+rPED8kuIVR8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-00041h-Uo; Tue, 25 Nov 2025 14:18:30 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-002PEY-24;
	Tue, 25 Nov 2025 14:18:30 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNswA-0000000243F-2MRm;
	Tue, 25 Nov 2025 14:18:30 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 25 Nov 2025 14:18:19 +0100
Subject: [PATCH v2 1/2] initramfs: add gen_init_cpio to hostprogs
 unconditionally
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-cpio-modules-pkg-v2-1-aa8277d89682@pengutronix.de>
References: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
In-Reply-To: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

gen_init_cpio is currently only needed when an initramfs cpio archive is
to be created out of CONFIG_INITRAMFS_SOURCE's contents. In other cases,
it's not added to hostprogs and no make target is available.

In preparation to use the host program from Makefile.package, define it
unconditionally. The program will still only be built as needed.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 usr/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/Makefile b/usr/Makefile
index f1779496bca78b4a56651b6af7221675ec7ade7a..e8f42478a0b76540180d191042cd58d3e4381f19 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -16,6 +16,8 @@ obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
 
 $(obj)/initramfs_data.o: $(obj)/initramfs_inc_data
 
+hostprogs := gen_init_cpio
+
 ramfs-input := $(CONFIG_INITRAMFS_SOURCE)
 cpio-data :=
 
@@ -48,8 +50,6 @@ ifeq ($(cpio-data),)
 
 cpio-data := $(obj)/initramfs_data.cpio
 
-hostprogs := gen_init_cpio
-
 # .initramfs_data.cpio.d is used to identify all files included
 # in initramfs and to detect if any files are added/removed.
 # Removed files are identified by directory timestamp being updated

-- 
2.47.3


