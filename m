Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CF43A61DC
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 12:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234044AbhFNKwi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 06:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbhFNKug (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 06:50:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69912C0611C6;
        Mon, 14 Jun 2021 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=BT1NtYIux4JLaeybPfCOT8uueCBZvOTndG6fM411rmw=; b=ehBof3aMHlzMx886GSIXylvzUK
        uZri8LTBRJaYrh+M5TasVMYcRFbnzh8VUiHFL+Eb4XYAnryHDEjhyr9E+3pa3tId+0KV2/MVO8jmR
        dJ9uGarsIbTa2orDHYMzwAahs5Vz2w8eY9kbT0CTYMWmjrWvzKqGHhqKlbnorsdfexMK+XU/9QpR4
        +v+8zz+MQcpSD+gB0q+0Dknk/bzpoNWJ1MUUKBuqwpWDKgdrbUoq6gtL0l4jkjRUKDvsHNm5vmz01
        XUNykyufR8Z0x+NoOHZv21g5P//b8Vt3b/A06My4i5bO8YdNwxOlFSG81SRVjO090UGTvJ8Qo+Gcn
        UKflDZow==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lsk5N-005HsH-Ok; Mon, 14 Jun 2021 10:44:57 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E35923001E3;
        Mon, 14 Jun 2021 12:44:52 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C7B322C178C03; Mon, 14 Jun 2021 12:44:52 +0200 (CEST)
Date:   Mon, 14 Jun 2021 12:44:52 +0200
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
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        andreyknvl@gmail.com, dvyukov@google.com, elver@google.com,
        johannes.berg@intel.com, oberpar@linux.vnet.ibm.com,
        linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
 <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net>
 <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 14, 2021 at 02:39:41AM -0700, Bill Wendling wrote:
> On Mon, Jun 14, 2021 at 2:01 AM Peter Zijlstra <peterz@infradead.org> wrote:

> > Because having GCOV, KCOV and PGO all do essentially the same thing
> > differently, makes heaps of sense?
> >
> It does when you're dealing with one toolchain without access to another.

Here's a sekrit, don't tell anyone, but you can get a free copy of GCC
right here:

  https://gcc.gnu.org/

We also have this linux-toolchains list (Cc'ed now) that contains folks
from both sides.

> > I understand that the compilers actually generates radically different
> > instrumentation for the various cases, but essentially they're all
> > collecting (function/branch) arcs.
> >
> That's true, but there's no one format for profiling data that's
> usable between all compilers. I'm not even sure there's a good way to
> translate between, say, gcov and llvm's format. To make matters more
> complicated, each compiler's format is tightly coupled to a specific
> version of that compiler. And depending on *how* the data is collected
> (e.g. sampling or instrumentation), it may not give us the full
> benefit of FDO/PGO.

I'm thinking that something simple like:

struct arc {
	u64	from;
	u64	to;
	u64	nr;
	u64	cntrs[0];
};

goes a very long way. Stick a header on that says how large cntrs[] is,
and some other data (like load offset and whatnot) and you should be
good.

Combine that with the executable image (say /proc/kcore) to recover
what's @from (call, jmp or conditional branch) and I'm thinking one
ought to be able to construct lots of useful data.

I've also been led to believe that the KCOV data format is not in fact
dependent on which toolchain is used.

> > I'm thinking it might be about time to build _one_ infrastructure for
> > that and define a kernel arc format and call it a day.
> >
> That may be nice, but it's a rather large request.

Given GCOV just died, perhaps you can look at what KCOV does and see if
that can be extended to do as you want. KCOV is actively used and
we actually tripped over all the fun little noinstr bugs at the time.
