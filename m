Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B763A65FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 13:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235295AbhFNLrc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 07:47:32 -0400
Received: from mail-ej1-f52.google.com ([209.85.218.52]:42534 "EHLO
        mail-ej1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235950AbhFNLq4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 07:46:56 -0400
Received: by mail-ej1-f52.google.com with SMTP id k25so16172416eja.9
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jun 2021 04:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HI8uNQ2N0M5Hhpj6WC1Izp202Fz3OsRq4lT6L+ArKG8=;
        b=k74Pd/awWzo+0vIQa3vSWB4GiHFuz2x/5raEEABcmoRr9iSqr6PUuB8vVwmmfk8LRJ
         dyow7EEnasjGh9+H2SOieqWJRNloMZvc2+yaoqoC+dZybwRaxiFK2X89V8/rRWMnIohO
         0jhjfzxCifMikqa5PogKCoVU9vHX1I7WdevNRGgKFWyThzuj0cxfFHOSmImqCBmRLoPL
         ifOSiwTzvkd2A+zaEfi0t+XTo1bfwzUmTKaWl5UOyrxKMVWgDy/e8tXJ0ZrgFuSiHA1W
         /wKnnSaDdBBi6pvxr7CqZE4dh3VqXl1V6DVXS+3MMrzzG6bAcvaB7bud1S1tuwAu+MsW
         jo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HI8uNQ2N0M5Hhpj6WC1Izp202Fz3OsRq4lT6L+ArKG8=;
        b=ghrIYCnG/lEKPu7zQpFKqrFMebv9MI9TWdfOWWM2R/VyZ/HD3/SFYGIj9oaeo08VND
         RYM6+sIoiZ9KqqbYvMHzTge+L1P9AgtqTFfol7zo2iA2/nIYbb9JthOjYICS3YWpFP93
         L0D1IAoQjxMRzr60guCrHw3mqAxTzNc65rNw9vQxKVp8QHGQZnsy+FdEIsFP2EhXkT7t
         PKFtlVZFvFdoR6LA/ywZkoXBAUoYjnUfkt897MPV+dVioaUCFobr08ReDehTnv9fqBnw
         Jhc64VzCqcU3ID/nPjKqt9/EypJE+puQxt+WLm0wG8B3XRvXby3uH2BbA6PsanAKaJ6y
         Kz2w==
X-Gm-Message-State: AOAM5329cd4ylha1Su6nz1n/9WVdb9VJYhhJ22yL1ID8CKRhaXQrLUXV
        nxtvisf7RAuYfBQvlO/aJcw4Lb2McFoFZWdri3wK
X-Google-Smtp-Source: ABdhPJz6Z4iIYp1oXXANY4EX4jTMs8gk4NxJR68WJ8DijcN3voOrphp/2Zl/zcDiOVLEI/B7vb8XytAwA5hWKrsfgLo=
X-Received: by 2002:a17:906:7188:: with SMTP id h8mr15017910ejk.529.1623671015979;
 Mon, 14 Jun 2021 04:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net> <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net> <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net> <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
 <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net>
In-Reply-To: <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net>
From:   Bill Wendling <morbo@google.com>
Date:   Mon, 14 Jun 2021 04:43:24 -0700
Message-ID: <CAGG=3QW9W0H-FUt2bCAf2EbRqNa5bXv5-RqYCc8guKX=4C1KPA@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Peter Zijlstra <peterz@infradead.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 14, 2021 at 3:45 AM Peter Zijlstra <peterz@infradead.org> wrote:
> On Mon, Jun 14, 2021 at 02:39:41AM -0700, Bill Wendling wrote:
> > On Mon, Jun 14, 2021 at 2:01 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > I understand that the compilers actually generates radically different
> > > instrumentation for the various cases, but essentially they're all
> > > collecting (function/branch) arcs.
> > >
> > That's true, but there's no one format for profiling data that's
> > usable between all compilers. I'm not even sure there's a good way to
> > translate between, say, gcov and llvm's format. To make matters more
> > complicated, each compiler's format is tightly coupled to a specific
> > version of that compiler. And depending on *how* the data is collected
> > (e.g. sampling or instrumentation), it may not give us the full
> > benefit of FDO/PGO.
>
> I'm thinking that something simple like:
>
> struct arc {
>         u64     from;
>         u64     to;
>         u64     nr;
>         u64     cntrs[0];
> };
>
> goes a very long way. Stick a header on that says how large cntrs[] is,
> and some other data (like load offset and whatnot) and you should be
> good.
>
> Combine that with the executable image (say /proc/kcore) to recover
> what's @from (call, jmp or conditional branch) and I'm thinking one
> ought to be able to construct lots of useful data.
>
> I've also been led to believe that the KCOV data format is not in fact
> dependent on which toolchain is used.
>
Awesome! I await your RFC on both the gcc and clang mailing lists.

-bw

> > > I'm thinking it might be about time to build _one_ infrastructure for
> > > that and define a kernel arc format and call it a day.
> > >
> > That may be nice, but it's a rather large request.
>
> Given GCOV just died, perhaps you can look at what KCOV does and see if
> that can be extended to do as you want. KCOV is actively used and
> we actually tripped over all the fun little noinstr bugs at the time.
