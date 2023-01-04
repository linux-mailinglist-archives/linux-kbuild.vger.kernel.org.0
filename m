Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07CDF65DD41
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240268AbjADTzi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240175AbjADTzG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:55:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226103FA25
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 11:55:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD5B3617ED
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 19:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF4CC43396;
        Wed,  4 Jan 2023 19:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862105;
        bh=tTrQfczjuETaSOGxfQJLqsLErfJo6Bv4ivE/dvWNz9s=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=BJNLJlodI+/96CSfUaWvmMuOZ0oPdmLT1hEzgscMSOCXiFOY/QHUf59fy29zzeJ2K
         q51ZyIbB3bb/kGq66Un/MArKCxFtauq2xqmg67bwlGnc9GKER0SAZUq2ipjFHbVYmw
         vKPabcb8kMfigC+jIWDX2LQ+X5HfuiaAieyxXhVQtGwdAH0vGU9Gi6LpJThR1KcLSV
         AyXghJfsz77HlD3wLhOsU1hPERuvI0VUbjBbdxn6PujtwgdJWLTBZ11nqXHPz8heMo
         phkyaeoozS3Earu9aj2D3hcoes/4Y/UnESp0UxK+GdkmTeKu50CIXw12nNm3FbCn03
         vS6YV5NlN0oJA==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:31 -0700
Subject: [PATCH 14/14] kbuild: Stop using '-Qunused-arguments' with clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-14-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=nathan@kernel.org;
 h=from:subject:message-id; bh=tTrQfczjuETaSOGxfQJLqsLErfJo6Bv4ivE/dvWNz9s=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3Zf+xR/N3ltT1dhPZfFafeOWZcXhbeyHZjuyhV51PNb
 sc/RjlIWBjEOBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRFV4Mv5j3Ly5fzPpzQ+xyR1uf03
 leJ3x8YlnCzJe+7gybMkf7bRHDf2fbtIVn7n8p62EK9w83iBZm+LfFtjKucD9HJbdYk89GLgA=
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

This option masks all unused command line argument warnings, which can
hide potential issues, such as an architecture Makefile adding an
unsupported flag to KBUILD_AFLAGS or KBUILD_CFLAGS, which will cause all
as-option and cc-options to silently fail due to -Werror with no
indication as to why in the main kernel build.

Remove this flag so that warnings of this nature can be caught early and
obviously in a build.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index c05b4fb7121e..4bc79d2a42f2 100644
--- a/Makefile
+++ b/Makefile
@@ -878,7 +878,6 @@ KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
 KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
 
 ifdef CONFIG_CC_IS_CLANG
-KBUILD_CPPFLAGS += -Qunused-arguments
 # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
 KBUILD_CFLAGS += -Wno-gnu
 else

-- 
2.39.0
