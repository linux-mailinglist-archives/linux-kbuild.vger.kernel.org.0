Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C643C6A8354
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Mar 2023 14:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCBNRe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Mar 2023 08:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjCBNRd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Mar 2023 08:17:33 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5073B21C
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Mar 2023 05:17:23 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSBTp5dcqz4x1d;
        Fri,  3 Mar 2023 00:17:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1677763038;
        bh=MifMs1bYypPRVegWJmGbBMcmeEdR8W68yonET0zBtlA=;
        h=From:To:Cc:Subject:Date:From;
        b=SvrbGhactm4hGihZSENvYpT3ku+abvNzD3dgrGhh6vKIkL8Wnv71oDhr/TYLiwg/b
         goLE+dyyzOwo5XJRBybL2yuI3Zc4IgZXnZUYufbUKntx/7UtmnS5oDVH3LCBgxRWoa
         zz+HNAY4t9PigfOMBHVmu6jo5ueFtRqFQ6XiUrzejuoGZ5j7oMgRqu2eoV5x8kDwQ+
         fN7/l9PIa6XVeV9GvcLXDeFMcWvnLLFK8Hv0M9oCbRpfa38OD1INNrsEMCrJDqTKxs
         kpgL5nMFKYOqXd0hjtQwKNSYQzm9WUTu8jwr0DR1/LX245tAFIucho2aMvZ0wA3GYk
         B+1Eb3pbxcVwA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     <linuxppc-dev@lists.ozlabs.org>
Cc:     <nathan@kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: [PATCH 1/2] powerpc/64: Move CPU -mtune options into Kconfig
Date:   Fri,  3 Mar 2023 00:16:55 +1100
Message-Id: <20230302131656.50626-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently the -mtune options are set in the Makefile, depending on what
is the compiler supports.

One downside of doing it that way is that the chosen -mtune option is
not recorded in the .config.

Another downside is that doing more complicated logic to calculate the
correct option gets messy in the Makefile.

So move the determination of which -mtune option to use into Kconfig
logic.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile                  | 4 +---
 arch/powerpc/platforms/Kconfig.cputype | 6 ++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 87d6ac27eebd..779956007f0c 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -156,9 +156,7 @@ endif
 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
 AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
 
-CFLAGS-$(CONFIG_POWERPC64_CPU) += $(call cc-option,-mtune=power10,	\
-				  $(call cc-option,-mtune=power9,	\
-				  $(call cc-option,-mtune=power8)))
+CFLAGS-y += $(CONFIG_TUNE_CPU)
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 046b571496b1..7d7477b73951 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -273,6 +273,12 @@ config TARGET_CPU
 	default "e500mc" if E500MC_CPU
 	default "powerpc" if POWERPC_CPU
 
+config TUNE_CPU
+	string
+	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
+	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
+	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)
+
 config PPC_BOOK3S
 	def_bool y
 	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64
-- 
2.39.2

