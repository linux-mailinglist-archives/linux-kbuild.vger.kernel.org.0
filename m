Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2100791F82
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 10:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfHSI7N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 04:59:13 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:32643 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfHSI7N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 04:59:13 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x7J8wjPq004802;
        Mon, 19 Aug 2019 17:58:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x7J8wjPq004802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566205126;
        bh=BK4+KA9hkQRX71ZtGsOvnvCQcvimAXHBuU8rnK3+StM=;
        h=From:To:Cc:Subject:Date:From;
        b=PleXQs0O1Mt9Xdzlh7kiBiycGUzQ8AEvOPuxGYR0wbBNkUI5VNjyc7dYcERAw0nf3
         aMgkjbPFbN01NxuJ2HZSzu3CXRMv5VYK00zncP8mWw8ePoVlq2kPgz63qJyFnbMEzy
         /gNhlFB6HrT2Um2Jg8E3t5wj87aRZ863EMEbGn+UR1ybFcCySesZU70yyMvhjjDDiw
         m/YQrikyGo2bkUsIZXnb2+6+1c3Oq61731sh6usN5QB1M274ebWnN8TdW9gFGFogj+
         qJmog4SIoXRROOVmci/gBxhfrD7s4P3liW+xaVGEYE0jReXrWkBGRFJwZF1dEo8zpJ
         R5ND+o89KqcFQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: move modkern_{c,a}flags to Makefile.lib from Makefile.build
Date:   Mon, 19 Aug 2019 17:58:43 +0900
Message-Id: <20190819085843.3554-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Makefile.lib is included by Makefile.modfinal as well as Makefile.build.

Move modkern_cflags to Makefile.lib in order to simplify cmd_cc_o_c
in Makefile.modfinal. Move modkern_cflags as well for consistency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build    | 13 -------------
 scripts/Makefile.lib      | 12 ++++++++++++
 scripts/Makefile.modfinal |  6 +++---
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 10adf3b558de..b46e608f9931 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -92,15 +92,6 @@ endif
 # Compile C sources (.c)
 # ---------------------------------------------------------------------------
 
-# Default is built-in, unless we know otherwise
-part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
-
-modkern_cflags =                                          \
-	$(if $(part-of-module),                           \
-		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
-		$(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
-quiet_modtag = $(if $(part-of-module),[M],   )
-
 quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
       cmd_cc_s_c = $(CC) $(filter-out $(DEBUG_CFLAGS), $(c_flags)) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
 
@@ -304,10 +295,6 @@ $(obj)/%.h.s: $(src)/%.h FORCE
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 
-modkern_aflags = $(if $(part-of-module),				\
-			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
-			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
-
 # .S file exports must have their C prototypes defined in asm/asm-prototypes.h
 # or a file that it includes, in order to get versioned symbols. We build a
 # dummy C file that includes asm-prototypes and the EXPORT_SYMBOL lines from
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 264611972c4a..888e5c830646 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -159,6 +159,18 @@ _cpp_flags += -I $(srctree)/$(src) -I $(objtree)/$(obj)
 endif
 endif
 
+part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
+quiet_modtag = $(if $(part-of-module),[M],   )
+
+modkern_cflags =                                          \
+	$(if $(part-of-module),                           \
+		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
+		$(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
+
+modkern_aflags = $(if $(part-of-module),				\
+			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
+			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
+
 c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
 		 $(_c_flags) $(modkern_cflags)                           \
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 2e49d536a9b3..059dbcf5ae77 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -17,12 +17,12 @@ modules := $(sort $(shell cat $(MODORDER)))
 __modfinal: $(modules)
 	@:
 
-# modname is set to make c_flags define KBUILD_MODNAME
+# modname and part-of-module are set to make c_flags define proper module flags
 modname = $(notdir $(@:.mod.o=))
+part-of-module = y
 
 quiet_cmd_cc_o_c = CC [M]  $@
-      cmd_cc_o_c = $(CC) $(c_flags) $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE) \
-		   -c -o $@ $<
+      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
 
 %.mod.o: %.mod.c FORCE
 	$(call if_changed_dep,cc_o_c)
-- 
2.17.1

