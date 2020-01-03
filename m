Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B7B12FBE5
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 18:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgACR7j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 12:59:39 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:64712 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728215AbgACR7j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:39 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 003HxSJ7022724;
        Sat, 4 Jan 2020 02:59:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 003HxSJ7022724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578074372;
        bh=lCI2C0HKijtxw/L++AnPUMRqL4ioNQYvaRVeKU0+Ujc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OKs8HuJLubLRXqwBVJ+RXENL44jC8tBQJKPXnBMbawLw5KCofF4mUkwDEX6BOFaYE
         Acy0/RygIoA8MKHLmuW/CVrLlmcpbEBFuz5t+wvwtiwQfRMe1kbN/0sgBwJWR0s7Ph
         F8wVoOd/s6SlZs/kSXV1PTK60u/AUtf028PX9gJH/g5SU3B3RRyJiz1XUFQ3zrnjwH
         t+WnN0mDnDInSEUwld+H8CUH0/i8UDNqlFsNzecP9djcJKS+MmAxnigNI+1kiSOWyB
         yI8GxfdAW+sQ2zHk/YBXZLGgNLjxOkdUF1nupAVHF+mcoqGIAs/v4rKmocBQmmcPFR
         jB1z16i6Jyv1Q==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] initramfs: make initramfs compression choice non-optional
Date:   Sat,  4 Jan 2020 02:59:09 +0900
Message-Id: <20200103175915.26663-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
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

