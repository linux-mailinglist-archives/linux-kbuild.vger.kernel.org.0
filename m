Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3202164DC
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 05:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgGGDvC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 23:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGDvC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 23:51:02 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53776C061755;
        Mon,  6 Jul 2020 20:51:02 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t15so3525688pjq.5;
        Mon, 06 Jul 2020 20:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZP/E/wcQKt33omd0toUeizzxTCF8DibP7WY2FO3Zetg=;
        b=DE/ilMjqxSc/kB9DeedH8nobQUUrFOe9oz1Lin3an7pg1hCkmLxDGpPfLpWdm9EuXa
         yI19rxn5BWwCKHUmGwIfWd2G8/1zMjn5cVK93XENgofQRv9vAfuU1lW6GklAT1KqU2uv
         KgEN17BJiSgAtimu8PE35E5TDuF4UA2VxwQfe++w3IXXQQ7GuZvunaifLoLM/mSU6g/R
         BGBYMHoD/WAdIYkLszCJm91KmmAtZG3Z0tZZhU6ZwOe1TKDFMTQo7+F7VnbyKVWpmKM9
         /TI4zyc9MMeabjlJ8HECI9RSIRAM7l3nEfPo3dH1b4VaaxlSZQ8nqMSrFu3TLqd2C0o8
         i6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZP/E/wcQKt33omd0toUeizzxTCF8DibP7WY2FO3Zetg=;
        b=TQ0atyLsUr86IXNoB1J5obT9KFvOTYrLWFCdxWzbyCPDjxil6YcuuL6DyUfXF3cDeg
         k+W5/+tVwnU4ahB5FH+uj3Zq1TV0nO0Je64vDmqwOfU+CkKQbJ2thoRz98bvOWT8bZQs
         hL4UpzYOjysBcDjTD1Ie6lw9ROUc3UCwnpYDbT1JN+v34aBrF6R47t2QBZu/0DxIxjkj
         RE3MMqQ/JJwY+e+XcbxSQoT4Nke3kRzGetm52UtCe0HhrbAc+EfQUYRE9PYnCF+2YjJZ
         fS7Kj6/5nxprc5gqjZJwR9DMoAEggMpOu52bDEhUEba385tcoRnJOwGf3hvRpY+0OqTx
         +ciw==
X-Gm-Message-State: AOAM532dUrmAainD63wK4Mu3dYq/9UwfgzEgz1QN7QQwkFz3uUQgfIis
        RlfoQa1M08dtLlRAYNZXkeA=
X-Google-Smtp-Source: ABdhPJxOgKUkCKo9mIQsMs6hXUMkuHmV/dui/dsRBmXmOgElMPD0H5jNyif9RU8/AY2LcbjzsBjJPA==
X-Received: by 2002:a17:902:c405:: with SMTP id k5mr27921195plk.233.1594093861796;
        Mon, 06 Jul 2020 20:51:01 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id d22sm20466320pfd.105.2020.07.06.20.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 20:51:01 -0700 (PDT)
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
Subject: [PATCH v6 4/8] init: add support for zstd compressed kernel
Date:   Mon,  6 Jul 2020 20:46:00 -0700
Message-Id: <20200707034604.1539157-5-nickrterrell@gmail.com>
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

* Adds the zstd cmd to scripts/Makefile.lib
* Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options

Architecture specific support is still needed for decompression.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 init/Kconfig         | 15 ++++++++++++++-
 scripts/Makefile.lib | 15 +++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

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
index 916b2f7f7098..d960f8815f87 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -413,6 +413,21 @@ quiet_cmd_xzkern = XZKERN  $@
 quiet_cmd_xzmisc = XZMISC  $@
       cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
 
+# ZSTD
+# ---------------------------------------------------------------------------
+# Appends the uncompressed size of the data using size_append. The .zst
+# format has the size information available at the beginning of the file too,
+# but it's in a more complex format and it's good to avoid changing the part
+# of the boot code that reads the uncompressed size.
+# Note that the bytes added by size_append will make the zstd tool think that
+# the file is corrupt. This is expected.
+
+quiet_cmd_zstd = ZSTD    $@
+cmd_zstd = (cat $(filter-out FORCE,$^) | \
+	zstd -19 && \
+        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
+	(rm -f $@ ; false)
+
 # ASM offsets
 # ---------------------------------------------------------------------------
 
-- 
2.27.0

