Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF72D193A48
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgCZIEL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:04:11 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:19272 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbgCZIEK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:04:10 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 02Q81Wpj002183;
        Thu, 26 Mar 2020 17:01:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02Q81Wpj002183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585209720;
        bh=hIsNK2mlczhM03FNvMHtWUtfrXi/KhhBhq2867qeZmE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GvWqaSzD9xT5uODtdnr/882na6kKn1QBAVOILiFIQlVX6kWqUB22RnovMTt7ZxJ84
         ESb8TfYOBqsEC1BYm6Cx94QPQ6O3YKc1TD6aud7FQkcRcJeFq/Tn3AMGq3YwpfOOyD
         pLhb2xNBormTFeuq8HCJ1EdhTPzp/Z4ZyXZC4acOMdRUKj4gnl85IhE0xfIz1t27s2
         NQR5GpEYbGmUVA7dUHt9/ilX4A3SCo1Yi3Pz2t5yk0DplehZK1KCszO9EkloGrBDIh
         GvPffDTyG4lUIfs5anCV4982lrT0ZoOT0ruFNb9YWeaBzVqDFjq+Gpn91Sb782Ox0F
         s3l8D/rgxJzBA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/16] crypto: x86 - clean up poly1305-x86_64-cryptogams.S by 'make clean'
Date:   Thu, 26 Mar 2020 17:01:04 +0900
Message-Id: <20200326080104.27286-17-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
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
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
---

Changes in v2: None

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

