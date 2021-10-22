Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9637E436EF5
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 02:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbhJVAqF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 20:46:05 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:14839 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhJVAqF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 20:46:05 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hb57Y1s98z90MM;
        Fri, 22 Oct 2021 08:38:49 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 22 Oct 2021 08:43:46 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 22 Oct 2021 08:43:46 +0800
Message-ID: <fac75ae1-185d-073a-8990-1dccd1c64518@huawei.com>
Date:   Fri, 22 Oct 2021 08:43:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] riscv: consolidate __ex_table construction
Content-Language: en-US
To:     Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
CC:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "Nick Desaulniers" <ndesaulniers@google.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>
References: <20211020220529.54ccf4e9@xhacker>
 <20211020220610.25443e4c@xhacker>
 <bd3419a3-b858-1a4d-a081-d09bbc56eaa7@huawei.com>
 <20211021234316.75a19359@xhacker>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211021234316.75a19359@xhacker>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2021/10/21 23:43, Jisheng Zhang wrote:
> On Thu, 21 Oct 2021 19:38:41 +0800
> Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> 
>> On 2021/10/20 22:06, Jisheng Zhang wrote:
>>> From: Jisheng Zhang <jszhang@kernel.org>
>>>
>>> Consolidate all the __ex_table constuction code with a _ASM_EXTABLE
>>> helper.
>>>
>>> There should be no functional change as a result of this patch.
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>    arch/riscv/include/asm/futex.h   | 12 +++-------
>>>    arch/riscv/include/asm/uaccess.h | 40 +++++++++++---------------------
>>>    2 files changed, 17 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
>>> index 1b00badb9f87..3191574e135c 100644
>>> --- a/arch/riscv/include/asm/futex.h
>>> +++ b/arch/riscv/include/asm/futex.h
>>> @@ -30,10 +30,7 @@
>>>    	"3:	li %[r],%[e]				\n"	\
>>>    	"	jump 2b,%[t]				\n"	\
>>>    	"	.previous				\n"	\
>>> -	"	.section __ex_table,\"a\"		\n"	\
>>> -	"	.balign " RISCV_SZPTR "			\n"	\
>>> -	"	" RISCV_PTR " 1b, 3b			\n"	\
>>> -	"	.previous				\n"	\
>>> +		_ASM_EXTABLE(1b, 3b)				\
>>>    	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
>>>    	  [u] "+m" (*uaddr), [t] "=&r" (tmp)			\
>>>    	: [op] "Jr" (oparg), [e] "i" (-EFAULT)			\
>>> @@ -103,11 +100,8 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>>>    	"4:	li %[r],%[e]				\n"
>>>    	"	jump 3b,%[t]				\n"
>>>    	"	.previous				\n"
>>> -	"	.section __ex_table,\"a\"		\n"
>>> -	"	.balign " RISCV_SZPTR "			\n"
>>> -	"	" RISCV_PTR " 1b, 4b			\n"
>>> -	"	" RISCV_PTR " 2b, 4b			\n"
>>> -	"	.previous				\n"
>>> +		_ASM_EXTABLE(1b, 4b)			\
>>> +		_ASM_EXTABLE(2b, 4b)			\
>>>    	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
>>>    	: [ov] "Jr" (oldval), [nv] "Jr" (newval), [e] "i" (-EFAULT)
>>>    	: "memory");
>>> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>>> index f314ff44c48d..35802e72ace8 100644
>>> --- a/arch/riscv/include/asm/uaccess.h
>>> +++ b/arch/riscv/include/asm/uaccess.h
>>> @@ -10,6 +10,12 @@
>>>    
>>>    #include <asm/pgtable.h>		/* for TASK_SIZE */
>>>    
>>> +#define _ASM_EXTABLE(from, to)						\
>>> +	"	.pushsection	__ex_table, \"a\"\n"			\
>>> +	"	.balign "	RISCV_SZPTR "	 \n"			\
>>> +	"	" RISCV_PTR	"(" #from "), (" #to ")\n"		\
>>> +	"	.popsection\n"
>>> +
>>
>> The jump_label mechanism could use this macro too,
>> see arch/riscv/include/asm/jump_label.h, maybe move the above into asm.h
>> and also do some replace in next patch ?
> 
> jump_label entry is a bit different with ex_table: two relative offsets and
> a key which should be "long" type.
> 
>>
>> Question: the jump label use relative address, but why not trigger the
>> Section mismatch issue?
> 
> FWICT, modpost doesn't check __jump_table section

OK, missing that.
> 
> 
> .
> 
