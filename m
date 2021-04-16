Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7568D362583
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 18:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241085AbhDPQPa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 12:15:30 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51720 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240604AbhDPQPX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 12:15:23 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13GGEiXu010592;
        Fri, 16 Apr 2021 18:14:44 +0200
Date:   Fri, 16 Apr 2021 18:14:44 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210416161444.GA10484@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHmuX1NA5RF7C7XS@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 04:33:51PM +0100, Wedson Almeida Filho wrote:
> On Fri, Apr 16, 2021 at 04:19:07PM +0200, Peter Zijlstra wrote:
> > Does this also not prohibit constructs where modification must be done
> > while holding two locks, but reading can be done while holding either
> > lock?
> 
> I don't believe it does. Remember that we have full control of the abstractions,
> so we can (and will when the need arises) build an abstraction that provides the
> functionality you describe. For the read path, we can have functions that return
> a read-only guard (which is the gateway to the data in Rust) when locking either
> of the locks, or when showing evidence that either lock is already locked (i.e.,
> by temporarily transferring ownership of another guard).

But will this remain syntactically readable/writable by mere humans ?
I mean, I keep extremely bad memories of having tried to write a loop
oconcatenating at most N times a string to another one, where N was a
number provided on the command line, with the compiler shouting at me
all the time until I blindly copy-pasted random pieces of unreadable
code from the net with a horribly complicated syntax that still
resulted in the impossibility for me to check for memory allocation
before failing. So I'm wondering how complicated that can become after
adding all sort of artificial protections on top of this :-/

> Note that this is
> another area where Rust offers advantages: read-only guards (in C, if you take a
> read lock, nothing prevents you from making changes to fields you should only be
> allowed to read);

But I'm happily doing that when I know what I'm doing. What you call a
read lock usually is in fact a shared lock as opposed to an exclusive
lock (generally used for writes). For me it's perfectly valid to perform
atomic writes under a read lock instead of forcing everyone to wait by
taking a write lock. You may for example take a read lock on a structure
to make sure that a field you're accessing in it points to stable memory
that is only modified under the write lock, but the pointer itself is
atomically accessed and swapped under the read lock.

> In fact, this is also an advantage of Rust. It would *force* developers to
> lock/unlock the RCU lock before they can access the protected data.

I'm really afraid by languages which force developers to do this or that.
Many bugs in C come from casts because developers know their use case
better than the compiler's developers, and result in lack of warnings
when the code evolves, leaving pending bugs behind. What is important
in my opinion is to let developers express what they want and report
suspicious constructs, not to force them to dirtily work around rules
that conflict with their use case :-/

Willy
