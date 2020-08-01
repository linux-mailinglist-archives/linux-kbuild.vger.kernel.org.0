Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04FFD2352DC
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Aug 2020 17:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbgHAPB1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Aug 2020 11:01:27 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:52858 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgHAPB1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Aug 2020 11:01:27 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 071F0q52015446;
        Sun, 2 Aug 2020 00:00:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 071F0q52015446
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596294054;
        bh=tOAxt/j1JhH6AssVaD3P2jNNLUCqu0fvMz1gL/uy2Nc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Aew+XXgxDTsJJ+V71E9b8rdKrHNtDcwTn0g3ojdbmH52hnHTtUFalzg4JL69ChJSh
         R0IV/GLNMHQoiT4xTCOjDcC28oFx5ejl02iUY+Y5eUIh5J47lCYiTk1q/+V9l+hfeQ
         rnfusbF1Xo+WRk2t2UFKO52vUcQieL6yf8nWNd6Ll53P8Bpy7APDa9Rog8xqnok+1u
         BT/IIBDbUzQDaiqeIEfpzh8qvzk+QG6T67tbAY57s7yd0uEbxPMUBOXSmfvV9DOwjd
         r5VHi+YqedEPQH+W4q97TbZU64/w6W0ZWHKgtsdFAOuq1JBM/XXb97bZ0u0qWN3zkE
         678fXUPU76/LA==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/2] kbuild: stop filtering out $(GCC_PLUGINS_CFLAGS) from cc-option base
Date:   Sun,  2 Aug 2020 00:00:50 +0900
Message-Id: <20200801150050.767038-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200801150050.767038-1-masahiroy@kernel.org>
References: <20200801150050.767038-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit d26e94149276 ("kbuild: no gcc-plugins during cc-option tests")
was neeeded because scripts/Makefile.gcc-plugins was too early.

This is unneeded by including scripts/Makefile.gcc-plugins last,
and being careful to not add cc-option tests after it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile               |  5 ++++-
 scripts/Kbuild.include | 10 +++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 483456d5dd3e..712206381a27 100644
--- a/Makefile
+++ b/Makefile
@@ -506,7 +506,6 @@ KBUILD_CFLAGS_MODULE  := -DMODULE
 KBUILD_LDFLAGS_MODULE :=
 export KBUILD_LDS_MODULE := $(srctree)/scripts/module-common.lds
 KBUILD_LDFLAGS :=
-GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
@@ -955,6 +954,10 @@ include-$(CONFIG_GCC_PLUGINS)	+= scripts/Makefile.gcc-plugins
 
 include $(addprefix $(srctree)/, $(include-y))
 
+# scripts/Makefile.gcc-plugins is intentionally included last.
+# Do not add $(call cc-option,...) below this line. When you build the kernel
+# from the clean source tree, the GCC plugins do not exist at this point.
+
 # Add user supplied CPPFLAGS, AFLAGS and CFLAGS as the last assignments
 KBUILD_CPPFLAGS += $(KCPPFLAGS)
 KBUILD_AFLAGS   += $(KAFLAGS)
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 9a15fbf66aa1..83a1637417e5 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -119,25 +119,21 @@ as-instr = $(call try-run,\
 __cc-option = $(call try-run,\
 	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
 
-# Do not attempt to build with gcc plugins during cc-option tests.
-# (And this uses delayed resolution so the flags will be up to date.)
-CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
-
 # cc-option
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
 
 cc-option = $(call __cc-option, $(CC),\
-	$(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),$(1),$(2))
+	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
+	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
 
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
 cc-disable-warning = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
+	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
 
 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-- 
2.25.1

