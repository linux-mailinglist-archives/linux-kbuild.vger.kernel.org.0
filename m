Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A1E3C7D5D
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 06:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhGNE1Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 00:27:25 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:25376 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhGNE1Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 00:27:25 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 16E4O4FH010782;
        Wed, 14 Jul 2021 13:24:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 16E4O4FH010782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626236645;
        bh=ohs8UNiQH5xgT/ayqacDhxQJOOlXZzRqYgRVd0ZV1T0=;
        h=From:To:Cc:Subject:Date:From;
        b=z+cfyXhIcCSvPPL3Q3ZZSlmgsMYXspWCHUpyovi5cD1WU4L+KAz35ctT/nEF2+0iG
         UdPlqi5m29Wjw7qZFDi2RbraWBtV5mHg80U/JzgyOYU+x2QzW3wXToU0ILtLxFazQc
         u1vJqwHD7kEz7GeMX/lQ6WuPhZKy2mGs8otO4cPs4CEMQKsNWhNlrVgJphc9vlGRtA
         chIQkBDKOk1YrxxDOw5O6X10gd1zN/n4MiUdZF3CtFu8MmLDgKIMkNN18MnSwhUSFQ
         QAmcVWqyUkM1tW861D3z5IL1rni6aYPMNX1JWwizXOe2Li5WmwFKUZ+EMNEmIg58sL
         bByPFYwm7pxWg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: do not suppress Kconfig prompts for silent build
Date:   Wed, 14 Jul 2021 13:23:49 +0900
Message-Id: <20210714042349.219199-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When a new CONFIG option is available, Kbuild shows a prompt to get
the user input.

  $ make
  [ snip ]
  Core Scheduling for SMT (SCHED_CORE) [N/y/?] (NEW)

This is the only interactive place during the build process.

Commit 174a1dcc9642 ("kbuild: sink stdout from cmd for silent build")
suppressed Kconfig prompts as well because syncconfig is invoked by
the 'cmd' macro. You cannot notice the fact that Kconfig is waiting
for the user input.

Use 'kecho' to show the equivalent short log without suppressing stdout
from sub-make.

Fixes: 174a1dcc9642 ("kbuild: sink stdout from cmd for silent build")
Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c3f9bd191b89..6272126abe23 100644
--- a/Makefile
+++ b/Makefile
@@ -728,11 +728,9 @@ $(KCONFIG_CONFIG):
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
 # (Note: use the grouped target '&:' when we bump to GNU Make 4.3)
-quiet_cmd_syncconfig = SYNC    $@
-      cmd_syncconfig = $(MAKE) -f $(srctree)/Makefile syncconfig
-
 %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h: $(KCONFIG_CONFIG)
-	+$(call cmd,syncconfig)
+	$(Q)$(kecho) "  SYNC    $@"
+	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
 else # !may-sync-config
 # External modules and some install targets need include/generated/autoconf.h
 # and include/config/auto.conf but do not care if they are up-to-date.
-- 
2.27.0

