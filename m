Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC2E01DDCE8
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 04:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgEVCAg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 22:00:36 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:37245 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgEVCA1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 22:00:27 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 04M205Ub009585;
        Fri, 22 May 2020 11:00:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 04M205Ub009585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590112812;
        bh=kUNk2puxOGw5wB6h/50k6NCD7EdqXzokmtBZWpGX3kU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GEvh72F6vCfk9Qpnz+y19ou/fXPdiqLm15Rg3npELcvNn7sL+87u5IF/4UiVXiAMF
         MCTUEY5jH7mex02opwJ5CzCe4ZFKdQC4/8GUTM+5PQJQdk7gkIQ7h2Haf6wK87knP6
         j6GANuq9nUKf05i/wk0dN8mVHJ6zA83y0a9ILclu4wYhfBSRXdtbFqdCd5a0Vsjh/1
         THxMg+m+PGFGlca7yrgyKJWoSOaAc9QWoWkm48XoXAbTjXckU8zwpA5I83m/P1jPzA
         jmRVP3AV7Iev3h1ZljxtITs0ey8nk9/dV+bsyIqYUDcUc893dgsOhzIYhASbBKmWfY
         Pi0aAo2zmbxMA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] kbuild: make modules.order rule consistent with built-in.a
Date:   Fri, 22 May 2020 11:00:02 +0900
Message-Id: <20200522020002.504506-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
References: <20200522020002.504506-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

built-in.a contains the built-in object paths from the current and sub
directories.

module.order collects the module paths from the current and sub
directories.

Make their build rules look more symmetrical.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 10 ++++++----
 scripts/Makefile.lib   |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 323264607b9f..ee9a817e19a3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,8 +69,9 @@ endif
 
 # ===========================================================================
 
-# subdir-builtin may contain duplications. Use $(sort ...)
+# subdir-builtin and subdir-modorder may contain duplications. Use $(sort ...)
 subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
+subdir-modorder := $(sort $(filter %/modules.order, $(modorder)))
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
 lib-target := $(obj)/lib.a
@@ -383,6 +384,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 
 # To build objects in subdirs, we need to descend into the directories
 $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
+$(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
@@ -401,9 +403,9 @@ targets += $(builtin-target)
 #
 # Create commands to either record .ko file or cat modules.order from
 # a subdirectory
-$(modorder-target): $(subdir-ym) FORCE
+$(obj)/modules.order: $(subdir-modorder) FORCE
 	$(Q){ $(foreach m, $(modorder), \
-	$(if $(filter %/modules.order, $m), cat $m, echo $m);) :; } \
+	$(if $(filter $^, $m), cat $m, echo $m);) :; } \
 	| $(AWK) '!x[$$0]++' - > $@
 
 #
@@ -491,7 +493,7 @@ $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	$(if $(filter $@/, $(KBUILD_SINGLE_TARGETS)),single-build=) \
 	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
-	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
+	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index a41a4bbd20e2..0d931cc0df94 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -35,7 +35,9 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # Determine modorder.
 # Unfortunately, we don't have information about ordering between -y
 # and -m subdirs.  Just put -y's first.
+ifdef need-modorder
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
+endif
 
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
-- 
2.25.1

