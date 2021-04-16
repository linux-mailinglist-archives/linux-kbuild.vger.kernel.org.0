Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED6C3619B3
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 08:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbhDPGFQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 02:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234662AbhDPGFQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 02:05:16 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C142DC061756
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 23:04:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n8so43036369lfh.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 23:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gbzaa2Ai7xXdaJk+SuOzDr1sDQqCY9sqWL6R/1Zrh+s=;
        b=W5/QWZWFFaSWg9idKZ6DJEpPmhh/eOS3XCiS0GJpjJR7c/9hO/bPRnbhDx6fcqOh/0
         sp9nz3xawBALOHCXGcN4jIih6Lo7LRUhWSYjVKt/IE7M5QZMCikdUSMKXXJqXnNorxIu
         UcotZdbyz0htz+FRuAF9BYmaG3K/gWMFAT/A8/JmQBFrNNVdGLgxB72JzOcS3dWuBrUO
         pLLR3MAXjECLXZHF0eu89BJvQwappXx3P0EcpPXDjPCJULvqxF+y1iSxNPQzfc3EiG4c
         rSb/0coU8nEO5IvdaN3SjfYFjNy5PzO32XHT/eoBVhUpxXlkT2FrApLCrpZqzbcHuazj
         0Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gbzaa2Ai7xXdaJk+SuOzDr1sDQqCY9sqWL6R/1Zrh+s=;
        b=qoEXIRDfM+nVMmaFFp3XrzkEaQiFkIVYEfNsWWlsmrsLDqkC70iZelociVAjW4fBqA
         Si8c0M3VDIEB3W0cvhqEV7qv/UbiXgk6VCCi7rWuFprcOa9zAtli+iwMscv9acnME235
         GhQQz6cIn5kAX/tuObFhGTHf9Tb4klxJPZoUC8sgNiKEMr97GGdmaqYxOlyGrbzSVXfz
         i5m7i7UNltggHnOajp++RIraEesa5ekvi2soGbdyp0S7i5cEgtA6L+LGwskTvM314Zp6
         hb43q7+okDDLxzP/cIWGIuIra82/NNNrv9jLYzyJf7tzWVyacOMr13tuUXbGC+5EFNs8
         VdDg==
X-Gm-Message-State: AOAM530z3CVriF1KVh5Gdk8KS94D4zV0Ptl3+dk4VBt444qeNDKk6oER
        jUI/QTaTqS1AB3l3Qfu8W2yLWOFhHbj+G9SNL1GWdg==
X-Google-Smtp-Source: ABdhPJzd3Uifx8wPh8+Ukv5wC6+mAKF4pnOLfbn/l4Zr9Mzj0XiDdg2h8UGLElnlq21TU6eWm2HsUZh+V10t5NGgiSg=
X-Received: by 2002:a19:ac09:: with SMTP id g9mr1821239lfc.547.1618553088788;
 Thu, 15 Apr 2021 23:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHkSO3TUktyPs4Nz@boqun-archlinux>
In-Reply-To: <YHkSO3TUktyPs4Nz@boqun-archlinux>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 15 Apr 2021 23:04:37 -0700
Message-ID: <CAKwvOdnRx+8LhOAnH24CeZz2a2-MwF03oB7Um_pKBq8WAoLNxw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
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
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 9:27 PM Boqun Feng <boqun.feng@gmail.com> wrote:
>
> [Copy LKMM people, Josh, Nick and Wedson]
>
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
> >
>
> I think Rust currently uses C11 memory model as per:
>
>         https://doc.rust-lang.org/nomicon/atomics.html
>
> , also I guess another reason that they pick C11 memory model is because
> LLVM has the support by default.
>
> But I think the Rust Community still wants to have a good memory model,
> and they are open to any kind of suggestion and input. I think we (LKMM
> people) should really get involved, because the recent discussion on
> RISC-V's atomics shows that if we didn't people might get a "broken"
> design because they thought C11 memory model is good enough:
>
>         https://lore.kernel.org/lkml/YGyZPCxJYGOvqYZQ@boqun-archlinux/
>
> And the benefits are mutual: a) Linux Kernel Memory Model (LKMM) is
> defined by combining the requirements of developers and the behavior of
> hardwares, it's pratical and can be a very good input for memory model
> designing in Rust; b) Once Rust has a better memory model, the compiler
> technologies whatever Rust compilers use to suppor the memory model can
> be adopted to C compilers and we can get that part for free.

Yes, I agree; I think that's a very good approach.  Avoiding the ISO
WG14 is interesting; at least the merits could be debated in the
public and not behind closed doors.

>
> At least I personally is very intereted to help Rust on a complete and
> pratical memory model ;-)
>
> Josh, I think it's good if we can connect to the people working on Rust
> memoryg model, I think the right person is Ralf Jung and the right place
> is https://github.com/rust-lang/unsafe-code-guidelines, but you
> cerntainly know better than me ;-) Or maybe we can use Rust-for-Linux or
> linux-toolchains list to discuss.
>
> [...]
> > >   - Boqun Feng is working hard on the different options for
> > >     threading abstractions and has reviewed most of the `sync` PRs.
> >
> > Boqun, I know you're familiar with LKMM, can you please talk about how
> > Rust does things and how it interacts?
>
> As Wedson said in the other email, currently there is no code requiring
> synchronization between C side and Rust side, so we are currently fine.
> But in the longer term, we need to teach Rust memory model about the
> "design patterns" used in Linux kernel for parallel programming.
>
> What I have been doing so far is reviewing patches which have memory
> orderings in Rust-for-Linux project, try to make sure we don't include
> memory ordering bugs for the beginning.
>
> Regards,
> Boqun



-- 
Thanks,
~Nick Desaulniers
