Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB332193A52
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgCZIEL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:04:11 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:19151 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgCZIEG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:04:06 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 02Q81Wpg002183;
        Thu, 26 Mar 2020 17:01:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02Q81Wpg002183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585209715;
        bh=n1XeZ1wVDljXai1fPjVNbhqgRjXfYjMjNINQQzEPCTo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XylL7NCibWYgEIVrdmEYUdWAnpVbPxd7As7VO4xh53v7ggirMQC2r+FKJpaJtZjSp
         Vi2wSf1SCw8GputRHnmhIxWFXoxN7Utu9iKxb9e5bqucyfcHELm6qBXIAhFUZ/Vkrl
         uw/B7p9TnRyfw+Dep5eQvNjh3R601pvsIF52/GTg6QJpsn8NpNTlRBxgzhTYjZyo8U
         LlkCqRJlfGkNtBB2id+RgBp6flAjo+ChEGz4T1bow4qGEVV2oAjxqE9Gjw87UULJ6a
         2JdrLfEdbRGdSkkKpVKi34Xk7NpqJbm/kQjoPkDDf8TTphQzoz15OAQJzSLnrMweo4
         JJwUev5omSA0g==
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
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/16] crypto: curve25519 - do not pollute dispatcher based on assembler
Date:   Thu, 26 Mar 2020 17:01:01 +0900
Message-Id: <20200326080104.27286-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Since we're doing a static inline dispatch here, we normally branch
based on whether or not there's an arch implementation. That would have
been fine in general, except the crypto Makefile prior used to turn
things off -- despite the Kconfig -- resulting in us needing to also
hard code various assembler things into the dispatcher too. The horror!
Now that the assembler config options are done by Kconfig, we can get
rid of the inconsistency.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 include/crypto/curve25519.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/crypto/curve25519.h b/include/crypto/curve25519.h
index 9ecb3c1f0f15..4e6dc840b159 100644
--- a/include/crypto/curve25519.h
+++ b/include/crypto/curve25519.h
@@ -33,8 +33,7 @@ bool __must_check curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
 			     const u8 secret[CURVE25519_KEY_SIZE],
 			     const u8 basepoint[CURVE25519_KEY_SIZE])
 {
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519) &&
-	    (!IS_ENABLED(CONFIG_CRYPTO_CURVE25519_X86) || IS_ENABLED(CONFIG_AS_ADX)))
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
 		curve25519_arch(mypublic, secret, basepoint);
 	else
 		curve25519_generic(mypublic, secret, basepoint);
@@ -50,8 +49,7 @@ __must_check curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
 				    CURVE25519_KEY_SIZE)))
 		return false;
 
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519) &&
-	    (!IS_ENABLED(CONFIG_CRYPTO_CURVE25519_X86) || IS_ENABLED(CONFIG_AS_ADX)))
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
 		curve25519_base_arch(pub, secret);
 	else
 		curve25519_generic(pub, secret, curve25519_base_point);
-- 
2.17.1

