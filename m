Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAFF19084A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 09:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgCXIv5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 04:51:57 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:17199 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCXIvK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 04:51:10 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 02O8mgsn011219;
        Tue, 24 Mar 2020 17:49:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02O8mgsn011219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585039744;
        bh=wo4v6sLSkF3zJEtLmurbhlkARw0fSZMgaGV3bKygv0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xUZZ70B8uhAJkLWLusQssl/Vf5mJTcGCO61GcA9/TTu8hRi5i0D70gaZTmiStGjJ/
         p5m7p3EOP/58XcO1P2/9mGMIpwwDtwtEeMtUbDgeRgWqKJCMEUbFqC6M1VXxBK3zNR
         yjhA5WT8KXTH+yVkhjdeurlm1dmlTAXG8vptHguUWQXo4GysYZkCuAN8q7Om+M2R2Y
         eb5M8ayg0Pj17XVwgad/CvVzUZGjohpFOAC5LhvQImZxgZ56f9m6Kt3LIYwvGLfwQS
         LBqwzcnDZRWaot7GcgAPKezCYuoW4I69MukhJGM2Zm81Hv5kZhF+X9h0teLmLsJfJ2
         cbI6TtQnac5AA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux@googlegroups.com,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 16/16] crypto: x86 - clean up poly1305-x86_64-cryptogams.S by 'make clean'
Date:   Tue, 24 Mar 2020 17:48:21 +0900
Message-Id: <20200324084821.29944-17-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
References: <20200324084821.29944-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

poly1305-x86_64-cryptogams.S is a generated file, so it should be
cleaned up by 'make clean'.

Assigning it to the variable 'targets' teaches Kbuild that it is a
generated file. However, this line is not evaluated while cleaning
because scripts/Makefile.clean does not include include/config/auto.conf.

Removing the ifneq-conditional, so this file is correctly cleaned up.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/x86/crypto/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 928aad453c72..a31de0c6ccde 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -83,9 +83,7 @@ crct10dif-pclmul-y := crct10dif-pcl-asm_64.o crct10dif-pclmul_glue.o
 
 obj-$(CONFIG_CRYPTO_POLY1305_X86_64) += poly1305-x86_64.o
 poly1305-x86_64-y := poly1305-x86_64-cryptogams.o poly1305_glue.o
-ifneq ($(CONFIG_CRYPTO_POLY1305_X86_64),)
 targets += poly1305-x86_64-cryptogams.S
-endif
 
 obj-$(CONFIG_CRYPTO_NHPOLY1305_SSE2) += nhpoly1305-sse2.o
 nhpoly1305-sse2-y := nh-sse2-x86_64.o nhpoly1305-sse2-glue.o
-- 
2.17.1

