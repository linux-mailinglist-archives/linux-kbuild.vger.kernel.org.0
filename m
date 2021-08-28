Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3F13FA4DC
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Aug 2021 11:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbhH1Jwa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Aug 2021 05:52:30 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60853 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbhH1Jw2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Aug 2021 05:52:28 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17S9p5iI032486;
        Sat, 28 Aug 2021 18:51:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17S9p5iI032486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630144267;
        bh=6+PO3Ka8kPgLIjauytTNcql6nd+itJhVocdqQVRqbQs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tJyBasu29yX4Jr8EhvZ/IKbID3lZctTqVCxBYOALT3/kFFMELvos4MtRd/YrdRV0m
         7euhYFREvCVEpMkW5kDojL0zlHvuBdX9GRVLz4SLo++SNdqi6FdWcVJBtmDzsHxH6y
         k+r+LmHQmPuToYntHfZs6A0IC2oT8kw8+RXGyZrZQU3kbLEtZ+EYCb++rOPN50t2HB
         TtMTM8EvQ0OaRKmXM0DSEk/zDTHPx/ZJWqeYM2lgI+TQAT1juTDBe7UpQIbAnx17h3
         WXKqNCqpae+PcrvJfec8Pi6V08j78pKKXrU2kDFYcg87y7zZ+A/+vpPcsIqTk3R01m
         jdliuBZzfmg/Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] kbuild: merge objtool_args into objtool in scripts/Makefile.build
Date:   Sat, 28 Aug 2021 18:51:02 +0900
Message-Id: <20210828095103.2617393-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210828095103.2617393-1-masahiroy@kernel.org>
References: <20210828095103.2617393-1-masahiroy@kernel.org>
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

Move it to scripts/Makefile.build and merge into the 'objtool' variable.

You might wonder why cmd_cc_lto_link_modules adds --module again. Add
a small comment to explain it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 19 ++++++++++++++-----
 scripts/Makefile.lib   | 11 -----------
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8aa6eaa4bf21..cc0c494a48d3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -224,9 +224,17 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
 endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
-ifndef CONFIG_LTO_CLANG
 
-objtool := $(objtree)/tools/objtool/objtool
+objtool = $(objtree)/tools/objtool/objtool				\
+	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
+	$(if $(part-of-module), --module)				\
+	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
+	$(if $(CONFIG_GCOV_KERNEL)$(CONFIG_LTO_CLANG), --no-unreachable)\
+	$(if $(CONFIG_RETPOLINE), --retpoline)				\
+	$(if $(CONFIG_X86_SMAP), --uaccess)				\
+	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
+
+ifndef CONFIG_LTO_CLANG
 
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
@@ -236,7 +244,7 @@ objtool := $(objtree)/tools/objtool/objtool
 # rebuilding objects.
 cmd_objtool = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	; : $(objtool-md5sum) ; $(objtool) $(objtool_args) $@)
+	; : $(objtool-md5sum) ; $(objtool) $@)
 
 endif # CONFIG_LTO_CLANG
 endif # CONFIG_STACK_VALIDATION
@@ -282,8 +290,9 @@ cmd_cc_lto_link_modules =						\
 ifdef CONFIG_STACK_VALIDATION
 # objtool was skipped for LLVM bitcode, run it now that we have compiled
 # modules into native code
-cmd_cc_lto_link_modules += ;						\
-	$(objtree)/tools/objtool/objtool $(objtool_args) --module $@
+#
+# Repeat --module because $(part-of-module) does not work here.
+cmd_cc_lto_link_modules += ; $(objtool) --module $@
 endif
 
 $(obj)/%.lto.o: $(obj)/%.o FORCE
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

