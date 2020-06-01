Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924B01E9DA1
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgFAF5w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:57:52 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39162 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgFAF5w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:52 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLf023694;
        Mon, 1 Jun 2020 14:57:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLf023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991057;
        bh=2NyQ73uu1UeT6pnuaHd0e+s75GD37BsDSG29svWi8HY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YoNGDuwdo9y7YKfTkD97kxT7o2v8593fNSNm3njllQACm2fVh8SwRCd6BEifWsA3G
         G1wxfXqA8vwEPzCEojkqVsYJ2vJ/bVIi31Nvf/+QlMCs28JFN4+ujWYkPEckMAeNrl
         5gGsGjcdinSQbASmZz/hqB8dtJ5ReXivG4W5WQo2J62fVuqzCPoy93CzlNHbd+yLxn
         oZYj1WoPQGcE3DpkmEmc/E0WDKycLx0rWTgNoxD0+Ugz8Dl20wY9nopyQD2WRypexC
         utzgL6no+gWostonUdqbjzQV8FCeg6hnnjJ9bHQuzzg3d87HFpV/y2/sMGtqU0LxOy
         YwtN74uC/jaVQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/37] kbuild: refactor tagets caluculation for KBUILD_{BUILTIN,KBUILD_MODULES}
Date:   Mon,  1 Jun 2020 14:56:56 +0900
Message-Id: <20200601055731.3006266-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove lib-target, builtin-target, modorder-target, and modtargets.

Instead, add targets-for-builtin and targets-for-modules.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ee9a817e19a3..a1f09bec8c70 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -73,19 +73,24 @@ endif
 subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
 subdir-modorder := $(sort $(filter %/modules.order, $(modorder)))
 
+targets-for-builtin := $(extra-y)
+
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
-lib-target := $(obj)/lib.a
+targets-for-builtin += $(obj)/lib.a
 endif
 
 ifdef need-builtin
-builtin-target := $(obj)/built-in.a
+targets-for-builtin += $(obj)/built-in.a
 endif
 
+targets-for-modules := $(obj-m)
+targets-for-modules += $(patsubst %.o, %.mod, $(obj-m))
+
 ifdef need-modorder
-modorder-target := $(obj)/modules.order
+targets-for-modules += $(obj)/modules.order
 endif
 
-mod-targets := $(patsubst %.o, %.mod, $(obj-m))
+targets += $(targets-for-builtin) $(targets-for-modules)
 
 # Linus' kernel sanity checking tool
 ifeq ($(KBUILD_CHECKSRC),1)
@@ -284,8 +289,6 @@ cmd_mod = { \
 $(obj)/%.mod: $(obj)/%.o FORCE
 	$(call if_changed,mod)
 
-targets += $(mod-targets)
-
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
 		     $(CONFIG_SHELL) $(srctree)/scripts/makelst $*.o \
@@ -359,7 +362,7 @@ $(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
 	$(call if_changed_rule,as_o_S)
 
 targets += $(filter-out $(subdir-builtin), $(real-obj-y)) $(real-obj-m) $(lib-y)
-targets += $(extra-y) $(always-y) $(MAKECMDGOALS)
+targets += $(always-y) $(MAKECMDGOALS)
 
 # Linker scripts preprocessor (.lds.S -> .lds)
 # ---------------------------------------------------------------------------
@@ -396,8 +399,6 @@ quiet_cmd_ar_builtin = AR      $@
 $(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
 
-targets += $(builtin-target)
-
 #
 # Rule to create modules.order file
 #
@@ -414,8 +415,6 @@ $(obj)/modules.order: $(subdir-modorder) FORCE
 $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
-targets += $(lib-target)
-
 # NOTE:
 # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
 # module is turned into a multi object module, $^ will contain header file
@@ -478,8 +477,8 @@ endif
 
 else
 
-__build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
-	 $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
+__build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
+	 $(if $(KBUILD_MODULES), $(targets-for-modules)) \
 	 $(subdir-ym) $(always-y)
 	@:
 
-- 
2.25.1

