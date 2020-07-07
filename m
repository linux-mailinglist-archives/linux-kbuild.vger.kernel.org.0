Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632032164DE
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 05:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgGGDvH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 23:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGDvH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 23:51:07 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B07C061755;
        Mon,  6 Jul 2020 20:51:07 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 1so146716pfn.9;
        Mon, 06 Jul 2020 20:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fmIcvsol2hVEYD4hslBcgfIPlSJK4NAnFqyLqCM1gdk=;
        b=rE7i9cEWIBvwtYgkNdz4ua+7Y4X3+xt/vy88ZS5IAfsJhE8lZipXrCL8mXvXaDq3cD
         RwxEEI03JTY/ty2lfmlQb85X1KSM2kqKIE0Vb0yClKmmzyPjmJk/2PhFp4xbD8Lmmd+2
         dXG8iFEP1uhK7K4WoP9ibnypOyLMMe5Gp68bctgD+JvHdJ5PQhSw+QbAPSudRMOXlcMx
         NVKURp2hqHPXCnFWoKU96I1Nb3SvRgHdhyRyd3KgCuRHaKtEDUHokzuYAuYYSZIggamn
         r9WkqP/Lge/fMniWJrSTgduZBLuJz/+PLLhxZckPqeFhBz3dXRp0jD2ApihM58c97brW
         9NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmIcvsol2hVEYD4hslBcgfIPlSJK4NAnFqyLqCM1gdk=;
        b=m14i8BVWUCS2QOBQOv+SUsk7Ze9EpeZbiMLMRlgUUFWNR08Dc9HB8SmLpKXAgxy5rV
         wPBAUSnWss4J/Ji4s1Al0hAEgRj8MRBsmjIQtdTNUJbSjDS2ag3tBUyyAFavlHCxH1wP
         ixTJuqZmRUIm5KSBItc8ZmNlLDhv6pZGVet6vp0UKKFYiqZ/YVFybHrblDW5BsBc24Ml
         NQ9F0ltNi/Xdaxg1qUEIlN3y+QwRdQal9/AUZf/NJ6jw7/8yXixeZgvimRi9VcbQYlrA
         tv9EcJTNBrikaGWuFFERmdoTbbLs3CuT3++XVR2l4RofOlewwdAXeJgs+ZBxJpczY//u
         Gurg==
X-Gm-Message-State: AOAM530NpPtI43pTVK5ZRA7Oggf6EJ5v1vOA5Tib1TdFNtTj7GZXWSit
        +tI8TK2yRiM31jmlkQXLPHY=
X-Google-Smtp-Source: ABdhPJzfOXzmpi11UvSJ9/KnWhmuYZtjWEjCO8TsQQzOAt3qR+8LSYuWyi5luH4c1TcKucl+LR0gpw==
X-Received: by 2002:a63:7d16:: with SMTP id y22mr40888624pgc.136.1594093866557;
        Mon, 06 Jul 2020 20:51:06 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id d22sm20466320pfd.105.2020.07.06.20.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 20:51:06 -0700 (PDT)
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
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v6 5/8] usr: add support for zstd compressed initramfs
Date:   Mon,  6 Jul 2020 20:46:01 -0700
Message-Id: <20200707034604.1539157-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707034604.1539157-1-nickrterrell@gmail.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
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

