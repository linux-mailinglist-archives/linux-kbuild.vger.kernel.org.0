Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0455F19A4C8
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 07:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731807AbgDAFin (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 01:38:43 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41700 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFin (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 01:38:43 -0400
Received: by mail-pf1-f193.google.com with SMTP id a24so4737468pfc.8;
        Tue, 31 Mar 2020 22:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UP8IwUWYTcT5/NVVSyvfz7dSm3jrxTqiULH5h7qF0f4=;
        b=WAHdZADHMyxLwtGDAeQL2VlISZ/SVqnbPCk7fplNMyZnzKLnMqALmSpLAlkmMns9F/
         XUc2Bj1P4f5KjxDkc7WiejVAyLQzBk1kzwuCthvK1/tMH4aLJIKGY57My/YD5ZYIfn7c
         DeuhYs0Dmzd+LMdS1f4A4ZdhI1uAKgvHEPVFcW9hIB/P3BQP5w7Gak5QdD2ziJK6qln7
         IztX59vDns70TQIC5wAHnAgyO/rXU9EMdrocPUTNgFNGY8OPoCsVB7EXs+6S/h1yUJil
         ZfAYrYyv4F938dB28rITgTJX8xztHAJrKjxn/Q4DvMjt/oTwK8k60OgutYhy5FBoTLrJ
         67ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UP8IwUWYTcT5/NVVSyvfz7dSm3jrxTqiULH5h7qF0f4=;
        b=KpH1LiWTtwZse4AU3tV4h1mHa42Mj6VF2+jz5gFf2RN22aeCaD4mLuJhawjVpQyvCC
         LETaRb0yfAibKV4dzX7wp6BUDRIVb400b8A3DeVMlvO8BHKddTAaEOgBaPldxzwWnL5G
         7k4F7SEa4/tFU2+sREuyTk8M+qZh4bFY2ee54BEyatdtfpUgkRhM5vo3ilKVuvDgeCIF
         UuteYV2DFDjeaZ2NfVhnwzWEvnuTne3tQlOBfqBeA3ybPYOn85SGBr6+EgodZHdV4V/G
         BkFcferqZUr1IIq6Etz24B6HW0Wmm1BGOmGvUHsucYNuXv2mqSESbT/xNDgtrVuvnu7h
         gtNw==
X-Gm-Message-State: ANhLgQ2g1lgX9F4eKQVEu1F5svT7qRYNXjil4YuZL6WZ0GE/oSc9PVnA
        MBderjSNA+2SNpWX5nxOSaM=
X-Google-Smtp-Source: ADFU+vuTNtEwDVWI1b2hflwFLta9rCwmI7uQYraJAC/S0DuYbvJSAwo9OiXasZx/iH8K2yPMh4C0cw==
X-Received: by 2002:a63:7e14:: with SMTP id z20mr22115701pgc.344.1585719521097;
        Tue, 31 Mar 2020 22:38:41 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id w69sm683077pfc.52.2020.03.31.22.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:38:40 -0700 (PDT)
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
Subject: [PATCH v4 3/8] lib: add zstd support to decompress
Date:   Tue, 31 Mar 2020 22:39:08 -0700
Message-Id: <20200401053913.216783-4-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401053913.216783-1-nickrterrell@gmail.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

* Add unzstd() and the zstd decompress interface.
* Add zstd support to decompress_method().

The decompress_method() and unzstd() functions are used to decompress
the initramfs and the initrd. The __decompress() function is used in
the preboot environment to decompress a zstd compressed kernel.

The zstd decompression function allows the input and output buffers to
overlap because that is used by x86 kernel decompression.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 include/linux/decompress/unzstd.h |  11 +
 lib/Kconfig                       |   4 +
 lib/Makefile                      |   1 +
 lib/decompress.c                  |   5 +
 lib/decompress_unzstd.c           | 342 ++++++++++++++++++++++++++++++
 5 files changed, 363 insertions(+)
 create mode 100644 include/linux/decompress/unzstd.h
 create mode 100644 lib/decompress_unzstd.c

diff --git a/include/linux/decompress/unzstd.h b/include/linux/decompress/unzstd.h
new file mode 100644
index 000000000000..56d539ae880f
--- /dev/null
+++ b/include/linux/decompress/unzstd.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_DECOMPRESS_UNZSTD_H
+#define LINUX_DECOMPRESS_UNZSTD_H
+
+int unzstd(unsigned char *inbuf, long len,
+	   long (*fill)(void*, unsigned long),
+	   long (*flush)(void*, unsigned long),
+	   unsigned char *output,
+	   long *pos,
+	   void (*error_fn)(char *x));
+#endif
diff --git a/lib/Kconfig b/lib/Kconfig
index bc7e56370129..11de5fa09a52 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -336,6 +336,10 @@ config DECOMPRESS_LZ4
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
index 611872c06926..09ad45ba6883 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -160,6 +160,7 @@ lib-$(CONFIG_DECOMPRESS_LZMA) += decompress_unlzma.o
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
index 000000000000..f317afab502f
--- /dev/null
+++ b/lib/decompress_unzstd.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Important notes about in-place decompression
+ *
+ * At least on x86, the kernel is decompressed in place: the compressed data
+ * is placed to the end of the output buffer, and the decompressor overwrites
+ * most of the compressed data. There must be enough safety margin to
+ * guarantee that the write position is always behind the read position.
+ *
+ * The safety margin for ZSTD with a 128 KB block size is calculated below.
+ * Note that the margin with ZSTD is bigger than with GZIP or XZ!
+ *
+ * The worst case for in-place decompression is that the beginning of
+ * the file is compressed extremely well, and the rest of the file is
+ * uncompressible. Thus, we must look for worst-case expansion when the
+ * compressor is encoding uncompressible data.
+ *
+ * The structure of the .zst file in case of a compresed kernel is as follows.
+ * Maximum sizes (as bytes) of the fields are in parenthesis.
+ *
+ *    Frame Header: (18)
+ *    Blocks: (N)
+ *    Checksum: (4)
+ *
+ * The frame header and checksum overhead is at most 22 bytes.
+ *
+ * ZSTD stores the data in blocks. Each block has a header whose size is
+ * a 3 bytes. After the block header, there is up to 128 KB of payload.
+ * The maximum uncompressed size of the payload is 128 KB. The minimum
+ * uncompressed size of the payload is never less than the payload size
+ * (excluding the block header).
+ *
+ * The assumption, that the uncompressed size of the payload is never
+ * smaller than the payload itself, is valid only when talking about
+ * the payload as a whole. It is possible that the payload has parts where
+ * the decompressor consumes more input than it produces output. Calculating
+ * the worst case for this would be tricky. Instead of trying to do that,
+ * let's simply make sure that the decompressor never overwrites any bytes
+ * of the payload which it is currently reading.
+ *
+ * Now we have enough information to calculate the safety margin. We need
+ *   - 22 bytes for the .zst file format headers;
+ *   - 3 bytes per every 128 KiB of uncompressed size (one block header per
+ *     block); and
+ *   - 128 KiB (biggest possible zstd block size) to make sure that the
+ *     decompressor never overwrites anything from the block it is currently
+ *     reading.
+ *
+ * We get the following formula:
+ *
+ *    safety_margin = 22 + uncompressed_size * 3 / 131072 + 131072
+ *                 <= 22 + (uncompressed_size >> 15) + 131072
+ */
+
+/*
+ * Preboot environments #include "path/to/decompress_unzstd.c".
+ * All of the source files we depend on must be #included.
+ * zstd's only source dependeny is xxhash, which has no source
+ * dependencies.
+ *
+ * zstd and xxhash avoid declaring themselves as modules
+ * when ZSTD_PREBOOT and XXH_PREBOOT are defined.
+ */
+#ifdef STATIC
+# define ZSTD_PREBOOT
+# define XXH_PREBOOT
+# include "xxhash.c"
+# include "zstd/entropy_common.c"
+# include "zstd/fse_decompress.c"
+# include "zstd/huf_decompress.c"
+# include "zstd/zstd_common.c"
+# include "zstd/decompress.c"
+#endif
+
+#include <linux/decompress/mm.h>
+#include <linux/kernel.h>
+#include <linux/zstd.h>
+
+/* 128MB is the maximum window size supported by zstd. */
+#define ZSTD_WINDOWSIZE_MAX	(1 << ZSTD_WINDOWLOG_MAX)
+/* Size of the input and output buffers in multi-call mode.
+ * Pick a larger size because it isn't used during kernel decompression,
+ * since that is single pass, and we have to allocate a large buffer for
+ * zstd's window anyways. The larger size speeds up initramfs decompression.
+ */
+#define ZSTD_IOBUF_SIZE		(1 << 17)
+
+static int INIT handle_zstd_error(size_t ret, void (*error)(char *x))
+{
+	const int err = ZSTD_getErrorCode(ret);
+
+	if (!ZSTD_isError(ret))
+		return 0;
+
+	switch (err) {
+	case ZSTD_error_memory_allocation:
+		error("ZSTD decompressor ran out of memory");
+		break;
+	case ZSTD_error_prefix_unknown:
+		error("Input is not in the ZSTD format (wrong magic bytes)");
+		break;
+	case ZSTD_error_dstSize_tooSmall:
+	case ZSTD_error_corruption_detected:
+	case ZSTD_error_checksum_wrong:
+		error("ZSTD-compressed data is corrupt");
+		break;
+	default:
+		error("ZSTD-compressed data is probably corrupt");
+		break;
+	}
+	return -1;
+}
+
+/*
+ * Handle the case where we have the entire input and output in one segment.
+ * We can allocate less memory (no circular buffer for the sliding window),
+ * and avoid some memcpy() calls.
+ */
+static int INIT decompress_single(const u8 *in_buf, long in_len, u8 *out_buf,
+				  long out_len, long *in_pos,
+				  void (*error)(char *x))
+{
+	const size_t wksp_size = ZSTD_DCtxWorkspaceBound();
+	void *wksp = large_malloc(wksp_size);
+	ZSTD_DCtx *dctx = ZSTD_initDCtx(wksp, wksp_size);
+	int err;
+	size_t ret;
+
+	if (dctx == NULL) {
+		error("Out of memory while allocating ZSTD_DCtx");
+		err = -1;
+		goto out;
+	}
+	/*
+	 * Find out how large the frame actually is, there may be junk at
+	 * the end of the frame that ZSTD_decompressDCtx() can't handle.
+	 */
+	ret = ZSTD_findFrameCompressedSize(in_buf, in_len);
+	err = handle_zstd_error(ret, error);
+	if (err)
+		goto out;
+	in_len = (long)ret;
+
+	ret = ZSTD_decompressDCtx(dctx, out_buf, out_len, in_buf, in_len);
+	err = handle_zstd_error(ret, error);
+	if (err)
+		goto out;
+
+	if (in_pos != NULL)
+		*in_pos = in_len;
+
+	err = 0;
+out:
+	if (wksp != NULL)
+		large_free(wksp);
+	return err;
+}
+
+static int INIT __unzstd(unsigned char *in_buf, long in_len,
+			 long (*fill)(void*, unsigned long),
+			 long (*flush)(void*, unsigned long),
+			 unsigned char *out_buf, long out_len,
+			 long *in_pos,
+			 void (*error)(char *x))
+{
+	ZSTD_inBuffer in;
+	ZSTD_outBuffer out;
+	ZSTD_frameParams params;
+	void *in_allocated = NULL;
+	void *out_allocated = NULL;
+	void *wksp = NULL;
+	size_t wksp_size;
+	ZSTD_DStream *dstream;
+	int err;
+	size_t ret;
+
+	if (out_len == 0)
+		out_len = LONG_MAX; /* no limit */
+
+	if (fill == NULL && flush == NULL)
+		/*
+		 * We can decompress faster and with less memory when we have a
+		 * single chunk.
+		 */
+		return decompress_single(in_buf, in_len, out_buf, out_len,
+					 in_pos, error);
+
+	/*
+	 * If in_buf is not provided, we must be using fill(), so allocate
+	 * a large enough buffer. If it is provided, it must be at least
+	 * ZSTD_IOBUF_SIZE large.
+	 */
+	if (in_buf == NULL) {
+		in_allocated = large_malloc(ZSTD_IOBUF_SIZE);
+		if (in_allocated == NULL) {
+			error("Out of memory while allocating input buffer");
+			err = -1;
+			goto out;
+		}
+		in_buf = in_allocated;
+		in_len = 0;
+	}
+	/* Read the first chunk, since we need to decode the frame header. */
+	if (fill != NULL)
+		in_len = fill(in_buf, ZSTD_IOBUF_SIZE);
+	if (in_len < 0) {
+		error("ZSTD-compressed data is truncated");
+		err = -1;
+		goto out;
+	}
+	/* Set the first non-empty input buffer. */
+	in.src = in_buf;
+	in.pos = 0;
+	in.size = in_len;
+	/* Allocate the output buffer if we are using flush(). */
+	if (flush != NULL) {
+		out_allocated = large_malloc(ZSTD_IOBUF_SIZE);
+		if (out_allocated == NULL) {
+			error("Out of memory while allocating output buffer");
+			err = -1;
+			goto out;
+		}
+		out_buf = out_allocated;
+		out_len = ZSTD_IOBUF_SIZE;
+	}
+	/* Set the output buffer. */
+	out.dst = out_buf;
+	out.pos = 0;
+	out.size = out_len;
+
+	/*
+	 * We need to know the window size to allocate the ZSTD_DStream.
+	 * Since we are streaming, we need to allocate a buffer for the sliding
+	 * window. The window size varies from 1 KB to ZSTD_WINDOWSIZE_MAX
+	 * (8 MB), so it is important to use the actual value so as not to
+	 * waste memory when it is smaller.
+	 */
+	ret = ZSTD_getFrameParams(&params, in.src, in.size);
+	err = handle_zstd_error(ret, error);
+	if (err)
+		goto out;
+	if (ret != 0) {
+		error("ZSTD-compressed data has an incomplete frame header");
+		err = -1;
+		goto out;
+	}
+	if (params.windowSize > ZSTD_WINDOWSIZE_MAX) {
+		error("ZSTD-compressed data has too large a window size");
+		err = -1;
+		goto out;
+	}
+
+	/*
+	 * Allocate the ZSTD_DStream now that we know how much memory is
+	 * required.
+	 */
+	wksp_size = ZSTD_DStreamWorkspaceBound(params.windowSize);
+	wksp = large_malloc(wksp_size);
+	dstream = ZSTD_initDStream(params.windowSize, wksp, wksp_size);
+	if (dstream == NULL) {
+		error("Out of memory while allocating ZSTD_DStream");
+		err = -1;
+		goto out;
+	}
+
+	/*
+	 * Decompression loop:
+	 * Read more data if necessary (error if no more data can be read).
+	 * Call the decompression function, which returns 0 when finished.
+	 * Flush any data produced if using flush().
+	 */
+	if (in_pos != NULL)
+		*in_pos = 0;
+	do {
+		/*
+		 * If we need to reload data, either we have fill() and can
+		 * try to get more data, or we don't and the input is truncated.
+		 */
+		if (in.pos == in.size) {
+			if (in_pos != NULL)
+				*in_pos += in.pos;
+			in_len = fill ? fill(in_buf, ZSTD_IOBUF_SIZE) : -1;
+			if (in_len < 0) {
+				error("ZSTD-compressed data is truncated");
+				err = -1;
+				goto out;
+			}
+			in.pos = 0;
+			in.size = in_len;
+		}
+		/* Returns zero when the frame is complete. */
+		ret = ZSTD_decompressStream(dstream, &out, &in);
+		err = handle_zstd_error(ret, error);
+		if (err)
+			goto out;
+		/* Flush all of the data produced if using flush(). */
+		if (flush != NULL && out.pos > 0) {
+			if (out.pos != flush(out.dst, out.pos)) {
+				error("Failed to flush()");
+				err = -1;
+				goto out;
+			}
+			out.pos = 0;
+		}
+	} while (ret != 0);
+
+	if (in_pos != NULL)
+		*in_pos += in.pos;
+
+	err = 0;
+out:
+	if (in_allocated != NULL)
+		large_free(in_allocated);
+	if (out_allocated != NULL)
+		large_free(out_allocated);
+	if (wksp != NULL)
+		large_free(wksp);
+	return err;
+}
+
+#ifndef ZSTD_PREBOOT
+STATIC int INIT unzstd(unsigned char *buf, long len,
+		       long (*fill)(void*, unsigned long),
+		       long (*flush)(void*, unsigned long),
+		       unsigned char *out_buf,
+		       long *pos,
+		       void (*error)(char *x))
+{
+	return __unzstd(buf, len, fill, flush, out_buf, 0, pos, error);
+}
+#else
+STATIC int INIT __decompress(unsigned char *buf, long len,
+			     long (*fill)(void*, unsigned long),
+			     long (*flush)(void*, unsigned long),
+			     unsigned char *out_buf, long out_len,
+			     long *pos,
+			     void (*error)(char *x))
+{
+	return __unzstd(buf, len, fill, flush, out_buf, out_len, pos, error);
+}
+#endif
-- 
2.26.0

