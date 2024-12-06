Return-Path: <linux-kbuild+bounces-5020-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A8A9E6978
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 09:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193C11881702
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2024 08:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83071E47BA;
	Fri,  6 Dec 2024 08:58:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABBC1DF748;
	Fri,  6 Dec 2024 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475528; cv=none; b=seVapabsx7C+dKoeLbDf/zZyiPWP75LymdwWMBHH8D0Nf8jsxdYqzFcR+zeZamVhItmOuNk04W4I3Dw8Fw+04noSq/ylf7Oif7P6K3CguLNDlPt3wVRrccDKcNcSCnqC+q6LPAhN2NKkAEZcat8LvqkgoYCjQtrDV6c3HFVZsBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475528; c=relaxed/simple;
	bh=wvRNcjpk6KcKYpqUJJN14PBIEPf4G0h/SykSfko027w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWAla9l6WS24oJA/lUTyIJuDW0vg4ueQscH89thV04xMOEEOB2Xa/0cvtFhAtzKLjlxKPVJeiFjez8Do0hOhStJfS4Exyb0AJcfF7+K4rCVim1Xrywcyj2QturfwTStWN+VZlwH0I3MyWcFp/7rWMoQkmszkpWmbF/by9VVNRdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.38])
	by gateway (Coremail) with SMTP id _____8CxieHCvFJn+RRSAA--.31632S3;
	Fri, 06 Dec 2024 16:58:42 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.38])
	by front1 (Coremail) with SMTP id qMiowMAxIMOovFJnxhx4AA--.14616S3;
	Fri, 06 Dec 2024 16:58:38 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	stable@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 6.1&6.6 1/3] kallsyms: Avoid weak references for kallsyms symbols
Date: Fri,  6 Dec 2024 16:58:08 +0800
Message-ID: <20241206085810.112341-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241206085810.112341-1-chenhuacai@loongson.cn>
References: <20241206085810.112341-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxIMOovFJnxhx4AA--.14616S3
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKr1xuF47uF48Jr4kAw1UJwc_yoW7Zry3pr
	Z3K3yUtF4kJr1j9r93Jr4UuFyaqan3GrnxK39rtr18Arn0qryIv39rKr4ruryqkrWkGFWr
	XwnaqFW29a1DArgCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8XTm3UUUUU==

From: Ard Biesheuvel <ardb@kernel.org>

[ Upstream commit 951bcae6c5a0bfaa55b27c5f16178204988f0379 ]

kallsyms is a directory of all the symbols in the vmlinux binary, and so
creating it is somewhat of a chicken-and-egg problem, as its non-zero
size affects the layout of the binary, and therefore the values of the
symbols.

For this reason, the kernel is linked more than once, and the first pass
does not include any kallsyms data at all. For the linker to accept
this, the symbol declarations describing the kallsyms metadata are
emitted as having weak linkage, so they can remain unsatisfied. During
the subsequent passes, the weak references are satisfied by the kallsyms
metadata that was constructed based on information gathered from the
preceding passes.

Weak references lead to somewhat worse codegen, because taking their
address may need to produce NULL (if the reference was unsatisfied), and
this is not usually supported by RIP or PC relative symbol references.

Given that these references are ultimately always satisfied in the final
link, let's drop the weak annotation, and instead, provide fallback
definitions in the linker script that are only emitted if an unsatisfied
reference exists.

While at it, drop the FRV specific annotation that these symbols reside
in .rodata - FRV is long gone.

Tested-by: Nick Desaulniers <ndesaulniers@google.com> # Boot
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lkml.kernel.org/r/20230504174320.3930345-1-ardb%40kernel.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 include/asm-generic/vmlinux.lds.h | 19 +++++++++++++++++++
 kernel/kallsyms.c                 |  6 ------
 kernel/kallsyms_internal.h        | 30 ++++++++++++------------------
 3 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 63029bc7c9dd..64a80059d7fa 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -447,11 +447,30 @@
 #endif
 #endif
 
+/*
+ * Some symbol definitions will not exist yet during the first pass of the
+ * link, but are guaranteed to exist in the final link. Provide preliminary
+ * definitions that will be superseded in the final link to avoid having to
+ * rely on weak external linkage, which requires a GOT when used in position
+ * independent code.
+ */
+#define PRELIMINARY_SYMBOL_DEFINITIONS					\
+	PROVIDE(kallsyms_addresses = .);				\
+	PROVIDE(kallsyms_offsets = .);					\
+	PROVIDE(kallsyms_names = .);					\
+	PROVIDE(kallsyms_num_syms = .);					\
+	PROVIDE(kallsyms_relative_base = .);				\
+	PROVIDE(kallsyms_token_table = .);				\
+	PROVIDE(kallsyms_token_index = .);				\
+	PROVIDE(kallsyms_markers = .);					\
+	PROVIDE(kallsyms_seqs_of_names = .);
+
 /*
  * Read only Data
  */
 #define RO_DATA(align)							\
 	. = ALIGN((align));						\
+	PRELIMINARY_SYMBOL_DEFINITIONS					\
 	.rodata           : AT(ADDR(.rodata) - LOAD_OFFSET) {		\
 		__start_rodata = .;					\
 		*(.rodata) *(.rodata.*)					\
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 18edd57b5fe8..22ea19a36e6e 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -325,12 +325,6 @@ static unsigned long get_symbol_pos(unsigned long addr,
 	unsigned long symbol_start = 0, symbol_end = 0;
 	unsigned long i, low, high, mid;
 
-	/* This kernel should never had been booted. */
-	if (!IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE))
-		BUG_ON(!kallsyms_addresses);
-	else
-		BUG_ON(!kallsyms_offsets);
-
 	/* Do a binary search on the sorted kallsyms_addresses array. */
 	low = 0;
 	high = kallsyms_num_syms;
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 27fabdcc40f5..85480274fc8f 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -5,27 +5,21 @@
 #include <linux/types.h>
 
 /*
- * These will be re-linked against their real values
- * during the second link stage.
+ * These will be re-linked against their real values during the second link
+ * stage. Preliminary values must be provided in the linker script using the
+ * PROVIDE() directive so that the first link stage can complete successfully.
  */
-extern const unsigned long kallsyms_addresses[] __weak;
-extern const int kallsyms_offsets[] __weak;
-extern const u8 kallsyms_names[] __weak;
+extern const unsigned long kallsyms_addresses[];
+extern const int kallsyms_offsets[];
+extern const u8 kallsyms_names[];
 
-/*
- * Tell the compiler that the count isn't in the small data section if the arch
- * has one (eg: FRV).
- */
-extern const unsigned int kallsyms_num_syms
-__section(".rodata") __attribute__((weak));
-
-extern const unsigned long kallsyms_relative_base
-__section(".rodata") __attribute__((weak));
+extern const unsigned int kallsyms_num_syms;
+extern const unsigned long kallsyms_relative_base;
 
-extern const char kallsyms_token_table[] __weak;
-extern const u16 kallsyms_token_index[] __weak;
+extern const char kallsyms_token_table[];
+extern const u16 kallsyms_token_index[];
 
-extern const unsigned int kallsyms_markers[] __weak;
-extern const u8 kallsyms_seqs_of_names[] __weak;
+extern const unsigned int kallsyms_markers[];
+extern const u8 kallsyms_seqs_of_names[];
 
 #endif // LINUX_KALLSYMS_INTERNAL_H_
-- 
2.43.5


