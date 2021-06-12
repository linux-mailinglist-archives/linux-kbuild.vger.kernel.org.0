Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D843A508E
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 22:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhFLU1j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 16:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLU1i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 16:27:38 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4588C061574;
        Sat, 12 Jun 2021 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=txv3kaWdgwVZj6W7BjUjMJ4+C/F3qLPyBxFGwk53zHA=; b=emB13JCzOX/VDQw58agS1QdMOZ
        PPjP5LKe+y8cOK033j4R73WgWe4ZN28TbdkFjnC49WQrMrGA0t8zDD1mXPPoYiDjBygW9ibVkRibL
        hZwuxzU8D/MT/mePo6eBr3F85+avyd6oPEq51C9g/e46xl39QzhV1kY/oDdpNH5QiHAUKK9RF+eiP
        ZWEqYjyvqcDaS+Z6i7sNw+WIFgkFaoD/zP+JLcSeXanIAwv5IuBo5dV6C7vSYFTVu1b2/IeyF8A2k
        TPRs63nBoD4TwkJ7z4UQoY1MvjYIcMwruC1QGz/OZI5qGrSaMiOwYlO9C7vY5s+A9kTU7FT5ek450
        9+192xrQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lsABo-003z4e-0l; Sat, 12 Jun 2021 20:25:11 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 5672B986F3B; Sat, 12 Jun 2021 22:25:05 +0200 (CEST)
Date:   Sat, 12 Jun 2021 22:25:05 +0200
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
Message-ID: <20210612202505.GG68208@worktop.programming.kicks-ass.net>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
 <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 12, 2021 at 12:10:03PM -0700, Bill Wendling wrote:
> > You're modifying a lot of x86 files, you don't think it's good to let us
> > know?  Worse, afaict this -fprofile-generate changes code generation,
> > and we definitely want to know about that.
> >
> I got the list of people to add from the scripts/get_maintainer.pl.

$ ./scripts/get_maintainer.pl -f arch/x86/Makefile
Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Ingo Molnar <mingo@redhat.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Borislav Petkov <bp@alien8.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))

> there's one intel people CC'ed, but he didn't sign off on it.

Intel does not employ the main x86 maintainers, even it if did, mailing
a random Google person won't get the mail to you either, would it?

> These patches were available for review for months now,

Which doesn't help if you don't Cc the right people, does it. *nobody*
has time to read LKML.

> and posted to all of the lists and CC'ed to the people from
> scripts/get_maintainers.pl. Perhaps that program should be improved?

I suspect operator error, see above.

> > Supposedly -fprofile-generate adds instrumentation to the generated
> > code. noinstr *MUST* disable that. If not, this is a complete
> > non-starter for x86.
> 
> "noinstr" has "notrace", which is defined as
> "__attribute__((__no_instrument_function__))", which is honored by
> both gcc and clang.

Yes it is, but is that sufficient in this case? It very much isn't for
KASAN, UBSAN, and a whole host of other instrumentation crud. They all
needed their own 'bugger-off' attributes.

> > We've got KCOV and GCOV support already. Coverage is also not an
> > argument mentioned anywhere else. Coverage can go pound sand, we really
> > don't need a third means of getting that.
> >
> Those aren't useful for clang-based implementations. And I like to
> look forward to potential improvements.

I look forward to less things doing the same over and over. The obvious
solution if of course to make clang use what we have, not the other way
around.

> > Do you have actual numbers that back up the sampling vs instrumented
> > argument? Having the instrumentation will affect performance which can
> > scew the profile just the same.
> >
> Instrumentation counts the number of times a branch is taken. Sampling
> is at a gross level, where if the sampling time is fine enough, you
> can get an idea of where the hot spots are, but it won't give you the
> fine-grained information that clang finds useful. Essentially, while
> sampling can "capture the hot spots very well", relying solely on
> sampling is basically leaving optimization on the floor.
> 
> Our optimizations experts here have determined, through data of
> course, that instrumentation is the best option for PGO.

It would be very good to post some of that data and explicit examples.
Hear-say don't carry much weight.
