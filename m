Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2BBD82BCF
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 08:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731894AbfHFGkY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 02:40:24 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:39559 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731644AbfHFGkX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:40:23 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x766dO7r002982;
        Tue, 6 Aug 2019 15:39:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x766dO7r002982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565073569;
        bh=5gUHgNcICorO6cqCrPrkJFv4onerI26ClAdRbUjrZRs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c8oYM8MZ1/hIlfUSZ+9uXKDDwIbePv/xndaZbSbK/gWGXDMbGWBPUYWFg2oENKDuN
         cyiGBzbpUhfPrO5l+yRb0JfLyPDUbTdgUJIT+X5yrKPjpuR7/IXKmBrXU8omiTSIPZ
         r++sKgPANrzeqCMhLSwzCo99ZK2a/Ibq2uuwmiFBONi4mdA92XdgShVN9ruBdK1RJf
         5DcypP7JOgomtZ6NUreCLKEnYPbAzMU0Qp9nmEsGHQkmyyZLMTBqH6cTew4N9vTKNl
         KX8qrTzHDf2/eGfvHsjG4F/+3tHcjYHqe1nh7hC+U51lfiGIgoN1/Ubd9Oui57a/RK
         //H8yTyBEk3AQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] kbuild: support composite objects spanning across multiple Makefiles
Date:   Tue,  6 Aug 2019 15:39:22 +0900
Message-Id: <20190806063923.1266-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For a module that consists of multiple objects, the Makefile typically
looks like this:

 obj-$(CONFIG_FOO)          += foo.o
 foo-y                      += foo-main.o
 foo-$(CONFIG_FOO_FEATURE1) += foo-feature1.o
 foo-$(CONFIG_FOO_FEATURE2) += foo-feature2.o

Since other Makefiles do not understand foo-y, all modules must have
a flat structure.

As Documentation/kbuild/modules.rst section 4.3 says, Kbuild can
handle files that are spread over several sub-directories, but the
top Makefile of a module must specify everything.

Some modules (drm, fs, etc.) have grown quite big, and the current
limitation is getting more and more painful.

This commit allows modules to recurse into sub-directories. The
child Makefiles inherit composite object names from the parent.

TODO:
Add documentation for this syntax.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 27 ++++++++++++++++------
 scripts/Makefile.lib   | 51 +++++++++++++++++++++++++-----------------
 2 files changed, 51 insertions(+), 27 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 68622cbdfda5..cea2bb25787a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -70,7 +70,7 @@ endif
 mod-targets := $(patsubst %.o, %.mod, $(obj-m))
 
 __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
-	 $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
+	 $(if $(KBUILD_MODULES),$(obj-m) $(ar-m) $(mod-targets) $(modorder-target)) \
 	 $(subdir-ym) $(always)
 	@:
 
@@ -274,7 +274,10 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call if_changed_rule,cc_o_c)
 
 cmd_mod = { \
-	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
+	echo $(if $($*-objs)$($*-y)$($*-m), \
+		$(foreach m, $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), \
+			$(if $(filter %.a, $(m)), $(shell $(AR) t $(m)), $(m))), \
+		$(@:.mod=.o)); \
 	$(cmd_undef_syms); \
 	} > $@
 
@@ -399,19 +402,24 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 # ---------------------------------------------------------------------------
 
 # To build objects in subdirs, we need to descend into the directories
-$(sort $(subdir-obj-y)): $(subdir-ym) ;
+$(sort $(subdir-obj-y) $(subdir-ar-m)): $(subdir-ym);
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
 #
 
-quiet_cmd_ar_no_sym = AR      $@
+quiet_cmd_ar_no_sym = AR $(quiet_modtag)  $@
       cmd_ar_no_sym = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
 
 $(builtin-target): $(real-obj-y) FORCE
 	$(call if_changed,ar_no_sym)
 
-targets += $(builtin-target)
+$(ar-m): part-of-module := y
+$(ar-m): FORCE
+	$(call if_changed,ar_no_sym)
+$(call multi_depend, $(ar-m), .a, -objs -y -m)
+
+targets += $(builtin-target) $(ar-m)
 
 #
 # Rule to create modules.order file
@@ -456,7 +464,7 @@ endif
 # module is turned into a multi object module, $^ will contain header file
 # dependencies recorded in the .*.cmd file.
 quiet_cmd_link_multi-m = LD [M]  $@
-      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
+      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ --whole-archive $(filter %.o %a,$^) --no-whole-archive
 
 $(modules-multi): FORCE
 	$(call if_changed,link_multi-m)
@@ -485,7 +493,12 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 
 PHONY += $(subdir-ym)
 $(subdir-ym):
