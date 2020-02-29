Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4703C1743D5
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Feb 2020 01:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgB2Ahi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 19:37:38 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40804 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgB2Ahf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 19:37:35 -0500
Received: by mail-ot1-f65.google.com with SMTP id a36so4316620otb.7;
        Fri, 28 Feb 2020 16:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CQl42sI6/G4yLl+ObzR/HUl9MX01F+RW6KokpYPjBTo=;
        b=Upf2/7ZALQAPxZ0mVoQh2LDtXHy/9bHTFmS4wUaBJEdDy+qE5D90QGb0Ba3PJiFGr4
         zuZMleOMTUZtC8Z2ZkrquSIhEKmHxB2WFrM/FOFbuxFjzNj7Th113zdF5f23thEzk6Xl
         cH4SwyBMG+KNueK0yLUrUt//rJyt12v2mm3IeZeeZU0J/M2A7AwaH0FH37c/YRoncQyP
         BchPaS4cMl56NGHUlH2O8lZN2MyEzpuj8ycgUl3g2PDQ76EFHMogAWOdtFRuX3c30oV1
         BpgSmgD93n85l94Hzb/2DUVhCoxsnK3IRQSczpAeSPA1EWoUqki5EeRv+Gk1YeTCXqkf
         EGXg==
X-Gm-Message-State: APjAAAUZqSEbbkrWZDfkjtgayy0TVrNnSPVTzmRTiIOwZ3PphYnVQuY6
        OtIQLMd6rt6+C3JBFq6l6JnnyLw=
X-Google-Smtp-Source: APXvYqyQ7MI4s/YK5RnOZwQdIn1huoadrYKVYdBfu7/r5YUcJNFn6Bgo+CJOwHykk57mCByJOeDQXQ==
X-Received: by 2002:a9d:61cc:: with SMTP id h12mr4652537otk.154.1582936652744;
        Fri, 28 Feb 2020 16:37:32 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id t23sm3713619oic.28.2020.02.28.16.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 16:37:32 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2 1/2] kbuild: Always validate DT binding examples 
Date:   Fri, 28 Feb 2020 18:37:30 -0600
Message-Id: <20200229003731.2728-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Most folks only run dt_binding_check on the single schema they care about
by setting DT_SCHEMA_FILES. That means example is only checked against
that one schema which is not always sufficient.

Let's address this by splitting processed-schema.yaml into 2 files: one
that's always all schemas for the examples and one that's just the schema
in DT_SCHEMA_FILES for dtbs.

Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Masahiro, given you pretty much re-wrote this, I added you as 
Co-developed-by.

Based on next/master

 Documentation/devicetree/bindings/.gitignore |  2 +-
 Documentation/devicetree/bindings/Makefile   | 22 +++++++++++++-------
 scripts/Makefile.lib                         |  3 ++-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/.gitignore b/Documentation/devicetree/bindings/.gitignore
index ef82fcfcccab..57afa1533a5f 100644
--- a/Documentation/devicetree/bindings/.gitignore
+++ b/Documentation/devicetree/bindings/.gitignore
@@ -1,2 +1,2 @@
 *.example.dts
-processed-schema.yaml
+processed-schema*.yaml
diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 646cb3525373..7c40d5ba1b51 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -2,7 +2,6 @@
 DT_DOC_CHECKER ?= dt-doc-validate
 DT_EXTRACT_EX ?= dt-extract-example
 DT_MK_SCHEMA ?= dt-mk-schema
-DT_MK_SCHEMA_FLAGS := $(if $(DT_SCHEMA_FILES), -u)
 
 quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
       cmd_chk_binding = $(DT_DOC_CHECKER) -u $(srctree)/$(src) $< ; \
@@ -11,26 +10,33 @@ quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
 $(obj)/%.example.dts: $(src)/%.yaml FORCE
 	$(call if_changed,chk_binding)
 
-DT_TMP_SCHEMA := processed-schema.yaml
+# Use full schemas when checking %.example.dts
+DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
 
 quiet_cmd_mk_schema = SCHEMA  $@
       cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@ $(real-prereqs)
 
-DT_DOCS = $(shell \
+DT_DOCS = $(addprefix $(src)/, \
+	$(shell \
 	cd $(srctree)/$(src) && \
 	find * \( -name '*.yaml' ! \
-		-name $(DT_TMP_SCHEMA) ! \
+		-name 'processed-schema*' ! \
 		-name '*.example.dt.yaml' \) \
-	)
+	))
 
-DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
+DT_SCHEMA_FILES ?= $(DT_DOCS)
 
 ifeq ($(CHECK_DTBS),)
 extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
 extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
+extra-y += processed-schema-examples.yaml
+
+$(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
+	$(call if_changed,mk_schema)
 endif
 
-$(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
+$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
+$(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) FORCE
 	$(call if_changed,mk_schema)
 
-extra-y += $(DT_TMP_SCHEMA)
+extra-y += processed-schema.yaml
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f5ff506e4a24..b12dd5ba4896 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -307,7 +307,8 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
-DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
+# DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
+DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
 
 quiet_cmd_dtb_check =	CHECK   $@
       cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
-- 
2.20.1

