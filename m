Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9DC434D3B
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 16:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhJTOQJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 10:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhJTOQJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 10:16:09 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E34AFC06161C;
        Wed, 20 Oct 2021 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
        Content-Transfer-Encoding; bh=32D1ZqTPwbRGNF8Df1ghUeDCmNTweKBE0r
        6UuRi6t18=; b=PS0Uex/smUSWPJvcm/Ifjfc70bPgue65nm8xsmJUF0sAdUYiCg
        Ap78AO83WeumjfNoFS9ec23LA29s0GITuDrGfjRqS0oNxclmsf2u6hOKnnf9BXZ3
        VBtiBO+oLb7zj7mEEJ9OPNH0lRHuKHIk4lYaxRzwyvVuv043MX6T9GPUQ=
Received: from xhacker (unknown [101.86.20.138])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygAHC0saJHBh3IhUAA--.15369S2;
        Wed, 20 Oct 2021 22:13:46 +0800 (CST)
Date:   Wed, 20 Oct 2021 22:07:00 +0800
From:   Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: switch to relative exception tables
Message-ID: <20211020220700.04bcdeca@xhacker>
In-Reply-To: <20211020220529.54ccf4e9@xhacker>
References: <20211020220529.54ccf4e9@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: LkAmygAHC0saJHBh3IhUAA--.15369S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFyfJFy8WF4kAFWfZry3twb_yoWxJrWUpF
        4DCr95KrZ5Crn7W3W3K3yqgF1rJw4F9a45KryxWr15Zw42qrW8tws3t347ZF1DCFW8ZFyF
        9ryIgr1jkw4UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
        6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
        I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
        6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
        0_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
        JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5fhL5UUUUU==
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
 scripts/mod/modpost.c            | 27 +++++++++++++++++++++++++++
 scripts/sorttable.c              |  2 +-
 7 files changed, 58 insertions(+), 7 deletions(-)
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
index cb8ab7d91d30..0aa14b5bd124 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1830,6 +1830,27 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
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
+static int addend_riscv_rela(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
+{
+	unsigned int r_typ = ELF_R_TYPE(r->r_info);
+	const char *fromsec;
+
+	fromsec = sech_name(elf, sechdr);
+	fromsec += strlen(".rela");
+
+	if (!strcmp("__ex_table", fromsec) && r_typ == R_RISCV_SUB32)
+		return 1;	/* skip this */
+	return 0;
+}
+
 static void section_rela(const char *modname, struct elf_info *elf,
 			 Elf_Shdr *sechdr)
 {
@@ -1866,6 +1887,12 @@ static void section_rela(const char *modname, struct elf_info *elf,
 		r_sym = ELF_R_SYM(r.r_info);
 #endif
 		r.r_addend = TO_NATIVE(rela->r_addend);
+		switch (elf->hdr->e_machine) {
+		case EM_RISCV:
+			if (addend_riscv_rela(elf, sechdr, &r))
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


