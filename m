Return-Path: <linux-kbuild+bounces-8148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C93BB114BE
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E7D8171806
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FD82441B4;
	Thu, 24 Jul 2025 23:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eO/rBZtL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9530524A044
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400248; cv=none; b=cUEy3vVR5v3KreJynKRDHpRJDLY6Z6Cf/9jvYhkMWSLYdyhYHk12D+JSj3gUjUcX00zlt0XBhEFw1UMJ7PzzySpT1vHEV6iUK53pBifelIzgPEyQHtFNM4gKldq25gVg1hV79kaC4j6OvMJOU+50PxqsIhlUx/Od3PwgzPjZbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400248; c=relaxed/simple;
	bh=g8myJdAMdYL2MhaKnL63Vuez4fkKjNIq12NTzG9z8qA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtSeRSgNe0AjJbLv3Ke9DEC8vm4eWjnMsAfA4/U8DiZFGmneE6CL5fiu9CB8L6/RABXKXChW87ihEyjiyGCTmIZyw1JJ0NWxMsvXmrPNcjdNMB2Af7h0QBq2aFdVMjLczuh4kQyrG7wUaPNSbWNeMCbnl8eheld9W2I7AiwN3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eO/rBZtL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23649faf69fso12758735ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 16:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400246; x=1754005046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR/QY88sdxyw3B/3rrgSlLa8+7hhea91nQDWrYR/AlU=;
        b=eO/rBZtLJx0jFIyPeMhldXls+i7NMnkM4iHFtBbY9MdKNEHTCuUNKCZL/H6SxFVx1E
         HycbVsWfZ0lYGPwbbsU99pTpmA0KNQsLyZ9oc0XLMz+JKCkKjs+q95U9GySOizNGh4A1
         VZVCGzM75h9kuNcGHNZclUZe/dsvDp+NhrmuIoEcOWVLZhK+/f9MhujzrajWwUcH1S66
         bW70pHU7mlaZ1xlplem6jmG9V5OqWlsRH1dgf657mlvQvMBPYC7mFu2MtVKKsQAqwp5B
         EmqUsO0/2oEBhobae95VDuy3qkI9XWBdGo8Mpmpb04CUrPxFNc1Aj2Z35XqGscCNmZac
         s2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400246; x=1754005046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cR/QY88sdxyw3B/3rrgSlLa8+7hhea91nQDWrYR/AlU=;
        b=foWxCb+GqNgl4CkB0eEXqH9R5eF348RZJpZBaZXVtnouKGhWp3aBAg6bFzsqumQTGq
         SVtJ530rKIRUMJhUZobwtXRPqpcJpTP6A7aZbSzRfaCPf1kVlgozKIFwh9Ablo1vleCE
         jE7GmYFHUks2CRKLMliAte+PrdCHDg8SrkQxmpXTctOV0Kb3DKnjz6DdmTRwCiwVPHOQ
         gwGvQS55LjUtJgLDwDR+Knx15EtU/2VHcAIvLjDMcIMiHy4QBof3BdGOakhljnOp1BVr
         uYaoJB7a6xLI1JxoGJFXEiuyTAHyNO+7Lt4et/HvgvqO7WU+KmQfOIPtp8bqjiEDd0P2
         xEEg==
X-Forwarded-Encrypted: i=1; AJvYcCUoug4UyKfrEzFOkHfM9kcMCoeJ4jF0S511AT4ZEY8EBW9pd6l21f/Cz8PMUT6IlUi0G/BT67+954Tts1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+dP/gQfijJf9Vo6HilpfEsszn2eRtZtm063DcFT6YNuHcEnL
	Km/K1I1KxmJvf421w+27kzV6tS9e9z/SqIUVaslwvJabo3e3pdLkG4V6MjitT/9b2No=
