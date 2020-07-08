Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E097521900A
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 20:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgGHSz2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 14:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726941AbgGHSz1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 14:55:27 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8219CC061A0B;
        Wed,  8 Jul 2020 11:55:27 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j19so15233502pgm.11;
        Wed, 08 Jul 2020 11:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MUWrYtVIM9tfCaLF1z9FO1yR7VJ62EYaOv1KIBaD3eo=;
        b=fGLNg4viVLiVDgAorBTr4rh3YasKLOQda/JkCNBUGvl7ZFZEfO5XZegq8PbH8JFtx1
         N/KyDYFJ51C+9yq7aCufep9n9lqgom7pvUbjK7XT77XeIA84oTxmVoTe8QzsxDX7Caok
         C5OokRQgmfOQyBcT+7X9bR2XxHPzuvSd2yEEFptpQ+5OVf67CBGG/WFVcFISqZM/AaOF
         xTSpbKYoM1G/qb+MO8vdWuy1lINiSamPlLBk3I0raVyCTmwM/AnFEZ6fbzcythBm9Tsb
         ZfgW20op0vf9Jh3oFW5BvmK6IUkPD1NK9AjuxHHVJMYktQfmfqM3b+QIjpwcJfwLd2Q6
         QZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MUWrYtVIM9tfCaLF1z9FO1yR7VJ62EYaOv1KIBaD3eo=;
        b=A6jSoTSkfhSviQARCzDPZWhHQn3KNEZBYsGwa+tNayJTZ1/VnhMIf2XSkNuhdbUSI8
         r0WTPJFCdz2EJOXe4MX4Hr/gy5lPzuekzJSUrEnHhIe65+lmfb0zA5n40oQ4DIaB8EtX
         joD2aCTX0RTY74e0OYO8km1lrnbHj6nG6ZiwsQUW5+HZrKP8mU1MGLJo3ijA+b7anyko
         V2aeQbLYz0X9WIXx2yBHpc5CK19vCKwMrXOlv3Ekae6YsweT+7+7vGqSPmDgVyaCXfzK
         aes+nUIYVSr8imskSofrKfNj5G8bKWALoMIhyOULrxQWLclR6VAMLEpqAdwtptws3GnZ
         +xJA==
X-Gm-Message-State: AOAM532LVMplLiInnQ6Ir8xz9puO7hTWXkPiqaN+ee49K2DYFT46MxR0
        Br6kegR4aliIADqJ+Uhvxqw=
X-Google-Smtp-Source: ABdhPJy7CWyUEoqqE1tdrpPndeZXYvEuEuM1nH7GHb+EJzQpKdFPMruqenAwWYq2j0staonCJ+FuBg==
X-Received: by 2002:aa7:938c:: with SMTP id t12mr53679634pfe.37.1594234526963;
        Wed, 08 Jul 2020 11:55:26 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id c132sm485606pfb.112.2020.07.08.11.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:55:26 -0700 (PDT)
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
Subject: [PATCH v7 6/7] x86: Add support for ZSTD compressed kernel
Date:   Wed,  8 Jul 2020 11:50:23 -0700
Message-Id: <20200708185024.2767937-7-nickrterrell@gmail.com>
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
index 7619742f91c9..3498cd990869 100644
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
+	$(call if_changed,zstd22)
 
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

