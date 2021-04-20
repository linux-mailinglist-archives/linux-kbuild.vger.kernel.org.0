Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9561636511A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Apr 2021 05:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhDTDtB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 23:49:01 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51894 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhDTDtA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 23:49:00 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13K3lniw030310;
        Tue, 20 Apr 2021 05:47:49 +0200
Date:   Tue, 20 Apr 2021 05:47:49 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210420034749.GA28662@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <20210416173717.GA10846@1wt.eu>
 <CAKwvOd=RadTs7Skv6KUBo4qZQtdi0kugTzxvZM+5X_2gstjyaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=RadTs7Skv6KUBo4qZQtdi0kugTzxvZM+5X_2gstjyaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick,

On Mon, Apr 19, 2021 at 05:24:33PM -0700, Nick Desaulniers wrote:
> I don't think the introduction of Rust made Firefox _more_ insecure.
> https://wiki.mozilla.org/Oxidation#Within_Firefox

Browsers are human interfaces and do not fundamentally require low
level access to memory/hardware/whatever. They can be written in
about any language, only the resource usage and performance will
make a difference. As such, some were even written in Java or JS
for example.

Operating systems, and particularly drivers *do* require low-level
accesses, and stuff that can hardly be abstracted or understood by
a compiler. You may have to perform two 16-bit reads/writes on a
32-bit MMIO address to perform an operation and the compiler does
not have to know it, just to obey.

> Really, a key point is that a lot of common mistakes in C are compile
> time errors in Rust. I know no "true" kernel dev would make such
> mistakes in C,

Everyone makes mistakes, the level of attention varies over time and
the focus often changes when dealing with build errors. How many time
some of us facing a bug remembered having changed the code very late
after a build error, and being less careful from this point when the
goal changed from "let's do it right" to "let's get this to build" ?

> but is there nothing we can do to help our peers
> writing drivers?  The point is to transfer cost from runtime to
> compile time to avoid costs at runtime; like all of the memory safety
> bugs which are costing our industry.

And do we have stats on the number of logical bugs, some of which are
caused by developers trying to work around compilers' stubbornness ?
For me, personally speaking, they have *increased* over time, usually
trying to avoid some annoying modern gcc warnings, resulting in integer
casts being placed close to string formats, or returns being placed in
switch/case to avoid the fall-through warning, etc. Thus I'm worried that
a non-negligible part of the 70% of bugs caused by memory safety issues
could be replaced with logic bugs to get to the point where the rust
compiler finally accepts to compile the code. It makes me think about
researchers trying to reduce the causes of certain deaths and claiming
to "save lives" while in the end the people they "save" will simply die
from something else.

And I'm not particularly trying to blindly defend C here. I'm complaining
every single day about some of its shortcomings like the vast amount of
UB, stupid type promotion, counter-intuitive operators precedence when
combining bit-ops with arithmetic, limited size of enums, lack of rotate
operator, strict aliasing, or the recourse to asm() statements every 10
lines to do stuff that can hardly be expressed in a way understandable
by a compiler. I'm just seeing that a lot of the griefs I'm having
against C come from the compiler trying to be too smart or too stubborn,
so giving even more of the handle to a compiler doesn't appeal me at all.

In addition, we all know how painful it is to work around compiler bugs
by writing complex code that carefully avoids certain constructs. I'm
wondering if we'll still have that luxury with a stricter compiler, or
if the only response will have to be between "let's disable this driver
that does not compile" or "please force distros to upgrade their
compilers".

But we'll see :-/

Regards,
Willy
