Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 131974367B9
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 18:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhJUQaN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 12:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhJUQaM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 12:30:12 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A32CBC0613B9;
        Thu, 21 Oct 2021 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
        Content-Transfer-Encoding; bh=/9jslR2DRzw3DujTauSCZDG73kEOz/pfxh
        mAiRWr0cA=; b=oGwQalPZIvW6JAG5bdFGxgdqsHZiEU+5eUO7rOpsjGcK24zwCM
        A2kMk7W/VpHFbDjzYJt6IGjvcVDxHu/4DBmVf1HyUaI5bokOgETgTwFwapaA5Re2
        PZEXOIJ1ZSN3so23NlgEkcNwJs+1/q/ev1USZVTCRpgrE1RIPbiwelQgg=
Received: from xhacker (unknown [101.86.20.138])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygDHjswDlXFh2qdcAA--.24669S2;
        Fri, 22 Oct 2021 00:27:47 +0800 (CST)
Date:   Fri, 22 Oct 2021 00:21:01 +0800
From:   Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>
Subject: [PATCH v3 2/2] riscv: switch to relative exception tables
Message-ID: <20211022002101.397caa90@xhacker>
In-Reply-To: <20211022001957.1eba8f04@xhacker>
References: <20211022001957.1eba8f04@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: LkAmygDHjswDlXFh2qdcAA--.24669S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFyfJFy8WF4kAFWfZry3twb_yoW7uFWUpF
        4DCr95KrZ5Cr97Wa4ak3yqgF1rGanY9a45Kry8Wr1UZ3y2vrW8tws3t347uF1DAa18ZFyF
        9rySgr1jkw4UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
        xwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
        0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07beeHgUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Jisheng Zhang <jszhang@kernel.org>

Similar as other architectures such as arm64, x86 and so on, use
offsets relative to the exception table entry values rather than
absolute addresses for both the exception locationand the fixup.

However, RISCV label difference will actually produce two relocations,
a pair of R_RISCV_ADD32 and R_RISCV_SUB32. Take below simple code for
example:

$ cat test.S
.section .text
1:
        nop
.section __ex_table,"a"
        .balign 4
        .long (1b - .)
.previous

$ riscv64-linux-gnu-gcc -c test.S
$ riscv64-linux-gnu-readelf -r test.o
Relocation section '.rela__ex_table' at offset 0x100 contains 2 entries:
  Offset          Info           Type           Sym. Value    Sym. Name + Addend
000000000000  000600000023 R_RISCV_ADD32     0000000000000000 .L1^B1 + 0
000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0

The modpost will complain the R_RISCV_SUB32 relocation, so we need to
patch modpost.c to skip this relocation for .rela__ex_table section.

After this patch, the __ex_table section size of defconfig vmlinux is
reduced from 7072 Bytes to 3536 Bytes.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/Kbuild    |  1 -
 arch/riscv/include/asm/extable.h | 25 +++++++++++++++++++++++++
 arch/riscv/include/asm/uaccess.h |  4 ++--
 arch/riscv/lib/uaccess.S         |  4 ++--
 arch/riscv/mm/extable.c          |  2 +-
 scripts/mod/modpost.c            | 15 +++++++++++++++
 scripts/sorttable.c              |  2 +-
 7 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/include/asm/extable.h

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 445ccc97305a..57b86fd9916c 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 generic-y += early_ioremap.h
-generic-y += extable.h
 generic-y += flat.h
 generic-y += kvm_para.h
 generic-y += user.h
diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
new file mode 100644
index 000000000000..bc439b0fdb29
--- /dev/null
+++ b/arch/riscv/include/asm/extable.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_EXTABLE_H
+#define _ASM_RISCV_EXTABLE_H
+
+/*
+ * The exception table consists of pairs of relative offsets: the first
+ * is the relative offset to an instruction that is allowed to fault,
+ * and the second is the relative offset at which the program should
+ * continue. No registers are modified, so it is entirely up to the
+ * continuation code to figure out what to do.
+ *
+ * All the routines below use bits of fixup code that are out of line
+ * with the main instruction path.  This means when everything is well,
+ * we don't even have to jump over them.  Further, they do not intrude
+ * on our cache or tlb entries.
+ */
+
+struct exception_table_entry {
+	int insn, fixup;
+};
+
+#define ARCH_HAS_RELATIVE_EXTABLE
+
+extern int fixup_exception(struct pt_regs *regs);
+#endif
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 35802e72ace8..540903c7d3e8 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -12,8 +12,8 @@
 
 #define _ASM_EXTABLE(from, to)						\
 	"	.pushsection	__ex_table, \"a\"\n"			\
-	"	.balign "	RISCV_SZPTR "	 \n"			\
-	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
+	"	.balign		4\n"					\
+	"	.long		(" #from " - .), (" #to " - .)\n"	\
 	"	.popsection\n"
 
 /*
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 63bc691cff91..55f80f84e23f 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -7,8 +7,8 @@
 100:
 	\op \reg, \addr
 	.section __ex_table,"a"
-	.balign RISCV_SZPTR
-	RISCV_PTR 100b, \lbl
+	.balign 4
+	.long (100b - .), (\lbl - .)
 	.previous
 	.endm
 
diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index 2fc729422151..6aa8ffac4be7 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -17,7 +17,7 @@ int fixup_exception(struct pt_regs *regs)
 
 	fixup = search_exception_tables(regs->epc);
 	if (fixup) {
-		regs->epc = fixup->fixup;
+		regs->epc = (unsigned long)&fixup->fixup + fixup->fixup;
 		return 1;
 	}
 	return 0;
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index cb8ab7d91d30..6bfa33217914 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1830,6 +1830,14 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
 	return 0;
 }
 
+#ifndef EM_RISCV
+#define EM_RISCV		243
+#endif
+
+#ifndef R_RISCV_SUB32
+#define R_RISCV_SUB32		39
+#endif
+
 static void section_rela(const char *modname, struct elf_info *elf,
 			 Elf_Shdr *sechdr)
 {
@@ -1866,6 +1874,13 @@ static void section_rela(const char *modname, struct elf_info *elf,
 		r_sym = ELF_R_SYM(r.r_info);
 #endif
 		r.r_addend = TO_NATIVE(rela->r_addend);
+		switch (elf->hdr->e_machine) {
+		case EM_RISCV:
+			if (!strcmp("__ex_table", fromsec) &&
+			    ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)
+				continue;
+			break;
+		}
 		sym = elf->symtab_start + r_sym;
 		/* Skip special sections */
 		if (is_shndx_special(sym->st_shndx))
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 6ee4fa882919..39e86e4acea3 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -346,6 +346,7 @@ static int do_file(char const *const fname, void *addr)
 	case EM_PARISC:
 	case EM_PPC:
 	case EM_PPC64:
+	case EM_RISCV:
 		custom_sort = sort_relative_table;
 		break;
 	case EM_ARCOMPACT:
@@ -353,7 +354,6 @@ static int do_file(char const *const fname, void *addr)
 	case EM_ARM:
 	case EM_MICROBLAZE:
 	case EM_MIPS:
-	case EM_RISCV:
 	case EM_XTENSA:
 		break;
 	default:
-- 
2.33.0


