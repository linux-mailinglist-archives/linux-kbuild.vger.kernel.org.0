Return-Path: <linux-kbuild+bounces-7947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC6DAFE7FC
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 13:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BED3189554B
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 11:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F266A2D8388;
	Wed,  9 Jul 2025 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WPBxqsW/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2652D77FD
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Jul 2025 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061360; cv=none; b=EoiuYRnUi4+EP20CtoSTIcTN9CyCJctxaBWyCM2+zXrBJTCK7OZUqgBI49UmQIW/GbWosa2FKFez+kurLjfV1CrSmpEGHQ7JcaUxH37Mfi8gA+ynv/viMM2SRdsT4Z5GVfGqn9C0H3aC/AyP9wtHN2/piriQef7qVkExNvLxaIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061360; c=relaxed/simple;
	bh=KCPjLO3cl9/mGj0bdCMNipFsdT/B7e34EivVeUr0tdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7uQlrqFcc2wXiXqh267k8bHvRUhXC6Hb/Zt69EtzDA1L7q3+C3eP3XFYy7Phao8whe1dPESFmbvaBcKla++IY2HjMb5B7aswF59q1iBRiM21o/wW2odkH2jQPATo/NoPMkQ9SX4pzy3fmqvOAMaZGaP4dL/SJpbeul0ZipLG8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WPBxqsW/; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-40b859461easo2954790b6e.1
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Jul 2025 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752061358; x=1752666158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf6wWl6n7d/QhS1jb85XHnTgsGudA3C5Y1Dh/3rgidQ=;
        b=WPBxqsW/g1iXogFtX7NU3HjojeHN2VQHlqhp4D2NnjKqh0a8rNAOzS2kcQ4QSj41wT
         PgXELFoac7Yfw7LC5q66Y3h6rSu+qYu67ZHeF/wsNbGFjHeuft7eCYgpdijWgA2WKdqC
         l5jJ9byfuM28iZMcdK4M58pt5nEeGQ2t2dyh+u9jiiLUmhItwQh8nvvfjLePHg0z/KO+
         j4nraJTtmbB1hf50qqkcgsebBveUm6ME1FodrcCdaa+kkJ0VccpWX6OPUSfxECzXY2gf
         LcMBsf/pm0Yrc9cQ2mM8uCQm7rjkUcGGGmSOzKVLZnoZtC3pZ74AGPdq4GbUYUvMT0Xo
         mLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061358; x=1752666158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uf6wWl6n7d/QhS1jb85XHnTgsGudA3C5Y1Dh/3rgidQ=;
        b=ucq7Q6Mb6a/zfdkiHBpz9pli7bC20we+48oWHbvf3iWq8RAf5SEMdmKgLD5tv1z3FF
         VwA5rSSO0Vt3IYrYSxutgnxGpZfL639R7iC/rKWDQ5JTSMT/QOwuOBTwkZyGnVWwlzpd
         aXVcJpPVpwZhGF2nD6gxFB/VvF7FLL8rIC1Wk0x57/DN/18dHegCPA+xuL+qiMB0NZIq
         MS4uWd/KUwmv8gqbtSKJxYVNtlwU892X7q87YqSZNWH3SMD7AET/oMrPPCqvDXOWX3EN
         HbDiBMf6YDHfw2lMf2UECyAsSKEipmvY4y2ORz4GmlDswdpWUpAvYWd5IRdcFYVYo0u9
         tLKg==
X-Forwarded-Encrypted: i=1; AJvYcCXDcADPrRzNwMijAKXc40B4iY/r1SdTwWmeMNIvXTmWrO+jU5T/YuE9BUtZvfURYyhHcPjJf8whrAfrwEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmEqsXl6G32XWvDB5rbL7fpZSO6gLHq93YeL6PsZ7qVnjEMvEX
	rQoORCoFyBNQgplSl16rPc18WERaI/YetwLb6omj4dtKh72TMEQClp4tqXljLXNbcme57Rp8bXO
	9ruT2vYQGwz2Qbytu3Vp3MUfFdAKczTcFbRyS1Ur9LQ==
