Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E96193182
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 20:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbgCYT7E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 15:59:04 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:33276 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYT7E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 15:59:04 -0400
Received: by mail-pl1-f178.google.com with SMTP id g18so1241243plq.0;
        Wed, 25 Mar 2020 12:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qpxlNK60H7+56apDr31XbwcBVUW8ZgAgiNsYAJEsVhQ=;
        b=S+UZv5qj2eQ7MnsV++kaiJRR2Vsaioq4+KIPpCccXyn4gAsgXXgqR0egaYuN+MRNEs
         +ml/o1hQt7GHJnAVhJQgrFMxz/pYonH9L3KUj/PbPnGX9iebuB4Ppe/GsQghrX8x7kXc
         FvNUbdY+DPpJOSigATiZoHnbQiObMOvVrOV3aZEK8fp1TJqdzTqkWRMtUH0czvv6PyvR
         e1CE0SWGjIwkQJ2fdjoHco8sbREdsKLhTF5qWUzRLJbMv1dmJOvvcqkLa7LtO7qGM3Ej
         mqKg9JE8fPfzEgbfkQ9Cl+2xrsZzVjCgLaoRGhezir80oPWeRlEGZCEQQ9yA1HHqsBFr
         ZKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qpxlNK60H7+56apDr31XbwcBVUW8ZgAgiNsYAJEsVhQ=;
        b=Vz3iEbzURE+4W/m9Jglyp1HjwbuULrdeZtj1jNU2AI6yNuaKfinsG/X9/NyRinjcTO
         v9JrUeXJff9iPbY7qgRA6z2azARuvKQcL+Virba/BCHRWRKVvAznIxXVyNOTbM2y6CdP
         hco6L6CIU+W0V1vThvyxq2MJ0XM+3G5dt+fB+ytTv0en2GlduZTp/z7iIbYiVHohXC+j
         VzOY+BGT8Q4vbPNqcOAiW1UOuBuBoEn5a/FrzZvZHUkTZD6d5h/v3D06d7O5R+A+Eyhl
         d3+3530JvPGSdrXLgsNTkqoif3dEqcWswwmSUptLDvZ2au7OqmUW4FyM7PXgQHp1YLZ+
         0lbA==
X-Gm-Message-State: ANhLgQ1Fm0XL1+USL+rmbDOkpJpnMPPK1SPOIPdTScwSEjYlI6midITX
        E+nXxpkHdZsU3PCHl9s8RaE=
X-Google-Smtp-Source: ADFU+vtBnJ2CZxDoaXbs/rwUxXpN00JIql5TgRGC+36dIuZLFe7YTW1LA5mNEoysgU6GqWe9OzcBRA==
X-Received: by 2002:a17:902:8542:: with SMTP id d2mr4879808plo.200.1585166343101;
        Wed, 25 Mar 2020 12:59:03 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id d7sm19341374pfr.17.2020.03.25.12.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 12:59:02 -0700 (PDT)
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
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v3 5/8] usr: add support for zstd compressed initramfs
Date:   Wed, 25 Mar 2020 12:58:46 -0700
Message-Id: <20200325195849.407900-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325195849.407900-1-nickrterrell@gmail.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
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
2.25.1

