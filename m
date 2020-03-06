Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 047CE17C3C7
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2020 18:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgCFRJC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Mar 2020 12:09:02 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:31050 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgCFRJB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 12:09:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 026H8r3Y022896;
        Sat, 7 Mar 2020 02:08:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 026H8r3Y022896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583514535;
        bh=6guOWuBDvMw4PWtQqkZ3oG+qxRjsz1p8ylustGTOkRc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hKtYra30kFqdKeNcrhQ5uWZO+Iq4r9PNT5s5gQUO340oYIRCi75X1EU8mg/9bND4n
         v9EyO9JOaNbQqr6Ejf4ttA8VdWf6YfRHjpbeIIX4y3ZbcJkHjpM7aZsfx1M8LMUF2N
         arBCL4Pv9iaoRNiG4IPictaFdf/cyXhlbyJUmhqx1io/KaZZq1fEoPOzciycyPuHY4
         IyqIMFvyVTOO6FQeFbIJV2XSOHayW0i7kcPynW2kx1EJzCujeAypsJhsMwvSMHyuXt
         8ezBXPfPBbcz/ygac5N5E9tbIZTQCVRabS8N3e7YQ8qoKBYyYZTm5Ps2VyFYyJKn65
         wfxvzK04L/4MQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/2] kbuild: refactor Makefile.dtbinst more
Date:   Sat,  7 Mar 2020 02:08:52 +0900
Message-Id: <20200306170852.17798-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306170852.17798-1-masahiroy@kernel.org>
References: <20200306170852.17798-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Refactor Makefile.dtbinst so it looks similar to other Makefiles.

*.dtb should not be a phony target. Copy files based on the timestamps.
Print installed dtb paths instead of in-kernel dtb paths.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.dtbinst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index fcd5f2eaaad1..50d580d77ae9 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -17,20 +17,20 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 include $(src)/Makefile
 
-dtbinst-files	:= $(sort $(dtb-y) $(if $(CONFIG_OF_ALL_DTBS), $(dtb-)))
-dtbinst-dirs	:= $(subdir-y) $(subdir-m)
+dtbs    := $(addprefix $(dst)/, $(dtb-y) $(if $(CONFIG_OF_ALL_DTBS),$(dtb-)))
+subdirs := $(addprefix $(obj)/, $(subdir-y) $(subdir-m))
 
-# Helper targets for Installing DTBs into the boot directory
-quiet_cmd_dtb_install =	INSTALL $<
-      cmd_dtb_install =	mkdir -p $(2); cp $< $(2)
+__dtbs_install: $(dtbs) $(subdirs)
+	@:
 
-$(dtbinst-files): %.dtb: $(obj)/%.dtb
-	$(call cmd,dtb_install,$(dst))
+quiet_cmd_dtb_install = INSTALL $@
+      cmd_dtb_install = install -D $< $@
 
-$(dtbinst-dirs):
-	$(Q)$(MAKE) $(dtbinst)=$(obj)/$@ dst=$(dst)/$@
+$(dst)/%.dtb: $(obj)/%.dtb
+	$(call cmd,dtb_install)
 
-PHONY += $(dtbinst-files) $(dtbinst-dirs)
-__dtbs_install: $(dtbinst-files) $(dtbinst-dirs)
+PHONY += $(subdirs)
+$(subdirs):
+	$(Q)$(MAKE) $(dtbinst)=$@ dst=$(patsubst $(obj)/%,$(dst)/%,$@)
 
 .PHONY: $(PHONY)
-- 
2.17.1

