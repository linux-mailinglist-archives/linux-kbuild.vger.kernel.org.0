Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D6C193186
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 20:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgCYT7R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 15:59:17 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39153 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYT7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 15:59:17 -0400
Received: by mail-pg1-f195.google.com with SMTP id b22so1674940pgb.6;
        Wed, 25 Mar 2020 12:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kjBNhx3dyu3I8KaVamn6GyM/cKRm3VvwJmdeLnLlZdg=;
        b=OUqJvLhIeRN1B/A/7T3ZYq2YwuAmTravJ3zOT3/4mRz+hWbmChUxsAHl3xZJ0YFinJ
         85FuB1ibrbinr099XcZ66rtbdW8NMmyRsCUXTntXbaipm/UM87sl79N+bIT4NbVpIwvq
         149RJ0EDSs7ghoHtRVDAFrezasO8/8QGSpzt+EYiiVdwXD+ew19wMoOEM14fm7ArB57x
         rf7bPe7CZO4K3cApL2f4LOkBlrfxum4OAnat4K80J8cWFESlCzIHeYqKaSA/XXM92WNH
         9IxWmwDWpJN+TXhEqxEhAT4obnT37AHICOT0Cv35R6jFphVfWTlQfrclvYPAwlun782h
         vGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kjBNhx3dyu3I8KaVamn6GyM/cKRm3VvwJmdeLnLlZdg=;
        b=eMEEyY2XVQVXf16YYsUhTa7hggczWPBfCnC87zxBT1enz8c5xevrV5N02/9dDbGkTm
         3I7UZdEgbuDMIecG3mPAwkt2tTtYdHF9hGJ76IoUwhs3bBQ/bbBVlqjzSjo6BHJzfmwu
         b9QvyDJg3Mqr8SBNGc+soY96Lp79NSZmZLXP9l1EgItjbZxUG86VFz2sANpxJIXGzBIY
         Ntz1UmiCXghlrsxbpLnUxdsKUTjWmqTj5Y4vWi2J9vJ5U2H/9o/q6GBvim7pbcF9WRmu
         YqP0GUe0yL0CL9NtH7s6B9s2rYP/tovwMNYbSDMUi4evz+jGnfbhXArnnfG2Yz+8SJ7z
         qDyA==
X-Gm-Message-State: ANhLgQ3FG77IKIiIMDYW2hSmm4JVrbr/dVeMQaZQFMBHBFCr0EQ+Q72h
        x9kHiJWzgUH3m8ZMhx/ynho=
X-Google-Smtp-Source: ADFU+vvPOLMCIPMH+KIEqSuhIxlAy0/FXuOir5MaxUgtwfe4CoSWNAI7aLjQYE9tuVm6ors62ubFRg==
X-Received: by 2002:a62:3305:: with SMTP id z5mr5352861pfz.297.1585166353838;
        Wed, 25 Mar 2020 12:59:13 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id d7sm19341374pfr.17.2020.03.25.12.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 12:59:13 -0700 (PDT)
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
Subject: [PATCH v3 7/8] x86: Add support for ZSTD compressed kernel
Date:   Wed, 25 Mar 2020 12:58:48 -0700
Message-Id: <20200325195849.407900-8-nickrterrell@gmail.com>
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

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 Documentation/x86/boot.rst        | 6 +++---
 arch/x86/Kconfig                  | 1 +
 arch/x86/boot/compressed/Makefile | 5 ++++-
 arch/x86/boot/compressed/misc.c   | 4 ++++
 arch/x86/include/asm/boot.h       | 6 ++++--
 5 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
index c9c201596c3e..cedcf4d49bf0 100644
--- a/Documentation/x86/boot.rst
+++ b/Documentation/x86/boot.rst
@@ -786,9 +786,9 @@ Protocol:	2.08+
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
index beea77046f9b..12d88997a3a6 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -183,6 +183,7 @@ config X86
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_FUNCTION_ERROR_INJECTION
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 26050ae0b27e..8233f598f15b 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -24,7 +24,7 @@ OBJECT_FILES_NON_STANDARD	:= y
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
2.25.1

