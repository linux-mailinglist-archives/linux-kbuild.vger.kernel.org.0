Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 790FC4B698F
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Feb 2022 11:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbiBOKkg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Feb 2022 05:40:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235184AbiBOKkg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Feb 2022 05:40:36 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8CE8AE4A;
        Tue, 15 Feb 2022 02:40:26 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5D2E41F38A;
        Tue, 15 Feb 2022 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1644921625;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LH+6QHM+39EVmjNMVNzBs9LSBpyEZRdTniFjXxXP47Q=;
        b=h/ncyYe1h+hDGzIj4ElxEcuR6VnWw4hX1/CMiXI3APJnWFFGNzE6DdQKZa/9hf9Qhrmv5+
        5qNdDuAv2YCSRcE5uQWKjRDMh3BUxHNokCch61tl1ccMrsnXm/3JphAabgRCdgae0NU7JG
        O1xQr8csXZnvCIA+uS76j3XhbROFHhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1644921625;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LH+6QHM+39EVmjNMVNzBs9LSBpyEZRdTniFjXxXP47Q=;
        b=7IDqbD8GLPMxm1rYrUHXxxSBrfJJwgQIsCXYLY+rGxptzkQbE3D5xuYSJXCBsVgqDf1i2q
        JGuocuyW+qmn9oDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29C8313C16;
        Tue, 15 Feb 2022 10:40:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0Kj4CBmDC2J0JQAAMHmgww
        (envelope-from <pvorel@suse.cz>); Tue, 15 Feb 2022 10:40:25 +0000
Date:   Tue, 15 Feb 2022 11:40:23 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Nicolai Stange <nstange@suse.de>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/1] crypto: vmx: Fix missing dependencies during boot
Message-ID: <YguDF5YbyKTGsc3/@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20220214185638.1457-1-pvorel@suse.cz>
 <87zgmsmu94.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgmsmu94.fsf@suse.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nicolai,

> Hi Petr,

> Petr Vorel <pvorel@suse.cz> writes:

> > if CRYPTO_DEV_VMX_ENCRYPT=y && !CRYPTO_MANAGER_DISABLE_TESTS
> > and either of CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or CRYPTO_XTS is built
> > as module or disabled, alg_test() from crypto/testmgr.c complains during
> > boot about failing to allocate the generic fallback implementations
> > (2 == ENOENT):

> > [    0.540953] Failed to allocate xts(aes) fallback: -2
> > [    0.541014] alg: skcipher: failed to allocate transform for p8_aes_xts: -2
> > [    0.541120] alg: self-tests for p8_aes_xts (xts(aes)) failed (rc=-2)
> > [    0.544440] Failed to allocate ctr(aes) fallback: -2
> > [    0.544497] alg: skcipher: failed to allocate transform for p8_aes_ctr: -2
> > [    0.544603] alg: self-tests for p8_aes_ctr (ctr(aes)) failed (rc=-2)
> > [    0.547992] Failed to allocate cbc(aes) fallback: -2
> > [    0.548052] alg: skcipher: failed to allocate transform for p8_aes_cbc: -2
> > [    0.548156] alg: self-tests for p8_aes_cbc (cbc(aes)) failed (rc=-2)
> > [    0.550745] Failed to allocate transformation for 'aes': -2
> > [    0.550801] alg: cipher: Failed to load transform for p8_aes: -2
> > [    0.550892] alg: self-tests for p8_aes (aes) failed (rc=-2)


> > Check for these dependencies if crypto tests enabled.

> From my POV the problem of missing dependencies on fallback
> implementations is independent of the tests, the tests only happen to
> exhibit the issue.
I thought that after boot missing ciphers would be available from module and
loaded. But you're most likely right.


> > NOTE: this requires all these dependencies to be builtin if
> > !CRYPTO_MANAGER_DISABLE_TESTS, which is too strict on
> > CRYPTO_DEV_VMX_ENCRYPT=m.

> FWIW, I would not make the dependency conditional on
> !CRYPTO_MANAGER_DISABLE_TESTS.
You're right, I wasn't sure myself to use !CRYPTO_MANAGER_DISABLE_TESTS
as I also noticed that most of the dependencies in crypto/Kconfig and
drivers/crypto/Kconfig are described via "select".

...
> > what am I missing to allow e.g. CRYPTO_AES=m when
> > CRYPTO_DEV_VMX_ENCRYPT=m?

> If you were to leave the condition on
> !CRYPTO_MANAGER_DISABLE_TESTS away as suggested above, that is if you
> expressed the dependency like this ...

> 	config CRYPTO_DEV_VMX
> 		[...]
> 		depends on CRYPTO_AES

> ... then this would impose an upper limit (with the ordering n < m < y)
> of CRYPTO_AES on the possible values for CRYPTO_DEV_VMX. See
> Documentation/kconfig-language.rst.

> That is, if e.g. CRYPTO_AES=m, then only CRYPTO_DEV_VMX=n/m would be valid
> choices.


> I wouldn't go with "depends on", but prefer "select" in this case
> though. "select" is similar, but imposes a lower bound on the selected
> Kconfig symbol.

> That is,

> 	config CRYPTO_DEV_VMX
> 		[...]
> 		select CRYPTO_AES

Yep, I also tried select, but on CRYPTO_DEV_VMX_ENCRYPT, that's why it was not
working. Thanks for explanation and a hint => going to send v2.

Kind regards,
Petr

> would force the value of CRYPTO_AES to >= whatever the user picks for
> CRYPTO_DEV_VMX.

> (According to Documentation/kconfig-language.rst, you could even make
>  this conditional on !CRYPTO_MANAGER_DISABLE_TESTS:

>  	select CRYPTO_AES if !CRYPTO_MANAGER_DISABLE_TESTS
> )

> Note that the 'select CRYPTO_AES' approach seems consistent to what is
> done for all the other crypto drivers depending on fallbacks, c.f. e.g
> drivers/crypto/Kconfig.

> Thanks,

> Nicolai
