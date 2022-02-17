Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055934B9E2A
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Feb 2022 12:02:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239703AbiBQK7J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Feb 2022 05:59:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239606AbiBQK6t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Feb 2022 05:58:49 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E3317A90;
        Thu, 17 Feb 2022 02:58:03 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2D10A21991;
        Thu, 17 Feb 2022 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645095481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BWifxgAR/Z495cVFocnolcIW5XpC70uze6lvb8LtCTg=;
        b=QjyBknuEto9Q9s36hn0fOg9mYBlkG30wBXmAflfbDDykG40GO+NGmXHi2GDybQ/PZPCHxU
        Gxkwt6vzmnavAmxHHjoJ3doHeWQEpezRyHN+eXcm1t0lrx3z7OXBXnwxd4dXZaQP7iR6ib
        yGGN4enmc1Ch9Z0Fsd12v4qOexLInxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645095481;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BWifxgAR/Z495cVFocnolcIW5XpC70uze6lvb8LtCTg=;
        b=kqtJMiiuDYJxUG1xYWedaAyqSl6ER1f5n+1Aza1p+QfHxJQB14HQ358hl+AbmAWdVG83XH
        yNNiCWRtqCK2okAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D20C013DD8;
        Thu, 17 Feb 2022 10:58:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WBGmMTgqDmJdTgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Thu, 17 Feb 2022 10:58:00 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-crypto@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, Nicolai Stange <nstange@suse.de>,
        Herbert Xu <herbert@gondor.apana.org.au>, leitao@debian.org,
        Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v3 2/2] crypto: vmx - add missing dependencies
Date:   Thu, 17 Feb 2022 11:57:51 +0100
Message-Id: <20220217105751.6330-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217105751.6330-1-pvorel@suse.cz>
References: <20220217105751.6330-1-pvorel@suse.cz>
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

vmx-crypto module depends on CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or
CRYPTO_XTS, thus add them.

These dependencies are likely to be enabled, but if
CRYPTO_DEV_VMX=y && !CRYPTO_MANAGER_DISABLE_TESTS
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

Fixes: c07f5d3da643 ("crypto: vmx - Adding support for XTS")
Fixes: d2e3ae6f3aba ("crypto: vmx - Enabling VMX module for PPC64")

Suggested-by: Nicolai Stange <nstange@suse.de>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v2->v3:
* more less the same, just in drivers/crypto/Kconfig (previously it was
  in drivers/crypto/vmx/Kconfig)
* change commit subject to be compatible

 drivers/crypto/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 923fa1effb4a..0eafb2a49f04 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -764,7 +764,11 @@ config CRYPTO_DEV_QCOM_RNG
 config CRYPTO_DEV_VMX
 	tristate "Power VMX cryptographic acceleration instructions driver"
 	depends on PPC64 && VSX
+	select CRYPTO_AES
+	select CRYPTO_CBC
+	select CRYPTO_CTR
 	select CRYPTO_GHASH
+	select CRYPTO_XTS
 	help
 	  Support for VMX cryptographic acceleration instructions on Power8 CPU.
 	  This module supports acceleration for AES and GHASH in hardware. If you
-- 
2.35.1

