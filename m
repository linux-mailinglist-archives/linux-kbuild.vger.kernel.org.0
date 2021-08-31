Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABB43FC3DD
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240073AbhHaHlv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:51 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:16606 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240046AbhHaHlq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:46 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8ES031407;
        Tue, 31 Aug 2021 16:40:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8ES031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395609;
        bh=NOIF2oQXO85ZJkaVbwLDT8Wd8L5MV8AosuEI7dbJm7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZZw8kd9Q/HRNPz0vpcCFjAMSXOSj8tsiD0kIbx+Jt4f1FZATFhUlqmAW5ZHZC5HVE
         mVLwF2XJy2/crITn2ziWPcEcM5KpSLNzrqypBlZa46WQIcaEcTYq2XlN+spysC8Lmm
         +Gru6l990lAeCKRC3/x3AF0YLLpvpofHCkr4t8IS3K4scFtl0iRjKjDYIykyaPxxmj
         sXQ6EwFxhQ0fnryV5wqpmzNUh3CqJcDAPxp+79kKvDJI9IcHVJ9HlBxWL6gyp3IdG5
         WUWukV+Nfukxr3Re8B6rJf5UeYdx1krx0xODOwRUxmjSDnDx6f7BkFBGazR9lqFycx
         ibkxu9Em1oxHA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/13] kbuild: move objtool_args back to scripts/Makefile.build
Date:   Tue, 31 Aug 2021 16:39:52 +0900
Message-Id: <20210831074004.3195284-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
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

So, there is no more reason to keep objtool_args in a separate file.

Get it back to the original place, close to the objtool command.

Remove the stale comment too.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
---

 scripts/Makefile.build | 10 ++++++++++
 scripts/Makefile.lib   | 11 -----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3efc984d4c69..17508c0e4358 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -224,6 +224,16 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
 endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
+
+objtool_args =								\
+	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
+	$(if $(part-of-module), --module)				\
+	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
+	$(if $(CONFIG_GCOV_KERNEL)$(CONFIG_LTO_CLANG), --no-unreachable)\
+	$(if $(CONFIG_RETPOLINE), --retpoline)				\
+	$(if $(CONFIG_X86_SMAP), --uaccess)				\
+	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
+
 ifndef CONFIG_LTO_CLANG
 
 __objtool_obj := $(objtree)/tools/objtool/objtool
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd011f3f6f78..34c4c11c4bc1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -232,17 +232,6 @@ ifeq ($(CONFIG_LTO_CLANG),y)
 mod-prelink-ext := .lto
 endif
 
-# Objtool arguments are also needed for modfinal with LTO, so we define
-# then here to avoid duplication.
-objtool_args =								\
-	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
-	$(if $(part-of-module), --module)				\
-	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
-	$(if $(CONFIG_GCOV_KERNEL)$(CONFIG_LTO_CLANG), --no-unreachable)\
-	$(if $(CONFIG_RETPOLINE), --retpoline)				\
-	$(if $(CONFIG_X86_SMAP), --uaccess)				\
-	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
-
 # Useful for describing the dependency of composite objects
 # Usage:
 #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
-- 
2.30.2

