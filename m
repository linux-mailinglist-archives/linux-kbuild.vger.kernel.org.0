Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D243FA4DD
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Aug 2021 11:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbhH1Jwd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Aug 2021 05:52:33 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60857 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbhH1Jw2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Aug 2021 05:52:28 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17S9p5iJ032486;
        Sat, 28 Aug 2021 18:51:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17S9p5iJ032486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630144268;
        bh=FrudtNagBz9weG82Yatm816vyhTp4K9F4bjNr6OhOYg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qd4m7JI8ZZUZ/gy1uQLWYlU/OIMW1TiHOu4zcM3lrF6LMk52C/EiiE1BNLxGu7CCO
         vz1KaVYWZxBcat9Z+pxV5pOxjEGNzr7VGSta6mCliuioUvQgQFcwqsSI5oKviyNU/0
         F76qBskWq3Rpl25pP7EqVxBPF5wuzL1S8Y9PkwXSPa+spvWLt0uUmL4gqEy0b+c0NK
         jC97XVii9v0KMtUt+xU/zcJbXs8ARA4IesXQJymBKFq760JTwAE34CW0/bfhl1lz4c
         Orp1+yaxCSGMsRYVC4FSCBWBffidaktw8PIFvGVdCGDwxUsGCOmAIKDRiOYvM/9SHV
         APdk78Waq8B0g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] kbuild: rebuild *.lto.o when objtool is changed
Date:   Sat, 28 Aug 2021 18:51:03 +0900
Message-Id: <20210828095103.2617393-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210828095103.2617393-1-masahiroy@kernel.org>
References: <20210828095103.2617393-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When objtool is changed, all objects are rebuilt, but this check
is missing in the %.lto.o rule.

Move the objtool-md5sum into the objtool variable so the updated
objtool is detected when CONFIG_LTO_CLANG=y as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index cc0c494a48d3..790b72208668 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -225,7 +225,10 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
 ifdef CONFIG_STACK_VALIDATION
 
-objtool = $(objtree)/tools/objtool/objtool				\
+# Record the md5sum of the objtool executable so any change in it results in
+# rebuilding objects.
+objtool = : $(objtool-md5sum) ;						\
+	$(objtree)/tools/objtool/objtool				\
 	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
 	$(if $(part-of-module), --module)				\
 	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
@@ -239,12 +242,9 @@ ifndef CONFIG_LTO_CLANG
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
-#
-# Record the md5sum of the objtool executable so any change in it results in
-# rebuilding objects.
 cmd_objtool = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	; : $(objtool-md5sum) ; $(objtool) $@)
+	; $(objtool) $@)
 
 endif # CONFIG_LTO_CLANG
 endif # CONFIG_STACK_VALIDATION
-- 
2.30.2

