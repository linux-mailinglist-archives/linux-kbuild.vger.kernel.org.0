Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85F167531C
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 17:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389460AbfGYPrc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 11:47:32 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39280 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389350AbfGYPrc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 11:47:32 -0400
Received: by mail-pl1-f195.google.com with SMTP id b7so23609783pls.6
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2019 08:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9YuwL0GVl7nYF4rNeboTYpwrDtxx+jHFRpSdYJwSITY=;
        b=ean5MHBizDZdsUUIRHt5FbVJgYeO7FgMb1a9hVK6yxi1fz7+Hkj1uslGVTWDI7Vh1T
         5wzB6dpLbYY/mphzmqXfzrbQaMHmL+Xf94SnquKlzEY6CZO8XJIgCS6+h74m0kPyFAJ3
         uC11JMPrNVdsRcN6TFJsvryEWLRy9Uz1b2X+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9YuwL0GVl7nYF4rNeboTYpwrDtxx+jHFRpSdYJwSITY=;
        b=Oqy6TEpnM0erM9LF3m/ekK8nHSW3Uktxp9+ktNJpmeFIvsRzBSkd3JuHKJWzo51PWT
         cldCXss1QNMgA0xYAJVjrKKBmYn+r6W6y5H7O6p418a1Owdl9Cqzyo1F/lkgQu4fbZYj
         qgOjo5MbsglEZrO/5kW935GAxmsstKGiHPDw3AS28gsis3Rflgkn997sZC7a9Psgu5qE
         UjnX8OD6M4TmhoVs3HlbZPAK9Rcj7A3/5PG4f2OKXMM4KNxVVy9hTOn4+vw6T1WQxFYU
         6bjc1vmyXi3NiOFpr+VcSzoL5f3SjI88FAS2Vsf3+XSUirJ/iCWb2uSk0f0x9qF1RAbM
         9MpQ==
X-Gm-Message-State: APjAAAXjP0ZtxpZBNGB09aiw0WQmdQklJnh3+/PivYSffdwMOjmm9UHm
        pYiE755qY2htFkSHWgEcjpT8Gg==
X-Google-Smtp-Source: APXvYqxJF0UtobMLDtssdzA6jMO8gxhwf/YcI24LGS7/vAbwXaFc1qoYW+wkdyjZUFQJ5p6EXiGt9Q==
X-Received: by 2002:a17:902:f082:: with SMTP id go2mr95978482plb.25.1564069651837;
        Thu, 25 Jul 2019 08:47:31 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r1sm47083788pgv.70.2019.07.25.08.47.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 08:47:31 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Peter Smith <peter.smith@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2] kbuild: Check for unknown options with cc-option usage in Kconfig and clang
Date:   Thu, 25 Jul 2019 08:47:30 -0700
Message-Id: <20190725154730.80169-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If the particular version of clang a user has doesn't enable
-Werror=unknown-warning-option by default, even though it is the
default[1], then make sure to pass the option to the Kconfig cc-option
command so that testing options from Kconfig files works properly.
Otherwise, depending on the default values setup in the clang toolchain
we will silently assume options such as -Wmaybe-uninitialized are
supported by clang, when they really aren't.

A compilation issue only started happening for me once commit
589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
CLANG_FLAGS") was applied on top of commit b303c6df80c9 ("kbuild:
compute false-positive -Wmaybe-uninitialized cases in Kconfig"). This
leads kbuild to try and test for the existence of the
-Wmaybe-uninitialized flag with the cc-option command in
scripts/Kconfig.include, and it doesn't see an error returned from the
option test so it sets the config value to Y. Then the Makefile tries to
pass the unknown option on the command line and
-Werror=unknown-warning-option catches the invalid option and breaks the
build. Before commit 589834b3a009 ("kbuild: Add
-Werror=unknown-warning-option to CLANG_FLAGS") the build works fine,
but any cc-option test of a warning option in Kconfig files silently
evaluates to true, even if the warning option flag isn't supported on
clang.

Note: This doesn't change cc-option usages in Makefiles because those
use a different rule that includes KBUILD_CFLAGS by default (see the
__cc-option command in scripts/Kbuild.incluide). The KBUILD_CFLAGS
variable already has the -Werror=unknown-warning-option flag set. Thanks
to Doug for pointing out the different rule.

[1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
Cc: Peter Smith <peter.smith@linaro.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1:
 * Reworded commit text a bit
 * Added Reviewed-by tag

 Makefile                | 5 +++++
 scripts/Kconfig.include | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9be5834073f8..28177674178a 100644
--- a/Makefile
+++ b/Makefile
@@ -517,6 +517,8 @@ ifdef building_out_of_srctree
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
 endif
 
+KCONFIG_CC_OPTION_FLAGS := -Werror
+
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
@@ -531,11 +533,14 @@ ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS	+= -no-integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
+KCONFIG_CC_OPTION_FLAGS += -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
+export KCONFIG_CC_OPTION_FLAGS
+
 # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 8a5c4d645eb1..144e83e7cb81 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -25,7 +25,7 @@ failure = $(if-success,$(1),n,y)
 
 # $(cc-option,<flag>)
 # Return y if the compiler supports <flag>, n otherwise
-cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
+cc-option = $(success,$(CC) $(KCONFIG_CC_OPTION_FLAGS) $(1) -E -x c /dev/null -o /dev/null)
 
 # $(ld-option,<flag>)
 # Return y if the linker supports <flag>, n otherwise
-- 
Sent by a computer through tubes

