Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C271A860C3
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 13:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731038AbfHHLVv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 07:21:51 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:37726 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730747AbfHHLVv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 07:21:51 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x78BLEkO027157;
        Thu, 8 Aug 2019 20:21:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x78BLEkO027157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565263275;
        bh=Y3joUPUMYoBzCVDWCYCkXvHGxBHe0Rsmx3YuHH4+91M=;
        h=From:To:Cc:Subject:Date:From;
        b=iCGTFksi3llJddT4lN0m7yPIlNGjS7AghbijE+hez0ISz3b3PLhEoWhe8ZzA0AQD1
         tmuGow482ok/3d9oy/0PYpn+1SAfMT+duWTPJQBgh55L34l4wnb740DftNfP72p4bK
         aVKdwDsT6xKeiIXY6if/cQyMi6kDX7o+z1dasan/d74TyZq2vmZdgJeo71cIXEwTro
         iqtvX0k17GTKR4xWb7K4k/D8ZMkBB3hhnVx+hj9cJtujetuLZmPO8IkT27p6dP6HMb
         uwYk3S0pCSmHXXn7Ttt/VrmKEz0l3WNU0cenS5Khc2kLclUhn33SlMDoN2Vlg58Ik9
         oGL/0vdUIw4fg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2] kbuild: show hint if subdir-y/m is used to visit module Makefile
Date:   Thu,  8 Aug 2019 20:21:11 +0900
Message-Id: <20190808112111.16159-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit ff9b45c55b26 ("kbuild: modpost: read modules.order instead
of $(MODVERDIR)/*.mod"), a module is no longer built in the following
pattern:

  [Makefile]
  subdir-y := some-module

  [some-module/Makefile]
  obj-m := some-module.o

You cannot write Makefile this way in upstream because modules.order is
not correctly generated. subdir-y is used to descend to a sub-directory
that builds tools, device trees, etc.

For external modules, the modules order does not matter. So, the
Makefile above was known to work.

I believe the Makefile should be re-written as follows:

  [Makefile]
  obj-m := some-module/

  [some-module/Makefile]
  obj-m := some-module.o

However, people will have no idea if their Makefile suddenly stops
working. In fact, I received questions from multiple people.

Show a warning if obj-m is specified in a Makefile visited by subdir-y
or subdir-m.

I touched the %/ rule to avoid false-positive warnings for the single
target.

Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - fix false-positive warnings for single targets

 Makefile               | 2 +-
 scripts/Makefile.build | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0e37ad2f77bf..fac25e279da6 100644
--- a/Makefile
+++ b/Makefile
@@ -1783,7 +1783,7 @@ PHONY += /
 /: ./
 
 %/: prepare FORCE
-	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
+	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir) need-modorder=1
 
 # FIXME Should go into a make.lib or something
 # ===========================================================================
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 37a1d2cd49d4..2f66ed388d1c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -52,6 +52,13 @@ ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
 
+ifeq ($(MAKECMDGOALS)$(need-modorder),)
+ifneq ($(obj-m),)
+$(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
+$(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
+endif
+endif
+
 # ===========================================================================
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
-- 
2.17.1

