Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0EEB557E05
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jun 2022 16:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbiFWOoC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jun 2022 10:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbiFWOoC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jun 2022 10:44:02 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4AB377D6
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Jun 2022 07:44:00 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g4so21362906lfv.9
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Jun 2022 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGJIrQZ1dGSDsKYzwTH8HIyaaJizqDdsQhaO3cSd77A=;
        b=VyZDga2b/+FX3G3SKJuI1An91g3UxE0TwKAwvFaK/fL0Fqvkz2FEMxknoUnozT8+dB
         3kTZp5StOUpoFilAHKDb+M5haITHntU/I+BPELbwz/Nw9Bdbw7ZmuKi0JrdLWRTlzRrr
         4gUDayGFMJ1tSOd5omRo8sPPTSdz/s/8oCXCNfI+/lTH9Wj3kYp1smHCHOv8KWSPsCoH
         WhFZEQPAsHtzB1AztC72raIhyUlh2N3esPKrKAaH3YQidQAkKxtxryJWi0M8bot6A6G7
         yRfDzvR2ubk0s3WPEadN6gV6KHvH0YkK2n01SgW32PphAhc4Bul61AAc8Q8h9GGlzZjo
         cjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGJIrQZ1dGSDsKYzwTH8HIyaaJizqDdsQhaO3cSd77A=;
        b=OH/NLZ2IfxJE9EG4z8s0pqEhrE0GfiY2Vwu9Hkv/GPWR6GCgQEn8FcrPnpHkKE8vLw
         R7pmdE4rBWcwj/B9JY4/+udc6Eo1+L3iTWUGYp4XKijffNBURY4Yam1cD1Xldghm13uA
         82358VtFqyy9MsCwiwMOt0KiYS4vagWDwoxWqELkZdSbjjI5ytgHWXu6XYnsW4T9lswG
         NhMIcs1ya+g5zBjsNbGEyvn2f7av3OL/L83VCghOWp8YSnNElvlI41vXx6QepdS8SiS0
         v4fEXKaH+4jTMwAtoyEvqLgJ2WIGkKizj1qiMOngzPAMQRpTkb4kckChRWQu9ly65DXz
         qHhQ==
X-Gm-Message-State: AJIora/DCugo6Tda8rGZ5szaqxFqCKXKd3+V5P5Udmw23/7hkndQO/uH
        Xp+CNvmHeoKmL/z7gMU4mRsM5g==
X-Google-Smtp-Source: AGRyM1vu4XsRKStXmVemK3XSOHQdmb7PE2OQGpbcamLonbZcjvVe2ZA5WEVQUTLq0JFh+Vw55ulpZg==
X-Received: by 2002:a05:6512:318a:b0:47f:9fdc:fdb with SMTP id i10-20020a056512318a00b0047f9fdc0fdbmr3363003lfe.584.1655995438923;
        Thu, 23 Jun 2022 07:43:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b0047f6c48a603sm1829647lfr.202.2022.06.23.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 07:43:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Tom Rini <trini@konsulko.com>, linux-kbuild@vger.kernel.org
Subject: [PATCH v3] kbuild: Enable DT schema checks for %.dtb targets
Date:   Thu, 23 Jun 2022 17:43:57 +0300
Message-Id: <20220623144357.297252-1-dmitry.baryshkov@linaro.org>
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

It is possible to build a single dtb, but not with DT schema validation
enabled. Enable the schema validation to run for %.dtb and %.dtbo
targets. Anyone building a dtb for a specific platform *should* pay
attention to schema warnings.

This could be supported with a separate %.dt.yaml target instead.
However, the .dt.yaml format is considered an intermediate format and
could possibly go away at some point if schema checking is integrated
into dtc. Also, the plan is to enable the schema checks by default once
platforms are free of warnings, and this is a move in that direction.

This patch differs from the previous one ([1]) in the fact that it
requires specifying VALIDATE_DT=1 to run the checks while doing the
build. Thus default build procedures would not obtain additional build
dependency, while maintainers can still build a single DTB file an get
only corresponding warnings.

[1] https://lore.kernel.org/all/20210913145146.766080-1-robh@kernel.org/

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Co-developed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Makefile | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c43d825a3c4c..0942922384c4 100644
--- a/Makefile
+++ b/Makefile
@@ -1365,11 +1365,17 @@ endif
 
 ifneq ($(dtstree),)
 
-%.dtb: include/config/kernel.release scripts_dtc
-	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
+ifneq ($(VALIDATE_DT),)
+DT_YAML = $(dtstree)/$*.dt.yaml
+DT_CHECK = dt_binding_check
+export CHECK_DTBS=y
+endif
 
-%.dtbo: include/config/kernel.release scripts_dtc
-	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
+%.dtb: include/config/kernel.release scripts_dtc $(DT_CHECK)
+	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(DT_YAML)
+
+%.dtbo: include/config/kernel.release scripts_dtc $(DT_CHECK)
+	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(DT_YAML)
 
 PHONY += dtbs dtbs_install dtbs_check
 dtbs: include/config/kernel.release scripts_dtc
@@ -1654,6 +1660,10 @@ help:
 	@echo  '		3: more obscure warnings, can most likely be ignored'
 	@echo  '		e: warnings are being treated as errors'
 	@echo  '		Multiple levels can be combined with W=12 or W=123'
+	@$(if $(dtstree), \
+		echo '  make VALIDATE_DT=y [targets] Validate all DT processsed during the build'; \
+		echo '         This can be applied both to "dtbs" and to individual "foo.dtb" targets' ; \
+		)
 	@echo  ''
 	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
 	@echo  'For further info see the ./README file'
-- 
2.35.1

