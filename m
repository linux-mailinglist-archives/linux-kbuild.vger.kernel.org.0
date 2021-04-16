Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43FEA3618E3
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 06:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbhDPE2O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 00:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbhDPE2O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 00:28:14 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F10C061574;
        Thu, 15 Apr 2021 21:27:48 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id o2so6555068qtr.4;
        Thu, 15 Apr 2021 21:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h/j3EPtsk6sFPLhViDwCVPqvIn6HguFgWYAaIE2CjVA=;
        b=qiRj45IdAFMPjAJ5IZe4MNJGSxzIlodMYVOaCCmfT0g0sEbUTVwBmtNahpfdutLtkz
         XoOhagfcKGJpGD5WC1TKxQpk+klt29nJg/UXK630gWCX/cOLD+qYWGuYR4iq6zKmRmzK
         HmJDzy0X49IobhbfEarMqZs93zxei+a0Jh2osfEoh9ZfJPXiJJT9xqtD2dvCDK0iyAhv
         lbFhiImjFv8jxDn3Un/uWlAInOd8F29SmMfVSeZC28CdCpByXd8mFZHLrTJSyozRWJAt
         yjwi5lBa/419P/5qs+PjbVWRBbFLZIIvHFr9Z1pp5RPq1FfuMcqOm3fBg4BvvWExy7dg
         DX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h/j3EPtsk6sFPLhViDwCVPqvIn6HguFgWYAaIE2CjVA=;
        b=V2Lg8C6ykrOkBL2J5wcnkBB5jBsjtBxZ3R6YsKBWIcXOgR6O77KV+FGaop6geZtyx/
         Pqgo5qyRPs0HczGM51MN/DlmUFS4MS4NFOsudQAomNsicKnhD0D0TY/EqB0+nZ6XD7V9
         HFZzUiq6QUYKywpDGDvWyMiKpUSZeECmsfpi0kzFBPyc1FCGGxfguje4amOzfEcl1u8X
         o7ZsfcybsPcPnJV9vEnpxT915tgp2rivXDIoiCWKVeWYIcq89lyksppD+zvS4jL6MzoF
         +gr0n6pmRdgSmwTDvg2RYekhISpmhQSxhgj6O8p3lyq1UlI69SCdIwlyOmcy5kROcQ8V
         jA9A==
X-Gm-Message-State: AOAM531EQBtazemJz/9bF9TrAK4qR6YJJdvi2Mat2grD+ham+aMlrdrq
        BehNm2laduUHBq1PgtYDBO4=
X-Google-Smtp-Source: ABdhPJxrQY7+Hey1MHrpzxgApswgXT9/+0g6dSkEk30eB89i5Z97Q5P+PJoDSN/i22imYH93IxJVoA==
X-Received: by 2002:ac8:7c56:: with SMTP id o22mr6253242qtv.133.1618547267947;
        Thu, 15 Apr 2021 21:27:47 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id t198sm3464119qke.44.2021.04.15.21.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 21:27:47 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailauth.nyi.internal (Postfix) with ESMTP id 6775127C0054;
        Fri, 16 Apr 2021 00:27:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 16 Apr 2021 00:27:46 -0400
X-ME-Sender: <xms:QBJ5YDihXYompMzPsWr62oBbHmcsQSPzXpwgcuou4EHAqK-AKTfAtg>
    <xme:QBJ5YAARTID13fw0PiQ-Mpskm3M5jenS_49y5vVOvVWB2bVUW9nen-5dDYoBt_gSb
    3aWUql-8I-P9V17HQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelgedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhephffgledvjeehkedtgeehudehhfegfeetgeelffffuefgueevtdelfeelgeeh
    geeknecuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorhhgpdhkvghrnhgvlhdrohhrgh
    dpghhithhhuhgsrdgtohhmnecukfhppedufedurddutdejrddugeejrdduvdeinecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomh
    gvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeeh
    heehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmh
    gv
X-ME-Proxy: <xmx:QBJ5YDGVCZt4jzkHi0E6-223t2nAXmoaa9VQ-MNhXzQWkwB0_uy_XQ>
    <xmx:QBJ5YAT4LetqPD9xis1cwLFIIRqiGZ25JASXBCbYhNp3_-S4Nsfh7w>
    <xmx:QBJ5YAz2WcdjfWJ4GmPA-bVjhTPKsBJO0A0OVGldtHykTtdQnUCXBA>
    <xmx:QRJ5YCovR3rft7gepSxpSjHc6vi5qouCHXGWccSHw1Rkw3W4cJ0TQOlLQ688jKtb>
Received: from localhost (unknown [131.107.147.126])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0CBB5108005C;
        Fri, 16 Apr 2021 00:27:43 -0400 (EDT)
Date:   Fri, 16 Apr 2021 12:27:39 +0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHkSO3TUktyPs4Nz@boqun-archlinux>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[Copy LKMM people, Josh, Nick and Wedson]

On Thu, Apr 15, 2021 at 08:58:16PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
> 
> > Rust is a systems programming language that brings several key
> > advantages over C in the context of the Linux kernel:
> > 
> >   - No undefined behavior in the safe subset (when unsafe code is
> >     sound), including memory safety and the absence of data races.
> 
> And yet I see not a single mention of the Rust Memory Model and how it
> aligns (or not) with the LKMM. The C11 memory model for example is a
> really poor fit for LKMM.
> 

I think Rust currently uses C11 memory model as per:

	https://doc.rust-lang.org/nomicon/atomics.html

, also I guess another reason that they pick C11 memory model is because
LLVM has the support by default.

But I think the Rust Community still wants to have a good memory model,
and they are open to any kind of suggestion and input. I think we (LKMM
people) should really get involved, because the recent discussion on
RISC-V's atomics shows that if we didn't people might get a "broken"
design because they thought C11 memory model is good enough:

	https://lore.kernel.org/lkml/YGyZPCxJYGOvqYZQ@boqun-archlinux/

And the benefits are mutual: a) Linux Kernel Memory Model (LKMM) is
defined by combining the requirements of developers and the behavior of
hardwares, it's pratical and can be a very good input for memory model
designing in Rust; b) Once Rust has a better memory model, the compiler
technologies whatever Rust compilers use to suppor the memory model can
be adopted to C compilers and we can get that part for free.

At least I personally is very intereted to help Rust on a complete and
pratical memory model ;-)

Josh, I think it's good if we can connect to the people working on Rust
memoryg model, I think the right person is Ralf Jung and the right place
is https://github.com/rust-lang/unsafe-code-guidelines, but you
cerntainly know better than me ;-) Or maybe we can use Rust-for-Linux or
linux-toolchains list to discuss.

[...]
> >   - Boqun Feng is working hard on the different options for
> >     threading abstractions and has reviewed most of the `sync` PRs.
> 
> Boqun, I know you're familiar with LKMM, can you please talk about how
> Rust does things and how it interacts?

As Wedson said in the other email, currently there is no code requiring
synchronization between C side and Rust side, so we are currently fine.
But in the longer term, we need to teach Rust memory model about the
"design patterns" used in Linux kernel for parallel programming.

What I have been doing so far is reviewing patches which have memory
orderings in Rust-for-Linux project, try to make sure we don't include
memory ordering bugs for the beginning.

Regards,
Boqun
