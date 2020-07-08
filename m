Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF6E219003
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 20:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgGHSzS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 14:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgGHSzQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 14:55:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72925C061A0B;
        Wed,  8 Jul 2020 11:55:16 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e8so22116213pgc.5;
        Wed, 08 Jul 2020 11:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/DI/50DEIVF9w1bgg6BLrThdU6CkFz7wJynwzPDC4k=;
        b=GLDzlIB2Oax6hF+ATkoT5AzF8ixWcQ9xkNuO+8srP1woTAgFi1fBGuS6NrqPKr/mAl
         IDBJt4SqLWZt7+lcRMZQm3Ht5FMl6cVucSYMGHMl0Qdk839Aae97EWRgeS1BNOFCdJBR
         MbrABf1Bf/naL8O5H+GHKn5WO1tPLRmpacrLz6nFSOHyGPVqaPADkL3ku7kGubHQ5mSQ
         IvICFxlCQoNl06UKI0m5+OKef8Csy2YVlOP0Rmw7qsFzAFuL6WDVegNtJECxXkeR2UHQ
         jvlFDM6VTINAOquH5HA8S2661EtoGsmrDGtfGp43yQvEDBa4q/WIJW2dQeuAMGT7Esqq
         C/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/DI/50DEIVF9w1bgg6BLrThdU6CkFz7wJynwzPDC4k=;
        b=QnI+VIvrLRBlyRbfZOCS+u98scOXOl+IaQSaJyFI3Ns1p8bBJFfLlBQ/+5lFWR4fTG
         uNu8/dtmWEI0xxpEVo3ua9OJ4jgL1UoTtVKWYaYQ0xXSanPAs91641JDNDNGe9qFy5DO
         oA8X6mtA52a3ALumuP1yajEXewiRIFsaA2gxJxZ1kf5VpZ04Bu1uJK0f9+Rx25acAi1/
         YJ08CFVa1KlaRjp5PgtDcJpN03s60NRs1gPb9LkA67cDJOu+BuZr4iXZ4a/0mK0mVDS1
         lJx6NjCyq/1IhDWtW4Qrie3i2NDOBgmzrvJpBwd6gE2kWJXN5cEJwMSHBPZuHByMcmon
         AHqQ==
X-Gm-Message-State: AOAM532uuSAyLZJKYd3lyV6Og5KdDV6amwW9KwW1QLonKkTozEvUX3wR
        nr5YvPIzgGNh123SYjMvyM0=
X-Google-Smtp-Source: ABdhPJyZ1ssrk+U3Zhc40rLB7kxQEZrB8nvzFfbkDaE2dafh9nedsH8yJe8wXyeqJNMjSqK9n31fqQ==
X-Received: by 2002:a63:d30a:: with SMTP id b10mr49913270pgg.430.1594234515952;
        Wed, 08 Jul 2020 11:55:15 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id c132sm485606pfb.112.2020.07.08.11.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:55:15 -0700 (PDT)
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
Subject: [PATCH v7 3/7] init: add support for zstd compressed kernel
Date:   Wed,  8 Jul 2020 11:50:20 -0700
Message-Id: <20200708185024.2767937-4-nickrterrell@gmail.com>
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

* Adds the zstd and zstd22 cmds to scripts/Makefile.lib
* Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options

Architecture specific support is still needed for decompression.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 Makefile             |  3 ++-
 init/Kconfig         | 15 ++++++++++++++-
 scripts/Makefile.lib | 22 ++++++++++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index fe0164a654c7..d14f9b7038ba 100644
--- a/Makefile
+++ b/Makefile
@@ -464,6 +464,7 @@ KLZOP		= lzop
 LZMA		= lzma
 LZ4		= lz4c
 XZ		= xz
+ZSTD		= zstd
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -512,7 +513,7 @@ CLANG_FLAGS :=
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
-export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ
+export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
diff --git a/init/Kconfig b/init/Kconfig
index 0498af567f70..8d99f0c5e240 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -191,13 +191,16 @@ config HAVE_KERNEL_LZO
 config HAVE_KERNEL_LZ4
 	bool
 
+config HAVE_KERNEL_ZSTD
+	bool
+
 config HAVE_KERNEL_UNCOMPRESSED
 	bool
 
 choice
 	prompt "Kernel compression mode"
 	default KERNEL_GZIP
-	depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERNEL_UNCOMPRESSED
+	depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERNEL_ZSTD || HAVE_KERNEL_UNCOMPRESSED
 	help
 	  The linux kernel is a kind of self-extracting executable.
 	  Several compression algorithms are available, which differ
@@ -276,6 +279,16 @@ config KERNEL_LZ4
 	  is about 8% bigger than LZO. But the decompression speed is
 	  faster than LZO.
 
+config KERNEL_ZSTD
+	bool "ZSTD"
+	depends on HAVE_KERNEL_ZSTD
+	help
+	  ZSTD is a compression algorithm targeting intermediate compression
+	  with fast decompression speed. It will compress better than GZIP and
+	  decompress around the same speed as LZO, but slower than LZ4. You
+	  will need at least 192 KB RAM or more for booting. The zstd command
+	  line tools is required for compression.
+
 config KERNEL_UNCOMPRESSED
 	bool "None"
 	depends on HAVE_KERNEL_UNCOMPRESSED
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 916b2f7f7098..54f7b7eb580b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -413,6 +413,28 @@ quiet_cmd_xzkern = XZKERN  $@
 quiet_cmd_xzmisc = XZMISC  $@
       cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
 
+# ZSTD
+# ---------------------------------------------------------------------------
+# Appends the uncompressed size of the data using size_append. The .zst
+# format has the size information available at the beginning of the file too,
+# but it's in a more complex format and it's good to avoid changing the part
+# of the boot code that reads the uncompressed size.
+#
+# Note that the bytes added by size_append will make the zstd tool think that
+# the file is corrupt. This is expected.
+#
+# zstd uses a maximum window size of 8 MB. zstd22 uses a maximum window size of
+# 128 MB. zstd22 is used for kernel compression because it is decompressed in a
+# single pass, so zstd doesn't need to allocate a window buffer. When streaming
+# decompression is used, like initramfs decompression, zstd22 should likely not
+# be used because it would require zstd to allocate a 128 MB buffer.
+
+quiet_cmd_zstd = ZSTD    $@
+      cmd_zstd = { cat $(real-prereqs) | $(ZSTD) -19; $(size_append); } > $@
+
+quiet_cmd_zstd22 = ZSTD22  $@
+      cmd_zstd22 = { cat $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
+
 # ASM offsets
 # ---------------------------------------------------------------------------
 
-- 
2.27.0

