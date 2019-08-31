Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7E5A4548
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2019 18:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbfHaQ1B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 31 Aug 2019 12:27:01 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41942 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728350AbfHaQ1B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Aug 2019 12:27:01 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x7VGQ14w028152;
        Sun, 1 Sep 2019 01:26:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x7VGQ14w028152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567268762;
        bh=Ui9mzwIcf6q3fAmho+x2Mpzgo39jfnuLRThfNlp/A5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BqeiHJd8BBtWNXYB0xBm5fvUxh4XoT/v4U+vAnVIrlwARQTZyWBBIO7Dfk03n2nfd
         kPCeeeU7jt6TY8MEv7m/LUtus0JKQ8xzA0yZjRfT4w/p4YTK8sH/iUG9ToI2WBi74n
         H3p24RLsMyXvABdZeFI+7ieQMPhDauOuZdNmpMfRQRmLqC+Lp9xdbgjwSA9xpvhFyW
         If6Xwh6c/ZaQP7sBRnOOphlgNHOuts3uC6Usg0HYgukpRC6cexmFyLI8bPPlGcAUWY
         cOrMc/fe1X3BWBJG5OHOh2djyA69V2oxqJ3a2ajWyTfOnEiVotc88HmMP3ZTB2MOkm
         0lvTqA9CYZp1w==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to KBUILD_EXTRA_WARN
Date:   Sun,  1 Sep 2019 01:25:55 +0900
Message-Id: <20190831162555.31887-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190831162555.31887-1-yamada.masahiro@socionext.com>
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

KBUILD_ENABLE_EXTRA_GCC_CHECKS started as a switch to add extra warning
options for GCC, but now it is a historical misnomer since we use it
also for Clang, DTC, and even kernel-doc.

Rename it to more sensible, and shorter KBUILD_EXTRA_WARN.

For the backward compatibility, KBUILD_ENABLE_EXTRA_GCC_CHECKS is still
supported (but not advertised in the documentation).

I also fixed up 'make help', and updated the documentation.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - new patch

Changes in v2: None

 Documentation/kbuild/kbuild.rst | 14 +++++++++-----
 Makefile                        |  2 +-
 scripts/Makefile.build          |  2 +-
 scripts/Makefile.extrawarn      | 13 +++++++++----
 scripts/Makefile.lib            |  4 ++--
 scripts/genksyms/Makefile       |  2 +-
 6 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 62f9d86c082c..f1e5dce86af7 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -105,6 +105,15 @@ The output directory can also be specified using "O=...".
 
 Setting "O=..." takes precedence over KBUILD_OUTPUT.
 
+KBUILD_EXTRA_WARN
+-----------------
+Specify the extra build checks. The same value can be assigned by passing
+W=... from the command line.
+
+See `make help` for the list of the supported values.
+
+Setting "W=..." takes precedence over KBUILD_EXTRA_WARN.
+
 KBUILD_DEBARCH
 --------------
 For the deb-pkg target, allows overriding the normal heuristics deployed by
@@ -241,11 +250,6 @@ To get all available archs you can also specify all. E.g.::
 
     $ make ALLSOURCE_ARCHS=all tags
 
-KBUILD_ENABLE_EXTRA_GCC_CHECKS
-------------------------------
-If enabled over the make command line with "W=1", it turns on additional
-gcc -W... options for more extensive build-time checking.
-
 KBUILD_BUILD_TIMESTAMP
 ----------------------
 Setting this to a date string overrides the timestamp used in the
diff --git a/Makefile b/Makefile
index 06e1e21c0f45..016d72eb3ddf 100644
--- a/Makefile
+++ b/Makefile
@@ -1538,7 +1538,7 @@ help:
 	@echo  '  make C=1   [targets] Check re-compiled c source with $$CHECK (sparse by default)'
 	@echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
 	@echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
-	@echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
+	@echo  '  make W=n   [targets] Enable extra checks, n=1,2,3 where'
 	@echo  '		1: warnings which may be relevant and do not occur too often'
 	@echo  '		2: warnings which occur quite often but may still be relevant'
 	@echo  '		3: more obscure warnings, can most likely be ignored'
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2a21ca86b720..f72aba64d611 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -85,7 +85,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
         cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 endif
 
-ifneq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
+ifneq ($(KBUILD_EXTRA_WARN),)
   cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
 endif
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index d226c5fb13e2..53eb7e0c6a5a 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -8,14 +8,19 @@
 
 KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
 
+# backward compatibility
+KBUILD_EXTRA_WARN ?= $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)
+
 ifeq ("$(origin W)", "command line")
-  export KBUILD_ENABLE_EXTRA_GCC_CHECKS := $(W)
+  KBUILD_EXTRA_WARN := $(W)
 endif
 
+export KBUILD_EXTRA_WARN
+
 #
 # W=1 - warnings which may be relevant and do not occur too often
 #
-ifneq ($(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
+ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wextra -Wunused -Wno-unused-parameter
 KBUILD_CFLAGS += -Wmissing-declarations
@@ -48,7 +53,7 @@ endif
 #
 # W=2 - warnings which occur quite often but may still be relevant
 #
-ifneq ($(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
+ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wcast-align
 KBUILD_CFLAGS += -Wdisabled-optimization
@@ -65,7 +70,7 @@ endif
 #
 # W=3 - more obscure warnings, can most likely be ignored
 #
-ifneq ($(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
+ifneq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wbad-function-cast
 KBUILD_CFLAGS += -Wcast-qual
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7ab17712ab24..df83967268ba 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -248,7 +248,7 @@ quiet_cmd_gzip = GZIP    $@
 DTC ?= $(objtree)/scripts/dtc/dtc
 
 # Disable noisy checks by default
-ifeq ($(findstring 1,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
+ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-unit_address_format \
 	-Wno-avoid_unnecessary_addr_size \
@@ -259,7 +259,7 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-pci_device_reg
 endif
 
-ifneq ($(findstring 2,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
+ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
 DTC_FLAGS += -Wnode_name_chars_strict \
 	-Wproperty_name_chars_strict
 endif
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index baf44ed0a93a..78629f515e78 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -12,7 +12,7 @@ genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 #
 # Just in case, run "$(YACC) --version" without suppressing stderr
 # so that 'bison: not found' will be displayed if it is missing.
-ifeq ($(findstring 1,$(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
+ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 
 quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
       cmd_bison_no_warn = $(YACC) --version >/dev/null; \
-- 
2.17.1

