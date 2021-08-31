Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226CA3FC3DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240070AbhHaHlt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:49 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:16663 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239969AbhHaHls (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:48 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8EX031407;
        Tue, 31 Aug 2021 16:40:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8EX031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395612;
        bh=xFLGv8lF3G7O65tVH4SGLfJJLnu04rv+AUXe+aVSKyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EjY85S866+0wiT4jiBLJlJANS+VNEIHLaPkt6Oq1mm6ej429ZyHkTr9txcvMYAuIl
         SAaKy66GfM4Ne//MST9o9UzHzNw2ebn/nI9E7f2C6P4rPEHygdthNFvSotOEsn60PK
         r/Gl3+xYtzo6LRUeUpqtc6iOBcXyxuyamXXQBm7/5IUZaRIy7EyRLPE35RwsOcHbrh
         xeJ0Syzd2zP0MOX1GnSZjw3B7H2lHH/hZfkZ+nkzpQ0BlIYo605fqDs9l3bMpDJX/K
         Zj780OS9FIwJii97YuQ4uIo2hsPdFtfeyrb8oP6sy3O/d8WLxKRlKdvs7FdMvha0zw
         cM0CTgJMQu8EA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] kbuild: reuse $(cmd_objtool) for cmd_cc_lto_link_modules
Date:   Tue, 31 Aug 2021 16:39:57 +0900
Message-Id: <20210831074004.3195284-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For CONFIG_LTO_CLANG=y, the objtool processing is not possible at the
compilation, hence postponed by the link time.

Reuse $(cmd_objtool) for CONFIG_LTO_CLANG=y by defining objtool-enabled
properly.

For CONFIG_LTO_CLANG=y:

  objtool-enabled is off for %.o compilation
  objtool-enabled is on  for %.lto link

For CONFIG_LTO_CLANG=n:

  objtool-enabled is on for %.o compilation
      (but, it depends on OBJECT_FILE_NON_STANDARD)

Set part-of-module := y for %.lto.o to avoid repeating --module.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 21b55f37a23f..afc906cd7256 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -236,20 +236,26 @@ objtool_args =								\
 	$(if $(CONFIG_X86_SMAP), --uaccess)				\
 	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
 
-ifndef CONFIG_LTO_CLANG
+cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
+cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
+
+endif # CONFIG_STACK_VALIDATION
+
+ifdef CONFIG_LTO_CLANG
+
+# Skip objtool for LLVM bitcode
+$(obj)/%o: objtool-enabled :=
+
+else
 
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
 
-objtool-enabled = $(if $(filter-out y%, \
+$(obj)/%o: objtool-enabled = $(if $(filter-out y%, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
 
-cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
-cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
-
-endif # CONFIG_LTO_CLANG
-endif # CONFIG_STACK_VALIDATION
+endif
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 cmd_gen_ksymdeps = \
@@ -289,13 +295,13 @@ cmd_cc_lto_link_modules =						\
 	$(LD) $(ld_flags) -r -o $@					\
 		$(shell [ -s $(@:.lto.o=.o.symversions) ] &&		\
 			echo -T $(@:.lto.o=.o.symversions))		\
-		--whole-archive $(filter-out FORCE,$^)
+		--whole-archive $(filter-out FORCE,$^)			\
+		$(cmd_objtool)
 
-ifdef CONFIG_STACK_VALIDATION
 # objtool was skipped for LLVM bitcode, run it now that we have compiled
 # modules into native code
-cmd_cc_lto_link_modules += ; $(objtool) $(objtool_args) --module $@
-endif
+$(obj)/%.lto.o: objtool-enabled = y
+$(obj)/%.lto.o: part-of-module := y
 
 $(obj)/%.lto.o: $(obj)/%.o FORCE
 	$(call if_changed,cc_lto_link_modules)
-- 
2.30.2

