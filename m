Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D916362FAC
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 13:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236172AbhDQLrd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 07:47:33 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51820 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236058AbhDQLrc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 07:47:32 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13HBkNMJ015171;
        Sat, 17 Apr 2021 13:46:23 +0200
Date:   Sat, 17 Apr 2021 13:46:23 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210417114623.GA15120@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <YHnG+GRwiMqgHGs5@hirez.programming.kicks-ass.net>
 <20210416180829.GO2531743@casper.infradead.org>
 <YHrDwdQwEk2mSQWa@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHrDwdQwEk2mSQWa@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 01:17:21PM +0200, Peter Zijlstra wrote:
> Well, I think the rules actually make sense, at the point in the syntax
> tree where + happens, we have 'unsigned char' and 'int', so at that
> point we promote to 'int'. Subsequently 'int' gets shifted and bad
> things happen.

That's always the problem caused by signedness being applied to the
type while modern machines do not care about that and use it during
(or even after) the operation instead :-/

We'd need to define some macros to zero-extend and sign-extend some
values to avoid such issues. I'm sure this would be more intuitive
than trying to guess how many casts (and in what order) to place to
make sure an operation works as desired.

> The 'unsigned long' doesn't happen until quite a bit later.
> 
> Anyway, the rules are imo fairly clear and logical, but yes they can be
> annoying. The really silly thing here is that << and >> have UB at all,
> and I would love a -fwrapv style flag that simply defines it. Yes it
> will generate worse code in some cases, but having the UB there is just
> stupid.

I'd also love to have a UB-less mode with well defined semantics for
plenty of operations that are known to work well on modern machines,
like integer wrapping, bit shifts ignoring higher bits etc. Lots of
stuff we often have to write useless code for, just to please the
compiler.

> That of course doesn't help your case here, it would simply misbehave
> and not be UB.
> 
> Another thing the C rules cannot really express is a 32x32->64
> multiplication, some (older) versions of GCC can be tricked into it, but
> mostly it just doesn't want to do that sanely and the C rules are
> absolutely no help there.

For me the old trick of casting one side as long long still works:

  unsigned long long mul3264(unsigned int a, unsigned int b)
  {
        return (unsigned long long)a * b;
  }

i386:
  00000000 <mul3264>:
     0: 8b 44 24 08           mov    0x8(%esp),%eax
     4: f7 64 24 04           mull   0x4(%esp)
     8: c3                    ret    

x86_64:
  0000000000000000 <mul3264>:
     0: 89 f8                 mov    %edi,%eax
     2: 89 f7                 mov    %esi,%edi
     4: 48 0f af c7           imul   %rdi,%rax
     8: c3                    retq   

Or maybe you had something else in mind ?

Willy
