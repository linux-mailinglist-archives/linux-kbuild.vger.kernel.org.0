Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F72888C0C
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfHJPyq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:54:46 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:34513 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfHJPyn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:43 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7AFrG95009713;
        Sun, 11 Aug 2019 00:53:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7AFrG95009713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565452406;
        bh=qS+P/ibLQ0sheOeZAc1s4upbPk0gu28oqYlYYjT4VJM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fanYygGikJALb5huRJzb2Di/VMObZ6ujWfvg5b82Q443DsojCJgWXgAoGFygyQxk/
         18CfrNytekHGxenX8R9aBjyrU0hDR7BVGiEyytK+EuSU/Wp3R8KJt3Hqn+ERvGTe3h
         xKeDgjIqsAzAEeww/Ze1BrC6g8oIhVri1e6fyOf57Sel2juWwG1vL6lutZTOzQsWP7
         fi/iXiTG4fxYvMJBZIeEaEEUeBF0hTSsh79iwaIbYJoM2giChcmvZUThmPoWndzFZ5
         PqNvBNOp53uZ9f9JcPGsAZYSbS4ybOsID82/KAoZ7SZ0W72Umn9jfmvLv6sJYzk79d
         Te9vc+4nPcnkQ==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] kbuild: make single targets work more correctly
Date:   Sun, 11 Aug 2019 00:53:06 +0900
Message-Id: <20190810155307.29322-11-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, the single target build directly descends into the directory
of the target. For example,

  $ make foo/bar/baz.o

... directly descends into foo/bar/.

On the other hand, the normal build usually descends one directory at
a time, i.e. descends into foo/, and then foo/bar/.

This difference causes some problems.

[1] miss subdir-asflags-y, subdir-ccflags-y in upper Makefiles

    The options in subdir-{as,cc}flags-y take effect in the current
    and its sub-directories. In other words, they are inherited
    downward. In the example above, the single target will miss
    subdir-{as,cc}flags-y if they are defined in foo/Makefile.

[2] could be built in a different directory

    As Documentation/kbuild/modules.rst section 4.3 says, Kbuild can
    handle files that are spread over several sub-directories.

    The build rule of foo/bar/baz.o may not necessarily be specified in
    foo/bar/Makefile. It might be specifies in foo/Makefile as follows:

    [foo/Makefile]
    obj-y := bar/baz.o

    This often happens when a module is so big that its source files
    are divided into sub-directories.

    In this case, there is no Makefile in the foo/bar/ level, yet the
    single target descends into foo/bar/, then fails due to the missing
    Makefile. You can still do 'make foo/bar/' for partial building,
    but cannot do 'make foo/bar/baz.s'. I beleive the single target
    '%.s' is a useful feature for inspecting the compiler output.

    Some modules work around this issue by putting an empty Makefile
    in every sub-directory.

This commit fixes those issues by letting the single target build
descend in the same way as the normal build does.

Another change is the single target build now will observe the CONFIG
options. Previously, it allowed users to build the foo.o even when
the corresponding CONFIG_FOO is disabled:

   obj-$(CONFIG_FOO) += foo.o

In the new behavior, the single target build will just fail and show
"No rule to make target ..." (or "Nothing to be done for ..." if the
stale object already exists, but cannot be updated).

The disadvantage of this commit is the build speed. Now that the
single target build visits every directory and parses lots of
Makefiles, it is slower than before. (But, I hope it will not be
too slow.)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile               | 83 +++++++++++++++++++++++++++---------------
 scripts/Makefile.build | 45 ++++++++++++++++++++---
 2 files changed, 92 insertions(+), 36 deletions(-)

diff --git a/Makefile b/Makefile
index 871c42e241a6..a93d6f6b996a 100644
--- a/Makefile
+++ b/Makefile
@@ -271,11 +271,16 @@ no-dot-config-targets := $(clean-targets) \
 			 %asm-generic kernelversion %src-pkg
 no-sync-config-targets := $(no-dot-config-targets) install %install \
 			   kernelrelease
+single-targets := %.a %.i %.ko %.lds %.lst %.mod %o %.s %.symtypes %/
+ifdef CONFIG_CC_IS_CLANG
+single-targets += %.ll
+endif
 
 config-build	:=
 mixed-build	:=
 need-config	:= 1
 may-sync-config	:= 1
+single-build	:=
 
 ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
 	ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
@@ -302,6 +307,14 @@ ifeq ($(KBUILD_EXTMOD),)
         endif
 endif
 
+# We cannot build single targets and the others at the same time
+ifneq ($(filter $(single-targets), $(MAKECMDGOALS)),)
+	single-build := 1
+	ifneq ($(filter-out $(single-targets), $(MAKECMDGOALS)),)
+		mixed-build := 1
+	endif
+endif
+
 # For "make -j clean all", "make -j mrproper defconfig all", etc.
 ifneq ($(filter $(clean-targets),$(MAKECMDGOALS)),)
         ifneq ($(filter-out $(clean-targets),$(MAKECMDGOALS)),)
@@ -1655,7 +1668,7 @@ endif # KBUILD_EXTMOD
 PHONY += descend $(build-dirs)
 descend: $(build-dirs)
 $(build-dirs): prepare
