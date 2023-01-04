Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE54965DD39
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240204AbjADTzJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240260AbjADTzA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:55:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE841AA11
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 11:54:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0AD4461742
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 19:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACA7C433F1;
        Wed,  4 Jan 2023 19:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862098;
        bh=dwmbTzUK1OVhXPLwSXDDMGcNHMUbPdQ43vDX3d7ndH4=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=L20+yIsBiPVGLKKtva0a3kjheU5L+EBnfCygm00ekLoZOdQHM6ktm/vkxIEtR8uiS
         o6sUcCRZOaFpz0pwB6BDdzhfrbEDdiXKX9A9rswNMbdBDObbOnIj8Npja30miqZuuI
         qe1dKJnMUngvpuhkIU3W+V+pXHBeROxNut8k4H9WiwWCXE5YpARmynojk07LgUdJFE
         Q71puWvLGRZBILlFsyrAG6ylddfkWMRDiA0sXPAFKDW6YyUW/rCVWpF/1/6qG1k7Nv
         0m+kU2aLb/HfRz3dOSVPibQLYSW9nVjgYLL+TWGvwHO521xzeyDErCXvSg+/GFkmVG
         G99mEwLXrofgQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:23 -0700
Subject: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397; i=nathan@kernel.org;
 h=from:subject:message-id; bh=dwmbTzUK1OVhXPLwSXDDMGcNHMUbPdQ43vDX3d7ndH4=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3ZZzzzyabtinsvetoKDF7j6XZXeK4gGiE5i1ffZt+aO
 VeSnjlIWBjEOBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRe9GMDFdikz67F7Ia9IRGpyW/WD
 T5JnPxy2Nb6/8syY/rXs30ZzMjwyqN3REaf194STtyum9817qv+e70Bd679FXKC7v+btyeywsA
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
warns that ASFLAGS contains '-s', which is a linking phase option, so it
is unused.

  clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]

Looking at the GAS sources, '-s' is only useful when targeting Solaris
and it is ignored for the powerpc target so just drop the flag
altogether, as it is not needed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/vdso/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 6a977b0d8ffc..45c0cc5d34b6 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -51,10 +51,10 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
 ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
 
 CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
-AS32FLAGS := -D__VDSO32__ -s
+AS32FLAGS := -D__VDSO32__
 
 CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
-AS64FLAGS := -D__VDSO64__ -s
+AS64FLAGS := -D__VDSO64__
 
 targets += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C -Upowerpc

-- 
2.39.0
