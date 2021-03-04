Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1EA932D1E9
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 12:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239588AbhCDLiz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 06:38:55 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:31686 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239591AbhCDLii (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 06:38:38 -0500
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 124BbDN8015766;
        Thu, 4 Mar 2021 20:37:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 124BbDN8015766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614857834;
        bh=/d+SPvGr+INO/fCyIPrUS5kxXmHWV+iqtycPRe9oyyw=;
        h=From:To:Cc:Subject:Date:From;
        b=QNMDKJLMVelGwBg0jbGvZArodl5XMVZM/E9lrEGSxEQ9zSyCezpIXISfS8qTjxFnd
         jNomwoiM6P8u7woLwm1Plg8MBG0elSC1mYk+P3QiqvKyZynF5nGEObF8+70v8T0j6/
         6HRAdKRfnGv4VLlQOI3ogF4evEMFOW8AyaHs0N1Rl7QVMM5A66rAwxhssgg657Q33E
         rOZiVrPQATs25HK3mRx8p33+WgWR5qZwHT0FikiziS2Ksc79HawF8awuuUXrbCZxpw
         6oL80BfrbBbo+yBxxnMRXhqTtd2xBXXQpB2+Wei5XWoAPdvUHF/ygMxQEPhA3DtzRK
         Rsbb5ng5Wew7A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: rebuild GCC plugins when the compiler is upgraded
Date:   Thu,  4 Mar 2021 20:37:08 +0900
Message-Id: <20210304113708.215121-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linus reported a build error due to the GCC plugin incompatibility
when the compiler is upgraded. [1]

  cc1: error: incompatible gcc/plugin versions
  cc1: error: failed to initialize plugin ./scripts/gcc-plugins/stackleak_plugin.so

GCC plugins are tied to a particular GCC version. So, they must be
rebuilt when the compiler is upgraded.

This seems to be a long-standing flaw since the initial support of
GCC plugins.

Extend commit 8b59cd81dc5e ("kbuild: ensure full rebuild when the
compiler is updated"), so that GCC plugins are covered by the
compiler upgrade detection.

[1]: https://lore.kernel.org/lkml/CAHk-=wieoN5ttOy7SnsGwZv+Fni3R6m-Ut=oxih6bbZ28G+4dw@mail.gmail.com/

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                         |  1 +
 include/linux/compiler-version.h | 14 ++++++++++++++
 include/linux/kconfig.h          |  2 --
 init/Kconfig                     |  8 ++++----
 scripts/gcc-plugins/Makefile     |  1 +
 5 files changed, 20 insertions(+), 6 deletions(-)
 create mode 100644 include/linux/compiler-version.h

diff --git a/Makefile b/Makefile
index 44ab0dfd3698..5f66cf5af5f7 100644
--- a/Makefile
+++ b/Makefile
@@ -490,6 +490,7 @@ USERINCLUDE    := \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
 		-I$(srctree)/include/uapi \
 		-I$(objtree)/include/generated/uapi \
+                -include $(srctree)/include/linux/compiler-version.h \
                 -include $(srctree)/include/linux/kconfig.h
 
 # Use LINUXINCLUDE when you must reference the include/ directory.
diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
new file mode 100644
index 000000000000..2b2972c77c62
--- /dev/null
+++ b/include/linux/compiler-version.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifdef  __LINUX_COMPILER_VERSION_H
+#error "Please do not include <linux/compiler-version.h>. This is done by the build system."
+#endif
+#define __LINUX_COMPILER_VERSION_H
+
+/*
+ * This header exists to force full rebuild when the compiler is upgraded.
+ *
+ * When fixdep scans this, it will find this string "CONFIG_CC_VERSION_TEXT"
+ * and add dependency on include/config/cc/version/text.h, which is touched
+ * by Kconfig when the version string from the compiler changes.
+ */
diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index e78e17a76dc9..24a59cb06963 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -2,8 +2,6 @@
 #ifndef __LINUX_KCONFIG_H
 #define __LINUX_KCONFIG_H
 
-/* CONFIG_CC_VERSION_TEXT (Do not delete this comment. See help in Kconfig) */
-
 #include <generated/autoconf.h>
 
 #ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/init/Kconfig b/init/Kconfig
index 0dd44d951e67..b6f641567b7c 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -20,10 +20,10 @@ config CC_VERSION_TEXT
 	    When the compiler is updated, Kconfig will be invoked.
 
 	  - Ensure full rebuild when the compiler is updated
-	    include/linux/kconfig.h contains this option in the comment line so
-	    fixdep adds include/config/cc/version/text.h into the auto-generated
-	    dependency. When the compiler is updated, syncconfig will touch it
-	    and then every file will be rebuilt.
+	    include/linux/compiler-version.h contains this option in the comment
+	    line so fixdep adds include/config/cc/version/text.h into the
+	    auto-generated dependency. When the compiler is updated, syncconfig
+	    will touch it and then every file will be rebuilt.
 
 config CC_IS_GCC
 	def_bool $(success,test "$(cc-name)" = GCC)
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index b5487cce69e8..1952d3bb80c6 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -22,6 +22,7 @@ always-y += $(GCC_PLUGIN)
 GCC_PLUGINS_DIR = $(shell $(CC) -print-file-name=plugin)
 
 plugin_cxxflags	= -Wp,-MMD,$(depfile) $(KBUILD_HOSTCXXFLAGS) -fPIC \
+		  -include $(srctree)/include/linux/compiler-version.h \
 		   -I $(GCC_PLUGINS_DIR)/include -I $(obj) -std=gnu++11 \
 		   -fno-rtti -fno-exceptions -fasynchronous-unwind-tables \
 		   -ggdb -Wno-narrowing -Wno-unused-variable \
-- 
2.27.0

