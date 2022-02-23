Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 390BD4C0A3A
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Feb 2022 04:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237883AbiBWDaH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Feb 2022 22:30:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237874AbiBWDaG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Feb 2022 22:30:06 -0500
X-Greylist: delayed 1894 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Feb 2022 19:29:40 PST
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0058639141;
        Tue, 22 Feb 2022 19:29:39 -0800 (PST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1nMhrU-0006Db-0w; Wed, 23 Feb 2022 13:58:41 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Feb 2022 14:58:40 +1200
Date:   Wed, 23 Feb 2022 14:58:39 +1200
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-crypto@vger.kernel.org, Nicolai Stange <nstange@suse.de>,
        leitao@debian.org, Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 2/2] crypto: vmx - add missing dependencies
Message-ID: <YhWi3xAOXlF+tKan@gondor.apana.org.au>
References: <20220217105751.6330-1-pvorel@suse.cz>
 <20220217105751.6330-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217105751.6330-3-pvorel@suse.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 17, 2022 at 11:57:51AM +0100, Petr Vorel wrote:
> vmx-crypto module depends on CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or
> CRYPTO_XTS, thus add them.
> 
> These dependencies are likely to be enabled, but if
> CRYPTO_DEV_VMX=y && !CRYPTO_MANAGER_DISABLE_TESTS
> and either of CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or CRYPTO_XTS is built
> as module or disabled, alg_test() from crypto/testmgr.c complains during
> boot about failing to allocate the generic fallback implementations
> (2 == ENOENT):
> 
> [    0.540953] Failed to allocate xts(aes) fallback: -2
> [    0.541014] alg: skcipher: failed to allocate transform for p8_aes_xts: -2
> [    0.541120] alg: self-tests for p8_aes_xts (xts(aes)) failed (rc=-2)
> [    0.544440] Failed to allocate ctr(aes) fallback: -2
> [    0.544497] alg: skcipher: failed to allocate transform for p8_aes_ctr: -2
> [    0.544603] alg: self-tests for p8_aes_ctr (ctr(aes)) failed (rc=-2)
> [    0.547992] Failed to allocate cbc(aes) fallback: -2
> [    0.548052] alg: skcipher: failed to allocate transform for p8_aes_cbc: -2
> [    0.548156] alg: self-tests for p8_aes_cbc (cbc(aes)) failed (rc=-2)
> [    0.550745] Failed to allocate transformation for 'aes': -2
> [    0.550801] alg: cipher: Failed to load transform for p8_aes: -2
> [    0.550892] alg: self-tests for p8_aes (aes) failed (rc=-2)
> 
> Fixes: c07f5d3da643 ("crypto: vmx - Adding support for XTS")
> Fixes: d2e3ae6f3aba ("crypto: vmx - Enabling VMX module for PPC64")
> 
> Suggested-by: Nicolai Stange <nstange@suse.de>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> changes v2->v3:
> * more less the same, just in drivers/crypto/Kconfig (previously it was
>   in drivers/crypto/vmx/Kconfig)
> * change commit subject to be compatible
> 
>  drivers/crypto/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Please respin this patch to add the selects to the existing tristate.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
