Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21BA91A2B95
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 23:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgDHV4P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 17:56:15 -0400
Received: from mail-pj1-f51.google.com ([209.85.216.51]:51093 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgDHV4O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 17:56:14 -0400
Received: by mail-pj1-f51.google.com with SMTP id b7so407906pju.0;
        Wed, 08 Apr 2020 14:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MW/hWj2bVQBUDfbhIydIazEKDOOaj54fKH8W4hXT46k=;
        b=LujmjODw28Lamq6qTJUEdrEb9D7n/TuMPlWMXNZfaOR9yvabUhsccKnz5uvWKMYUZ3
         IYkKJbOf19vo9cXbVYrLg6MOOpipCxPnUnrKhPDmk6IY7mP8X932nYYpWTCEcTNAydQq
         JItA2GOd/coUM8WnQ5Kg2J/r7f6DDVAGEuiNpi/pm7MS7dXbJ/KkW17d3Ywcz7ZaHQpt
         JQg1kxk6QSgNpgDCZEUQqhW2XR3VZBzQN+hARgVHozc7KXAHaF0kxTP0gq2alaGKFa+A
         Y9vNGUWzREzQ4gK6gS9Gdy7681nZ3andEf18noSG6eT8CNflK0V+Tl85NHaVa93ArNRA
         Z/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MW/hWj2bVQBUDfbhIydIazEKDOOaj54fKH8W4hXT46k=;
        b=hP3tXXo6j1qwzzox8SCuoNazFa+glcnwE7h7DgLDNvmZ+LAVckUtU6NR+1gRp6uNh1
         qCZumS727VS/uuYxsS2MnCpTcvDQVoZvV26uSKFn1NOIZvXksTYq3202q9PQuXxnhG6u
         Z4QB1vBKeLClmdXXJiV0egxfppMr04scPbu9OGN/2tq3wZfy885BisdgqOeXlmCftdR7
         l2dHhHiGNQpTdSPiwjeYEFiZBBoR5Z/ZrGqRPGVNkyYGzGsWed6+EcVRZAM60X0+O6QL
         IWamQA83P5em+hKtTCtBKKuepa8Lv3wiqk49qVDxKb3wlarvCUl3wGt6hslS77xXkPID
         sgYg==
X-Gm-Message-State: AGi0PuYKcnb+MbIygzeUvH/Au4fKLfyui2N+sFWbzmrNgkIyUp8sC2Bn
        71X4CPas4v/O+Mq9MtW1cqU=
X-Google-Smtp-Source: APiQypISWDXyBPKYHJoPyOX9Gminj57xEiTfpswdwZ6aJKah/C68JnpkonWCm5rCzbUveGN06W7zng==
X-Received: by 2002:a17:90b:1252:: with SMTP id gx18mr4137857pjb.77.1586382973098;
        Wed, 08 Apr 2020 14:56:13 -0700 (PDT)
Received: from nickserv.localdomain (c-73-222-55-223.hsd1.ca.comcast.net. [73.222.55.223])
        by smtp.gmail.com with ESMTPSA id ci13sm459604pjb.16.2020.04.08.14.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:56:12 -0700 (PDT)
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
Subject: [PATCH v5 5/8] usr: add support for zstd compressed initramfs
Date:   Wed,  8 Apr 2020 14:57:08 -0700
Message-Id: <20200408215711.137639-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408215711.137639-1-nickrterrell@gmail.com>
References: <20200408215711.137639-1-nickrterrell@gmail.com>
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
2.26.0

