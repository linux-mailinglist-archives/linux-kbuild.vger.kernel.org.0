Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F1F4366DC
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 17:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhJUP5c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Oct 2021 11:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhJUP5b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Oct 2021 11:57:31 -0400
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9FE25C061764;
        Thu, 21 Oct 2021 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
        Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
        Content-Transfer-Encoding; bh=nuk5wXVWvlScj8F5cNPxIBfqcFgRzo61uL
        st2AhOA9s=; b=ti8/dSwsWZPp5MGojDCDoNAbRjvSB5msWSpS7fteEpfK7agBTp
        A9M4OwUUxT/c7093nJy6NBNn5FbvMNqjtiaWkrrxp5537xwtuRSTG9zQzZvOxwrp
        saoqhf6HBB94kqdw/Ni9rOg3ldNOiDxt7ygvRdia08mY60RuDcJQPfMk8=
Received: from xhacker (unknown [101.86.20.138])
        by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygD3+UkijXFh+oJcAA--.16862S2;
        Thu, 21 Oct 2021 23:54:10 +0800 (CST)
Date:   Thu, 21 Oct 2021 23:47:24 +0800
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
Subject: Re: [PATCH v2 2/2] riscv: switch to relative exception tables
Message-ID: <20211021234724.5a2ccc6f@xhacker>
In-Reply-To: <352c54e1-b164-38d9-43fb-dbc28ab38ac7@huawei.com>
References: <20211020220529.54ccf4e9@xhacker>
        <20211020220700.04bcdeca@xhacker>
        <352c54e1-b164-38d9-43fb-dbc28ab38ac7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: LkAmygD3+UkijXFh+oJcAA--.16862S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1xJryUtr1rtr4UJF1UWrg_yoW5Kw45pF
        WUJayjkFWrAr1UWanFgw4DGF18tw40ka1rWryFqa1UAasxXF93Wan7trya93WkGr18A34Y
        9rWaqryvyw4Yy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
        4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85GYPUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 21 Oct 2021 19:42:48 +0800
Kefeng Wang <wangkefeng.wang@huawei.com> wrote:

> On 2021/10/20 22:07, Jisheng Zhang wrote:
> > From: Jisheng Zhang <jszhang@kernel.org>
> > 
> > Similar as other architectures such as arm64, x86 and so on, use
> > offsets relative to the exception table entry values rather than
> > absolute addresses for both the exception locationand the fixup.
> > 
> > However, RISCV label difference will actually produce two relocations,
> > a pair of R_RISCV_ADD32 and R_RISCV_SUB32. Take below simple code for
> > example:
> > 
> > $ cat test.S
> > .section .text
> > 1:
> >          nop
> > .section __ex_table,"a"
> >          .balign 4
> >          .long (1b - .)
> > .previous
> > 
> > $ riscv64-linux-gnu-gcc -c test.S
> > $ riscv64-linux-gnu-readelf -r test.o
> > Relocation section '.rela__ex_table' at offset 0x100 contains 2 entries:
> >    Offset          Info           Type           Sym. Value    Sym. Name + Addend
> > 000000000000  000600000023 R_RISCV_ADD32     0000000000000000 .L1^B1 + 0
> > 000000000000  000500000027 R_RISCV_SUB32     0000000000000000 .L0  + 0
> > 
> > The modpost will complain the R_RISCV_SUB32 relocation, so we need to
> > patch modpost.c to skip this relocation for .rela__ex_table section.
> > 
> > After this patch, the __ex_table section size of defconfig vmlinux is
> > reduced from 7072 Bytes to 3536 Bytes.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---  
> 
> 
> 
> ...
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index cb8ab7d91d30..0aa14b5bd124 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1830,6 +1830,27 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
> >   	return 0;
> >   }
> >   
> > +#ifndef EM_RISCV
> > +#define EM_RISCV		243
> > +#endif
> > +
> > +#ifndef R_RISCV_SUB32
> > +#define R_RISCV_SUB32		39
> > +#endif
> > +
> > +static int addend_riscv_rela(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
> > +{
> > +	unsigned int r_typ = ELF_R_TYPE(r->r_info);
> > +	const char *fromsec;
> > +
> > +	fromsec = sech_name(elf, sechdr);
> > +	fromsec += strlen(".rela");
> > +
> > +	if (!strcmp("__ex_table", fromsec) && r_typ == R_RISCV_SUB32)
> > +		return 1;	/* skip this */
> > +	return 0;
> > +}
> > +
> >   static void section_rela(const char *modname, struct elf_info *elf,
> >   			 Elf_Shdr *sechdr)
> >   {
> > @@ -1866,6 +1887,12 @@ static void section_rela(const char *modname, struct elf_info *elf,
> >   		r_sym = ELF_R_SYM(r.r_info);
> >   #endif
> >   		r.r_addend = TO_NATIVE(rela->r_addend);
> > +		switch (elf->hdr->e_machine) {
> > +		case EM_RISCV:
> > +			if (addend_riscv_rela(elf, sechdr, &r))  
> directly use
> if (!strcmp("__ex_table", fromsec) && ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)

My local initial patch is as direct as this LoC;) then later I thought we may
need do something more in future. But now I think we can do code
refactoring then. Will send patch v3 soon.

Thanks

> 
> > +				continue;
> > +			break;
> > +		}
> >   		sym = elf->symtab_start + r_sym;
> >   		/* Skip special sections */
> >   		if (is_shndx_special(sym->st_shndx))
> > diff --git a/scripts/sorttable.c b/scripts/sorttable.c
> > index 6ee4fa882919..39e86e4acea3 100644
> > --- a/scripts/sorttable.c
> > +++ b/scripts/sorttable.c
> > @@ -346,6 +346,7 @@ static int do_file(char const *const fname, void *addr)
> >   	case EM_PARISC:
> >   	case EM_PPC:
> >   	case EM_PPC64:
> > +	case EM_RISCV:
> >   		custom_sort = sort_relative_table;
> >   		break;
> >   	case EM_ARCOMPACT:
> > @@ -353,7 +354,6 @@ static int do_file(char const *const fname, void *addr)
> >   	case EM_ARM:
> >   	case EM_MICROBLAZE:
> >   	case EM_MIPS:
> > -	case EM_RISCV:
> >   	case EM_XTENSA:
> >   		break;
> >   	default:
> >   


