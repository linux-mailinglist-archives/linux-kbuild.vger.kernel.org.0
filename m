Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095B34B5A4E
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Feb 2022 20:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiBNTB7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Feb 2022 14:01:59 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:36260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiBNTB2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Feb 2022 14:01:28 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B8FD227A;
        Mon, 14 Feb 2022 11:01:12 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2193E1F383;
        Mon, 14 Feb 2022 18:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1644865003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=f+iOC1OijgKnwOeDeGI5sZj1eeXHvVIuPR8OLLmfj1Y=;
        b=m7JcsLVnh6+9B+5w+vU+hjxLzDc88ZdY3A6A5r+0TmhioRAkB6QK1DKwKAmg8S5I/Ffx5Y
        nn9196foRWWRGpADWdJbFO2KTy76nsRsBRHRjiVz4hsa4MHkMDJsKYt08KT+Kfao/eHiv+
        A9vUDkJ3kuXFQQ3umRpXycoRsAHLR/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1644865003;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=f+iOC1OijgKnwOeDeGI5sZj1eeXHvVIuPR8OLLmfj1Y=;
        b=0UzndL++7JY+Au/wZw9aK83EG62p/EFrmvKqFMHQpFZAg/Bj99Q5Pc96t2pY8yH3x9+SBG
        fXxVAPBTuyCxI7Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D700813B55;
        Mon, 14 Feb 2022 18:56:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id JWxzMuqlCmKLSwAAMHmgww
        (envelope-from <pvorel@suse.cz>); Mon, 14 Feb 2022 18:56:42 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-crypto@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, Nicolai Stange <nstange@suse.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 1/1] crypto: vmx: Fix missing dependencies during boot
Date:   Mon, 14 Feb 2022 19:56:38 +0100
Message-Id: <20220214185638.1457-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

if CRYPTO_DEV_VMX_ENCRYPT=y && !CRYPTO_MANAGER_DISABLE_TESTS
and either of CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or CRYPTO_XTS is built
as module or disabled, alg_test() from crypto/testmgr.c complains during
boot about failing to allocate the generic fallback implementations
(2 == ENOENT):

[    0.540953] Failed to allocate xts(aes) fallback: -2
[    0.541014] alg: skcipher: failed to allocate transform for p8_aes_xts: -2
[    0.541120] alg: self-tests for p8_aes_xts (xts(aes)) failed (rc=-2)
[    0.544440] Failed to allocate ctr(aes) fallback: -2
[    0.544497] alg: skcipher: failed to allocate transform for p8_aes_ctr: -2
[    0.544603] alg: self-tests for p8_aes_ctr (ctr(aes)) failed (rc=-2)
[    0.547992] Failed to allocate cbc(aes) fallback: -2
[    0.548052] alg: skcipher: failed to allocate transform for p8_aes_cbc: -2
[    0.548156] alg: self-tests for p8_aes_cbc (cbc(aes)) failed (rc=-2)
[    0.550745] Failed to allocate transformation for 'aes': -2
[    0.550801] alg: cipher: Failed to load transform for p8_aes: -2
[    0.550892] alg: self-tests for p8_aes (aes) failed (rc=-2)

Check for these dependencies if crypto tests enabled.

NOTE: this requires all these dependencies to be builtin if
!CRYPTO_MANAGER_DISABLE_TESTS, which is too strict on
CRYPTO_DEV_VMX_ENCRYPT=m.

Fixes: c07f5d3da643 ("crypto: vmx - Adding support for XTS")
Fixes: d2e3ae6f3aba ("crypto: vmx - Enabling VMX module for PPC64")

Link: https://bugzilla.suse.com/show_bug.cgi?id=1195768

Suggested-by: Nicolai Stange <nstange@suse.de>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

what am I missing to allow e.g. CRYPTO_AES=m when
CRYPTO_DEV_VMX_ENCRYPT=m?

Kind regards,
Petr

 drivers/crypto/vmx/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/vmx/Kconfig b/drivers/crypto/vmx/Kconfig
index c85fab7ef0bd..d692802fad9e 100644
--- a/drivers/crypto/vmx/Kconfig
+++ b/drivers/crypto/vmx/Kconfig
@@ -2,6 +2,10 @@
 config CRYPTO_DEV_VMX_ENCRYPT
 	tristate "Encryption acceleration support on P8 CPU"
 	depends on CRYPTO_DEV_VMX
+	depends on CRYPTO_MANAGER_DISABLE_TESTS && CRYPTO_AES || CRYPTO_AES=y
+	depends on CRYPTO_MANAGER_DISABLE_TESTS && CRYPTO_CBC || CRYPTO_CBC=y
+	depends on CRYPTO_MANAGER_DISABLE_TESTS && CRYPTO_CTR || CRYPTO_CTR=y
+	depends on CRYPTO_MANAGER_DISABLE_TESTS && CRYPTO_XTS || CRYPTO_XTS=y
 	select CRYPTO_GHASH
 	default m
 	help
-- 
2.35.1

