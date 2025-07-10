Return-Path: <linux-kbuild+bounces-7975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB3CB000C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jul 2025 13:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 793421C2210E
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jul 2025 11:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C41248F5E;
	Thu, 10 Jul 2025 11:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WuGEBxxM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D3424729D
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Jul 2025 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148062; cv=none; b=Rm8P7+B7NPise710E7F8hOwc5Tc5krq+FzHaNaDE83oZ22Sf23GTKlIQY5I0ekdonMLz+emuBG2vJ899XxubKMuqy+L2UTDgEbEvKO8es/xnxlbvg1FR2E9xT260OdGgRcAV+7CH1CGsDZtcqhvCkYCxcMnssjjbKridm486cus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148062; c=relaxed/simple;
	bh=g2RoJuXZSV857NxtooyLQq1JF2tbnE4bL6emm2q91cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2xekfA4eyJdlP/GFF/E5Ilu/mJ63weCzNoci4ctuHQqXSfWNe4xFtKoYmWiLmARTDqV1Y63XT5pZqG+HO9OKJNXWgL6p5tgaG0mNrwC2j5eTpJ3fg0AHXG1k1B6zeGEmAWvbj1IVkNzeS0/96D1SvOIKf7ATHtA6h5O8MtMQug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WuGEBxxM; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-610cbca60cdso531510eaf.0
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Jul 2025 04:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752148059; x=1752752859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRJ7N+W5JU0EuTuULowXAGtXu+e/abUVNu+nA6+YkOg=;
        b=WuGEBxxMGLqm+PU2I1zxWijobObpvzmQ74gEMlso0abKd4NI+i+GnTdRpkwW2BwPvD
         yZB4Yd2tGcEkHK4F9zjOaLCWaMWM1FEdHDo4jgHlhh3q+Ing+btgQOJbV0m6zTnOgE9o
         B5686i7vi3gFvH4NBYEm8ixJv/fkx+HZx1nwX9GKvhW+rpV1wqh+J/erkDdjeELseIHH
         nKZmpQkI9LaGHH6q+1c5LNN7LPljUlEFQglqStiEWziORUBZs9RCtaXW9e0DTXFTXTj7
         8/IWMpC6dNfDlAsTSrcrb15w2XBpl41NDaiFzzfYo2sn+gGJowAhf1xBxHy4mAZFF4Fb
         wiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752148059; x=1752752859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRJ7N+W5JU0EuTuULowXAGtXu+e/abUVNu+nA6+YkOg=;
        b=r7ZfT3jsioh9/l1lj5VYgqxHDBftu9kIevqHsXodjf2KbaRC09p3+59Yj/2Oa6+NVP
         ueqwbCB9KNEgsCkZCLBX3Q1u+YjeVt7FJ10rYYa7g7arQDIsKjEkiZ57THrydICH3Huf
         8HeTtliRLMl6Xdlog9FAmHbYbHMjqGIcWeCkJoP3Mrzs2RkfKC5LPseqBDqbvq0AuSLz
         vUNQLeLhRHypf+kyvE8q32rVs3cwHnk+jiem80rBM1euw1GmpR8WRJtjMXzqsQwohasK
         0Uo8p38CHhxcYUeRFNpQkSw+kzNexE2xYOB0CaTrS995AAhuQNZtBG6B/S1tnUMUEpBE
         EgUw==
X-Forwarded-Encrypted: i=1; AJvYcCXzDGsuNPcoHEEWL9WyKAHFajflMrhwDIu1jRFc9Fm3bkV38okesZ+Yfpp1h6c4v4T7BGJmRNpUOZW+9yU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOoLua1JDEANLbsiVEhy6sXmNpftexWz0mOEZDlrYMvXmQc7i
	72Z6mV2uS0TM5wsTXg0fkTKkoVFVddmjiM8sEm8Zgpt18hmESb5/73pbkDDSPoZiw//RD3bGU0V
	oqctMErFgVTDsaMReBP8sln6qX7YvL1QPSlC2V++9xA==
X-Gm-Gg: ASbGncvUpPayNNNxG+Yh1NtWXi/t3IpOiSaSbBTfN4l/sdtOoQTaazy36rGagEtT7Rw
	B0RCcb3bbf/L3lXcKs946pOrY33dmoCPxzT5ZfbEru3ooEGuRNJQYqVC7YYhEqEIXPJUcob7WCt
	glfu1kaUaAH4faXKatxbYE09cjU4PR7HnS3LiyeqlJRd6WWw==
