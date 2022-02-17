Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6E54B9DF5
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Feb 2022 12:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239684AbiBQK7E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Feb 2022 05:59:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239589AbiBQK6r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Feb 2022 05:58:47 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E716D295FC8;
        Thu, 17 Feb 2022 02:58:02 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6A5C8210E1;
        Thu, 17 Feb 2022 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645095480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=ejJOPMGqoqTuXltYTN+lNUEISoj2/cmQ0coSdRcZq5k=;
        b=ZmB0wl9B9CgZyZnf/7Ct12lyeIShGiixXlRP9IOq/4vrlpDESTcIN8KW7m/QnQcMLuQUaF
        bzzZ4SKpatk+xQqopXOBDcul+VBATMS0f79s5N3E4O0RMKPmDp6nhXoD5Wc1GUFzcYSxG+
        C2S+N2tis9gO5C8RX93fKLmFkW559YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645095480;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=ejJOPMGqoqTuXltYTN+lNUEISoj2/cmQ0coSdRcZq5k=;
        b=k0ZVrYblyEUXeXXww5CqhEGKlAS7+qvgR0vU+sdgJQJFmqwkM84m7WcCBoIqxjnrXFRvUf
        amxF66q1wDa9bnDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC72813DD8;
        Thu, 17 Feb 2022 10:57:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id dDoXODcqDmJdTgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Thu, 17 Feb 2022 10:57:59 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-crypto@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, Nicolai Stange <nstange@suse.de>,
        Herbert Xu <herbert@gondor.apana.org.au>, leitao@debian.org,
        Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v3 0/2] vmx-crypto: Add missing dependencies
Date:   Thu, 17 Feb 2022 11:57:49 +0100
Message-Id: <20220217105751.6330-1-pvorel@suse.cz>
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

Hi all,


changes v2->v3:
* keep CRYPTO_DEV_VMX and merge CRYPTO_DEV_VMX_ENCRYPT into it instead
  of vice versa (suggested by Nicolai). I have no problem to send
  another version if maintainers want the original approach.
* change commit subject to be compatible
* remove MAINTAINERS changes

Petr Vorel (2):
  crypto: vmx - merge CRYPTO_DEV_VMX_ENCRYPT into CRYPTO_DEV_VMX
  crypto: vmx - add missing dependencies

 arch/powerpc/configs/powernv_defconfig |  2 +-
 arch/powerpc/configs/ppc64_defconfig   |  2 +-
 arch/powerpc/configs/pseries_defconfig |  2 +-
 drivers/crypto/Kconfig                 | 13 +++++++++----
 drivers/crypto/vmx/Kconfig             | 10 ----------
 drivers/crypto/vmx/Makefile            |  4 ++--
 6 files changed, 14 insertions(+), 19 deletions(-)
 delete mode 100644 drivers/crypto/vmx/Kconfig

-- 
2.35.1

