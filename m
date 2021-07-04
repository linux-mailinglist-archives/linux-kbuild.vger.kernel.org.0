Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839CD3BAF41
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 23:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhGDVwM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 17:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhGDVwM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 17:52:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C662FC061574;
        Sun,  4 Jul 2021 14:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Oaj3U1+AP1QRn36TkCjP5Uikk6j3AKL4RKYoX+nxYkQ=; b=h4pWxTp3WJmDRuv7ij+7jkFeOd
        h8bugRYNxlsZiY52yeHYJD0EH/hkz/8G+pi9FE20Fymmnzf/fMOY6rX14SYmJPw4CMfl211jBm4+y
        s9DSaCqoBW+NB/o6H9Owt/hU90YQ+xiJH/qYFVFj+L1AmfdG2VO1nzHTz3RHLCGR8NEptsSu2GBlG
        4v37WwjsUpz5yw7n5BbZt8NKaHlLmCxpqAFGQKcZdbRVFFrUh5V5UQshSoY/SayO5TSmOK03Arn6q
        UamjCEISRL35gEwz+WoHSfFgnafaQ8loDiestSTvrHhpDfRCxdx1v0U82TxAES/frPgZbVAFJS0MC
        7PSjoCzA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m09zB-009cXO-4j; Sun, 04 Jul 2021 21:49:14 +0000
Date:   Sun, 4 Jul 2021 22:49:09 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte
 lengths)
Message-ID: <YOIs1UiKjlF89sJx@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-2-ojeda@kernel.org>
 <YOIicc94zvSjrKfe@casper.infradead.org>
 <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
 <YOIpM3iFT5roz69i@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOIpM3iFT5roz69i@casper.infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 10:33:39PM +0100, Matthew Wilcox wrote:
> On Sun, Jul 04, 2021 at 11:17:50PM +0200, Miguel Ojeda wrote:
> > On Sun, Jul 4, 2021 at 11:05 PM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > What happened to my suggestion from last time of encoding symbols < 128
> > > as 0-127 and symbols larger than that as (data[0] - 128) * 256 +
> > > data[1]) ?
> > 
> > Nothing, sorry, we focused on other parts (e.g. the allocation panics)
> > during this iteration. I can take a look for v2.
> 
> Here's what I have.  Build testing now.

It seems to work.  Sample output from kallsyms with the test forced to
'true':

        .byte 0x80
        .byte 0x0a, 0x41, 0xff, 0x70, 0xf3, 0xd0, 0xb0, 0xf2, 0xfc, 0x72, 0x74

under normal circumstances, it omits that first line.

I'm unfortunately in the middle of ripping apart and fixing up my test
infrastructure, so I can't claim to have really tested it, and I don't
have a module with a really large symbol anyway.  But I'll submit this
to you as a proper patch with changelog if that's enough testing for you.

(now that i look at kallsyms, why on earth is it ripping the string
apart and turning it into .byte instead of just using .ascii?)

> 
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index c851ca0ed357..0d45a6e5fdc3 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -67,6 +67,14 @@ static unsigned int kallsyms_expand_symbol(unsigned int off,
>  	len = *data;
>  	data++;
>  
> +	/* lengths larger than 128 are encoded as two bytes */
> +	if (len >= 128) {
> +		len -= 128;
> +		len *= 256;
> +		len += *data;
> +		data++;
> +	}
> +
>  	/*
>  	 * Update the offset to return the offset for the next symbol on
>  	 * the compressed stream.
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 54ad86d13784..701566e01a1d 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -467,10 +467,16 @@ static void write_src(void)
>  	output_label("kallsyms_names");
>  	off = 0;
>  	for (i = 0; i < table_cnt; i++) {
> +		int len = table[i]->len;
>  		if ((i & 0xFF) == 0)
>  			markers[i >> 8] = off;
>  
> -		printf("\t.byte 0x%02x", table[i]->len);
> +		if (len >= 128) {
> +			printf("\t.byte 0x%02x\n", len / 256 + 128);
> +			len %= 256;
> +			off++;
> +		}
> +		printf("\t.byte 0x%02x", len);
>  		for (k = 0; k < table[i]->len; k++)
>  			printf(", 0x%02x", table[i]->sym[k]);
>  		printf("\n");