X-Google-Smtp-Source: AGHT+IGkL47B+0utyAnO83uLx6JcDnDsO1PT+QZvP0dfZWDUEj9DS92oh6uIPmw6PeMPCn8E2rQmnD+e+3ahsKoanmI=
X-Received: by 2002:a05:6820:4c12:b0:613:d09e:7531 with SMTP id
 006d021491bc7-613d9de7a84mr1441606eaf.1.1752148059063; Thu, 10 Jul 2025
 04:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com> <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com> <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
 <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com> <CAEEQ3wnaL5X_jXEmbbWFp3jx1Aq=02Gf7kDNBS=wcPyfEq7yBw@mail.gmail.com>
 <DB8607ITP9UR.2LOW61O3OVJ2F@ventanamicro.com>
In-Reply-To: <DB8607ITP9UR.2LOW61O3OVJ2F@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 10 Jul 2025 19:47:27 +0800
X-Gm-Features: Ac12FXw9bF0Hi8EPNeiS01K8ULVFbmrHmgwK8R27PwbH4rDW7ZMa3s2RNd6nfSc
Message-ID: <CAEEQ3wmxJ50PZHVpdexeyy1ELqKw+5mrb+8gRCA4KNj9zsrykA@mail.gmail.com>
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

On Thu, Jul 10, 2025 at 2:35=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcma=
r@ventanamicro.com> wrote:
>
> 2025-07-10T11:45:06+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> > On Wed, Jul 9, 2025 at 10:20=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rk=
rcmar@ventanamicro.com> wrote:
> >> Is the overhead above with this patch?  And when we then use the
> >> CSR_SCRATCH for percpu, does it degrade even further?
> >
> > We can see that the percpu optimization is around 2.5% through the
> > method of fixing registers, and we can consider that the percpu
> > optimization can bring a 2.5% gain. Is there no need to add the percpu
> > optimization logic on the basis of the scratch patch for testing?
> >
> > Reference: https://lists.riscv.org/g/tech-privileged/message/2485
>
> That is when the value is in a GPR, though, and we don't know the
> performance of a CSR_SCRATCH access.
> We can hope that it's not much worse than a GPR, but an implementation
> might choose to be very slow with CSR_SCRATCH.
>
> I have in mind another method where we can use the current CSR_SCRATCH
> without changing CSR_TVAL, but I don't really want to spend time on it
> if reading the CSR doesn't give any benefit.
>
> It would be to store the percpu offset in CSR_SCRATCH permanently, do
> the early exception register shuffling with a percpu area storage, and
> load the thread pointer from there as well.
> That method would also eliminate writing CSR_SCRATCH on every exception
> entry+exit, so maybe it makes sense to try it even if CSRs are slow...
>
> Thanks.


Based on the patch, optimizations for percpu offset have been added,
with the following data:
6.989 7.046 6.976 6.986 7.001 7.017 7.007 7.064 7.008 7.039
Geometric mean: 7.013248303
Compared to reusing the scratch register, the performance has improved
by approximately 0.7%.

If more optimizations can be made to the scratch register, there
should be further performance improvements.

Patch:
---
 arch/riscv/include/asm/percpu.h | 14 ++++++++++++++
 arch/riscv/kernel/asm-offsets.c |  1 +
 arch/riscv/kernel/entry.S       |  7 +++++++
 arch/riscv/kernel/smpboot.c     |  3 +++
 4 files changed, 25 insertions(+)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percp=
u.h
new file mode 100644
index 000000000000..1fbfcb108f84
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,14 @@
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+static inline void set_my_cpu_offset(unsigned long off)
+{
+        csr_write(CSR_SCRATCH, off);
+}
+
+#define __my_cpu_offset csr_read(CSR_SCRATCH)
+
+#include <asm-generic/percpu.h>
+
+#endif
+
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offset=
s.c
index a03129f40c46..0ce96f30bf32 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -35,6 +35,7 @@ void asm_offsets(void)
  OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
  OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
  OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+ OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
  OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
  OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
  OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index cc2fd4cd54a0..82caeee91c15 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -75,6 +75,13 @@ SYM_CODE_START_NOALIGN(handle_exception)
  REG_S s4, PT_CAUSE(sp)
  REG_S s5, PT_TP(sp)

+ REG_L s0, TASK_TI_CPU(tp)
+ slli s0, s0, 3
+ la s1, __per_cpu_offset
+ add s1, s1, s0
+ REG_L s1, 0(s1)
+ csrw CSR_SCRATCH, s1
+
  la s1, handle_kernel_exception
  csrw CSR_TVEC, s1

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index fb6ab7f8bfbd..6fa12cc84523 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -43,6 +43,7 @@ static DECLARE_COMPLETION(cpu_running);

 void __init smp_prepare_boot_cpu(void)
 {
+ set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
 }

 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -240,6 +241,8 @@ asmlinkage __visible void smp_callin(void)
  mmgrab(mm);
  current->active_mm =3D mm;

+ set_my_cpu_offset(per_cpu_offset(curr_cpuid));
+
  store_cpu_topology(curr_cpuid);
  notify_cpu_starting(curr_cpuid);

--
2.43.0

Thanks,
Yunhui

