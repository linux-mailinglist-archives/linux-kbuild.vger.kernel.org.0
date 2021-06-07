Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB56B39DDF1
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 15:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhFGNq1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 09:46:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230217AbhFGNq1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 09:46:27 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2EBF61001;
        Mon,  7 Jun 2021 13:44:34 +0000 (UTC)
Date:   Mon, 7 Jun 2021 09:44:33 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Helsley <mhelsley@vmware.com>,
        Sami Tolvanen <samitolvanen@google.com>, yj.chiang@mediatek.com
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Message-ID: <20210607094433.473100d9@oasis.local.home>
In-Reply-To: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
References: <20210607074258.32322-1-mark-pk.tsai@mediatek.com>
        <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
        <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
        <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 7 Jun 2021 13:44:21 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

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
> objtool seems to use shndx 0. A matching recordmcount patch would be
> something like this.

Mark-PK,

Does the below patch fix it for you too (if you backport it to your
kernel). I much rather have recordmcount match objtool, as one day the
two will hopefully merge to one executable.

-- Steve


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

