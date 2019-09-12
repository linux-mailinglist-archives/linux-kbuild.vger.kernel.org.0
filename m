Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D526B12B4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 18:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733165AbfILQXK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Sep 2019 12:23:10 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42383 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730132AbfILQXJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 12:23:09 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8CGMu1b021030;
        Fri, 13 Sep 2019 01:22:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8CGMu1b021030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568305377;
        bh=ODIkurWAfHrOiVaGlkYrz/KE7y0sW22uQuzTjixHoH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ccvw0IiV5YLTG5lkl7gvdD9ne+M3KJmq27iAmX6sFJ2q5bNgwy/iN48SwURh9Wrmr
         qrTMWCM4CnFJY/rM7iAPE+y+/riADB6fBeCvgED9NOrfPO0uymNHaqeUjkf0/G+o60
         9HnU2Hhvkl18tu9boSA7o0xKBktXDXnQcdyIcXx7NDNMJ9nUfniPCAz1IHJ4CYs+vb
         ft+H2Dfv/c5pl+gnaep5Fk7VQCcTdsqfdH75q/In2PIjY78X0Meu5MXEa2/xN2xB6M
         7ruAy1VSYuo/PEIuQ/LnfA/4Rpt0pL/mML9m1YXoRj0TWMQsF1Zq8H7qdWVSr/qmuG
         CmlvJwC+hUoHQ==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] kbuild: warn orphan built-in objects
Date:   Fri, 13 Sep 2019 01:22:52 +0900
Message-Id: <20190912162254.9603-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912162254.9603-1-yamada.masahiro@socionext.com>
References: <20190912162254.9603-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

obj-y specifies objects linked into vmlinux, but they are actually
linked if and only if that sub-directory is visited by the chain of
obj-y. If you have an orphan obj-y object, it is a bug, but may not
be easy to notice. This commit provides build-time warning.

I tested x86 allmodconfig based on v5.3-rc4, and I saw one warning:

warning: 'sound/soc/sprd/sprd-mcdt.o' will not be linked to vmlinux even though obj-y is specified.

This is a proper warning. sound/soc/sprd/sprd-mcdt.o is compiled as
built-in since CONFIG_SND_SOC_SPRD_MCDT is boolean. However, CONFIG_SND
and CONFIG_SND_SOC are tristate, and set to m by allmodconfig.
So, Kbuild descends into sound/soc/, then sound/soc/sprd/ by obj-m.
Thus, sound/soc/sprd/sprd-mcdt.o is not linked to vmlinux.

More warnings for arm allmodconfig, all of which are valid:

warning: 'drivers/video/fbdev/mmp/hw/mmp_ctrl.o' 'drivers/video/fbdev/mmp/hw/mmp_spi.o' will not be linked to vmlinux even though obj-y is specified.
warning: 'drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.o' will not be linked to vmlinux even though obj-y is specified.
warning: 'sound/soc/pxa/mmp-pcm.o' will not be linked to vmlinux even though obj-y is specified.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - fix false-positive warning for arm64

 scripts/Makefile.build  | 12 ++++++++----
 scripts/link-vmlinux.sh |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6c3e6cb0c0af..fb29c898604a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -52,6 +52,10 @@ ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
 
+PHONY += __warn-orphan-obj-y
+__warn-orphan-obj-y:
+	@echo "warning: $(patsubst %,'%',$(real-obj-y)) will not be linked to vmlinux even though obj-y is specified." >&2
+
 ifeq ($(need-modorder),)
 ifneq ($(obj-m),)
 $(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
@@ -68,6 +72,8 @@ endif
 
 ifdef need-builtin
 builtin-target := $(obj)/built-in.a
+else ifneq ($(real-obj-y),)
+builtin-target := __warn-orphan-obj-y
 endif
 
 ifeq ($(CONFIG_MODULES)$(need-modorder),y1)
@@ -386,16 +392,14 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
 #
-ifdef builtin-target
 
 quiet_cmd_ar_builtin = AR      $@
       cmd_ar_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
 
-$(builtin-target): $(real-obj-y) FORCE
+$(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
 
-targets += $(builtin-target)
-endif # builtin-target
+targets += $(obj)/built-in.a
 
 #
 # Rule to create modules.order file
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 2438a9faf3f1..8961d999b86b 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -216,7 +216,7 @@ else
 fi;
 
 # final build of init/
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
+${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
 
 #link vmlinux.o
 info LD vmlinux.o
-- 
2.17.1

