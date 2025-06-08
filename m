Return-Path: <linux-kbuild+bounces-7394-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A7AD128F
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 16:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26EE8188B538
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 14:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D04E1FC0EA;
	Sun,  8 Jun 2025 14:15:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBE4BA3D;
	Sun,  8 Jun 2025 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749392139; cv=none; b=imZJ41GW39Fyzu6O24udwJ96v1gOYDn4cMpnitDkEdf63uPgyZOZhs34pQ9PFbgf0BHgdp5MP0cFidgbQfVVh/tnVShkCI30bdZl790LY2tuZrMR6OelazhFB9sEHJItEVjOBnXDD2uCP0Jm0PQJ7piGJdXlN/0/xoD3K0lo6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749392139; c=relaxed/simple;
	bh=2B2F4SmN1Wp2kS7kwfEunZrwEvooVefZYD54jf2i9hc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVTWE8m2gkduZ44qhoYggP/F0VUGvzDjifPhydskqgWyVzaWmUgexLjFwJZwxgBMG1meQiaM96KtbM4lyuHtI4jRo53GzIpY9vWoaIJOSVD5TDKCJeYCOkmxCLZaU6rz+ZAFHr+dJDV4DHUZtUJrxM5Uy9MNaV0FnwlYtOdbj8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8Bx7eL+mkVocHIQAQ--.7691S3;
	Sun, 08 Jun 2025 22:15:26 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMBxrMb3mkVoU70QAQ--.3812S2;
	Sun, 08 Jun 2025 22:15:24 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Fix build warnings about export.h
Date: Sun,  8 Jun 2025 22:15:09 +0800
Message-ID: <20250608141509.157300-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxrMb3mkVoU70QAQ--.3812S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xw4UZrW7Cw1fAw17Kr1Utwc_yoW3Gry3pF
	WDCF4kJr4rCF1DJ34qv3ZIvr1DXayDWw12qa42yFy8ur42qr1kXws5ZrnFqF1Utw4qgrW0
	gF95Grs0gF4UXabCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
check unnecessary #include <linux/export.h> when W=1"), we get some build
warnings with W=1:

arch/loongarch/kernel/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/kernel/alternative.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/kernel/kfpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/kernel/traps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/kernel/unwind_guess.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/kernel/unwind_orc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/kernel/unwind_prologue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/lib/crc32-loongarch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/lib/csum.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
arch/loongarch/kernel/elf.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
arch/loongarch/kernel/paravirt.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
arch/loongarch/pci/pci.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

So fix these build warnings for LoongArch.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/acpi.c            | 1 +
 arch/loongarch/kernel/alternative.c     | 1 +
 arch/loongarch/kernel/elf.c             | 1 -
 arch/loongarch/kernel/kfpu.c            | 1 +
 arch/loongarch/kernel/paravirt.c        | 1 -
 arch/loongarch/kernel/traps.c           | 1 +
 arch/loongarch/kernel/unwind_guess.c    | 1 +
 arch/loongarch/kernel/unwind_orc.c      | 3 ++-
 arch/loongarch/kernel/unwind_prologue.c | 1 +
 arch/loongarch/lib/crc32-loongarch.c    | 1 +
 arch/loongarch/lib/csum.c               | 1 +
 arch/loongarch/pci/pci.c                | 1 -
 12 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index a54cd6fd3796..1367ca759468 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/acpi.h>
 #include <linux/efi-bgrt.h>
+#include <linux/export.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/memblock.h>
diff --git a/arch/loongarch/kernel/alternative.c b/arch/loongarch/kernel/alternative.c
index 4ad13847e962..0e0c766df1e3 100644
--- a/arch/loongarch/kernel/alternative.c
+++ b/arch/loongarch/kernel/alternative.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <asm/alternative.h>
diff --git a/arch/loongarch/kernel/elf.c b/arch/loongarch/kernel/elf.c
index 0fa81ced28dc..3d98c6aa00db 100644
--- a/arch/loongarch/kernel/elf.c
+++ b/arch/loongarch/kernel/elf.c
@@ -6,7 +6,6 @@
 
 #include <linux/binfmts.h>
 #include <linux/elf.h>
-#include <linux/export.h>
 #include <linux/sched.h>
 
 #include <asm/cpu-features.h>
diff --git a/arch/loongarch/kernel/kfpu.c b/arch/loongarch/kernel/kfpu.c
index 4c476904227f..141b49bd989c 100644
--- a/arch/loongarch/kernel/kfpu.c
+++ b/arch/loongarch/kernel/kfpu.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cpu.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <asm/fpu.h>
 #include <asm/smp.h>
diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
index e5a39bbad078..b1b51f920b23 100644
--- a/arch/loongarch/kernel/paravirt.c
+++ b/arch/loongarch/kernel/paravirt.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/export.h>
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/irq_work.h>
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 47fc2de6d150..3d9be6ca7ec5 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/module.h>
+#include <linux/export.h>
 #include <linux/extable.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
diff --git a/arch/loongarch/kernel/unwind_guess.c b/arch/loongarch/kernel/unwind_guess.c
index 98379b7d4147..33d5f33b374e 100644
--- a/arch/loongarch/kernel/unwind_guess.c
+++ b/arch/loongarch/kernel/unwind_guess.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2022 Loongson Technology Corporation Limited
  */
 #include <asm/unwind.h>
+#include <linux/export.h>
 
 unsigned long unwind_get_return_address(struct unwind_state *state)
 {
diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index d623935a7547..0005be49b056 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#include <linux/objtool.h>
+#include <linux/export.h>
 #include <linux/module.h>
+#include <linux/objtool.h>
 #include <linux/sort.h>
 #include <asm/exception.h>
 #include <asm/orc_header.h>
diff --git a/arch/loongarch/kernel/unwind_prologue.c b/arch/loongarch/kernel/unwind_prologue.c
index 929ae240280a..729e775bd40d 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2022 Loongson Technology Corporation Limited
  */
 #include <linux/cpumask.h>
+#include <linux/export.h>
 #include <linux/ftrace.h>
 #include <linux/kallsyms.h>
 
diff --git a/arch/loongarch/lib/crc32-loongarch.c b/arch/loongarch/lib/crc32-loongarch.c
index b37cd8537b45..db22c2ec55e2 100644
--- a/arch/loongarch/lib/crc32-loongarch.c
+++ b/arch/loongarch/lib/crc32-loongarch.c
@@ -11,6 +11,7 @@
 
 #include <asm/cpu-features.h>
 #include <linux/crc32.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
 
diff --git a/arch/loongarch/lib/csum.c b/arch/loongarch/lib/csum.c
index df309ae4045d..bcc9d01d8c41 100644
--- a/arch/loongarch/lib/csum.c
+++ b/arch/loongarch/lib/csum.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2019-2020 Arm Ltd.
 
 #include <linux/compiler.h>
+#include <linux/export.h>
 #include <linux/kasan-checks.h>
 #include <linux/kernel.h>
 
diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
index 2726639150bc..5bc9627a6cf9 100644
--- a/arch/loongarch/pci/pci.c
+++ b/arch/loongarch/pci/pci.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
  */
 #include <linux/kernel.h>
-#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/acpi.h>
 #include <linux/types.h>
-- 
2.47.1


