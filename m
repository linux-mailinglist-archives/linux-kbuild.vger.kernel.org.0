Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC2A4B8503
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Feb 2022 10:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbiBPJ5t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Feb 2022 04:57:49 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbiBPJ5s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Feb 2022 04:57:48 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9593925FE7C;
        Wed, 16 Feb 2022 01:57:36 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 1B7A21F394;
        Wed, 16 Feb 2022 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645005455;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jEd2gqys+WdbPF99hwlntiZI0r9WBnOaSLZv86pD5a0=;
        b=hqb40SAmmJ2G4hCj8HB9CjgOEVxXUHQRvoWkb100mr2O2v+74AjscOj9AzlkTiQ9hnQdHv
        GMiIwPeoiYGpA30oy9Uma5FEhczWvAnzxnnADeeQ+8hv/Ee5qYec2MRUcqDH/F3yh8W84u
        XuKY3vXbpmWizlzQzjTyoByTh6peDBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645005455;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jEd2gqys+WdbPF99hwlntiZI0r9WBnOaSLZv86pD5a0=;
        b=QtaJZMt+0aDwQYqlaigDcs5mJWTHsHvZHpvjtIn0ieTMsZ0sHsasWVn48nxOrkRWXFdOWo
        SgjaCdgucLMFOmCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8FD813A9F;
        Wed, 16 Feb 2022 09:57:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id jb5+Ko7KDGIdfgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Wed, 16 Feb 2022 09:57:34 +0000
Date:   Wed, 16 Feb 2022 10:57:33 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Nicolai Stange <nstange@suse.de>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>, leitao@debian.org,
        Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/2] crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into
 tristate
Message-ID: <YgzKjVKsNXtqqXOy@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20220215185936.15576-1-pvorel@suse.cz>
 <20220215185936.15576-2-pvorel@suse.cz>
 <87tuczf96a.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuczf96a.fsf@suse.de>
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

thanks for all your comments.

> Hi Petr,

> Petr Vorel <pvorel@suse.cz> writes:

> > and remove CRYPTO_DEV_VMX, which looked redundant when only
> > CRYPTO_DEV_VMX_ENCRYPT used it. Also it forces CRYPTO_GHASH to be
> > builtin even CRYPTO_DEV_VMX_ENCRYPT was configured as module.

> I'm confused by the description. CRYPTO_DEV_VMX_ENCRYPT has been a
> tristate since ever? And thus, with CRYPTO_DEV_VMX_ENCRYPT=m,
> CRYPTO_GHASH=m would be possible as far as vmx is concerned?

I'm sorry, the description is wrong.

I'm not kconfig expert and I verify it again, but I run into it when testing
this with defconfig:
$ make defconfig && scripts/config --enable CONFIG_KVM_GUEST --disable
CRYPTO_MANAGER_DISABLE_TESTS --enable CONFIG_MODULE_SIG

It somehow inherits CRYPTO_DEV_VMX=y. But I'll verify it again.

> What this patch really does is to merge CRYPTO_DEV_VMX into
> CRYPTO_DEV_VMX_ENCRYPT AFAICS.
+1 This is a proper description.

> These two seem indeed redundant to me, but for consistency with the
> other crypto drivers (e.g. bcm, ccree, ...), I'd rather keep
> CRYPTO_DEV_VMX and merge CRYPTO_DEV_VMX_ENCRYPT into it.
I'm not sure myself, because some other modules also have Kconfig.

$ ls -1 drivers/crypto/*/Kconfig
drivers/crypto/allwinner/Kconfig
drivers/crypto/amlogic/Kconfig
drivers/crypto/caam/Kconfig
drivers/crypto/ccp/Kconfig
drivers/crypto/hisilicon/Kconfig
drivers/crypto/chelsio/Kconfig
drivers/crypto/keembay/Kconfig
drivers/crypto/marvell/Kconfig
drivers/crypto/nx/Kconfig
drivers/crypto/qat/Kconfig
drivers/crypto/stm32/Kconfig
drivers/crypto/ux500/Kconfig
drivers/crypto/virtio/Kconfig
drivers/crypto/vmx/Kconfig

Sure, some of them have many config options in Kconfig, but
at least drivers/crypto/chelsio/Kconfig and drivers/crypto/virtio/Kconfig
configure just the module. Given it's just these two, I should probably merge
CRYPTO_DEV_VMX_ENCRYPT into CRYPTO_DEV_VMX as you suggest (also defconfig
changes would not be needed).
@Herbert, Nayna, Paulo, Breno: any preference of these.

> > Update powerpc defconfigs and description in MAINTAINERS.

> The change to MAINTAINERS is completely unrelated? If anything, it had
> to come with a separate patch then.

You're right, I was hesitating myself.


> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > new in v2

> > This might be a bit aggressive, but IMHO CRYPTO_DEV_VMX only complicated
> > things for nothing.

> I agree on the redundancy, but as said, CRYPTO_DEV_VMX_ENCRYPT should
> probably the one to get dropped in favor of CRYPTO_DEV_VMX.


> > But if you do *not* agree with removing it, I just add
> > select to drivers/crypto/vmx/Kconfig (which forces dependencies to be
> > always modules.)

> > If it's ok for you to remove, please also check whether the description
> > is ok. get_maintainer.pl script has size limitation:

> > $ ./scripts/get_maintainer.pl drivers/crypto/vmx/Kconfig
> > ...
> > linux-crypto@vger.kernel.org (open list:IBM Power VMX Cryptographic Acceleration Instru...)

> > maybe the name should be shorter.

> > Kind regards,
> > Petr

> >  MAINTAINERS                            | 2 +-
> >  arch/powerpc/configs/powernv_defconfig | 2 +-
> >  arch/powerpc/configs/ppc64_defconfig   | 2 +-
> >  arch/powerpc/configs/pseries_defconfig | 2 +-
> >  drivers/crypto/Kconfig                 | 6 ------
> >  drivers/crypto/vmx/Kconfig             | 4 ++--
> >  6 files changed, 6 insertions(+), 12 deletions(-)

> If you were to drop CONFIG_CRYPTO_DEV_VMX (like it's implemented in this
> patch), then something had to be done about

>   obj-$(CONFIG_CRYPTO_DEV_VMX) += vmx/

> in drivers/crypto/Makefile as well.

+1 (I obviously forget to amend).

Kind regards,
Petr

...
> > +++ b/drivers/crypto/Kconfig
> > @@ -761,12 +761,6 @@ config CRYPTO_DEV_QCOM_RNG
> >  	  To compile this driver as a module, choose M here. The
> >  	  module will be called qcom-rng. If unsure, say N.

> > -config CRYPTO_DEV_VMX
> > -	bool "Support for VMX cryptographic acceleration instructions"
> > -	depends on PPC64 && VSX
> > -	help
> > -	  Support for VMX cryptographic acceleration instructions.
> > -

> As said, I'd keep this one (while moving the GHASH dependency here) ...


> >  source "drivers/crypto/vmx/Kconfig"

> ... and drop this one.

> Thanks,

> Nicolai
