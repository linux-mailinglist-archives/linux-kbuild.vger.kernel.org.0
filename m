Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1933A33818F
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 00:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhCKXhG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 18:37:06 -0500
Received: from mail-io1-f42.google.com ([209.85.166.42]:35213 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhCKXgr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 18:36:47 -0500
Received: by mail-io1-f42.google.com with SMTP id g27so23852542iox.2;
        Thu, 11 Mar 2021 15:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TEluSVU381Ra21RcLCeHjZXwMsuJenQrl8kmmWg+LmQ=;
        b=sSMZVSd7afeAxF56YtJIfZopwXw7mWE/1w4oUwe5hwqkrnVAh0vfOhrBVoJCuOll8F
         ueKU7wfgxpCWxKHME2eHIsdu8X/gJS5jHU/nJ1ee9NCKVl5mOBsU1KtdWu7VZ5AgCW57
         dAGFChhLDYUXyVXmujeHDRgvhBE8ShDd/Y0e1MeQAmgFx5B2Nh04JOj2+acEkqpNpJap
         92CkzA2QBuH6LXWPglw5noQMtuBz1G+REmc8F0aYL+jI6MgGQK7FYiJWAv+hdDUqO+zU
         T3xvdcnMR0cAamGx9XLfcyue0IYKEYuE5s6RVIwR7v9C028JgsErzuZTIwRf39PESjk8
         FEew==
X-Gm-Message-State: AOAM530jat5R6rtQzqZxBNeaDx0QYUrKfC2JgjnS95kjBqKh1YGvWjmr
        AlIyrE2amLZRUwQJB+fYYL3FuT6rzA==
X-Google-Smtp-Source: ABdhPJzasXx8vKNyWMagUD52OxJAx/dM4ycm90OSE7oYTr57NDHJc3J9OFsX+/v1Olh2uy99iXqUGg==
X-Received: by 2002:a5d:8416:: with SMTP id i22mr7909377ion.32.1615505806554;
        Thu, 11 Mar 2021 15:36:46 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id y9sm1901016ill.15.2021.03.11.15.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:36:45 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/2] kbuild: Enable DT undocumented compatible checks
Date:   Thu, 11 Mar 2021 16:36:40 -0700
Message-Id: <20210311233640.1581526-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311233640.1581526-1-robh@kernel.org>
References: <20210311233640.1581526-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

dt-validate has an option to warn on any compatible strings which don't
match any schema. The option has recently been improved to fix false
positives, so let's enable the option. This is useful for tracking
compatibles which are undocumented or not yet converted to DT schema.
Previously, the only check of undocumented compatible strings has been
an imperfect checkpatch.pl check.

The option is enabled by default for 'dtbs_check'. This will add more
warnings, but some platforms are down to only a handful of these
warnings (good job!).

There's about 100 cases in the binding examples, so the option is
disabled until these are fixed. In the meantime, they can be checked
with:

make DT_CHECKER_FLAGS=-m dt_binding_check

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 3 +++
 scripts/Makefile.lib                       | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 81f0b3294c64..bc24ee316726 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -55,6 +55,9 @@ override DTC_FLAGS := \
 	-Wno-graph_child_address \
 	-Wno-interrupt_provider
 
+# Disable undocumented compatible checks until warning free
+override DT_CHECKER_FLAGS ?=
+
 $(obj)/processed-schema-examples.json: $(DT_DOCS) $(src)/.yamllint check_dtschema_version FORCE
 	$(call if_changed_rule,chkdt)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index eee59184de64..f11fac1a8e9b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -339,12 +339,13 @@ $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
 DT_CHECKER ?= dt-validate
+DT_CHECKER_FLAGS ?= -m
 DT_BINDING_DIR := Documentation/devicetree/bindings
 # DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
 DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
 
 quiet_cmd_dtb_check =	CHECK   $@
-      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
+      cmd_dtb_check =	$(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
 
 define rule_dtc
 	$(call cmd_and_fixdep,dtc)
-- 
2.27.0

