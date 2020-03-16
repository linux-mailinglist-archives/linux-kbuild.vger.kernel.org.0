Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394A7186C89
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2020 14:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731350AbgCPNvE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 09:51:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33457 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731128AbgCPNvE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 09:51:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id a25so21334226wrd.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2020 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malat-biz.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yvWkEM1UKjPfAo/MjI5QrZi2Z7j2/Px2JYRRXhFGlyE=;
        b=Zgmsj0FYBtop3m56xRoX5baiDsAyUuGhGp0kfAU+NkjeGDW57GErbwxjmUFoUsK9z/
         +CzTzRa/pLB3zWWLhixjMC/foyGvB4j0ESu+s0r9nMi4vkTyVXW3bYejjtH304fLhcLJ
         6eD/BNZBBxwF1EgPjy0SDRmz6sc7eSMUtbC2mYBqSxc2AFYLZo1AGmxCdNqn//8lEgkM
         zas57FPiJkqbOD2GCAwki6fCdnNyP2dc+Tk0SdWIoIC+6DxhpAI9/awWDQQCUDb9v4S/
         BI0oxiWOR17Y/5vRIadaPAsCXL5J5iqNNb0quYto2uirsZ3Hkf1AwqzPE4K9tX704QhW
         2zpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yvWkEM1UKjPfAo/MjI5QrZi2Z7j2/Px2JYRRXhFGlyE=;
        b=KjRfM3svW1TUVG5QAKyvP/33gR8fvkIHBgTe3rX0TV4sN/loi0jv1r09ZrfjT8JKkA
         aH/no04JoQLR9bkCE6nHN5/Yxc+0KPrWUeH1SRI22oCog7TNFKQ+FsYzjTLkSTE+VJPb
         Tf5TxrF3NCFY4KLfcf+Ud6khholF8ywTnGgbCcmP92whoK+OeyixmtTHEd26ndjYa0I+
         wQa2z1Ad7ppT5SuNBRIsIwraZ27e99ffaKxB7N1oZog2hBBWH529hzpxoFMZRgsHj2Iv
         HB0ZYSYMbig5c9b6CV6OoNozqFDU1wh2QTOgT8R8rcx0bj4i4Jmc8+tLrAof9P0QQFKv
         bgFg==
X-Gm-Message-State: ANhLgQ2CQSDDDOpeXHqyHeSH6GlKqe/b1rMQWNfRgdULGSqW/le3FS/Q
        44IqgnczGpaTgWW7ZSPyfegvPUey0h/J8l/Q
X-Google-Smtp-Source: ADFU+vt2I3weNlt8bio7ziUksJsL5Ew5z1oX5UY0k6wbhqteYKXr7WCwuaUkWqAU9krvl31VSNjXEQ==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr30878635wrn.106.1584366660839;
        Mon, 16 Mar 2020 06:51:00 -0700 (PDT)
Received: from ntb.Speedport_W_921V_1_46_000 (p57AF9474.dip0.t-ipconnect.de. [87.175.148.116])
        by smtp.googlemail.com with ESMTPSA id p10sm93818060wrx.81.2020.03.16.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 06:50:58 -0700 (PDT)
From:   Petr Malat <oss@malat.biz>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        x86@kernel.org
Cc:     terrelln@fb.com, clm@fb.com, gregkh@linuxfoundation.org,
        keescook@chromium.org, Petr Malat <oss@malat.biz>
Subject: [PATCH 1/2] lib: add support for ZSTD-compressed kernel
Date:   Mon, 16 Mar 2020 14:50:24 +0100
Message-Id: <20200316135025.7579-1-oss@malat.biz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add support for extracting ZSTD-compressed kernel images, as well as
ZSTD-compressed initramfs.

Signed-off-by: Petr Malat <oss@malat.biz>
---
 include/linux/decompress/unzstd.h |  12 +++
 init/Kconfig                      |  15 ++-
 lib/Kconfig                       |   4 +
 lib/Makefile                      |   1 +
 lib/decompress.c                  |   5 +
 lib/decompress_unzstd.c           | 159 ++++++++++++++++++++++++++++++
 lib/zstd/decompress.c             |   2 +
 lib/zstd/fse_decompress.c         |   4 +-
 scripts/Makefile.lib              |   3 +
 usr/Kconfig                       |  24 +++++
 10 files changed, 227 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/decompress/unzstd.h
 create mode 100644 lib/decompress_unzstd.c

