Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11021568679
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Jul 2022 13:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbiGFLLM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Jul 2022 07:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbiGFLLI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jul 2022 07:11:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1F227CE9
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jul 2022 04:11:05 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id j23so1302860lji.13
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jul 2022 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DLPkajuMe0XL9xFvAcDgwaTqwHl05fLR3UIhayqJJEo=;
        b=tA2+mKvEvD3urkdfDJ8B1jO6o6sBdgBUX604+M3abof8COmDMY/nkSOX11z4kBXU2u
         3zrDRrRVegSpgMZWuXSCcD0J9ctDjz2gpHQRY0KoZAmg+hUTXvtt10m+L988dt9jZAQK
         Qaqrby9jaAY5+Lx6LfZIZvKx6krK7DPtIw9KqL67FF+i3ipr2OiODfoJPlo3UWdB3cgH
         fV3k0rmprFph4AUUlrs8bn5Mc7qb8bTqbUGLzs3nwX8tZ0wg/zxKHyL66JE/XQYLjlJ4
         lgYGuio2HZE4Kfx7MmI8PimtXOo8cvd3SVq9sVa4rMz8JRzItyr9vx4mq1kEF+wKQlJA
         20/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DLPkajuMe0XL9xFvAcDgwaTqwHl05fLR3UIhayqJJEo=;
        b=AYt4k9btNVMf7lWevF20KYFxUbVl36lb8ZOodXZuUWpHRY/1Q9PTPNjKvK9hEKnndF
         3uTikEdvoXcfQkeEY77zWhNUmFGFtoOM3RgpQxUFW/ODGfPZbUIpTzYrSw/5z84fktmg
         UlwDCgLcK3ugxIcZr0NcKegKjhWbgWGGcw4hKUVlDgmnA1yK3VyieuoLNyf5j+rc3CX6
         xI0ypr9OFsseHwS0er14LuA2XqcTWn8jDqd2m7gHsxrqdWW5SK5Dw95oXir2MFwdKWdq
         ITNH/Lq3muzg4ZUhd2BWdkOrsWhO1NG/ZeWPEK0BBQoboC9ovl17Wro+iaGJRLIYZiKZ
         OCjQ==
X-Gm-Message-State: AJIora9mUkz17OHFRhII9Tmcu0Gb18Ft6xDs/o3/KmRUNCe50LK6jKFi
        LfFvZ8iEIY3aS1k08OBh9ARUyQ==
X-Google-Smtp-Source: AGRyM1sFoRAMmlchybuRq1n1aaOOHMNW09tIE6d2Vo+I7ROSLMIyMiNltw2qKdKflFAGl5QvGb1L7Q==
X-Received: by 2002:a2e:9096:0:b0:25b:c51a:2c14 with SMTP id l22-20020a2e9096000000b0025bc51a2c14mr23787258ljg.209.1657105863714;
        Wed, 06 Jul 2022 04:11:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v14-20020a2ea44e000000b0025a6dbeababsm6166578ljn.111.2022.07.06.04.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 04:11:03 -0700 (PDT)
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
Subject: [PATCH] kbuild: allow validating individual dtb files against schema
Date:   Wed,  6 Jul 2022 14:11:02 +0300
Message-Id: <20220706111102.1493812-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
 Makefile | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9aa7de1ca58f..f28507d2ee03 100644
--- a/Makefile
+++ b/Makefile
@@ -1464,10 +1464,14 @@ endif
 
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

