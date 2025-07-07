Return-Path: <linux-kbuild+bounces-7896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE96FAFB395
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 14:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 284C117FD32
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 12:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAA128FFE6;
	Mon,  7 Jul 2025 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ZS7kZy05"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A664315C
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Jul 2025 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892644; cv=none; b=Jrn9SpomNBKqS9fa08J6UYz7+7XJpPTEAVQkAb0gXTY4wsdRm8z9dfkxgGsCMYgq0zvkAb5iFCZZMmbl10NPWaY+QW4dvLVUcOHAyVHF6qdJLL5MVpqJcKQLE6SSpBoMSXnKaza5D1kSND4VqcCiMLae9niAc9sIXPRfGdFZ9TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892644; c=relaxed/simple;
	bh=OvbwvHy8NKIk2Ezwx0joZLsA+nIKCuJt511I75yLdvo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=p1wjcgo0LiidIsTfhiioz4imswOuaFT24K+wTbP4q6iZgUQKJBXFatmWFX+v9Ac403OYzUF1lRCoAvI4mDp06ty4HAeAnWe3AZMcns5lYUjklCcI2TZO6dhr2jLLXQbVeNbMgmIBH0KJagM6qj13/QnaWr+zbQfk74FOl4PzM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ZS7kZy05; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso452880f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Jul 2025 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751892640; x=1752497440; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft2gGM1xdSh/BYGEm14JWzh26OBrCpmeDTwJtAeavYc=;
        b=ZS7kZy05qLj7qrQqIRNZqoqaCLVF0yPm+klc5IEQ7JFiW6LMYXiOb5yRMp38+69NA2
         AzdMRKgvbS9jh6svKv+irSmt1J96B1WwFoT17Z+yjbRZY36aJDhudVDkR8VnSPv4r0nM
         Rmv7SpZ5DFOtwNSMrDFV4wnK4/9dTtSA/Tw+Nf9LJOdAcXcXta+YC+Q0jNFjsheDiE3h
         HjeTgxijkK5xStYnKHOg3st6PkcOLBSAzbqf2jgwJoYvBLtZKQ2z+fE1jnUP3lDmfZ82
         PazeWSHfZ2Zmnyqt8JVnzoJXOJcglYdtzvQ12hdKH7BmtIMj1SRXY5+h+fGUMSovVJMk
         3Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892641; x=1752497441;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ft2gGM1xdSh/BYGEm14JWzh26OBrCpmeDTwJtAeavYc=;
        b=D9n1qkt8V71hb4a5trhFxob/HoLJrC747xawVHjXeF28qEPSn8LTLDPXQr0rjfTNfc
         xOY5KNAdRUOEQRdlCBbovs2liqyr8AfxPbquHGKxooUA0T/wu0uaqywHrRgxpTO6Qz2O
         Idb9suKJ/I2AQmsnB/aIhWPHAVRthMit/LThu5OlW7r0LEI3nmoLPwzKWzZZJIHDyVQM
         8UqNPGPU3isMk2CYsF6vfQc02pJYAhbO7v9zKJzCDCCcqz2KTgg5UUwlwWRgIeipoBcp
         AMOBqiN4wRL5A2OFPUl3megtvUjV7sa6h6jYstJqGpJVc1NDRp0dKjCVLOK06o3yDMUy
         mijA==
X-Forwarded-Encrypted: i=1; AJvYcCUl7f3LT1YncmF5nK95m7osPm3ZmEYLDtWGVMjqNCr2UkvuDgAJksAWJy7D+bEik+lx7K15P7pXzLup/3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlelufRBlexH3DXOGIokKfzilrJaKpTqXFrPZTceWEOe3zbxQ
	tMpZH0ctrUvgI44BtQtQ2B3BcbDvoNYDyN2Ldzswux7g4qhft4BrZaGPOdqgL1o3YIY=
