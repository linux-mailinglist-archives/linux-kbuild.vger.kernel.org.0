Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B8B1A2BA0
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 23:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgDHV4L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 17:56:11 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33636 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgDHV4K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 17:56:10 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay1so3052856plb.0;
        Wed, 08 Apr 2020 14:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x/7kW0cmEuUJVUvzc/KSfN5Zbm5nXQUqMb4FSyTtXWw=;
        b=PpeIq0JfDPS2kP9J/CGwtDCFqo9DEuuffcu0RP+XEoAjBtkqJCLffSD8nc5AJANqLK
         drY33xPk1gLtyRlCzv/o6Z50moAMU4m/em0J4VA3kX7CHHSiSvYFkxRU+v8nGXhKVmJL
         AROoUNAm7rrakoLy8Lmz5wR+lRWrsjWX5I+GBWNCYsHVVPiuFckMFpbk9Wgn30BpuWp1
         B5mgcH1kBXcpLtL8DdZlR2ZpV7d+j+tNvfmF+j0jGjeHu1aMGwhz6iaul7eg3MxOJrwm
         uCFPPiip02oJPrTgCAjzbjXD19PwqP1FNtwo0bBaj/JkCsAJKO38B8EIAoJlm+zaQMoU
         f/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x/7kW0cmEuUJVUvzc/KSfN5Zbm5nXQUqMb4FSyTtXWw=;
        b=j2A0Ggh5tIKgiFRncZTxcpwks3erz2YRNjpCP2OqKbGzhp47Ku9ffLceSRkKyUrlXa
         I3ZrkVPDIz93oRTGAU+UhaddjR30KnTgw1RVJRRNc+XqBa7jiE6FqPFYgfODshTdo998
         KW2APl5f82XqLSP/FqKZelQbr6owBRqhvx04EAmydFWrQUij+G4Rbv+WEzR9rDUh41ZW
         0+4wj3SUDyF4bsV0MSMQSW8ylyVzvH1tzzWwr06YRBk8MVxa61DqhxMhzTGInXQKEpk9
         bv2aglWTvENsV/o1gE4GRi2bPV/ZDk6qIjxppA1LisQIGdKypoNYc6zdOqeGpyKqxmL2
         8sYg==
X-Gm-Message-State: AGi0PuZ2TogJ9dZ3/c4C1VhYxUzqcuDaz2M0LIP0+jvb7gk7hAdkXpXA
        FoyOn2JSie+F3ytwUddQgxc=
X-Google-Smtp-Source: APiQypJrdbbCrJjd+Tae32wwTtNG8LDNM14wWyvTI9nNl166ioZfC8hfSttQuIYr6SC0o65bWuFc+g==
X-Received: by 2002:a17:902:7b82:: with SMTP id w2mr9349367pll.132.1586382968479;
        Wed, 08 Apr 2020 14:56:08 -0700 (PDT)
Received: from nickserv.localdomain (c-73-222-55-223.hsd1.ca.comcast.net. [73.222.55.223])
        by smtp.gmail.com with ESMTPSA id ci13sm459604pjb.16.2020.04.08.14.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:56:07 -0700 (PDT)
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
Subject: [PATCH v5 4/8] init: add support for zstd compressed kernel
Date:   Wed,  8 Apr 2020 14:57:07 -0700
Message-Id: <20200408215711.137639-5-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408215711.137639-1-nickrterrell@gmail.com>
References: <20200408215711.137639-1-nickrterrell@gmail.com>
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
index 492bb7000aa4..806874fdd663 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -176,13 +176,16 @@ config HAVE_KERNEL_LZO
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
@@ -261,6 +264,16 @@ config KERNEL_LZ4
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
index b12dd5ba4896..efe69b78d455 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -405,6 +405,21 @@ quiet_cmd_xzkern = XZKERN  $@
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