X-Gm-Gg: ASbGncuxSo0EQ9j3i+vuDxYqsDthsnWFkVocz+0Ggd47NVZUu1IqZQ8cMfdsfBrFWpS
	ZZd+upNCrX8vW9rPqat6erw4SYpnm77QryuH2LE8kR4ggJxjguoCsWfctMOD4R9gmKXE4gDSNab
	K1utbfHZcCrCBkpRW6qDWC+UfnyIALTBdf78Dn4uILimFgUg==
X-Google-Smtp-Source: AGHT+IFFarpV+643bKt5qJ+DNCUdXRkgdbFv1DFborAIItZ6HyKDTIAMbIuL6CmIep7RFIIvzboL1lf5sVGTpr/bZVk=
X-Received: by 2002:a05:6808:4fea:b0:40b:4208:710f with SMTP id
 5614622812f47-412bc6654bdmr1245049b6e.24.1752061357971; Wed, 09 Jul 2025
 04:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com> <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
In-Reply-To: <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 9 Jul 2025 19:42:26 +0800
X-Gm-Features: Ac12FXxVaWmUGd4ywnuSLaoxkhkOuISEKPywBGSGA0DKa-8LUWkMvwEIkoA4H6I
Message-ID: <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, andybnac@gmail.com, 
	bjorn@rivosinc.com, cyrilbur@tenstorrent.com, rostedt@goodmis.org, 
	puranjay@kernel.org, ben.dooks@codethink.co.uk, zhangchunyan@iscas.ac.cn, 
	ruanjinjie@huawei.com, jszhang@kernel.org, charlie@rivosinc.com, 
	cleger@rivosinc.com, antonb@tenstorrent.com, ajones@ventanamicro.com, 
	debug@rivosinc.com, haibo1.xu@intel.com, samuel.holland@sifive.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, wangziang.ok@bytedance.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radim,

On Tue, Jul 8, 2025 at 7:10=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar=
@ventanamicro.com> wrote:
>
> 2025-07-08T18:07:27+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> > This patch cleverly differentiates whether an exception originates
> > from user mode or kernel mode. However, there's still an issue with
> > using CSR_SCRATCH: each time handle_exception() is called, the
> > following instructions must be executed:
> >
> > REG_L s0, TASK_TI_CPU(tp)
> > slli s0, s0, 3
> > la s1, __per_cpu_offset
> > add s1, s1, s0
> > REG_L s1, 0(s1)
> > csrw CSR_SCRATCH, s1
>
> We can minimize the cost at exception entry by storing the precomputed
> offset in thread_info, which bloats the struct, and also incurs update
> cost on cpu migration, but should still be a net performance gain.
>
> The minimal code at exception entry would be:
>
>   REG_L s0, TASK_TI_PERCPU_OFFSET(tp)
>   csrw CSR_SCRATCH, s0
>
> > Should we consider adding a dedicated CSR (e.g., CSR_SCRATCH2) to
> > store the percpu offset instead?
> > See: https://lists.riscv.org/g/tech-privileged/topic/113437553#msg2506
>
> It would be nice to gather more data on the CSR_SCRATCH approach.
> Basically, the overhead of "REG_L s0, TASK_TI_PERCPU_OFFSET(tp)".
> (Or the longer sequence if we think it is worth it.)
>
> Can you benchmark the patch after reverting percpu.h, so we include the
> overhead of switching CSR_SCRATCH, but without any benefits provided by
> the per-cpu offset?
> The baseline would be the patch with reverted percpu.h, and reverted the
> sequence that sets the CSR_SCRATCH in handle_exception, so we roughly
> estimate the benefit of adding CSR_SCRATCH2.
>
> The CSR_SCRATCH2 does add overhead to hardware, and to domain context
> switches, and we also have to do something else for a few years anyway,
> because it's not even ratified...  It's possible we might not benefit
> enough from CSR_SCRATCH2 to make a good case for it.
>
> Thanks.