diff --git a/include/linux/decompress/unzstd.h b/include/linux/decompress/unzstd.h
new file mode 100644
index 000000000000..dd2c49d47456
--- /dev/null
+++ b/include/linux/decompress/unzstd.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef DECOMPRESS_UNZSTD_H
+#define DECOMPRESS_UNZSTD_H
+
+int unzstd(unsigned char *inbuf, long len,
+	long (*fill)(void*, unsigned long),
+	long (*flush)(void*, unsigned long),
+	unsigned char *output,
+	long *pos,
+	void (*error)(char *x));
+#endif
+
diff --git a/init/Kconfig b/init/Kconfig
index a34064a031a5..628eb3c290a2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -172,13 +172,16 @@ config HAVE_KERNEL_LZO
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
@@ -257,6 +260,16 @@ config KERNEL_LZ4
 	  is about 8% bigger than LZO. But the decompression speed is
 	  faster than LZO.
 
+config KERNEL_ZSTD
+	bool "ZSTD"
+	depends on HAVE_KERNEL_ZSTD
+	help
+	  Its compression ratio is roughly 10% worst than xz, but the
+	  decompression is 10x faster. Currently, this is one of the optimal
+	  algorithms available in the kernel, as there isn't an algorithm,
+	  which would provide a better compression ratio and a shorter
+	  decompression time.
+
 config KERNEL_UNCOMPRESSED
 	bool "None"
 	depends on HAVE_KERNEL_UNCOMPRESSED
diff --git a/lib/Kconfig b/lib/Kconfig
index 6e790dc55c5b..df301bd888d7 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -329,6 +329,10 @@ config DECOMPRESS_LZ4
 	select LZ4_DECOMPRESS
 	tristate
 
+config DECOMPRESS_ZSTD
+	select ZSTD_DECOMPRESS
+	tristate
+
 #
 # Generic allocator support is selected if needed
 #
diff --git a/lib/Makefile b/lib/Makefile
index 93217d44237f..3ab9f4c31f8b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -158,6 +158,7 @@ lib-$(CONFIG_DECOMPRESS_LZMA) += decompress_unlzma.o
 lib-$(CONFIG_DECOMPRESS_XZ) += decompress_unxz.o
 lib-$(CONFIG_DECOMPRESS_LZO) += decompress_unlzo.o
 lib-$(CONFIG_DECOMPRESS_LZ4) += decompress_unlz4.o
+lib-$(CONFIG_DECOMPRESS_ZSTD) += decompress_unzstd.o
 
 obj-$(CONFIG_TEXTSEARCH) += textsearch.o
 obj-$(CONFIG_TEXTSEARCH_KMP) += ts_kmp.o
diff --git a/lib/decompress.c b/lib/decompress.c
index 857ab1af1ef3..ab3fc90ffc64 100644
--- a/lib/decompress.c
+++ b/lib/decompress.c
@@ -13,6 +13,7 @@
 #include <linux/decompress/inflate.h>
 #include <linux/decompress/unlzo.h>
 #include <linux/decompress/unlz4.h>
+#include <linux/decompress/unzstd.h>
 
 #include <linux/types.h>
 #include <linux/string.h>
@@ -37,6 +38,9 @@
 #ifndef CONFIG_DECOMPRESS_LZ4
 # define unlz4 NULL
 #endif
