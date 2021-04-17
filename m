Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242FD362DDB
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 07:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhDQFYM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 01:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhDQFYJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 01:24:09 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA1EC061574;
        Fri, 16 Apr 2021 22:23:38 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso10494854pjg.2;
        Fri, 16 Apr 2021 22:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmEaZo1UgBJMKFP8STLc4Np6nALxKqNfhx+0+LMdmPc=;
        b=to7+zV3vvTzyJuA3t1AQh20eGtPip7Rl0u5BJAsZ/Nm916lMchCTzJ2Pxbz2K+0+en
         1oIFPtSO4qoYQu06PWn/0Q2QGHc5Q+8qKUlzFWPGsR5vUqlREftf330GTnGuv566iTvb
         YcFdX6WWwysvr++I85PacoG658pN3pY1E3EpypEZcgp2/rmvK+BpWKndhy5iDspybvRx
         dvprBFyWB7LF9tEKVCirspH6VLO45g6gwx3h5EKZuVkzTdHHOoLUcJq3ZstIHMDcHzk/
         YohGEXrtTfwKLzbjISN2+lDtFl592A+rn63smhgGxGeJje8iAP/J5yDvfhKwBoCm3/9t
         muzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmEaZo1UgBJMKFP8STLc4Np6nALxKqNfhx+0+LMdmPc=;
        b=pShmOwWcJQfK9ASvwy0PNJ+35pEbMGwnJb8wM2mh85vzdFqz9XO1bVa2aFX6J5uEMe
         zQLss3Ep11sJ/Igstx+zxT4AvBofbn6MytaXlhnUkPBtm0XNhSdd0xGlA0plUHoyvIyl
         Dp2GyShcL3iFTMhTKuyUwqSWtzFZH/QBsjuyN1kZDwH3qWw5Kl/qXLpDUBwC9i0UJngV
         JMXH/CE2D+5TidK9DQhT3U5Ad+onDDNVyFpwzr0wyTaM5bzF97euqi3XqL8xA1M0aWvi
         EX1SK78Z4q4+yRB6Ti8kRldbbG2/ABikMC8rGRvJAvjptxJJ5zAnwbGPnQ6UA1pUz30G
         BV2Q==
X-Gm-Message-State: AOAM530q+SRKMSjSRtzQaDFE1TAGKnpB5C2kYat+WOU6Ao0Hp9hQjXgf
        kZ4vcQGKAxeudrC0ACuuK8h2VN48QlisaNcR1uw=
X-Google-Smtp-Source: ABdhPJzZrbuviY7SuWnKARoajYLvwGuqwjc4TtDX1WR9gsG4YFq7ifyLDr4mugWVzoeg+sa9qS73JuA4icvA4FdZttM=
X-Received: by 2002:a17:90b:902:: with SMTP id bo2mr13399656pjb.193.1618637017500;
 Fri, 16 Apr 2021 22:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
In-Reply-To: <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
From:   comex <comexk@gmail.com>
Date:   Sat, 17 Apr 2021 01:23:26 -0400
Message-ID: <CAPM5UJ1cnaNCK1AcU1=kLpUcLrd9Ar0=5rrX2mk=BPRXG3K3nQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        josh <josh@joshtriplett.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 4:24 AM Peter Zijlstra <peterz@infradead.org> wrote:
> Simlar thing for RCU; C11 can't optimally do that; it needs to make
> rcu_dereference() a load-acquire [something ARM64 has already done in C
> because the compiler might be too clever by half when doing LTO :-(].
> But it's the compiler needing the acquire semantics, not the computer,
> which is just bloody wrong.

You may already know, but perhaps worth clarifying:

C11 does have atomic_signal_fence() which is a compiler fence.  But a
compiler fence only ensures the loads will be emitted in the right
order, not that the CPU will execute them in the right order.  CPU
architectures tend to guarantee that two loads will be executed in the
right order if the second one's address depends on the first one's
result, but a dependent load can stop being dependent after compiler
optimizations involving value speculation.  Using a load-acquire works
around this, not because it stops the compiler from performing any
optimization, but because it tells the computer to execute the loads
in the right order *even if* the compiler has broken the value
dependence.

So C11 atomics don't make the situation worse, compared to Linux's
atomics implementation based on volatile and inline assembly.  Both
are unsound in the presence of value speculation.  C11 atomics were
*supposed* to make the situation better, with memory_order_consume,
which would have specifically forbidden the compiler from performing
value speculation.  But all the compilers punted on getting this to
work and instead just implemented memory_order_consume as
memory_order_acquire.

As for Rust, it compiles to the same LLVM IR that Clang compiles C
into.  Volatile, inline assembly, and C11-based atomics: all of these
are available in Rust, and generate exactly the same code as their C
counterparts, for better or for worse.  Unfortunately, the Rust
project has relatively limited muscle when it comes to contributing to
LLVM.  So while it would definitely be nice if Rust could make RCU
sound, and from a specification perspective I think people would be
quite willing and probably easier to work with than the C committee...
I suspect that implementing this would require the kind of sweeping
change to LLVM that is probably not going to come from Rust.

There are other areas where I think that kind of discussion might be
more fruitful.  For example, the Rust documentation currently says
that a volatile read racing with a non-volatile write (i.e. seqlocks)
is undefined behavior. [1]  However, I am of the opinion that this is
essentially a spec bug, for reasons that are probably not worth
getting into here.

[1] https://doc.rust-lang.org/nightly/std/ptr/fn.read_volatile.html