Bench platform: Spacemit(R) X60
No changes:
6.77, 6.791, 6.792, 6.826, 6.784, 6.839, 6.776, 6.733, 6.795, 6.763
Geometric mean: 6.786839305
Reusing the current scratch:
7.085, 7.09, 7.021, 7.089, 7.068, 7.034, 7.06, 7.062, 7.065, 7.051
Geometric mean: 7.062466876
A degradation of approximately 4.06% is observed. The possible cause
of the degradation is that the CSR_TVEC register is set every time a
kernel/user exception occurs.

The following is the patch without percpu optimization, which only
tests the overhead of separating exceptions into kernel and user
modes.

---
 arch/riscv/kernel/entry.S | 39 ++++++++++++++++++++++-----------------
 arch/riscv/kernel/head.S  |  7 +------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9d1a305d5508..cc2fd4cd54a0 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -19,17 +19,8 @@

  .section .irqentry.text, "ax"

-SYM_CODE_START(handle_exception)
- /*
- * If coming from userspace, preserve the user thread pointer and load
- * the kernel thread pointer.  If we came from the kernel, the scratch
- * register will contain 0, and we should continue on the current TP.
- */
- csrrw tp, CSR_SCRATCH, tp
- bnez tp, .Lsave_context
-
-.Lrestore_kernel_tpsp:
- csrr tp, CSR_SCRATCH
+SYM_CODE_START(handle_kernel_exception)
+ csrw CSR_SCRATCH, tp
  REG_S sp, TASK_TI_KERNEL_SP(tp)

 #ifdef CONFIG_VMAP_STACK
@@ -40,7 +31,20 @@ SYM_CODE_START(handle_exception)
  REG_L sp, TASK_TI_KERNEL_SP(tp)
 #endif

-.Lsave_context:
+ j handle_exception
+SYM_CODE_END(handle_kernel_exception)
+
+SYM_CODE_START(handle_user_exception)
+ /*
+ * If coming from userspace, preserve the user thread pointer and load
+ * the kernel thread pointer.
+ */
+ csrrw tp, CSR_SCRATCH, tp
+ j handle_exception
+
+SYM_CODE_END(handle_user_exception)
+
+SYM_CODE_START_NOALIGN(handle_exception)
  REG_S sp, TASK_TI_USER_SP(tp)
  REG_L sp, TASK_TI_KERNEL_SP(tp)
  addi sp, sp, -(PT_SIZE_ON_STACK)
@@ -71,11 +75,8 @@ SYM_CODE_START(handle_exception)
  REG_S s4, PT_CAUSE(sp)
  REG_S s5, PT_TP(sp)

- /*
- * Set the scratch register to 0, so that if a recursive exception
- * occurs, the exception vector knows it came from the kernel
- */
- csrw CSR_SCRATCH, x0
+ la s1, handle_kernel_exception
+ csrw CSR_TVEC, s1

  /* Load the global pointer */
  load_global_pointer
@@ -141,6 +142,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
  * structures again.
  */
  csrw CSR_SCRATCH, tp
+
+ la a0, handle_user_exception
+ csrw CSR_TVEC, a0
+
 1:
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
  move a0, sp
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index a2e2f0dd3899..992acec3bc87 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -172,14 +172,9 @@ secondary_start_sbi:
 .align 2
 .Lsetup_trap_vector:
  /* Set trap vector to exception handler */
- la a0, handle_exception
+ la a0, handle_kernel_exception
  csrw CSR_TVEC, a0

- /*
- * Set sup0 scratch register to 0, indicating to exception vector that
- * we are presently executing in kernel.
- */
- csrw CSR_SCRATCH, zero
  ret

 .align 2
--
2.43.0


Thanks,
Yunhui

