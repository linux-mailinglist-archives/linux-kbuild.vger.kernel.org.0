Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8F5364D1F
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 23:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240991AbhDSVhq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 17:37:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240494AbhDSVhq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 17:37:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 278546113C;
        Mon, 19 Apr 2021 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618868236;
        bh=19iVBNNRnRGkxYXcK+zEvxwbKimD5yNXQSWHe66L89s=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=anQB+TgXKdZQ7EnCKKDiQXab4dv0popniXfj4Igvk2YjYXq6KE2n4cCFv2qR+smVL
         MSsmgACvBlodM4zmTTPZmFEHlAvCvniJ5Xb7GhOYj/X11F/lV+2vE5TlV9dRaoT4A+
         eyE6LEajhvHBoEo70UcZiYIJF0AvnDkIM+sP/6EbdzF6/p0CDAROdqDEB4AtD+OFnt
         6gFLdmBUBrAVrbqAozFBskdB1cLc2dETDKkagB2qbCJXNylwv9/Au6Cg64KOD9yJ1E
         ltGRQOsxyVeiG0cmnaWbjAqSEKHB70D8wyNyvnyCs3iBN17SrNGtn8mJtSgl6DmXp3
         jpBXxrwuZPPPg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id BEFB05C00EA; Mon, 19 Apr 2021 14:37:15 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:37:15 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     ojeda@kernel.org, Boqun Feng <boqun.feng@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210419213715.GD975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHkSO3TUktyPs4Nz@boqun-archlinux>
 <CAKwvOdnRx+8LhOAnH24CeZz2a2-MwF03oB7Um_pKBq8WAoLNxw@mail.gmail.com>
 <20210416184713.GI4212@paulmck-ThinkPad-P17-Gen-1>
 <CAKwvOdkpOZk-FXJ0iOLvhyQr7wVcWwzgc0gk_8KTtOfF_Q8Q3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkpOZk-FXJ0iOLvhyQr7wVcWwzgc0gk_8KTtOfF_Q8Q3g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 01:35:56PM -0700, Nick Desaulniers wrote:
> On Fri, Apr 16, 2021 at 11:47 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Thu, Apr 15, 2021 at 11:04:37PM -0700, Nick Desaulniers wrote:
> > > On Thu, Apr 15, 2021 at 9:27 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> > > >
> > > > But I think the Rust Community still wants to have a good memory model,
> > > > and they are open to any kind of suggestion and input. I think we (LKMM
> > > > people) should really get involved, because the recent discussion on
> > > > RISC-V's atomics shows that if we didn't people might get a "broken"
> > > > design because they thought C11 memory model is good enough:
> > > >
> > > >         https://lore.kernel.org/lkml/YGyZPCxJYGOvqYZQ@boqun-archlinux/
> > > >
> > > > And the benefits are mutual: a) Linux Kernel Memory Model (LKMM) is
> > > > defined by combining the requirements of developers and the behavior of
> > > > hardwares, it's pratical and can be a very good input for memory model
> > > > designing in Rust; b) Once Rust has a better memory model, the compiler
> > > > technologies whatever Rust compilers use to suppor the memory model can
> > > > be adopted to C compilers and we can get that part for free.
> > >
> > > Yes, I agree; I think that's a very good approach.  Avoiding the ISO
> > > WG14 is interesting; at least the merits could be debated in the
> > > public and not behind closed doors.
> >
> > WG14 (C) and WG21 (C++) are at least somewhat open.  Here are some of
> > the proposals a few of us have in flight:
> 
> Wow, the working groups have been busy.  Thank you Paul and Boqun (and
> anyone else on thread) for authoring many of the proposals listed
> below.  Looks like I have a lot of reading to do to catch up.

And this is only the proposals relating to low-level concurrency.
There are way more proposals relating to vector processing, GPGPUs,
task-based concurrency, and so on.  Here is the list of papers submitted
thus far this year:

http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2021/

> Have any of those been accepted yet, or led to amendments to either
> language's specs?  Where's the best place to track that?

None of them have yet to be accepted.  P1121R2 has been recommended for
Concurrency Technical Specification 2, which is a stepping stone to the
International Standard.  I hope that P1122R2 will follow soon.

