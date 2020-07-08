Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1947219005
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 20:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgGHSzV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 14:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgGHSzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 14:55:19 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8DEC061A0B;
        Wed,  8 Jul 2020 11:55:19 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id s26so6726139pfm.4;
        Wed, 08 Jul 2020 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fmIcvsol2hVEYD4hslBcgfIPlSJK4NAnFqyLqCM1gdk=;
        b=Fkx53slIr7YYPLueOkMu36fSWxQFn2zbOLWwn0oGGRInv+F+FWR1T9lnXFv/oNgfah
         VPn0ObclxAOhotkKzEQ3vk5/ga6673bOKD+klKszvoOuWPUMFHlB0Mz4BGyP8gQzWr++
         WXM/MbClqN7nhzqWxeK8iavKY/VTszPERdtnw3VegPdqa9auDz/y9Jhl9Nwy+VcZ1iI5
         sMMbL8/ynaSqzXLL8VkN4eIBTmVxExX3yMdb4qOfr/S+0S7MnqhHg6vpKzu9FXgDC7ba
         TxEQ9NL295EHJ/E1UAI9YsfYwGNncJ0Jw1+I9v0W7I+ElStSkvgxxM0j/IJ7rxIAGrJ7
         ZGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmIcvsol2hVEYD4hslBcgfIPlSJK4NAnFqyLqCM1gdk=;
        b=hzGvXMTdKqnl5tCgqxGRAzVEldVqtjpvww8yToPrg4wpDsI2lGfui3UTmHWJtuwno6
         9PpvHoOCKAaT+OCiH/8VVckLSelLnoUKDOOAK3b+QMUfkb1TJAeMYxX79fQxoS4t8Ofu
         i7uo3V7KnXmsPuhlr9RXhS01BBgQVGxRvGi9D1i/yIiCukdnLRY/Kz6RLrT8P8zx1kvF
         4lmK6UpdKVr/jiOZcxgCLn3PVH2qABsV6Pvd7R3MD3y0ai+EeDPMn0+dg2jVtSLppyJB
         412Jchrdegt8FnAOqt8KyK1ktzLyNPXKEvk3QBRzeoWwQoL9GGWzvx8HGFOaJVIIUbFR
         /1Kw==
X-Gm-Message-State: AOAM532rohnGSWwkyG7kQToj6fVn/fEkYX2j79omFYCLY+9lWfn2A2tM
        2/KYDyoKWlTSYta064E82h8=
X-Google-Smtp-Source: ABdhPJyKW90cL2cwF3ziX8/yek6HlATMb+dxL1rdS6OoVCnNMSk+kfjal5JHldXsoEd/SMPyNoCh5g==
X-Received: by 2002:a63:6884:: with SMTP id d126mr49266336pgc.341.1594234518991;
        Wed, 08 Jul 2020 11:55:18 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id c132sm485606pfb.112.2020.07.08.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:55:18 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>, Nick Terrell <terrelln@fb.com>
Subject: [PATCH v7 4/7] usr: add support for zstd compressed initramfs
Date:   Wed,  8 Jul 2020 11:50:21 -0700
Message-Id: <20200708185024.2767937-5-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708185024.2767937-1-nickrterrell@gmail.com>
References: <20200708185024.2767937-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

* Add support for a zstd compressed initramfs.
* Add compression for compressing built-in initramfs with zstd.

I have tested this patch by boot testing with buildroot and QEMU.
Specifically, I booted the kernel with both a zstd and gzip compressed
initramfs, both built into the kernel and separate. I ensured that the
correct compression algorithm was used. I tested on arm, aarch64, i386,
and x86_64.

This patch has been tested in production on aarch64 and x86_64 devices.

Additionally, I have performance measurements from internal use in
production. On an aarch64 device we saw 19 second boot time improvement
from switching from lzma to zstd (27 seconds to 8 seconds). On an x86_64
device we saw a 9 second boot time reduction from switching from xz to
zstd.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 usr/Kconfig  | 20 ++++++++++++++++++++
 usr/Makefile |  1 +
 2 files changed, 21 insertions(+)

diff --git a/usr/Kconfig b/usr/Kconfig
index 96afb03b65f9..2599bc21c1b2 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -100,6 +100,15 @@ config RD_LZ4
 	  Support loading of a LZ4 encoded initial ramdisk or cpio buffer
 	  If unsure, say N.
 
+config RD_ZSTD
+	bool "Support initial ramdisk/ramfs compressed using ZSTD"
+	default y
+	depends on BLK_DEV_INITRD
+	select DECOMPRESS_ZSTD
+	help
+	  Support loading of a ZSTD encoded initial ramdisk or cpio buffer.
+	  If unsure, say N.
+
 choice
 	prompt "Built-in initramfs compression mode"
 	depends on INITRAMFS_SOURCE != ""
@@ -196,6 +205,17 @@ config INITRAMFS_COMPRESSION_LZ4
 	  If you choose this, keep in mind that most distros don't provide lz4
 	  by default which could cause a build failure.
 
+config INITRAMFS_COMPRESSION_ZSTD
+	bool "ZSTD"
+	depends on RD_ZSTD
+	help
+	  ZSTD is a compression algorithm targeting intermediate compression
+	  with fast decompression speed. It will compress better than GZIP and
+	  decompress around the same speed as LZO, but slower than LZ4.
+
+	  If you choose this, keep in mind that you may need to install the zstd
+	  tool to be able to compress the initram.
+
 config INITRAMFS_COMPRESSION_NONE
 	bool "None"
 	help
diff --git a/usr/Makefile b/usr/Makefile
index c12e6b15ce72..b1a81a40eab1 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -15,6 +15,7 @@ compress-$(CONFIG_INITRAMFS_COMPRESSION_LZMA)	:= lzma
 compress-$(CONFIG_INITRAMFS_COMPRESSION_XZ)	:= xzmisc
 compress-$(CONFIG_INITRAMFS_COMPRESSION_LZO)	:= lzo
 compress-$(CONFIG_INITRAMFS_COMPRESSION_LZ4)	:= lz4
+compress-$(CONFIG_INITRAMFS_COMPRESSION_ZSTD)	:= zstd
 
 obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
 
-- 
2.27.0

