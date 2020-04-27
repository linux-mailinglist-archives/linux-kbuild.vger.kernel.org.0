Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C9D1BA600
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2020 16:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbgD0ONZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Apr 2020 10:13:25 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:27403 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbgD0ONY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 10:13:24 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 03RECrvY009532;
        Mon, 27 Apr 2020 23:12:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 03RECrvY009532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587996774;
        bh=FOhWk/2C4BQElgLGHxDcuBdPYjo5bjNEGcaVWTyWrf4=;
        h=From:To:Cc:Subject:Date:From;
        b=r6Nh2K7I968EgdDxVhHNMWyG/Qsn3f7ty2IWImfs39vwrIexzN6R5xCJH13NgDZzI
         CN6ewR2azl9/v8uw68JBp1lGlcSPZLyu+Blh5hxjVRhaexWV5d3X05c4ohHi5XHHLW
         MUPi4wLXB8lnyx9G5WrIW2hAW+Og7AT88hAdr9ncABmp0t72bggiX7IgCUhL+peZK0
         EMVxkgb/jepfPKK6JrinBDNIncwX6RukybLlfoRS+PACWh1ssxjSqEQOcHWQgzIucT
         bwQXBq46J+opvRuls19OSu+0maU/fTVz5yxwAAty4txatxVUs2rWQljCcxfyl6aaNk
         JHN/forfzh5fw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: determine the output format of DTC by the target suffix
Date:   Mon, 27 Apr 2020 23:12:51 +0900
Message-Id: <20200427141251.154129-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cmd_dtc takes the additional parameter $(2) to select the target
format, dtb or yaml. This makes things complicated when it is used
with cmd_and_fixdep and if_changed_rule. I actually stumbled on this.
See commit 3d4b2238684a ("kbuild: fix DT binding schema rule again to
avoid needless rebuilds").

Extract the suffix part of the target instead of passing the parameter.
Fortunately, this works for both $(obj)/%.dtb and $(obj)/%.dt.yaml .

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 12f6a331a8f3..cd52a8c6428f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -287,13 +287,13 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
 	$(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -O $(2) -o $@ -b 0 \
+	$(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
-	$(call if_changed_dep,dtc,dtb)
+	$(call if_changed_dep,dtc)
 
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
@@ -304,7 +304,7 @@ quiet_cmd_dtb_check =	CHECK   $@
       cmd_dtb_check =	$(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
 
 define rule_dtc
-	$(call cmd_and_fixdep,dtc,yaml)
+	$(call cmd_and_fixdep,dtc)
 	$(call cmd,dtb_check)
 endef
 
-- 
2.25.1

