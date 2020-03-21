Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C0818DCD3
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2020 01:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgCUAuM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Mar 2020 20:50:12 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:35097 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727905AbgCUAuK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Mar 2020 20:50:10 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec599b1;
        Sat, 21 Mar 2020 00:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=97eU/t7S2TVZqtyF+efQnC3Hd
        b4=; b=zYVv9BcZEG8F5tUUPNJVQvNAznHvnZXc5RQdIS//V9Dlv0WeU08QFw+Se
        PYahdM2LHgitwZoTYsFpw4w4RM+/U28ZNHXcUE6ZJ7p/+MmDL0lHB7EPvRuovUbR
        NE4b4xHAkOYCJedLByFgDPZ9THmbgs5fvoH0tA6L9a1YEjKPZPDniQi7iGs29qkt
        M1l+PxWs5stDsX+I83OWqoVVrY2P13KRRE73dzx21nNaLpwEb+M9CRO6+AB3Pm3n
        DkAOIpIa0m67XGux++B33RzbOz4o5ukrU8tbFajObMYO/nv9SuxL/ypckax2NKmy
        lQqb08Yopkx9KgXtUYU4ekXcPfw+g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 26ab3b27 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Sat, 21 Mar 2020 00:43:28 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        x86@kernel.org, linux-crypto@vger.kernel.org
Subject: [PATCH RFC 3/3] crypto: curve25519 - do not pollute dispatcher based on assembler
Date:   Fri, 20 Mar 2020 18:49:45 -0600
Message-Id: <20200321004945.451497-4-Jason@zx2c4.com>
In-Reply-To: <20200321004945.451497-1-Jason@zx2c4.com>
References: <CAHk-=wjbTF2iw3EbKgfiRRq_keb4fHwLO8xJyRXbfK3Q7cscuQ@mail.gmail.com>
 <20200321004945.451497-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since we're doing a static inline dispatch here, we normally branch
based on whether or not there's an arch implementation. That would have
been fine in general, except the crypto Makefile prior used to turn
things off -- despite the Kconfig -- resulting in us needing to also
hard code various assembler things into the dispatcher too. The horror!
Now that the assembler config options are done by Kconfig, we can get
rid of the inconsistency.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
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
2.25.1

