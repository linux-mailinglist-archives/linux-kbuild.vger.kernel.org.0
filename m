Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE956666945
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 04:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbjALDFs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 22:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235706AbjALDFp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 22:05:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F001D48831;
        Wed, 11 Jan 2023 19:05:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C64661F43;
        Thu, 12 Jan 2023 03:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F89C4339C;
        Thu, 12 Jan 2023 03:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492743;
        bh=+WmXz0hhJEVTtJrcYnx3bH8d3WYYB2G36sC54ZOKH3A=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=WqmA7rG3GFzZBi7UDIo9tb76H6vqcWCVTiKyf1zsGGMmgoVoqsm7DzjXNIEPQ3eq2
         nY9AqnQ74l3/Nx79YivJbXlYmUqLa3qy3hb66UKWwBI41bVgfEDzAxLqkNOskAyjA/
         vzI3NWsJc1iuE5t91kfsVLmm1kwArx6VFjE6+U9k9Bcw70oVlaSxH0gSFO3toj/hDl
         6C/NSJyhyoUVpF5obp4qrBhjL4zKKHoWMwvdu4TsWd5prIh/IGVNa6i0L1R42Sk5yD
         4XSCmsKTPWFIaWp80+GTRAwfzz30V6ntnN9DbKZGCUaQCKP9AJVUvdhpSpvsD+Civl
         K4A1/Lw4/A8Lw==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:08 -0700
Subject: [PATCH v2 11/14] s390/purgatory: Remove unused '-MD' and
 unnecessary '-c' flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-11-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498; i=nathan@kernel.org;
 h=from:subject:message-id; bh=+WmXz0hhJEVTtJrcYnx3bH8d3WYYB2G36sC54ZOKH3A=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K/70fl4UWuC/44D1i67NZn0X5lQ/5Zsl//vpO9m5De9u
 fI7U6ChlYRDjYJAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATsf7NyLDJpIJzc0ja4V2SzJLbkw
 8+XP1J5d7xoowTCwIX9+1qMM9m+B+fwfR51oYduvo+qzOOCXXp7ZziWyV/czbbC4aStoW7ZnAAAA==
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
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Reviewed-by: Sven Schnelle <svens@linux.ibm.com>
---
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

