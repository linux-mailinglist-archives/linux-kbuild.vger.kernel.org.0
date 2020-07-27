Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B52422FCB8
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 01:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgG0XLH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 19:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgG0XLG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 19:11:06 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF90C0619D2;
        Mon, 27 Jul 2020 16:11:06 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id n5so10820665pgf.7;
        Mon, 27 Jul 2020 16:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fmIcvsol2hVEYD4hslBcgfIPlSJK4NAnFqyLqCM1gdk=;
        b=qV7ro9ZjovZkkZyMXKYWC0Oe5Q9Fdx3g7cJvZY2XwbQLOywlWt+vBRZRaU9wFuNfW0
         Br4q/uxbqlOpllX3Q9XVON65Cn9UPJtbgZoteNE4XQUWPKaBue9xhwbxzk815CYiUUnk
         pvIPd0ctOuqZemWBvbiw8OEB+jXmwgMB4cFDdyCeLCGHyegzjOn+moR7OB+LmTVsMlj+
         HeL3fIgnLs0zIFkUimXjMbida5nz4Ht+JjV9pYLm4w85l4hEdFZs4Rl6PfLxSrKaTUKu
         I+NH8FrIeA/BD5ZnVrlQnKtJan7/dvegiLnJktrDZKyeTsj0Au9hpVlD3PNO985jNi3i
         xq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmIcvsol2hVEYD4hslBcgfIPlSJK4NAnFqyLqCM1gdk=;
        b=ZlMnzpmnlZ3BKaXsvChOdKqlTSQz8gMyvshlZLvt6gBkzd5XoeSnpYderUhnQZRNYc
         nZGyXOvxv9jeAAwSOLla2iixE4U+7kBxesIxQJYwX8vxMDu9WMQNm91XH88yMpyyMvcU
         HMAxtJv3k7cy3zVxaRmEc8MAqg4/1OkjFSIYMfCRRYDG10vwyZ7Njq6T4aZDGxCbHl8L
         GLQBH7yKQ8GlSs1GTSrPJi5T6nPpJw6GzxzrV5+mmjzOnmtQ8xWSuTUKVs8RD4+q9Gwl
         iBuQclwkUnwscXeOrSRLXKAMuxYZ+9DCWdPeA5yhPLt+w/mc+aEbC+fbvqGTi7tg4bG2
         W9fw==
X-Gm-Message-State: AOAM5305002CSOAzbrhmNmwYCPlOpdPeskW+jzdgVMJ6BN0NNYzdzMSP
        G3dM8bEqdyFK4iGmRcRv2TI=
X-Google-Smtp-Source: ABdhPJyAD2Ny3B4a/VETYHbZH5LDDOb7N3qkPBod1JzdVBHxCiMPrdYNmXRh5/+sVoa2uFoI8Bpnxw==
X-Received: by 2002:aa7:971d:: with SMTP id a29mr12555508pfg.308.1595891465730;
        Mon, 27 Jul 2020 16:11:05 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id y68sm3515931pfy.185.2020.07.27.16.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 16:11:05 -0700 (PDT)
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
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v9 4/7] usr: add support for zstd compressed initramfs
Date:   Mon, 27 Jul 2020 16:06:03 -0700
Message-Id: <20200727230606.906598-5-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727230606.906598-1-nickrterrell@gmail.com>
References: <20200727230606.906598-1-nickrterrell@gmail.com>
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

