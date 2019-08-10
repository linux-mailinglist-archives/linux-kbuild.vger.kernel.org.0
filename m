Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D54988C05
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfHJPyp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:54:45 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:34505 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfHJPyo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:44 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7AFrG92009713;
        Sun, 11 Aug 2019 00:53:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7AFrG92009713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565452403;
        bh=q19NAFTNKp4QUU0WxVbfBhOEmqZv8BRCw+mGkwwGwmY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1lk7a9TDpm99vup4cPGkRt6HrYV5t9eA65THFktbMHr5VtmD/ROCPjTLa3wQ5me4c
         xxb2xcw/3CD5gSAVyS2QLLApvGtPTmL0TqxjDa0Zv7KSxycRZUBTzkv5aasgZ3kORJ
         vBIUXpDQu7jSgQDopHnWUwNfT8+kN+zTTrH3FmGrC7aLK602Wwc8FPTxTZRcQOADBa
         Cd41sn5YvVytLdh3NjEJr57QUq731sodUXrHU7Y2PHlB5ZzgXC2bGs7Z7wc7Rz89AY
         ilwJyRUt8fjV6Ug2/pTEKeOoGKe4Nn7Gz3OnZwIbUPVc7B9Wf0inuUgsDreaLRcmFu
         BXQ75R3hy215A==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] kbuild: unset variables in top Makefile instead of setting 0
Date:   Sun, 11 Aug 2019 00:53:03 +0900
Message-Id: <20190810155307.29322-8-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is no need to set 0 to variables such as config-targets,
mixed-targets, etc.

Unset instead of setting 0 in order to use 'ifdef' to test them.

I also renamed:

  config-targets  ->  config-build
  mixed-targets   ->  mixed-build
  dot-config      ->  need-config

to clarify what we are doing.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/Makefile b/Makefile
index 3c186f59f152..706ca0d633df 100644
--- a/Makefile
+++ b/Makefile
@@ -272,32 +272,32 @@ no-dot-config-targets := $(clean-targets) \
 no-sync-config-targets := $(no-dot-config-targets) install %install \
 			   kernelrelease
 
-config-targets  := 0
-mixed-targets   := 0
-dot-config      := 1
-may-sync-config := 1
+config-build	:=
+mixed-build	:=
+need-config	:= 1
+may-sync-config	:= 1
 
 ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
 	ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
-		dot-config := 0
+		need-config :=
 	endif
 endif
 
 ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
 	ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
-		may-sync-config := 0
+		may-sync-config :=
 	endif
 endif
 
 ifneq ($(KBUILD_EXTMOD),)
-	may-sync-config := 0
+	may-sync-config :=
 endif
 
 ifeq ($(KBUILD_EXTMOD),)
         ifneq ($(filter config %config,$(MAKECMDGOALS)),)
-                config-targets := 1
+		config-build := 1
                 ifneq ($(words $(MAKECMDGOALS)),1)
-                        mixed-targets := 1
+			mixed-build := 1
                 endif
         endif
 endif
@@ -305,18 +305,18 @@ endif
 # For "make -j clean all", "make -j mrproper defconfig all", etc.
 ifneq ($(filter $(clean-targets),$(MAKECMDGOALS)),)
         ifneq ($(filter-out $(clean-targets),$(MAKECMDGOALS)),)
-                mixed-targets := 1
+		mixed-build := 1
         endif
 endif
 
 # install and modules_install need also be processed one by one
 ifneq ($(filter install,$(MAKECMDGOALS)),)
         ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
-	        mixed-targets := 1
+		mixed-build := 1
         endif
 endif
 
-ifeq ($(mixed-targets),1)
+ifdef mixed-build
 # ===========================================================================
 # We're called with mixed targets (*config and build targets).
 # Handle them one by one.
@@ -332,7 +332,7 @@ __build_one_by_one:
 		$(MAKE) -f $(srctree)/Makefile $$i; \
 	done
 
-else
+else # !mixed-build
 
 include scripts/Kbuild.include
 
@@ -544,7 +544,7 @@ endif
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
 
-ifeq ($(config-targets),1)
+ifdef config-build
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
 # in scripts/kconfig to make the *config target
@@ -561,7 +561,7 @@ config: scripts_basic outputmakefile FORCE
 %config: scripts_basic outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
-else
+else #!config-build
 # ===========================================================================
 # Build targets only - this includes vmlinux, arch specific targets, clean
 # targets and others. In general all targets except *config targets.
@@ -604,7 +604,7 @@ endif
 
 export KBUILD_MODULES KBUILD_BUILTIN
 
-ifeq ($(dot-config),1)
+ifdef need-config
 include include/config/auto.conf
 endif
 
@@ -652,8 +652,8 @@ ARCH_AFLAGS :=
 ARCH_CFLAGS :=
 include arch/$(SRCARCH)/Makefile
 
-ifeq ($(dot-config),1)
-ifeq ($(may-sync-config),1)
+ifdef need-config
+ifdef may-sync-config
 # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
 # changes are detected. This should be included after arch/$(SRCARCH)/Makefile
 # because some architectures define CROSS_COMPILE there.
@@ -676,7 +676,7 @@ $(KCONFIG_CONFIG):
 # The syncconfig should be executed only once to make all the targets.
 %/auto.conf %/auto.conf.cmd %/tristate.conf: $(KCONFIG_CONFIG)
 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
-else
+else # !may-sync-config
 # External modules and some install targets need include/generated/autoconf.h
 # and include/config/auto.conf but do not care if they are up-to-date.
 # Use auto.conf to trigger the test
@@ -692,7 +692,7 @@ include/config/auto.conf:
 	/bin/false)
 
 endif # may-sync-config
-endif # $(dot-config)
+endif # need-config
 
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
@@ -1809,9 +1809,9 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
-endif   # ifeq ($(config-targets),1)
-endif   # ifeq ($(mixed-targets),1)
-endif   # need-sub-make
+endif # config-targets
+endif # mixed-build
+endif # need-sub-make
 
 PHONY += FORCE
 FORCE:
-- 
2.17.1

