Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 721E11A152A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 20:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgDGSo3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 14:44:29 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:37547 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGSo3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 14:44:29 -0400
Received: from grover.flets-west.jp (softbank126125134031.bbtec.net [126.125.134.31]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 037IhjLN002999;
        Wed, 8 Apr 2020 03:43:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 037IhjLN002999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586285026;
        bh=/yE3LtMyJqmOAt80CTdVzlZEIo8PmfJ0HPkqvDRfiHw=;
        h=From:To:Cc:Subject:Date:From;
        b=vslyEss3HgL6TFI+NV5adg9iEdqzvyVhB6k42WIqKa/xMGD2qZ58lVcts2Jzs9uBe
         sDROrOFLyTHN1gozmIaOLAK+vDpbxQMdH4QeeWN0DqFMBX+1aI6k5f0LsF//K+Cg1P
         b53Orq1U3cDQMlfhqW3w7bafXpuxr608ve5JK51HQkAyhxOrCA/LuR19Xa1EbLoGNU
         JoVgnhBqgpxnFycAhUqrE4BaLLHCtPmahPxGuaHOLdKv9p1FiTVHBm/xXARyigwUa8
         Gdn7J7MnGzlJMRhHaEFLAzEQcEjQFoh2V85YRFC2u8uyqh4sR8TiuEhQlK/EyCu1Bq
         PaHzhLjE6D20A==
X-Nifty-SrcIP: [126.125.134.31]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] kbuild: replace AS=clang with LLVM_IA=1
Date:   Wed,  8 Apr 2020 03:43:35 +0900
Message-Id: <20200407184336.14612-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The 'AS' variable is unused for building the kernel. Only the remaining
usage is to turn on the integrated assembler. A boolean flag is a better
fit for this purpose.

AS=clang was added for experts. So, I replaced it with LLVM_IA=1,
breaking the backward compatibility.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 Documentation/kbuild/llvm.rst | 5 ++++-
 Makefile                      | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index eefbdfa3e4d9..2b40afa58049 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -50,11 +50,14 @@ LLVM Utilities
 LLVM has substitutes for GNU binutils utilities. These can be invoked as
 additional parameters to `make`.
 
-	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
+	make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
 	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
 	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
 	  HOSTLD=ld.lld
 
+Currently, the integrated assembler is disabled by default. You can pass
+LLVM_IA=1 to enable it.
+
 Getting Help
 ------------
 
diff --git a/Makefile b/Makefile
index 1b2691057cb5..f9beb696d6d3 100644
--- a/Makefile
+++ b/Makefile
@@ -538,7 +538,7 @@ endif
 ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
-ifeq ($(if $(AS),$(shell $(AS) --version 2>&1 | head -n 1 | grep clang)),)
+ifneq ($(LLVM_IA),1)
 CLANG_FLAGS	+= -no-integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
-- 
2.17.1

