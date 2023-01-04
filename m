Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D61665DD42
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjADTzj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240113AbjADTzG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:55:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49743E0CA;
        Wed,  4 Jan 2023 11:55:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39C80B818CA;
        Wed,  4 Jan 2023 19:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D45C433D2;
        Wed,  4 Jan 2023 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862102;
        bh=Wq2xy5rFWf75vfk6CLmeCRvK7xMzUB8bK7uoSW9gNDQ=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=kowh49BE0vlyOeGqVIEX40KPeHVEcDwAr6nyxSIsrGz3fErLZJ/U57mzRd7bHUO2v
         KJcxJQxr4Iu+UOaNjlbKkD3F1Mk/WeMZ3mQIgZlFKAJC9IvMeWcQE2qmw4VPku8DvO
         gv4rBxjsuKEqwKjSXUr3O8F4s5ZVc8bFQ7zJyBl3zrIHfVV01fLuQP731+ZlVxf3iM
         LEXQ0nboH+JrxYEEYqu9fYyeNc/i6D3cFwCMXwh52iXQAxsD/8RisCiZX8/Uqkt3Kv
         kmQycMaZqy7oRpoqnhx2EvcxQCV7gmLC+EnHh0xdZ8sAlGJKKqTN5Wgc+K/eUf6u5V
         uuKUMPFcbMeUg==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:28 -0700
Subject: [PATCH 11/14] s390/purgatory: Remove unused '-MD' and unnecessary '-c' flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-11-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        linux-s390@vger.kernel.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Wq2xy5rFWf75vfk6CLmeCRvK7xMzUB8bK7uoSW9gNDQ=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3b7ZBf/rn1s+nZr5eJ2yd8LEiWKcwNmRk34Xbvz1Laf
 FevaO0pZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEbHwZGX5afPM8fnO9+KX1YeXbtD
 PDo+M4rjWu1izN4BLf/Fsmponhf4lvgOKFPQ8Zy7gvTT+W8oTX+LLVkQY2mXbeCxtObJzOzQEA
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
warns while building objects in the purgatory folder:

  clang-16: error: argument unused during compilation: '-MD' [-Werror,-Wunused-command-line-argument]

'-MMD' is always passed to the preprocessor via c_flags, even when
KBUILD_CFLAGS is overridden in a folder, so clang complains the addition
of '-MD' will be unused. Remove '-MD' to clear up this warning, as it is
unnecessary with '-MMD'.

Additionally, '-c' is also unnecessary, remove it while in the area.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: hca@linux.ibm.com
Cc: gor@linux.ibm.com
Cc: agordeev@linux.ibm.com
Cc: borntraeger@linux.ibm.com
Cc: svens@linux.ibm.com
Cc: linux-s390@vger.kernel.org
---
 arch/s390/purgatory/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
index d237bc6841cb..32573b4f9bd2 100644
--- a/arch/s390/purgatory/Makefile
+++ b/arch/s390/purgatory/Makefile
@@ -24,7 +24,7 @@ KCSAN_SANITIZE := n
 KBUILD_CFLAGS := -fno-strict-aliasing -Wall -Wstrict-prototypes
 KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
 KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
-KBUILD_CFLAGS += -c -MD -Os -m64 -msoft-float -fno-common
+KBUILD_CFLAGS += -Os -m64 -msoft-float -fno-common
 KBUILD_CFLAGS += -fno-stack-protector
 KBUILD_CFLAGS += $(CLANG_FLAGS)
 KBUILD_CFLAGS += $(call cc-option,-fno-PIE)

-- 
2.39.0
