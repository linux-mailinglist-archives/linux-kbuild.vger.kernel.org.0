Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C853FC3D3
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240013AbhHaHlj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:39 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:65502 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239963AbhHaHlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8ET031407;
        Tue, 31 Aug 2021 16:40:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8ET031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395610;
        bh=he0soOQ9zzS0EzRT7ss9wp82TUPgR4Xe2OuH8qT/+Mc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rvWR40xMo1Hm/hVMrMD+Bc2+eWrTXElooQDdUIghCUwpMP0QxbTILhAjnMsO4aCcP
         dxVGBnckkIrM8l87V1PXJtitDGKQpLkIWikIOUJ4DQBk7o+a0m78auYtP6orH45Dev
         M3pChKLZNt3H9jXqDX6CdUZuwKypGVz7DxNhGeNMn8wNqLjFI4pSyzmsfBPUvRB6GJ
         a/bK0hznGQDmWDVckAFr9dvmaFof4Lc73DJiKN0dx6IRsNvS4PujaQUlufElqcqrP+
         i46ile+RPt2VhDcHlL0VQlQ+ekYtvfTwqdSSmlWip+gHD3A69Xh0gB/4NdjoyBopxx
         xD+/ehkyvsN2Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] kbuild: rename __objtool_obj to objtool
Date:   Tue, 31 Aug 2021 16:39:53 +0900
Message-Id: <20210831074004.3195284-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Rename __objtool_obj to objtool, and move it out of the
'ifndef CONFIG_LTO_CLANG' conditional, so it can be used for
cmd_cc_lto_link_modules as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 17508c0e4358..e78096cd396b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -225,6 +225,8 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
 
+objtool := $(objtree)/tools/objtool/objtool
+
 objtool_args =								\
 	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
 	$(if $(part-of-module), --module)				\
@@ -236,17 +238,15 @@ objtool_args =								\
 
 ifndef CONFIG_LTO_CLANG
 
-__objtool_obj := $(objtree)/tools/objtool/objtool
-
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
 cmd_objtool = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(__objtool_obj) $(objtool_args) $@)
+	$(objtool) $(objtool_args) $@)
 objtool_obj = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(__objtool_obj))
+	$(objtool))
 
 endif # CONFIG_LTO_CLANG
 endif # CONFIG_STACK_VALIDATION
@@ -300,8 +300,7 @@ cmd_cc_lto_link_modules =						\
 ifdef CONFIG_STACK_VALIDATION
 # objtool was skipped for LLVM bitcode, run it now that we have compiled
 # modules into native code
-cmd_cc_lto_link_modules += ;						\
-	$(objtree)/tools/objtool/objtool $(objtool_args) --module $@
+cmd_cc_lto_link_modules += ; $(objtool) $(objtool_args) --module $@
 endif
 
 $(obj)/%.lto.o: $(obj)/%.o FORCE
-- 
2.30.2

