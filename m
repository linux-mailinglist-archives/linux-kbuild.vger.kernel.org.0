Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18180434D37
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 16:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhJTOPS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 10:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhJTOPR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 10:15:17 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 962EAC06161C;
        Wed, 20 Oct 2021 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
        Content-Transfer-Encoding; bh=5SGZL6ZJsdcdBDMEDIg6ZtxyfQLf5sovyU
        i5cLJFmEs=; b=JjaYMkjxxA0MFljsOVrxGF6NZQj66o5pbr+ReVzvoAtAD1f7OD
        pcrfstU7gxsngbRWdZYUuDveGE9A04HS4IdwNJdgaZ/G5kIfa67pD59nXflhtJXy
        KuMSKIAFNU4XM282R0IY55D1EY7FRrzQJxw4JFeJ7wf6+6JnzOt9sgI0Q=
Received: from xhacker (unknown [101.86.20.138])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygC3fsznI3Bh5odUAA--.36190S2;
        Wed, 20 Oct 2021 22:12:55 +0800 (CST)
Date:   Wed, 20 Oct 2021 22:06:10 +0800
From:   Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: consolidate __ex_table construction
Message-ID: <20211020220610.25443e4c@xhacker>
In-Reply-To: <20211020220529.54ccf4e9@xhacker>
References: <20211020220529.54ccf4e9@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: LkAmygC3fsznI3Bh5odUAA--.36190S2
X-Coremail-Antispam: 1UD129KBjvJXoWxury3tF4DZw4ktw15CFyUJrb_yoWrXw43pw
        srKrZ7KrW5KF18CFn7tFs7uF4vg3WDGwnIk3sxWryvgr4DA3WvyFsYkas7X3ykJa13ZF1x
        Cw18Krn3Jrs29rUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
        4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
        W8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
        JbIYCTnIWIevJa73UjIFyTuYvjxU7iSdDUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Jisheng Zhang <jszhang@kernel.org>

Consolidate all the __ex_table constuction code with a _ASM_EXTABLE
helper.

There should be no functional change as a result of this patch.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/futex.h   | 12 +++-------
 arch/riscv/include/asm/uaccess.h | 40 +++++++++++---------------------
 2 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 1b00badb9f87..3191574e135c 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -30,10 +30,7 @@
 	"3:	li %[r],%[e]				\n"	\
 	"	jump 2b,%[t]				\n"	\
 	"	.previous				\n"	\
-	"	.section __ex_table,\"a\"		\n"	\
-	"	.balign " RISCV_SZPTR "			\n"	\
-	"	" RISCV_PTR " 1b, 3b			\n"	\
-	"	.previous				\n"	\
+		_ASM_EXTABLE(1b, 3b)				\
 	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
 	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
 	: [op] "Jr" (oparg), [e] "i" (-EFAULT)			\
@@ -103,11 +100,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	"4:	li %[r],%[e]				\n"
 	"	jump 3b,%[t]				\n"
 	"	.previous				\n"
-	"	.section __ex_table,\"a\"		\n"
-	"	.balign " RISCV_SZPTR "			\n"
-	"	" RISCV_PTR " 1b, 4b			\n"
-	"	" RISCV_PTR " 2b, 4b			\n"
-	"	.previous				\n"
+		_ASM_EXTABLE(1b, 4b)			\
+		_ASM_EXTABLE(2b, 4b)			\
 	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
 	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
 	: "memory");
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index f314ff44c48d..35802e72ace8 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -10,6 +10,12 @@
 
 #include <asm/pgtable.h>		/* for TASK_SIZE */
 
+#define _ASM_EXTABLE(from, to)						\
+	"	.pushsection	__ex_table, \"a\"\n"			\
+	"	.balign "	RISCV_SZPTR "	 \n"			\
+	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
+	"	.popsection\n"
+
 /*
  * User space memory access functions
  */
@@ -93,10 +99,7 @@ do {								\
 		"	li %1, 0\n"				\
 		"	jump 2b, %2\n"				\
 		"	.previous\n"				\
-		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 3b\n"			\
-		"	.previous"				\
+			_ASM_EXTABLE(1b, 3b)			\
 		: "+r" (err), "=&r" (__x), "=r" (__tmp)		\
 		: "m" (*(ptr)), "i" (-EFAULT));			\
 	(x) = __x;						\
@@ -125,11 +128,8 @@ do {								\
 		"	li %2, 0\n"				\
 		"	jump 3b, %3\n"				\
 		"	.previous\n"				\
-		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 4b\n"			\
-		"	" RISCV_PTR " 2b, 4b\n"			\
-		"	.previous"				\
+			_ASM_EXTABLE(1b, 4b)			\
+			_ASM_EXTABLE(2b, 4b)			\
 		: "+r" (err), "=&r" (__lo), "=r" (__hi),	\
 			"=r" (__tmp)				\
 		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]),	\
@@ -233,10 +233,7 @@ do {								\
 		"	li %0, %4\n"				\
 		"	jump 2b, %1\n"				\
 		"	.previous\n"				\
-		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 3b\n"			\
-		"	.previous"				\
+			_ASM_EXTABLE(1b, 3b)			\
 		: "+r" (err), "=r" (__tmp), "=m" (*(ptr))	\
 		: "rJ" (__x), "i" (-EFAULT));			\
 } while (0)
@@ -262,11 +259,8 @@ do {								\
 		"	li %0, %6\n"				\
 		"	jump 3b, %1\n"				\
 		"	.previous\n"				\
-		"	.section __ex_table,\"a\"\n"		\
-		"	.balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 4b\n"			\
-		"	" RISCV_PTR " 2b, 4b\n"			\
-		"	.previous"				\
+			_ASM_EXTABLE(1b, 4b)			\
+			_ASM_EXTABLE(2b, 4b)			\
 		: "+r" (err), "=r" (__tmp),			\
 			"=m" (__ptr[__LSW]),			\
 			"=m" (__ptr[__MSW])			\
@@ -417,10 +411,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 		"	li %[err], %[efault]\n"			\
 		"	jump 1b, %[rc]\n"			\
 		".previous\n"					\
-		".section __ex_table,\"a\"\n"			\
-		".balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 2b\n"			\
-		".previous\n"					\
+		_ASM_EXTABLE(1b, 2b)				\
 			: [ret] "=&r" (__ret),			\
 			  [rc]  "=&r" (__rc),			\
 			  [ptr] "+A" (*__ptr),			\
@@ -443,10 +434,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 		"	li %[err], %[efault]\n"			\
 		"	jump 1b, %[rc]\n"			\
 		".previous\n"					\
-		".section __ex_table,\"a\"\n"			\
-		".balign " RISCV_SZPTR "\n"			\
-		"	" RISCV_PTR " 1b, 2b\n"			\
-		".previous\n"					\
+		_ASM_EXTABLE(1b, 2b)				\
 			: [ret] "=&r" (__ret),			\
 			  [rc]  "=&r" (__rc),			\
 			  [ptr] "+A" (*__ptr),			\
-- 
2.33.0


