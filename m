Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096FB6B66E
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 08:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfGQGS1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 02:18:27 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:62967 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfGQGS1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:27 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6H6I5Oe009435;
        Wed, 17 Jul 2019 15:18:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6H6I5Oe009435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563344288;
        bh=bW9MlR9anEqZaRsV/yNzhOtgPvYfSH+v4L1uzgSzinY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qKceRlqpHWlnG3IVZ+0qQxJKx6Vv2a8liDbA/6tI8y/ScyIs3FffSd/TyCpkfCHZS
         V0nrbWf+wwgDU8ztwIJLhxk2xSPVRplD0CZKx3X4Cwtq+U1gKRgxSJOTlKP3/TRApD
         Zmrpts4pxfjvlJ8WdP2EPmJ3JeUkIFrU3l5VjdhijKMjQE4XFmC5qcKyoNui+GsVbJ
         zxZaZ+3Z4+uM17uOxSguQDFP5aNi5O6ADeXz+7Kn8ajhrS8rBHAVLqFWfzoAJq7P6J
         etOVAQKcpMGFYgMnX7lMfY+qcZ3UpmBwqRSOvple/qcSY+t1bJLuTVatwny1P4d9wa
         DNM2WS+BW2aiA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/12] kbuild: get rid of kernel/ prefix from in-tree modules.{order,builtin}
Date:   Wed, 17 Jul 2019 15:17:50 +0900
Message-Id: <20190717061800.10018-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Removing the 'kernel/' prefix will make our life easier because we can
simply do 'cat modules.order' to get all built modules with full paths.

Currently, we parse the first line of '*.mod' files in $(MODVERDIR).
Since we have duplicated functionality here, I plan to remove MODVERDIR
entirely.

In fact, modules.order is generated also for external modules in a
broken format. It adds the 'kernel/' prefix to the absolute path of
the module, like this:

  kernel//path/to/your/external/module/foo.ko

This is fine for now since modules.order is not used for external
modules. However, I want to sanitize the format everywhere towards
the goal of removing MODVERDIR.

We cannot change the format of installed module.{order,builtin}.
So, 'make modules_install' will add the 'kernel/' prefix while copying
them to $(MODLIB)/.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 Makefile                    | 4 ++--
 scripts/Makefile.build      | 2 +-
 scripts/Makefile.modbuiltin | 2 +-
 scripts/modules-check.sh    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index b74a6e9cefc8..396cd5e525d1 100644
--- a/Makefile
+++ b/Makefile
@@ -1329,8 +1329,8 @@ _modinst_:
 		rm -f $(MODLIB)/build ; \
 		ln -s $(CURDIR) $(MODLIB)/build ; \
 	fi
-	@cp -f $(objtree)/modules.order $(MODLIB)/
-	@cp -f $(objtree)/modules.builtin $(MODLIB)/
+	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
+	@sed 's:^:kernel/:' modules.builtin > $(MODLIB)/modules.builtin
 	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 631bb89524de..10e92a27ec20 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -426,7 +426,7 @@ endif # builtin-target
 modorder-cmds =						\
 	$(foreach m, $(modorder),			\
 		$(if $(filter %/modules.order, $m),	\
-			cat $m;, echo kernel/$m;))
+			cat $m;, echo $m;))
 
 $(modorder-target): $(subdir-ym) FORCE
 	$(Q)(cat /dev/null; $(modorder-cmds)) > $@
diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
index 50a9990760f3..7d4711b88656 100644
--- a/scripts/Makefile.modbuiltin
+++ b/scripts/Makefile.modbuiltin
@@ -40,7 +40,7 @@ __modbuiltin: $(modbuiltin-target) $(subdir-ym)
 	@:
 
 $(modbuiltin-target): $(subdir-ym) FORCE
-	$(Q)(for m in $(modbuiltin-mods); do echo kernel/$$m; done;	\
+	$(Q)(for m in $(modbuiltin-mods); do echo $$m; done;	\
 	cat /dev/null $(modbuiltin-subdirs)) > $@
 
 PHONY += FORCE
diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 39e8cb36ba19..f51f446707b8 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -9,7 +9,7 @@ check_same_name_modules()
 	for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
 	do
 		echo "warning: same module names found:" >&2
-		sed -n "/\/$m/s:^kernel/:  :p" modules.order >&2
+		sed -n "/\/$m/s:^:  :p" modules.order >&2
 	done
 }
 
-- 
2.17.1

