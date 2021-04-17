Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2835F362F75
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 13:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236009AbhDQLSM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 07:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhDQLSM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 07:18:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056EDC061574;
        Sat, 17 Apr 2021 04:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=NjKxWGj3vPhTJLRefNHSHvLhmRXXbBek4jvZ7L/aBIM=; b=jqkwPDnE8+sG8eUx7PRNgg8rhz
        b6dupqkk+RqZeuiA91FqbIQcbYQ345pr+za4cJpL/aCuNpjWmbRdiOYbpIW5r3KEsZHFxjMC1SPNy
        bZdOJWUnh2VWDo+XEt3Y1xG1NO9J1/NWXGwUyhiHh66ONil25O6jRS8vG8HNmQLG8aYxv1aGK+KbP
        HDIIafJl9gZk8rfEXONbHGSbl5EaqG/7oXDhOizCQJaORXmatyEzsE/UnjUjrP5pTgh8Ak5Y+nF32
        j9uNaQ1bN9vNmjivvClNf09WAcmTdblfefLg5mXYi9fqtvcf94JyKutvzJnQXIoYL9KEgiCtc66Ug
        mFxS/0jA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXix2-00BBeq-Fg; Sat, 17 Apr 2021 11:17:27 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3B140300212;
        Sat, 17 Apr 2021 13:17:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 77A972023C200; Sat, 17 Apr 2021 13:17:21 +0200 (CEST)
Date:   Sat, 17 Apr 2021 13:17:21 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Willy Tarreau <w@1wt.eu>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHrDwdQwEk2mSQWa@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <YHnG+GRwiMqgHGs5@hirez.programming.kicks-ass.net>
 <20210416180829.GO2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416180829.GO2531743@casper.infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 07:08:29PM +0100, Matthew Wilcox wrote:
> On Fri, Apr 16, 2021 at 07:18:48PM +0200, Peter Zijlstra wrote:
> > On Fri, Apr 16, 2021 at 07:10:17PM +0200, Miguel Ojeda wrote:
> > 
> > > Of course, UB is only a subset of errors, but it is a major one, and
> > > particularly critical for privileged code.
> > 
> > I've seen relatively few UBSAN warnings that weren't due to UBSAN being
> > broken.
> 
> Lucky you.
> 
> 84c34df158cf215b0cd1475ab3b8e6f212f81f23
> 
> (i'd argue this is C being broken; promoting only as far as int, when
> assigning to an unsigned long is Bad, but until/unless either GCC fixes
> that or the language committee realises that being stuck in the 1970s
> is Bad, people are going to keep making this kind of mistake)

Well, I think the rules actually make sense, at the point in the syntax
tree where + happens, we have 'unsigned char' and 'int', so at that
point we promote to 'int'. Subsequently 'int' gets shifted and bad
things happen.

The 'unsigned long' doesn't happen until quite a bit later.

Anyway, the rules are imo fairly clear and logical, but yes they can be
annoying. The really silly thing here is that << and >> have UB at all,
and I would love a -fwrapv style flag that simply defines it. Yes it
will generate worse code in some cases, but having the UB there is just
stupid.

That of course doesn't help your case here, it would simply misbehave
and not be UB.

Another thing the C rules cannot really express is a 32x32->64
multiplication, some (older) versions of GCC can be tricked into it, but
mostly it just doesn't want to do that sanely and the C rules are
absolutely no help there.
