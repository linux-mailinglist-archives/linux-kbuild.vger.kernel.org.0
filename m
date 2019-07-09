Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0000F62F8F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfGIEZ6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:25:58 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42159 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfGIEZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:42 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVl009969;
        Tue, 9 Jul 2019 13:24:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVl009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646295;
        bh=aPMz7hZjIVb3L/uoLF/n6Iw6fP28g9YGkw0KtaBRHOE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DkzaQ/meidN8ccY5OmY6W/czewqVGkGcz9LARdHn3fRV+p2dJfcZeG4dn++xxS+YO
         iM0H63kxsICV397EyaznkXp1FXlwwItRJNxh5M/KGr3EW1ZBPSSuFeahOok/PgbfQV
         fnumI2yAbd6DBY96WwmpSbej9Y9iBt4oo6ydJmnpjFvWC4skh/hhCKygn9XynJKgtu
         u5pyqJcxr0GaT/L2d79A1geCURwDnoMkuv3T6quH5QlHYRjYiyKUNO9fbRhmBmxQFs
         oBjHpQkWu3x+LLYZEgHEAIndF/lzRy7xBJypVslHK2lV0uQ3t9atnhS9sJYQRPS1Ev
         Oqh+UpoxRkIPg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] kbuild: get rid of kernel/ prefix from in-tree modules.{order,builtin}
Date:   Tue,  9 Jul 2019 13:24:06 +0900
Message-Id: <20190709042416.27554-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
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

 Makefile                    | 4 ++--
 scripts/Makefile.build      | 2 +-
 scripts/Makefile.modbuiltin | 2 +-
 scripts/modules-check.sh    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index a31b672d512b..2f40cf704119 100644
--- a/Makefile
+++ b/Makefile
@@ -1334,8 +1334,8 @@ _modinst_:
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
index 93c20664bcbb..d827b7a36892 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -428,7 +428,7 @@ endif # builtin-target
 modorder-cmds =						\
 	$(foreach m, $(modorder),			\
 		$(if $(filter %/modules.order, $m),	\
-			cat $m;, echo kernel/$m;))
+			cat $m;, echo $m;))
 
 $(modorder-target): $(subdir-ym) FORCE
 	$(Q)(cat /dev/null; $(modorder-cmds)) > $@
diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
index ea90a90b41a0..12ac300fe51b 100644
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

