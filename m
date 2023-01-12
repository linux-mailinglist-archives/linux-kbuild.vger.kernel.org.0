Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88A266694D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 04:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236035AbjALDFw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 22:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236040AbjALDFs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 22:05:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7979548837
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 19:05:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 34835B81C97
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 03:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC92C43392;
        Thu, 12 Jan 2023 03:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492744;
        bh=qhVxxMtN9gGQuccQs5IHBbamuC+0EWjBWq4jAU83BtM=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=dFDy8C4IoyozVktkBHgVfZOiNg7kLq2alKIYRJTgmvYNTjKuhZRt5/IAcTAlN+MLj
         X4icNbSeAxaGrE3cUEkMw2/g4WLuvzaKph8FRVaj3ZO+Idtm1H5OjyD8LOL353cpts
         JNmeOXJTvacYZTapfEDS3fYhQlFk5t6sMqMrmEJkxJhdfydWqt2xVN9AtDWuVlDaoG
         FN/Q3LCh6XfcpggkWiqADY7iFJp0hkHVibwTo3vIyRtlYtzO3628R6A5B+Q41mF6zY
         XiX+mOBddNaa25jhj/phGBuviOW/kopXl4yGjlu0Tr1+N97+JEvcAY2NByDXkbh56U
         4dLM7iOtH8rxQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:11 -0700
Subject: [PATCH v2 14/14] kbuild: Stop using '-Qunused-arguments' with
 clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-14-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=nathan@kernel.org;
 h=from:subject:message-id; bh=qhVxxMtN9gGQuccQs5IHBbamuC+0EWjBWq4jAU83BtM=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K/5IcQtPPiZ0ceXm+fZvl8TOfdnwb08WW2P43/TCorkN
 Vpc/dZSyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJpNgyMtz8F1Ij/3Xv86ur33o3rl
 hqu+7/EffP8RdkT/7VD1p41EyP4ReTa5T5jP+9i9lMfER+6S7mOrrjV8bNIuGPm3idvz11/MMAAA==
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
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
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

