Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 302E325A55
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2019 00:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfEUWeX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 May 2019 18:34:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42614 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfEUWeX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 May 2019 18:34:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id i2so273054otr.9;
        Tue, 21 May 2019 15:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dwXcIawwOJbg33tAciXd9w9L8qNu8uCxICVV/lS1QUA=;
        b=t0Lcf3liHv9ae8DXNAJ+MTrJgXlCiOw35oSFAGEReMrN9t9/zd/n2OuxzotS5kpygK
         wgfTFf7gN4CEWJyK053fq7iHeNPB91mk+cm5vtzX4Jk53ZTW6GABcpxL43Q8VLAMnEFR
         3uRRgIj84MVHGu8gLVBH0Hifa8fMfWUFcT831/FBucOlJapvC01ZG8W+V2GRENLtOHv4
         CwZpziVASfNc3/vLntmPsfLVduFw/XRhH8AbHW9Nsix8+WBh7cDpEM6tEf57Y8vkPTbF
         y7YujWQFwq7N3CVHDUaiznO+RkxFk+MY1kKxq/AS0QxFZGsCQutOzVQnYc3hqvmvDbWo
         bjkA==
X-Gm-Message-State: APjAAAUsb5jYozkvNPnWuk++IvJdAr9nFikJecJdfOIYAOxTlHnXuxAO
        jBrrilgM/DgbTeWFMXS8TMsdUk4=
X-Google-Smtp-Source: APXvYqwkfMhDNn37GikrZ0INjRQJDy89xtYIPA3fNsJFoltHFKIiwE/kfRTckATxDJL0yTh8zJZBMg==
X-Received: by 2002:a05:6830:1389:: with SMTP id d9mr571115otq.329.1558478062679;
        Tue, 21 May 2019 15:34:22 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id d70sm8764783oih.18.2019.05.21.15.34.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 21 May 2019 15:34:22 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] dt-bindings: Pass binding directory to validation tools
Date:   Tue, 21 May 2019 17:34:21 -0500
Message-Id: <20190521223421.10514-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In order to have $ref's to schema files within the kernel, we need to
pass the base path of bindings to the schema validation tools.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: devicetree@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 2 +-
 scripts/Makefile.lib                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 63b139f9ae28..8a2774b5834b 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -5,7 +5,7 @@ DT_MK_SCHEMA ?= dt-mk-schema
 DT_MK_SCHEMA_FLAGS := $(if $(DT_SCHEMA_FILES), -u)
 
 quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
-      cmd_chk_binding = $(DT_DOC_CHECKER) $< ; \
+      cmd_chk_binding = $(DT_DOC_CHECKER) -u $(srctree)/$(src) $< ; \
                         $(DT_EXTRACT_EX) $< > $@
 
 $(obj)/%.example.dts: $(src)/%.yaml FORCE
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1b412d4394ae..f1f38c8cdc74 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -298,7 +298,7 @@ DT_BINDING_DIR := Documentation/devicetree/bindings
 DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
 
 quiet_cmd_dtb_check =	CHECK   $@
-      cmd_dtb_check =	$(DT_CHECKER) -p $(DT_TMP_SCHEMA) $@ ;
+      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ ;
 
 define rule_dtc_dt_yaml
 	$(call cmd_and_fixdep,dtc,yaml)
-- 
2.20.1

