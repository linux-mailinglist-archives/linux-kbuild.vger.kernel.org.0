Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68163627E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 20:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244996AbhDPSrj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 14:47:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:52644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237334AbhDPSri (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 14:47:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A45B9611AF;
        Fri, 16 Apr 2021 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618598833;
        bh=N2KsTvifrgq/rqC0brjMwrMhFZQCdz7M8vStss5BFQ4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nF79sJC+RtSJr3mZhq6eKVwcK2vI4svdbyPBTB1AzQLNEiMlRni8RI27NgWXdzf6y
         I0JHjhzeALc13hBv4Vo9eQyGBjhBMV6nWpw4oV1MYx/oZceej+bRdHgm2sn6JkZDdI
         LHo9/LvhS1n/mvqsMi7zLf9MSLPYUUjFP6UwKmzdrm6V6SCAJV9ERCDLfha0Pr/3MM
         kvDDhaFYGE2Y018D0hYf7FV84CwMIXgJaDcXMIqopcThsCUAU4HWyxfbRKEna3enTR
         tYGj0dPcXtFDdD1u1VY7/vWwQWo1yPq4j/edRIoPhXgFV/qX8Xs0gjGVmcMA1iusgB
         C3vWXnP4RqpQw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 70DB95C0253; Fri, 16 Apr 2021 11:47:13 -0700 (PDT)
Date:   Fri, 16 Apr 2021 11:47:13 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
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
Message-ID: <20210416184713.GI4212@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHkSO3TUktyPs4Nz@boqun-archlinux>
 <CAKwvOdnRx+8LhOAnH24CeZz2a2-MwF03oB7Um_pKBq8WAoLNxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnRx+8LhOAnH24CeZz2a2-MwF03oB7Um_pKBq8WAoLNxw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 11:04:37PM -0700, Nick Desaulniers wrote:
> On Thu, Apr 15, 2021 at 9:27 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > [Copy LKMM people, Josh, Nick and Wedson]
> >
> > On Thu, Apr 15, 2021 at 08:58:16PM +0200, Peter Zijlstra wrote:
> > > On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
> > >
> > > > Rust is a systems programming language that brings several key
> > > > advantages over C in the context of the Linux kernel:
> > > >
> > > >   - No undefined behavior in the safe subset (when unsafe code is
> > > >     sound), including memory safety and the absence of data races.
> > >
> > > And yet I see not a single mention of the Rust Memory Model and how it
> > > aligns (or not) with the LKMM. The C11 memory model for example is a
> > > really poor fit for LKMM.
> > >
> >
> > I think Rust currently uses C11 memory model as per:
> >
> >         https://doc.rust-lang.org/nomicon/atomics.html
> >
> > , also I guess another reason that they pick C11 memory model is because
> > LLVM has the support by default.
> >
> > But I think the Rust Community still wants to have a good memory model,
> > and they are open to any kind of suggestion and input. I think we (LKMM
> > people) should really get involved, because the recent discussion on
> > RISC-V's atomics shows that if we didn't people might get a "broken"
> > design because they thought C11 memory model is good enough:
> >
> >         https://lore.kernel.org/lkml/YGyZPCxJYGOvqYZQ@boqun-archlinux/
> >
> > And the benefits are mutual: a) Linux Kernel Memory Model (LKMM) is
> > defined by combining the requirements of developers and the behavior of
> > hardwares, it's pratical and can be a very good input for memory model
> > designing in Rust; b) Once Rust has a better memory model, the compiler
> > technologies whatever Rust compilers use to suppor the memory model can
> > be adopted to C compilers and we can get that part for free.
> 
> Yes, I agree; I think that's a very good approach.  Avoiding the ISO
> WG14 is interesting; at least the merits could be debated in the
> public and not behind closed doors.

WG14 (C) and WG21 (C++) are at least somewhat open.  Here are some of
the proposals a few of us have in flight:

P2055R0 A Relaxed Guide to memory_order_relaxed
	http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p2055r0.pdf
P0124R7 Linux-Kernel Memory Model (vs. that of C/C++)
	http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p0124r7.html
P1726R4 Pointer lifetime-end zap
	http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p1726r4.pdf
	https://docs.google.com/document/d/1MfagxTa6H0rTxtq9Oxyh4X53NzKqOt7y3hZBVzO_LMk/edit?usp=sharing
P1121R2 Hazard Pointers: Proposed Interface and Wording for Concurrency TS 2
	http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2021/p1121r2.pdf
P1382R1 volatile_load<T> and volatile_store<T>
	http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2019/p1382r1.pdf
P1122R2 Proposed Wording for Concurrent Data Structures: Read-Copy-Update (RCU)
	http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p1122r2.pdf
	https://docs.google.com/document/d/1MfagxTa6H0rTxtq9Oxyh4X53NzKqOt7y3hZBVzO_LMk/edit?usp=sharing
P0190R4 Proposal for New memory order consume Definition
	http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0190r4.pdf
P0750R1 Consume
	http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0750r1.html

P1726R4 is of particular concern, along with consume.

> > At least I personally is very intereted to help Rust on a complete and
> > pratical memory model ;-)
> >
> > Josh, I think it's good if we can connect to the people working on Rust
> > memoryg model, I think the right person is Ralf Jung and the right place
> > is https://github.com/rust-lang/unsafe-code-guidelines, but you
> > cerntainly know better than me ;-) Or maybe we can use Rust-for-Linux or
> > linux-toolchains list to discuss.
> >
> > [...]
> > > >   - Boqun Feng is working hard on the different options for
> > > >     threading abstractions and has reviewed most of the `sync` PRs.
> > >
> > > Boqun, I know you're familiar with LKMM, can you please talk about how
> > > Rust does things and how it interacts?
> >
> > As Wedson said in the other email, currently there is no code requiring
> > synchronization between C side and Rust side, so we are currently fine.
> > But in the longer term, we need to teach Rust memory model about the
> > "design patterns" used in Linux kernel for parallel programming.
> >
> > What I have been doing so far is reviewing patches which have memory
> > orderings in Rust-for-Linux project, try to make sure we don't include
> > memory ordering bugs for the beginning.

I believe that compatibility with both C/C++ and the Linux kernel are
important.

							Thanx, Paul
