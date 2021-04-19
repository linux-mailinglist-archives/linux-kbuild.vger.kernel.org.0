Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF19F364B30
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 22:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242124AbhDSUgp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 16:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239276AbhDSUgo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 16:36:44 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20CEC061763
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 13:36:11 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u4so40931419ljo.6
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EwQlx/49KXwj+9MHny3x/v1N+rlK09AXDYpt2hWs1ys=;
        b=M6Rv83Wqxe7+zYaaVRPyzbYEby5JMD1vNERCXl3UyJGm+vbs33CGHyUTZb3aP00kzp
         U2fC6yirvslhroPLciAS6WwpSXmBaOSxypIINOAz7L042uh9cR4c9AZZgqeTrKczr9C7
         Pv/O5Yzc+UCPzpheYm5hOUg+930cY8ytyXvCw89YKWECVc2DGPctZDGixjXZ00+AU9ym
         JS31bfbQ8XlO/S6cWDWQdbsEhMhiIT4NKQo9PeqDJA/HiY4sAN1UBLdpcHuuDdYPz0Y0
         B7+No7u9JOyip91vsVIP9egPULZ8xdxuwltSWbeH1gu/tEnM4HzwRO8BqW1a5Ob2c263
         BG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EwQlx/49KXwj+9MHny3x/v1N+rlK09AXDYpt2hWs1ys=;
        b=Q6QyWIF2SkwT6cnSK4VUkng5uP2fw72HsepIgXpJ2RMSY7KBsEad1Bb73LdvXELVRg
         tOHgBI3mg/k/696nQ2TIzHl1PHLIVGFFkZlbN24bHAP0sdTpmiH3Wewei0fgtvcxTwmU
         +S8+d0X8AqmSRDIWxcWm45Fa1NoUrsothAl9g2ka9wFsx6wHWhovxhXKxly52/Qq1HSg
         1ykYgcJS4opLbP5bmnMCFzQY9+lCq7l0b6bvhrxBQa+JWeV21kw0nN5TCZtDJzOWeUtx
         Y5iDwGaBS/tjN+7BW8DL0zUT59ZAa9k7uVOf+/Bvb2cZpoSRPDUQ1E5S0vEZpv9bVHDp
         0KLA==
X-Gm-Message-State: AOAM532tH/TLi052LYSN6sHA4AngjMiJS3o88gWWABnfs6CLlufb/Xcg
        f4nBVfxmseTv6bacR0eoEuPqJVYGU7H2ecFqXgSIXw==
X-Google-Smtp-Source: ABdhPJyAEiWJGtkhAVdtYKj8XOpSgEzaCwcaJs0vHHrVfNGC+G3QGRYmflzgFLdAC2eb/iYE0CMxweklM3MWy/9C2J8=
X-Received: by 2002:a2e:988a:: with SMTP id b10mr12774742ljj.341.1618864569703;
 Mon, 19 Apr 2021 13:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHkSO3TUktyPs4Nz@boqun-archlinux> <CAKwvOdnRx+8LhOAnH24CeZz2a2-MwF03oB7Um_pKBq8WAoLNxw@mail.gmail.com>
 <20210416184713.GI4212@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20210416184713.GI4212@paulmck-ThinkPad-P17-Gen-1>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Apr 2021 13:35:56 -0700
Message-ID: <CAKwvOdkpOZk-FXJ0iOLvhyQr7wVcWwzgc0gk_8KTtOfF_Q8Q3g@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     paulmck@kernel.org, ojeda@kernel.org
Cc:     Boqun Feng <boqun.feng@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 11:47 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Apr 15, 2021 at 11:04:37PM -0700, Nick Desaulniers wrote:
> > On Thu, Apr 15, 2021 at 9:27 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> > >
> > > But I think the Rust Community still wants to have a good memory model,
> > > and they are open to any kind of suggestion and input. I think we (LKMM
> > > people) should really get involved, because the recent discussion on
> > > RISC-V's atomics shows that if we didn't people might get a "broken"
> > > design because they thought C11 memory model is good enough:
> > >
> > >         https://lore.kernel.org/lkml/YGyZPCxJYGOvqYZQ@boqun-archlinux/
> > >
> > > And the benefits are mutual: a) Linux Kernel Memory Model (LKMM) is
> > > defined by combining the requirements of developers and the behavior of
> > > hardwares, it's pratical and can be a very good input for memory model
> > > designing in Rust; b) Once Rust has a better memory model, the compiler
> > > technologies whatever Rust compilers use to suppor the memory model can
> > > be adopted to C compilers and we can get that part for free.
> >
> > Yes, I agree; I think that's a very good approach.  Avoiding the ISO
> > WG14 is interesting; at least the merits could be debated in the
> > public and not behind closed doors.
>
> WG14 (C) and WG21 (C++) are at least somewhat open.  Here are some of
> the proposals a few of us have in flight:

