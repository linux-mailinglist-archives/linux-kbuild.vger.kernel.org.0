Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635ED568704
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Jul 2022 13:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbiGFLoP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Jul 2022 07:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbiGFLoM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jul 2022 07:44:12 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C63F27FD6
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jul 2022 04:44:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t24so25488574lfr.4
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jul 2022 04:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rHSpHOlY7myBgAHSZKFgDw9g1de3IWBqHh0r7R/pirQ=;
        b=mA7nuNZdvT7CPN2iQuIt/bEU9qdmLkMx0CwfhwzSdLgU3jfcloEf897ZgHyT5aRG7+
         nPGP36yJTW0GHcKr8yq4aGQKyF12AiSoQRRzp+sv+EM60GyIp9hOeVUZNIxPEnsmsAIY
         oOYYgwsdponpzI6mZtKImM2dJUXAndJ+MzSaE9/OEzbMYV7Uk8QpdGZtCaO3DusNq3XV
         V4uoHm6W95l0Dk36AZ7OBuOw6rgrIKPVeiHeotmOJ8zVtnRUqDGWI21pmosUTabWKYm2
         TpZwrn2coSbsMp+cJVMfyeE79uvmKNKi+Mbeq2JpYevXskRX1uXXvM9UJAvhvLkVA5sP
         MaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rHSpHOlY7myBgAHSZKFgDw9g1de3IWBqHh0r7R/pirQ=;
        b=P3Osts0qkkpyuWg6rgJfgoSoheBmjxt45p8eiqfRqZw91rJPDkpATxdM8/VWxTQcu4
         ivbBk3u2wE1hVrPgmBK0XR/0PZZNg2IM876UvIpQOsglWoMlZC7db7/fAfeOXmc1eRLr
         XEeJOH+TMgvFW/hF4BbIQbfj/Vj6k2+H4q+VKwvXv8e8LTyxbkWQEu5rMgkL9iYdtL+k
         XTktrWc30K4mMRpHbcHPsDgAeRz+W05fV/MFl9aVE8cUCAR3KP+bU83M+N47j5fWiIdw
         0/7x4cAxltTrrbAUcIvmHroGTsBl9M6wAw+VPqIkUwRbnn1FFbOzw4cu1N7JyIbqYnAS
         vuUg==
X-Gm-Message-State: AJIora+SUGslyCXAlUSYLLdkWQ8OOi498Oi/wZyLyJqMPQmg7EiLItB5
        aarxDD92Y6Jpn6mpuo9HDFR2tClFJtUuCg==
X-Google-Smtp-Source: AGRyM1tviyOitKgPBJbpzIyNFMsRmGD80UR044kxqGDAzuOaYFFiwsE3QHRZAt+uvLTk1ZjIS9YtCQ==
X-Received: by 2002:a05:6512:b09:b0:481:5b19:3ae4 with SMTP id w9-20020a0565120b0900b004815b193ae4mr19994384lfu.293.1657107849487;
        Wed, 06 Jul 2022 04:44:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b0047b0f2d7650sm6232883lfr.271.2022.07.06.04.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 04:44:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2] kbuild: allow validating individual dtb files against schema
Date:   Wed,  6 Jul 2022 14:44:07 +0300
Message-Id: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

While it is possible to validate all generated dtb files against the
schema, it typically results in huge pile of warnings. While working on
a platform it is quite useful to validate just a single file against
schema.

Allow specifying CHECK_DTBS=1 on a make command line to enable
validation while building dtb files. This reuses the infrastructure
existing for `make dtbs_check`, making dtbs_check a shortcut for
`make CHECK_DTBS=1 dt_binding_check dtbs`.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Added dependency to rebuild schema if `make dtbs` was used.

---
 Makefile | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 9aa7de1ca58f..5a9858aa4934 100644
--- a/Makefile
+++ b/Makefile
@@ -1464,14 +1464,18 @@ endif
 
 ifneq ($(dtstree),)
 
-%.dtb: include/config/kernel.release scripts_dtc
+ifneq ($(CHECK_DTBS),)
+DT_TMP_BINDING := dt_binding
+endif
+
+%.dtb: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
-%.dtbo: include/config/kernel.release scripts_dtc
+%.dtbo: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
 PHONY += dtbs dtbs_install dtbs_check
-dtbs: include/config/kernel.release scripts_dtc
+dtbs: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
 ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
@@ -1498,8 +1502,10 @@ ifneq ($(filter dt_binding_check, $(MAKECMDGOALS)),)
 export CHECK_DT_BINDING=y
 endif
 
-PHONY += dt_binding_check
-dt_binding_check: scripts_dtc
+dt_binding_check: dt_binding
+
+PHONY += dt_binding
+dt_binding: scripts_dtc
 	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
 
 # ---------------------------------------------------------------------------
@@ -1774,6 +1780,10 @@ help:
 	@echo  '		3: more obscure warnings, can most likely be ignored'
 	@echo  '		e: warnings are being treated as errors'
 	@echo  '		Multiple levels can be combined with W=12 or W=123'
+	@$(if $(dtstree), \
+		echo '  make CHECK_DTBS=1 [targets] Check all generated dtb files against schema'; \
+		echo '         This can be applied both to "dtbs" and to individual "foo.dtb" targets' ; \
+		)
 	@echo  ''
 	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
 	@echo  'For further info see the ./README file'
-- 
2.35.1

