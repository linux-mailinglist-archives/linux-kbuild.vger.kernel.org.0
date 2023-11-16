Return-Path: <linux-kbuild+bounces-37-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49E7EE10A
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 14:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80CFE1F246F6
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Nov 2023 13:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15E62FE3F;
	Thu, 16 Nov 2023 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 071A811D;
	Thu, 16 Nov 2023 05:04:58 -0800 (PST)
Received: from loongson.cn (unknown [112.22.233.25])
	by gateway (Coremail) with SMTP id _____8CxLOt5E1Zl8Is6AA--.44338S3;
	Thu, 16 Nov 2023 21:04:57 +0800 (CST)
Received: from localhost.localdomain (unknown [112.22.233.25])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxP912E1ZlOydEAA--.20248S2;
	Thu, 16 Nov 2023 21:04:56 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Jinyang He <hejinyang@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH] LoongArch: Record pc instead of offset in la-abs relocation
Date: Thu, 16 Nov 2023 21:03:31 +0800
Message-ID: <20231116130331.241395-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxP912E1ZlOydEAA--.20248S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFyxuF43Zw47Aw4Uur4kuFX_yoW8Zry8pF
	9rZr1ktF4rWr1fKF1Dtas8urn8JanrWr1aganxKa48Aa1aqF1DXr1vg3sFvFyUta1FqrWI
	ga4rKwnaqa1UAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

To clarify, the previous version functioned flawlessly. However, it's
worth noting that the LLVM's LoongArch backend currently lacks support
for cross-section label calculations. With this patch, we enable the use
of clang to compile relocatable kernels.

Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 arch/loongarch/include/asm/asmmacro.h | 3 +--
 arch/loongarch/include/asm/setup.h    | 2 +-
 arch/loongarch/kernel/relocate.c      | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/asmmacro.h b/arch/loongarch/include/asm/asmmacro.h
index c9544f358c33..655db7d7a427 100644
--- a/arch/loongarch/include/asm/asmmacro.h
+++ b/arch/loongarch/include/asm/asmmacro.h
@@ -609,8 +609,7 @@
 	lu32i.d	\reg, 0
 	lu52i.d	\reg, \reg, 0
 	.pushsection ".la_abs", "aw", %progbits
-	768:
-	.dword	768b-766b
+	.dword	766b
 	.dword	\sym
 	.popsection
 #endif
diff --git a/arch/loongarch/include/asm/setup.h b/arch/loongarch/include/asm/setup.h
index a0bc159ce8bd..ee52fb1e9963 100644
--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -25,7 +25,7 @@ extern void set_merr_handler(unsigned long offset, void *addr, unsigned long len
 #ifdef CONFIG_RELOCATABLE
 
 struct rela_la_abs {
-	long offset;
+	long pc;
 	long symvalue;
 };
 
diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 6c3eff9af9fb..288b739ca88d 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -52,7 +52,7 @@ static inline void __init relocate_absolute(long random_offset)
 	for (p = begin; (void *)p < end; p++) {
 		long v = p->symvalue;
 		uint32_t lu12iw, ori, lu32id, lu52id;
-		union loongarch_instruction *insn = (void *)p - p->offset;
+		union loongarch_instruction *insn = (void *)p->pc;
 
 		lu12iw = (v >> 12) & 0xfffff;
 		ori    = v & 0xfff;
-- 
2.42.1


