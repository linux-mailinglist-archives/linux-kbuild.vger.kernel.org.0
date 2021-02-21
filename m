Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6452320BDA
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 17:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhBUQyN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 11:54:13 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:28568 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhBUQyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 11:54:13 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 11LGr9VU017012;
        Mon, 22 Feb 2021 01:53:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 11LGr9VU017012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613926389;
        bh=/d3wrpyKPu6mGWtrIlHH+84+f3/4luUBVGglFDf/H8U=;
        h=From:To:Cc:Subject:Date:From;
        b=hX7zfXnMYg5K0c838CdDCFVrBgyZ/K5TBdjCyZS4bFoPsINwIoSkLwNba8EDAR5ln
         HDvjt0Ulhg+VPD6rWrq3SmFv7pTA4Z57ne0b1B/yqhJbS7ySSALStGf5gNz/MF0RtT
         zZMtKx+YERbVP9hsl58fIx+IYwVNuphc1jX2qXQADx/DAagakCGVd09YozLl82eO/f
         171Y5lRHsSFSIQxO1ZWiRMKGycV65vfYwite+F9lv/nxp06NELMFJjOxrQB01M/FHL
         XWvEin1gX/wUkGNgnFhcUdWd6nVjM/Rjm2JL1Ahcg+w1+usNdW6kcsroSJuZtiDxUV
         5RLOFtV+6QIjg==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: parse C= and M= before changing the working directory
Date:   Mon, 22 Feb 2021 01:53:06 +0900
Message-Id: <20210221165306.294172-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If Kbuild recurses to the top Makefile (for example, 'make deb-pkg'),
C= and M= are parsed over again, needlessly.

Parse them before changing the working directory. After that,
sub_make_done is set to 1, so they are parsed just once.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 61 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/Makefile b/Makefile
index b127881e6bf0..874536f5fc1a 100644
--- a/Makefile
+++ b/Makefile
@@ -100,6 +100,36 @@ endif
 
 export quiet Q KBUILD_VERBOSE
 
+# Call a source code checker (by default, "sparse") as part of the
+# C compilation.
+#
+# Use 'make C=1' to enable checking of only re-compiled files.
+# Use 'make C=2' to enable checking of *all* source files, regardless
+# of whether they are re-compiled or not.
+#
+# See the file "Documentation/dev-tools/sparse.rst" for more details,
+# including where to get the "sparse" utility.
+
+ifeq ("$(origin C)", "command line")
+  KBUILD_CHECKSRC = $(C)
+endif
+ifndef KBUILD_CHECKSRC
+  KBUILD_CHECKSRC = 0
+endif
+
+export KBUILD_CHECKSRC
+
+# Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
+# directory of external module to build. Setting M= takes precedence.
+ifeq ("$(origin M)", "command line")
+  KBUILD_EXTMOD := $(M)
+endif
+
+$(if $(word 2, $(KBUILD_EXTMOD)), \
+	$(error building multiple external modules is not supported))
+
+export KBUILD_EXTMOD
+
 # Kbuild will save output files in the current working directory.
 # This does not need to match to the root of the kernel source tree.
 #
@@ -194,36 +224,6 @@ ifeq ($(need-sub-make),)
 # so that IDEs/editors are able to understand relative filenames.
 MAKEFLAGS += --no-print-directory
 
-# Call a source code checker (by default, "sparse") as part of the
-# C compilation.
-#
-# Use 'make C=1' to enable checking of only re-compiled files.
-# Use 'make C=2' to enable checking of *all* source files, regardless
-# of whether they are re-compiled or not.
-#
-# See the file "Documentation/dev-tools/sparse.rst" for more details,
-# including where to get the "sparse" utility.
-
-ifeq ("$(origin C)", "command line")
-  KBUILD_CHECKSRC = $(C)
-endif
-ifndef KBUILD_CHECKSRC
-  KBUILD_CHECKSRC = 0
-endif
-
-# Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
-# directory of external module to build. Setting M= takes precedence.
-ifeq ("$(origin M)", "command line")
-  KBUILD_EXTMOD := $(M)
-endif
-
-$(if $(word 2, $(KBUILD_EXTMOD)), \
-	$(error building multiple external modules is not supported))
-
-export KBUILD_CHECKSRC KBUILD_EXTMOD
-
-extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
-
 ifeq ($(abs_srctree),$(abs_objtree))
         # building in the source tree
         srctree := .
@@ -1092,6 +1092,7 @@ endif # CONFIG_BPF
 
 PHONY += prepare0
 
+extmod-prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
 export MODORDER := $(extmod-prefix)modules.order
 export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
 
-- 
2.27.0

