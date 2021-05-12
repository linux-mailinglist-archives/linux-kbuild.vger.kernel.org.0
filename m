Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F1C37B657
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 08:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhELGxd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 02:53:33 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:18464 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhELGxc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 02:53:32 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14C6q4oQ028643;
        Wed, 12 May 2021 15:52:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14C6q4oQ028643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620802324;
        bh=u8aWcC9HqqxJqVPfH7rIK7ErJA5rYqfd9d/o+wgFuYs=;
        h=From:To:Cc:Subject:Date:From;
        b=bLs8JHLD33ZsWABMweZYqZvJciEbkZ6OXJ/ckYiT5GAUsgcYA+m6WHyy7MGvvpB67
         vKHuZlRTuHWBRtSAxTy9OgDLUCNX4ZiPIp3SRVT+5O4gqEAqXkSd0MzhQl3GtW0C2i
         T661QcsJG5k9tVVEA076KK8/99a7O+u7yxmke5dHYJILaCBVTDDBajDaZxR/E1QN3F
         Iv5QkoJwp5eLUrXS7Dle1fHr/sOsw9COQTGMA5SfumV/BWGWC/wu0oTf5n/D/pUXBt
         viJSJaTXtrVWEKlYkpAWpx2SasW+muWJJ0N7/ygYvlFhx7lh8WThIypLtk0Pq8HCu/
         o0VWCunZvbupw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: hide tools/ build targets from external module builds
Date:   Wed, 12 May 2021 15:52:00 +0900
Message-Id: <20210512065201.35268-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The tools/ directory only exists in the kernel source tree, not in
external modules.

Do not expose the meaningless targets to external modules.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 7df040b1b023..d60dc028f09c 100644
--- a/Makefile
+++ b/Makefile
@@ -1351,6 +1351,22 @@ PHONY += scripts_unifdef
 scripts_unifdef: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
 
+# ---------------------------------------------------------------------------
+# Tools
+
+# Clear a bunch of variables before executing the submake
+ifeq ($(quiet),silent_)
+tools_silent=s
+endif
+
+tools/: FORCE
+	$(Q)mkdir -p $(objtree)/tools
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
+
+tools/%: FORCE
+	$(Q)mkdir -p $(objtree)/tools
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
+
 # ---------------------------------------------------------------------------
 # Kernel selftest
 
@@ -1951,20 +1967,6 @@ kernelversion:
 image_name:
 	@echo $(KBUILD_IMAGE)
 
-# Clear a bunch of variables before executing the submake
-
-ifeq ($(quiet),silent_)
-tools_silent=s
-endif
-
-tools/: FORCE
-	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/
-
-tools/%: FORCE
-	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
-
 quiet_cmd_rmfiles = $(if $(wildcard $(rm-files)),CLEAN   $(wildcard $(rm-files)))
       cmd_rmfiles = rm -rf $(rm-files)
 
-- 
2.27.0

