Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370971C3146
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2020 04:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgEDCH4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 May 2020 22:07:56 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:56759 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgEDCHz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 May 2020 22:07:55 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 04427231006107;
        Mon, 4 May 2020 11:07:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 04427231006107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588558023;
        bh=oaMGW1/qEkZaKrKPtO1Q3wMtc67yIIZ96GCpnMYOMWI=;
        h=From:To:Cc:Subject:Date:From;
        b=fhsnO+XzjKr541YIMSjKgZDWAN7VYRYu26943nLYwvQqt/cxpHEwlPQtDCypOc4xe
         o4pR5nQFTk5pK5k/gqttVOnNNbsxV4FeEvsSf9hVKyKZ7Gf37a3cOlayWPDhVomIGj
         Yx4EBAfHhuAWROke7mVhqptrRpf52VXplDZf3STOEzOSjxp+O8gB03neYRWrt0I+k2
         8enNhD3G4w/bKI8lTU2jDUq42egCAAQOpiN3ZEzo1Hh5lNvxL9xtu1YeKVsXW4LRim
         GxoxW+aSWH12VaripaRe3tglJnCMKVexVFuAplf0oseMkurdC21WHjaYLsB0O/Edp5
         KHBdXmbcZ3qyA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=8F=AB=E2n?= <marek.behun@nic.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 1/2] kbuild: use separate commands for generating *.dtb and *.dt.yaml
Date:   Mon,  4 May 2020 11:06:50 +0900
Message-Id: <20200504020651.37031-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
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

One visible change is, 'DTCYAML' is used for the log when compiling
*.dts to *.dt.yaml.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4b799737722c..8f9f2abf3d67 100644
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
 
+quiet_cmd_dtc_yaml = DTCYAML $@
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

