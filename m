Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01DE665DD44
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240113AbjADTzl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240245AbjADTzH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:55:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EC73FA2F
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 11:55:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2924BB81665
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 19:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17389C433F0;
        Wed,  4 Jan 2023 19:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862103;
        bh=3WzrVDuXq+USW1wkZml39mLL/ZYu3zbGbhzJyJTaIjI=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=ZVc/xmAxP30rj7pQ8bnb8lKMBi5jVA1T6RkNRBFFwn+pZR7alSdElfuWXP345PJzF
         m/mqsSKcPcCV+c49p/aK6WTX9QLwhen8jAca1xfJ5/kVtSjMMrJjkThq7yMxlvyMpQ
         Spk2ZIlvC27RSybElCtvB57S3irGP7ERBPIEGOy3aBVwBI5R7ZAcb16S8zH5iUic4H
         oj9GyYCbQYVVsMT7UAP+Nla7yMjE4dbJqR4u3PDtBt7ELwdXhmCgCD4HN9crSKXdKr
         AoxoEH7YuUgw6qbx97LviiIFom0Hq8QqYgks7Eqs988RzmcCYRVMUfDsuagPOUog3L
         jUtI2hJ0hPJJg==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:29 -0700
Subject: [PATCH 12/14] drm/amd/display: Do not add '-mhard-float' to
 dml_ccflags for clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-12-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>, harry.wentland@amd.com,
        sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
        alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3WzrVDuXq+USW1wkZml39mLL/ZYu3zbGbhzJyJTaIjI=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3Zvv93PW778jH5o/NacxuiklqMCEnESqzz3PZqZ0vYv
 s8C9o5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExEV43hnwnruScrv0hWTWhKTGK7vW
 LJ1/iiJ3N9P9gaON/9X35jrwQjw7SCGVpZT56UNmzWL7ll3WV0W+nLbTHGqzZMs9aEdonXMgMA
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
warns:

  clang-16: error: argument unused during compilation: '-mhard-float' [-Werror,-Wunused-command-line-argument]

Similar to commit 84edc2eff827 ("selftest/fpu: avoid clang warning"),
just add this flag to GCC builds. Commit 0f0727d971f6 ("drm/amd/display:
readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP
routines") added '-msse2' to prevent clang from emitting software
floating point routines.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: harry.wentland@amd.com
Cc: sunpeng.li@amd.com
Cc: Rodrigo.Siqueira@amd.com
Cc: alexander.deucher@amd.com
Cc: christian.koenig@amd.com
Cc: Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 0ecea87cf48f..9d0f79dff2e3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -26,7 +26,8 @@
 # subcomponents.
 
 ifdef CONFIG_X86
-dml_ccflags := -mhard-float -msse
+dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
+dml_ccflags := $(dml_ccflags-y) -msse
 endif
 
 ifdef CONFIG_PPC64

-- 
2.39.0