-	$(Q)$(MAKE) $(build)=$@ need-builtin=$(if $(findstring $@,$(subdir-obj-y)),1)
+	$(MAKE) $(build)=$@ \
+	need-builtin=$(if $(filter $@/built-in.a,$(subdir-obj-y)),1) \
+	multi-used2-y="$(sort $(foreach m, $(subdir-multi-used-y), \
+			$(if $(filter $@/,$(dir $(m))), $(notdir $m))))" \
+	multi-used2-m="$(sort $(foreach m, $(subdir-multi-used-m), \
+			$(if $(filter $@/,$(dir $(m))), $(notdir $m))))"
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e503f12e8e9c..e4e4ed869cad 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -25,38 +25,44 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # and -m subdirs.  Just put -y's first.
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
 
-# Handle objects in subdirs
-# ---------------------------------------------------------------------------
-# o if we encounter foo/ in $(obj-y), replace it by foo/built-in.a
-#   and add the directory to the list of dirs to descend into: $(subdir-y)
-# o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
-#   and add the directory to the list of dirs to descend into: $(subdir-m)
-__subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
-subdir-y	+= $(__subdir-y)
-__subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
-subdir-m	+= $(__subdir-m)
-obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
-obj-m		:= $(filter-out %/, $(obj-m))
+
+# Replace multi-part objects by their individual parts,
+# including built-in.a from subdirectories
+real-obj-y := $(foreach m, $(obj-y),$(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))), $($(m:.o=-objs)) $($(m:.o=-y)), $(m)))
+real-obj-y += $(foreach m, $(multi-used2-y),$(if $(strip $($(m)-objs) $($(m)-y) $($(m)-)),$($(m)-objs) $($(m)-y)))
+real-obj-m := $(foreach m, $(obj-m),$(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)), $(m)))
+real-obj-m += $(foreach m, $(multi-used2-m),$(if $(strip $($(m)-objs) $($(m)-y) $($(m)-m) $($(m)-)), $($(m)-objs) $($(m)-y) $($(m)-m)))
+
+# all objects and thin archives combined into built-in.a in this directory
 
 # Subdirectories we need to descend into
-subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
+subdir-ym := $(sort $(subdir-y) $(subdir-m) \
+		$(patsubst %/,%,$(filter %/,$(real-obj-y) $(real-obj-m))))
+
+real-obj-y := $(patsubst %/, %/built-in.a, $(real-obj-y))
+subdir-obj-y := $(filter %/built-in.a, $(real-obj-y))
+
+obj-m 	   := $(filter-out %/, $(obj-m))
+real-obj-m := $(filter-out %/, $(real-obj-m))
 
 # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo is multi-used
 multi-used-y := $(sort $(foreach m, $(patsubst %.o,%,$(obj-y)), $(if $(strip $($(m)-objs) $($(m)-y) $($(m)-)), $(m))))
 multi-used-m := $(sort $(foreach m, $(patsubst %.o,%,$(obj-m)), $(if $(strip $($(m)-objs) $($(m)-y) $($(m)-m) $($(m)-)), $(m))))
 
 modules-multi := $(addsuffix .o, $(multi-used-m))
+ar-m          := $(addsuffix .a, $(multi-used2-m))
+
+multi-used-y += $(multi-used2-y)
+multi-used-m += $(multi-used2-m)
 
 multi-used := $(multi-used-y) $(multi-used-m)
 
-# $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
-# tell kbuild to descend
-subdir-obj-y := $(filter %/built-in.a, $(obj-y))
+# multi-used (composite) objects propagated to sub-directories
+subdir-multi-used-y := $(foreach m, $(multi-used-y), $(addsuffix $(m), $(filter %/, $($(m)-objs) $($(m)-y))))
+subdir-multi-used-m := $(foreach m, $(multi-used-m), $(addsuffix $(m), $(filter %/, $($(m)-objs) $($(m)-y) $($(m)-m))))
 
-# Replace multi-part objects by their individual parts,
-# including built-in.a from subdirectories
-real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
-real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
+$(foreach m, $(patsubst %.o,%,$(multi-used-m) $(multi-used2-m)), $(foreach s, -objs -y -m, \
+	$(eval $(m)$(s) := $(patsubst %/,%/$(m).a, $($(m)$(s))))))
 
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
@@ -95,6 +101,11 @@ real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
 modules-multi	:= $(addprefix $(obj)/,$(modules-multi))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
+ar-m		:= $(addprefix $(obj)/,$(ar-m))
+subdir-multi-used-y := $(addprefix $(obj)/,$(subdir-multi-used-y))
+subdir-multi-used-m := $(addprefix $(obj)/,$(subdir-multi-used-m))
+
+subdir-ar-m	:= $(addsuffix .a, $(subdir-multi-used-m))
 
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, all of them are
-- 
2.17.1

