Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0DF39E57E
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 19:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhFGRdf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 13:33:35 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59119 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230313AbhFGRdf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 13:33:35 -0400
X-UUID: a43f5ae8677e46038e81b1f0862970a9-20210608
X-UUID: a43f5ae8677e46038e81b1f0862970a9-20210608
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1385272531; Tue, 08 Jun 2021 01:31:39 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 01:31:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 01:31:38 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     <rostedt@goodmis.org>
CC:     <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-toolchains@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
        <matthias.bgg@gmail.com>, <mhelsley@vmware.com>,
        <peterz@infradead.org>, <samitolvanen@google.com>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Date:   Tue, 8 Jun 2021 01:31:38 +0800
Message-ID: <20210607173138.3882-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210607094433.473100d9@oasis.local.home>
References: <20210607094433.473100d9@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Mon, 7 Jun 2021 13:44:21 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > There's an extended section header index section for just that. And
> > recordmcount actually seems to use that as well.
> > 
> > I can't seem to find enough of the thread to figure out what the actual
> > problem is though. The lore archive doesn't have anything prior to this
> > message.
> > 
> > One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
> > SHN_XINDEX, then use .symtab_shndx.
> > 
> > Apparently you've found a case where neither is true? In that case
> > objtool seems to use shndx 0. A matching recordmcount patch would be
> > something like this.

Hi Peter,

Should I resend the below patch as v2?

> 
> Mark-PK,
> 
> Does the below patch fix it for you too (if you backport it to your
> kernel). I much rather have recordmcount match objtool, as one day the
> two will hopefully merge to one executable.
> 
> -- Steve
> 

Yes, this patch fix it.

> 
> > 
> > 
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
