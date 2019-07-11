Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3DD6519C
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfGKFpy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:45:54 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59471 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbfGKFpx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:53 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8L031345;
        Thu, 11 Jul 2019 14:44:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8L031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823893;
        bh=mjkkjTnXRVjdI3ciIRz1HWZFd7z2yTHWDPrWodufX/o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jAODMvDCKfqR1Zhn7vZaIDr1Mbtv7fOKReJCqG98rha6TTAsX3wWiAChWv1gg25W8
         r6Sxv0+lEkZ6VZJ30c30gqKTqg0NArc0RYsEIpt5p8cSYVpQn3Pmos6nn6KXvJhJxf
         ITaMDCsE1YIxfHHN0wFCEuVLsMZARh5uJMs3XIUoxQ/++Uu5X8WcHhi8yJ1B4FsWyW
         3Ujk0mejbaMkFCqygqJzfrj168G2a3v9D1O9RJBbuwJFxBPATN8UUyzrMpvxqjFmbA
         gDWmtm80d1Y3qgfdivmIgylOveCorw2YRsKLGa1cAUtCwLiXXVpDXtsr/aqbzzhvRv
         8GEcsS8bddsvA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/11] kbuild: do not create empty modules.order in the prepare stage
Date:   Thu, 11 Jul 2019 14:44:24 +0900
Message-Id: <20190711054434.1177-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, $(objtree)/modules.order is touched in two places.

In the 'prepare0' rule, scripts/Makefile.build creates an empty
modules.order while processing 'obj=.'

In the 'modules' rule, the top-level Makefile overwrites it with
the correct list of modules.

While this might be a good side-effect that modules.order is made
empty every time (probably this is not intended functionality),
I personally do not like this behavior.

Create modules.order only when it is sensible to do so.

This avoids creating the following pointless files:

  scripts/basic/modules.order
  scripts/dtc/modules.order
  scripts/gcc-plugins/modules.order
  scripts/genksyms/modules.order
  scripts/mod/modules.order
  scripts/modules.order
  scripts/selinux/genheaders/modules.order
  scripts/selinux/mdp/modules.order
  scripts/selinux/modules.order

Going forward, $(objtree)/modules.order lists the modules that
was built in the last successful build.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - inverted the logic "preparing" -> need-modorder

 Makefile               | 4 ++--
 scripts/Makefile.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5c75ea7177f6..d8421d245f75 100644
--- a/Makefile
+++ b/Makefile
@@ -1076,7 +1076,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
 
 PHONY += $(vmlinux-dirs)
 $(vmlinux-dirs): prepare
-	$(Q)$(MAKE) $(build)=$@ need-builtin=1
+	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
 
 filechk_kernel.release = \
 	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
@@ -1611,7 +1611,7 @@ $(objtree)/Module.symvers:
 module-dirs := $(addprefix _module_,$(KBUILD_EXTMOD))
 PHONY += $(module-dirs) modules
 $(module-dirs): prepare $(objtree)/Module.symvers
-	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@)
+	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@) need-modorder=1
 
 modules: $(module-dirs)
 	@$(kecho) '  Building modules, stage 2.';
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 776842b7e6a3..e9b3d88257dd 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -63,7 +63,7 @@ ifneq ($(strip $(real-obj-y) $(need-builtin)),)
 builtin-target := $(obj)/built-in.a
 endif
 
-ifdef CONFIG_MODULES
+ifeq ($(CONFIG_MODULES)$(need-modorder),y1)
 modorder-target := $(obj)/modules.order
 endif
 
-- 
2.17.1

