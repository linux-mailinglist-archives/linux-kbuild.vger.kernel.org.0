Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E90F557095
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jun 2022 03:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378079AbiFWBxS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jun 2022 21:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377422AbiFWBwH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jun 2022 21:52:07 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC3343AE9;
        Wed, 22 Jun 2022 18:51:51 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LT3BX0LctzDsNM;
        Thu, 23 Jun 2022 09:51:16 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:49 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 23 Jun 2022 09:51:49 +0800
From:   Chen Zhongjin <chenzhongjin@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
CC:     <jpoimboe@kernel.org>, <peterz@infradead.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <ndesaulniers@google.com>, <mark.rutland@arm.com>,
        <pasha.tatashin@soleen.com>, <broonie@kernel.org>,
        <chenzhongjin@huawei.com>, <rmk+kernel@armlinux.org.uk>,
        <madvenka@linux.microsoft.com>, <christophe.leroy@csgroup.eu>,
        <daniel.thompson@linaro.org>
Subject: [PATCH v6 20/33] arm64: entry: Annotate unwind_hint for entry
Date:   Thu, 23 Jun 2022 09:49:04 +0800
Message-ID: <20220623014917.199563-21-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220623014917.199563-1-chenzhongjin@huawei.com>
References: <20220623014917.199563-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When taking an exception/interrupt, add UNWIND_HINT_REGS to indicate
from which point the pt_regs is on stack.

Whether returning to userland or creating a new task, sp is
pointing to a pt_regs frame, add UNWIND_HINT_REGS after that.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/arm64/kernel/entry.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 3bd11101e79d..bbc440379304 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -120,6 +120,7 @@
 alternative_cb	spectre_v4_patch_fw_mitigation_enable
 	b	.L__asm_ssbd_skip\@		// Patched to NOP
 alternative_cb_end
+	UNWIND_HINT_REGS
 	ldr_this_cpu	\tmp2, arm64_ssbd_callback_required, \tmp1
 	cbz	\tmp2,	.L__asm_ssbd_skip\@
 	ldr	\tmp2, [tsk, #TSK_TI_FLAGS]
@@ -218,6 +219,7 @@ alternative_cb_end
 	stp	x24, x25, [sp, #16 * 12]
 	stp	x26, x27, [sp, #16 * 13]
 	stp	x28, x29, [sp, #16 * 14]
+	UNWIND_HINT_REGS
 
 	.if	\el == 0
 	clear_gp_regs
@@ -601,6 +603,7 @@ SYM_CODE_START_LOCAL(ret_to_kernel)
 SYM_CODE_END(ret_to_kernel)
 
 SYM_CODE_START_LOCAL(ret_to_user)
+	UNWIND_HINT_REGS
 	ldr	x19, [tsk, #TSK_TI_FLAGS]	// re-check for single-step
 	enable_step_tsk x19, x2
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
@@ -872,6 +875,7 @@ NOKPROBE(cpu_switch_to)
  * This is how we return from a fork.
  */
 SYM_CODE_START(ret_from_fork)
+	UNWIND_HINT_REGS
 	bl	schedule_tail
 	cbz	x19, 1f				// not a kernel thread
 	mov	x0, x20
-- 
2.17.1

