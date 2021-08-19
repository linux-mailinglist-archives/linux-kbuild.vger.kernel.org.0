Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB9C3F0FAF
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbhHSA65 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:58:57 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:59856 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbhHSA6x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:58:53 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4k017219;
        Thu, 19 Aug 2021 09:57:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4k017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334668;
        bh=PVxZwZza2Bwkv7dBpcaLQNZGPpDeheJxOo2r93CeIqE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N+GqvQNu/si67k8jdd7tyUw0KDpz4xlhmzZtX5ViCyaO/7FY8KSmV4jkyg0FCWEjG
         u6lSRZ4aAUAPoeOjMhClqhQ/iDPp5AiDgoHNVtqbk6bHaj+7tyRaTgw1tzt9XZURsN
         QwkgjnwEN7gvdt3HdGXGl2L+f/CaTdwoPeDUuklm+uPUxzMtdHdBsMEfvjkXkBr2zi
         iB4WtuNewJDP/8JM482U9DhRDFqfwWJYOEVmf+lTlyEyCkmFvy85jm7oWK2deDYLwQ
         Z77DCCv4xvC0XgKUQZA2HS6lGl9uGDwcWLjr2AdTIhIb4tOwWVLLZ5qZsXOR9ZCCGQ
         VnW57SQ0ObJhA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 01/13] kbuild: move objtool_args back to scripts/Makefile.build
Date:   Thu, 19 Aug 2021 09:57:32 +0900
Message-Id: <20210819005744.644908-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit b1a1a1a09b46 ("kbuild: lto: postpone objtool") moved objtool_args
to Makefile.lib, so the arguments can be used in Makefile.modfinal as
well as Makefile.build.

With commit 2b1d7fc05467 ("kbuild: Fix TRIM_UNUSED_KSYMS with
LTO_CLANG"), module LTO linking came back to scripts/Makefile.build
again.

So, there is no more reason to keep objtool_args separately in
scripts/Makefile.lib.

Get it back to the original place, close to the objtool command.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 13 +++++++++++++
 scripts/Makefile.lib   | 12 ------------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ea549579bfb7..31154e44c251 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -222,6 +222,19 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
 endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
+
+# Objtool arguments are also needed for modfinal with LTO, so we define
+# then here to avoid duplication.
+objtool_args =								\
+	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
+	$(if $(part-of-module), --module,)				\
+	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
+	$(if $(or $(CONFIG_GCOV_KERNEL),$(CONFIG_LTO_CLANG)),		\
+		--no-unreachable,)					\
+	$(if $(CONFIG_RETPOLINE), --retpoline,)				\
+	$(if $(CONFIG_X86_SMAP), --uaccess,)				\
+	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount,)
+
 ifndef CONFIG_LTO_CLANG
 
 __objtool_obj := $(objtree)/tools/objtool/objtool
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index af1c920a585c..34c4c11c4bc1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -232,18 +232,6 @@ ifeq ($(CONFIG_LTO_CLANG),y)
 mod-prelink-ext := .lto
 endif
 
-# Objtool arguments are also needed for modfinal with LTO, so we define
-# then here to avoid duplication.
-objtool_args =								\
-	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
-	$(if $(part-of-module), --module,)				\
-	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
-	$(if $(or $(CONFIG_GCOV_KERNEL),$(CONFIG_LTO_CLANG)), 		\
-		--no-unreachable,)					\
-	$(if $(CONFIG_RETPOLINE), --retpoline,)				\
-	$(if $(CONFIG_X86_SMAP), --uaccess,)				\
-	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount,)
-
 # Useful for describing the dependency of composite objects
 # Usage:
 #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
-- 
2.30.2

