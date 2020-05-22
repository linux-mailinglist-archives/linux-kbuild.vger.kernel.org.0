Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13211DDCE6
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 04:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgEVCAf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 22:00:35 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:37246 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgEVCA1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 22:00:27 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 04M205Ua009585;
        Fri, 22 May 2020 11:00:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 04M205Ua009585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590112811;
        bh=56NMTqyBQgUoiCLp6nRjIb1YOCB6X+MUoUS2aIs4bik=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kr5fh0dd0lz9MF50U0dJibt1MHplEC+QYycX5i/iDlKM3sXdcO5XMJ5o8ytyiXGXX
         zxVgAbXbR9a6DfsF60WzcXlK6+lFkWBriYk3aGiicliEqdMPTXdIRPXBsKdcJSW/wu
         UvMUnCLTyVml71l/J1YbBhV+LPX+65vJ0imthRMRWeJEFCIG5MB5pPiw2vAd7KqlwZ
         OAcqzGv3tIPhd/agbAFokiUUi8Ir/5uaDzmfmxAoFs3H97dAgjCuJZ9lMnsOKShXaG
         Wj+Tb+cEir/meL16bmswTVHpfYM2OEyOxgWij1UpPexfdu6wyE8ylYcDudkXyIEVQW
         tiws5qoMWPeJg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] kbuild: rename subdir-obj-y to subdir-builtin
Date:   Fri, 22 May 2020 11:00:01 +0900
Message-Id: <20200522020002.504506-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
References: <20200522020002.504506-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I think subdir-builtin is clearer.

While I was here, I made its build rule explicit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ee283efc1b45..323264607b9f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,7 +69,8 @@ endif
 
 # ===========================================================================
 
-subdir-obj-y := $(filter %/built-in.a, $(real-obj-y))
+# subdir-builtin may contain duplications. Use $(sort ...)
+subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
 lib-target := $(obj)/lib.a
@@ -356,7 +357,7 @@ endif
 $(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
 	$(call if_changed_rule,as_o_S)
 
-targets += $(filter-out $(subdir-obj-y), $(real-obj-y)) $(real-obj-m) $(lib-y)
+targets += $(filter-out $(subdir-builtin), $(real-obj-y)) $(real-obj-m) $(lib-y)
 targets += $(extra-y) $(always-y) $(MAKECMDGOALS)
 
 # Linker scripts preprocessor (.lds.S -> .lds)
@@ -381,7 +382,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 # ---------------------------------------------------------------------------
 
 # To build objects in subdirs, we need to descend into the directories
-$(obj)/%/built-in.a: $(obj)/% ;
+$(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
@@ -489,7 +490,7 @@ PHONY += $(subdir-ym)
 $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	$(if $(filter $@/, $(KBUILD_SINGLE_TARGETS)),single-build=) \
-	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1) \
+	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
 	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
-- 
2.25.1

