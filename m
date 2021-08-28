Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01A3D3FA4D8
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Aug 2021 11:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbhH1Jw0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Aug 2021 05:52:26 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60787 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhH1JwZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Aug 2021 05:52:25 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17S9p5iH032486;
        Sat, 28 Aug 2021 18:51:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17S9p5iH032486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630144267;
        bh=/syLyoEj2LHabGry4vCWawL3+SLYlYahl/OVmmzbivc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dLnBH1EcaOI7+me8/j78O8NFw7WEGVYd7X2YqhCmfHiJCT+Up+z+qsX3SerIvTP3b
         X8j2mjmP/6hHbRPyGxPaWsOLV8N0mLodDy76WwmZY+adJ+ddGCBJsxZyFJNhqGKuPA
         8ba7DVfIEVYfoZSEg6+kUatfGUmFbfaarLo+8rZbdyipo84/rewQk3wMpotlxyhyvv
         qDGADDBSSDlaIm6z/qnRKcQIctZnPSie0l4ltk+pgkh75mKnk4EYregJCPeoF4U/v+
         7+Q+QChRMCRLqpdV9y6+fPP5lHnste6PLwbiObJ73ImV1P9JSJIUt4xiFzuDxznCWa
         1Ah/Nj2M8AX1w==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] kbuild: clean up objtool_args slightly
Date:   Sat, 28 Aug 2021 18:51:01 +0900
Message-Id: <20210828095103.2617393-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210828095103.2617393-1-masahiroy@kernel.org>
References: <20210828095103.2617393-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The code:

  $(if $(or $(CONFIG_GCOV_KERNEL),$(CONFIG_LTO_CLANG)), ...)

... can be simpled to:

  $(if $(CONFIG_GCOV_KERNEL)$(CONFIG_LTO_CLANG), ...)

Also, remove meaningless commas at the end of $(if ...).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index af1c920a585c..cd011f3f6f78 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -236,13 +236,12 @@ endif
 # then here to avoid duplication.
 objtool_args =								\
 	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
-	$(if $(part-of-module), --module,)				\
+	$(if $(part-of-module), --module)				\
 	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
-	$(if $(or $(CONFIG_GCOV_KERNEL),$(CONFIG_LTO_CLANG)), 		\
-		--no-unreachable,)					\
-	$(if $(CONFIG_RETPOLINE), --retpoline,)				\
-	$(if $(CONFIG_X86_SMAP), --uaccess,)				\
-	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount,)
+	$(if $(CONFIG_GCOV_KERNEL)$(CONFIG_LTO_CLANG), --no-unreachable)\
+	$(if $(CONFIG_RETPOLINE), --retpoline)				\
+	$(if $(CONFIG_X86_SMAP), --uaccess)				\
+	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
 
 # Useful for describing the dependency of composite objects
 # Usage:
-- 
2.30.2

