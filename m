Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5F43626F6
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 19:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243167AbhDPRh4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 13:37:56 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51729 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242995AbhDPRhz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 13:37:55 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13GHbHGh010904;
        Fri, 16 Apr 2021 19:37:17 +0200
Date:   Fri, 16 Apr 2021 19:37:17 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210416173717.GA10846@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Miguel,

On Fri, Apr 16, 2021 at 07:10:17PM +0200, Miguel Ojeda wrote:
> And by having the compiler enforce this safe-unsafe split, you can
> review safe code without having to constantly worry about UB; and be
> extra alert when dealing with `unsafe` blocks.

I do appreciate this safe/unsafe split and a few other things I've seen
in the language. The equivalent I'm using in C is stronger typing and
"const" modifiers wherever possible. Of course it's much more limited,
it's just to explain that I do value this. I just feel like "unsafe"
is the universal response to any question "how would I do this" while
at the same time "safe" is the best selling argument for the language.
As such, I strongly doubt about the real benefits once facing reality
with everything marked unsafe. Except that it will be easier to blame
the person having written the unsafe one-liner instead of writing 60
cryptic lines doing the functional equivalent using some lesser known
extensions :-/

> Of course, UB is only a subset of errors, but it is a major one, and
> particularly critical for privileged code.

Not in my experience. I do create bugs that very seldomly stem from UB,
like any of us probably. But the vast majority of my bugs are caused by
stupid logic errors. When you invert an error check somewhere because
the function name looks like a boolean but its result works the other
way around, you can pass 10 times over it without noticing, and the
compiler will not help. And these ones are due to the human brain not
being that powerful in front of a computer, and whatever language will
not change this. Or worse, if it's harder to express what I want, I
will write more bugs. It happened to me quite a few times already
trying to work around absurd gcc warnings.

Based on the comments in this thread and the responses often being
around "we'll try to get this done" or "we'll bring the issue to the
compiler team", combined with the difficulty to keep control over
resources usage, I'm really not convinced at all it's suited for
low-level development. I understand the interest of the experiment
to help the language evolve into that direction, but I fear that
the kernel will soon be as bloated and insecure as a browser, and
that's really not to please me.

Cheers,
Willy
