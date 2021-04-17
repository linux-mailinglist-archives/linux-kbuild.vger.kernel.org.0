Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E12363093
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 16:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236187AbhDQOWH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 10:22:07 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51826 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233008AbhDQOWH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 10:22:07 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13HELRIX015741;
        Sat, 17 Apr 2021 16:21:27 +0200
Date:   Sat, 17 Apr 2021 16:21:27 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210417142126.GA15678@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <YHroRuI7lYDABWJR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHroRuI7lYDABWJR@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 02:53:10PM +0100, Wedson Almeida Filho wrote:
> > > Note that this is
> > > another area where Rust offers advantages: read-only guards (in C, if you take a
> > > read lock, nothing prevents you from making changes to fields you should only be
> > > allowed to read);
> > 
> > But I'm happily doing that when I know what I'm doing. What you call a
> > read lock usually is in fact a shared lock as opposed to an exclusive
> > lock (generally used for writes). For me it's perfectly valid to perform
> > atomic writes under a read lock instead of forcing everyone to wait by
> > taking a write lock. You may for example take a read lock on a structure
> > to make sure that a field you're accessing in it points to stable memory
> > that is only modified under the write lock, but the pointer itself is
> > atomically accessed and swapped under the read lock.
> 
> Yes, this is a great example. Also easily expressible in Rust: they have this
> concept of interior mutability where certain types allow their contents to be
> modified even when shared immutably. Atomics offer such interior mutability, so
> the scenario you describe is fine.
> 
> Rust in fact has an extra enforcement here that C doesn't: it requires interior
> mutability for this scenario to be allowed, so you can't do it with a plain
> naked type (say u64) -- you'd need to use something like an atomic64_t, where
> you're required to specify memory ordering when accessing them.
> 
> In C we of course have atomics but the compiler never alerts us for when we need
> them.

OK thanks for explaining.

> > > In fact, this is also an advantage of Rust. It would *force* developers to
> > > lock/unlock the RCU lock before they can access the protected data.
> > 
> > I'm really afraid by languages which force developers to do this or that.
> 
> When I say that Rust forces developers to do certain things, it's to provide the
> compile-time safety guarantees. Some of these requirements are imposed by our
> own abstractions -- we can always revisit and try to improve them. In cases when
> the abstractions cannot be further refined, developers always have the escape
> hatch of unsafety, where they're allowed to do pretty much everything as in C,
> but then they also give up the compile-time guarantees for those parts.

Well, I can't express how much I hate abstractions because I constantly
need to know what it's doing under the hood, and I spend my time reading
the output asm code because I always want to confirm my assumptions about
the compiler not cheating on me (and not hitting one of its bugs),
especially after C compilers have become so smart that they completely
replace your code with what they think is better for you, (including
nothing), so I guess all of this is really not for someone like me.

However while I'm pretty sure that based on our respective experiences
we'd probably disagree forever on a wide number of approaches when it
comes to deciding whether the developer or the compiler should have the
last say, I sincerely appreciate that you take the time to calmly explain
your differing views and the rationale behind, so many thanks for this!

Willy
