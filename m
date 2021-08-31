Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351843FC3CC
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239973AbhHaHlh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:65505 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239753AbhHaHlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8EU031407;
        Tue, 31 Aug 2021 16:40:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8EU031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395611;
        bh=TzRYWVEk2uz94kf4FQhuvI8YUyXUVwnUiVEt4iPFvzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YV0BB8hpH+EngEJ8p93dSMnC+X7XsB37dsgBJG//v3zTXdiC+oOyLCs4V21Yf7AiF
         nlnhFR6+P4bRKkFo6yWmQvIunylwKehEmBBKfn1j51mBz5NPqOuT10VPpbywlO7KTx
         S3nd82f5XXZND6U/oJ+eCRXrhHF3niyR7XHWekvg3UaNUFk9qqpM9G89ZeyA6fdfP7
         BHbLn0V8qRyPU6DxNZDqz+BCODYEBAc+fRPrgfPpo3jw4XppM94kTYgjbJN9GtHub8
         l/EhySD1nv3fs4mWBAbRxgnExLqmQwvl+lUlKpD7TTRbKEIsMfZPwesYEtnOY7YrTR
         cRtWYbrRHbVUg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] kbuild: store the objtool command in *.cmd files
Date:   Tue, 31 Aug 2021 16:39:54 +0900
Message-Id: <20210831074004.3195284-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

objtool_dep includes include/config/{ORC_UNWINDER,STACK_VALIDATION}
so that all the objects are rebuilt when any of CONFIG_ORC_UNWINDER
and CONFIG_STACK_VALIDATION is toggled.

As you can see in 'objtool_args', there are more CONFIG options
that affect the objtool command line.

Adding more and more include/config/* is ugly and unmaintainable.

Another issue is that non-standard objects are needlessly rebuilt.
Objects specified as OBJECT_FILES_NON_STANDARD is not processed by
objtool, but they are rebuilt anyway when CONFIG_ORC_UNWINDER or
CONFIG_STACK_VALIDATION is toggled. This is not a big deal, but
better to fix.

A cleaner and more precise fix is to include the objtool command in
*.cmd files so any command change is naturally detected by if_change.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e78096cd396b..021ae0146913 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -155,7 +155,7 @@ $(obj)/%.ll: $(src)/%.c FORCE
 # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
 
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
-      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
+      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< $(cmd_objtool)
 
 ifdef CONFIG_MODVERSIONS
 # When module versioning is enabled the following steps are executed:
@@ -243,7 +243,7 @@ ifndef CONFIG_LTO_CLANG
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
 cmd_objtool = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(objtool) $(objtool_args) $@)
+	; $(objtool) $(objtool_args) $@)
 objtool_obj = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
 	$(objtool))
@@ -251,10 +251,8 @@ objtool_obj = $(if $(patsubst y%,, \
 endif # CONFIG_LTO_CLANG
 endif # CONFIG_STACK_VALIDATION
 
-# Rebuild all objects when objtool changes, or is enabled/disabled.
-objtool_dep = $(objtool_obj)					\
-	      $(wildcard include/config/ORC_UNWINDER		\
-			 include/config/STACK_VALIDATION)
+# Rebuild all objects when objtool changes
+objtool_dep = $(objtool_obj)
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 cmd_gen_ksymdeps = \
@@ -269,7 +267,6 @@ define rule_cc_o_c
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
-	$(call cmd,objtool)
 	$(call cmd,modversions_c)
 	$(call cmd,record_mcount)
 endef
@@ -277,7 +274,6 @@ endef
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_ksymdeps)
-	$(call cmd,objtool)
 	$(call cmd,modversions_S)
 endef
 
@@ -365,7 +361,7 @@ $(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
-      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
 
 ifdef CONFIG_ASM_MODVERSIONS
 
-- 
2.30.2

