Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9824366C1
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 17:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhJUPwm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 11:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbhJUPwl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 11:52:41 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 80E12C061764;
        Thu, 21 Oct 2021 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
        Content-Transfer-Encoding; bh=5agHmgvPXIK4c+R4qVXquLol+JiWe/ZLqv
        XqU2yB9eo=; b=Lsg37fOWLKPo/JHHShakcO/ZbqaMWI5Km3DNLRP2r7S0AyaJJZ
        +m9knEblBQj+KXMGem4N0UjCUsx7yqcQsPNibXFd3R2t2HaAr4TPPLp7FYhCCttJ
        nYFLYl7QY9nDbRrjmDQvZPyuOpovdTB7NIZdzBfWtfZvsZoOnr2UHn/dE=
Received: from xhacker (unknown [101.86.20.138])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygDX3r4ujHFh6X1cAA--.8955S2;
        Thu, 21 Oct 2021 23:50:07 +0800 (CST)
Date:   Thu, 21 Oct 2021 23:43:16 +0800
From:   Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] riscv: consolidate __ex_table construction
Message-ID: <20211021234316.75a19359@xhacker>
In-Reply-To: <bd3419a3-b858-1a4d-a081-d09bbc56eaa7@huawei.com>
References: <20211020220529.54ccf4e9@xhacker>
        <20211020220610.25443e4c@xhacker>
        <bd3419a3-b858-1a4d-a081-d09bbc56eaa7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: LkAmygDX3r4ujHFh6X1cAA--.8955S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1fGr48Kw1UCryDKr13XFb_yoW5GFyfpF
        sIkwnakFZ8CryxG3ZrKFnF9F1Utw45GwnxKr95W340yr4jyF10kF1kK34kua4kJayrZFyx
        KryF9wn8ur47ZwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8rcTPUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 21 Oct 2021 19:38:41 +0800
Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> On 2021/10/20 22:06, Jisheng Zhang wrote:
> > From: Jisheng Zhang <jszhang@kernel.org>
> > 
> > Consolidate all the __ex_table constuction code with a _ASM_EXTABLE
> > helper.
> > 
> > There should be no functional change as a result of this patch.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/include/asm/futex.h   | 12 +++-------
> >   arch/riscv/include/asm/uaccess.h | 40 +++++++++++---------------------
> >   2 files changed, 17 insertions(+), 35 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> > index 1b00badb9f87..3191574e135c 100644
> > --- a/arch/riscv/include/asm/futex.h
> > +++ b/arch/riscv/include/asm/futex.h
> > @@ -30,10 +30,7 @@
> >   	"3:	li %[r],%[e]				\n"	\
> >   	"	jump 2b,%[t]				\n"	\
> >   	"	.previous				\n"	\
> > -	"	.section __ex_table,\"a\"		\n"	\
> > -	"	.balign " RISCV_SZPTR "			\n"	\
> > -	"	" RISCV_PTR " 1b, 3b			\n"	\
> > -	"	.previous				\n"	\
> > +		_ASM_EXTABLE(1b, 3b)				\
> >   	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
> >   	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
> >   	: [op] "Jr" (oparg), [e] "i" (-EFAULT)			\
> > @@ -103,11 +100,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
> >   	"4:	li %[r],%[e]				\n"
> >   	"	jump 3b,%[t]				\n"
> >   	"	.previous				\n"
> > -	"	.section __ex_table,\"a\"		\n"
> > -	"	.balign " RISCV_SZPTR "			\n"
> > -	"	" RISCV_PTR " 1b, 4b			\n"
> > -	"	" RISCV_PTR " 2b, 4b			\n"
> > -	"	.previous				\n"
> > +		_ASM_EXTABLE(1b, 4b)			\
> > +		_ASM_EXTABLE(2b, 4b)			\
> >   	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
> >   	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
> >   	: "memory");
> > diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> > index f314ff44c48d..35802e72ace8 100644
> > --- a/arch/riscv/include/asm/uaccess.h
> > +++ b/arch/riscv/include/asm/uaccess.h
> > @@ -10,6 +10,12 @@
> >   
> >   #include <asm/pgtable.h>		/* for TASK_SIZE */
> >   
> > +#define _ASM_EXTABLE(from, to)						\
> > +	"	.pushsection	__ex_table, \"a\"\n"			\
> > +	"	.balign "	RISCV_SZPTR "	 \n"			\
> > +	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
> > +	"	.popsection\n"
> > +  
> 
> The jump_label mechanism could use this macro too,
> see arch/riscv/include/asm/jump_label.h, maybe move the above into asm.h
> and also do some replace in next patch ?

jump_label entry is a bit different with ex_table: two relative offsets and
a key which should be "long" type.

> 
> Question: the jump label use relative address, but why not trigger the 
> Section mismatch issue?

FWICT, modpost doesn't check __jump_table section


