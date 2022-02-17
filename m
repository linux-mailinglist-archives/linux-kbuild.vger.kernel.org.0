Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D174B9E01
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Feb 2022 12:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239606AbiBQK7K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Feb 2022 05:59:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239603AbiBQK6t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Feb 2022 05:58:49 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49003295FEC;
        Thu, 17 Feb 2022 02:58:02 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id C6DA11F37D;
        Thu, 17 Feb 2022 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1645095480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UZTrKc5Lz6o1zAV4RkojCzhZSoFvfvM9U2+FCuy4Upw=;
        b=mi96MmSvLvZI/HKSQJD3M/Dpry9RhfV5rdC0LphzQWnmZVdDu6ZAx0Oij2MaN1sZBoVJim
        8fdhp+/hdD2TXxFZ0OmTzQlDTXZZe00/CXEVZrILZAIdpS6fkMIN9xIJQ/FHl4ja0uC11U
        XOi+ITWAR+vDBXNM45NwHCELccDC9tw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1645095480;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UZTrKc5Lz6o1zAV4RkojCzhZSoFvfvM9U2+FCuy4Upw=;
        b=Lpd/3bOBPJsfJ/tuOzDPolm0f8WTbSZBjj+uxHmtR4KxpBs7y1wdZ9+Vnpanpm9sdCJrvH
        7qhQkBds4K0fLdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74AC913DD8;
        Thu, 17 Feb 2022 10:58:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wArUGjgqDmJdTgAAMHmgww
        (envelope-from <pvorel@suse.cz>); Thu, 17 Feb 2022 10:58:00 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-crypto@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>, Nicolai Stange <nstange@suse.de>,
        Herbert Xu <herbert@gondor.apana.org.au>, leitao@debian.org,
        Nayna Jain <nayna@linux.ibm.com>,
        Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v3 1/2] crypto: vmx - merge CRYPTO_DEV_VMX_ENCRYPT into CRYPTO_DEV_VMX
Date:   Thu, 17 Feb 2022 11:57:50 +0100
Message-Id: <20220217105751.6330-2-pvorel@suse.cz>
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

CRYPTO_DEV_VMX_ENCRYPT is redundant with CRYPTO_DEV_VMX.

And it also forces CRYPTO_GHASH to be builtin even
CRYPTO_DEV_VMX_ENCRYPT was configured as module.

This requires to change defconfig values to m for backwards
compatibility.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v2->v3:
* keep CRYPTO_DEV_VMX and merge CRYPTO_DEV_VMX_ENCRYPT into it instead
  of vice versa (suggested by Nicolai). I have no problem to send
  another version if maintainers want the original approach.
* change commit subject to be compatible
* remove MAINTAINERS changes

 arch/powerpc/configs/powernv_defconfig |  2 +-
 arch/powerpc/configs/ppc64_defconfig   |  2 +-
 arch/powerpc/configs/pseries_defconfig |  2 +-
 drivers/crypto/Kconfig                 |  9 +++++----
 drivers/crypto/vmx/Kconfig             | 10 ----------
 drivers/crypto/vmx/Makefile            |  4 ++--
 6 files changed, 10 insertions(+), 19 deletions(-)
 delete mode 100644 drivers/crypto/vmx/Kconfig

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 49f49c263935..661b294d1744 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -337,7 +337,7 @@ CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_DEV_NX=y
-CONFIG_CRYPTO_DEV_VMX=y
+CONFIG_CRYPTO_DEV_VMX=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index c8b0e80d613b..cc51b506066c 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -355,7 +355,7 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
-CONFIG_CRYPTO_DEV_VMX=y
+CONFIG_CRYPTO_DEV_VMX=m
 CONFIG_PRINTK_TIME=y
 CONFIG_PRINTK_CALLER=y
 CONFIG_MAGIC_SYSRQ=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index b571d084c148..2366d3be0d11 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -315,7 +315,7 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
-CONFIG_CRYPTO_DEV_VMX=y
+CONFIG_CRYPTO_DEV_VMX=m
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 4f705674f94f..923fa1effb4a 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -762,12 +762,13 @@ config CRYPTO_DEV_QCOM_RNG
 	  module will be called qcom-rng. If unsure, say N.
 
 config CRYPTO_DEV_VMX
-	bool "Support for VMX cryptographic acceleration instructions"
+	tristate "Power VMX cryptographic acceleration instructions driver"
 	depends on PPC64 && VSX
+	select CRYPTO_GHASH
 	help
-	  Support for VMX cryptographic acceleration instructions.
-
-source "drivers/crypto/vmx/Kconfig"
+	  Support for VMX cryptographic acceleration instructions on Power8 CPU.
+	  This module supports acceleration for AES and GHASH in hardware. If you
+	  choose 'M' here, this module will be called vmx-crypto.
 
 config CRYPTO_DEV_IMGTEC_HASH
 	tristate "Imagination Technologies hardware hash accelerator"
diff --git a/drivers/crypto/vmx/Kconfig b/drivers/crypto/vmx/Kconfig
deleted file mode 100644
index c85fab7ef0bd..000000000000
--- a/drivers/crypto/vmx/Kconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-config CRYPTO_DEV_VMX_ENCRYPT
-	tristate "Encryption acceleration support on P8 CPU"
-	depends on CRYPTO_DEV_VMX
-	select CRYPTO_GHASH
-	default m
-	help
-	  Support for VMX cryptographic acceleration instructions on Power8 CPU.
-	  This module supports acceleration for AES and GHASH in hardware. If you
-	  choose 'M' here, this module will be called vmx-crypto.
diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
index 709670d2b553..703f67b8459e 100644
--- a/drivers/crypto/vmx/Makefile
+++ b/drivers/crypto/vmx/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
+obj-$(CONFIG_CRYPTO_DEV_VMX) += vmx-crypto.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
@@ -15,7 +15,7 @@ targets += aesp8-ppc.S ghashp8-ppc.S
 
 $(obj)/aesp8-ppc.S: $(src)/aesp8-ppc.pl FORCE
 	$(call if_changed,perl)
-  
+
 $(obj)/ghashp8-ppc.S: $(src)/ghashp8-ppc.pl FORCE
 	$(call if_changed,perl)
 
-- 
2.35.1

