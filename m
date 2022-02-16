Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 002FD4B8188
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Feb 2022 08:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiBPHY0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Feb 2022 02:24:26 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiBPHYZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Feb 2022 02:24:25 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C466582;
        Tue, 15 Feb 2022 23:24:13 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4BE8C1F394;
        Wed, 16 Feb 2022 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1644996252;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=la8fDbA4HBZPVTzs7Wcc9oHvRT54XHsJ9QqMVM2Jakc=;
        b=HO/7fI/grnwOWqYoytwQQ/sFmi3x0moVenbF3WGz48XIQppqkTVLpiPx410htdFwdOrMEH
        ci6boG/plfdx6bhpPzEJJ+CQVEdaTxG2ea591NcjMy5V2Wkr0+KCbdUnyJXnlkYBLm2nO0
        a0EWAKJdjnRZ1J305s2MXTpvJT2MUBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1644996252;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=la8fDbA4HBZPVTzs7Wcc9oHvRT54XHsJ9QqMVM2Jakc=;
        b=3+A2CUAqfFdVU/OoVtETQN0OVol/XTCJr5PCuSbGnXHmpxUevuVYL1360IQGb2nfIWt3bJ
        QByslklFYeTLkxBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D01FB13A3E;
        Wed, 16 Feb 2022 07:24:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id TqQ8KpumDGKBNAAAMHmgww
        (envelope-from <pvorel@suse.cz>); Wed, 16 Feb 2022 07:24:11 +0000
Date:   Wed, 16 Feb 2022 08:24:10 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-crypto@vger.kernel.org
Cc:     Nicolai Stange <nstange@suse.de>,
        Herbert Xu <herbert@gondor.apana.org.au>, leitao@debian.org,
        Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/2] crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into
 tristate
Message-ID: <YgymmnfKZpMzAMro@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20220215185936.15576-1-pvorel@suse.cz>
 <20220215185936.15576-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215185936.15576-2-pvorel@suse.cz>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

I kept CRYPTO_DEV_VMX_ENCRYPT in drivers/crypto/vmx/Kconfig,
but maybe I should have moved it into drivers/crypto/Kconfig.

It's not clear what is preferred.

Kind regards,
Petr
