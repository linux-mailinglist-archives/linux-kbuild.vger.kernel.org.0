Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 598964B763E
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Feb 2022 21:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243335AbiBOS75 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Feb 2022 13:59:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243332AbiBOS74 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Feb 2022 13:59:56 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49330EBBBB;
        Tue, 15 Feb 2022 10:59:46 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id C3E781F382;
        Tue, 15 Feb 2022 18:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1644951584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=5YAUHqgVBs+pDipEZBxQHmXGJ42CBpjYidJwV8WeMtc=;
        b=jB12KMIUWcSWnbHdoRAisy258SrDEEcRYT8dTOTG+Hg5tNVxFSfXqr5Zj8ZzScvwH143ky
        on/mKMw1ruWYkkNHOv4NPWlTIotJ5gEv5sK4XQinzEL+kHKvD4H05XiiyccsM+lA9+R6/J
        OmSg/SQrTi3cpPRhALK+ONanH1LWDmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1644951584;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=5YAUHqgVBs+pDipEZBxQHmXGJ42CBpjYidJwV8WeMtc=;
        b=3A8UJ97dC6BgqoV4B9DofBSpEYlz/gEdAmvgGUFg5jmrJV6c7+zPmuel4YnhrRWD8Gsa6m
        CJGqRCW9oG3vyZBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45EE31376E;
        Tue, 15 Feb 2022 18:59:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fVAoDyD4C2L2MwAAMHmgww
        (envelope-from <pvorel@suse.cz>); Tue, 15 Feb 2022 18:59:44 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-crypto@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, Nicolai Stange <nstange@suse.de>,
        Herbert Xu <herbert@gondor.apana.org.au>, leitao@debian.org,
        Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/2] vmx-crypto: Add missing dependencies
Date:   Tue, 15 Feb 2022 19:59:34 +0100
Message-Id: <20220215185936.15576-1-pvorel@suse.cz>
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

Hi,

[ Cc powerpc list and VMX people this time ]

changes v1->v2:
* new commit: crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into tristate
* use "select" instead of "depends on" (Nicolai)
* drop !CRYPTO_MANAGER_DISABLE_TESTS as the dependency is always (Nicolai)

Petr Vorel (2):
  crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into tristate
  crypto: vmx: Add missing dependencies

 MAINTAINERS                            | 2 +-
 arch/powerpc/configs/powernv_defconfig | 2 +-
 arch/powerpc/configs/ppc64_defconfig   | 2 +-
 arch/powerpc/configs/pseries_defconfig | 2 +-
 drivers/crypto/Kconfig                 | 6 ------
 drivers/crypto/vmx/Kconfig             | 8 ++++++--
 6 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.35.1

