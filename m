Return-Path: <linux-kbuild+bounces-8709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CFAB43098
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A51A004A3
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C00C231827;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ax77Piwh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489262288CB;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=IfMzR35Ya+s9JUoUei3LtkEtWWKtpHBAWZ+5/ZKb1WfPc+SCW2FoQDuhDcqu4TTaG8Z96b3B534+vtl71Xjl4xrlTvblpRqoLTylUNS0GD9ontpOdu0oDUrq0cLqVgzpu8bcmd/xYx8Pro5WJv2D12fDKkMrJOhPWQOercdEUfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=gygAMbYS4/B7LWfdzKi5nAbFlKtsg4fEng11C4rHscA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RuAaseUNNZtgsk2DO/25F1UKw/ysdoNz8Zhd1P7sll9/s1UCzJ9YeAxqA4g+WMY4WlOS3YYqKsVkQQEuTTIE3ROjFC/0YZtiesbxEJSEdZMpPJvpzCKCX1E3WPyft4etRCysuhp3m4lHJ9YlMffz1sBXpami045KVk5D667pBz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ax77Piwh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57B5C4CEFB;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=gygAMbYS4/B7LWfdzKi5nAbFlKtsg4fEng11C4rHscA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ax77PiwhKcQSmL+erPQOSQzZtwHMjB7MlrBfQJMwgdIsaxbt+573t0SUH6yHrHkJ3
	 MkT+5bEPP6ahiL4X3gvDSnlCKUBMkFLF8vbl053+vkwlFs0RPik7MNgDTSwHdxm/V2
	 Y83JLwcOw35riFnhHzBlZ3s0oit68/A2QdGsOM7+WcdUBA2/0ouo74mLA6iAAmKXrs
	 xjB/uwejT5g799laygAHq46UhgFrmajI57kspqGI5QtFomOny8Y4lVPFFevWIMlWXj
	 1gu7EPzf0cBMhXuAULqTZSIj1HcBgF8lAEGs2Fa232iAMVQcHfE0DM9Zpg0Z4GQLlp
	 shQFx2TjNSQhQ==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Micha=C5=82=20Pecio?= <michal.pecio@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 9/9] ARM: traps: Implement KCFI trap handler for ARM32
Date: Wed,  3 Sep 2025 20:46:48 -0700
Message-Id: <20250904034656.3670313-9-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5332; i=kees@kernel.org; h=from:subject; bh=gygAMbYS4/B7LWfdzKi5nAbFlKtsg4fEng11C4rHscA=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OUv3bN80e35o3zHx0myb+o8qKnZfg7IPSfIduFpVL 71eyfxERykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwEQ+dDD8FfttyuvjKDe7J/Di h2WqfeW1jRw+wb032a1sLxWWimQ+YPgft3Ij5+HZqmcvrGNlTr+uq1A4R/QWm9aTPZevstUHL0j hBwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

ARM32 KCFI violations currently show as generic "Oops - undefined
instruction" errors, making debugging CFI failures difficult. Add a
proper KCFI trap handler similar to the aarch64 implementation to
provide clear CFI error messages.

The GCC ARM32 KCFI implementation uses UDF instructions with a specific
encoding pattern:
- UDF instruction format: cccc 0111 1111 imm12 1111 imm4
- 16-bit immediate reconstructed from bits 19-8 and 3-0
- KCFI encoding: 0x8000 | (type_reg_num << 5) | (target_reg_num & 31)
- Bit 15: KCFI trap identifier (0x8000)
- Bits 9-5: Type ID register field (0x1F when unavailable)
- Bits 4-0: Target address register number

When the type register field is 0x1F (unavailable due to stack
spilling), the handler walks back up to 5 preceding instructions to
locate the movw/movt instruction pair that loads the 32-bit type ID,
similar to x86 CFI trap reconstruction.

The undef_hook pattern matching includes the KCFI bit requirement to
ensure the handler is only called for KCFI violations, not arbitrary
UDF instructions.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "Michał Pecio" <michal.pecio@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 arch/arm/kernel/traps.c | 102 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index afbd2ebe5c39..f2e4e18541e0 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -27,6 +27,7 @@
 #include <linux/sched/task_stack.h>
 #include <linux/irq.h>
 #include <linux/vmalloc.h>
+#include <linux/cfi.h>
 
 #include <linux/atomic.h>
 #include <asm/cacheflush.h>
@@ -40,6 +41,7 @@
 #include <asm/stacktrace.h>
 #include <asm/system_misc.h>
 #include <asm/opcodes.h>
