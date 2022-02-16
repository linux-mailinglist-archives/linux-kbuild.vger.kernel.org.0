Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94244B8465
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Feb 2022 10:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbiBPJdQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Feb 2022 04:33:16 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbiBPJdP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Feb 2022 04:33:15 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281C09BBAC;
        Wed, 16 Feb 2022 01:33:04 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id D50A81F383;
        Wed, 16 Feb 2022 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1645003982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cm5AQQp0a7+cF9FKJnrJKZk4PS3iUbRyEAyckm/X4TI=;
        b=vhPVK/gvcTeqGBs9PnYXK4vPKKb2z+G7rOsc8UTYubnPh7KXtGvAREA4Tg+qSeGmQmTnuu
        n681xPpLBFJGu/757/412/e9Bgfxj8MBl2kipf6SWGvmcarr1xKuc4x5UVRVwCQzDozurC
        v0o0znmF/Wsg6OUSFtIANGT127H4YCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1645003982;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cm5AQQp0a7+cF9FKJnrJKZk4PS3iUbRyEAyckm/X4TI=;
        b=LXM33yEiPiyv6aaYrqzs/Q92dsp+Cvlz2r3wOQM0Jl5hTEzJjWNCwgkuOC+1Wnh8qfM1F3
        ysWjjVIVMn01PkCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7737213A9F;
        Wed, 16 Feb 2022 09:33:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ldw7G87EDGJTcQAAMHmgww
        (envelope-from <nstange@suse.de>); Wed, 16 Feb 2022 09:33:02 +0000
From:   Nicolai Stange <nstange@suse.de>
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-crypto@vger.kernel.org, Nicolai Stange <nstange@suse.de>,
        Herbert Xu <herbert@gondor.apana.org.au>, leitao@debian.org,
        Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/2] crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into tristate
References: <20220215185936.15576-1-pvorel@suse.cz>
        <20220215185936.15576-2-pvorel@suse.cz>
Date:   Wed, 16 Feb 2022 10:33:01 +0100
In-Reply-To: <20220215185936.15576-2-pvorel@suse.cz> (Petr Vorel's message of
        "Tue, 15 Feb 2022 19:59:35 +0100")
Message-ID: <87tuczf96a.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
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

> and remove CRYPTO_DEV_VMX, which looked redundant when only
> CRYPTO_DEV_VMX_ENCRYPT used it. Also it forces CRYPTO_GHASH to be
> builtin even CRYPTO_DEV_VMX_ENCRYPT was configured as module.

I'm confused by the description. CRYPTO_DEV_VMX_ENCRYPT has been a
tristate since ever? And thus, with CRYPTO_DEV_VMX_ENCRYPT=3Dm,
CRYPTO_GHASH=3Dm would be possible as far as vmx is concerned?

What this patch really does is to merge CRYPTO_DEV_VMX into
CRYPTO_DEV_VMX_ENCRYPT AFAICS.

These two seem indeed redundant to me, but for consistency with the
other crypto drivers (e.g. bcm, ccree, ...), I'd rather keep
CRYPTO_DEV_VMX and merge CRYPTO_DEV_VMX_ENCRYPT into it.


> Update powerpc defconfigs and description in MAINTAINERS.

The change to MAINTAINERS is completely unrelated? If anything, it had
to come with a separate patch then.


>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> new in v2
>
> This might be a bit aggressive, but IMHO CRYPTO_DEV_VMX only complicated
> things for nothing.

I agree on the redundancy, but as said, CRYPTO_DEV_VMX_ENCRYPT should
probably the one to get dropped in favor of CRYPTO_DEV_VMX.


> But if you do *not* agree with removing it, I just add
> select to drivers/crypto/vmx/Kconfig (which forces dependencies to be
> always modules.)
>
> If it's ok for you to remove, please also check whether the description
> is ok. get_maintainer.pl script has size limitation:
>
> $ ./scripts/get_maintainer.pl drivers/crypto/vmx/Kconfig
> ...
> linux-crypto@vger.kernel.org (open list:IBM Power VMX Cryptographic Accel=
eration Instru...)
>
> maybe the name should be shorter.
>
> Kind regards,
> Petr
>
>  MAINTAINERS                            | 2 +-
>  arch/powerpc/configs/powernv_defconfig | 2 +-
>  arch/powerpc/configs/ppc64_defconfig   | 2 +-
>  arch/powerpc/configs/pseries_defconfig | 2 +-
>  drivers/crypto/Kconfig                 | 6 ------
>  drivers/crypto/vmx/Kconfig             | 4 ++--
>  6 files changed, 6 insertions(+), 12 deletions(-)

If you were to drop CONFIG_CRYPTO_DEV_VMX (like it's implemented in this
patch), then something had to be done about

  obj-$(CONFIG_CRYPTO_DEV_VMX) +=3D vmx/

