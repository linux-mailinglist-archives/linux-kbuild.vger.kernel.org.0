Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4670765DD3A
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240248AbjADTzJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240258AbjADTy7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:54:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D22517881
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 11:54:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2CD8261808
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 19:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE80CC4339C;
        Wed,  4 Jan 2023 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862097;
        bh=0dvoKPcMnIOYTBZdOpsCJQUfqsMe8RMRL32tVdj/v/U=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=JIu3wmpcBPtYh13qxWBVmlhvjOIOUph45e5ANsz8MlDjd3GcHklD6l+/OOQm+pD25
         nUsrSiQnVBV2Exx7DFxyJ698J1moHkasab/4nzLL03KP+UH6woALhLXfvNu52O3QTn
         7jySBzdWUOdMGs6i1aXV7ovB5RlxqBU6wtxQr3xV2uNw+hFH0WCO1bCH9JA6LRurwh
         HY+kOqYKkVDjYfEDaNxVsmxtIh/ETy8xdOuVTrUvC9dewsKQwlRGwT/79hk/atMOB4
         Q2ZSGGu3Y72F1YzGcMtq9AVEE+Wd+70B93mqi05JS3igL4yx/KxFk8HzLDg4tcUtcj
         vepcaZb/NPFXg==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:22 -0700
Subject: [PATCH 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-5-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495; i=nathan@kernel.org;
 h=from:subject:message-id; bh=0dvoKPcMnIOYTBZdOpsCJQUfqsMe8RMRL32tVdj/v/U=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3b1Lnwa7i9dJ59eLS4RJKO6pN3y+prla4riOqWEtjtv
 dn7dUcrCIMbBICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACZyfQHDH05mp9tHlb6/8yzeuoXp7Z
 zrn+pKVWan8ocrSsc/5ax8uYHhf6jm1qPRtfsP1X/6Vrjh+ARdnaCPGQoJTsVxa2VqghW28gAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
points out that KBUILD_AFLAGS contains a linker flag, which will be
used:

  clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]

This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
unnecessary, as all supported versions of clang and gcc will pass '-a64'
or '-a32' to GNU as based on the value of '-m'; the behavior of the
latest stable release of the oldest supported major version of each
compiler is shown below and each compiler's latest release exhibits the
same behavior (GCC 12.2.0 and Clang 15.0.6).

  $ powerpc64-linux-gcc --version | head -1
  powerpc64-linux-gcc (GCC) 5.5.0

  $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
  .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s

  $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
  .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg

  $ clang --version | head -1
  Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5

  $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
    -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
   "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"

  $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
    -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
   "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"

Remove this flag altogether to avoid future issues.

Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index dc4cbf0a5ca9..4fd630efe39d 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -90,7 +90,7 @@ aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 
 ifeq ($(HAS_BIARCH),y)
 KBUILD_CFLAGS	+= -m$(BITS)
-KBUILD_AFLAGS	+= -m$(BITS) -Wl,-a$(BITS)
+KBUILD_AFLAGS	+= -m$(BITS)
 KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
 endif
 

-- 
2.39.0
