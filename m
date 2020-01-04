Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B0A1302D0
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2020 16:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgADPDR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jan 2020 10:03:17 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:53560 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgADPDB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 004F2gcX018492;
        Sun, 5 Jan 2020 00:02:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 004F2gcX018492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578150167;
        bh=Ds0+VtuhBD3d3jLcnJM/gKsN6b9rI46kgvvBCTFzsDE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xey2FSI/Ddi4dSKw72YJoJjpFHdKZvBdE76fBZSDwy9Q6YbaAMSqM3NlL9w+LZsAP
         kYwsbYSBX7FxJeh2PkAN0LEm1li63XVTaNWeFuVwzimF/tDOski6/b3o08xQgvN5Ne
         YzY54Z9e63cd55eVNO1Gc0p4vz4N8dYlGeY/er63bzJnTqUwKouZU2Y/kAP3d/DIO3
         40RPTCP+Ov3mPZl3NxQsfljkCjTFqtxQywcifwRHU+EtCm2/cSyn+NY3dDbWE08sSR
         qVb4sTm/g9pd0nRSEHgDrXLmkCAK4fuytBpPxAlv/2LPfTbtvAhvehZ0C8HgSErMY4
         Grgbh4u6CJjLQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] initramfs: make initramfs compression choice non-optional
Date:   Sun,  5 Jan 2020 00:02:32 +0900
Message-Id: <20200104150238.19834-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, the choice of the initramfs compression mode is too complex
because users are allowed to not specify the compression mode at all.

I think it makes more sense to require users to choose the compression
explicitly, and delete the fallback defaults of INITRAMFS_COMPRESSION.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 usr/Kconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/usr/Kconfig b/usr/Kconfig
index 43934c128010..ab61e81165e0 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -102,7 +102,6 @@ config RD_LZ4
 
 choice
 	prompt "Built-in initramfs compression mode"
-	optional
 	help
 	  This option allows you to decide by which algorithm the builtin
 	  initramfs will be compressed.  Several compression algorithms are
@@ -218,10 +217,3 @@ config INITRAMFS_COMPRESSION
 	default ".xz"   if INITRAMFS_COMPRESSION_XZ
 	default ".lzo"  if INITRAMFS_COMPRESSION_LZO
 	default ".lz4"  if INITRAMFS_COMPRESSION_LZ4
-	default ".gz"   if RD_GZIP
-	default ".lz4"  if RD_LZ4
-	default ".lzo"  if RD_LZO
-	default ".xz"   if RD_XZ
-	default ".lzma" if RD_LZMA
-	default ".bz2"  if RD_BZIP2
-	default ""
-- 
2.17.1

