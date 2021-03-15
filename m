Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E970933C165
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhCOQPa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:15:30 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:20916 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCOQPY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:15:24 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 12FGD7XH030890;
        Tue, 16 Mar 2021 01:13:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 12FGD7XH030890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615824791;
        bh=RIDE+IYVYeFvMxGbVmakCezynqhWEF9YmJQS0ypJjZ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h9nU/IXQgiGpXqg+FtAqikJmOKNHNNwfLIUqmQvdKainMj+CxX7F/UJMBrWhoWgiG
         tWjI8ONLP8uF3yeXjz6ulN2GUyu8rpH2OhDzCojIVuwBFOkfN3tXZVJR29k03yFtrm
         K4+b2XiwpUBtRx3qfYiAikC8XwzcDdmfml/TUgm3f1u6U92nugudGxLIH9KJDNH9ol
         +0FRd27Qm4D59Okv+ofS3Ws/IoXWrimqmzIhz//8ujdNTy8Oey8KVUN8NLAdXXBIyW
         Iy2S3NAzbGkWwgKEV5zseNGMefKiO2qbSbrm6CaZS+Pu0AOLAUCHybJtkFpzQUon5d
         Vxb98EFvujUeA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Enderborg <peter.enderborg@sony.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Wei Yang <richard.weiyang@gmail.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        "peterz@infradead.org" <peterz@infradead.org>
Subject: [PATCH v2 3/3] kbuild: dwarf: use AS_VERSION instead of test_dwarf5_support.sh
Date:   Tue, 16 Mar 2021 01:12:57 +0900
Message-Id: <20210315161257.788477-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315161257.788477-1-masahiroy@kernel.org>
References: <20210315161257.788477-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The test code in scripts/test_dwarf5_support.sh is somewhat difficult
to understand, but after all, we want to check binutils >= 2.35.2

From the former discussion, the requirement for generating DWARF v5 from
C code is as follows:

 - gcc + gnu as          -> requires gcc 5.0+ (but 7.0+ for full support)
 - clang + gnu as        -> requires binutils 2.35.2+
 - clang + integrated as -> OK

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v2:
  - fix typos
  - simplify the dependency expression

 lib/Kconfig.debug              | 3 +--
 scripts/test_dwarf5_support.sh | 8 --------
 2 files changed, 1 insertion(+), 10 deletions(-)
 delete mode 100755 scripts/test_dwarf5_support.sh

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index b479ae609a31..c85d5f7a1aeb 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -284,8 +284,7 @@ config DEBUG_INFO_DWARF4
 
 config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
-	depends on GCC_VERSION >= 50000 || CC_IS_CLANG
-	depends on CC_IS_GCC || $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
+	depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
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

