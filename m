Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D948193180
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 20:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbgCYT67 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 15:58:59 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45218 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYT67 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 15:58:59 -0400
Received: by mail-pg1-f195.google.com with SMTP id o26so1664088pgc.12;
        Wed, 25 Mar 2020 12:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tgsFBU7ua+ofhJIc4y1nmCgDqFmMsh71Dy8BWRgKxwU=;
        b=mDTWkVyXrJ+dB0S30kP8fqRyeCE0WOm6tT8ulZa/CACVIyAW/Yn+9d+cn0okKJY1Ji
         yAxHX6S2a1WBRuxHgO1owIIZXl2xQmwWLFfxFPXduscRMFbG7lBnDLSgRmvVYFjih3ez
         1Cr+QzS3Fg4CyFT++qGqPPyhmBXFUOvosHj+lg+X48t3YfSs3NcC/cghOOFAK5hZ2Lwa
         UJo/37rekygpoub/A1zaR0F6eUI9j/iNjAhOAWw1nTR2gt7uslVtJJT88Zjy3irhYrIW
         gZMo89CnBxcrlsNRyNfFjhx4snTrkJoVuFHxZhlRFcsDWciHy22jQCdYn4B6OeaE6OV+
         Lo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tgsFBU7ua+ofhJIc4y1nmCgDqFmMsh71Dy8BWRgKxwU=;
        b=HqKzWRdyCDbDhpXuWlB6D+iYj/clAAtrU09LFKUud+LrI8PqHSNkx1/xy/dejpK4Po
         cjanrEAYgiLT2Wm4D86ZdqhpisN4gOq1klImYfSHOMSDXDqcTb7ohlxlcAKUcXYgxq/K
         MdU+ciiEuA4qUv9Bl0vgLnXOw0b9tNymZr9vrXuykml3ssvmINnagCY7qNPIVxc+tybn
         IzjS7Kt1OZhFJPeMoN9uU6WVjXdXroFnLY1ip6hpJL2IL6nkS6ur/pIkZq/GL/yq2Jdm
         UfUTo/wjMUXbwIbfDgT+HqRRJeGTo6xw4dMt8pduLU1RwPpe1QF96wi0d3z9qEOoCYoe
         2ZFQ==
X-Gm-Message-State: ANhLgQ2C5BidlZZDTeggtI4QHH5rBFwxBT8vs5uDX/rTWDdb13xVTX2j
        rOsTibe3CVyu/K+KQ347YNY=
X-Google-Smtp-Source: ADFU+vv/jvN5qExcwh5oIxjwZbg00mqzaaDAc0tJzuAHCYBDq+n2Ws+zk9HZXWS3zltTZotW5zPkSw==
X-Received: by 2002:a62:1d1:: with SMTP id 200mr5429520pfb.8.1585166337564;
        Wed, 25 Mar 2020 12:58:57 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id d7sm19341374pfr.17.2020.03.25.12.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 12:58:56 -0700 (PDT)
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
Subject: [PATCH v3 4/8] init: add support for zstd compressed kernel
Date:   Wed, 25 Mar 2020 12:58:45 -0700
Message-Id: <20200325195849.407900-5-nickrterrell@gmail.com>
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

* Adds the zstd cmd to scripts/Makefile.lib
* Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options

Architecture specific support is still needed for decompression.

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
2.25.1

