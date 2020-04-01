Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5254F19A4CC
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 07:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbgDAFiy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 01:38:54 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:44731 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFiy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 01:38:54 -0400
Received: by mail-pg1-f173.google.com with SMTP id 142so11571319pgf.11;
        Tue, 31 Mar 2020 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R8dtQDKnSUbRACoeMRjT9BYjvuaePdj6FyBdWjfSkco=;
        b=NsZBZLEGwzS7qm19uGzYVjwy6ePnxDrzfYi3Z27sXhOpQS8CfMha93hKRsJKPUxOXK
         PTbkYMwmRBLWoT6dNccdQNlkvcmfT0510byNaLNIXPDlpOtgLa48GgPFB9TGNZwhyZO7
         5I+K8Jx9UE7ZLHGFC/KBpL7/wmklpCAP0XJ2pmyORb3MJhLERR0NFOA00Fzq+mHjILQC
         0D+0osexrQnw1JrG1qs8U37DptlHfS1qi/gU47pI1MYdrsDCamF41230HK/zHGoCWeFa
         d0RTYkTcN6fWy8OfqGmDvQGWLVk5/LS2zTRdXqEmSzFUxzdyv0bkS3K1LkOJu785N1bE
         EdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R8dtQDKnSUbRACoeMRjT9BYjvuaePdj6FyBdWjfSkco=;
        b=eIH3KH2YNhHVDnL7UDeadrw8xxlLcDfB4eDgLFh5eaEdzTPBR27h7xkxSFEJ4QdnFG
         hoB/9JiwLjE/blXVS5jo79ns27a4CpCFzCSJvkKwXYORWBmPtApBrqJCmd5bUf2wMfJZ
         IU3ZV5YNZGflvKLMVJy8bfkIBSqNvcyuCddD+n4xYSRnjetVZLOsGPtM7fuFxq8jsrpC
         V8iGuBMKjAy87Uhy9G3njgIhpmEPl+mPQwWEu55OZO8pys04uUcJFmijTanzrND00I6g
         sLE2Kk+TsW7gCLXvplXTBKQqHjiw0iyQLdl3p1pdaX7ES02o1OAnnJepK5saFVwvNSdI
         09zg==
X-Gm-Message-State: ANhLgQ12uoNkUO3hb4J41ud7a9BWoz4NtsI0AHlSgsyqJRjyuAMkdLmd
        XyNjcSTLLocU9aMxdn5qw1E=
X-Google-Smtp-Source: ADFU+vsmyDw2wougW39GeEYc2w4ylIB1jGJOdTyHYRTyK7DUCKCSj2L9RbygXNCwvPPO6GpmkOlL/Q==
X-Received: by 2002:aa7:95a1:: with SMTP id a1mr22337115pfk.279.1585719532537;
        Tue, 31 Mar 2020 22:38:52 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id w69sm683077pfc.52.2020.03.31.22.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:38:52 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v4 5/8] usr: add support for zstd compressed initramfs
Date:   Tue, 31 Mar 2020 22:39:10 -0700
Message-Id: <20200401053913.216783-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401053913.216783-1-nickrterrell@gmail.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
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
index bdf5bbd40727..43aca37d09b5 100644
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
@@ -207,4 +216,15 @@ config INITRAMFS_COMPRESSION_LZ4
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
 endchoice
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
2.26.0

