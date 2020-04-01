Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2D319A4CA
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 07:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbgDAFis (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 01:38:48 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38636 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFis (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 01:38:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id w3so9160618plz.5;
        Tue, 31 Mar 2020 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t8lmkwN8yl6DL08gaOx6+joAbnXsKs/DHyOOc8GPlME=;
        b=S7TbdBMHYv/gWQEXXLuCS8Dhjlpr47NLENHEWN3DvCkTL/chaw49uS27gVOLMAZrcd
         Ia7OIp0UUz1Fja5KCW3S3HurtEV2ble2ijy9y3+BcLDCWT87M5HXNMPrK3FBbGcblZAM
         +ueTm44QyhjdhumlnxTYoGmDvQaRtyPknzS43vKgWe1GhZIRyDAj7X9Uj4rIYNZcB26F
         aDZn59uyFU3WVN7J7d9HKy2ZnTPAHX8xC1/7VHZ87I3RmF2lkQjFGTLMpdBsIjxGCuCm
         2M+etRnvTUfZSMddoMIRghNVyKzEOQejjYOD5kPYJ3qfQp6+8GwVJwjWJeLLHYgGwkXx
         BfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t8lmkwN8yl6DL08gaOx6+joAbnXsKs/DHyOOc8GPlME=;
        b=ThKT32W+svl2TgXdIjUITwRdOosDAc+KQLjUCsIsE1WRQXV1QHclLpvsMfjcVaJWIp
         bXc1/Z50mdvc5pqC3uPG8qZW1LSKkxw/MV0mmRd0OrtA3bSVMCUgE6mpUwvyvpD/yqQD
         EXYtf2BwmDJfruFl21cNop5rycVY2+DxD7NiC6/w1t6XMx0JsjAAYXTt9nE74PrqM5Kk
         OX5COFI9ayjFVgEziVy5Lh/TDDfxKtYPpo76Ai4CmNf7lpNMpP4X0JIysKWzgSuSeE1V
         lQ/2VAzHOIXwAtFQrbJMYZ2FbytK8G3tJJuoXjVnoc57ZUi61jwLoEKRIOGOcZOZeyTx
         oYXg==
X-Gm-Message-State: ANhLgQ35fGx2IDA3pTE0Xa9eeKzfspokMMNoTUUVRqODplgSokC+nAh7
        x2uUlhCMoQFkEJPbLdBmusE=
X-Google-Smtp-Source: ADFU+vt+TWNYFRrxuhEAeGHths4eHw93nF63nkCsOIVC6MEs+k+LQekMWnAqEpxnVQluQ+ubiEdfiQ==
X-Received: by 2002:a17:902:7688:: with SMTP id m8mr20326175pll.160.1585719526928;
        Tue, 31 Mar 2020 22:38:46 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id w69sm683077pfc.52.2020.03.31.22.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:38:46 -0700 (PDT)
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
Subject: [PATCH v4 4/8] init: add support for zstd compressed kernel
Date:   Tue, 31 Mar 2020 22:39:09 -0700
Message-Id: <20200401053913.216783-5-nickrterrell@gmail.com>
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
index 20a6ac33761c..9b646a25918e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -173,13 +173,16 @@ config HAVE_KERNEL_LZO
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
@@ -258,6 +261,16 @@ config KERNEL_LZ4
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
index 752ff0a225a9..4b99893efa3d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -394,6 +394,21 @@ quiet_cmd_xzkern = XZKERN  $@
 quiet_cmd_xzmisc = XZMISC  $@
       cmd_xzmisc = cat $(real-prereqs) | xz --check=crc32 --lzma2=dict=1MiB > $@
 
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
2.26.0