-	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
+	$(Q)$(MAKE) $(build)=$@ single-build=$(single-build) need-builtin=1 need-modorder=1
 
 clean-dirs := $(addprefix _clean_, $(clean-dirs))
 PHONY += $(clean-dirs) clean
@@ -1752,40 +1765,50 @@ tools/%: FORCE
 
 # Single targets
 # ---------------------------------------------------------------------------
-# Single targets are compatible with:
-# - build with mixed source and output
-# - build with separate output dir 'make O=...'
-# - external modules
+# To build individual files in subdirectories, you can do like this:
+#
+#   make foo/bar/baz.s
 #
-#  target-dir => where to store outputfile
-#  build-dir  => directory in kernel source tree to use
-
-build-target = $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD)/)$@
-build-dir = $(patsubst %/,%,$(dir $(build-target)))
-
-%.i: prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
-%.ll: prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
-%.lst: prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
-%.o: prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
-%.s: prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
-%.symtypes: prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target)
+# The supported suffixes for single-target are listed in 'single-targets'
+#
+# To build only under specific subdirectories, you can do like this:
+#
+#   make foo/bar/baz/
+
+ifdef single-build
+
+single-all := $(filter $(single-targets), $(MAKECMDGOALS))
+
 ifeq ($(KBUILD_EXTMOD),)
-# For the single build of an in-tree module, use a temporary file to avoid
+# For the single build of in-tree modules, use a temporary file to avoid
 # the situation of modules_install installing an invalid modules.order.
-%.ko: MODORDER := .modules.tmp
+MODORDER := .modules.tmp
+else
+single-all := $(addprefix $(KBUILD_EXTMOD)/, $(single-all)))
 endif
-%.ko: prepare FORCE
-	$(Q)$(MAKE) $(build)=$(build-dir) $(build-target:.ko=.mod)
-	$(Q)echo $(build-target) > $(MODORDER)
+
+# .ko is special because modpost is needed
+single-ko := $(sort $(filter %.ko, $(single-all)))
+single-non-ko := $(sort $(patsubst %.ko,%.mod, $(single-all)))
+
+$(single-ko): single_modpost
+	@:
+
+PHONY += single_modpost
+single_modpost: $(single-non-ko)
+	$(Q){ $(foreach m, $(single-ko), echo $m;) } > $(MODORDER)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-%/: prepare FORCE
-	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir) need-modorder=1
+
+KBUILD_MODULES := 1
+
+$(single-non-ko): descend
+	@:
+
+export KBUILD_SINGLE_TARGETS := $(single-non-ko)
+
+single-build = $(if $(filter-out $@/, $(single-non-ko)),1)
+
+endif
 
 # FIXME Should go into a make.lib or something
 # ===========================================================================
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3633558f7861..5e58db1d01b2 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -52,7 +52,7 @@ ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
 
-ifeq ($(MAKECMDGOALS)$(need-modorder),)
+ifeq ($(need-modorder),)
 ifneq ($(obj-m),)
 $(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
 $(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
@@ -76,11 +76,6 @@ endif
 
 mod-targets := $(patsubst %.o, %.mod, $(obj-m))
 
-__build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
-	 $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
-	 $(subdir-ym) $(always)
-	@:
-
 # Linus' kernel sanity checking tool
 ifeq ($(KBUILD_CHECKSRC),1)
   quiet_cmd_checksrc       = CHECK   $<
@@ -487,12 +482,50 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 	   $(call intermediate_targets, .lex.o, .lex.c) \
 	   $(call intermediate_targets, .tab.o, .tab.c .tab.h)
 
+# Build
+# ---------------------------------------------------------------------------
+
+ifdef single-build
+
+curdir-single := $(sort $(foreach x, $(KBUILD_SINGLE_TARGETS), \
+			$(if $(filter $(x) $(basename $(x)).o, $(targets)), $(x))))
+
+# Handle single targets without any rule: show "Nothing to be done for ..." or
+# "No rule to make target ..." depending on whether the target exists.
+unknown-single := $(filter-out $(addsuffix /%, $(subdir-ym)), \
+			$(filter $(obj)/%, \
+				$(filter-out $(curdir-single), \
+					$(KBUILD_SINGLE_TARGETS))))
+
+__build: $(curdir-single) $(subdir-ym)
+ifneq ($(unknown-single),)
+	$(Q)$(MAKE) -f /dev/null $(unknown-single)
+endif
+	@:
+
+ifeq ($(curdir-single),)
+# Nothing to do in this directory. Do not include any .*.cmd file for speed-up
+targets :=
+else
+targets += $(curdir-single)
+endif
+
+else
+
+__build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
+	 $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
+	 $(subdir-ym) $(always)
+	@:
+
+endif
+
 # Descending
 # ---------------------------------------------------------------------------
 
 PHONY += $(subdir-ym)
 $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
+	$(if $(filter $@/, $(KBUILD_SINGLE_TARGETS)),single-build=) \
 	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1) \
 	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
 
-- 
2.17.1

