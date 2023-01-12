Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7650666938
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 04:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbjALDFm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 22:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235789AbjALDFj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 22:05:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1EB48817
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 19:05:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5753261F0C
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 03:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCD0C433D2;
        Thu, 12 Jan 2023 03:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492738;
        bh=5SNoJfmm0fL05G4ydhdtW6XCwG+AF4FA2R03PxumsNE=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=vJ/xyQNlp2bTK+/u+Wi+JeIn6bHfab9RmDOpHLN56T3crGZ8+sx8gd+UFdZZjhTOV
         ZTX4PAC0CO6RVpAPlLQSGWFLqSpHk4Nbkpy2TU07dhyRWtDQDakFvYA+eJyjfbEnQ0
         9UkVz+BX+wN4VzwHF0YLepvzuAVX+OsqBIZCB3FuIdFQx3t7Qi68jkLMOhublHsATb
         9AmmxRV/WKryIrk1wsG5w8V836vwcxFOLoTeJOoMHUm4XRCDYxvGBNqmt6zgDn6QOq
         tPa1qRIFRNg43llg8xfSp/rnEidAIXlflinvI3NJ0PUWMC20HA+wDv9+P74FHXUuHz
         DaK11Ihks12MQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:02 -0700
Subject: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=2552; i=nathan@kernel.org;
 h=from:subject:message-id; bh=5SNoJfmm0fL05G4ydhdtW6XCwG+AF4FA2R03PxumsNE=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K36XWet8PsXpUG0mdW5Ozf8rD4Jc122ofPr1xH9LnmP7
 38fFdJSyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJfAtgZOjapPNpfoLe3NVP5k/1ll
 aSqSgR4bas/fp6YbZEtoqs5TVGhl2JHbxfHT2CSyb9W+coH/jE/SrDkh0+/84+yPz09gJ3Hj8A
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
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
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

