Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3740436079
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 13:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhJULpK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 07:45:10 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:13964 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhJULpH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 07:45:07 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HZlt60JQCzWlZk;
        Thu, 21 Oct 2021 19:41:02 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 19:42:50 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 19:42:49 +0800
Message-ID: <352c54e1-b164-38d9-43fb-dbc28ab38ac7@huawei.com>
Date:   Thu, 21 Oct 2021 19:42:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/2] riscv: switch to relative exception tables
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
 <20211020220700.04bcdeca@xhacker>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211020220700.04bcdeca@xhacker>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2021/10/20 22:07, Jisheng Zhang wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Similar as other architectures such as arm64, x86 and so on, use
> offsets relative to the exception table entry values rather than
> absolute addresses for both the exception locationand the fixup.
> 
> However, RISCV label difference will actually produce two relocations,
> a pair of R_RISCV_ADD32 and R_RISCV_SUB32. Take below simple code for
> example:
> 
> $ cat test.S
> .section .text
> 1:
>          nop
> .section __ex_table,"a"
>          .balign 4
>          .long (1b - .)
> .previous
> 
> $ riscv64-linux-gnu-gcc -c test.S
> $ riscv64-linux-gnu-readelf -r test.o
> Relocation section '.rela__ex_table' at offset 0x100 contains 2 entries:
>    Offset          Info           Type           Sym. Value    Sym. Name + Addend
> 000000000000  000600000023 R_RISCV_ADD32     0000000000000000 .L1^B1 + 0
> 000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0
> 
> The modpost will complain the R_RISCV_SUB32 relocation, so we need to
> patch modpost.c to skip this relocation for .rela__ex_table section.
> 
> After this patch, the __ex_table section size of defconfig vmlinux is
> reduced from 7072 Bytes to 3536 Bytes.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---



...
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index cb8ab7d91d30..0aa14b5bd124 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1830,6 +1830,27 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
>   	return 0;
>   }
>   
> +#ifndef EM_RISCV
> +#define EM_RISCV		243
> +#endif
> +
> +#ifndef R_RISCV_SUB32
> +#define R_RISCV_SUB32		39
> +#endif
> +
> +static int addend_riscv_rela(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
> +{
> +	unsigned int r_typ = ELF_R_TYPE(r->r_info);
> +	const char *fromsec;
> +
> +	fromsec = sech_name(elf, sechdr);
> +	fromsec += strlen(".rela");
> +
> +	if (!strcmp("__ex_table", fromsec) && r_typ == R_RISCV_SUB32)
> +		return 1;	/* skip this */
> +	return 0;
> +}
> +
>   static void section_rela(const char *modname, struct elf_info *elf,
>   			 Elf_Shdr *sechdr)
>   {
> @@ -1866,6 +1887,12 @@ static void section_rela(const char *modname, struct elf_info *elf,
>   		r_sym = ELF_R_SYM(r.r_info);
>   #endif
>   		r.r_addend = TO_NATIVE(rela->r_addend);
> +		switch (elf->hdr->e_machine) {
> +		case EM_RISCV:
> +			if (addend_riscv_rela(elf, sechdr, &r))
directly use
if (!strcmp("__ex_table", fromsec) && ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)

> +				continue;
> +			break;
> +		}
>   		sym = elf->symtab_start + r_sym;
>   		/* Skip special sections */
>   		if (is_shndx_special(sym->st_shndx))
> diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> index 6ee4fa882919..39e86e4acea3 100644
> --- a/scripts/sorttable.c
> +++ b/scripts/sorttable.c
> @@ -346,6 +346,7 @@ static int do_file(char const *const fname, void *addr)
>   	case EM_PARISC:
>   	case EM_PPC:
>   	case EM_PPC64:
> +	case EM_RISCV:
>   		custom_sort = sort_relative_table;
>   		break;
>   	case EM_ARCOMPACT:
> @@ -353,7 +354,6 @@ static int do_file(char const *const fname, void *addr)
>   	case EM_ARM:
>   	case EM_MICROBLAZE:
>   	case EM_MIPS:
> -	case EM_RISCV:
>   	case EM_XTENSA:
>   		break;
>   	default:
> 
