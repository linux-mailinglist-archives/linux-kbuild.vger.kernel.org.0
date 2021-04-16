Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB09F361D58
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 12:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241786AbhDPJas (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 05:30:48 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51712 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229706AbhDPJar (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 05:30:47 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13G9TiNs009046;
        Fri, 16 Apr 2021 11:29:44 +0200
Date:   Fri, 16 Apr 2021 11:29:44 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Michal Kubecek <mkubecek@suse.cz>
Cc:     linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210416092944.GB8790@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <20210416081605.3m4apyornouf5p5s@lion.mk-sys.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416081605.3m4apyornouf5p5s@lion.mk-sys.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 10:16:05AM +0200, Michal Kubecek wrote:
> And I don't see how the two languages might coexist peacefully without
> rust toolchain being necessary for building any kernel useful in
> practice and anyone seriously involved in kernel development having to
> be proficient in both languages.

Two languages ? No, one is specified and multiple-implemented, the other
one is the defined as what its only compiler understands at the moment,
so it's not a language, it's a compiler's reference manual at best. I'm
waiting for the day you're force to write things which look wrong with a
big comment around saying "it's not a bug it's a workaround for a bug in
the unique compiler, waiting to be retrofitted into the spec to solve the
problem for every user". Already seen for at least another "language"
implemented by a single vendor 22 years ago.

> Neither of these looks appealing to me.
> 
> The dependency on rust toolchain was exactly what made me give up on
> building Firefox from mercurial snapshots few years ago. To be able to
> build them, one needed bleeding edge snapshots of rust toolchain which
> my distribution couldn't possibly provide and building them myself
> required way too much effort. This very discussion already revealed that
> rust kernel code would provide similar experience. I also have my doubts
> about the "optional" part; once there are some interesting drivers
> written in rust, even if only in the form of out of tree modules, there
> will be an enormous pressure on distributions, both community and
> enterprise, to enable rust support.

Yes this scarily looks like the usual "embrace and extend... and abandon
the corpse once it doesn't move anymore".

I've already faced situations where I couldn't compile a recent 5.x kernel
using my previous gcc-4.7 compiler and this really really really pissed me
off because I'd had it in a build farm for many architectures and I had to
give up. But I also know that updating to a newer version will take time,
will be durable and will be worth it for the long term (except for the fact
that gcc doubles the build time every two versions). But here having to use
*the* compiler of the day and being prepared to keep a collection of them
to work with different stable kernels, no!

Also, I'm a bit worried about long-term survival of the new
language-of-the-day-that-makes-you-look-cool-at-beer-events. I was once
told perl would replace C everywhere. Does someone use it outside of
checkpatch.pl anymore ? Then I was told that C was dead because PHP was
appearing everywhere. I've even seen (slow) log processors written with
it. Now PHP seems to only be a WAF-selling argument. Then Ruby was "safe"
and would rule them all. Safe as its tab[-1] which crashed the interpreter.
Anyone heard of it recently ? Then Python, whose 2.7 is still present on
a lot of systems because the forced transition to 3 broke tons of code.
Will there ever be a 4 after this sore experience ? Then JS, Rust, Go,
Zig and I don't know what. What I'm noting is that such languages appear,
serve a purpose well, have their moment of fame, last a decade and
disappear except at a few enthousiasts. C has been there for 50 years
and served as the basis of many newer languages so it's still well
understood. I'm sure about one thing, the C bugs we have today will be
fixable in 20 years. I'm not even sure the Rust code we'll merge today
will still be compilable in 10 years nor will support the relevant
architectures available by then, and probably this code will have to
be rewritten in C to become maintained again.

> The other problem is even worse. Once we have non-trivial amount of rust
> code around the tree, even if it's "just some drivers", you cannot
> completely ignore it. One example would be internal API changes. Today,
> if I want to touch e.g. ethtool_ops, I need to adjust all in tree NIC
> drivers providing the affected callback and adjust them. Usually most of
> the patch is generated by spatch but manual tweaks are often needed here
> and there. In the world of bilingual kernel with nontrivial number of
> NIC drivers written in rust, I don't see how I could do that without
> also being proficient in rust.

You'll simply change the code you're able to change and those in charge
of their driver will use your commit message as instruction to fix the
build on theirs. How do you want it to be otherwise ?

> Rust enthusiasts tell us they want to
> open kernel development to more people but the result could as well be
> exactly the opposite: it could restrict kernel development to people
> proficient in _both_ languages.

This has been my understanding from the very beginning. Language prophets
always want to conquier very visible targets as a gauge of their baby's
popularity.

> As Peter said, it's not an imminent problem but as it's obvious this is
> just the first step, we should have a clear idea what the plan is and
> what we can and should expect.

I think the experience could be... interesting. However, I do note that
I've read quite a few claims about better security yada yada due to a
stricter memory model. Except that I seem to have understood that a lot
of code will have to run in unsafe mode (which partially voids some of
the benefits), that we'll be at the mercy of the unique compiler's bugs,
and that in addition code auditing will be very hard and reviews of the
boundaries between the two languages almost inexistent. This is precisely
what will become the new playground of attackers, and I predict a
significant increase of vulnerabilities past this point. Time will tell,
hoping it's never too late to rollback if it gets crazy. As long as the
code remains readable, it could be rewritten in C to regain control...

> Michal

Willy