Wow, the working groups have been busy.  Thank you Paul and Boqun (and
anyone else on thread) for authoring many of the proposals listed
below.  Looks like I have a lot of reading to do to catch up.

Have any of those been accepted yet, or led to amendments to either
language's specs?  Where's the best place to track that?

My point has more to do with _participation_.  Rust's RFC process is
well documented (https://rust-lang.github.io/rfcs/introduction.html)
and is done via github pull requests[0].

This is a much different process than drafts thrown over the wall.
What hope do any kernel contributors have to participate in the ISO
WGs, other than hoping their contributions to a draft foresee/address
any concerns members of the committee might have?  How do members of
the ISO WG communicate with folks interested in the outcomes of their
decisions?

The two processes are quite different; one doesn't require "joining a
national body" (which I assume involves some monetary transaction, if
not for the individual participant, for their employer) for instance.
(http://www.open-std.org/jtc1/sc22/wg14/www/contributing which links
to https://www.iso.org/members.html; I wonder if we have kernel
contributors in those grayed out countries?)

It was always very ironic to me that the most important body of free
software was subject to decisions made by ISO, for better or for
worse.  I would think Rust's RFC process would be more accessible to
kernel developers, modulo the anti-github crowd, but with the Rust's
community's values in inclusion I'm sure they'd be happy to accomodate
folks for the RFC process without requiring github.  I'm not sure ISO
can be as flexible for non-members.

Either way, I think Rust's RFC process is something worth adding to
the list of benefits under the heading "Why Rust?" in this proposed
RFC.

>
> P2055R0 A Relaxed Guide to memory_order_relaxed
>         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p2055r0.pdf
> P0124R7 Linux-Kernel Memory Model (vs. that of C/C++)
>         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p0124r7.html
> P1726R4 Pointer lifetime-end zap
>         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p1726r4.pdf
>         https://docs.google.com/document/d/1MfagxTa6H0rTxtq9Oxyh4X53NzKqOt7y3hZBVzO_LMk/edit?usp=sharing
> P1121R2 Hazard Pointers: Proposed Interface and Wording for Concurrency TS 2
>         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2021/p1121r2.pdf
> P1382R1 volatile_load<T> and volatile_store<T>
>         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2019/p1382r1.pdf
> P1122R2 Proposed Wording for Concurrent Data Structures: Read-Copy-Update (RCU)
>         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p1122r2.pdf
>         https://docs.google.com/document/d/1MfagxTa6H0rTxtq9Oxyh4X53NzKqOt7y3hZBVzO_LMk/edit?usp=sharing
> P0190R4 Proposal for New memory order consume Definition
>         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0190r4.pdf
> P0750R1 Consume
>         http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0750r1.html

Does wg14 not participate in these discussions? (Or, is there a lot of
overlap between participants in both?)
http://93.90.116.65/JTC1/SC22/WG14/www/docs/ seems like a list of
proposals and meeting minutes, but all of the above links look like
WG21.  The model of decisions being made for C++ then trickling down
to C is definitely curious.  Though perhaps for the topics of memory
orderings there's enough overlap between the two languages for it not
to matter.

>
> P1726R4 is of particular concern, along with consume.


[0] You can see all of the existing ones here:
https://github.com/rust-lang/rfcs/tree/master/text, with links to
discussions for each on github.  (Here's one that has not been
accepted yet: https://github.com/rust-lang/rfcs/blob/master/text/1937-ques-in-main.md,
see the link to the issue in the rust issue tracker has lots of
comments _from the community_:
https://github.com/rust-lang/rust/issues/43301).  I guess the
equivalents for the ISO WGs would be the meeting minutes?
--
Thanks,
~Nick Desaulniers
