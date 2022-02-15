Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 510D74B6512
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Feb 2022 09:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbiBOIDz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Feb 2022 03:03:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235125AbiBOIDw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Feb 2022 03:03:52 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5099C26AD4;
        Tue, 15 Feb 2022 00:03:37 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E9D041F38C;
        Tue, 15 Feb 2022 08:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644912215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zCf69rptHt9ZHpbXmy1+yom9p4cveoP07J+YhS2PHP0=;
        b=jlZ+X1ymgPJsfTCrU7eef/OoSZ5ncgaVvm6oyTGTqj75PoBlN3GoZYL10VXxn90NH2wpBa
        zF9xS9TD0osxOpbrM5zp48ITBoI0zv5WFbAWpfV6cPftnUMSp8G09XiQIjaXk9XiIm/CMp
        3JhWawUSRqlk1kphEnsHdGLcX/Bdlx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644912215;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zCf69rptHt9ZHpbXmy1+yom9p4cveoP07J+YhS2PHP0=;
        b=/bGdcU8cqxdyJxXfva/kszL6Tq/NPe55SrHlB4tkwayxEYTE4oQE1yPN+mvO+NwJmY33TN
        /ClGhgmMd7S56ZAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5B3513BE3;
        Tue, 15 Feb 2022 08:03:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FxRpJldeC2I3UgAAMHmgww
        (envelope-from <nstange@suse.de>); Tue, 15 Feb 2022 08:03:35 +0000
From:   Nicolai Stange <nstange@suse.de>
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-crypto@vger.kernel.org, Nicolai Stange <nstange@suse.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/1] crypto: vmx: Fix missing dependencies during boot
In-Reply-To: <20220214185638.1457-1-pvorel@suse.cz> (Petr Vorel's message of
        "Mon, 14 Feb 2022 19:56:38 +0100")
References: <20220214185638.1457-1-pvorel@suse.cz>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date:   Tue, 15 Feb 2022 09:03:35 +0100
Message-ID: <87zgmsmu94.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Petr,

Petr Vorel <pvorel@suse.cz> writes:

> if CRYPTO_DEV_VMX_ENCRYPT=3Dy && !CRYPTO_MANAGER_DISABLE_TESTS
> and either of CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or CRYPTO_XTS is built
> as module or disabled, alg_test() from crypto/testmgr.c complains during
> boot about failing to allocate the generic fallback implementations
> (2 =3D=3D ENOENT):
>
> [    0.540953] Failed to allocate xts(aes) fallback: -2
> [    0.541014] alg: skcipher: failed to allocate transform for p8_aes_xts=
: -2
> [    0.541120] alg: self-tests for p8_aes_xts (xts(aes)) failed (rc=3D-2)
> [    0.544440] Failed to allocate ctr(aes) fallback: -2
> [    0.544497] alg: skcipher: failed to allocate transform for p8_aes_ctr=
: -2
> [    0.544603] alg: self-tests for p8_aes_ctr (ctr(aes)) failed (rc=3D-2)
> [    0.547992] Failed to allocate cbc(aes) fallback: -2
> [    0.548052] alg: skcipher: failed to allocate transform for p8_aes_cbc=
: -2
> [    0.548156] alg: self-tests for p8_aes_cbc (cbc(aes)) failed (rc=3D-2)
> [    0.550745] Failed to allocate transformation for 'aes': -2
> [    0.550801] alg: cipher: Failed to load transform for p8_aes: -2
> [    0.550892] alg: self-tests for p8_aes (aes) failed (rc=3D-2)
>
>
> Check for these dependencies if crypto tests enabled.

From my POV the problem of missing dependencies on fallback
implementations is independent of the tests, the tests only happen to
exhibit the issue.


>
> NOTE: this requires all these dependencies to be builtin if
> !CRYPTO_MANAGER_DISABLE_TESTS, which is too strict on
> CRYPTO_DEV_VMX_ENCRYPT=3Dm.

FWIW, I would not make the dependency conditional on
!CRYPTO_MANAGER_DISABLE_TESTS.


>
> Fixes: c07f5d3da643 ("crypto: vmx - Adding support for XTS")
> Fixes: d2e3ae6f3aba ("crypto: vmx - Enabling VMX module for PPC64")
>
> Link: https://bugzilla.suse.com/show_bug.cgi?id=3D1195768
>
> Suggested-by: Nicolai Stange <nstange@suse.de>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> what am I missing to allow e.g. CRYPTO_AES=3Dm when
> CRYPTO_DEV_VMX_ENCRYPT=3Dm?

If you were to leave the condition on
!CRYPTO_MANAGER_DISABLE_TESTS away as suggested above, that is if you
expressed the dependency like this ...

	config CRYPTO_DEV_VMX
		[...]
		depends on CRYPTO_AES

... then this would impose an upper limit (with the ordering n < m < y)
of CRYPTO_AES on the possible values for CRYPTO_DEV_VMX. See
Documentation/kconfig-language.rst.

That is, if e.g. CRYPTO_AES=3Dm, then only CRYPTO_DEV_VMX=3Dn/m would be va=
lid
choices.


I wouldn't go with "depends on", but prefer "select" in this case
though. "select" is similar, but imposes a lower bound on the selected
Kconfig symbol.

That is,

	config CRYPTO_DEV_VMX
		[...]
		select CRYPTO_AES

would force the value of CRYPTO_AES to >=3D whatever the user picks for
CRYPTO_DEV_VMX.

(According to Documentation/kconfig-language.rst, you could even make
 this conditional on !CRYPTO_MANAGER_DISABLE_TESTS:

 	select CRYPTO_AES if !CRYPTO_MANAGER_DISABLE_TESTS
)

Note that the 'select CRYPTO_AES' approach seems consistent to what is
done for all the other crypto drivers depending on fallbacks, c.f. e.g
drivers/crypto/Kconfig.

Thanks,

Nicolai


>
>  drivers/crypto/vmx/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/crypto/vmx/Kconfig b/drivers/crypto/vmx/Kconfig
> index c85fab7ef0bd..d692802fad9e 100644
> --- a/drivers/crypto/vmx/Kconfig
> +++ b/drivers/crypto/vmx/Kconfig
> @@ -2,6 +2,10 @@
>  config CRYPTO_DEV_VMX_ENCRYPT
>  	tristate "Encryption acceleration support on P8 CPU"
>  	depends on CRYPTO_DEV_VMX
> +	depends on CRYPTO_MANAGER_DISABLE_TESTS && CRYPTO_AES || CRYPTO_AES=3Dy
> +	depends on CRYPTO_MANAGER_DISABLE_TESTS && CRYPTO_CBC || CRYPTO_CBC=3Dy
> +	depends on CRYPTO_MANAGER_DISABLE_TESTS && CRYPTO_CTR || CRYPTO_CTR=3Dy
> +	depends on CRYPTO_MANAGER_DISABLE_TESTS && CRYPTO_XTS || CRYPTO_XTS=3Dy
>  	select CRYPTO_GHASH
>  	default m
>  	help

--=20
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, G=
ermany
(HRB 36809, AG N=C3=BCrnberg), GF: Ivo Totev
