Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DE82F4DD5
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 15:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727748AbhAMOwZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 09:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727744AbhAMOwY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 09:52:24 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E63C0617A2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 06:51:03 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id s26so3130271lfc.8
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 06:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oKz0LRNKKkifXcI4q7KxAUAGui2YAx04YT32ydV1cO8=;
        b=lqtkrp2wf9ZWkL+ws0kBMxnA2HtKu/STub3YIcGEZ0FRcradpaP6s0ersG0hbxbguG
         fxIDwhGfzLO1z8pGWJYl6B5/Uzffpo2AtW1/b2pfrbf4YiehiAyEjxtsib9MzgeVbbx/
         iPYFmYvlg1UqtwOGO3bvLS9vaOJPu7MEl864V5QffAwWEJinkiF7XQP+mjKT5zDtq0XX
         hFWQebVfe2rczSh8L1zJWPbr5pmCX7dywntYP4End8ALJo56pcjTIcEAGNAHc4tVL+4M
         0Ae3aGGB/yOUrYh8+8ztsp7eYaTOr6HfwhjLEQcCe/y2Wls4RIs4br23npe+EXESABb2
         ydew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oKz0LRNKKkifXcI4q7KxAUAGui2YAx04YT32ydV1cO8=;
        b=V6ORqaxnxbP3IsWuZylB15Ey3jj8BASIO5Ra2JEHUse4CIwY/19w2zGyS3KRhvFNUw
         lreSK/7N6pap5XJH4UQ5LT3yL33VgDctn1pK0NiUrN56s/QRuqwWGyKsZe2HireiM7B5
         Tcj7dZPzmywNNDuAdfnzbKUr5GQSNAWPELFJ0Zt52+exlojD3NaUZJUBIhOIJR/GAXQQ
         sZX7i/QBadSH8t9+4W2YKfSpy4dPshVpwvbXsoHv/fh3nRCN7Njd/lvjOmpjBi2Lzv0w
         MhAzL3Jy+B8Bqi5LhXgRjGNIHCm0fkhjwhVc5RElkOpqB8z6OGJ5N5erT2DUNWPb9qzT
         LBoQ==
X-Gm-Message-State: AOAM531DdEhqjkGyyhtG6OaD9p5S2q5tLsKXvdgzjObyeT/jtFuliPdM
        f8GFCAvN4yw39dUKjDeU9syim/jPjdSKNg==
X-Google-Smtp-Source: ABdhPJwWySnnxNhyCjdnF137UEnqKBRqjUnqxKSPqa/rquIT0u5ew/TW/hr5KkMhjdJh3Pi5jhRM8A==
X-Received: by 2002:a19:716:: with SMTP id 22mr1095383lfh.390.1610549461488;
        Wed, 13 Jan 2021 06:51:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:a31d:a03d:400:c1cf:51dc:62c0:df06])
        by smtp.gmail.com with ESMTPSA id j18sm231382lfb.77.2021.01.13.06.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 06:51:00 -0800 (PST)
From:   ">" <lucjan.lucjanov@gmail.com>
X-Google-Original-From: Piotr Gorski lucjan.lucjanov@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Piotr Gorski <lucjan.lucjanov@gmail.com>
Subject: [PATCH] init: add support for zstd compressed modules
Date:   Wed, 13 Jan 2021 15:50:56 +0100
Message-Id: <20210113145056.834091-1-lucjan.lucjanov@gmail.com>
X-Mailer: git-send-email 2.30.0.81.g72c4083ddf
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Piotr Gorski <lucjan.lucjanov@gmail.com>

kmod 28 supports modules compressed in zstd format so let's add this possibility to kernel.

Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
---
 Makefile     | 7 +++++--
 init/Kconfig | 9 ++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index cf54d33ba863..90986a3f5897 100644
--- a/Makefile
+++ b/Makefile
@@ -1049,8 +1049,8 @@ endif # INSTALL_MOD_STRIP
 export mod_strip_cmd
 
 # CONFIG_MODULE_COMPRESS, if defined, will cause module to be compressed
-# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP
-# or CONFIG_MODULE_COMPRESS_XZ.
+# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP,
+# CONFIG_MODULE_COMPRESS_XZ, or CONFIG_MODULE_COMPRESS_ZSTD.
 
 mod_compress_cmd = true
 ifdef CONFIG_MODULE_COMPRESS
@@ -1060,6 +1060,9 @@ ifdef CONFIG_MODULE_COMPRESS
   ifdef CONFIG_MODULE_COMPRESS_XZ
     mod_compress_cmd = $(XZ) --lzma2=dict=2MiB -f
   endif # CONFIG_MODULE_COMPRESS_XZ
+  ifdef CONFIG_MODULE_COMPRESS_ZSTD
+    mod_compress_cmd = $(ZSTD) -T0 -9 --rm -f
+  endif # CONFIG_MODULE_COMPRESS_ZSTD
 endif # CONFIG_MODULE_COMPRESS
 export mod_compress_cmd
 
diff --git a/init/Kconfig b/init/Kconfig
index b77c60f8b963..11d7dfea98b6 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2216,8 +2216,8 @@ config MODULE_COMPRESS
 	bool "Compress modules on installation"
 	help
 
-	  Compresses kernel modules when 'make modules_install' is run; gzip or
-	  xz depending on "Compression algorithm" below.
+	  Compresses kernel modules when 'make modules_install' is run; gzip,
+	  xz, or zstd depending on "Compression algorithm" below.
 
 	  module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
 
@@ -2239,7 +2239,7 @@ choice
 	  This determines which sort of compression will be used during
 	  'make modules_install'.
 
-	  GZIP (default) and XZ are supported.
+	  GZIP (default), XZ, and ZSTD are supported.
 
 config MODULE_COMPRESS_GZIP
 	bool "GZIP"
@@ -2247,6 +2247,9 @@ config MODULE_COMPRESS_GZIP
 config MODULE_COMPRESS_XZ
 	bool "XZ"
 
+config MODULE_COMPRESS_ZSTD
+	bool "ZSTD"
+
 endchoice
 
 config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
-- 
2.30.0.81.g72c4083ddf

