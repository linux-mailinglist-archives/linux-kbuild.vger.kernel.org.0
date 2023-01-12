Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3CC666942
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 04:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235789AbjALDFp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 22:05:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235894AbjALDFn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 22:05:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2E348817;
        Wed, 11 Jan 2023 19:05:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 696AB61F3B;
        Thu, 12 Jan 2023 03:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4360C433A7;
        Thu, 12 Jan 2023 03:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492742;
        bh=110YiaA7E6BQNria0n3mQxxC9p3c/B3/YRXtsHDJjbg=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=Bh/96oZEBZSxz6+OdCqLSVwNd+oJF62jkYmaVfIgIGhuq14YZq7oxwp5/jUMnrVKG
         A2eyxE+H6TwaKhmKGFlxB6MWqbZS7kHiKUFajXqlMcWuZfrmXx+sxx7cN4oZTR3HTW
         /XgwVCTLnc3WnkmreeeCHWbupMpOo3dF1LtTsHXJxLrVSE/emr8F4Y5INneFWKSjWq
         XXqR378df843xtGMld30B59wdEaozicgbHHGsOV6/gvYL2UOv0aTCNMClXfODUWaEx
         Tj1LKGrO2HwphZvsGcXefubTT6Y9OaSFka0cDffkd9ea8UL/pi4eKxDJrmLEJyhNq2
         2zx5txMNfbYWQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:07 -0700
Subject: [PATCH v2 10/14] s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-10-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=nathan@kernel.org;
 h=from:subject:message-id; bh=110YiaA7E6BQNria0n3mQxxC9p3c/B3/YRXtsHDJjbg=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K347yU29/XzFqa1901XTOX88OZs5+f3fjc43RWv0Tlec
 XXzcvaOUhUGMg0FWTJGl+rHqcUPDOWcZb5yaBDOHlQlkCAMXpwBMJH8vwz/L2aZtDYyHZggvfbmdYc
 eOXesXx2VL/rxiXZywPXm+zdo/jAxfvtyM1z4ZlbZD5s/S/wIL4vVcX+76+1rfSFOj9+N6kz2cAA==
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
points out that there is a linking phase flag added to CFLAGS, which
will only be used for compiling

  clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]

'-shared' is already present in ldflags-y so it can just be dropped.

Fixes: 2b2a25845d53 ("s390/vdso: Use $(LD) instead of $(CC) to link vDSO")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Reviewed-by: Sven Schnelle <svens@linux.ibm.com>
---
Cc: linux-s390@vger.kernel.org
---
 arch/s390/kernel/vdso64/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index a2fe9383d452..34f9542636e9 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -25,7 +25,7 @@ KBUILD_AFLAGS_64 := $(filter-out -m64,$(KBUILD_AFLAGS))
 KBUILD_AFLAGS_64 += -m64
 
 KBUILD_CFLAGS_64 := $(filter-out -m64,$(KBUILD_CFLAGS))
-KBUILD_CFLAGS_64 += -m64 -fPIC -shared -fno-common -fno-builtin
+KBUILD_CFLAGS_64 += -m64 -fPIC -fno-common -fno-builtin
 ldflags-y := -fPIC -shared -soname=linux-vdso64.so.1 \
 	     --hash-style=both --build-id=sha1 -T
 

-- 
2.39.0

