Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0F025B19F
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Sep 2020 18:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgIBQ1T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Sep 2020 12:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgIBQ0x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Sep 2020 12:26:53 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5006CC061244;
        Wed,  2 Sep 2020 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=dgHYD5IdZK2iAqYuyPO6sBiMoH+Cnrt6mDruNiD/1t8=; b=u9WhohexpIB2hFiCsGMJV1r/Us
        H6gDY7WKYbJIR5x+YqGiGBddBMAgJCL+u7+5KUnHcimEFRon7y/Lq4jSbnuzqZTUXcre6g8flTeSl
        uWEpFjq7LRxc9rETAPkiAtO+kuVxZqkkcHo0fw80DdvdTFYTf7d10t/TJSL+ZGYf0/Km/sng2YuN/
        owe6+7crbwQtsXUs84DJMrgmZsB9TwioXFgZlACZuUcV5pkf2LJuiHvdlOkPzAKqY5lunccKRArTw
        bSZAeD/jXHWd5PiJ+hrO76QDSFEAXFnszEgYH7Wi33mPtUkObgQGU5mNjdsRqD2DVp65GgPWlkrTK
        M3hhl/gQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kDVb0-0006J8-UQ; Wed, 02 Sep 2020 16:26:51 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 950733013E5;
        Wed,  2 Sep 2020 18:26:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 7D03823660041; Wed,  2 Sep 2020 18:26:49 +0200 (CEST)
Date:   Wed, 2 Sep 2020 18:26:49 +0200
From:   peterz@infradead.org
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH -v2] scipts/tags.sh: Add custom sort order
Message-ID: <20200902162649.GL1362448@hirez.programming.kicks-ass.net>
References: <20200805102550.GO2674@hirez.programming.kicks-ass.net>
 <20200806120438.GG35926@hirez.programming.kicks-ass.net>
 <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 12:58:14AM +0900, Masahiro Yamada wrote:

> Sorry for the long delay.
> 
> First, this patch breaks 'make TAGS'
> if 'etags' is a symlink to exuberant ctags.
> 
> 
> masahiro@oscar:~/ref/linux$ etags --version
> Exuberant Ctags 5.9~svn20110310, Copyright (C) 1996-2009 Darren Hiebert
>   Addresses: <dhiebert@users.sourceforge.net>, http://ctags.sourceforge.net
>   Optional compiled features: +wildcards, +regex
> 
> masahiro@oscar:~/ref/linux$ make TAGS
>   GEN     TAGS
> etags: Warning: include/linux/seqlock.h:738: null expansion of name pattern "\2"
> sed: can't read TAGS: No such file or directory
> make: *** [Makefile:1820: TAGS] Error 2
> 
> The reason is the hard-coded ' > tags',
> and easy to fix.

Ah, my bad, I forgot to check.

> But, honestly, I am not super happy about this patch.
> 
> Reason 1
>   In my understanding, sorting by the tag kind only works
>   for ctags. My favorite editor is emacs.
>   (Do not get me wrong. I do not intend emacs vs vi war).
>   So, I rather do 'make TAGS' instead of 'make tags',
>   but this solution would not work for etags because
>   etags has a different format.
>   So, I'd rather want to see a more general solution.

It might be possible that emacs' tags implementation can already do this
natively. Initially I tried to fix this in vim, with a macro, but I
couldn't get access to the 'kind' tag.

> Reason 2
>   We would have more messy code, mixing two files/languages

I could try and write the whole thing in bash I suppose.

> When is it useful to tag structure members?

Often, just not when there is a naming conflict.

> If they are really annoying, why don't we delete them
> instead of moving them to the bottom of the tag file?

Because they're really useful :-)

> I attached an alternative solution,
> and wrote up my thoughts in the log.
> 
> What do you think?

> Exuberant Ctags supports the following kinds of tags:
> 
>   $ ctags --list-kinds=c
>   c  classes
>   d  macro definitions
>   e  enumerators (values inside an enumeration)
>   f  function definitions
>   g  enumeration names
>   l  local variables [off]
>   m  class, struct, and union members
>   n  namespaces
>   p  function prototypes [off]
>   s  structure names
>   t  typedefs
>   u  union names
>   v  variable definitions
>   x  external and forward variable declarations [off]
> 
> This commit excludes 'm', 'v', and 'x'.

So my main beef is with m vs s conflicts (they're pretty prevalent),
removing v is insane, but even removing m is undesired IMO.

> Reviewed-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Very much not I'm afraid. I really do like my tags, it's just that I'd
like to have a set precedence when there's a naming conflict.

My claim is that a structure definition is more interesting than a
member variable, not that member variables are not interesting.

