Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D48B4367B6
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 18:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhJUQ3s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 12:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbhJUQ3p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 12:29:45 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E12D8C061764;
        Thu, 21 Oct 2021 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
        Content-Transfer-Encoding; bh=5SGZL6ZJsdcdBDMEDIg6ZtxyfQLf5sovyU
        i5cLJFmEs=; b=ufsDMxfROrK7zncs84bEP/eh/xV0rHBwPmJNUWzMt0yY39Cm3C
        kB8T0yOMiu68fm8ZP4zK4vRNJZ9Pzp+3SxFI51+lpz54YSnkJmPax8E3uZeWvqGO
        mNYkc/RpSh1bMSh0Cu0l3bPqacQn9+pNdfANn5KXoABPRtdgd4o57TXKo=
Received: from xhacker (unknown [101.86.20.138])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygDn71vnlHFhfqdcAA--.37927S2;
        Fri, 22 Oct 2021 00:27:19 +0800 (CST)
Date:   Fri, 22 Oct 2021 00:20:33 +0800
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
Subject: [PATCH v3 1/2] riscv: consolidate __ex_table construction
Message-ID: <20211022002033.63bab344@xhacker>
In-Reply-To: <20211022001957.1eba8f04@xhacker>
References: <20211022001957.1eba8f04@xhacker>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: LkAmygDn71vnlHFhfqdcAA--.37927S2
X-Coremail-Antispam: 1UD129KBjvJXoWxury3tF4DZw4ktw15CFyUJrb_yoWrXw43pw
        srKrZ7KrW5KF18CFn7tFs7uF4vg3WDGwnIk3sxWryvgr4DA3WvyFsYkas7X3ykJa13ZF1x
        Cw18Krn3Jrs29rUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
        4UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUz_MaUUUUU
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


