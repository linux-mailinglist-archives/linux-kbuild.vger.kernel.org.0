Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95E021B1CF3
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 05:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgDUDgL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Apr 2020 23:36:11 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:52663 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgDUDgK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Apr 2020 23:36:10 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 03L3ZdWh001233;
        Tue, 21 Apr 2020 12:35:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 03L3ZdWh001233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587440140;
        bh=z+5DGjEAprgDxyLd7rZ+BckTVvQnx3Zz8y8zRWdf4rw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OwogK5ffXLUH4vGa7xHMEUhggPpcLZTYFpIyxwOCXNREHEGSGyTY0pTRl2yNd3Roh
         UQheeM+jfFg/f86aWzh0i9KfHWi97rNER07Jhxlc8tV3fm/kU+WUa6qCS1nfPIff1Z
         yFKlqZYRO+Z2GXul42VPXZJngOj2YEnDgeKP+Pp89+yz9CD/XnXAIpS5LDO+mLKZ8Y
         dYFExSxPy2Y/TS/M1ck9icbUD7xUYWdHf8/lfGUUcVKGwULjWPsbpBpZZRIYpoVOGs
         n+ruh3U4bIso6Kxg0PDI/MMzfnjBpaCbhywBRsC0c2vWgI0kxVOel3f3PrpTPTrw0L
         9fqjPTX5rBUrg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/2] kbuild: use separate commands for generating *.dtb and *.dt.yaml
Date:   Tue, 21 Apr 2020 12:35:29 +0900
Message-Id: <20200421033529.487366-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421033529.487366-1-masahiroy@kernel.org>
References: <20200421033529.487366-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, cmd_dtc takes $(2) to select the target format. The
additional parameter complicates things when it is used with
cmd_and_fixdep and if_changed_rule.

To make it easier to understand, use a separate cmd_dtc_yaml.

One visible change is, 'DTC [Y]' is used for the log when compiling
*.dts to *.dt.yaml.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4b799737722c..d5ac19e10e1d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -284,32 +284,37 @@ cmd_dt_S_dtb=						\
 $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 	$(call if_changed,dt_S_dtb)
 
-quiet_cmd_dtc = DTC     $@
-cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
+__cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -O $(2) -o $@ -b 0 \
+	$(DTC) -O $(1) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
+quiet_cmd_dtc = DTC     $@
+      cmd_dtc = $(call __cmd_dtc,dtb)
+
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
-	$(call if_changed_dep,dtc,dtb)
+	$(call if_changed_dep,dtc)
 
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
 # DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
 DT_TMP_SCHEMA ?= $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
 
+quiet_cmd_dtc_yaml = DTC [Y] $@
+      cmd_dtc_yaml = $(call __cmd_dtc,yaml)
+
 quiet_cmd_dtb_check =	CHECK   $@
       cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
 
-define rule_dtc
-	$(call cmd_and_fixdep,dtc,yaml)
+define rule_dtc_yaml
+	$(call cmd_and_fixdep,dtc_yaml)
 	$(call cmd,dtb_check)
 endef
 
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_rule,dtc,yaml)
+	$(call if_changed_rule,dtc_yaml)
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
-- 
2.25.1