+#include <linux/bitfield.h>
 
 
 static const char *handler[]= {
@@ -685,6 +687,106 @@ asmlinkage int arm_syscall(int no, struct pt_regs *regs)
 	return 0;
 }
 
+#ifdef CONFIG_CFI
+/*
+ * ARM32 KCFI trap handler.
+ * UDF instruction format: cccc 0111 1111 imm12 1111 imm4
+ * Immediate is reconstructed from bits 19-8 (12 bits) and bits 3-0 (4 bits)
+ * KCFI immediate encoding: 0x8000 | (0x1F << 5) | (target_reg_num & 31)
+ * - Bit 15: KCFI trap identifier (0x8000)
+ * - Bits 9-5: Type ID register field (0x1F when invalid due to stack spilling)
+ * - Bits 4-0: Target address register number
+ */
+#define CFI_UDF_KCFI_BIT    BIT(15)	  /* KCFI identifier bit (0x8000) */
+#define CFI_UDF_IMM_TARGET  GENMASK(4, 0) /* Target register (bits 4:0) */
+#define CFI_UDF_IMM_TYPE    GENMASK(9, 5) /* Type register (bits 9:5) */
+
+/* UDF base pattern with KCFI bit: cond=0xe, 0x7f, xxxx, 1xxx, 0xf, xxxx */
+#define CFI_UDF_IMM_BASE    0xe7f008f0
+#define CFI_UDF_IMM_MASK    0xfff008f0	/* Mask for UDF + KCFI bit matching */
+
+static int cfi_udf_handler(struct pt_regs *regs, unsigned int instr)
+{
+	unsigned long target;
+	u32 target_reg, type_reg, type, imm16;
+
+	/* Reconstruct 16-bit immediate from bits 19-8 and 3-0 */
+	imm16 = ((instr >> 4) & 0xfff0) | (instr & 0x0f);
+
+	target_reg = FIELD_GET(CFI_UDF_IMM_TARGET, imm16);
+	type_reg = FIELD_GET(CFI_UDF_IMM_TYPE, imm16);
+
+	if (target_reg >= 16) {
+		pr_err("CFI UDF handler: invalid target register %u\n", target_reg);
+		return 1;
+	}
+
+	target = regs->uregs[target_reg];
+
+	/* Type register field is set to all 1s (0x1F) when invalid due to stack spilling */
+	if (type_reg == 0x1F) {
+		u32 *pc = (u32 *)regs->ARM_pc;
+		int i;
+
+		type = 0;
+		/* Walk back up to 5 instructions to find movw/movt pair for type ID */
+		for (i = 1; i <= 5; i++) {
+			u32 instr_prev = __mem_to_opcode_arm(pc[-i]);
+
+			/* Check for movw: cccc 0011 0000 imm4 Rd imm12 */
+			if ((instr_prev & 0x0ff00000) == 0x03000000) {
+				u32 imm16 = ((instr_prev >> 4) & 0xf000) | (instr_prev & 0xfff);
+				type |= imm16;
+			}
+			/* Check for movt: cccc 0011 0100 imm4 Rd imm12 */
+			else if ((instr_prev & 0x0ff00000) == 0x03400000) {
+				u32 imm16 = ((instr_prev >> 4) & 0xf000) | (instr_prev & 0xfff);
+				type |= (imm16 << 16);
+			}
+		}
+		if (type == 0)
+			pr_err("CFI UDF handler: failed to find type value\n");
+	} else {
+		if (type_reg >= 16) {
+			pr_err("CFI UDF handler: invalid type register %u\n", type_reg);
+			return 1;
+		}
+
+		type = regs->uregs[type_reg];
+	}
+
+	switch (report_cfi_failure(regs, regs->ARM_pc, &target, type)) {
+	case BUG_TRAP_TYPE_BUG:
+		die("Oops - CFI", regs, 0);
+		break;
+	case BUG_TRAP_TYPE_WARN:
+		break;
+	default:
+		return 1;
+	}
+
+	/* Skip the UDF instruction */
+	regs->ARM_pc += 4;
+	return 0;
+}
+
+static struct undef_hook cfi_undef_hook = {
+	.instr_mask	= CFI_UDF_IMM_MASK,
+	.instr_val	= CFI_UDF_IMM_BASE,
+	.cpsr_mask	= 0,
+	.cpsr_val	= 0,
+	.fn		= cfi_udf_handler,
+};
+
+static int __init arm_cfi_init(void)
+{
+	register_undef_hook(&cfi_undef_hook);
+	return 0;
+}
+
+early_initcall(arm_cfi_init);
+#endif /* CONFIG_CFI */
+
 #ifdef CONFIG_TLS_REG_EMUL
 
 /*
-- 
2.34.1


