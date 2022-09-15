Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66E95B9A1D
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Sep 2022 13:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiIOLyv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Sep 2022 07:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiIOLyb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Sep 2022 07:54:31 -0400
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06B629813
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Sep 2022 04:49:45 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id z25so29963750lfr.2
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Sep 2022 04:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hYNAFtqe5hNo2vZCSjGyszLI8Xg/AvBRZN22dHTA08E=;
        b=s8O8WLAemWyWlzO6q2cNBeYpwcSQVUCFI0RpdtknLCQBeZ1/hXEJ08CktNHafykAbU
         Sg8+kIg7VVZe+o3ffCD2tnzRNuDr4YHb2UIg0h1/L8d/mgRmG4W9ofNjW164V5uTPz69
         8qqBSywylIpBeH/RGRuGPgaHnczJjv1ESy4ML3YI80OYHDCq1/kGQcfrE3a96SoYO44u
         yytpJiw06CC0r7EEGxyPRJTpFEOOMwIqGu5ormkpmemJOD+Wu9dWlcJnJ2g1gb15hBAg
         F4uHY3umGemu1gFukv30ywot7YMU/dvJcYrPbCl34Htcjw3kd3u/4V4vQCZeyAZR2BOp
         CzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hYNAFtqe5hNo2vZCSjGyszLI8Xg/AvBRZN22dHTA08E=;
        b=mMZGH9OL7vjrvwIjARUUUvmAZElLkmehCtB6DXV1NazV3jKZULB8YcUhdlENq6dufc
         okqwN0jjHsdpuEPknS9Qm3O+Y6KvkHhASf51ChboyzLx3NR6fu1O2HCpr21WEzTd9Gg6
         bq3MLOC//vCGOXo6k3fanRTBbgKsc+2idy4CCcimVQLhBAs5/gRc/2ws7o0WfTFhQ/gq
         8kZ5mvaVOz3qZuS7jUiaaMEktTSVl//XShSwU6phGsjVEJPEiE27EJFIIZN059yRSve5
         Sy++yOaImpK5ho3c0OSSQYuMCr9p2tgB+4kiLbOPzHObQzrmKuM+Ym8TwrMwqS5KLPmj
         DN+A==
X-Gm-Message-State: ACgBeo3dAq4vTGZVvGBLPQDJ767FuuZGmJ+YqzwiIEjYEbGcWq4YBD0q
        +jfAAJnSYc3IaZ3hkanJMi+Lbg==
X-Google-Smtp-Source: AA6agR56kjlSwvsDsQxYoaBLdftGaBheo9+WiD6ka7SqKxHru5grFfeuV8dwE5jhGcoLwOVxXGeh8A==
X-Received: by 2002:a05:6512:3faa:b0:48a:f17a:579e with SMTP id x42-20020a0565123faa00b0048af17a579emr14400937lfa.30.1663242264294;
        Thu, 15 Sep 2022 04:44:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x25-20020a056512131900b0049ebc44994fsm442281lfu.128.2022.09.15.04.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 04:44:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] kbuild: take into account DT_SCHEMA_FILES changes while checking dtbs
Date:   Thu, 15 Sep 2022 14:44:22 +0300
Message-Id: <20220915114422.79378-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is useful to be able to recheck dtbs files against a limited set of
DT schema files. This can be accomplished by using differnt
DT_SCHEMA_FILES argument values while rerunning make dtbs_check. However
for some reason if_changed_rule doesn't pick up the rule_dtc changes
(and doesn't retrigger the build).

Fix this by changing if_changed_rule to if_changed_dep and squashing DTC
and dt-validate into a single new command. Then if_changed_dep triggers
on DT_SCHEMA_FILES changes and reruns the build/check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
 - Fixed the quiet_cmd_dtb to fit into the 7 chars limit

---
 scripts/Makefile.lib | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3fb6a99e78c4..cec0560f6ac6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -371,17 +371,15 @@ DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)
 DT_BINDING_DIR := Documentation/devicetree/bindings
 DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
 
-quiet_cmd_dtb_check =	CHECK   $@
-      cmd_dtb_check =	$(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
+quiet_cmd_dtb =	DTC_CHK $@
+      cmd_dtb =	$(cmd_dtc) ; $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
+else
+quiet_cmd_dtb = $(quiet_cmd_dtc)
+      cmd_dtb = $(cmd_dtc)
 endif
 
-define rule_dtc
-	$(call cmd_and_fixdep,dtc)
-	$(call cmd,dtb_check)
-endef
-
 $(obj)/%.dtb: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_rule,dtc)
+	$(call if_changed_dep,dtb)
 
 $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
-- 
2.35.1