X-Gm-Gg: ASbGncvyU8UhEflabq4luHURIli4BXbsp86q7hmcMrHZjlsEppnokiQrtiig0hj3Gi/
	eokAp0vOTTysjQasCvLqBzjcIwkCoMQvVkwowswKUjxlXXzxJiluUlCq0a1RRHvY17XCmBSocUa
	F8q+zlWzPKNFWFQ9zBQD9cxqWjNvgkcbNjWLyNFU1HfOKMKLBLKRaUFtTWqaq30x1eBiPvnyllj
	EbYo66HTbZjQ532zBsBx4fCqErxA81pBaxdIUcD4IADqonoPkYhZ1Hda/CkKDtYU7tiZhEckTha
	Yl6Rsfe2hNMs8LyZ2AhXyuyyjFtfll6HGgaN4dgZN9ghzm8N1I8YxEqbR6+j5Gp7sxpc
X-Google-Smtp-Source: AGHT+IEe0+QxHUH3lQ2uYaYi9vgxze6Sq1IneFmRKgL0IxDHY9UDkF9+kDTqonNSeqj2Uz7UzM76SQ==
X-Received: by 2002:a05:6000:2086:b0:3a4:eb46:7258 with SMTP id ffacd0b85a97d-3b496617d36mr3681711f8f.15.1751892640390;
        Mon, 07 Jul 2025 05:50:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:df6:4ed7:c6e7:1ee1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285bdf8sm9939855f8f.87.2025.07.07.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 05:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 14:50:39 +0200
