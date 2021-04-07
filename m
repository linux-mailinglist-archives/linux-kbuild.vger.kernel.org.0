Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2844E3571D0
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 18:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236407AbhDGQJz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 12:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354331AbhDGQJr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 12:09:47 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAE2C06175F;
        Wed,  7 Apr 2021 09:09:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 12so29253550lfq.13;
        Wed, 07 Apr 2021 09:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PBKwdDssUFMdLDhmdEFSLKCWRTIQLOXC5T+FtNV34xU=;
        b=gvzKvCTogQz/PbJTtHwP6IjkOS1Knx6SaycQ0XxpYvhWnPj3krpXT6gMnAf8zpdpXh
         rJ4f0KETYqQuiXUVCvG6aUDlRpZcOLU522/Bn+jw53YI2wbBDiamRAesBkXO/+As22zt
         EJmGaAu0AfrlAxpLfsWFaOP+NyY+e/7OAxVTXDNZNdI+sPQ4xNGG/gkoIZ0Qo+wOpARK
         l0HNgy2ygvVuvYJTDsDjSIPHiZfqsU/wx+7nZFd7pe6fNP9K5yXT017pPFaHor728r7q
         /dVR6ECUgbRZpv5Ul1MkKz9q8Ve/Du21U31EyN8TkJDNeie3ve1oYhHfZPgkitnI2DGO
         P4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PBKwdDssUFMdLDhmdEFSLKCWRTIQLOXC5T+FtNV34xU=;
        b=ns2QAoGdTbRPswRGo7kvNSZ3LfdDuZ3r5GXjne8JFw6idHExGUg+plczxvALco80EW
         9p48FjyC5vqBYR1jb8urrzXfOVCyD2tdtGtYFR371axhgQB9owu7tMq+66or/CWOfDkb
         BNGtsWEQ3G8qnAJC+nSMODfvnYwXUsOHSSad4kIQPRdQz6xi4E3r7J2208j1KTiln+Nn
         1I6gRbBIh6BHpXsW0M5mY4DYzahDPW9dfxfh4FFtlIe+Xku695oBh3do/kT1aP21ErKN
         iLccJrtXS48Zc9II/9PGvHHcMnfFJtZfAg89iRSPazkrcXW/6MlgDCp5AJLxxZ9qzhHw
         uGWA==
X-Gm-Message-State: AOAM5334zymBWw8tZF384PieRllpZ6Q5GJ6uI/uIUkmElEmYkuB97lli
        Bmy+6ShrXTG4gH3Ym3vavKaylxLG5VA=
X-Google-Smtp-Source: ABdhPJzrvoUaSwPnhap/82mxyyZOZX6irWHiHso16m7PccUmkOg//P/azP5JgJGAs3T4ni5PFwvXBw==
X-Received: by 2002:a19:50d:: with SMTP id 13mr2781657lff.443.1617811771110;
        Wed, 07 Apr 2021 09:09:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a31a:e13a:eb00:c5cf:27cc:1ef2:859])
        by smtp.gmail.com with ESMTPSA id c26sm742467lff.302.2021.04.07.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:09:30 -0700 (PDT)
From:   Piotr Gorski <lucjan.lucjanov@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>
Subject: [PATCH v3] kbuild: add support for zstd compressed modules
Date:   Wed,  7 Apr 2021 18:09:27 +0200
Message-Id: <20210407160927.222092-1-lucjan.lucjanov@gmail.com>
X-Mailer: git-send-email 2.31.0.97.g1424303384
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

kmod 28 supports modules compressed in zstd format so let's add this possibility to kernel.

V2 -> V3

* Fix a typo

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
index 191408f7a91a..f9fa2a3808b2 100644
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
+quiet_cmd_zstd = ZSTD      $@
+      cmd_zstd = $(ZSTD) -T0 --rm -f -q $<
 
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

