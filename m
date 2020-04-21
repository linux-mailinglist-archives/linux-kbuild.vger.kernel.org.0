Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23B51B26AE
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 14:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbgDUMso (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 08:48:44 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:38132 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgDUMsn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 08:48:43 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 03LCm57O000731;
        Tue, 21 Apr 2020 21:48:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 03LCm57O000731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587473286;
        bh=0/WpwSdCDKFUy0QKnGd6kunc4ELKUfh3X/2O2KfXcik=;
        h=From:To:Cc:Subject:Date:From;
        b=RL9nsiO4FrpIlW/nZa2iozlGbn/MGfbQQvdA/in0erxhDE1sHMq9u29kCaj2yzj7G
         CFVwYILcLjEIcX1d3sKeZRZwQ7QXtPG13q7lRmMt0T4K7jvzfnDpufkd4YshbBT3iU
         izoMI7ruK78C+6NBDTEDSwLDybg+B8fT5VxYiVPU1Cu4qq+bZMmj8ImNDuY+z7QDCb
         KmdjjAnKSStJM7exoa2ED1enuMAgRVJJiSuKewXJjxj2u8ii4djh/oXJEXdh73Ofuw
         Ow18/FvHXtYNhtfawrcKc87Rfz7s61SA6uWHcHLUEW4t21fEfLyuF9Kri9RQCANfwI
         vQqSH7fWX0Giw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: ensure full rebuild when the compiler is updated
Date:   Tue, 21 Apr 2020 21:48:03 +0900
Message-Id: <20200421124804.1272909-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 21c54b774744 ("kconfig: show compiler version text in the top
comment") added the environment variable, CC_VERSION_TEXT in the comment
of the top Kconfig file. It can detect the compiler update, and invoke
the syncconfig because all environment variables referenced in Kconfig
files are recorded in include/config/auto.conf.cmd

This commit makes it a CONFIG option in order to ensure the full rebuild
when the compiler is updated.

This works like as follows:

include/config/kconfig.h contains "CONFIG_CC_VERSION_TEXT" in the comment
block.

The top Makefile specifies "-include $(srctree)/include/linux/kconfig.h"
to guarantee it is included from all kernel source files.

fixdep parses every source file and all headers included from it,
searching for words prefixed with "CONFIG_". Then, fixdep finds
CONFIG_CC_VERSION_TEXT in include/config/kconfig.h and adds
include/config/cc/version/text.h into every .*.cmd file.

When the compiler is updated, syncconfig is invoked since the environment
variable is referenced. CONFIG_CC_VERSION_TEXT is updated to the new
version string, and include/config/cc/version/text.h is touched.

In the next rebuild, Make rebuilds every files since the timestamp of
include/config/cc/version/text.h is newer than that of target.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Kconfig                 |  2 --
 include/linux/kconfig.h |  9 +++++++++
 init/Kconfig            | 12 ++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Kconfig b/Kconfig
index e10b3ee084d4..745bc773f567 100644
--- a/Kconfig
+++ b/Kconfig
@@ -5,8 +5,6 @@
 #
 mainmenu "Linux/$(ARCH) $(KERNELVERSION) Kernel Configuration"
 
-comment "Compiler: $(CC_VERSION_TEXT)"
-
 source "scripts/Kconfig.include"
 
 source "init/Kconfig"
diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
index cc8fa109cfa3..406b8a2521b5 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -2,6 +2,15 @@
 #ifndef __LINUX_KCONFIG_H
 #define __LINUX_KCONFIG_H
 
+/*
+ * Do not remove this comment block. This contains "CONFIG_CC_VERSION_TEXT"
+ * to ensure the full rebuild when the compiler is updated.
+ *
+ * fixdep parses this header, which is included by every kernel source file,
+ * and adds include/config/cc/version/text.h to the dependency in .*.cmd files.
+ * When the compiler is updated, syncconfig touches it so every file is rebuilt.
+ */
+
 #include <generated/autoconf.h>
 
 #ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/init/Kconfig b/init/Kconfig
index 9e22ee8fbd75..d3d153815d88 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -8,6 +8,18 @@ config DEFCONFIG_LIST
 	default "/boot/config-$(shell,uname -r)"
 	default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
 
+config CC_VERSION_TEXT
+	string
+	default "$(CC_VERSION_TEXT)"
+	help
+	  There two purposes for this entry:
+
+	  1. Reference the environment variable, CC_VERSION_TEXT, so Kconfig
+	     is invoked if the compiler is updated.
+
+	  2. Touch include/config/cc/version/text.h to force the full rebuild
+	     if the compiler is updated. See comment in include/linux/kconfig.h
+
 config CC_IS_GCC
 	def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)
 
-- 
2.25.1

