Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C76B2338BD
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jul 2020 21:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730497AbgG3TLj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jul 2020 15:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730488AbgG3TLf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jul 2020 15:11:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E74C061574;
        Thu, 30 Jul 2020 12:11:35 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b9so15033192plx.6;
        Thu, 30 Jul 2020 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZESbWSWufIqTsPaugjsg63j9f9ZzfVJX0mg3KbrzmvI=;
        b=RngkvXG5oTuNOO3i9nOOG65xKCkH3/E886NUiPg9ZgUA7ZLhZmGWxr5bUxipPWkWKc
         KGs7/Pg/F0ktpXYjGTX2WCOarqdVdt11rClXlHSRLf9ZCAWy1RWFLUkxwOKE2eQXUOuO
         XTdHE0RQuUrWQ98nA2LUezBja483fIqWJAg4UDhI+UhLBV3AbZobS/fn15xKiluvjxZ/
         DFyMEUIYqiUJiec9ZD+B3JNggid4SBCPa1XaYwKuAW/hQBF9HxCIF+SPiBJ7eQtUhgtZ
         virKPNuXEE65Q0gOVY4sNmX5lKNo5luTpm8aAH1CCLcC/hYnnUOUMT8l9UCXHnW6sZjw
         ObHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZESbWSWufIqTsPaugjsg63j9f9ZzfVJX0mg3KbrzmvI=;
        b=e7OPpJG/aJLZJd3F15gj81vVpdzH/qCHCM7e8lx4nCO5sNg+VJi60cFthVq8dRIwRu
         UE661VSN9aIlDVNB1R1GcA6YX1ydZjz0xAPEoa7JzOeQ0b+2jwm3qJSDMPZTp1X1IkPV
         OmRJnGxxViHgfK2OlzumZOGZnCi1kOMie+QYLyJnCNKSWeQrkLt3EvWNAfvfj4zIDoxf
         pkF9vmB6r65bReZN5oArdTMjs9J9xIoUt94nlDzoRBtfLrHrBBNh90ZGzrs6fDBjfHRY
         AOGmBLi9K0WkByRoXdAEEtBeBL3X5JJapvLqo/OrFZTLp5vDzqGwTrpeujqFr6NleyET
         jUcw==
X-Gm-Message-State: AOAM533IP/rDGw9Lg6AUYinAe20bpT2ckCvHwNieQXk274DLOtQ+JzcN
        04GVoR3sd72olYH1vgXaGWE=
X-Google-Smtp-Source: ABdhPJy+CA7y3GmHqbiWgUrRgUS+uVHqMDcMc6oXxZXEymdV4XrH3A8io87j/+2S8NsNI/fzYkEaUg==
X-Received: by 2002:a63:5a17:: with SMTP id o23mr352413pgb.218.1596136295129;
        Thu, 30 Jul 2020 12:11:35 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id o22sm8644976pfu.206.2020.07.30.12.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:11:34 -0700 (PDT)
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
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v10 6/8] x86: Add support for ZSTD compressed kernel
Date:   Thu, 30 Jul 2020 12:08:39 -0700
Message-Id: <20200730190841.2071656-7-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730190841.2071656-1-nickrterrell@gmail.com>
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

* Add support for zstd compressed kernel
* Define __DISABLE_EXPORTS in Makefile
* Remove __DISABLE_EXPORTS definition from kaslr.c
* Bump the heap size for zstd.
* Update the documentation.

Integrates the ZSTD decompression code to the x86 pre-boot code.

Zstandard requires slightly more memory during the kernel decompression
on x86 (192 KB vs 64 KB), and the memory usage is independent of the
window size.

__DISABLE_EXPORTS is now defined in the Makefile, which covers both
the existing use in kaslr.c, and the use needed by the zstd decompressor
in misc.c.

This patch has been boot tested with both a zstd and gzip compressed
kernel on i386 and x86_64 using buildroot and QEMU.

Additionally, this has been tested in production on x86_64 devices.
We saw a 2 second boot time reduction by switching kernel compression
from xz to zstd.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 Documentation/x86/boot.rst        |  6 +++---
 arch/x86/Kconfig                  |  1 +
 arch/x86/boot/compressed/Makefile |  6 +++++-
 arch/x86/boot/compressed/kaslr.c  |  7 -------
 arch/x86/boot/compressed/misc.c   |  4 ++++
 arch/x86/include/asm/boot.h       | 11 +++++++++--
 6 files changed, 22 insertions(+), 13 deletions(-)

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
index 5a828fde7a42..c08714ae76ec 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -26,7 +26,7 @@ OBJECT_FILES_NON_STANDARD	:= y
 KCOV_INSTRUMENT		:= n
 
 targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
-	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4
+	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4 vmlinux.bin.zst
 
 KBUILD_CFLAGS := -m$(BITS) -O2
 KBUILD_CFLAGS += -fno-strict-aliasing $(call cc-option, -fPIE, -fPIC)
@@ -42,6 +42,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += -Wno-pointer-sign
 KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
+KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 
 KBUILD_AFLAGS  := $(KBUILD_CFLAGS) -D__ASSEMBLY__
 GCOV_PROFILE := n
@@ -145,6 +146,8 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzo)
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4)
+$(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
+	$(call if_changed,zstd22)
 
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
@@ -152,6 +155,7 @@ suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
 suffix-$(CONFIG_KERNEL_XZ)	:= xz
 suffix-$(CONFIG_KERNEL_LZO) 	:= lzo
 suffix-$(CONFIG_KERNEL_LZ4) 	:= lz4
+suffix-$(CONFIG_KERNEL_ZSTD)	:= zst
 
 quiet_cmd_mkpiggy = MKPIGGY $@
       cmd_mkpiggy = $(obj)/mkpiggy $< > $@
diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index d7408af55738..0048269180d5 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -19,13 +19,6 @@
  */
 #define BOOT_CTYPE_H
 
-/*
- * _ctype[] in lib/ctype.c is needed by isspace() of linux/ctype.h.
- * While both lib/ctype.c and lib/cmdline.c will bring EXPORT_SYMBOL
- * which is meaningless and will cause compiling error in some cases.
- */
-#define __DISABLE_EXPORTS
-
 #include "misc.h"
 #include "error.h"
 #include "../string.h"
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
index 680c320363db..9191280d9ea3 100644
--- a/arch/x86/include/asm/boot.h
+++ b/arch/x86/include/asm/boot.h
@@ -24,9 +24,16 @@
 # error "Invalid value for CONFIG_PHYSICAL_ALIGN"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
+#if defined(CONFIG_KERNEL_BZIP2)
 # define BOOT_HEAP_SIZE		0x400000
-#else /* !CONFIG_KERNEL_BZIP2 */
+#elif defined(CONFIG_KERNEL_ZSTD)
+/*
+ * Zstd needs to allocate the ZSTD_DCtx in order to decompress the kernel.
+ * The ZSTD_DCtx is ~160KB, so set the heap size to 192KB because it is a
+ * round number and to allow some slack.
+ */
+# define BOOT_HEAP_SIZE		 0x30000
+#else
 # define BOOT_HEAP_SIZE		 0x10000
 #endif
 
-- 
2.27.0

