Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2833FA4D9
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Aug 2021 11:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbhH1Jw1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Aug 2021 05:52:27 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60788 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbhH1JwZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Aug 2021 05:52:25 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17S9p5iG032486;
        Sat, 28 Aug 2021 18:51:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17S9p5iG032486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630144266;
        bh=yHZqPo8mLcrIYd8PVKfN1JtDa44BAED7CefJRDr5ZCM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2/U6TvKC5MlDb4OE6WHwUE1kiEmy1dnBpgPnHFvlKRngLFoH3I8vtbNK2b5WT2Pu5
         X4CFxlYDDhuedc/b2UnewCLO8+gQm3hOt7K/0aSOLvNC9JIDehxhyb0z6jQ0kxElrq
         0MloAi3xQfH/G+2pb+0J7bRA5u5jKUxZIKJCCyuMGdUz+BTciHLXPXKcfyIe+avCcJ
         RPTS60G+CQ7vuePXfEe7VU821BsLs3jMiauKaeo08sgw4BcpLqioDutwbrT6798yKQ
         DkEYu4EPTKTqn7d6+azIzXEugnLtrq1X0FlycFOqKELm2Q94vqe9OR0At2DVkq2w9R
         TmQaw1pbDf3kQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] kbuild: detect objtool changes correctly without .SECONDEXPANSION
Date:   Sat, 28 Aug 2021 18:51:00 +0900
Message-Id: <20210828095103.2617393-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210828095103.2617393-1-masahiroy@kernel.org>
References: <20210828095103.2617393-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 8852c5524029 ("kbuild: Fix objtool dependency for
'OBJECT_FILES_NON_STANDARD_<obj> := n'"), and fixes the dependency in
a cleaner, more precise way.

Using .SECONDEXPANSION is expensive since Makefile.build is parsed
twice every time, and the escaping dollars makes the code unreadable.

Adding include/config/* as dependency is not maintainable either because
objtool_args is dependent on more CONFIG options.

A better fix is to include the objtool command in *.cmd files so any
command change is naturally detected by if_change.

Also, include the md5sum of objtool into *.cmd files so any change in
the objtool executable will result in rebuilding all objects that depend
on objtool.

This allows us to drop $(objtool_deps) entirely.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                |  3 ++-
 scripts/Makefile.build  | 26 +++++++++-----------------
 scripts/link-vmlinux.sh |  3 ++-
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/Makefile b/Makefile
index 829bd339ffdc..3ef3685b7e4a 100644
--- a/Makefile
+++ b/Makefile
@@ -1858,7 +1858,8 @@ descend: $(build-dirs)
 $(build-dirs): prepare
 	$(Q)$(MAKE) $(build)=$@ \
 	single-build=$(if $(filter-out $@/, $(filter $@/%, $(KBUILD_SINGLE_TARGETS))),1) \
-	need-builtin=1 need-modorder=1
+	need-builtin=1 need-modorder=1 \
+	$(if $(CONFIG_STACK_VALIDATION),objtool-md5sum=$(firstword $(shell md5sum tools/objtool/objtool)))
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))
 PHONY += $(clean-dirs) clean
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3efc984d4c69..8aa6eaa4bf21 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -155,7 +155,7 @@ $(obj)/%.ll: $(src)/%.c FORCE
 # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
 
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
-      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
+      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< $(cmd_objtool)
 
 ifdef CONFIG_MODVERSIONS
 # When module versioning is enabled the following steps are executed:
@@ -226,26 +226,21 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 ifdef CONFIG_STACK_VALIDATION
 ifndef CONFIG_LTO_CLANG
 
-__objtool_obj := $(objtree)/tools/objtool/objtool
+objtool := $(objtree)/tools/objtool/objtool
 
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
+#
+# Record the md5sum of the objtool executable so any change in it results in
+# rebuilding objects.
 cmd_objtool = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(__objtool_obj) $(objtool_args) $@)
-objtool_obj = $(if $(patsubst y%,, \
-	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(__objtool_obj))
+	; : $(objtool-md5sum) ; $(objtool) $(objtool_args) $@)
 
 endif # CONFIG_LTO_CLANG
 endif # CONFIG_STACK_VALIDATION
 
-# Rebuild all objects when objtool changes, or is enabled/disabled.
-objtool_dep = $(objtool_obj)					\
-	      $(wildcard include/config/ORC_UNWINDER		\
-			 include/config/STACK_VALIDATION)
-
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 cmd_gen_ksymdeps = \
 	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
@@ -259,7 +254,6 @@ define rule_cc_o_c
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
-	$(call cmd,objtool)
 	$(call cmd,modversions_c)
 	$(call cmd,record_mcount)
 endef
@@ -267,13 +261,11 @@ endef
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_ksymdeps)
-	$(call cmd,objtool)
 	$(call cmd,modversions_S)
 endef
 
 # Built-in and composite module parts
-.SECONDEXPANSION:
-$(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
+$(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
 	$(call if_changed_rule,cc_o_c)
 	$(call cmd,force_checksrc)
 
@@ -356,7 +348,7 @@ $(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
-      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
 
 ifdef CONFIG_ASM_MODVERSIONS
 
@@ -375,7 +367,7 @@ cmd_modversions_S =								\
 	fi
 endif
 
-$(obj)/%.o: $(src)/%.S $$(objtool_dep) FORCE
+$(obj)/%.o: $(src)/%.S FORCE
 	$(call if_changed_rule,as_o_S)
 
 targets += $(filter-out $(subdir-builtin), $(real-obj-y))
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d74cee5c4326..58b3a94c934b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -335,7 +335,8 @@ else
 fi;
 
 # final build of init/
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
+${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1 \
+	${CONFIG_STACK_VALIDATION:+objtool-md5sum=$(md5sum tools/objtool/objtool | cut -d ' ' -f1)}
 
 #link vmlinux.o
 modpost_link vmlinux.o
-- 
2.30.2

