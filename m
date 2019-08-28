Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471709FA08
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 07:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbfH1FzX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 01:55:23 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:41031 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfH1FzW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 01:55:22 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7S5sQl1027215;
        Wed, 28 Aug 2019 14:54:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7S5sQl1027215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566971667;
        bh=1ulsOyalAvz8imh5AvDLy9mR+uGhKRhvRPZqusNGPNY=;
        h=From:To:Cc:Subject:Date:From;
        b=QWFfx4YqVVqKrFMVUBgcnfCgGgmH4UnvUVDw5b0jiWcuzbYh59RiHeBlY89iqCuns
         jAihefBttY849PflHjvHW0GfkHKNWH5H3p/wfGSgI1XhHR8X+fK2xEwjZdfv1gSz77
         RlQcnC13GN0XJNW7bEfdGktIpZGBQXJK+d/b14cHc0rvWgGlxeYVyOO2QqEz/evnCo
         9vKsyAQ6gAFjziy1opXFHISXQngmgYYCmIiQHkp68Gfcx1r+BCf5y4bLCdkrIgVySV
         Wee3FC1kVl/ziDQHKbC7DhaixdszE98CgN00SfLfioxHeU6OiePjRTGcMenzYi27Sf
         XntT+s380czaw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
Date:   Wed, 28 Aug 2019 14:54:24 +0900
Message-Id: <20190828055425.24765-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Instead of the warning-[123] magic, let's accumulate compiler options
to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
easier to understand what is going on in this file.

This commit slightly changes the behavior, I think all of which are OK.

[1] Currently, cc-option calls are needlessly evaluated. For example,
      warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
    needs evaluating only when W=3, but it is actually evaluated for
    W=1, W=2 as well. With this commit, only relevant cc-option calls
    will be evaluated. This is a slight optimization.

[2] Currently, unsupported level like W=4 is checked by:
      $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
    This will no longer be checked, but I do not think it is a big
    deal.

[3] Currently, 4 Clang warnings (Winitializer-overrides, Wformat,
    Wsign-compare, Wformat-zero-length) are shown by any of W=1, W=2,
    and W=3. With this commit, they will be warned only by W=1. I
    think this is a more correct behavior since each warning belongs
    to only one warning level.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.extrawarn | 104 +++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 51 deletions(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a74ce2e3c33e..1fa53968e292 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -1,14 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # ==========================================================================
-#
 # make W=... settings
-#
-# W=1 - warnings that may be relevant and does not occur too often
-# W=2 - warnings that occur quite often but may still be relevant
-# W=3 - the more obscure warnings, can most likely be ignored
-#
-# $(call cc-option, -W...) handles gcc -W.. options which
-# are not supported by all versions of the compiler
 # ==========================================================================
 
 KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
@@ -17,58 +9,68 @@ ifeq ("$(origin W)", "command line")
   export KBUILD_ENABLE_EXTRA_GCC_CHECKS := $(W)
 endif
 
-ifdef KBUILD_ENABLE_EXTRA_GCC_CHECKS
-warning-  := $(empty)
+#
+# W=1 - warnings that may be relevant and does not occur too often
+#
+ifneq ($(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
 
-warning-1 := -Wextra -Wunused -Wno-unused-parameter
-warning-1 += -Wmissing-declarations
-warning-1 += -Wmissing-format-attribute
-warning-1 += -Wmissing-prototypes
-warning-1 += -Wold-style-definition
-warning-1 += -Wmissing-include-dirs
-warning-1 += $(call cc-option, -Wunused-but-set-variable)
-warning-1 += $(call cc-option, -Wunused-const-variable)
-warning-1 += $(call cc-option, -Wpacked-not-aligned)
-warning-1 += $(call cc-option, -Wstringop-truncation)
+KBUILD_CFLAGS += -Wextra -Wunused -Wno-unused-parameter
+KBUILD_CFLAGS += -Wmissing-declarations
+KBUILD_CFLAGS += -Wmissing-format-attribute
+KBUILD_CFLAGS += -Wmissing-prototypes
+KBUILD_CFLAGS += -Wold-style-definition
+KBUILD_CFLAGS += -Wmissing-include-dirs
+KBUILD_CFLAGS += $(call cc-option, -Wunused-but-set-variable)
+KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
+KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
+KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 # The following turn off the warnings enabled by -Wextra
-warning-1 += -Wno-missing-field-initializers
-warning-1 += -Wno-sign-compare
-
-warning-2 += -Wcast-align
-warning-2 += -Wdisabled-optimization
-warning-2 += -Wnested-externs
-warning-2 += -Wshadow
-warning-2 += $(call cc-option, -Wlogical-op)
-warning-2 += -Wmissing-field-initializers
-warning-2 += -Wsign-compare
-warning-2 += $(call cc-option, -Wmaybe-uninitialized)
-warning-2 += $(call cc-option, -Wunused-macros)
-
-warning-3 := -Wbad-function-cast
-warning-3 += -Wcast-qual
-warning-3 += -Wconversion
-warning-3 += -Wpacked
-warning-3 += -Wpadded
-warning-3 += -Wpointer-arith
-warning-3 += -Wredundant-decls
-warning-3 += -Wswitch-default
-warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
-
-warning := $(warning-$(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
-warning += $(warning-$(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
-warning += $(warning-$(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
-
-ifeq ("$(strip $(warning))","")
-        $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
-endif
+KBUILD_CFLAGS += -Wno-missing-field-initializers
+KBUILD_CFLAGS += -Wno-sign-compare
 
-KBUILD_CFLAGS += $(warning)
 else
 
+# W=1 also stops suppressing some warnings
+
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-initializer-overrides
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
 endif
+
+endif
+
+#
+# W=2 - warnings that occur quite often but may still be relevant
+#
+ifneq ($(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
+
+KBUILD_CFLAGS += -Wcast-align
+KBUILD_CFLAGS += -Wdisabled-optimization
+KBUILD_CFLAGS += -Wnested-externs
+KBUILD_CFLAGS += -Wshadow
+KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
+KBUILD_CFLAGS += -Wmissing-field-initializers
+KBUILD_CFLAGS += -Wsign-compare
+KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
+KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
+
+endif
+
+#
+# W=3 - the more obscure warnings, can most likely be ignored
+#
+ifneq ($(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
+
+KBUILD_CFLAGS += -Wbad-function-cast
+KBUILD_CFLAGS += -Wcast-qual
+KBUILD_CFLAGS += -Wconversion
+KBUILD_CFLAGS += -Wpacked
+KBUILD_CFLAGS += -Wpadded
+KBUILD_CFLAGS += -Wpointer-arith
+KBUILD_CFLAGS += -Wredundant-decls
+KBUILD_CFLAGS += -Wswitch-default
+KBUILD_CFLAGS += $(call cc-option, -Wpacked-bitfield-compat)
+
 endif
-- 
2.17.1

