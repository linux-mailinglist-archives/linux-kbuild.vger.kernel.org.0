Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0869B429BF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 05:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhJLD1j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Oct 2021 23:27:39 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:24515 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhJLD1j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Oct 2021 23:27:39 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 19C3P5Uu010598;
        Tue, 12 Oct 2021 12:25:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 19C3P5Uu010598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634009106;
        bh=N9ihZcXQO83Pmr9yBAmbfjXh+3i+xawv0MNHQHeUF5Q=;
        h=From:To:Cc:Subject:Date:From;
        b=qaCZ1m9nRJmVqfRe//kWofMTthpKvqkR/LkoKrRIAzAN4O2TWrFL3H9lZ+NGgHiGg
         cnoFUcKCRljv5VwYPWwFIY9zRWuB5O6uqrjuCxxgIVxLHNBEvnoHE7hhMGx041ueFl
         ptZ2Y6i2s4dLV/GakNGKs8OHZRacS6MWDAwvXJXrTCecIgiyMJQXtQAkDx1pmZ/Onr
         subBn31y7tz4Nb6p1JmWEW8H+88TmtImnpTmj68GvY1gP8jmmuiEjQ33krSNUnqcwL
         N1mcF0UO5sAbR2lz/hu37iqSm2ZDVNnhw0AXtTGsXJMJ2LCT8L6AAuPNF724RJUpHh
         CvCqcaQvQNmEg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: split DEBUG_CFLAGS out to scripts/Makefile.debug
Date:   Tue, 12 Oct 2021 12:25:03 +0900
Message-Id: <20211012032503.459821-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To slim down the top Makefile, split out the code block surrounded by
ifdef CONFIG_DEBUG_INFO ... endif.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile               | 39 +--------------------------------------
 scripts/Makefile.debug | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 38 deletions(-)
 create mode 100644 scripts/Makefile.debug

diff --git a/Makefile b/Makefile
index ee5896261d2f..8e3224470dc1 100644
--- a/Makefile
+++ b/Makefile
@@ -847,44 +847,6 @@ ifdef CONFIG_ZERO_CALL_USED_REGS
 KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr
 endif
 
-DEBUG_CFLAGS	:=
-
-ifdef CONFIG_DEBUG_INFO
-
-ifdef CONFIG_DEBUG_INFO_SPLIT
-DEBUG_CFLAGS	+= -gsplit-dwarf
-else
-DEBUG_CFLAGS	+= -g
-endif
-
-ifndef CONFIG_AS_IS_LLVM
-KBUILD_AFLAGS	+= -Wa,-gdwarf-2
-endif
-
-ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
-dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
-dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
-DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
-endif
-
-ifdef CONFIG_DEBUG_INFO_REDUCED
-DEBUG_CFLAGS	+= -fno-var-tracking
-ifdef CONFIG_CC_IS_GCC
-DEBUG_CFLAGS	+= -femit-struct-debug-baseonly
-endif
-endif
-
-ifdef CONFIG_DEBUG_INFO_COMPRESSED
-DEBUG_CFLAGS	+= -gz=zlib
-KBUILD_AFLAGS	+= -gz=zlib
-KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
-endif
-
-endif # CONFIG_DEBUG_INFO
-
-KBUILD_CFLAGS += $(DEBUG_CFLAGS)
-export DEBUG_CFLAGS
-
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_FTRACE_MCOUNT_USE_CC
   CC_FLAGS_FTRACE	+= -mrecord-mcount
@@ -1033,6 +995,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 
 # include additional Makefiles when needed
 include-y			:= scripts/Makefile.extrawarn
+include-$(CONFIG_DEBUG_INFO)	+= scripts/Makefile.debug
 include-$(CONFIG_KASAN)		+= scripts/Makefile.kasan
 include-$(CONFIG_KCSAN)		+= scripts/Makefile.kcsan
 include-$(CONFIG_UBSAN)		+= scripts/Makefile.ubsan
diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
new file mode 100644
index 000000000000..9f39b0130551
--- /dev/null
+++ b/scripts/Makefile.debug
@@ -0,0 +1,33 @@
+DEBUG_CFLAGS	:=
+
+ifdef CONFIG_DEBUG_INFO_SPLIT
+DEBUG_CFLAGS	+= -gsplit-dwarf
+else
+DEBUG_CFLAGS	+= -g
+endif
+
+ifndef CONFIG_AS_IS_LLVM
+KBUILD_AFLAGS	+= -Wa,-gdwarf-2
+endif
+
+ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
+dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
+dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
+DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
+endif
+
+ifdef CONFIG_DEBUG_INFO_REDUCED
+DEBUG_CFLAGS	+= -fno-var-tracking
+ifdef CONFIG_CC_IS_GCC
+DEBUG_CFLAGS	+= -femit-struct-debug-baseonly
+endif
+endif
+
+ifdef CONFIG_DEBUG_INFO_COMPRESSED
+DEBUG_CFLAGS	+= -gz=zlib
+KBUILD_AFLAGS	+= -gz=zlib
+KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
+endif
+
+KBUILD_CFLAGS += $(DEBUG_CFLAGS)
+export DEBUG_CFLAGS
-- 
2.30.2

