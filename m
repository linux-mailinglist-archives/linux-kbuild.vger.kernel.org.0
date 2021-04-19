Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326C7363C9D
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 09:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237911AbhDSHeS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 03:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237936AbhDSHeA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 03:34:00 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF6CC06174A;
        Mon, 19 Apr 2021 00:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=FYq2lre5IyLW1kO/gHNuOUrJnwI3hjqEUIqkBhrYSpY=; b=PXyigIIh6ycLkbQ0IpEJgLrpbB
        8qyz5JVhMiLsYbE/bkS65iPMcwHz3CiY1yMJFD3wR3kCqDGv/HlgKhlkhQsZzkbCfyw9HRZCq3kYz
        ACC9H4LQfYlay5YJqs0pEi6VGOSeAwyGfQz23H9WcOE0uuxst6D5C6iko/5rQjKPERVQQ4IJZ3o/w
        RBvXMDc7Gkr1HCQSeGsSXgD5I9hbfmIHD0cJPlCO48I88VnlTcIJQSWawNKrWne0Il+jl1g1HG8gd
        c9rhwYHlqjkl4QDNm4kpESZlSwkZR6/dE4KXP47HZ27FFAT9KwtBHUlj+rq59nXXbdZpxRGTTcQEX
        DR7lIjhw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lYOOQ-00DOH9-IU; Mon, 19 Apr 2021 07:32:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4503F30018E;
        Mon, 19 Apr 2021 09:32:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 28490200D4310; Mon, 19 Apr 2021 09:32:25 +0200 (CEST)
Date:   Mon, 19 Apr 2021 09:32:25 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 04:51:58PM +0200, Paolo Bonzini wrote:
> On 16/04/21 09:09, Peter Zijlstra wrote:
> > Well, the obvious example would be seqlocks. C11 can't do them
> 
> Sure it can.  C11 requires annotating with (the equivalent of) READ_ONCE all
> reads of seqlock-protected fields, but the memory model supports seqlocks
> just fine.

How does that help?

IIRC there's two problems, one on each side the lock. On the write side
we have:

	seq++;
	smp_wmb();
	X = r;
	Y = r;
	smp_wmb();
	seq++;

Which C11 simply cannot do right because it does't have wmb. You end up
having to use seq_cst for the first wmb or make both X and Y (on top of
the last seq) a store-release, both options are sub-optimal.

On the read side you get:

	do {
	  s = seq;
	  smp_rmb();
	  r1 = X;
	  r2 = Y;
	  smp_rmb();
	} while ((s&1) || seq != s);

And then you get into trouble the last barrier, so the first seq load
can be load-acquire, after which the loads of X, Y come after, but you
need then to happen before the second seq load, for which you then need
seq_cst, or make X and Y load-acquire. Again, not optimal.

I have also seen *many* broken variants of it on the web. Some work on
x86 but are totally broken when you build them on LL/SC ARM64.

