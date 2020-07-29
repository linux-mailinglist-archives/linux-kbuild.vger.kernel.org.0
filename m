Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793852317FC
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 05:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgG2DQs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 Jul 2020 23:16:48 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:63692 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgG2DQs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Jul 2020 23:16:48 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 06T3Fi04000857;
        Wed, 29 Jul 2020 12:15:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 06T3Fi04000857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595992544;
        bh=Ez4pjpjvvIf+iOFLJFngv++ZRsHADJifki9W/RGZoc4=;
        h=From:To:Cc:Subject:Date:From;
        b=f8pOiQdRUX+cSusv4eK2PG62/n0Xu+xTyUHSrNAnrnXNo2v/GNZtz+J3k8kpIKpgX
         nhrhcN2p41k92GNLtnpCFdYvAZNIksDandTnSM3Ltxjp3wKhUb5H1LXZCD0+j6MoXl
         98D2T8L6j8HSj6Un1yZpsIPJgn1h0W76a+GhdH+ZQhU1ENQuMfQ0IdxH7/vinlxpxC
         n/hqLFEeWnXysyYLxyUc/R+MxQ3qAmXyj0aX4peZ+nlbX/RZGtWS+CJ1A6jk2ofMS0
         kDgRHmKmT9QYbJwIOD5N5JUi8gzRvdlhzA+HwCkfeqRehhPaLIKUnDFgmrQH3f5ddW
         zMB8Prlyi+LBQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: move shared library build rules to scripts/gcc-plugins/Makefile
Date:   Wed, 29 Jul 2020 12:15:36 +0900
Message-Id: <20200729031537.37926-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The shared library build rules are currently implemented in
scripts/Makefile.host, but actually GCC-plugin is the only user of
them. Hence, they do not need to be treewide available.

Move all the relevant build rules to scripts/gcc-plugins/Makefile.

I also optimized the build steps so *.so is directly built from .c
because every upstream plugin is compiled from a single source file.

I am still keeping the infrastructure to build a plugin from multiple
files because Kees suggested to do so in my previous attempt.
(https://lkml.org/lkml/2019/1/11/1107)

If the plugin, foo.so, is compiled from two files foo.c and foo2.c,
then you can do like follows:

  foo-objs := foo.o foo2.o

Single-file plugins do not need the *-objs notation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build       |  4 +--
 scripts/Makefile.clean       |  3 +-
 scripts/Makefile.host        | 30 ++----------------
 scripts/gcc-plugins/Makefile | 61 +++++++++++++++++++++++++++++-------
 4 files changed, 55 insertions(+), 43 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2e8810b7e5ed..d41c1cd453b9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -45,8 +45,8 @@ include $(kbuild-file)
 
 include scripts/Makefile.lib
 
-# Do not include host rules unless needed
-ifneq ($(hostprogs)$(hostcxxlibs-y)$(hostcxxlibs-m),)
+# Do not include hostprogs rules unless needed
+ifneq ($(hostprogs),)
 include scripts/Makefile.host
 endif
 
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index e2c76122319d..3cdf31218198 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -29,8 +29,7 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
 
 __clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
 		   $(always) $(always-y) $(always-m) $(always-) $(targets) $(clean-files)   \
-		   $(hostprogs) $(hostprogs-y) $(hostprogs-m) $(hostprogs-) $(userprogs) \
-		   $(hostcxxlibs-y) $(hostcxxlibs-m)
+		   $(hostprogs) $(hostprogs-y) $(hostprogs-m) $(hostprogs-) $(userprogs)
 
 __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
 
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c8a4a033dc3e..687ca3f309e9 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -39,7 +39,6 @@ $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
 # They are linked as C++ code to the executable qconf
 
 __hostprogs := $(sort $(hostprogs))
-host-cxxshlib := $(sort $(hostcxxlibs-y) $(hostcxxlibs-m))
 
 # C code
 # Executables compiled from a single .c file
@@ -61,16 +60,11 @@ host-cxxmulti	:= $(foreach m,$(__hostprogs),$(if $($(m)-cxxobjs),$(m)))
 # C++ Object (.o) files compiled from .cc files
 host-cxxobjs	:= $(sort $(foreach m,$(host-cxxmulti),$($(m)-cxxobjs)))
 
-# Object (.o) files used by the shared libaries
-host-cxxshobjs	:= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-objs))))
-
 host-csingle	:= $(addprefix $(obj)/,$(host-csingle))
 host-cmulti	:= $(addprefix $(obj)/,$(host-cmulti))
 host-cobjs	:= $(addprefix $(obj)/,$(host-cobjs))
 host-cxxmulti	:= $(addprefix $(obj)/,$(host-cxxmulti))
 host-cxxobjs	:= $(addprefix $(obj)/,$(host-cxxobjs))
-host-cxxshlib	:= $(addprefix $(obj)/,$(host-cxxshlib))
-host-cxxshobjs	:= $(addprefix $(obj)/,$(host-cxxshobjs))
 
 #####
 # Handle options to gcc. Support building with separate output directory