> My point has more to do with _participation_.  Rust's RFC process is
> well documented (https://rust-lang.github.io/rfcs/introduction.html)
> and is done via github pull requests[0].
> 
> This is a much different process than drafts thrown over the wall.
> What hope do any kernel contributors have to participate in the ISO
> WGs, other than hoping their contributions to a draft foresee/address
> any concerns members of the committee might have?  How do members of
> the ISO WG communicate with folks interested in the outcomes of their
> decisions?

I participate in ISO SC22 WG21 (C++) and to a lesser extent WG14 (C).
Participation is key.  The various US National Laboratories send quite a
few people, which has a lot to do with these two standards accommodating
their wishes.

> The two processes are quite different; one doesn't require "joining a
> national body" (which I assume involves some monetary transaction, if
> not for the individual participant, for their employer) for instance.
> (http://www.open-std.org/jtc1/sc22/wg14/www/contributing which links
> to https://www.iso.org/members.html; I wonder if we have kernel
> contributors in those grayed out countries?)

Your employer is already a member of WG21 (C++), so there is no ISO
obstacle to participation by you or by your colleagues.  If you contact
me offlist, I would be happy to connect you to your employer's WG21
representative.

> It was always very ironic to me that the most important body of free
> software was subject to decisions made by ISO, for better or for
> worse.  I would think Rust's RFC process would be more accessible to
> kernel developers, modulo the anti-github crowd, but with the Rust's
> community's values in inclusion I'm sure they'd be happy to accomodate
> folks for the RFC process without requiring github.  I'm not sure ISO
> can be as flexible for non-members.

Being a member is not all that necessary.  Yes, at the end of the day,
only national bodies can formally vote, but I have not come across a
case of anyone being barred from discussions, paper submissions, or straw
polls (informal votes used to set direction) due to not being a member.
Given that the national bodies are only permitted to comment on and vote
on finished proposals, you can argue that individuals have more influence.

Similarly, it is not necessary to be personally acquainted with me in
order to get patches into Linux-kernel RCU.

> Either way, I think Rust's RFC process is something worth adding to
> the list of benefits under the heading "Why Rust?" in this proposed
> RFC.

Comparing Rust's process to that of the C or C++ standard committees is
best done by someone who understands both, and that set does not appear
to include either you or me.  ;-)

I could easily believe that Rust's process is lighter weight, but on
the other hand, I doubt that Rust's definition has legal standing in
any jurisdiction just yet.

> > P2055R0 A Relaxed Guide to memory_order_relaxed
> >         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p2055r0.pdf
> > P0124R7 Linux-Kernel Memory Model (vs. that of C/C++)
> >         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p0124r7.html
> > P1726R4 Pointer lifetime-end zap
> >         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p1726r4.pdf
> >         https://docs.google.com/document/d/1MfagxTa6H0rTxtq9Oxyh4X53NzKqOt7y3hZBVzO_LMk/edit?usp=sharing
> > P1121R2 Hazard Pointers: Proposed Interface and Wording for Concurrency TS 2
> >         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2021/p1121r2.pdf
> > P1382R1 volatile_load<T> and volatile_store<T>
> >         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2019/p1382r1.pdf
> > P1122R2 Proposed Wording for Concurrent Data Structures: Read-Copy-Update (RCU)
> >         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p1122r2.pdf
> >         https://docs.google.com/document/d/1MfagxTa6H0rTxtq9Oxyh4X53NzKqOt7y3hZBVzO_LMk/edit?usp=sharing
> > P0190R4 Proposal for New memory order consume Definition
> >         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0190r4.pdf
> > P0750R1 Consume
> >         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0750r1.html
> 
> Does wg14 not participate in these discussions? (Or, is there a lot of
> overlap between participants in both?)
> http://93.90.116.65/JTC1/SC22/WG14/www/docs/ seems like a list of
> proposals and meeting minutes, but all of the above links look like
> WG21.  The model of decisions being made for C++ then trickling down
> to C is definitely curious.  Though perhaps for the topics of memory
> orderings there's enough overlap between the two languages for it not
> to matter.

Back in 2005, WG14 and WG21 agreed that low-level concurrency proposals
would be handled by WG21, and that WG14 members would participate.
But some things required working with both committees, for example,
there is a WG14 counterpart to P1726R4, namely N2443:

http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2443.pdf

> > P1726R4 is of particular concern, along with consume.
> 
> 
> [0] You can see all of the existing ones here:
> https://github.com/rust-lang/rfcs/tree/master/text, with links to
> discussions for each on github.  (Here's one that has not been
> accepted yet: https://github.com/rust-lang/rfcs/blob/master/text/1937-ques-in-main.md,
> see the link to the issue in the rust issue tracker has lots of
> comments _from the community_:
> https://github.com/rust-lang/rust/issues/43301).  I guess the
> equivalents for the ISO WGs would be the meeting minutes?

There are minutes on wikis, github issue trackers, follow-on papers,
and so on.

Once things are reasonably well set for a given proposal, the formal
national-body-level processes take over.  I have been happy to be able
to sit out that phase for the most part.  ;-)

							Thanx, Paul
