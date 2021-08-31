Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3873FC3D0
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240006AbhHaHlj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:39 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:65504 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239958AbhHaHlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8EW031407;
        Tue, 31 Aug 2021 16:40:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8EW031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395612;
        bh=gRCZyQi5sge2w5jObKA2Rg6iB6mn01UgM+6v+n24CY0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V9/rlA5SbKS44buFky7LEtkLWHQizlNwDSzwqJgthki+r1nVe5ALDwfyE4XX5XuMX
         9cVQChcKkxxMvMCZifZlNrgcFYthHhCkJl0iM0KrQAn2KjjBOegaGw7RSSvsoDeBUa
         ieS6jE3OFreGeoMUVmHJWKcLaecB81CRNj5ungKKPaSvVCLjqjfSKnzT05EpJIB0Zd
         x/8IqwQGexOosDpdC/fU9LIHH0BHZdS1ZMZcJcLtFxs3+OI7t8kpoBxczVRs+0HO0i
         4JVmo7AQyXGhHzlTIVEr+O6OWMxoCzNsZ4CP1FnbRSB6sXQtExOLdfWe1cLaA1TOmi
         d8gk6UvnVFfug==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] kbuild: detect objtool update without using .SECONDEXPANSION
Date:   Tue, 31 Aug 2021 16:39:56 +0900
Message-Id: <20210831074004.3195284-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Redo commit 8852c5524029 ("kbuild: Fix objtool dependency for
'OBJECT_FILES_NON_STANDARD_<obj> := n'") to add the objtool
dependency in a cleaner way.

Using .SECONDEXPANSION ends up with unreadable code due to escaped
dollars. Also, it is not efficient because the second half of
Makefile.build is parsed twice every time.

Append the objtool dependency to the *.cmd files at the build time.

This is what fixdep and gen_ksymdeps.sh already do. So, following the
same pattern seems a natural solution.

This allows us to drop $$(objtool_deps) entirely.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 720a86642f48..21b55f37a23f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -246,14 +246,11 @@ objtool-enabled = $(if $(filter-out y%, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
 
 cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
-objtool_obj = $(if $(objtool-enabled), $(objtool))
+cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
 
 endif # CONFIG_LTO_CLANG
 endif # CONFIG_STACK_VALIDATION
 
-# Rebuild all objects when objtool changes
-objtool_dep = $(objtool_obj)
-
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 cmd_gen_ksymdeps = \
 	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
@@ -267,6 +264,7 @@ define rule_cc_o_c
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
+	$(call cmd,gen_objtooldep)
 	$(call cmd,modversions_c)
 	$(call cmd,record_mcount)
 endef
@@ -274,12 +272,12 @@ endef
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_ksymdeps)
+	$(call cmd,gen_objtooldep)
 	$(call cmd,modversions_S)
 endef
 
 # Built-in and composite module parts
-.SECONDEXPANSION:
-$(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
+$(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
 	$(call if_changed_rule,cc_o_c)
 	$(call cmd,force_checksrc)
 
@@ -380,7 +378,7 @@ cmd_modversions_S =								\
 	fi
 endif
 
-$(obj)/%.o: $(src)/%.S $$(objtool_dep) FORCE
+$(obj)/%.o: $(src)/%.S FORCE
 	$(call if_changed_rule,as_o_S)
 
 targets += $(filter-out $(subdir-builtin), $(real-obj-y))
-- 
2.30.2

