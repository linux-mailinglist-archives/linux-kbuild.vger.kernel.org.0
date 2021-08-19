Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED8A53F0FAE
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbhHSA65 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:58:57 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:59855 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbhHSA6x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:58:53 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4m017219;
        Thu, 19 Aug 2021 09:57:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4m017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334669;
        bh=DubxqZkgQvnO3PgHtqG3et7QlJ4rVJ/qaJqyb8Cduvo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GglksW6wZjXDkkYW0nfXPktV/AXlSz4cttFtw4hiwgjZBi3WksFaFPgwNbpkCKivo
         2YV1l1PmfO/q4jHD/gc+sS/XRIlGmu/+XtSdi+jbX4kJcVfPbMat7eNuFRhkgO41/G
         52FSCTvKaIHsy8ghOY3CUwraUNZ38a/gQ3LXYqodRNswGQTMKCWWWJM39huu2OvQfK
         RuHkgKaVnpBrHsi52nCcT4U/TmL1yNvVJCfIGXDPAQM+sid+8uL6tbZarl+mUcpqK/
         4Ksdu3JhfBcBrS4VP/GGERVogSHEebNm/qApUwi6WZ8hJ5odLiylSspyJDwUWHADgj
         YPxRQFEyVaNpg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 03/13] kbuild: detect objtool changes correctly and remove .SECONDEXPANSION
Date:   Thu, 19 Aug 2021 09:57:34 +0900
Message-Id: <20210819005744.644908-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 8852c5524029 ("kbuild: Fix objtool dependency for
'OBJECT_FILES_NON_STANDARD_<obj> := n'"), and fix the dependency in a
cleaner way.

Using .SECONDEXPANSION is expensive since Makefile.build is parsed
twice every time, and the escaping dollars makes the code unreadable.

Adding include/config/* as dependency is not maintainable either because
objtool_args is dependent on more CONFIG options.

A better fix is to include the objtool command in *.cmd files so any
command change is naturally detected by if_change.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 31154e44c251..3e4cd1439cd4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -155,7 +155,7 @@ $(obj)/%.ll: $(src)/%.c FORCE
 # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
 
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
-      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
+      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< $(cmd_objtool)
 
 ifdef CONFIG_MODVERSIONS
 # When module versioning is enabled the following steps are executed:
@@ -223,6 +223,8 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
 
+objtool := $(objtree)/tools/objtool/objtool
+
 # Objtool arguments are also needed for modfinal with LTO, so we define
 # then here to avoid duplication.
 objtool_args =								\
@@ -237,26 +239,19 @@ objtool_args =								\
 
 ifndef CONFIG_LTO_CLANG
 
-__objtool_obj := $(objtree)/tools/objtool/objtool
-
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
 cmd_objtool = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(__objtool_obj) $(objtool_args) $@)
-objtool_obj = $(if $(patsubst y%,, \
-	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(__objtool_obj))
+	; $(objtool) $(objtool_args) $@)
+
+# Rebuild all objects when objtool is updated
+objtool_dep = $(objtool)
 
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
@@ -270,7 +265,6 @@ define rule_cc_o_c
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
-	$(call cmd,objtool)
 	$(call cmd,modversions_c)
 	$(call cmd,record_mcount)
 endef
@@ -278,13 +272,11 @@ endef
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_ksymdeps)
-	$(call cmd,objtool)
 	$(call cmd,modversions_S)
 endef
 
 # Built-in and composite module parts
-.SECONDEXPANSION:
-$(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
+$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call if_changed_rule,cc_o_c)
 	$(call cmd,force_checksrc)
 
@@ -367,7 +359,7 @@ $(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
-      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
 
 ifdef CONFIG_ASM_MODVERSIONS
 
@@ -386,7 +378,7 @@ cmd_modversions_S =								\
 	fi
 endif
 
-$(obj)/%.o: $(src)/%.S $$(objtool_dep) FORCE
+$(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
 	$(call if_changed_rule,as_o_S)
 
 targets += $(filter-out $(subdir-builtin), $(real-obj-y))
-- 
2.30.2

