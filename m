Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7E24CAF3
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 04:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgHUCo0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 22:44:26 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:20716 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgHUCo0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 22:44:26 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 07L2i0YL020183;
        Fri, 21 Aug 2020 11:44:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 07L2i0YL020183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597977841;
        bh=WlGygibzUZpm/729meq5HruVG8ZYIIqB07d7CuZFwm0=;
        h=From:To:Cc:Subject:Date:From;
        b=mOL5rVhjBiK3dGckBV0DKsNOYs4g3J6ECQ1xoW6dTKmZbEAmVIgtO5zZH/h5H7ntW
         5ACc3H4simMYjYzmOGtlSTb4/dqLxkVQMW3YpJLVcNGWPfIoJ1C0FtuGojMyP0+kvn
         6RCgVk+7R5rpVBhLX82EHu5aKXSh7G5PasSPloYSwf/Iu6xhRwmgUONEPFgGgYtOrU
         Dcbc/5b+xKXC8j5qo8ckEUoycJVJBKYIJZnzB2W0EF8l5bkMHcFwWruCJ95X8LLuQi
         UjHn9bScVx0lBmyS5mN59pdwfg/V/52UFKAWM4lAHXF9EFCUVgx4fXtWsuSQs4+lSA
         dMsirmCJnTbeQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ingo Molnar <mingo@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: hide commands to run Kconfig, and show short log for syncconfig
Date:   Fri, 21 Aug 2020 11:43:58 +0900
Message-Id: <20200821024358.616384-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some targets (localyesconfig, localmodconfig, defconfig) hide the
command running, but the others do not.

Users know which Kconfig flavor they are running, so it is OK to hide
the command. Add $(Q) to all commands consistently. If you want to see
the full command running, pass V=1 from the command line.

syncconfig is the exceptional case, which occurs without explicit
command invocation by the user. Display the Kbuild-style log for it.
The ugly bare log will go away.

[Before]

scripts/kconfig/conf  --syncconfig Kconfig

[After]

  SYNC    include/config/auto.conf

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 |  5 ++++-
 scripts/kconfig/Makefile | 16 ++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 9cac6fde3479..0693314d51c3 100644
--- a/Makefile
+++ b/Makefile
@@ -708,8 +708,11 @@ $(KCONFIG_CONFIG):
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
 # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
+quiet_cmd_syncconfig = SYNC    $@
+      cmd_syncconfig = $(MAKE) -f $(srctree)/Makefile syncconfig
+
 %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
-	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
+	+$(call cmd,syncconfig)
 else # !may-sync-config
 # External modules and some install targets need include/generated/autoconf.h
 # and include/config/auto.conf but do not care if they are up-to-date.
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 52b59bf9efe4..e46df0a2d4f9 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -20,19 +20,19 @@ endif
 unexport CONFIG_
 
 xconfig: $(obj)/qconf
-	$< $(silent) $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 gconfig: $(obj)/gconf
-	$< $(silent) $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 menuconfig: $(obj)/mconf
-	$< $(silent) $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 config: $(obj)/conf
-	$< $(silent) --oldaskconfig $(Kconfig)
+	$(Q)$< $(silent) --oldaskconfig $(Kconfig)
 
 nconfig: $(obj)/nconf
-	$< $(silent) $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 build_menuconfig: $(obj)/mconf
 
@@ -68,12 +68,12 @@ simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
 PHONY += $(simple-targets)
 
 $(simple-targets): $(obj)/conf
-	$< $(silent) --$@ $(Kconfig)
+	$(Q)$< $(silent) --$@ $(Kconfig)
 
 PHONY += savedefconfig defconfig
 
 savedefconfig: $(obj)/conf
-	$< $(silent) --$@=defconfig $(Kconfig)
+	$(Q)$< $(silent) --$@=defconfig $(Kconfig)
 
 defconfig: $(obj)/conf
 ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
@@ -111,7 +111,7 @@ tinyconfig:
 # CHECK: -o cache_dir=<path> working?
 PHONY += testconfig
 testconfig: $(obj)/conf
-	$(PYTHON3) -B -m pytest $(srctree)/$(src)/tests \
+	$(Q)$(PYTHON3) -B -m pytest $(srctree)/$(src)/tests \
 	-o cache_dir=$(abspath $(obj)/tests/.cache) \
 	$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=no)
 clean-files += tests/.cache
-- 
2.25.1

