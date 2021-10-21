Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768EF436066
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 13:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhJULlB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 07:41:01 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:13963 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbhJULlA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 07:41:00 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HZlnL63ZLzZcKY;
        Thu, 21 Oct 2021 19:36:54 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 19:38:42 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 19:38:42 +0800
Message-ID: <bd3419a3-b858-1a4d-a081-d09bbc56eaa7@huawei.com>
Date:   Thu, 21 Oct 2021 19:38:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] riscv: consolidate __ex_table construction
Content-Language: en-US
To:     Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
CC:     <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>
References: <20211020220529.54ccf4e9@xhacker>
 <20211020220610.25443e4c@xhacker>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211020220610.25443e4c@xhacker>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2021/10/20 22:06, Jisheng Zhang wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Consolidate all the __ex_table constuction code with a _ASM_EXTABLE
> helper.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/include/asm/futex.h   | 12 +++-------
>   arch/riscv/include/asm/uaccess.h | 40 +++++++++++---------------------
>   2 files changed, 17 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index 1b00badb9f87..3191574e135c 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -30,10 +30,7 @@
>   	"3:	li %[r],%[e]				\n"	\
>   	"	jump 2b,%[t]				\n"	\
>   	"	.previous				\n"	\
> -	"	.section __ex_table,\"a\"		\n"	\
> -	"	.balign " RISCV_SZPTR "			\n"	\
> -	"	" RISCV_PTR " 1b, 3b			\n"	\
> -	"	.previous				\n"	\
> +		_ASM_EXTABLE(1b, 3b)				\
>   	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
>   	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
>   	: [op] "Jr" (oparg), [e] "i" (-EFAULT)			\
> @@ -103,11 +100,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>   	"4:	li %[r],%[e]				\n"
>   	"	jump 3b,%[t]				\n"
>   	"	.previous				\n"
> -	"	.section __ex_table,\"a\"		\n"
> -	"	.balign " RISCV_SZPTR "			\n"
> -	"	" RISCV_PTR " 1b, 4b			\n"
> -	"	" RISCV_PTR " 2b, 4b			\n"
> -	"	.previous				\n"
> +		_ASM_EXTABLE(1b, 4b)			\
> +		_ASM_EXTABLE(2b, 4b)			\
>   	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
>   	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
>   	: "memory");
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index f314ff44c48d..35802e72ace8 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -10,6 +10,12 @@
>   
>   #include <asm/pgtable.h>		/* for TASK_SIZE */
>   
> +#define _ASM_EXTABLE(from, to)						\
> +	"	.pushsection	__ex_table, \"a\"\n"			\
> +	"	.balign "	RISCV_SZPTR "	 \n"			\
> +	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
> +	"	.popsection\n"
> +

The jump_label mechanism could use this macro too,
see arch/riscv/include/asm/jump_label.h, maybe move the above into asm.h
and also do some replace in next patch ?

Question: the jump label use relative address, but why not trigger the 
Section mismatch issue?
