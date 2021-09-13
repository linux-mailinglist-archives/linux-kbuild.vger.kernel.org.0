Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637B440969F
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 16:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346974AbhIMO4b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 10:56:31 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:42637 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346634AbhIMOxI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 10:53:08 -0400
Received: by mail-ot1-f45.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so13629175otk.9;
        Mon, 13 Sep 2021 07:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2k8H413Cyw4gFlMV7mUeANkoOjizWyGiq1vrf4EX2kc=;
        b=NgTDjkauVRbbCHfj07cScPyHzBsaxb8WMKI6Zb96P9pqGPguIUxtqbO6RUcR+8muGQ
         gbhvcnOlAMRAmZ5A0kT5JzpXQHnnNnWibbnQyt02++Al5Wa1SQZUseuQMdxAeh+4guwh
         RDUAozCadtjo+sAtjyQFDqXEgOI2eMTPofu6OvfACr70K0KHYoXFI7xLG+RsYSWAzQjq
         k/Sg4fw14zFK9hhxkMrKICG8mS5lOxptq45uRtg8WqlY1hJoV5I8R8EsYoMi1yqzeg5s
         pTB5Wn3PagzNyFVR5yn8llVmnrkqkVkLHwN1pIuhJRK57Yyv4hGWViXB0PN0p1pBQ4/U
         LNhQ==
X-Gm-Message-State: AOAM5307TgSFac2aKIBqnDtHFANJiJLt+mM5ywajdERCQa6Lct4G2FLl
        aepCAh4NEXgdSZsaRBEA/dmIXG0cYg==
X-Google-Smtp-Source: ABdhPJxseOvg3FU0WX9tNXdAL+6vShZcn+bC75G5/iv0F0KhXIKI5rM6HpP/1o3avXeyESmxOOnhoA==
X-Received: by 2002:a9d:5f8e:: with SMTP id g14mr9983292oti.37.1631544711041;
        Mon, 13 Sep 2021 07:51:51 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id d10sm1897462ooj.24.2021.09.13.07.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 07:51:48 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2] kbuild: Enable DT schema checks for %.dtb targets
Date:   Mon, 13 Sep 2021 09:51:46 -0500
Message-Id: <20210913145146.766080-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Also enable schema checks on %.dtbo targets
---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 7cfe4ff36f44..c57a7657c8dd 100644
--- a/Makefile
+++ b/Makefile
@@ -1402,17 +1402,17 @@ endif
 
 ifneq ($(dtstree),)
 
-%.dtb: include/config/kernel.release scripts_dtc
-	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
+%.dtb: dt_binding_check include/config/kernel.release scripts_dtc
+	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(dtstree)/$*.dt.yaml
 
-%.dtbo: include/config/kernel.release scripts_dtc
-	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
+%.dtbo: dt_binding_check include/config/kernel.release scripts_dtc
+	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(dtstree)/$*.dt.yaml
 
 PHONY += dtbs dtbs_install dtbs_check
 dtbs: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
-ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
+ifneq ($(filter dtbs_check %.dtb %.dtbo, $(MAKECMDGOALS)),)
 export CHECK_DTBS=y
 dtbs: dt_binding_check
 endif
-- 
2.30.2