@@ -136,25 +130,5 @@ quiet_cmd_host-cxxobjs	= HOSTCXX $@
 $(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
 	$(call if_changed_dep,host-cxxobjs)
 
-# Compile .c file, create position independent .o file
-# Note that plugin capable gcc versions can be either C or C++ based
-# therefore plugin source files have to be compilable in both C and C++ mode.
-# This is why a C++ compiler is invoked on a .c file.
-# host-cxxshobjs -> .o
-quiet_cmd_host-cxxshobjs	= HOSTCXX -fPIC $@
-      cmd_host-cxxshobjs	= $(HOSTCXX) $(hostcxx_flags) -fPIC -c -o $@ $<
-$(host-cxxshobjs): $(obj)/%.o: $(src)/%.c FORCE
-	$(call if_changed_dep,host-cxxshobjs)
-
-# Link a shared library, based on position independent .o files
-# *.o -> .so shared library (host-cxxshlib)
-quiet_cmd_host-cxxshlib	= HOSTLLD -shared $@
-      cmd_host-cxxshlib	= $(HOSTCXX) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
-			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
-$(host-cxxshlib): FORCE
-	$(call if_changed,host-cxxshlib)
-$(call multi_depend, $(host-cxxshlib), .so, -objs)
-
-targets += $(host-csingle)  $(host-cmulti) $(host-cobjs)\
-	   $(host-cxxmulti) $(host-cxxobjs) $(host-cxxshlib) $(host-cxxshobjs)
+targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
+	   $(host-cxxmulti) $(host-cxxobjs)
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index 4014ba7e2fbd..d66949bfeba4 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -1,22 +1,61 @@
 # SPDX-License-Identifier: GPL-2.0
-GCC_PLUGINS_DIR := $(shell $(CC) -print-file-name=plugin)
 
-HOST_EXTRACXXFLAGS += -I$(GCC_PLUGINS_DIR)/include -I$(src) -std=gnu++98 -fno-rtti
-HOST_EXTRACXXFLAGS += -fno-exceptions -fasynchronous-unwind-tables -ggdb
-HOST_EXTRACXXFLAGS += -Wno-narrowing -Wno-unused-variable -Wno-c++11-compat
-HOST_EXTRACXXFLAGS += -Wno-format-diag
-
-$(obj)/randomize_layout_plugin.o: $(objtree)/$(obj)/randomize_layout_seed.h
+$(obj)/randomize_layout_plugin.so: $(objtree)/$(obj)/randomize_layout_seed.h
 quiet_cmd_create_randomize_layout_seed = GENSEED $@
 cmd_create_randomize_layout_seed = \
   $(CONFIG_SHELL) $(srctree)/$(src)/gen-random-seed.sh $@ $(objtree)/include/generated/randomize_layout_hash.h
 $(objtree)/$(obj)/randomize_layout_seed.h: FORCE
 	$(call if_changed,create_randomize_layout_seed)
-targets = randomize_layout_seed.h randomize_layout_hash.h
+targets += randomize_layout_seed.h randomize_layout_hash.h
+
+# Build rules for plugins
+#
+# No extra code is needed for single-file plugins.
+# For multi-file plugins, use *-objs syntax to list the objects.
+#
+# If the plugin foo.so is compiled from foo.c and foo2.c, you can do:
+#
+# foo-objs := foo.o foo2.o
+
+always-y += $(GCC_PLUGIN)
 
-hostcxxlibs-y := $(GCC_PLUGIN)
-always-y := $(hostcxxlibs-y)
+GCC_PLUGINS_DIR = $(shell $(CC) -print-file-name=plugin)
 
-$(foreach p,$(hostcxxlibs-y:%.so=%),$(eval $(p)-objs := $(p).o))
+plugin_cxxflags	= -Wp,-MMD,$(depfile) $(KBUILD_HOSTCXXFLAGS) -fPIC \
+		   -I $(GCC_PLUGINS_DIR)/include -I $(obj) -std=gnu++98 \
+		   -fno-rtti -fno-exceptions -fasynchronous-unwind-tables \
+		   -ggdb -Wno-narrowing -Wno-unused-variable -Wno-c++11-compat \
+		   -Wno-format-diag
 
+plugin_ldflags	= -shared
+
+plugin-single	:= $(foreach m, $(GCC_PLUGIN), $(if $($(m:%.so=%-objs)),,$(m)))
+plugin-multi	:= $(filter-out $(plugin-single), $(GCC_PLUGIN))
+plugin-objs	:= $(sort $(foreach m, $(plugin-multi), $($(m:%.so=%-objs))))
+
+targets += $(plugin-single) $(plugin-multi) $(plugin-objs)
 clean-files += *.so
+
+plugin-single	:= $(addprefix $(obj)/, $(plugin-single))
+plugin-multi	:= $(addprefix $(obj)/, $(plugin-multi))
+plugin-objs	:= $(addprefix $(obj)/, $(plugin-objs))
+
+quiet_cmd_plugin_cxx_so_c = HOSTCXX $@
+      cmd_plugin_cxx_so_c = $(HOSTCXX) $(plugin_cxxflags) $(plugin_ldflags) -o $@ $<
+
+$(plugin-single): $(obj)/%.so: $(src)/%.c FORCE
+	$(call if_changed_dep,plugin_cxx_so_c)
+
+quiet_cmd_plugin_ld_so_o = HOSTLD  $@
+      cmd_plugin_ld_so_o = $(HOSTCXX) $(plugin_ldflags) -o $@ \
+			   $(addprefix $(obj)/, $($(target-stem)-objs))
+
+$(plugin-multi): FORCE
+	$(call if_changed,plugin_ld_so_o)
+$(foreach m, $(notdir $(plugin-multi)), $(eval $(obj)/$m: $(addprefix $(obj)/, $($(m:%.so=%-objs)))))
+
+quiet_cmd_plugin_cxx_o_c = HOSTCXX $@
+      cmd_plugin_cxx_o_c = $(HOSTCXX) $(plugin_cxxflags) -c -o $@ $<
+
+$(plugin-objs): $(obj)/%.o: $(src)/%.c FORCE
+	$(call if_changed_dep,plugin_cxx_o_c)
-- 
2.25.1

