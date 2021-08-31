Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC25E3FC3D5
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240021AbhHaHlk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:40 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:65501 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239959AbhHaHlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:37 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8EV031407;
        Tue, 31 Aug 2021 16:40:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8EV031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395611;
        bh=p3xselCuGPl5t0I/X6cfH9mw4IF3PqT3is+eEeFLIk8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=goFOD5eH7y5UzO/D7GM6WdEcc7114WdzSyQLIT0yHLxhGFn0LmD3DukZDAAkORPKx
         WsDa86oDV1Gj1gJkvaFUKkkWSUIiikvSTHODzEi5sFGYXVQHTGCwMWpRRlbcjG4L3T
         /avYcwI/k2ByV4+l6EtKfcxonre3W73qAc6l2iWAvVCo1E2yyKzRTSSd9QqJI5mCQw
         o+/HkhqxyoAkPhDo/ovinKic4z2pK1qiLbPB61Gs40w5KXskLRyrolvAhCzFrDnV4Q
         zfxTeGamjklnXZ7DwuK84bvnZeN/9UqLqHHQmobZrFB/6fPjcn97c9bHXkj8NGrb2U
         bIEDARHxwhENA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] kbuild: factor out OBJECT_FILES_NON_STANDARD check into a macro
Date:   Tue, 31 Aug 2021 16:39:55 +0900
Message-Id: <20210831074004.3195284-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831074004.3195284-1-masahiroy@kernel.org>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The OBJECT_FILES_NON_STANDARD check is quite long.

Factor it out into a new macro, objtool-enabled, to not repeat it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 021ae0146913..720a86642f48 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -241,12 +241,12 @@ ifndef CONFIG_LTO_CLANG
 # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
-cmd_objtool = $(if $(patsubst y%,, \
-	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	; $(objtool) $(objtool_args) $@)
-objtool_obj = $(if $(patsubst y%,, \
-	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(objtool))
+
+objtool-enabled = $(if $(filter-out y%, \
+	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
+
+cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
+objtool_obj = $(if $(objtool-enabled), $(objtool))
 
 endif # CONFIG_LTO_CLANG
 endif # CONFIG_STACK_VALIDATION
-- 
2.30.2

