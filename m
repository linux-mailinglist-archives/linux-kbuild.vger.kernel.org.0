Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753A81E9DA5
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgFAF5y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:57:54 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39163 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgFAF5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:53 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLj023694;
        Mon, 1 Jun 2020 14:57:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLj023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991059;
        bh=MiIQAuNVz99VHZPOpzDzpkGJknGf/5rRq3ooXYj5CKg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EsX4Rwurpcsut7+teLU7j0Dj9LIaJ5WA1iiB3lyuyFnBTdxiYKOwmA9y1PmsVwcno
         eVVB5d9C3uOBrIzQ7MnThss5FaAnseeDtoP7JbrDq3k0BcyI1LzXtQUAjViA9fGJsO
         GML4MpWvcdzgDnfJMVn5z9FRgVe4Jm5y1o3pK5KAXWczPpi1+/5m7oWeksQ4SM4qc0
         6P6HnONWWbM2D4hEiunzVpuEqItZKqmaqWWolikes8lgheEOE0+iLyV4bvHEsmFWMd
         NNMKPZi6dWpmUcxBHzlWx1xSYfQ16MWQVO87c1JjcCir61Z6Ahda6arKCgO2atwaW+
         X0si/XMXvAcGQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 06/37] kbuild: update modules.order only when contained modules are updated
Date:   Mon,  1 Jun 2020 14:57:00 +0900
Message-Id: <20200601055731.3006266-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make modules.order depend on $(obj-m), and use if_changed to build it.
This will avoid unneeded update of modules.order, which will be useful
to optimize the modpost stage.

Currently, the second pass of modpost is always invoked. By checking the
timestamp of modules.order, we can avoid the unneeded modpost.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile               | 14 +++++++++++---
 scripts/Makefile.build | 21 +++++++++++++--------
 scripts/Makefile.lib   | 27 ++++++++++++++-------------
 3 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/Makefile b/Makefile
index 0416760aeb28..b40420a0b991 100644
--- a/Makefile
+++ b/Makefile
@@ -1066,6 +1066,10 @@ vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
 		     $(patsubst %/,%,$(filter %/, $(core-) \
 			$(drivers-) $(libs-))))
 
+subdir-modorder := $(addsuffix modules.order,$(filter %/, \
+			$(core-y) $(core-m) $(libs-y) $(libs-m) \
+			$(drivers-y) $(drivers-m)))
+
 build-dirs	:= $(vmlinux-dirs)
 clean-dirs	:= $(vmlinux-alldirs)
 
@@ -1124,7 +1128,7 @@ targets := vmlinux
 
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
-$(sort $(vmlinux-deps)): descend ;
+$(sort $(vmlinux-deps) $(subdir-modorder)): descend ;
 
 filechk_kernel.release = \
 	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
@@ -1345,8 +1349,12 @@ PHONY += modules_check
 modules_check: modules.order
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh $<
 
-modules.order: descend
-	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
+cmd_modules_order = $(AWK) '!x[$$0]++' $(real-prereqs) > $@
+
+modules.order: $(subdir-modorder) FORCE
+	$(call if_changed,modules_order)
+
+targets += modules.order
 
 # Target to prepare building external modules
 PHONY += modules_prepare
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a1f09bec8c70..2e8810b7e5ed 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -71,7 +71,7 @@ endif
 
 # subdir-builtin and subdir-modorder may contain duplications. Use $(sort ...)
 subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
-subdir-modorder := $(sort $(filter %/modules.order, $(modorder)))
+subdir-modorder := $(sort $(filter %/modules.order, $(obj-m)))
 
 targets-for-builtin := $(extra-y)
 
@@ -83,8 +83,7 @@ ifdef need-builtin
 targets-for-builtin += $(obj)/built-in.a
 endif
 
-targets-for-modules := $(obj-m)
-targets-for-modules += $(patsubst %.o, %.mod, $(obj-m))
+targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
 
 ifdef need-modorder
 targets-for-modules += $(obj)/modules.order
@@ -361,8 +360,9 @@ endif
 $(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
 	$(call if_changed_rule,as_o_S)
 
-targets += $(filter-out $(subdir-builtin), $(real-obj-y)) $(real-obj-m) $(lib-y)
-targets += $(always-y) $(MAKECMDGOALS)
+targets += $(filter-out $(subdir-builtin), $(real-obj-y))
+targets += $(filter-out $(subdir-modorder), $(real-obj-m))
+targets += $(lib-y) $(always-y) $(MAKECMDGOALS)
 
 # Linker scripts preprocessor (.lds.S -> .lds)
 # ---------------------------------------------------------------------------
@@ -404,11 +404,16 @@ $(obj)/built-in.a: $(real-obj-y) FORCE
 #
 # Create commands to either record .ko file or cat modules.order from
 # a subdirectory
-$(obj)/modules.order: $(subdir-modorder) FORCE
-	$(Q){ $(foreach m, $(modorder), \
-	$(if $(filter $^, $m), cat $m, echo $m);) :; } \
+# Add $(obj-m) as the prerequisite to avoid updating the timestamp of
+# modules.order unless contained modules are updated.
+
+cmd_modules_order = { $(foreach m, $(real-prereqs), \
+	$(if $(filter %/modules.order, $m), cat $m, echo $(patsubst %.o,%.ko,$m));) :; } \
 	| $(AWK) '!x[$$0]++' - > $@
 
+$(obj)/modules.order: $(obj-m) FORCE
+	$(call if_changed,modules_order)
+
 #
 # Rule to compile a set of .o files into one .a file (with symbol table)
 #
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 748e44d5a1e3..e598b07e6de4 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -32,27 +32,29 @@ obj-m := $(filter-out $(obj-y),$(obj-m))
 # Filter out objects already built-in
 lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 
-# Determine modorder.
-# Unfortunately, we don't have information about ordering between -y
-# and -m subdirs.  Just put -y's first.
-ifdef need-modorder
-modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
-endif
-
 # Subdirectories we need to descend into
 subdir-ym := $(sort $(subdir-y) $(subdir-m) \
 			$(patsubst %/,%, $(filter %/, $(obj-y) $(obj-m))))
 
-# Handle objects in subdirs
-# ---------------------------------------------------------------------------
-# o if we encounter foo/ in $(obj-y), replace it by foo/built-in.a
-# o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
+# Handle objects in subdirs:
+# - If we encounter foo/ in $(obj-y), replace it by foo/built-in.a and
+#   foo/modules.order
+# - If we encounter foo/ in $(obj-m), replace it by foo/modules.order
+#
+# Generate modules.order to determine modorder. Unfortunately, we don't have
+# information about ordering between -y and -m subdirs. Just put -y's first.
+
+ifdef need-modorder
+obj-m := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m))
+else
+obj-m := $(filter-out %/, $(obj-m))
+endif
+
 ifdef need-builtin
 obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
 else
 obj-y		:= $(filter-out %/, $(obj-y))
 endif
-obj-m		:= $(filter-out %/, $(obj-m))
 
 # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
 multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))), $(m))))
@@ -81,7 +83,6 @@ endif
 extra-y		:= $(addprefix $(obj)/,$(extra-y))
 always-y	:= $(addprefix $(obj)/,$(always-y))
 targets		:= $(addprefix $(obj)/,$(targets))
-modorder	:= $(addprefix $(obj)/,$(modorder))
 obj-m		:= $(addprefix $(obj)/,$(obj-m))
 lib-y		:= $(addprefix $(obj)/,$(lib-y))
 real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
-- 
2.25.1

