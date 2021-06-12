Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 230293A5014
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 20:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhFLSRx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 14:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLSRw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 14:17:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151C0C061574;
        Sat, 12 Jun 2021 11:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Ps52kPN0CGhy0RDCiacanmUQS9na8o/hOy6klGUnjsU=; b=PRowg1ey+6JkXQysWPx6N6jWOY
        +WnQqeScl98svvQtwdxvd5Qv+pDiAYqelfE8zIYJJRAPRA/ExDjdM1OA/KrO7p7xEjfE3UhFqOvB7
        +KcEFHW2ShBf8ryr4UsK6/rRdXjlZDxwXXnHCC9jmKOntXrmBEjHJX1O4yXCmRY+flSw89baz6+HB
        WCpxkPWJA9gcFmlp1Zf9Ky1h57irK1sZid4vp7SYmO0n7i1gxVWhP98NmFuSoCwk6DejhbjMMT7iB
        9TJ3LtkKnbVz5NxnxFh1byacdVCaYqiK68RZdAVFFwvTYrep0sRhRqtg5HPFTOE8nfrcqfsx/K0lZ
        /xm0vysw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1ls8AR-003ujh-5x; Sat, 12 Jun 2021 18:15:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 70DCF30008D;
        Sat, 12 Jun 2021 20:15:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 598362BDFC479; Sat, 12 Jun 2021 20:15:33 +0200 (CEST)
Date:   Sat, 12 Jun 2021 20:15:33 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Bill Wendling <morbo@google.com>
Cc:     Kees Cook <keescook@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
 <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 12, 2021 at 10:25:57AM -0700, Bill Wendling wrote:
> On Sat, Jun 12, 2021 at 9:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Apr 07, 2021 at 02:17:04PM -0700, Bill Wendling wrote:
> > > From: Sami Tolvanen <samitolvanen@google.com>
> > >
> > > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > > profile, the kernel is instrumented with PGO counters, a representative
> > > workload is run, and the raw profile data is collected from
> > > /sys/kernel/debug/pgo/profraw.
> > >
> > > The raw profile data must be processed by clang's "llvm-profdata" tool
> > > before it can be used during recompilation:
> > >
> > >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > >   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > >
> > > Multiple raw profiles may be merged during this step.
> > >
> > > The data can now be used by the compiler:
> > >
> > >   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> > >
> > > This initial submission is restricted to x86, as that's the platform we
> > > know works. This restriction can be lifted once other platforms have
> > > been verified to work with PGO.
> >
> > *sigh*, and not a single x86 person on Cc, how nice :-/
> >
> This tool is generic and, despite the fact that it's first enabled for
> x86, it contains no x86-specific code. The reason we're restricting it
> to x86 is because it's the platform we tested on.

You're modifying a lot of x86 files, you don't think it's good to let us
know?  Worse, afaict this -fprofile-generate changes code generation,
and we definitely want to know about that.

> > >  arch/x86/Kconfig                      |   1 +
> > >  arch/x86/boot/Makefile                |   1 +
> > >  arch/x86/boot/compressed/Makefile     |   1 +
> > >  arch/x86/crypto/Makefile              |   4 +
> > >  arch/x86/entry/vdso/Makefile          |   1 +
> > >  arch/x86/kernel/vmlinux.lds.S         |   2 +
> > >  arch/x86/platform/efi/Makefile        |   1 +
> > >  arch/x86/purgatory/Makefile           |   1 +
> > >  arch/x86/realmode/rm/Makefile         |   1 +
> > >  arch/x86/um/vdso/Makefile             |   1 +


> > > +CFLAGS_PGO_CLANG := -fprofile-generate
> > > +export CFLAGS_PGO_CLANG

> > And which of the many flags in noinstr disables this?
> >
> These flags aren't used with PGO. So there's no need to disable them.

Supposedly -fprofile-generate adds instrumentation to the generated
code. noinstr *MUST* disable that. If not, this is a complete
non-starter for x86.

> > Also, and I don't see this answered *anywhere*, why are you not using
> > perf for this? Your link even mentions Sampling Profilers (and I happen
> > to know there's been significant effort to make perf output work as
> > input for the PGO passes of the various compilers).
> >
> Instruction-based (non-sampling) profiling gives us a better
> context-sensitive profile, making PGO more impactful. It's also useful
> for coverage whereas sampling profiles cannot.

We've got KCOV and GCOV support already. Coverage is also not an
argument mentioned anywhere else. Coverage can go pound sand, we really
don't need a third means of getting that.

Do you have actual numbers that back up the sampling vs instrumented
argument? Having the instrumentation will affect performance which can
scew the profile just the same.

Also, sampling tends to capture the hot spots very well.
