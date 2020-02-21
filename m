Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3BA1689F2
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 23:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgBUW37 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 17:29:59 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36333 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgBUW36 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 17:29:58 -0500
Received: by mail-ot1-f66.google.com with SMTP id j20so3510637otq.3;
        Fri, 21 Feb 2020 14:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PNembwKy4yL6hKi9IOY8ctTJoI3fPAiEbEA2zGZc8Y0=;
        b=bhawgtgFrjOmYmIfDngLps5zF3jLFkm/iHsO88VvFx8S7BG1agOt/bRAGChSo+OtzK
         YmomyFtpJVkhCAzhJVcM2VcqWcrBvqe7guC+0zRCXJOJZhjjL/rc/L6VHstlq+i+u7aR
         WfV0frIzbOge9ceAMOpHeWQjSieUZlM7pQW72FHgIHI+BjxTrcItLWIvm5Ob9Gn6RD7a
         l/aEMv2zZJNhtecr9Ee/0cC/Fo34tFEDpmnrQjUjQ7aK6eV+svkJdL1aXpSHp7q1g784
         N2UPSOrCYCkTVKHieidzUyDgCd97+Vxml0uU9bGkv+RUMPbQRT5GwLVqctNeP0sy0aVR
         85lg==
X-Gm-Message-State: APjAAAWwgV1wVQjbYAuAJQYGksyNjB8tqUx4Cpxn/IbXnWocVHqffHPL
        d5UvGLykH7TPH8Lbq8yonQr34sU=
X-Google-Smtp-Source: APXvYqwgXYFrAEEGRZrfdPsefj3E2XilMcVH4QYxN831M6Av8XX2BTDNvcj+mZRc64f0Mn50fCYDPA==
X-Received: by 2002:a9d:5e9:: with SMTP id 96mr30464553otd.307.1582324196717;
        Fri, 21 Feb 2020 14:29:56 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id m19sm1515706otn.47.2020.02.21.14.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 14:29:56 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 1/2] kbuild: Always validate DT binding examples against all schemas
Date:   Fri, 21 Feb 2020 16:29:54 -0600
Message-Id: <20200221222955.21038-1-robh@kernel.org>
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

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 20 +++++++++++---------
 scripts/Makefile.lib                       | 12 ++++++++----
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 646cb3525373..16498eb19f5f 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -11,26 +11,28 @@ quiet_cmd_chk_binding = CHKDT   $(patsubst $(srctree)/%,%,$<)
 $(obj)/%.example.dts: $(src)/%.yaml FORCE
 	$(call if_changed,chk_binding)
 
-DT_TMP_SCHEMA := processed-schema.yaml
-
 quiet_cmd_mk_schema = SCHEMA  $@
-      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@ $(real-prereqs)
+      cmd_mk_schema = $(DT_MK_SCHEMA) $(2) -o $@ $(real-prereqs)
 
-DT_DOCS = $(shell \
+DT_DOCS = $(addprefix $(src)/, \
+	$(shell \
 	cd $(srctree)/$(src) && \
 	find * \( -name '*.yaml' ! \
-		-name $(DT_TMP_SCHEMA) ! \
+		-name 'processed-schema-*' ! \
 		-name '*.example.dt.yaml' \) \
-	)
+	))
 
-DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
+DT_SCHEMA_FILES ?= $(DT_DOCS)
 
 ifeq ($(CHECK_DTBS),)
 extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
 extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
 endif
 
-$(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
+$(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
 	$(call if_changed,mk_schema)
 
-extra-y += $(DT_TMP_SCHEMA)
+$(obj)/processed-schema-dtbs.yaml: $(DT_SCHEMA_FILES) FORCE
+	$(call if_changed,mk_schema, $(DT_MK_SCHEMA_FLAGS))
+
+extra-y += processed-schema-examples.yaml processed-schema-dtbs.yaml
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index bae62549e3d2..78fa1a3d983a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -297,17 +297,21 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
-DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
+DT_DTBS_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema-dtbs.yaml
+DT_EXAMPLES_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema-examples.yaml
 
 quiet_cmd_dtb_check =	CHECK   $@
-      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ ;
+      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(2) $@ ;
 
 define rule_dtc_dt_yaml
 	$(call cmd_and_fixdep,dtc,yaml)
-	$(call cmd,dtb_check)
+	$(call cmd,dtb_check,$(word 2, $(real-prereqs)))
 endef
 
-$(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
+$(obj)/%.example.dt.yaml: $(src)/%.example.dts $(DT_EXAMPLES_SCHEMA) $(DTC) FORCE
+	$(call if_changed_rule,dtc_dt_yaml)
+
+$(obj)/%.dt.yaml: $(src)/%.dts $(DT_DTBS_SCHEMA) $(DTC) FORCE
 	$(call if_changed_rule,dtc_dt_yaml)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
-- 
2.20.1