+#ifndef CONFIG_DECOMPRESS_ZSTD
+# define unzstd NULL
+#endif
 
 struct compress_format {
 	unsigned char magic[2];
@@ -52,6 +56,7 @@ static const struct compress_format compressed_formats[] __initconst = {
 	{ {0xfd, 0x37}, "xz", unxz },
 	{ {0x89, 0x4c}, "lzo", unlzo },
 	{ {0x02, 0x21}, "lz4", unlz4 },
+	{ {0x28, 0xb5}, "zstd", unzstd },
 	{ {0, 0}, NULL, NULL }
 };
 
diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
new file mode 100644
index 000000000000..5af647a49885
--- /dev/null
+++ b/lib/decompress_unzstd.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Wrapper for decompressing ZSTD-compressed kernel, initramfs, and initrd
+ * Based on decompress_unlz4.c
+ *
+ * Copyright (C) 2020, Petr Malat <oss@malat.biz>
+ */
+
+#ifdef STATIC
+#define PREBOOT
+#include "zstd/zstd_internal.h"
+#include "zstd/huf_decompress.c"
+#include "zstd/entropy_common.c"
+#include "zstd/fse_decompress.c"
+#include "zstd/zstd_common.c"
+#include "zstd/decompress.c"
+#include "xxhash.c"
+#else
+#include <linux/decompress/unzstd.h>
+#include <linux/zstd.h>
+#endif
+#include <linux/types.h>
+#include <linux/decompress/mm.h>
+#include <linux/compiler.h>
+
+STATIC inline int INIT unzstd(u8 *input, long in_len,
+				long (*fill)(void *, unsigned long),
+				long (*flush)(void *, unsigned long),
+				u8 *output, long *posp,
+				void (*error)(char *x))
+{
+	int ret = -1, ws = 1 << ZSTD_WINDOWLOG_MAX;
+	u8 *inp, *outp;
+	ZSTD_DStream *zstd;
+	void *workspace;
+	size_t workspace_size;
+	ZSTD_outBuffer out;
+	ZSTD_inBuffer in;
+	unsigned long out_len;
+	unsigned long pos;
+
+	if (output) {
+		out_len = ULONG_MAX; // Caller knows data will fit
+		outp = output;
+	} else if (!flush) {
+		error("NULL output pointer and no flush function provided");
+		goto exit_0;
+	} else {
+		out_len = ZSTD_DStreamOutSize();
+		outp = large_malloc(out_len);
+		if (!outp) {
+			error("Could not allocate output buffer");
+			goto exit_0;
+		}
+	}
+
+	if (input && fill) {
+		error("Both input pointer and fill function provided,");
+		goto exit_1;
+	} else if (input) {
+		ZSTD_frameParams p;
+
+		inp = input;
+		if (!ZSTD_getFrameParams(&p, input, in_len))
+			ws = p.windowSize;
+	} else if (!fill) {
+		error("NULL input pointer and missing fill function");
+		goto exit_1;
+	} else {
+		in_len = ZSTD_DStreamInSize();
+		inp = large_malloc(in_len);
+		if (!inp) {
+			error("Could not allocate input buffer");
+			goto exit_1;
+		}
+	}
+
+	workspace_size = ZSTD_DStreamWorkspaceBound(ws);
+	workspace = large_malloc(workspace_size);
+	if (!workspace) {
+		error("Could not allocate workspace");
+		goto exit_2;
+	}
+
+	zstd = ZSTD_initDStream(ws, workspace, workspace_size);
+	if (!zstd) {
+		error("Could not initialize ZSTD");
+		goto exit_3;
+	}
+
+	in.src = inp;
+	in.size = in_len;
+	in.pos = 0;
+	if (posp)
+		*posp = 0;
+
+	for (;;) {
+		if (fill) {
+			in.size = fill(inp, in_len);
+			if (in.size == 0)
+				break;
+		} else if (in.size == in.pos) {
+			break;
+		}
+init:		out.dst = outp;
+		out.size = out_len;
+		out.pos = 0;
+		pos = in.pos;
+
+		ret = ZSTD_decompressStream(zstd, &out, &in);
+		if (posp)
+			*posp += in.pos - pos;
+		if (ZSTD_isError(ret)) {
+			error("Decompression failed");
+			ret = -EIO;
+			goto exit_3;
+		}
+
+		if (flush && out.pos) {
+			if (flush(out.dst, out.pos) != out.pos) {
+				ret = -EIO;
+				goto exit_3;
+			}
+			goto init;
+		}
+
+		if (ret == 0) {
+			ret = ZSTD_resetDStream(zstd);
+			if (ZSTD_isError(ret)) {
+				ret = -EIO;
+				goto exit_3;
+			}
+		}
+		if (in.pos < in.size)
+			goto init_out;
+	}
+
+	ret = 0;
+
+exit_3:	large_free(workspace);
+exit_2:	if (!input)
+		large_free(inp);
+exit_1:	if (!output)
+		large_free(outp);
+exit_0:	return ret;
+}
+
+#ifdef PREBOOT
+STATIC int INIT __decompress(unsigned char *buf, long in_len,
+			      long (*fill)(void*, unsigned long),
+			      long (*flush)(void*, unsigned long),
+			      unsigned char *output, long out_len,
+			      long *posp,
+			      void (*error)(char *x)
+	)
+{
+	return unzstd(buf, in_len, fill, flush, output, posp, error);
+}
+#endif
diff --git a/lib/zstd/decompress.c b/lib/zstd/decompress.c
index 269ee9a796c1..6a5e1ce22719 100644
--- a/lib/zstd/decompress.c
+++ b/lib/zstd/decompress.c
@@ -42,9 +42,11 @@
 /*-*************************************
 *  Macros
 ***************************************/
+#ifndef PREBOOT
 #define ZSTD_isError ERR_isError /* for inlining */
 #define FSE_isError ERR_isError
 #define HUF_isError ERR_isError
+#endif
 
 /*_*******************************************************
 *  Memory operations
diff --git a/lib/zstd/fse_decompress.c b/lib/zstd/fse_decompress.c
index a84300e5a013..bd4e9c891d96 100644
--- a/lib/zstd/fse_decompress.c
+++ b/lib/zstd/fse_decompress.c
@@ -54,12 +54,13 @@
 /* **************************************************************
 *  Error Management
 ****************************************************************/
-#define FSE_isError ERR_isError
 #define FSE_STATIC_ASSERT(c)                                   \
 	{                                                      \
 		enum { FSE_static_assert = 1 / (int)(!!(c)) }; \
 	} /* use only *after* variable declarations */
 
+#ifndef PREBOOT
+#define FSE_isError ERR_isError
 /* check and forward error code */
 #define CHECK_F(f)                  \
 	{                           \
@@ -67,6 +68,7 @@
 		if (FSE_isError(e)) \
 			return e;   \
 	}
+#endif
 
 /* **************************************************************
 *  Templates
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3fa32f83b2d7..1c2f2dc528dc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -337,6 +337,9 @@ quiet_cmd_lz4 = LZ4     $@
       cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
                   $(size_append); } > $@
 
+quiet_cmd_zstd = ZSTD    $@
+      cmd_zstd = { cat $(real-prereqs) | zstd -19 --zstd=wlog=21; $(size_append); } > $@
+
 # U-Boot mkimage
 # ---------------------------------------------------------------------------
 
diff --git a/usr/Kconfig b/usr/Kconfig
index a6b68503d177..892eb15957db 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -106,6 +106,15 @@ config RD_LZ4
 	  Support loading of a LZ4 encoded initial ramdisk or cpio buffer
 	  If unsure, say N.
 
+config RD_ZSTD
+	bool "Support initial ramdisk/ramfs compressed using ZSTD"
+	default y
+	depends on BLK_DEV_INITRD
+	select DECOMPRESS_ZSTD
+	help
+	  Support loading of a ZSTD encoded initial ramdisk or cpio buffer
+	  If unsure, say N.
+
 choice
 	prompt "Built-in initramfs compression mode"
 	depends on INITRAMFS_SOURCE!=""
@@ -214,6 +223,19 @@ config INITRAMFS_COMPRESSION_LZ4
 	  If you choose this, keep in mind that most distros don't provide lz4
 	  by default which could cause a build failure.
 
+config INITRAMFS_COMPRESSION_ZSTD
+	bool "ZSTD"
+	depends on RD_ZSTD
+	help
+	  Its compression ratio is roughly 10% worst than xz, but the
+	  decompression is 10x faster. Currently, this is one of the optimal
+	  algorithms available in the kernel, as there isn't an algorithm,
+	  which would provide a better compression ratio and a shorter
+	  decompression time.
+
+	  If you choose this, keep in mind that you may need to install the zstd
+	  tool to be able to compress the initram.
+
 endchoice
 
 config INITRAMFS_COMPRESSION
@@ -226,10 +248,12 @@ config INITRAMFS_COMPRESSION
 	default ".xz"   if INITRAMFS_COMPRESSION_XZ
 	default ".lzo"  if INITRAMFS_COMPRESSION_LZO
 	default ".lz4"  if INITRAMFS_COMPRESSION_LZ4
+	default ".zst"  if INITRAMFS_COMPRESSION_ZSTD
 	default ".gz"   if RD_GZIP
 	default ".lz4"  if RD_LZ4
 	default ".lzo"  if RD_LZO
 	default ".xz"   if RD_XZ
 	default ".lzma" if RD_LZMA
 	default ".bz2"  if RD_BZIP2
+	default ".zst"  if RD_ZSTD
 	default ""
-- 
2.20.1

