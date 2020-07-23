Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E85A22B6C5
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 21:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgGWTax (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 15:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgGWTaw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 15:30:52 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA77C0619DC;
        Thu, 23 Jul 2020 12:30:51 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mn17so3667712pjb.4;
        Thu, 23 Jul 2020 12:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pxETxrsRTIRtKLdyZGajYkPdhfOffddZB0SI/O3yUhI=;
        b=p6TusONOZKpZe6FG4zIDWhD54V/Co9IOigNnRAP4KmvDdfUctgZfR9dkt0lNKmNW9W
         xFyfvJ4aQdcLASbhfjGnpn9L+lDrFLqrcGLaSMyCXxGV6FKwxDkhlrF/ULA+zjqQc6cF
         VcLcwx9sQfoG1UK6gfN3VupGHxQy7O68Olp8C4/Lf/IVP2lfMdLiuBHtakTvtFWwK3a5
         zKlLIREAmxrvVCWKavE3N5gMfu/W+tJu2VEFdRgd6fQqvJ3xpyWjcQ/3Ofqk9D5zfz/8
         Lnsw81Q26vjATuoq9zwRbxrImxKU68rxbxrUD46D2plO4ocKT1NPVnlFqpva3x9iPoVG
         PP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pxETxrsRTIRtKLdyZGajYkPdhfOffddZB0SI/O3yUhI=;
        b=T5n4bsOR8Z/FqZKG3se5qtioUwPscXjlqkWzEGjBLCYIKf1b4L4lEbv/AmbcunsyDw
         6xISSXL4WF4vUCsZOKsMaK0vJ3HW5AaawvLNh1lZIfzm8xaD2ILLLWbDXEB9fza84FOD
         0SvRK6u4AdPiaxREDronR+oVCnrdk7f+6ffdsIs3ZJ/bVwu1p5/35WfXbkfSt577jKPk
         prqo6/usF7V7eeUDaabIXGo2B9YojogfiU44QCYE5RIKBF6hJX036o6LL9oZS8+vuIrP
         oE+xFfewqVEYj5HMG7d3Is29MyPnoR7E6GyT+K7gbb7DDv7z1mQvHgMQ3RJ0GNPpZBYv
         0PtQ==
X-Gm-Message-State: AOAM532i7UCgMtxEA8fvfmv1tOstnsgKnLWDGgq8pUbw9o4AUqqpYxny
        TP01ay+2FJdOa4sCpuelcEE=
X-Google-Smtp-Source: ABdhPJyDR6n06K+xZvLN6cEBw1ZQgUUM3FbVlgz3DtD7UZVMP8KjMKi0WU/rxWyCmPCrxvzktLWqMg==
X-Received: by 2002:a17:902:54e:: with SMTP id 72mr4929450plf.181.1595532651405;
        Thu, 23 Jul 2020 12:30:51 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id y18sm3794332pff.10.2020.07.23.12.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 12:30:50 -0700 (PDT)
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
Subject: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Date:   Thu, 23 Jul 2020 12:28:00 -0700
Message-Id: <20200723192801.351114-7-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723192801.351114-1-nickrterrell@gmail.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

* Add support for zstd compressed kernel
* Define __DISABLE_EXPORTS in misc.c
* Bump the heap size for zstd.
* Update the documentation.

Integrates the ZSTD decompression code to the x86 pre-boot code.

Zstandard requires slightly more memory during the kernel decompression
on x86 (192 KB vs 64 KB), and the memory usage is independent of the
window size.

__DISABLE_EXPORTS is defined in misc.c instead of the Makefile because
kaslr.c defines __DISABLE_EXPORTS, and defining it in the Makefile gives
duplicate definition warnings.

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
 arch/x86/boot/compressed/misc.c   | 9 +++++++++
 arch/x86/include/asm/boot.h       | 6 ++++--
 5 files changed, 21 insertions(+), 6 deletions(-)

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
index 9652d5c2afda..885dc20680c2 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -12,6 +12,11 @@
  * High loaded stuff by Hans Lermen & Werner Almesberger, Feb. 1996
  */
 
+/* decompressors bring in EXPORT_SYMBOL which is meaningless and will
+ * cause compiler errors in some cases.
+ */
+#define __DISABLE_EXPORTS
+
 #include "misc.h"
 #include "error.h"
 #include "pgtable.h"
@@ -77,6 +82,10 @@ static int lines, cols;
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

