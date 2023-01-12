Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEBE3666943
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 04:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235975AbjALDFq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 22:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235887AbjALDFn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 22:05:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9141A48831
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 19:05:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B61BB81DAD
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 03:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4C9C433A0;
        Thu, 12 Jan 2023 03:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492739;
        bh=k7xDd19xhbHKPlFR2IgPHI7589lHz3Ew71cwC/FK/nM=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=DpeaZPA63aBwrUU0V4lmhVsL29G39qA6Yd4dJ6d05avO/ppF4C0Aomex617V+g1j6
         dv5KlpNzymAEIvSg0klJa5OXItm9q+XyFJFE7TlzjeYeSHcixR9wAxBqaZXnjCi20H
         eAWMl2/nAfCbPgslHC0iLLeSA5R8Y6TqsB77tME0WvHw8uKa72XvmLucpCbI38ZacE
         O9PRd0kZBojhhlJ+ZQtUwir1S+Wx+Qp8gyrOCvlH1KvgTYvtgajcvenqGMzoFmdiF2
         gByNji+ksYM3CXu6Zzr3Y6WDLH+HbXmUV9hz/alyqqx2Ajz1sZAb7ulewaiqI6tcG9
         XNcqRDvXhfPTQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:04 -0700
Subject: [PATCH v2 07/14] powerpc/vdso: Improve linker flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-7-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=3855; i=nathan@kernel.org;
 h=from:subject:message-id; bh=k7xDd19xhbHKPlFR2IgPHI7589lHz3Ew71cwC/FK/nM=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K34Ln66eN6d6xpLlSYwcm8651Tnu2x/3rmLLddXc2dHs
 zp3vO0pZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEPC4xMnztnrnM/J6L6aH9E0K+nN
 L0336UV5h3nuCa13Ost+m7dBxjZNg6V2Hzjo3XGuZdqdJb9UzvP3+o16Plnjl3amduCUz6uokFAA==
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

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
are several warnings in the PowerPC vDSO:

  clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
  clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
  clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]

  clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
  clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]

The first group of warnings point out that linker flags were being added
to all invocations of $(CC), even though they will only be used during
the final vDSO link. Move those flags to ldflags-y.

The second group of warnings are compiler or assembler flags that will
be unused during linking. Filter them out from KBUILD_CFLAGS so that
they are not used during linking.

Additionally, '-z noexecstack' was added directly to the ld_and_check
rule in commit 1d53c0192b15 ("powerpc/vdso: link with -z noexecstack")
but now that there is a common ldflags variable, it can be moved there.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 45c0cc5d34b6..4337b3aa9171 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 
-ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
-ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
-
-CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
+ccflags-y := -fno-common -fno-builtin
+ldflags-y := -Wl,--hash-style=both -nostdlib -shared -z noexecstack
+ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
+# Filter flags that clang will warn are unused for linking
+ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
+
+CC32FLAGS := -m32
+LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
 AS32FLAGS := -D__VDSO32__
 
-CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
+LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
 AS64FLAGS := -D__VDSO64__
 
 targets += vdso32.lds
@@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
 
 # actual build commands
 quiet_cmd_vdso32ld_and_check = VDSO32L $@
-      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
+      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
 quiet_cmd_vdso32as = VDSO32A $@
       cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
 quiet_cmd_vdso32cc = VDSO32C $@
       cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
 
 quiet_cmd_vdso64ld_and_check = VDSO64L $@
-      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
+      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
 quiet_cmd_vdso64as = VDSO64A $@
       cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
 

-- 
2.39.0

