Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92BE44C162B
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Feb 2022 16:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237725AbiBWPKW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Feb 2022 10:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233411AbiBWPKV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Feb 2022 10:10:21 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB56B54F1;
        Wed, 23 Feb 2022 07:09:53 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 41C27212B8;
        Wed, 23 Feb 2022 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645628992;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+bG53Wp6Gl3zxi+iDVlP2+hLh3hp86ZbjZHuT6T3H4c=;
        b=xS7aTKWI8XT6G562T77CJH92o9fzp6NYMX790K0voS6SNKVFj5iAdczmeOdVLIiYNDLP70
        VoCtdAGAIaTilxlnT2pFdK2eknkRndK/LPY2z+NpatJ7jeR1VGtTmOubyMnlZDCKTGRz1+
        Ar7FNLNr9kWvEDB2sXkPsr0OuY7k52Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645628992;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+bG53Wp6Gl3zxi+iDVlP2+hLh3hp86ZbjZHuT6T3H4c=;
        b=sxQAYgK9otm3HSE0AEpEYEywkD0OFra5TTgWQTx83lUUmg9KFW+TiHb4MaQCtioGW3pf9E
        0YrDKER4+2oa62Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF94913D80;
        Wed, 23 Feb 2022 15:09:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Zo4FLT9OFmIiYAAAMHmgww
        (envelope-from <pvorel@suse.cz>); Wed, 23 Feb 2022 15:09:51 +0000
Date:   Wed, 23 Feb 2022 16:09:50 +0100
From:   Petr Vorel <pvorel@suse.cz>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     linux-crypto@vger.kernel.org, Nicolai Stange <nstange@suse.de>,
        leitao@debian.org, Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 1/2] crypto: vmx - merge CRYPTO_DEV_VMX_ENCRYPT into
 CRYPTO_DEV_VMX
Message-ID: <YhZOPvXEe1avs5uu@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20220217105751.6330-1-pvorel@suse.cz>
 <20220217105751.6330-2-pvorel@suse.cz>
 <YhWirRLlQNs3jha/@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhWirRLlQNs3jha/@gondor.apana.org.au>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Thu, Feb 17, 2022 at 11:57:50AM +0100, Petr Vorel wrote:
> > CRYPTO_DEV_VMX_ENCRYPT is redundant with CRYPTO_DEV_VMX.

> > And it also forces CRYPTO_GHASH to be builtin even
> > CRYPTO_DEV_VMX_ENCRYPT was configured as module.

> Just because a tristate sits under a bool, it does not force
> the options that it selects to y/n.  The select still operates
> on the basis of the tristate.
I'm sorry, not sure what I did wrong before. Now it really behaves as expected.

> So I don't see the point to this code churn unless the powerpc
> folks want to move in this direction.
Sure (sending now just second commit as requested.

Thank for your review.

Kind regards,
Petr

> Thanks,
