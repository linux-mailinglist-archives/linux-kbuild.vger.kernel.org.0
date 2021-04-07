Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB8F35715A
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 18:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354083AbhDGQF2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 12:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354077AbhDGQF1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 12:05:27 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1EFC061756;
        Wed,  7 Apr 2021 09:05:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g8so29345185lfv.12;
        Wed, 07 Apr 2021 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I87RuUn4Zy59yuhEKv/5ksaPpxPoJAYCHSUz71kw8Qg=;
        b=Wx4ahZpQ0foI23Lt7eAf8O4mHLjsZdmYqaKQ23E7vsd5JbKgScb35CgTVNxFoLjcyr
         Yz0AtWDoJcqXMp4vPkAuIFw0Jy3Qu/HmY0xxLS6G+hDacinhOxXsfRXfIwtWJ6PSTbzw
         32YOhNWXUCOO1++madsGr9YUUwjTAzhn87RdymzmiDAwO3Ktkh+47GBEHPtu9Jg5rnYl
         ZnoIG+DbWBl2e1GGcAwbDhMV56N8vIT3soPTVsR87ycgpt/7J1xrFuV8UtVrcdALg4OD
         GuvULe7aisndvLG63ymtS+LJwxj8q17gUc51Egs3Ut3N6YgNHkBX7N2TGRue6R0SOxlS
         vIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I87RuUn4Zy59yuhEKv/5ksaPpxPoJAYCHSUz71kw8Qg=;
        b=kMrNy2udcIjtC/6C9budl66cUUia2FJt12gHGVboSdeOWT3EOvO6D3Sy+bYKrmPe7E
         gc1OO6yhHpvCwraq97hmap3dKqvwTfpn0B7TpzY3QuG+BzbrcLm5YYfWtYz8GkKSpo3+
         2yZOG9CoLbYDYcwG4eMwZS1oXpuGX3bAEmpJ65tzLL0JMuqx1vsj5wRlPDhml39P/uI1
         RquuPPMSEyZogt5GknHiiMarb8UjoWFaSiUOY84hoPeNd73tBLWLimIT0KOpOp6+itpS
         Eq23e04LJr9wp7a0kRz3gXzhhgXFHAUEhIDS64UrkYONNm+wlG2Qn9gRmvv+Vq8eLhvI
         oYtA==
X-Gm-Message-State: AOAM531jcTxGSytTzLTezDMVub6NFBSYZZ/rcbjTPfp/v7pYYMny2sgA
        eWOA/rqOq7IGFeCjbF2PETfMt5YrVag=
X-Google-Smtp-Source: ABdhPJzFNKBanKOB4V4zgn+8gcvc3nmOVdmn0EoOLxFXc2vDj0USwZmvFHfi7cy8gtLxXfI3i85RKw==
X-Received: by 2002:ac2:59c4:: with SMTP id x4mr2870169lfn.240.1617811515167;
        Wed, 07 Apr 2021 09:05:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a31a:e13a:eb00:c5cf:27cc:1ef2:859])
        by smtp.gmail.com with ESMTPSA id r4sm2522533lfn.135.2021.04.07.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:05:14 -0700 (PDT)
From:   Piotr Gorski <lucjan.lucjanov@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>
Subject: [PATCH] kbuild: add support for zstd compressed modules
Date:   Wed,  7 Apr 2021 18:05:06 +0200
Message-Id: <20210407160506.221308-1-lucjan.lucjanov@gmail.com>
X-Mailer: git-send-email 2.31.0.97.g1424303384
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

kmod 28 supports modules compressed in zstd format so let's add this possibility to kernel.

V1 -> V2

* Rebuild against linux-kbuild tree

Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
---
 init/Kconfig             | 8 +++++++-
 scripts/Makefile.modinst | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 510f6fcd9b7f..b5744d32c4df 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2242,7 +2242,7 @@ choice
 
 	  Please note that the tool used to load modules needs to support the
 	  corresponding algorithm. module-init-tools MAY support gzip, and kmod
-	  MAY support gzip and xz.
+	  MAY support gzip, xz and zstd.
 
 	  Your build system needs to provide the appropriate compression tool
 	  to compress the modules.
@@ -2267,6 +2267,12 @@ config MODULE_COMPRESS_XZ
 	  Compress modules with XZ. The installed modules are suffixed
 	  with .ko.xz.
 
+config MODULE_COMPRESS_ZSTD
+	bool "ZSTD"
+	help
+	  Compress modules with ZSTD. The installed modules are suffixed
+	  with .ko.zst.
+
 endchoice
 
 config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 191408f7a91a..90d8b2c4304e 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -21,6 +21,7 @@ endif
 suffix-y				:=
 suffix-$(CONFIG_MODULE_COMPRESS_GZIP)	:= .gz
 suffix-$(CONFIG_MODULE_COMPRESS_XZ)	:= .xz
+suffix-$(CONFIG_MODULE_COMPRESS_ZSTD)	:= .zst
 
 modules := $(patsubst $(extmod_prefix)%, $(dst)/%$(suffix-y), $(modules))
 
@@ -95,6 +96,8 @@ quiet_cmd_gzip = GZIP    $@
       cmd_gzip = $(KGZIP) -n -f $<
 quiet_cmd_xz = XZ      $@
       cmd_xz = $(XZ) --lzma2=dict=2MiB -f $<
+quiet_cmd_xz = ZSTD      $@
+      cmd_xz = $(ZSTD) -T0 --rm -f -q $<
 
 $(dst)/%.ko.gz: $(dst)/%.ko FORCE
 	$(call cmd,gzip)
@@ -102,6 +105,9 @@ $(dst)/%.ko.gz: $(dst)/%.ko FORCE
 $(dst)/%.ko.xz: $(dst)/%.ko FORCE
 	$(call cmd,xz)
 
+$(dst)/%.ko.zst: $(dst)/%.ko FORCE
+	$(call cmd,zstd)
+
 PHONY += FORCE
 FORCE:
 
-- 
2.31.0.97.g1424303384

