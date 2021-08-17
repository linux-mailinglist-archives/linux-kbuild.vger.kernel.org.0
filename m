Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EE33EE0DA
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234592AbhHQAWG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234935AbhHQAWF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:22:05 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE10BC061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:33 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id f8-20020a2585480000b02905937897e3daso18476882ybn.2
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qcMahTy1suowLl0Za6h1NGXvaZHNK4dybAs/n3NhjkY=;
        b=JUWAV2ZYEqIQC3Ux793DZlWX9iwor5YW8CdB6qGRVZ/rRwnEz7GfmfZIcsvg5K4hoo
         6Jr0n3VkX+TMyaLqpggQSjsX5PByPxo1Ic12Q5YB6HkRDbYPllDj0EuP1wg6X6aED/9a
         qU8AyCnA3uYFyAljtSUoQfeQ4RvoL+WlO/bLA+PuszjA3cKWjSCgi/4VoXMSJ4MDD1jE
         dcjA8gJUm5juKPCSYmBND5eCbCHhXNysG2U1xgrlKy1C9I2amsE9AW0bF3ilNqTeN/i3
         FsPuy7vA3ciJm0p5Zb+jq+6lFcDW/P9h/uQG6Pgxlh+BcptF0WHCEH4JSxxCVEo3bPg3
         auQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qcMahTy1suowLl0Za6h1NGXvaZHNK4dybAs/n3NhjkY=;
        b=SMKirW81hEwWCERvB8LzhEagrNISCELLl3sklrlGNmkqO09+/R1sgOr0/KGJkEJuHp
         N8WczhnLLUju7gdeA6YgnRZU+9XYEYRwNDC4c8XxSBwX/czuIB9sU0lNy+wbMquVrSJA
         jE04GmHoJha9ApwYr7tActJ3E8wZe+9xnMIfwkTlgVrprhR/4tJ5/Mg/pjqgB3L83eUW
         WgkDMfnJxNa4eOmYetIL5dAfNDpcUisispcXxToEzIHbNkA5OtDEWrcqp2xyUtPTeaWd
         rpiC0K0D8PNE4ILK2+3KVlZabRcOQBzxCjEHRWNuC8DpCBhXVMdPLiLBoFC5i/UUfxSw
         aPww==
X-Gm-Message-State: AOAM533qnaq67MZeTAuP6IYnpPC0ah7K3cTAXsK1WUIlCu7RV5TZZNM7
        p03Hvl7G9KK92L8l7vYvBGCBcF4GAUasOD0T54c=
X-Google-Smtp-Source: ABdhPJzmODTvvWWrj64eZq4jP794VshTQWPrTYo1h1WBN76TvzGVmHkmxCkYVpNH22qya/3hLKhwppUYj4Xx9J9MUg0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a25:83cd:: with SMTP id
 v13mr865069ybm.325.1629159692935; Mon, 16 Aug 2021 17:21:32 -0700 (PDT)
Date:   Mon, 16 Aug 2021 17:21:09 -0700
In-Reply-To: <20210817002109.2736222-1-ndesaulniers@google.com>
Message-Id: <20210817002109.2736222-8-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 7/7] kbuild: remove cc-option-yn, update Docs
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cc-option-yn can be replaced with cc-option. ie.
Checking for support:
ifeq ($(call cc-option-yn,$(FLAG)),y)
becomes:
ifneq ($(call cc-option,$(FLAG)),)

Checking for lack of support:
ifeq ($(call cc-option-yn,$(FLAG)),n)
becomes:
ifeq ($(call cc-option,$(FLAG)),)

This allows us to remove cc-option-yn. Do so and update the docs with
examples.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/kbuild/makefiles.rst | 22 +++++++++-------------
 scripts/Makefile.compiler          |  5 -----
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index db3af0b45baf..4538c36d8df0 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -650,24 +650,20 @@ more details, with real examples.
 	-march=pentium-mmx if supported by $(CC), otherwise -march=i586.
 	The second argument to cc-option is optional, and if omitted,
 	cflags-y will be assigned no value if first option is not supported.
-	Note: cc-option uses KBUILD_CFLAGS for $(CC) options
+	Note: cc-option uses KBUILD_CFLAGS for $(CC) options.
 
-   cc-option-yn
-	cc-option-yn is used to check if gcc supports a given option
-	and return 'y' if supported, otherwise 'n'.
+	cc-option can be combined with conditionals to perform actions based on tool
+	support.
 
 	Example::
 
-		#arch/ppc/Makefile
-		biarch := $(call cc-option-yn, -m32)
-		aflags-$(biarch) += -a32
-		cflags-$(biarch) += -m32
+		ifneq ($(call cc-option,$(FLAG)),)
+		# $(FLAG) is supported
 
-	In the above example, $(biarch) is set to y if $(CC) supports the -m32
-	option. When $(biarch) equals 'y', the expanded variables $(aflags-y)
-	and $(cflags-y) will be assigned the values -a32 and -m32,
-	respectively.
-	Note: cc-option-yn uses KBUILD_CFLAGS for $(CC) options
+	Or::
+
+		ifeq ($(call cc-option,$(FLAG)),)
+		# $(FLAG) is not supported
 
     cc-disable-warning
 	cc-disable-warning checks if gcc supports a given warning and returns
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 86ecd2ac874c..c19c0b544c0f 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -51,11 +51,6 @@ __cc-option = $(call try-run,\
 cc-option = $(call __cc-option, $(CC),\
 	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
 
-# cc-option-yn
-# Usage: flag := $(call cc-option-yn,-march=winchip-c6)
-cc-option-yn = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
-
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
 cc-disable-warning = $(call try-run,\
-- 
2.33.0.rc1.237.g0d66db33f3-goog

