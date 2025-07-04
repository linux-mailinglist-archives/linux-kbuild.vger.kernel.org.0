Return-Path: <linux-kbuild+bounces-7874-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1CCAF8CAC
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 10:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F1C43B5C07
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 08:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7F81F419B;
	Fri,  4 Jul 2025 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NubWRX8R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5A1289E1F
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Jul 2025 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618715; cv=none; b=ECiEQLImJ5bbs121mpaUBTCzPA/PQkOkUwgv9QBE+5EqNgik8h6+5IVe/ZoBT3k9IScRG+em4wImb5iMX5FCQ3w7cADMPpyGomJFvt9yZlugK3SsokVNZxxy/VFSb96/L4HckrPpy0O9slS0VpVOfom49vvrkDUJMb26ZJhc7C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618715; c=relaxed/simple;
	bh=hEYT/TtBh26X/Vvd8QANkkvTxzLE9+3qz5T2f2b9PZU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=jJdDEgE7M43X4xqEdz/DpjT1kaBrugIJJ9TWWFzcaYnWAQqQ88uV2AVAHTuVGuPfTFh8zci3KBzslK4a9wuFDyQyxC4vmjP65lKT3NQs5LVBdE6sfl2R5otgx4OWxL2YQRj1+HHLLHqp5SVzgpLQ5Cks9QQ0OXmrBpjEt4fZ1Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NubWRX8R; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748feca4a61so474465b3a.3
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Jul 2025 01:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751618712; x=1752223512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=63zu7OUSE7H3LEgq1aY0wKyYCc7q428IAvJH1wbVnOQ=;
        b=NubWRX8RHeZQxKGs9rxIaDvVJUNkdG5WPYo02b3yFWwTzDW6FcofcgMG/AOnvqVmrW
         K7KypCw9uTCCvMZouSheeUfToCZwbl0C7lhg9ce3xI6FoVv+moAI04kl/cH03RfF4BEa
         DUa6+fid33b3GttYD9D38ryXFBGH4hjkHqD6jYXXvieVR+hIzWY73fJ6lprsZtyyhs50
         Hqpw7e6xHFm51pDI9m+3StfgOgUMXKDBuFxcIZ7D938a8CHzgORh+T+0mZkfUFd462Tq
         kZt8RdbYvQImm5MasDGvbrv4WhmX/k9o8S9MQwW1DLsPnG2Zt4S8Jcga7zCdWMWYdgIw
         Dptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618712; x=1752223512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63zu7OUSE7H3LEgq1aY0wKyYCc7q428IAvJH1wbVnOQ=;
        b=WlfQlR6zJY7l3Oi5xLk60pVYNNYMwFvwq0Kg1/JoZP/lp/I+c+bd2huRoQRxbO+Mq0
         gZVUOOFIJrbYbRdHxeWs9jiaxf+Qoe/53JeEEw/vBF48oUQNgpcmTr5vEa+iOgUteTJ2
         WbqP98PVeiGWu+jzzeI3hI8DIDuwmfJmIhgHQ86QcnomplcgP6E4+m9Rgy75ahZKXKR8
         E0FlvVAA1UQl7pF7x7MrUjWmKSn2xMGbx4DBzBYobofdCtNqWq/eKt/2dhpvgxdXnGPW
         3yJdMQYHGxUHw3Dv4sfRRmP/u4sLE1fO3TxaT3Dlb703lO82szCehRd70GZqTN4iOWvo
         mDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCHtmfOY9TUBp49+p0RYTQV+zMk2aaHzP8dRSHA9fPbFtOVUMjlhzu766OBmI9lo59lZGArKfBuy1Eza0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzAGpYiKe7vq7g+D/lTxf9IG2T/nwhVQNiF+qFfz2e0Xg/pvF
	npQ7uskUH59wjKeEdPc4G7gX58EanTDNoVdIMCD8PtZ9hiais2hH9H6tycL0LYkxrPI=
X-Gm-Gg: ASbGncvkI72VAUIcoE8uoTDcYH4IGfSk+yjxY0aBNoJX1z3KaudsvwntXOsJ80BL2WS
	BJNsKVACgtqMJbNdrbagIKlYGJ8sdqUUG6XyzNVcgzKSfZtEA9ivzXl4vbVZKRhDxd0O8GTEh3J
	DNLekeIJVLuBtMwMmIifB/ku+2NL1yak24V2a7Tln/ZfXNt6JeB5ae+t4Tj42N3DlnCeHFTojr4
	xWzKStybkFTJl2N0SKBO2tPAh+2LFCvxTYBEgBF9mupRcXqhBewnALa5D8T5JzCZwaz+zszJBk+
	QWI+Om0jMzVc7kCKwcdhM2URC893xEeEHD6b7f9ZHD3uOwBxojokB2K2NuhI7qei2JfghBn99Py
	Ef7A6aJGntK/u9epf
