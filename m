Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F8F772FC
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2019 22:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfGZUtD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jul 2019 16:49:03 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:50368 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfGZUtD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jul 2019 16:49:03 -0400
Received: from pd9ef1cb8.dip0.t-ipconnect.de ([217.239.28.184] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1hr797-0002Lz-BO; Fri, 26 Jul 2019 22:48:57 +0200
Date:   Fri, 26 Jul 2019 22:48:56 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Sewior <bigeasy@linutronix.de>
Subject: [PATCH] Kbuild: Handle PREEMPT_RT for version string and magic
Message-ID: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Update the build scripts and the version magic to reflect when
CONFIG_PREEMPT_RT is enabled in the same way as CONFIG_PREEMPT is treated.

The resulting version strings:

  Linux m 5.3.0-rc1+ #100 SMP Fri Jul 26 ...
  Linux m 5.3.0-rc1+ #101 SMP PREEMPT Fri Jul 26 ...
  Linux m 5.3.0-rc1+ #102 SMP PREEMPT_RT Fri Jul 26 ...

The module vermagic:

  5.3.0-rc1+ SMP mod_unload modversions 
  5.3.0-rc1+ SMP preempt mod_unload modversions 
  5.3.0-rc1+ SMP preempt_rt mod_unload modversions 

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
---
 include/linux/vermagic.h |   10 +++++++---
 init/Makefile            |    5 +++--
 scripts/Makefile.modpost |    2 +-
 scripts/mkcompile_h      |    4 +++-
 4 files changed, 14 insertions(+), 7 deletions(-)

--- a/include/linux/vermagic.h
+++ b/include/linux/vermagic.h
@@ -7,10 +7,14 @@
 #else
 #define MODULE_VERMAGIC_SMP ""
 #endif
-#ifdef CONFIG_PREEMPT
-#define MODULE_VERMAGIC_PREEMPT "preempt "
+#ifdef CONFIG_PREEMPTION
+# ifdef CONFIG_PREEMPT
+#  define MODULE_VERMAGIC_PREEMPT "preempt "
+# else
+#  define MODULE_VERMAGIC_PREEMPT "preempt_rt "
+# endif
 #else
-#define MODULE_VERMAGIC_PREEMPT ""
+# define MODULE_VERMAGIC_PREEMPT ""
 #endif
 #ifdef CONFIG_MODULE_UNLOAD
 #define MODULE_VERMAGIC_MODULE_UNLOAD "mod_unload "
--- a/init/Makefile
+++ b/init/Makefile
@@ -33,5 +33,6 @@ mounts-$(CONFIG_BLK_DEV_MD)	+= do_mounts
 silent_chk_compile.h = :
 include/generated/compile.h: FORCE
 	@$($(quiet)chk_compile.h)
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@ \
-	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)" "$(CC) $(KBUILD_CFLAGS)"
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
+	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
+	"$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -23,7 +23,7 @@
 #   Version magic (see include/linux/vermagic.h for full details)
 #     - Kernel release
 #     - SMP is CONFIG_SMP
-#     - PREEMPT is CONFIG_PREEMPT
+#     - PREEMPT is CONFIG_PREEMPT[_RT]
 #     - GCC Version
 #   Module info
 #     - Module version (MODULE_VERSION)
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -5,7 +5,8 @@ TARGET=$1
 ARCH=$2
 SMP=$3
 PREEMPT=$4
-CC=$5
+PREEMPT_RT=$5
+CC=$6
 
 vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
 
@@ -53,6 +54,7 @@ UTS_VERSION="#$VERSION"
 CONFIG_FLAGS=""
 if [ -n "$SMP" ] ; then CONFIG_FLAGS="SMP"; fi
 if [ -n "$PREEMPT" ] ; then CONFIG_FLAGS="$CONFIG_FLAGS PREEMPT"; fi
+if [ -n "$PREEMPT_RT" ] ; then CONFIG_FLAGS="$CONFIG_FLAGS PREEMPT_RT"; fi
 UTS_VERSION="$UTS_VERSION $CONFIG_FLAGS $TIMESTAMP"
 
 # Truncate to maximum length
