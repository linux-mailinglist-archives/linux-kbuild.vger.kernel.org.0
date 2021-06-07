Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D351B39DD7C
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 15:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhFGNUs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 09:20:48 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59335 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230227AbhFGNUr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 09:20:47 -0400
X-UUID: d3af28efdb4e4da797687b36306ea06b-20210607
X-UUID: d3af28efdb4e4da797687b36306ea06b-20210607
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1502342600; Mon, 07 Jun 2021 21:18:53 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 21:18:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Jun 2021 21:18:45 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     <peterz@infradead.org>
CC:     <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-toolchains@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
        <matthias.bgg@gmail.com>, <mhelsley@vmware.com>,
        <rostedt@goodmis.org>, <samitolvanen@google.com>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Date:   Mon, 7 Jun 2021 21:18:45 +0800
Message-ID: <20210607131845.3118-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
References: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Mon, Jun 07, 2021 at 11:50:40AM +0200, Ard Biesheuvel wrote:
> > On Mon, 7 Jun 2021 at 10:06, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > >
> > > > > On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > >
> > > > > > > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > > > >
> > > > > > > > Avoid using ABS symbol, which won't be relocate, as reference.
> > > > > > > >
> > > > > > > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > > > > > > >
> > > > > > > > Section Headers:
> > > > > > > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > > > > > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > > > > > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > > > > > > >
> > > > > > >
> > > > > > > A RELA section's r_info field points to the section to which it
> > > > > > > applies. This is why in the example above section #65522 points to
> > > > > > > section #65521. This has nothing to do with the numerical value of
> > > > > > > SHN_ABS.
> > > > > >
> > > > > > If the r_info of RELA section is 65521(0xfff1),
> > > >
> > > > Oh sorry, I mean sh_info here.
> > > >
> > > > > > find_secsym_ndx() will use it to find the base symbol.
> > > > > >
> > > > >
> > > > > But what does that have to do with the sh_info field of the RELA
> > > > > section's Elf_Shdr struct? IOW, what is the relevance of section
> > > > > #65521 here?
> > > > >
> > > >
> > > > So what I mean is the problem occur if the sh_info of a RELA section
> > > > is #65521.
> > >
> > > Actually the problem occur if the sh_info of a RELA section is in
> > > the special section index range(SHN_LORESERVE ~ SHN_HIRESERVE).
> > > Maybe I should add a is_shndx_special() to check this like
> > > scripts/mod/modpost.h did?
> > >
> >
> > So if I understand all of this correctly, we are running into a
> > fundamental issue here, where the linker emits more sections than the
> > sh_info field can describe, overflowing into the reserved range.
> >
> > I don't think papering over it like this is going to be maintainable
> > going forward.
>
> There's an extended section header index section for just that. And
> recordmcount actually seems to use that as well.
>
> I can't seem to find enough of the thread to figure out what the actual
> problem is though. The lore archive doesn't have anything prior to this
> message.
>
> One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
> SHN_XINDEX, then use .symtab_shndx.
>
> Apparently you've found a case where neither is true? In that case

Yes, that's what my mean.
get_symindex returns st_shndx directly even if st_shndx is in the reserve range.
So either do not use get_symindex for those symbols or do extra handling
for it like the patch you provide will solve the problem.

> objtool seems to use shndx 0. A matching recordmcount patch would be
> something like this.
>
>
> diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> index f9b19524da11..d99cc0aed6fe 100644
> --- a/scripts/recordmcount.h
> +++ b/scripts/recordmcount.h
> @@ -194,13 +194,18 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
>  	unsigned long offset;
>  	int index;
>
> -	if (sym->st_shndx != SHN_XINDEX)
> +	if (sym->st_shndx > SHN_UDEF &&
> +	    sym->st_shndx < SHN_LORESERVE)
>  		return w2(sym->st_shndx);
>
> -	offset = (unsigned long)sym - (unsigned long)symtab;
> -	index = offset / sizeof(*sym);
> +	if (sym->st_shndx == SHN_XINDEX) {
> +		offset = (unsigned long)sym - (unsigned long)symtab;
> +		index = offset / sizeof(*sym);
>
> -	return w(symtab_shndx[index]);
> +		return w(symtab_shndx[index]);
> +	}
> +
> +	return 0;
>  }
>
>  static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)

Thanks for the suggestion.
Skip all the symbols in the special sections seems fine because
those sections should not be processed here.
