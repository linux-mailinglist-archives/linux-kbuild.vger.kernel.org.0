Return-Path: <linux-kbuild+bounces-6809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF2AA51A4
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D3B11BA2016
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 16:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8DC2620D1;
	Wed, 30 Apr 2025 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c2nmLJ7J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAE22609D0
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030447; cv=none; b=auElaPGCqJ+LNPA0WbnlZX/5JE2Ygeg+KjuTK3BWxwEUha2582J5go3eunSSzv5sdOGpRR9FF9rXUqQM1grpKQWjVDeoVy1F4mV5HuKMhu+fYEdJwx/7AsP6Zv7P/AOITU//zvZi4yVcXT1clB96IdxyP/c75YOT5g1PxUg8l0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030447; c=relaxed/simple;
	bh=SLuh1vXjFWArp9DGV88WbiawPX5gMpDl3YY+JUPkHDc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JxKNpzUz7g31ixAmCmcOBc+NCB+41gEickKWVHPXRE+Ils38MDjrlF+OWBZMFryBbq1n/sLcKnXT2Erlj0xtTPOgSN9Fm+1V+nJuo2tor3QnzLxhbYq+MrNEkIFWc3RsceMobQMC8Xo5eOPWrNlo/a/xnnwxZ/dEY3wvogoewMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c2nmLJ7J; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so54119555e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030443; x=1746635243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=son2TtAYXWFKHIb+qv3GEJQE2heH3nn7VYU4EbNQqf8=;
        b=c2nmLJ7Jm644UDF1RUPqiucbqQDkKwhkeUzEIF0y0GXgqC5SYDpKxzKKrIBMotk/ml
         wdVhx9A3vqVu8HBNNgoWvavob6SjLtSFU5lHn/lfumi2GDxLHusUQNO+d+RdhNSjev+t
         0O3Wlzlj/dphlcYpSVDzHwXebtWkC38iSHabHjIJTFX7FB/1R7/9g+DXDkVQ/Ym8T3Nv
         m2Ry0fRq0u4gaQl8xyyY9ahiBg+Wz5XlkeoTi0F3izgnv4TtQHbuOFn9PQEmp75QTC8G
         +zXORXLZBHmz6AuWmnFDdyLMcteXhzGRHAwxKFcpphRWu0utU1qZAy70OPXCmBN650ob
         kMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030443; x=1746635243;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=son2TtAYXWFKHIb+qv3GEJQE2heH3nn7VYU4EbNQqf8=;
        b=hq61NwamBQMnl2KjwOdE9qpfkX04XOfencrdipuPbukZKU6DV7RAeJJAVnAiUzhnHF
         WMXNIo34yWAEiiaMyxGUBsHB7QMCrE6ZLvYVl2ic+RdC1Qcx+gqmTQfJaeToxWPS8OjQ
         g+VCE5eLnsTEwlaAnV1t18689omFqVi9p6E2maA68LPAlsA5WEfFft9I6nHNn4blqaBA
         tzPLO7iMZNPQcRXb7EpwF9d0qLGwOWfybegbGh6gzWmXDUp8FTdEID0jR+lq1tePGI8j
         E9MjB9KaMdQnSowPXZK7I5o48SHwEmLnlzjzMlTY6zDFL/mw8MvjZ7tphqWVW3LuepSc
         AKrg==
X-Forwarded-Encrypted: i=1; AJvYcCW2E8suU1arGHyZc2jLzKAsxYi6ndEGjO4kxmCdK1bfJ9oTVv1CdCvZXyo8kcsYQ0Z+OPd7T66Ngl9GTYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPKMX9XrQTLU/Ydnt3Ij+XRT3Do4VWBEIORx3iXuJqxyJV/ni
	IU4eX3GTumpzKp6deJ769v5gCTfLiYj6KvRDJ/XMQjz43hN1TXZHvBT5vsINoN9VbPoqHsiBQiT
	4tR0eoA43eQ==
