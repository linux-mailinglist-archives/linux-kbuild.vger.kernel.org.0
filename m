Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A4037FA75
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 May 2021 17:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbhEMPTN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 May 2021 11:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234825AbhEMPTN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 May 2021 11:19:13 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF494C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 13 May 2021 08:18:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t11so38946572lfl.11
        for <linux-kbuild@vger.kernel.org>; Thu, 13 May 2021 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XlvwCCIdITRchgnLI4aBvUaly8ZCfQga7tYhkkseWUs=;
        b=W6oOwKrsxJUkXrG9nV7ohcodGea4LlJRdCLxV8Pl+2vYrd0Edmy3eDF4YgVQDfcoHX
         MROKB7ePqNAnQahgvrGnAK35fEHj3eVfd2lZ3ONkJ48kcnRZiUdP97ucq9V9S/PMjgYw
         z3+kZZBnGHfzEc0PrwPd3miz75Vx9xMRVfIyg/eyWnlduCRVoSCrg2J+IfwwiJ71xk5P
         kz7fIeN5B9/D6Vs3mnEO58Csud8OkBv33B70AHJzQ3mM8y6nbqBZKmMc1jEMBM+L+wO5
         15dXvwOlocINMp/zB85SUuc5RLvt5FMDBcCzlEOG/H7jTCsvejuyNPpKqvuz6ufLyjwF
         8dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XlvwCCIdITRchgnLI4aBvUaly8ZCfQga7tYhkkseWUs=;
        b=NobwyU6KnzznNUMsIuZtTJ6tT0W0waw+ZTfHtH0GkKL0KTrTDTc/Eh9dNFIvWDwJTP
         hhLj9q/12iFXycfBpSuD6/1n7mbvDk57Ow29KRqAI1Rt4OmPic7zSCAtzz8KR0u0HquY
         DsbAY7tvumGMSAmbLJIwDJYuKTRkiBK8z/7gEmoGAoeFh54Zg1W8RheZvAqZ6j5MAYyZ
         vmCAC6vecNWwx0eQo7+CNzPY9wx9f9RzlYIIXcMkJzM5OM2nT7rm1Y5Jn1+Z8+1WwQ8C
         Lq7GXxU8q8l9gdcNa1U/Cu0CbkfPTBwYQyYbwKa4iQkIbIBlyGxPuSipY/9MyerhPubC
         st+g==
X-Gm-Message-State: AOAM530rpOooT1SnggsZqYia+1bW6YwhrmUj3DQVWFqauQUSBiBp92we
        iMu7WTbt6mYbsroJEfdiG9xWoA==
X-Google-Smtp-Source: ABdhPJync3ne4bHMwBvY5lVPmKQnE//1dV687R6a6gpoj17rBF6uorI5DgdLtOl2FbmbTksOk/jUeg==
X-Received: by 2002:a05:6512:2287:: with SMTP id f7mr28282266lfu.475.1620919081440;
        Thu, 13 May 2021 08:18:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y19sm485491ljj.125.2021.05.13.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 08:18:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] kbuild: allow checking single device tree file
Date:   Thu, 13 May 2021 18:18:00 +0300
Message-Id: <20210513151800.1059435-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add support for testing single device tree file by running
'make tree.dt.yaml', e.g. 'make ARCH=arm64 qcom/qrb5165-rb5.dt.yaml'.
This looks useful for checking idividual changes to dts files.

Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 53d09c414635..b36a3d48eb68 100644
--- a/Makefile
+++ b/Makefile
@@ -1383,6 +1383,10 @@ ifneq ($(dtstree),)
 %.dtbo: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
+%.dt.yaml: include/config/kernel.release scripts_dtc
+	$(Q)$(MAKE) $(build)=Documentation/devicetree/bindings Documentation/devicetree/bindings/processed-schema.json
+	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ CHECK_DTBS=y
+
 PHONY += dtbs dtbs_install dtbs_check
 dtbs: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
-- 
2.30.2

