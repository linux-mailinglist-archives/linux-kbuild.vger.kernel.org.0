Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80EA6B12B6
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 18:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbfILQXQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Sep 2019 12:23:16 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42374 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730084AbfILQXK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 12:23:10 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8CGMu1d021030;
        Fri, 13 Sep 2019 01:22:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8CGMu1d021030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568305378;
        bh=425q+EI5prUG/76w/vzMZUodVpls78ES9Ka+fZC1U8Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fDc8man5VLLG93SfmFUxF2BcK8iikJO5UAmxbutIQC5+XCBt65sE38cTuXnLzBfLe
         gHt/HeBfMUTxTjiDlZ+hHHDiZLUbY01HZbl18o66yaFGD+z7MzK/R0iazfaIrjvwcF
         2N2VsAnIMo18pTdxPWNNTc9xNeB7gfTo/oLnUwY2If4shzFug59r8IvTnwrsBsqe49
         hCmxDc3ikTQtMbDSFYPWcpm0cUw0PY/vnTMcA2/g5VeuapOffOBr3GTQYods3JT0J9
         w1y44FppyDt0hYuAqG5Qkljnbhx8Nar2p2Xtsr/lPeEA+STcmzmSU0Dk5U/EMgYKM6
         vbwQ8lA8NGf7g==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] kbuild: change need-modorder implementation slightly
Date:   Fri, 13 Sep 2019 01:22:54 +0900
Message-Id: <20190912162254.9603-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912162254.9603-1-yamada.masahiro@socionext.com>
References: <20190912162254.9603-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Align with the need-builtin implementation.

I also added need-modorder=1 to scripts/link-vmlinux.sh to make it more
future-proof; currently, we have no module in the init/ directory, but
if we had a one, scripts/Makefile.build would show a false positive
warning.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - do not show orphan obj-m warning unless you are building modules

 scripts/Makefile.build  | 16 ++++++++--------
 scripts/Makefile.lib    |  2 ++
 scripts/link-vmlinux.sh |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index aab9a14fa78d..3b04ff23deb1 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -56,12 +56,10 @@ PHONY += __warn-orphan-obj-y
 __warn-orphan-obj-y:
 	@echo "warning: $(patsubst %,'%',$(real-obj-y)) will not be linked to vmlinux even though obj-y is specified." >&2
 
-ifeq ($(need-modorder),)
-ifneq ($(obj-m),)
-$(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
-$(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
-endif
-endif
+PHONY += __warn-orphan-obj-m
+__warn-orphan-obj-m:
+	@echo "warning: $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified." >&2
+	@echo "warning: You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead." >&2
 
 # ===========================================================================
 
@@ -78,6 +76,8 @@ endif
 
 ifdef need-modorder
 modorder-target := $(obj)/modules.order
+else ifneq ($(obj-m),)
+modorder-target := __warn-orphan-obj-m
 endif
 
 mod-targets := $(patsubst %.o, %.mod, $(obj-m))
@@ -406,7 +406,7 @@ targets += $(obj)/built-in.a
 #
 # Create commands to either record .ko file or cat modules.order from
 # a subdirectory
-$(modorder-target): $(subdir-ym) FORCE
+$(obj)/modules.order: $(subdir-ym) FORCE
 	$(Q){ $(foreach m, $(modorder), \
 	$(if $(filter %/modules.order, $m), cat $m, echo $m);) :; } \
 	| $(AWK) '!x[$$0]++' - > $@
@@ -513,7 +513,7 @@ $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	$(if $(filter $@/, $(KBUILD_SINGLE_TARGETS)),single-build=) \
 	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1) \
-	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
+	need-modorder=$(if $(filter $@/modules.order, $(modorder)),1)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 26ac638525cb..23e524027740 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -23,7 +23,9 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # Determine modorder.
 # Unfortunately, we don't have information about ordering between -y
 # and -m subdirs.  Just put -y's first.
+ifdef need-modorder
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
+endif
 
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 8961d999b86b..d9edfba54d84 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -216,7 +216,7 @@ else
 fi;
 
 # final build of init/
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
+${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1 need-modorder=1
 
 #link vmlinux.o
 info LD vmlinux.o
-- 
2.17.1

