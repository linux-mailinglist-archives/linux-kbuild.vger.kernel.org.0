Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0D82164E2
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 05:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728194AbgGGDvQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 23:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGDvP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 23:51:15 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA220C061755;
        Mon,  6 Jul 2020 20:51:15 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e8so19378233pgc.5;
        Mon, 06 Jul 2020 20:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kbHY33GTP1bNYS+0dMzsN3TnXinEceT/4eHks/QCJYc=;
        b=Vh+z4zGVO4gA8yifwaLFkSx+EFbBPKWTPb9hURD1NVWhk2UdDTTaPkarStcp2QCxO1
         Z6TVaBAiBmRkP2dmZ8O6ClrWaxQtDccqmwqdpJdkE9XRCSHKyl/kwzprdJdecZ8tkheC
         Zr7rf2FnyGox/znL7ND+wYgpYbd7904deuUhVMCV5fnYhEODFdFsPasfmM3+JaYlqvAu
         uCAfEAaTndWshSx5/NdadcHOdmmd/iZcgUjcUn8nCiyXc4h5XUwqNhFUGZr15mcv7MtO
         BOYFek1GQNsmoi1tPuUMXbZMoMDvFgzw0vZLN1SaS1xOsIfQYbj0uXAA1UKiQC/id3JX
         5wPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kbHY33GTP1bNYS+0dMzsN3TnXinEceT/4eHks/QCJYc=;
        b=EfhOraw+7jq190WP+AoHLtqKJ/zT0Jmxcp1DyPvKX28B4XhaUAMZAZektpv/26Di4D
         QecGreFvkQeW+w3IO7IrxvU3LC0vSuFJ6Kp1oSiemiARHJFZoE9/IHa7Zojcrb3ylJmE
         Asc4YlefNLS33lsYeyBncO86vHAhhSAMrxpeDfQ4tinr5iSZ1Ao8oVs4vJcwGvxm4kDa
         yxdpEmLSWJG9Csd8Imv25P0YKdQAzGqOMd52Jl17UHNQY87/TN6Uy6ZPRzIpK9cb0Qli
         geeU87mM0eWwxfVuGenrN+20YVTzyilPVhUX6WZrakSfpu8ekLfCMEXvakf+GkRLAkuP
         Ydfg==
X-Gm-Message-State: AOAM532ii4yarf5VYq7O1CVjdDVgal2DQos/+9bLiswyN8YEFE+RAfzL
        3to0HwncrFx1CZR54CQ0Yvw=
X-Google-Smtp-Source: ABdhPJzdWGGzHFJ40NDh7tnIexHKj7pgVLrbK0GEuAkmv2zlSNXwaH8GB+AxMWucrDE8fgC4xXTqIA==
X-Received: by 2002:a63:395:: with SMTP id 143mr43202210pgd.57.1594093875161;
        Mon, 06 Jul 2020 20:51:15 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id d22sm20466320pfd.105.2020.07.06.20.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 20:51:14 -0700 (PDT)
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
Subject: [PATCH v6 7/8] x86: Add support for ZSTD compressed kernel
Date:   Mon,  6 Jul 2020 20:46:03 -0700
Message-Id: <20200707034604.1539157-8-nickrterrell@gmail.com>
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

* Add support for zstd compressed kernel
* Bump the heap size for zstd.
* Update the documentation.

Integrates the ZSTD decompression code to the x86 pre-boot code.

Zstandard requires slightly more memory during the kernel decompression
on x86 (192 KB vs 64 KB), and the memory usage is independent of the
window size.

This patch has been boot tested with both a zstd and gzip compressed
kernel on i386 and x86_64 using buildroot and QEMU.

Additionally, this has been tested in production on x86_64 devices.
We saw a 2 second boot time reduction by switching kernel compression
from xz to zstd.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 Documentation/x86/boot.rst        | 6 +++---
 arch/x86/Kconfig                  | 1 +
 arch/x86/boot/compressed/Makefile | 5 ++++-
 arch/x86/boot/compressed/misc.c   | 4 ++++
 arch/x86/include/asm/boot.h       | 6 ++++--
 5 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
index 5325c71ca877..7fafc7ac00d7 100644
--- a/Documentation/x86/boot.rst
+++ b/Documentation/x86/boot.rst
@@ -782,9 +782,9 @@ Protocol:	2.08+
   uncompressed data should be determined using the standard magic
   numbers.  The currently supported compression formats are gzip
   (magic numbers 1F 8B or 1F 9E), bzip2 (magic number 42 5A), LZMA
-  (magic number 5D 00), XZ (magic number FD 37), and LZ4 (magic number
-  02 21).  The uncompressed payload is currently always ELF (magic
-  number 7F 45 4C 46).
+  (magic number 5D 00), XZ (magic number FD 37), LZ4 (magic number
+  02 21) and ZSTD (magic number 28 B5). The uncompressed payload is
+  currently always ELF (magic number 7F 45 4C 46).
 
 ============	==============
 Field name:	payload_length
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 883da0abf779..4a64395bc35d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -188,6 +188,7 @@ config X86
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_FUNCTION_ERROR_INJECTION
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 7619742f91c9..471e61400a2e 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -26,7 +26,7 @@ OBJECT_FILES_NON_STANDARD	:= y
 KCOV_INSTRUMENT		:= n
 
 targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
-	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4
+	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4 vmlinux.bin.zst
 
 KBUILD_CFLAGS := -m$(BITS) -O2
 KBUILD_CFLAGS += -fno-strict-aliasing $(call cc-option, -fPIE, -fPIC)
@@ -145,6 +145,8 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzo)
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4)
+$(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
+	$(call if_changed,zstd)
 
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
@@ -152,6 +154,7 @@ suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
 suffix-$(CONFIG_KERNEL_XZ)	:= xz
 suffix-$(CONFIG_KERNEL_LZO) 	:= lzo
 suffix-$(CONFIG_KERNEL_LZ4) 	:= lz4
+suffix-$(CONFIG_KERNEL_ZSTD)	:= zst
 
 quiet_cmd_mkpiggy = MKPIGGY $@
       cmd_mkpiggy = $(obj)/mkpiggy $< > $@
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 9652d5c2afda..39e592d0e0b4 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -77,6 +77,10 @@ static int lines, cols;
 #ifdef CONFIG_KERNEL_LZ4
 #include "../../../../lib/decompress_unlz4.c"
 #endif
+
+#ifdef CONFIG_KERNEL_ZSTD
+#include "../../../../lib/decompress_unzstd.c"
+#endif
 /*
  * NOTE: When adding a new decompressor, please update the analysis in
  * ../header.S.
diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
index 680c320363db..d6dd43d25d9f 100644
--- a/arch/x86/include/asm/boot.h
+++ b/arch/x86/include/asm/boot.h
@@ -24,9 +24,11 @@
 # error "Invalid value for CONFIG_PHYSICAL_ALIGN"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
+#if defined(CONFIG_KERNEL_BZIP2)
 # define BOOT_HEAP_SIZE		0x400000
-#else /* !CONFIG_KERNEL_BZIP2 */
+#elif defined(CONFIG_KERNEL_ZSTD)
+# define BOOT_HEAP_SIZE		 0x30000
+#else
 # define BOOT_HEAP_SIZE		 0x10000
 #endif
 
-- 
2.27.0

