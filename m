Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0068032C205
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387648AbhCCTcU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:32:20 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:63528 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1580818AbhCCSfQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 13:35:16 -0500
Received: from localhost.localdomain (122-103-140-163.kyoto.fdn.vectant.ne.jp [122.103.140.163]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 123IXcJf023524;
        Thu, 4 Mar 2021 03:33:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 123IXcJf023524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614796420;
        bh=15Gw1OMyTCRaFX0xouVnd9dK3+GD/W8zTLjDYa/3v+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nlmwcihYvhHHhQfbIRm8Ub+D4LAi85osdDpldUd7eoMbK1J3dL7fVLi6k8UFQLyXX
         E99np0tUwTTp7tGcHP7WunVzgLueNPzyy8m1vPmetZMNRxStlIJGyfwpO4NmSSzmqd
         WA2FTn4/ThaLjmNZRwh+8t0iA0ZwHPU0570rVEqdZ+cqRseiFzaLr2Pj/8CFbiXEG2
         T2CT79g0dwavGQqeNZoeTqo+pjZVSF06EYOCPrc0OsdBjwF01ODd62qfrXXVro9sPw
         o4HubnYCPmBgocnALJQbakSgFa8qzJCsUpt/ECKqB6sYgLoTFbSbFOCZi0awcNoI34
         Ny8eGxoep1Gkg==
X-Nifty-SrcIP: [122.103.140.163]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] kbuild: dwarf: use AS_VERSION instead of test_dwarf5_support.sh
Date:   Thu,  4 Mar 2021 03:33:33 +0900
Message-Id: <20210303183333.46543-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303183333.46543-1-masahiroy@kernel.org>
References: <20210303183333.46543-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The test code in scripts/test_dwarf5_support.sh is somewhat difficult
to understand, but after all, we want to check binutils >= 2.35.2

From the former discussion, the requrement for generating DRAWF v5 from
C code is as follows:

 - gcc + binutils as     -> requires gcc 5.0+ (but 7.0+ for full support)
 - clang + binutils as   -> requires binutils 2.35.2+
 - clang + integrated as -> OK

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 lib/Kconfig.debug              | 3 +--
 scripts/test_dwarf5_support.sh | 8 --------
 2 files changed, 1 insertion(+), 10 deletions(-)
 delete mode 100755 scripts/test_dwarf5_support.sh

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2779c29d9981..f3337a38925d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -284,8 +284,7 @@ config DEBUG_INFO_DWARF4
 
 config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
-	depends on GCC_VERSION >= 50000 || CC_IS_CLANG
-	depends on CC_IS_GCC || $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
+	depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && AS_IS_GNU && AS_VERSION >= 23502) || (CC_IS_CLANG && AS_IS_LLVM)
 	depends on !DEBUG_INFO_BTF
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
deleted file mode 100755
index c46e2456b47a..000000000000
--- a/scripts/test_dwarf5_support.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-# Test that the assembler doesn't need -Wa,-gdwarf-5 when presented with DWARF
-# v5 input, such as `.file 0` and `md5 0x00`. Should be fixed in GNU binutils
-# 2.35.2. https://sourceware.org/bugzilla/show_bug.cgi?id=25611
-echo '.file 0 "filename" md5 0x7a0b65214090b6693bd1dc24dd248245' | \
-  $* -gdwarf-5 -Wno-unused-command-line-argument -c -x assembler -o /dev/null -
-- 
2.27.0

