Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0AC91B5DB2
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 16:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgDWOYk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 10:24:40 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:42830 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbgDWOYi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 10:24:38 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 03NEO72V028581;
        Thu, 23 Apr 2020 23:24:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 03NEO72V028581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587651848;
        bh=dZXf7RX0rt+kpbcYyj6XQVDErqTPqO5onUOvG62v5rY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0AApny0S7hBgWPz4YTP2vapxj0SaBbn73Xty1w2smskRlRV+ZdSMVG2jaCGmYvro4
         IiWfgDOshRxeAvzecsBk8m3EEzFk4x2J6wbRv9ej6lmgldI07Ey6SC13Z/H86TlyA2
         8fjJBMmLOMt8JmzzL34HbsgUqxXCRqOQCc5OW5JitbTjF0Ue8Xzy83xjllDtl05BeE
         ZcXpbnmi3krI9m7FZhV1iOmWgqGfVZqWyibjBJaOt0QIwJQfDCcKmMfH2y1n12eo94
         RDJjNMZJ71obfCs1ZROMvzylmJZZLQ7vV7HZZGX1vVnKatwVo31ozIzdIXU1OMG1QT
         vR8Q7/4OvM7Pw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] kbuild: ensure full rebuild when the compiler is updated
Date:   Thu, 23 Apr 2020 23:23:52 +0900
Message-Id: <20200423142354.312088-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423142354.312088-1-masahiroy@kernel.org>
References: <20200423142354.312088-1-masahiroy@kernel.org>
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

This works like follows:

include/config/kconfig.h contains "CONFIG_CC_VERSION_TEXT" in the comment
block.

The top Makefile specifies "-include $(srctree)/include/linux/kconfig.h"
to guarantee it is included from all kernel source files.

fixdep parses every source file and all headers included from it,
searching for words prefixed with "CONFIG_". Then, fixdep finds
CONFIG_CC_VERSION_TEXT in include/config/kconfig.h and adds
include/config/cc/version/text.h into every .*.cmd file.

When the compiler is updated, syncconfig is invoked because init/Kconfig
contains the reference to the environment variable CC_VERTION_TEXT.
CONFIG_CC_VERSION_TEXT is updated to the new version string, and
include/config/cc/version/text.h is touched.

In the next rebuild, Make will rebuild every files since the timestamp
of include/config/cc/version/text.h is newer than that of target.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Move detailed comments to Kconfig help

 Kconfig                 |  2 --
 include/linux/kconfig.h |  2 ++
 init/Kconfig            | 17 +++++++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

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
index cc8fa109cfa3..9d12c970f18f 100644
--- a/include/linux/kconfig.h
+++ b/include/linux/kconfig.h
@@ -2,6 +2,8 @@
 #ifndef __LINUX_KCONFIG_H
 #define __LINUX_KCONFIG_H
 
+/* CONFIG_CC_VERSION_TEXT (Do not delete this comment. See help in Kconfig) */
+
 #include <generated/autoconf.h>
 
 #ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/init/Kconfig b/init/Kconfig
index 5f797df3f043..a494212a3a79 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -8,6 +8,23 @@ config DEFCONFIG_LIST
 	default "/boot/config-$(shell,uname -r)"
 	default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
 
+config CC_VERSION_TEXT
+	string
+	default "$(CC_VERSION_TEXT)"
+	help
+	  This is used in unclear ways:
+
+	  - Re-run Kconfig when the compiler is updated
+	    The 'default' property references the environment variable,
+	    CC_VERSION_TEXT so it is recorded in include/config/auto.conf.cmd.
+	    When the compiler is updated, Kconfig will be invoked.
+
+	  - Ensure full rebuild when the compier is updated
+	    include/linux/kconfig.h contains this option in the comment line so
+	    fixdep adds include/config/cc/version/text.h into the auto-generated
+	    dependency. When the compiler is updated, syncconfig will touch it
+	    and then every file will be rebuilt.
+
 config CC_IS_GCC
 	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q gcc)
 
-- 
2.25.1