Message-Id: <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
Subject: [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, <masahiroy@kernel.org>,
 <nathan@kernel.org>, <nicolas.schier@linux.dev>, <dennis@kernel.org>,
 <tj@kernel.org>, <cl@gentwo.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <andybnac@gmail.com>, <bjorn@rivosinc.com>, <cyrilbur@tenstorrent.com>,
 <rostedt@goodmis.org>, <puranjay@kernel.org>, <ben.dooks@codethink.co.uk>,
 <zhangchunyan@iscas.ac.cn>, <ruanjinjie@huawei.com>, <jszhang@kernel.org>,
 <charlie@rivosinc.com>, <cleger@rivosinc.com>, <antonb@tenstorrent.com>,
 <ajones@ventanamicro.com>, <debug@rivosinc.com>, <haibo1.xu@intel.com>,
 <samuel.holland@sifive.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250704084500.62688-1-cuiyunhui@bytedance.com>

2025-07-04T16:45:00+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> The following data was collected from tests conducted on the
> Spacemit(R) X60 using the fixed register method:
> [...]
> The fixed register method reduced performance by 5.29%.
> The per-CPU offset optimization improved performance by 2.52%.

What is the performance if you use the scratch register?

The patch below is completely unoptimized as I didn't want to shuffle
code around too much, but it could give a rough idea.

Thanks.

---8<---
The scratch register currently denotes the mode before exception, but we
can just use two different exception entry points to provide the same
information, which frees the scratch register for the percpu offset.

The user/kernel entry paths need more through rewrite, because they are
terribly wasteful right now.
---
Applies on top of d7b8f8e20813f0179d8ef519541a3527e7661d3a (v6.16-rc5)

 arch/riscv/include/asm/percpu.h | 13 ++++++++++
 arch/riscv/kernel/entry.S       | 46 ++++++++++++++++++++-------------
 arch/riscv/kernel/head.S        |  7 +----
 arch/riscv/kernel/smpboot.c     |  7 +++++
 arch/riscv/kernel/stacktrace.c  |  4 +--
 5 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percp=
u.h
new file mode 100644
index 000000000000..2c838514e3ea
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+static inline void set_my_cpu_offset(unsigned long off)
+{
+	csr_write(CSR_SCRATCH, off);
+}
+
+#define __my_cpu_offset csr_read(CSR_SCRATCH)
+
+#include <asm-generic/percpu.h>
+
+#endif
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 75656afa2d6b..e48c553d6779 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -91,18 +91,8 @@
 	REG_L	a0, TASK_TI_A0(tp)
 .endm
=20
-
-SYM_CODE_START(handle_exception)
-	/*
-	 * If coming from userspace, preserve the user thread pointer and load
-	 * the kernel thread pointer.  If we came from the kernel, the scratch
-	 * register will contain 0, and we should continue on the current TP.
-	 */
-	csrrw tp, CSR_SCRATCH, tp
-	bnez tp, .Lsave_context
-
-.Lrestore_kernel_tpsp:
-	csrr tp, CSR_SCRATCH
+SYM_CODE_START(handle_kernel_exception)
+	csrw CSR_SCRATCH, tp
=20
 #ifdef CONFIG_64BIT
 	/*
@@ -126,8 +116,22 @@ SYM_CODE_START(handle_exception)
 	bnez sp, handle_kernel_stack_overflow
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
 #endif
+	j handle_exception
+ASM_NOKPROBE(handle_kernel_exception)
+SYM_CODE_END(handle_kernel_exception)
=20
-.Lsave_context:
+SYM_CODE_START(handle_user_exception)
+	/*
+	 * If coming from userspace, preserve the user thread pointer and load
+	 * the kernel thread pointer.
+	 */
+	csrrw tp, CSR_SCRATCH, tp
+	j handle_exception
+
+SYM_CODE_END(handle_user_exception)
+ASM_NOKPROBE(handle_user_exception)
+
+SYM_CODE_START_NOALIGN(handle_exception)
 	REG_S sp, TASK_TI_USER_SP(tp)
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
@@ -158,11 +162,15 @@ SYM_CODE_START(handle_exception)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
=20
-	/*
-	 * Set the scratch register to 0, so that if a recursive exception
-	 * occurs, the exception vector knows it came from the kernel
-	 */
-	csrw CSR_SCRATCH, x0
+	REG_L s0, TASK_TI_CPU(tp)
+	slli s0, s0, 3
+	la s1, __per_cpu_offset
+	add s1, s1, s0
+	REG_L s1, 0(s1)
+
+	csrw CSR_SCRATCH, s1
+	la s1, handle_kernel_exception
+	csrw CSR_TVEC, s1
=20
 	/* Load the global pointer */
 	load_global_pointer
@@ -236,6 +244,8 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 * structures again.
 	 */
 	csrw CSR_SCRATCH, tp
+	la a0, handle_user_exception
+	csrw CSR_TVEC, a0
 1:
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..d8858334af2d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -188,14 +188,9 @@ secondary_start_sbi:
 .align 2
 .Lsetup_trap_vector:
 	/* Set trap vector to exception handler */
-	la a0, handle_exception
+	la a0, handle_kernel_exception
 	csrw CSR_TVEC, a0
=20
-	/*
-	 * Set sup0 scratch register to 0, indicating to exception vector that
-	 * we are presently executing in kernel.
-	 */
-	csrw CSR_SCRATCH, zero
 	ret
=20
 SYM_CODE_END(_start)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 601a321e0f17..2db44b10bedb 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -41,6 +41,11 @@
=20
 static DECLARE_COMPLETION(cpu_running);
=20
+void __init smp_prepare_boot_cpu(void)
+{
+	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
+}
+
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	int cpuid;
@@ -225,6 +230,8 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm =3D mm;
=20
+	set_my_cpu_offset(per_cpu_offset(curr_cpuid));
+
 	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
=20
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.=
c
index 3fe9e6edef8f..69b2f390a2d4 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,7 +16,7 @@
=20
 #ifdef CONFIG_FRAME_POINTER
=20
-extern asmlinkage void handle_exception(void);
+extern asmlinkage void handle_kernel_exception(void);
 extern unsigned long ret_from_exception_end;
=20
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
@@ -72,7 +72,7 @@ void notrace walk_stackframe(struct task_struct *task, st=
ruct pt_regs *regs,
 			fp =3D frame->fp;
 			pc =3D ftrace_graph_ret_addr(current, &graph_idx, frame->ra,
 						   &frame->ra);
-			if (pc >=3D (unsigned long)handle_exception &&
+			if (pc >=3D (unsigned long)handle_kernel_exception &&
 			    pc < (unsigned long)&ret_from_exception_end) {
 				if (unlikely(!fn(arg, pc)))
 					break;

