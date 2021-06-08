Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD7639EB42
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jun 2021 03:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhFHBRs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 21:17:48 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:34301 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230209AbhFHBRr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 21:17:47 -0400
X-UUID: 4623f96bb4ca4325b53853285eb3af65-20210608
X-UUID: 4623f96bb4ca4325b53853285eb3af65-20210608
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1768396892; Tue, 08 Jun 2021 09:15:50 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 09:15:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 09:15:48 +0800
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
Date:   Tue, 8 Jun 2021 09:15:48 +0800
Message-ID: <20210608011548.5008-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YL492/4WrWaNDL4p@hirez.programming.kicks-ass.net>
References: <YL492/4WrWaNDL4p@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Mon, Jun 07, 2021 at 01:44:21PM +0200, Peter Zijlstra wrote:
> > One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
> > SHN_XINDEX, then use .symtab_shndx.
> > 
> > Apparently you've found a case where neither is true? In that case
> > objtool seems to use shndx 0. A matching recordmcount patch would be
> > something like this.
> > 
> 
> Apparently I'm consistently bad at spelling SHM_UNDEF today..

I test the below patch and it work for me.
I only correct the UNDEF typo without any other modification.

Could I push this patch or you will push it?
I guess I have to add your signed-off-by.

> 
> > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > index f9b19524da11..d99cc0aed6fe 100644
> > --- a/scripts/recordmcount.h
> > +++ b/scripts/recordmcount.h
> > @@ -194,13 +194,18 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
> >  	unsigned long offset;
> >  	int index;
> >  
> > -	if (sym->st_shndx != SHN_XINDEX)
> > +	if (sym->st_shndx > SHN_UDEF &&
> > +	    sym->st_shndx < SHN_LORESERVE)
> >  		return w2(sym->st_shndx);
> >  
> > -	offset = (unsigned long)sym - (unsigned long)symtab;
> > -	index = offset / sizeof(*sym);
> > +	if (sym->st_shndx == SHN_XINDEX) {
> > +		offset = (unsigned long)sym - (unsigned long)symtab;
> > +		index = offset / sizeof(*sym);
> >  
> > -	return w(symtab_shndx[index]);
> > +		return w(symtab_shndx[index]);
> > +	}
> > +
> > +	return 0;
> >  }
> >  
> >  static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