in drivers/crypto/Makefile as well.

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..80e562579180 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9207,7 +9207,7 @@ L:	target-devel@vger.kernel.org
>  S:	Supported
>  F:	drivers/scsi/ibmvscsi_tgt/
>=20=20
> -IBM Power VMX Cryptographic instructions
> +IBM Power VMX Cryptographic Acceleration Instructions Driver
>  M:	Breno Leit=C3=A3o <leitao@debian.org>
>  M:	Nayna Jain <nayna@linux.ibm.com>
>  M:	Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
> diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/config=
s/powernv_defconfig
> index 49f49c263935..4b250d05dcdf 100644
> --- a/arch/powerpc/configs/powernv_defconfig
> +++ b/arch/powerpc/configs/powernv_defconfig
> @@ -337,7 +337,7 @@ CONFIG_CRYPTO_TEA=3Dm
>  CONFIG_CRYPTO_TWOFISH=3Dm
>  CONFIG_CRYPTO_LZO=3Dm
>  CONFIG_CRYPTO_DEV_NX=3Dy
> -CONFIG_CRYPTO_DEV_VMX=3Dy
> +CONFIG_CRYPTO_DEV_VMX_ENCRYPT=3Dm
>  CONFIG_VIRTUALIZATION=3Dy
>  CONFIG_KVM_BOOK3S_64=3Dm
>  CONFIG_KVM_BOOK3S_64_HV=3Dm
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/=
ppc64_defconfig
> index c8b0e80d613b..ebd33b94debb 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -355,7 +355,7 @@ CONFIG_CRYPTO_TWOFISH=3Dm
>  CONFIG_CRYPTO_LZO=3Dm
>  CONFIG_CRYPTO_DEV_NX=3Dy
>  CONFIG_CRYPTO_DEV_NX_ENCRYPT=3Dm
> -CONFIG_CRYPTO_DEV_VMX=3Dy
> +CONFIG_CRYPTO_DEV_VMX_ENCRYPT=3Dm
>  CONFIG_PRINTK_TIME=3Dy
>  CONFIG_PRINTK_CALLER=3Dy
>  CONFIG_MAGIC_SYSRQ=3Dy
> diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/config=
s/pseries_defconfig
> index b571d084c148..304673817ef1 100644
> --- a/arch/powerpc/configs/pseries_defconfig
> +++ b/arch/powerpc/configs/pseries_defconfig
> @@ -315,7 +315,7 @@ CONFIG_CRYPTO_TWOFISH=3Dm
>  CONFIG_CRYPTO_LZO=3Dm
>  CONFIG_CRYPTO_DEV_NX=3Dy
>  CONFIG_CRYPTO_DEV_NX_ENCRYPT=3Dm
> -CONFIG_CRYPTO_DEV_VMX=3Dy
> +CONFIG_CRYPTO_DEV_VMX_ENCRYPT=3Dm
>  CONFIG_VIRTUALIZATION=3Dy
>  CONFIG_KVM_BOOK3S_64=3Dm
>  CONFIG_KVM_BOOK3S_64_HV=3Dm
> diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
> index 4f705674f94f..956f956607a5 100644
> --- a/drivers/crypto/Kconfig
> +++ b/drivers/crypto/Kconfig
> @@ -761,12 +761,6 @@ config CRYPTO_DEV_QCOM_RNG
>  	  To compile this driver as a module, choose M here. The
>  	  module will be called qcom-rng. If unsure, say N.
>=20=20
> -config CRYPTO_DEV_VMX
> -	bool "Support for VMX cryptographic acceleration instructions"
> -	depends on PPC64 && VSX
> -	help
> -	  Support for VMX cryptographic acceleration instructions.
> -

As said, I'd keep this one (while moving the GHASH dependency here) ...


>  source "drivers/crypto/vmx/Kconfig"

... and drop this one.

Thanks,

Nicolai


>=20=20
>  config CRYPTO_DEV_IMGTEC_HASH
> diff --git a/drivers/crypto/vmx/Kconfig b/drivers/crypto/vmx/Kconfig
> index c85fab7ef0bd..1a3808b719f3 100644
> --- a/drivers/crypto/vmx/Kconfig
> +++ b/drivers/crypto/vmx/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config CRYPTO_DEV_VMX_ENCRYPT
> -	tristate "Encryption acceleration support on P8 CPU"
> -	depends on CRYPTO_DEV_VMX
> +	tristate "Power VMX cryptographic acceleration instructions driver"
> +	depends on PPC64 && VSX
>  	select CRYPTO_GHASH
>  	default m
>  	help

--=20
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, G=
ermany
(HRB 36809, AG N=C3=BCrnberg), GF: Ivo Totev
