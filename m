Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0158839DBAF
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 13:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhFGLqa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 07:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhFGLq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 07:46:29 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 469CAC061766;
        Mon,  7 Jun 2021 04:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gYCYJldAbA8a06vrFGZoYfiU547SeEAFQmvggPR/Cg8=; b=AZAhLHO36Df0PZ1FreU05zRE6I
        35ZDAPhr4sctYJzIC4j/cXB9wNqpvxrdrU8M3F4Ym515IQRyq86YMCVWbh8HbqoEk1OmcssdyfQz3
        oJko1p/ZhnJi6d4me2Um3nLZ9rZwHMy4s2FfTpqJhE6Mjk3MOsMJPfXmRhLceJAbM6ahrIhzPwM1p
        KkeKvW8X4HH3QPBawquRsprt8hqzaPQ5IfbB0YUZADmn401Ug2ewnnCyc3c3+LAf6UydEA7QusaQG
        gJNNDRYI7SmQbQ2IikJ+2RfJFGAftaGvPUcGgkBe1J8hiSZ2+wzkIupSlA4bh/bMZRlsCnpgpni5O
        wWbdiByg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqDg0-004NVZ-TA; Mon, 07 Jun 2021 11:44:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1349D300223;
        Mon,  7 Jun 2021 13:44:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 013882CF3852A; Mon,  7 Jun 2021 13:44:21 +0200 (CEST)
Date:   Mon, 7 Jun 2021 13:44:21 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Helsley <mhelsley@vmware.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Sami Tolvanen <samitolvanen@google.com>, yj.chiang@mediatek.com
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Message-ID: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
References: <20210607074258.32322-1-mark-pk.tsai@mediatek.com>
 <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
 <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 07, 2021 at 11:50:40AM +0200, Ard Biesheuvel wrote:
> On Mon, 7 Jun 2021 at 10:06, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> >
> > > > On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > >
> > > > > > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > > >
> > > > > > > Avoid using ABS symbol, which won't be relocate, as reference.
> > > > > > >
> > > > > > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > > > > > >
> > > > > > > Section Headers:
> > > > > > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > > > > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > > > > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > > > > > >
> > > > > >
> > > > > > A RELA section's r_info field points to the section to which it
> > > > > > applies. This is why in the example above section #65522 points to
> > > > > > section #65521. This has nothing to do with the numerical value of
> > > > > > SHN_ABS.
> > > > >
> > > > > If the r_info of RELA section is 65521(0xfff1),
> > >
> > > Oh sorry, I mean sh_info here.
> > >
> > > > > find_secsym_ndx() will use it to find the base symbol.
> > > > >
> > > >
> > > > But what does that have to do with the sh_info field of the RELA
> > > > section's Elf_Shdr struct? IOW, what is the relevance of section
> > > > #65521 here?
> > > >
> > >
> > > So what I mean is the problem occur if the sh_info of a RELA section
> > > is #65521.
> >
> > Actually the problem occur if the sh_info of a RELA section is in
> > the special section index range(SHN_LORESERVE ~ SHN_HIRESERVE).
> > Maybe I should add a is_shndx_special() to check this like
> > scripts/mod/modpost.h did?
> >
> 
> So if I understand all of this correctly, we are running into a
> fundamental issue here, where the linker emits more sections than the
> sh_info field can describe, overflowing into the reserved range.
> 
> I don't think papering over it like this is going to be maintainable
> going forward.

There's an extended section header index section for just that. And
recordmcount actually seems to use that as well.

I can't seem to find enough of the thread to figure out what the actual
problem is though. The lore archive doesn't have anything prior to this
message.

One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
SHN_XINDEX, then use .symtab_shndx.

Apparently you've found a case where neither is true? In that case
objtool seems to use shndx 0. A matching recordmcount patch would be
something like this.


diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
index f9b19524da11..d99cc0aed6fe 100644
--- a/scripts/recordmcount.h
+++ b/scripts/recordmcount.h
@@ -194,13 +194,18 @@ static unsigned int get_symindex(Elf_Sym const *sym, Elf32_Word const *symtab,
 	unsigned long offset;
 	int index;
 
-	if (sym->st_shndx != SHN_XINDEX)
+	if (sym->st_shndx > SHN_UDEF &&
+	    sym->st_shndx < SHN_LORESERVE)
 		return w2(sym->st_shndx);
 
-	offset = (unsigned long)sym - (unsigned long)symtab;
-	index = offset / sizeof(*sym);
+	if (sym->st_shndx == SHN_XINDEX) {
+		offset = (unsigned long)sym - (unsigned long)symtab;
+		index = offset / sizeof(*sym);
 
-	return w(symtab_shndx[index]);
+		return w(symtab_shndx[index]);
+	}
+
+	return 0;
 }
 
 static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