X-Google-Smtp-Source: AGHT+IHwfnsSoknuDyaRYIcga1M43ZSFI80Oh8nP0dEX5TdzD+tVrQdta0nFCVUmLLuNum1o9VjWJA==
X-Received: by 2002:a05:6a00:6ca1:b0:74c:efae:ffae with SMTP id d2e1a72fcca58-74cefaf0042mr19469b3a.5.1751618712474;
        Fri, 04 Jul 2025 01:45:12 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cd066sm1722118b3a.53.2025.07.04.01.45.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 01:45:12 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andybnac@gmail.com,
	bjorn@rivosinc.com,
	cyrilbur@tenstorrent.com,
	rostedt@goodmis.org,
	puranjay@kernel.org,
	ben.dooks@codethink.co.uk,
	zhangchunyan@iscas.ac.cn,
	ruanjinjie@huawei.com,
	jszhang@kernel.org,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	antonb@tenstorrent.com,
	ajones@ventanamicro.com,
	debug@rivosinc.com,
	cuiyunhui@bytedance.com,
	haibo1.xu@intel.com,
	samuel.holland@sifive.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC] RISC-V: Fix a register to store the percpu offset
Date: Fri,  4 Jul 2025 16:45:00 +0800
Message-Id: <20250704084500.62688-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following data was collected from tests conducted on the
Spacemit(R) X60 using the fixed register method:

No modifications:
6.77, 6.791, 6.792, 6.826, 6.784, 6.839, 6.776, 6.733, 6.795, 6.763
Average: 6.786839305

ffix-x27:
7.106, 7.035, 7.362, 7.141, 7.096, 7.182, 7.109, 7.126, 7.186, 7.12
Average: 7.145826539

ffix-x27 + x27(s11) used for offset optimization:
7.059, 6.951, 6.961, 6.985, 6.93, 6.964, 6.977, 6.907, 6.983, 6.944
Average: 6.965993173

Analysis:
The fixed register method reduced performance by 5.29%.
The per-CPU offset optimization improved performance by 2.52%.

Issues with the fixed register method (beyond code size):
Performance degradation due to the loss of one general-purpose register.
Each handle_exception() call requires loading the per-CPU offset into the
fixed register.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Makefile                        |  4 ++--
 arch/riscv/include/asm/percpu.h | 22 ++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c |  1 +
 arch/riscv/kernel/entry.S       | 11 +++++++++--
 arch/riscv/kernel/smpboot.c     |  3 +++
 5 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/Makefile b/Makefile
index b7d5f2f0def0..e291f865adc4 100644
--- a/Makefile
+++ b/Makefile
@@ -1026,8 +1026,8 @@ include $(addprefix $(srctree)/, $(include-y))
 
 # Add user supplied CPPFLAGS, AFLAGS, CFLAGS and RUSTFLAGS as the last assignments
 KBUILD_CPPFLAGS += $(KCPPFLAGS)
-KBUILD_AFLAGS   += $(KAFLAGS)
-KBUILD_CFLAGS   += $(KCFLAGS)
+KBUILD_AFLAGS   += $(KAFLAGS) -ffixed-x27
+KBUILD_CFLAGS   += $(KCFLAGS) -ffixed-x27
 KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
 
 KBUILD_LDFLAGS_MODULE += --build-id=sha1
diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 000000000000..5d6b109cfab7
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+static inline void set_my_cpu_offset(unsigned long off)
+{
+	asm volatile("addi s11, %0, 0" :: "r" (off));
+}
+
+static inline unsigned long __kern_my_cpu_offset(void)
+{
+	unsigned long off;
+	asm ("mv %0, s11" :"=r" (off) :);
+	return off;
+}
+
+#define __my_cpu_offset __kern_my_cpu_offset()
+
+#include <asm-generic/percpu.h>
+
+#endif
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a03129f40c46..0ce96f30bf32 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -35,6 +35,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9d1a305d5508..529d6576265e 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -77,6 +77,13 @@ SYM_CODE_START(handle_exception)
 	 */
 	csrw CSR_SCRATCH, x0
 
+	/* load __per_cpu_offset[cpu] to s11*/
+	REG_L t6, TASK_TI_CPU(tp)
+	slli t6, t6, 3
+	la s11, __per_cpu_offset
+	add s11, s11, t6
+	REG_L s11, 0(s11)
+
 	/* Load the global pointer */
 	load_global_pointer
 
@@ -298,7 +305,7 @@ SYM_FUNC_START(__switch_to)
 	REG_S s8,  TASK_THREAD_S8_RA(a3)
 	REG_S s9,  TASK_THREAD_S9_RA(a3)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
-	REG_S s11, TASK_THREAD_S11_RA(a3)
+	/* REG_S s11, TASK_THREAD_S11_RA(a3) */
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
@@ -315,7 +322,7 @@ SYM_FUNC_START(__switch_to)
 	REG_L s8,  TASK_THREAD_S8_RA(a4)
 	REG_L s9,  TASK_THREAD_S9_RA(a4)
 	REG_L s10, TASK_THREAD_S10_RA(a4)
-	REG_L s11, TASK_THREAD_S11_RA(a4)
+	/* REG_L s11, TASK_THREAD_S11_RA(a4) */
 	/* The offset of thread_info in task_struct is zero. */
 	move tp, a1
 	/* Switch to the next shadow call stack */
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index fb6ab7f8bfbd..6fa12cc84523 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -43,6 +43,7 @@ static DECLARE_COMPLETION(cpu_running);
 
 void __init smp_prepare_boot_cpu(void)
 {
+	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -240,6 +241,8 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+	set_my_cpu_offset(per_cpu_offset(curr_cpuid));
+
 	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
 
-- 
2.43.0


