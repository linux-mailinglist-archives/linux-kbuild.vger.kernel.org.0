Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0B5F65DD3C
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240251AbjADTzL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239830AbjADTzC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:55:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D0A17881
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 11:55:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC42A61742
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 19:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A7FC433A0;
        Wed,  4 Jan 2023 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862100;
        bh=v6Pz2Y597IXrTiPrySIepPbVwiJR5GwFlJrsRuCIfjA=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=mkASiltETfh4En70AMu63xlODVbvUZ3CGiAg43pvev1i8Iwh06O1t8hl0yJwZ91Hh
         PjN5gImQ3ULDaZZBPEJ5nR5dJSzIDF+ys0DU2O6vCIZaVEvUY+mzlgqJJWwi4oSTHI
         pO/Y3qIi51iv7+1BLOWfJDnBD+nwbPGaEjjI8r8xDnYQ2+0Ss/gv+6wd4eBUpU/BiO
         kzr/vQZeDDV0IPpLbyl7fnJRMM868O6aL2dnFg85f4ZvveKBBaGfmhEMJ4axoEyNZp
         azM6gIQIwiBFZ68dyBiod7wdvIH+uIh8c1WGRIRXLFJRtG/362bwJVrbisYaVdNaIA
         g+5jeRz2FSRzA==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:25 -0700
Subject: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615; i=nathan@kernel.org;
 h=from:subject:message-id; bh=v6Pz2Y597IXrTiPrySIepPbVwiJR5GwFlJrsRuCIfjA=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3Z7Oq3kieNiveZyJXDJXasQq54txYoNPclTjr3u7Xo4
 ZeLpjlIWBjEOBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARsRiG/4kaRepfr4TF+i5fe2SxxC
 QL5QfqtVtfZX7951uV4MLPUcvI8NJTeEWyUZXhPo85ojZH1SS93f4Fbf/7uijotRdHqtgPDgA=
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

  clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]

This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
been done for other flags previously.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/vdso/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 769b62832b38..4ee7d36ce752 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -16,6 +16,11 @@ ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
   CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
   CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
+  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
+  # an unused command line flag warning for this file.
+  ifdef CONFIG_CC_IS_CLANG
+  CFLAGS_REMOVE_vgettimeofday-32.o += -fno-stack-clash-protection
+  endif
   CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y)
   CFLAGS_vgettimeofday-64.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
   CFLAGS_vgettimeofday-64.o += $(call cc-option, -fno-stack-protector)

-- 
2.39.0
