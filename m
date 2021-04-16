Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF65E361A57
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 09:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234681AbhDPHJf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 03:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234010AbhDPHJe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 03:09:34 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09CDC061574;
        Fri, 16 Apr 2021 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=e1pqz5Awgt1GE6YgZQa4ltuZ9s1zkandzmHzgiCBi6c=; b=OqQfvuTlkemnHt1IBx3a7Ub2j3
        p1CrRqAMQAvdr7/i+JN+Nb88qSLD2PYT/4hwPVy5gTiU1Q6Jdx/HEJxmePQzP0H8QtQqUpSvS4z2y
        JFf1p8ls+CqqYNfX/hBE4qkZR3Y0DW4X8ifWd4VKStRFBKb0SV+5PUUgmiDyQbQwB44WDVdHEp5Lc
        8TtcGmM6aNwtheVEm3v0AsbOMmIpmc9GB1dDfEzvB+DVF5SLO28RtXCtUHGCosfkFQ0bKONxsXczj
        LFW7ubp35dJO3KT22qNhHOtE9yRzkf7JqOMSaoWn4Ov5an4vbPNDHqX1lY7CGA9kP5cyueF9Bke/T
        D9OytkZw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXIb9-0018wR-2d; Fri, 16 Apr 2021 07:09:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0D45630015A;
        Fri, 16 Apr 2021 09:09:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id E7B8A200C8D28; Fri, 16 Apr 2021 09:09:01 +0200 (CEST)
Date:   Fri, 16 Apr 2021 09:09:01 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHj02M3jMSweoP4l@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 03:22:16AM +0100, Wedson Almeida Filho wrote:
> On Thu, Apr 15, 2021 at 08:58:16PM +0200, Peter Zijlstra wrote:
> > On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
> > 
> > > Rust is a systems programming language that brings several key
> > > advantages over C in the context of the Linux kernel:
> > > 
> > >   - No undefined behavior in the safe subset (when unsafe code is
> > >     sound), including memory safety and the absence of data races.
> > 
> > And yet I see not a single mention of the Rust Memory Model and how it
> > aligns (or not) with the LKMM. The C11 memory model for example is a
> > really poor fit for LKMM.
> 
> We don't intend to directly expose C data structures to Rust code (outside the
> kernel crate). Instead, we intend to provide wrappers that expose safe
> interfaces even though the implementation may use unsafe blocks. So we expect
> the vast majority of Rust code to just care about the Rust memory model.
> 
> We admittedly don't have a huge number of wrappers yet, but we do have enough to
> implement most of Binder and so far it's been ok. We do intend to eventually
> cover other classes of drivers that may unveil unforeseen difficulties, we'll
> see.
> 
> If you have concerns that we might have overlooked, we'd be happy to hear about
> them from you (or anyone else).

Well, the obvious example would be seqlocks. C11 can't do them. The not
sharing of data structures would avoid most of that, but will also cost
you in performance.

Simlar thing for RCU; C11 can't optimally do that; it needs to make
rcu_dereference() a load-acquire [something ARM64 has already done in C
because the compiler might be too clever by half when doing LTO :-(].
But it's the compiler needing the acquire semantics, not the computer,
which is just bloody wrong.

And there's more sharp corners to be had. But yes, if you're not
actually sharing anything; and taking the performance hit that comes
with that, you might get away with it.

> > HTML is not a valid documentation format. Heck, markdown itself is
> > barely readable.
> 
> Are you stating [what you perceive as] a fact or just venting? If the former,
> would you mind enlightening us with some evidence?

I've yet to see a program that renders HTML (including all the cruft
often used in docs, which might include SVG graphics and whatnot) sanely
in ASCII. Lynx does not qualify, it's output is atrocious crap.

Yes, lynx lets you read HTML in ASCII, but at the cost of bleeding
eyeballs and missing content.

Nothing beats a sane ASCII document with possibly, where really needed
some ASCII art.

Sadly the whole kernel documentation project is moving away from that as
well, which just means I'm back to working on an undocumented codebase.
This rst crap they adopted is unreadable garbage.

> > It is really *really* hard to read. It has all sorts of weird things,
> > like operators at the beginning after a line break:
> > 
> > 	if (foo
> > 	    || bar)
> > 
> > which is just wrong. And it suffers from CamelCase, which is just about
> > the worst thing ever. Not even the C++ std libs have that (or had, back
> > when I still did knew C++).
> > 
> > I also see:
> > 
> > 	if (foo) {
> > 		...
> > 	}
> > 
> > and
> > 
> > 	if foo {
> > 	}
> > 
> > the latter, ofcourse, being complete rubbish.
> 
> There are advantages to adopting the preferred style of a language (when one
> exists). We, of course, are not required to adopt it but I am of the opinion
> that we should have good reasons to diverge if that's our choice in the end.
> 
> "Not having parentheses around the if-clause expression is complete rubbish"
> doesn't sound like a good reason to me.

Of course it does; my internal lexer keeps screaming syntax error at me;
how am I going to understand code when I can't sanely read it?

The more you make it look like (Kernel) C, the easier it is for us C
people to actually read. My eyes have been reading C for almost 30 years
by now, they have a lexer built in the optical nerve; reading something
that looks vaguely like C but is definitely not C is an utterly painful
experience.

You're asking to join us, not the other way around. I'm fine in a world
without Rust.
