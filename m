Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B1134E65B
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Mar 2021 13:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbhC3Ldq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Mar 2021 07:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbhC3LdU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Mar 2021 07:33:20 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A4AC061574;
        Tue, 30 Mar 2021 04:33:19 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u20so19426650lja.13;
        Tue, 30 Mar 2021 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JuMh1wC/OLcfpt4wvao8rEFqv3gCukrAypbolc/zZxo=;
        b=iIfvHN7AACyyMx8jC4e02zGDKfXn6CavblKgpt5sigMwz1EtZMzdjYB0/XElrO3Yvd
         S1jMQCeHH2+IUc1I/P+6GL56rHgMBPCx4Kumxa0SeijHic6XDRX99zupYvmHIjmK9B3u
         YtMsoJfDk6kxk+KTHsMTJK6hCGoGSylF2MlxhtmsUcGqo0XaymyeMgn0wxZyUKZEvcPG
         m/ondyv0o/K7lFbC//1tNTzJNrZ09CW3jHUG8GCRZnKxesQaBwLR3b1U2EPiJZkQ5gac
         zqwnxcKJBXUYetH6jaAdc0QJwc2vFHW+I8wbaz58zv9hsdiLQHzM52BXmDcNzBXRozVS
         ngvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JuMh1wC/OLcfpt4wvao8rEFqv3gCukrAypbolc/zZxo=;
        b=ozMz5b5KKenX39eYyz9JKt9l9XVRgr9qKzEOv1ZmBLadnCgyEMB3ZPnMFJuE2KpZc5
         Olp3LQAU0xDRt2Vy4MIxOEGgcL93nWwNCP7NZdTxCFX6hjzlQjWqz+kwfozoV8iLYNpl
         rxOcBcXwG59LyHxuaIUCocqVBLG3I6zuGJIf1W9uFE14Dg6nQib11NaxLcvUDB/49jJ9
         O3SWGIdG3ejgTTrve8zLKEExoHUXC5qtqewksMAc943+sMUimcvx6d/xh8R2lFg/AqV3
         nIhoPxVijnD/JB5jsbavZ3aQX+IQqxVSA95RrZEULnNZMjLVt+5+nm6Plkdm1noXa8e4
         bkZg==
X-Gm-Message-State: AOAM532Pq6tEQPBrHPZ8bsm7D2R+kB4Vw1LkYYd36ENthQj0jmoKbZLK
        tpGIGB5td564j1kVoPgA3FU/bwia3KQD0g==
X-Google-Smtp-Source: ABdhPJy9AC6wos8bDXXwTl8aW1jfhEjrewaAdfZfjR1kKil7wjOjsVbCM3K9n+lXH12PO/vRi/Bqsg==
X-Received: by 2002:a2e:a177:: with SMTP id u23mr20866440ljl.286.1617103991396;
        Tue, 30 Mar 2021 04:33:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a31a:e13a:eb00:c5cf:27cc:1ef2:859])
        by smtp.gmail.com with ESMTPSA id o139sm2148713lfa.129.2021.03.30.04.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 04:33:10 -0700 (PDT)
From:   Piotr Gorski <lucjan.lucjanov@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>
Subject: [PATCH] init: add support for zstd compressed modules
Date:   Tue, 30 Mar 2021 13:32:35 +0200
Message-Id: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
X-Mailer: git-send-email 2.31.0.97.g1424303384
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

kmod 28 supports modules compressed in zstd format so let's add this possibility to kernel.

Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
---
 Makefile     | 7 +++++--
 init/Kconfig | 9 ++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 5160ff8903c1..82f4f4cc2955 100644
--- a/Makefile
+++ b/Makefile
@@ -1156,8 +1156,8 @@ endif # INSTALL_MOD_STRIP
 export mod_strip_cmd
 
 # CONFIG_MODULE_COMPRESS, if defined, will cause module to be compressed
-# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP
-# or CONFIG_MODULE_COMPRESS_XZ.
+# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP,
+# CONFIG_MODULE_COMPRESS_XZ, or CONFIG_MODULE_COMPRESS_ZSTD.
 
 mod_compress_cmd = true
 ifdef CONFIG_MODULE_COMPRESS
@@ -1167,6 +1167,9 @@ ifdef CONFIG_MODULE_COMPRESS
   ifdef CONFIG_MODULE_COMPRESS_XZ
     mod_compress_cmd = $(XZ) --lzma2=dict=2MiB -f
   endif # CONFIG_MODULE_COMPRESS_XZ
+  ifdef CONFIG_MODULE_COMPRESS_ZSTD
+    mod_compress_cmd = $(ZSTD) -T0 --rm -f -q
+  endif # CONFIG_MODULE_COMPRESS_ZSTD
 endif # CONFIG_MODULE_COMPRESS
 export mod_compress_cmd
 
diff --git a/init/Kconfig b/init/Kconfig
index 8c2cfd88f6ef..86a452bc2747 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2250,8 +2250,8 @@ config MODULE_COMPRESS
 	bool "Compress modules on installation"
 	help
 
-	  Compresses kernel modules when 'make modules_install' is run; gzip or
-	  xz depending on "Compression algorithm" below.
+	  Compresses kernel modules when 'make modules_install' is run; gzip,
+	  xz, or zstd depending on "Compression algorithm" below.
 
 	  module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
 
@@ -2273,7 +2273,7 @@ choice
 	  This determines which sort of compression will be used during
 	  'make modules_install'.
 
-	  GZIP (default) and XZ are supported.
+	  GZIP (default), XZ, and ZSTD are supported.
 
 config MODULE_COMPRESS_GZIP
 	bool "GZIP"
@@ -2281,6 +2281,9 @@ config MODULE_COMPRESS_GZIP
 config MODULE_COMPRESS_XZ
 	bool "XZ"
 
+config MODULE_COMPRESS_ZSTD
+	bool "ZSTD"
+
 endchoice
 
 config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
-- 
2.31.0.97.g1424303384

