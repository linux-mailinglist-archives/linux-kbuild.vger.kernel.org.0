Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43A039E102
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 17:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbhFGPnU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 11:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbhFGPnJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 11:43:09 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F7CC061766;
        Mon,  7 Jun 2021 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=F13xOnM5F0Ufs2TOCg78ImeKaTi/MppD+Ee/8+ZOVI8=; b=P529/dNw+gMsYw/hfuMVAoBCZp
        ROKU97uFOlzFU6oKNahA9xz/5nFZSMQP5EHsm5/e22V+QmLx57Y4AobtI/h3WFwElZfw/N8ITwxhl
        t5jabZ/6vbWvAvEb3x48iqorZj9Fhvc+D//RL/1vah+pZ8bxlZ43SJrCQKlNNsCl1LMWbaPr6MSzb
        ux5T/zJULURJ5LWCjiB0eZwU4fP3XSK30JwHeOCXT5DJlrB0+2lH8JdXZKRVEYgNyDFoONRWNiGFY
        uJvDzD7E3dSz3VF5dMKzVcP8pg34INJdmmI2uLDRGkPTWUccRVFc0MCDR+5M0FknIUxy5iFDyxoP/
        AVwrnxEA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lqHMK-00FxAA-6M; Mon, 07 Jun 2021 15:40:16 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8A91E3001E3;
        Mon,  7 Jun 2021 17:40:11 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 774F82D6A737A; Mon,  7 Jun 2021 17:40:11 +0200 (CEST)
Date:   Mon, 7 Jun 2021 17:40:11 +0200
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
Message-ID: <YL492/4WrWaNDL4p@hirez.programming.kicks-ass.net>
References: <20210607074258.32322-1-mark-pk.tsai@mediatek.com>
 <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
 <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
 <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL4GlbfMJiuLkRhR@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 07, 2021 at 01:44:21PM +0200, Peter Zijlstra wrote:
> One should only use st_shndx when >SHN_UDEF and <SHN_LORESERVE. When
> SHN_XINDEX, then use .symtab_shndx.
> 
> Apparently you've found a case where neither is true? In that case
> objtool seems to use shndx 0. A matching recordmcount patch would be
> something like this.
> 

Apparently I'm consistently bad at spelling SHM_UNDEF today..

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
