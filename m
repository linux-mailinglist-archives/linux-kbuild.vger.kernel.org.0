Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 734BC18580
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 08:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfEIGqB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 02:46:01 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:40658 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfEIGqB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 02:46:01 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x496j7Vr017928;
        Thu, 9 May 2019 15:45:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x496j7Vr017928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557384307;
        bh=ZmodlAgJDx+4Bn0ZK3dZyFQf7agV4L/RsO8W9qSntN0=;
        h=From:To:Cc:Subject:Date:From;
        b=pEbXKMR8YvAnpIkGsdPF2sD82pO8HtkWwfyrLxlNKdZadNPnf3ssO+W3yXgI+cf4y
         XUAc/ihyIzF2MTIG0khGbHRAKK0STPWmtWzi0OWHPTCw4/IJLmKSdielO4i53c1kRG
         /Anq7JNbNz8TtDvLzgC3Gv3jckSInALv1LLzld7anqTyZVypfZlVQrJcuv/wAI0hNb
         IviRk8xfR+dAwA6D76r39XZWHFFyLr4QdmmVa2hUn0GEvXM3hKzzb/Z4+LdtiU/bN2
         gD1M8pgegBT9i9s4oEulJihQBATjblgCtCVn6vcXSucSChzK5ehkhprd2AMm06fOto
         dDk4MYmiu+HUQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add most of Clang-specific flags unconditionally
Date:   Thu,  9 May 2019 15:44:55 +0900
Message-Id: <20190509064455.1173-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We do not support old Clang versions. Upgrade your clang version
if any of these flags is unsupported.

Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
except -fcatch-undefined-behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                   | 10 +++++-----
 scripts/Makefile.extrawarn | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index bd7ae11947cb..c71ffb6f55b5 100644
--- a/Makefile
+++ b/Makefile
@@ -731,15 +731,15 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
 KBUILD_CFLAGS += $(stackp-flags-y)
 
 ifdef CONFIG_CC_IS_CLANG
-KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
-KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
-KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
+KBUILD_CPPFLAGS += -Qunused-arguments
+KBUILD_CFLAGS += -Wno-format-invalid-specifier
+KBUILD_CFLAGS += -Wno-gnu
 # Quiet clang warning: comparison of unsigned expression < 0 is always false
-KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
+KBUILD_CFLAGS += -Wno-tautological-compare
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
 # See modpost pattern 2
-KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
+KBUILD_CFLAGS += -mno-global-merge
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
 else
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 768306add591..523c4cafe2dc 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -66,11 +66,11 @@ KBUILD_CFLAGS += $(warning)
 else
 
 ifdef CONFIG_CC_IS_CLANG
-KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
-KBUILD_CFLAGS += $(call cc-disable-warning, format)
-KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
-KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
-KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
+KBUILD_CFLAGS += -Wno-initializer-overrides
+KBUILD_CFLAGS += -Wno-unused-value
+KBUILD_CFLAGS += -Wno-format
+KBUILD_CFLAGS += -Wno-sign-compare
+KBUILD_CFLAGS += -Wno-format-zero-length
+KBUILD_CFLAGS += -Wno-uninitialized
 endif
 endif
-- 
2.17.1