X-Gm-Gg: ASbGncsXkBDs7oQXo9xN+4ptF94SiH5goloxEjoi93FxBylVN3/ofpgVhJbdP6unz0k
	79sepuWiQa9IeZFENeHhAa5p/OJJ+W8raMKo/8je4vRFtcjeclNOy7H/E5L/c8h5JCb2O5RBkCH
	Vqlbp7pgmYKYQ1jTaP0RxpGpopKexhVtaMSFX7K8v68afLhWCvhBv5kjAAhjMj/kU39Vf52W9+s
	a1ucjLNB/mhWz21YKFS7CBX36+EXffD2G/yAN+A6DlXPwMV+QjF5J076UHxuRedMjH8G6IWdaf/
	Du76rMqroxxNN1+urxQOOK0EJmzcQc5lWJdHJrQBl9tNegDYlUKJbGnbWO3auf6ycobny9ogYW0
	WePxZTh2iXo58u6w8BVZNtN9RrrctaQyd
X-Google-Smtp-Source: AGHT+IFpPmZfsrgw5MGLmfyvQ9TeyCoMqEZ9ePbdOyQJB+JX01/i58SgR22VLSNFSyWsuZBztHnwLA==
X-Received: by 2002:a17:902:ce01:b0:235:1706:2002 with SMTP id d9443c01a7336-23f98083375mr117426355ad.0.1753400245784;
        Thu, 24 Jul 2025 16:37:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:02 -0700
Subject: [PATCH 09/11] riscv: scs: add hardware shadow stack support to scs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-9-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Adding support for hardware support for shadow call stack on riscv. This
patch enables scs_* macros to use zicfiss shadow stack pointer (CSR_SSP)
instead of relying on `gp`.

Since zicfiss based shadow stack needs to have correct encoding set in PTE
init shadow stack can't be established too early. It has to be setup after
`setup_vm` is called. Thus `scs_load_init_stack` is noped out if
CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK is not selected.

Adds `arch_scs_store` that can be used in generic scs magic store routine.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm.h |  2 +-
 arch/riscv/include/asm/scs.h | 48 +++++++++++++++++++++++++++++++++++---------
 arch/riscv/kernel/entry.S    | 14 ++++++-------
 arch/riscv/kernel/head.S     |  4 ++--
 4 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index a8a2af6dfe9d..256aff523dd4 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -110,7 +110,7 @@
 	REG_L \dst, 0(\dst)
 .endm
 
-#ifdef CONFIG_SHADOW_CALL_STACK
+#if defined(CONFIG_SHADOW_CALL_STACK) && !defined(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)
 /* gp is used as the shadow call stack pointer instead */
 .macro load_global_pointer
 .endm
diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
index 0e45db78b24b..e70e6ef14bc5 100644
--- a/arch/riscv/include/asm/scs.h
+++ b/arch/riscv/include/asm/scs.h
@@ -9,46 +9,76 @@
 
 /* Load init_shadow_call_stack to gp. */
 .macro scs_load_init_stack
+#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
 	la	gp, init_shadow_call_stack
 	XIP_FIXUP_OFFSET gp
+#endif
 .endm
 
 /* Load the per-CPU IRQ shadow call stack to gp. */
-.macro scs_load_irq_stack tmp
+.macro scs_load_irq_stack tmp tmp1
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	load_per_cpu \tmp1, irq_shadow_call_stack_ptr, \tmp
+	li \tmp, 4096
+	add \tmp, \tmp, \tmp1
+	csrw CSR_SSP, \tmp
+#else
 	load_per_cpu gp, irq_shadow_call_stack_ptr, \tmp
+#endif
 .endm
 
 /* Load task_scs_sp(current) to gp. */
-.macro scs_load_current
+.macro scs_load_current tmp
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	REG_L	\tmp, TASK_TI_SCS_SP(tp)
+	csrw CSR_SSP, \tmp
+#else
 	REG_L	gp, TASK_TI_SCS_SP(tp)
+#endif
 .endm
 
 /* Load task_scs_sp(current) to gp, but only if tp has changed. */
-.macro scs_load_current_if_task_changed prev
+.macro scs_load_current_if_task_changed prev tmp
 	beq	\prev, tp, _skip_scs
