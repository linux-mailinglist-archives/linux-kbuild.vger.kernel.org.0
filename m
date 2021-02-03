Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E8E30D467
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 08:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhBCHyq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 02:54:46 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:34336 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbhBCHyq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 02:54:46 -0500
Received: from grover.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 1137qgIr002018;
        Wed, 3 Feb 2021 16:52:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 1137qgIr002018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612338763;
        bh=BHikcps5Egh9U8s8X6kTCoeloxrM5VMBhf3jGdV23oU=;
        h=From:To:Cc:Subject:Date:From;
        b=RJoPgfyplpQnXFZR8Ehp2P+z6sDqERJXG+jL8xBU6//OgmZwXS2QUZNdCb/dFRQg7
         k03LL29IDRbh+mzP9uwkH0Ek2ag2KZwua5NePQjOUA3qoHBU9ctqjCsjyAIB62W7Px
         fTMfs6QNGbLNlxr4Oc44fSdm0OQVz1QwyOXRxOAnZ7+eZOHYBC4I4gNtyxltci98Pv
         wPizpB8TT1ozyCzMspvW1SC5VJRi/4WXM576B3hZJSMGL3Zw2nfCVPbiNFviMkJ58B
         7XLkRG16XNnWEH7DmAonjSnYuaH/jLW/D6/ZcQuJ2nFlOPXXX0/1ym0szhssgvgv+A
         pEkCvFNGtGPyA==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andi Kleen <andi@firstfloor.org>,
        Ian Rogers <irogers@google.com>,
        Mark Wielaard <mark@klomp.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: fix duplicated flags in DEBUG_CFLAGS
Date:   Wed,  3 Feb 2021 16:52:39 +0900
Message-Id: <20210203075239.5505-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Sedat Dilek noticed duplicated debug flags passed when building C
files with CONFIG_DEBUG_INFO.

I do not know much about his build environment, but yes, Kbuild
recurses to the top Makefile with some build targets. For example,
'make CC=clang bindeb-pkg' reproduces the issue.

With commit 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments
for old GCC versions") applied, DEBUG_CFLAGS is now reset only when
CONFIG_CC_IS_GCC=y.

Fix it to reset DEBUG_CFLAGS also when using Clang.

Fixes: 121c5d08d53c ("kbuild: Only add -fno-var-tracking-assignments for old GCC versions")
Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3d3f67b98ca2..769a38ee81b9 100644
--- a/Makefile
+++ b/Makefile
@@ -811,10 +811,12 @@ KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
 KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 endif
 
+DEBUG_CFLAGS	:=
+
 # Workaround for GCC versions < 5.0
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
 ifdef CONFIG_CC_IS_GCC
-DEBUG_CFLAGS	:= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
+DEBUG_CFLAGS	+= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
 endif
 
 ifdef CONFIG_DEBUG_INFO
-- 
2.27.0

