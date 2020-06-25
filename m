Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2388620A399
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 19:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406413AbgFYRFO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jun 2020 13:05:14 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:51073 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404524AbgFYRFN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 13:05:13 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 05PH4apJ005239;
        Fri, 26 Jun 2020 02:04:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 05PH4apJ005239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593104680;
        bh=hsy2jEcguFBbAwWPOzrHlA0rVfoIakAEVTOhQL5WWjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WbHigNnte5CSbikVGUFPeliUyTPT3GRCm5FsAIbbeR39Z9izKsKAEnEGdE5iBevgc
         IBemTKdtJf1dC1X8WYluHt26gBZHzP1Y8t+QNr6v6RTsKcISkOLy6h8ThC5IdyinIX
         fdO6ylOehgLhyHBswZo3ni7WuqVoAo1iXNmPzH+X7LUF05P2nvHJHU6yokUfen4UHB
         lNJj5F9+g5gHgDvtAUgZeQMxsZ5Xsa9BYF5+aN1YTlttvO9ZBZ52Tmr3d4J+6RhUBx
         PRH43Ng1ZY9f6gJj5VGW1OTs9i+g3Pa1pg6bStdefJKIG3NZt7WSTb3248vI/MRSvq
         bwiRu7iGWU4uQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Frank Rowand <frowand.list@gmail.com>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: split DT schema check rules
Date:   Fri, 26 Jun 2020 02:04:34 +0900
Message-Id: <20200625170434.635114-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200625170434.635114-1-masahiroy@kernel.org>
References: <20200625170434.635114-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building %.dt.yaml from %.dts, two things happen in a row:

 [1] Run DTC to convert %.dts into %.dt.yaml

 [2] Run dt-validate against %.dt.yaml

Currently, when any .yaml schema file is updated, processed-schema.yaml
is regenerated, then both [1] and [2] are rerun for all .dts files.

Actually, we do not need to rerun [1] since the original .dts is not
updated.

Split the rule to avoid unneeded .dts/.dt.yaml conversion.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .gitignore                                 |  1 +
 Documentation/devicetree/bindings/Makefile |  4 ++--
 Makefile                                   |  2 +-
 scripts/Makefile.build                     |  2 ++
 scripts/Makefile.lib                       | 24 ++++++++++------------
 5 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/.gitignore b/.gitignore
index 87b9dd8a163b..a1941faf7233 100644
--- a/.gitignore
+++ b/.gitignore
@@ -16,6 +16,7 @@
 *.bin
 *.bz2
 *.c.[012]*.*
+*.dt.checked
 *.dt.yaml
 *.dtb
 *.dtb.S
diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 6aac57588e66..b46910eb7cf4 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -62,11 +62,11 @@ $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) check_dtschema_version FORCE
 endif
 
 extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
-extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
+extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.checked, $(DT_SCHEMA_FILES))
 extra-$(CHECK_DT_BINDING) += processed-schema-examples.yaml
 extra-$(CHECK_DTBS) += processed-schema.yaml
 
 # Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
 # build artifacts here before they are processed by scripts/Makefile.clean
 clean-files = $(shell find $(obj) \( -name '*.example.dts' -o \
-			-name '*.example.dt.yaml' \) -delete 2>/dev/null)
+			-name '*.example.dt.checked' \) -delete 2>/dev/null)
diff --git a/Makefile b/Makefile
index ac2c61c37a73..0fc778b656d1 100644
--- a/Makefile
+++ b/Makefile
@@ -1774,7 +1774,7 @@ clean: $(clean-dirs)
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name '*.asn1.[ch]' \
 		-o -name '*.symtypes' -o -name 'modules.order' \
-		-o -name '.tmp_*.o.*' \
+		-o -name '.tmp_*.o.*' -o -name '*.dt.checked' \
 		-o -name '*.c.[012]*.*' \
 		-o -name '*.ll' \
 		-o -name '*.gcno' \) -type f -print | xargs rm -f
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2e8810b7e5ed..ca24c3077fef 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -442,10 +442,12 @@ intermediate_targets = $(foreach sfx, $(2), \
 					$(filter %$(strip $(1)), $(targets))))
 # %.asn1.o <- %.asn1.[ch] <- %.asn1
 # %.dtb.o <- %.dtb.S <- %.dtb <- %.dts
+# %.dt.checked <- %.dt.yaml <- %.dts
 # %.lex.o <- %.lex.c <- %.l
 # %.tab.o <- %.tab.[ch] <- %.y
 targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
 	   $(call intermediate_targets, .dtb.o, .dtb.S .dtb) \
+	   $(call intermediate_targets, .dt.checked, .dt.yaml) \
 	   $(call intermediate_targets, .lex.o, .lex.c) \
 	   $(call intermediate_targets, .tab.o, .tab.c .tab.h)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index fa5022133a25..d72a7cf79f63 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -74,8 +74,8 @@ extra-y				+= $(dtb-y)
 extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
 
 ifneq ($(CHECK_DTBS),)
-extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
-extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
+extra-y += $(patsubst %.dtb,%.dt.checked, $(dtb-y))
+extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.checked, $(dtb-))
 endif
 
 # Add subdir path
@@ -308,26 +308,24 @@ cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
+dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
+
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
+$(obj)/%.dt.yaml: $(src)/%.dts $(DTC) FORCE
+	$(call if_changed_dep,dtc)
+
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
 # DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
 DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
 
-quiet_cmd_dtb_check =	CHECK   $@
-      cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
+quiet_cmd_dt_check = CHECK   $<
+      cmd_dt_check = $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $<; touch $@
 
-define rule_dtc
-	$(call cmd_and_fixdep,dtc)
-	$(call cmd,dtb_check)
-endef
-
-$(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_rule,dtc,yaml)
-
-dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
+$(obj)/%.dt.checked: $(obj)/%.dt.yaml $(DT_TMP_SCHEMA) FORCE
+	$(call if_changed,dt_check)
 
 # Bzip2
 # ---------------------------------------------------------------------------
-- 
2.25.1