-	scs_load_current
+	scs_load_current \tmp
 _skip_scs:
 .endm
 
 /* Save gp to task_scs_sp(current). */
-.macro scs_save_current
+.macro scs_save_current tmp
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	csrr \tmp, CSR_SSP
+	REG_S	\tmp, TASK_TI_SCS_SP(tp)
+#else
 	REG_S	gp, TASK_TI_SCS_SP(tp)
+#endif
 .endm
 
 #else /* CONFIG_SHADOW_CALL_STACK */
 
 .macro scs_load_init_stack
 .endm
-.macro scs_load_irq_stack tmp
+.macro scs_load_irq_stack tmp tmp1
 .endm
-.macro scs_load_current
+.macro scs_load_current tmp
 .endm
-.macro scs_load_current_if_task_changed prev
+.macro scs_load_current_if_task_changed prev tmp
 .endm
-.macro scs_save_current
+.macro scs_save_current tmp
 .endm
 
 #endif /* CONFIG_SHADOW_CALL_STACK */
 #endif /* __ASSEMBLY__ */
 
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+#define arch_scs_store(ss_addr, magic_val)	do {				\
+	asm volatile ("ssamoswap.d %0, %2, %1"					\
+					: "=r" (magic_val), "+A" (*ss_addr)	\
+					: "r" (magic_val)			\
+					: "memory");				\
+	} while (0)
+#else
+#define arch_scs_store(ss_addr, magic_val) do {} while (0)
+#endif
+
 #endif /* _ASM_SCS_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3f0890b9c0b9..800a5ab763af 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -199,7 +199,7 @@ SYM_CODE_START(handle_exception)
 	load_global_pointer
 
 	/* Load the kernel shadow call stack pointer if coming from userspace */
-	scs_load_current_if_task_changed s5
+	scs_load_current_if_task_changed s5 t0
 
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
@@ -260,7 +260,7 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
 
 	/* Save the kernel shadow call stack pointer */
-	scs_save_current
+	scs_save_current t0
 
 	/*
 	 * Save TP into the scratch register , so we can find the kernel data
@@ -382,8 +382,8 @@ SYM_FUNC_START(call_on_irq_stack)
 	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
 
 	/* Switch to the per-CPU shadow call stack */
-	scs_save_current
-	scs_load_irq_stack t0
+	scs_save_current t0
+	scs_load_irq_stack t0 t1
 
 	/* Switch to the per-CPU IRQ stack and call the handler */
 	load_per_cpu t0, irq_stack_ptr, t1
@@ -393,7 +393,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	jalr	a1
 
 	/* Switch back to the thread shadow call stack */
-	scs_load_current
+	scs_load_current t0
 
 	/* Switch back to the thread stack and restore ra and s0 */
 	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
@@ -440,7 +440,7 @@ SYM_FUNC_START(__switch_to)
 	REG_S s0, TASK_THREAD_SUM_RA(a3)
 
 	/* Save the kernel shadow call stack pointer */
-	scs_save_current
+	scs_save_current t0
 	/* Restore context from next->thread */
 	REG_L s0,  TASK_THREAD_SUM_RA(a4)
 	li    s1,  SR_SUM
@@ -463,7 +463,7 @@ SYM_FUNC_START(__switch_to)
 	/* The offset of thread_info in task_struct is zero. */
 	move tp, a1
 	/* Switch to the next shadow call stack */
-	scs_load_current
+	scs_load_current t0
 	ret
 SYM_FUNC_END(__switch_to)
 
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 59af044bf85c..366e15a9280a 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -184,7 +184,7 @@ secondary_start_sbi:
 	REG_S a0, (a1)
 1:
 #endif
-	scs_load_current
+	scs_load_current t0
 
 #if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
 	li a7, SBI_EXT_FWFT
@@ -367,7 +367,7 @@ SYM_CODE_START(_start_kernel)
 	REG_S a0, (a1)
 1:
 #endif
-	scs_load_current
+	scs_load_current t0
 
 #if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
 	li a7, SBI_EXT_FWFT

-- 
2.43.0


