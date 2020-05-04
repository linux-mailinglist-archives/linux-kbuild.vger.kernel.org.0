Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3BF1C3147
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2020 04:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgEDCIF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 May 2020 22:08:05 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:57012 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgEDCIF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 May 2020 22:08:05 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 04427232006107;
        Mon, 4 May 2020 11:07:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 04427232006107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588558024;
        bh=WeswAB51SaOHtDRISMVN7runuANP8prxx1ES6IBM9DI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OX22F3GSyXJSv+UrwHKi1Ob3kwrHUSbEsAlu9YExldDDqvgCZjxNcAoLHvHLxmCu6
         iD+UmXCdhOymLkAQgR67hi9clHFsi2uaSmyOjNEUJK8f02O1j8ow0g4GUUiTqo3qf4
         P6hV+899mrs5HWEYtaZj08PoF7QQ40WVD75biLE4WjCkHkd9rvg+ujT2HWjkF8PZ/p
         71EekpvyEjOEdmRar9rd+EB3bAZNrWFRLligKwlQFcHh9eaevUQI2Kyv4n8mrkQrER
         utfBFVZ5qnTV0Fvl38OQPKoGpfFuFk2TaSXPmOkbtjN+Lni34VRg1cSy7MarNqvwt/
         bDcCd8u5ZBpAg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=8F=AB=E2n?= <marek.behun@nic.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/2] scripts/dtc: compile separate dtc-yaml
Date:   Mon,  4 May 2020 11:06:51 +0900
Message-Id: <20200504020651.37031-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504020651.37031-1-masahiroy@kernel.org>
References: <20200504020651.37031-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Marek Behún reported a case where pkg-config fails to detect the
libyaml-dev package, which is presumably a bug of the distro.

Irrespective of that, I am not a big fan of pkg-config in the Makefile
parse stage. The cost of pkg-config is quite small, but it is evaluated
everytime we run make, even when we do 'make mrproper'. This commit
changes the Makefile to not rely on pkg-config at all.

The normal build should not require libyaml-dev while we need to compile
dtc with libyaml for the schema check.

Build two dtc variants:

  scripts/dtc/dtc      for *.dts -> *.dtb
  scripts/dtc/dtc-yaml for *.dts -> *.dt.yaml

'make dtbs_check' or 'make dt_binding_check' without libyaml-dev installed
will fail like this:

  scripts/dtc/yamltree.c:9:10: fatal error: yaml.h: No such file or directory

I hope people will notice what to do.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib      |  9 +++++----
 scripts/dtc/.gitignore    |  1 +
 scripts/dtc/Makefile      | 28 +++++++++++-----------------
 scripts/dtc/dtc-no-yaml.c |  3 +++
 4 files changed, 20 insertions(+), 21 deletions(-)
 create mode 100644 scripts/dtc/dtc-no-yaml.c

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 8f9f2abf3d67..ca12412304b8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
 # DTC
 # ---------------------------------------------------------------------------
 DTC ?= $(objtree)/scripts/dtc/dtc
+DTC_YAML ?= $(objtree)/scripts/dtc/dtc-yaml
 
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
@@ -286,13 +287,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 
 __cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -O $(1) -o $@ -b 0 \
+	$(1) -O $(2) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
 quiet_cmd_dtc = DTC     $@
-      cmd_dtc = $(call __cmd_dtc,dtb)
+      cmd_dtc = $(call __cmd_dtc,$(DTC),dtb)
 
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
@@ -303,7 +304,7 @@ DT_BINDING_DIR := Documentation/devicetree/bindings
 DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
 
 quiet_cmd_dtc_yaml = DTCYAML $@
-      cmd_dtc_yaml = $(call __cmd_dtc,yaml)
+      cmd_dtc_yaml = $(call __cmd_dtc,$(DTC_YAML),yaml)
 
 quiet_cmd_dtb_check =	CHECK   $@
       cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
@@ -313,7 +314,7 @@ define rule_dtc_yaml
 	$(call cmd,dtb_check)
 endef
 
-$(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
+$(obj)/%.dt.yaml: $(src)/%.dts $(DTC_YAML) $(DT_TMP_SCHEMA) FORCE
 	$(call if_changed_rule,dtc_yaml)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index b814e6076bdb..e0cf8222c137 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 dtc
+dtc-yaml
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index ef85f8b7d4a7..c6d7e2b70f08 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -1,28 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0
 # scripts/dtc makefile
 
-hostprogs			:= dtc
-always-$(CONFIG_DTC)		+= $(hostprogs)
-always-$(CHECK_DT_BINDING)	+= $(hostprogs)
+# Build the yaml variant for DT schema validation, which requires libyaml
+# development package. The normal build does not need it.
+hostprogs			:= dtc dtc-yaml
+always-$(CONFIG_DTC)		+= dtc
+always-$(CHECK_DTBS)		+= dtc-yaml
+always-$(CHECK_DT_BINDING)	+= dtc-yaml
 
-dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
-		   srcpos.o checks.o util.o
-dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
+common-objs	:= flattree.o fstree.o data.o livetree.o treesource.o \
+		   srcpos.o checks.o util.o dtc-lexer.lex.o dtc-parser.tab.o
+dtc-objs	:= dtc-no-yaml.o $(common-objs)
+dtc-yaml-objs	:= dtc.o yamltree.o $(common-objs)
+HOSTLDLIBS_dtc-yaml := -lyaml
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS := -I $(srctree)/$(src)/libfdt
 
-ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
-ifneq ($(CHECK_DT_BINDING)$(CHECK_DTBS),)
-$(error dtc needs libyaml for DT schema validation support. \
-	Install the necessary libyaml development package.)
-endif
-HOST_EXTRACFLAGS += -DNO_YAML
-else
-dtc-objs	+= yamltree.o
-HOSTLDLIBS_dtc	:= $(shell pkg-config yaml-0.1 --libs)
-endif
-
 # Generated files need one more search path to include headers in source tree
 HOSTCFLAGS_dtc-lexer.lex.o := -I $(srctree)/$(src)
 HOSTCFLAGS_dtc-parser.tab.o := -I $(srctree)/$(src)
diff --git a/scripts/dtc/dtc-no-yaml.c b/scripts/dtc/dtc-no-yaml.c
new file mode 100644
index 000000000000..f3459e45835f
--- /dev/null
+++ b/scripts/dtc/dtc-no-yaml.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#define NO_YAML
+#include "dtc.c"
-- 
2.25.1

