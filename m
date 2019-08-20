Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF41296727
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2019 19:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbfHTRKi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Aug 2019 13:10:38 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:46071 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729991AbfHTRKi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Aug 2019 13:10:38 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x7KH9n4B020646;
        Wed, 21 Aug 2019 02:09:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x7KH9n4B020646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566320991;
        bh=35oiB6f8NsCtFMF7x1hxhc8poRW8t8acsr/yhS3f0ik=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tMeVW1PC/8Tj879Rns8s6qCDOSlbv4RDlNSrW3j7HYZqJwf6dv3u3uIcY+gN7kLSn
         TCuar2EmcFm7NxZtsVg8mAa08vWK1p9XcwgFiNIt1EpkAAJYioVe7omBpue7SJQ8+9
         8txjR6zoN3buM/Scidy2yLWnxFBuafEm+Kopf+ABVHbOlF3w6okX2SF0sBByB8DV/y
         Y44FCITM9AjczWiTbYI3IVHnfaJ80BchCxWgPnsO+4huR5p5WXmfLpLZkUxV6V7IrE
         UcEvr/AfO3edtFi8A/Wafj9SJWN25LyRRTdavTp8artaPkppC4e71M/6KUa4CZLQqk
         1ewDxPAgaAOsA==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kbuild: remove ARCH_{CPP,A,C}FLAGS
Date:   Wed, 21 Aug 2019 02:09:41 +0900
Message-Id: <20190820170941.26193-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820170941.26193-1-yamada.masahiro@socionext.com>
References: <20190820170941.26193-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These flags were added by commit 61754c18752f ("kbuild: Allow arch
Makefiles to override {cpp,ld,c}flags") to allow ARC to override -O2.

We did not see any other usage after all. Now that ARC switched to
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3, there is no more user of
these variables.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/makefiles.rst |  7 -------
 Makefile                           | 14 ++++----------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 36ba92e199d2..712cdbcdbe91 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -988,13 +988,6 @@ When kbuild executes, the following steps are followed (roughly):
 	$(KBUILD_ARFLAGS) set by the top level Makefile to "D" (deterministic
 	mode) if this option is supported by $(AR).
 
-    ARCH_CPPFLAGS, ARCH_AFLAGS, ARCH_CFLAGS   Overrides the kbuild defaults
-
-	These variables are appended to the KBUILD_CPPFLAGS,
-	KBUILD_AFLAGS, and KBUILD_CFLAGS, respectively, after the
-	top-level Makefile has set any other flags. This provides a
-	means for an architecture to override the defaults.
-
     KBUILD_LDS
 
 	The linker script with full path. Assigned by the top-level Makefile.
diff --git a/Makefile b/Makefile
index 891e47da503f..6551f136afb0 100644
--- a/Makefile
+++ b/Makefile
@@ -661,11 +661,6 @@ RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc
 export RETPOLINE_CFLAGS
 export RETPOLINE_VDSO_CFLAGS
 
-# The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
-# values of the respective KBUILD_* variables
-ARCH_CPPFLAGS :=
-ARCH_AFLAGS :=
-ARCH_CFLAGS :=
 include arch/$(SRCARCH)/Makefile
 
 ifdef need-config
@@ -918,11 +913,10 @@ include scripts/Makefile.kasan
 include scripts/Makefile.extrawarn
 include scripts/Makefile.ubsan
 
-# Add any arch overrides and user supplied CPPFLAGS, AFLAGS and CFLAGS as the
-# last assignments
-KBUILD_CPPFLAGS += $(ARCH_CPPFLAGS) $(KCPPFLAGS)
-KBUILD_AFLAGS   += $(ARCH_AFLAGS)   $(KAFLAGS)
-KBUILD_CFLAGS   += $(ARCH_CFLAGS)   $(KCFLAGS)
+# Add user supplied CPPFLAGS, AFLAGS and CFLAGS as the last assignments
+KBUILD_CPPFLAGS += $(KCPPFLAGS)
+KBUILD_AFLAGS   += $(KAFLAGS)
+KBUILD_CFLAGS   += $(KCFLAGS)
 
 KBUILD_LDFLAGS_MODULE += --build-id
 LDFLAGS_vmlinux += --build-id
-- 
2.17.1