X-Google-Smtp-Source: AGHT+IFQ2Mdes0eRtKfnxWeLvHYhOcWYODGlYYFwAfRst9gZKnEGAYllVA7JEZatII5sz3zXBjKQtfWJvzFPDQ==
X-Received: from wmqb17.prod.google.com ([2002:a05:600c:4e11:b0:440:5e10:a596])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f0c:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-441b1f31004mr39397195e9.2.1746030443778;
 Wed, 30 Apr 2025 09:27:23 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:07 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-1-smostafa@google.com>
Subject: [PATCH v2 0/4] KVM: arm64: UBSAN at EL2
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Many of the sanitizers the kernel supports are disabled when running
in EL2 with nvhe/hvhe/proctected modes, some of those are easier
(and makes more sense) to integrate than others.
Last year, kCFI support was added in [1]

This patchset adds support for UBSAN in EL2.
UBSAN can run in 2 modes:
  1) =E2=80=9CNormal=E2=80=9D (CONFIG_UBSAN_TRAP=3Dn): In this mode the com=
piler will
  do the UBSAN checks and insert some function calls in case of
  failures, it can provide more information(ex: what is the value of
  the out of bound) about the failures through those function arguments,
  and those functions(implemented in lib/ubsan.c) will print a report with
  such errors.

  2) Trap (CONFIG_UBSAN_TRAP=3Dy): This is a minimal mode, where similarly,
  the compiler will do the checks, but instead of doing function calls,
  it would do a =E2=80=9Cbrk #imm=E2=80=9D (for ARM64) with a unique code w=
ith the failure
  type, but without any extra information (ex: only print the out-bound lin=
e
  but not the index)

For nvhe/hvhe/proctected modes, #2 would be suitable, as there is no way to
print reports from EL2, so similarly to kCFI(even with permissive) it would
cause the hypervisor to panic.

But that means that for EL2 we need to compile the code with the same optio=
ns
as used by =E2=80=9CCONFIG_UBSAN_TRAP=E2=80=9D independently from the kerne=
l config.

This patch series adds a new KCONFIG for ARM64 to choose to enable UBSAN
separately for the modes mentioned.

The same logic decoding the kernel UBSAN is reused, so the messages from
the hypervisor will look similar as:
[   29.215332] kvm [190]: nVHE hyp UBSAN: array index out of bounds at: [<f=
fff8000811f2344>] __kvm_nvhe_handle___pkvm_init_vm+0xa8/0xac!

In this patch set, the same UBSAN options(for check types) are used for bot=
h
EL1/EL2, although a case can be made to have separate options (leading to
totally separate CFLAGS) if we want EL2 to be compiled with stricter checks
for something as protected mode.
However, re-using the current flags, makes code re-use easier for
report_ubsan_failure() and  Makefile.ubsan

[1] https://lore.kernel.org/all/20240610063244.2828978-1-ptosi@google.com/

Changes from v1:
- https://lore.kernel.org/all/20250416180440.231949-1-smostafa@google.com/
- Collected Kees Acked-By
- Rename CFLAGS flag to CFLAGS_UBSAN_TRAP
- Small comment fix

Mostafa Saleh (4):
  arm64: Introduce esr_is_ubsan_brk()
  ubsan: Remove regs from report_ubsan_failure()
  KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
  KVM: arm64: Handle UBSAN faults

 arch/arm64/include/asm/esr.h     | 5 +++++
 arch/arm64/kernel/traps.c        | 4 ++--
 arch/arm64/kvm/handle_exit.c     | 6 ++++++
 arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
 arch/x86/kernel/traps.c          | 2 +-
 include/linux/ubsan.h            | 6 +++---
 lib/Kconfig.ubsan                | 9 +++++++++
 lib/ubsan.c                      | 8 +++++---
 scripts/Makefile.ubsan           | 5 ++++-
 9 files changed, 41 insertions(+), 10 deletions(-)

--=20
2.49.0.967.g6a0df3ecc3-goog


