Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C453A65ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 13:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbhFNLqG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 07:46:06 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:39628 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236866AbhFNLoc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 07:44:32 -0400
Received: by mail-ed1-f52.google.com with SMTP id dj8so46044810edb.6
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jun 2021 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Khk9VJiAZEUo5jow78IwItFdk7LfK4jmTWSp67zs44=;
        b=GOcz1YcHwn9vgKrtti2m3vYVfzrDbyOPJ4rqWNtz5qRjBuNylB9OmfA+OA851kfhOd
         BF0XxYRjtjYnmPF/YS37wERJomtTZfzB38tGS+6n+pCpdSFhxJnUSVgm82ewx33tcdl/
         vLLvnBF5Ve1MG1pM2zXwRHRAFPwIJJfrFgR5Ygjx6MBdMiwxgX3Q8B1LvMsRjkTz8CTQ
         MOmBG+TPI2AFgOJCaehq32t79EG7CBA18uQa3bal0btKG6YYTbLhtNhO4N2210c8cNY4
         ufxqnAg7dCaNM+TcVX0XYjw+moDzfHkRWqFuPWM2YQJd+0dSMcUq3qlTsgsy6D/FE1B3
         8eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Khk9VJiAZEUo5jow78IwItFdk7LfK4jmTWSp67zs44=;
        b=A5BwJizG0imfMbpwqYZcNIkS1VehHiAobv+LPQOyWJIumf5y4iDXFmM161jbghUUAB
         /utBqfsG2H5XQO5s1a8U+CF97Xk6hNyZK4Iy1n0RAlQ5ZN8spdqYucuz/tnCpBX3M2YS
         9NoJiXb/KfzLtJH8RQSaHz5qaalBOpIysNNq1dCa9RfbnTlgoTu+1egk/MVnaf9CGVpi
         Dt34bIs8vlZrTC2erl95/ELMYoUn5Uviiabx3jc82zVUxq3uojXP/RSDqWyEMmulRroP
         g4FcNkq5RLjAcQtjLykiHv9qjgZgvl4VrNiPojpk0Dh52j5XiBn/oEX5I/iKlnvWWN33
         tObA==
X-Gm-Message-State: AOAM533wFz8zxDIAQte98+5n/0zY1wwxf/ZmIv4mb+G7C6s7rgKS5GyL
        pyB+4+muEXDa1JTNnAjJTunLG9DbiJcfGlJbzc7K
X-Google-Smtp-Source: ABdhPJyhQe4FspCtePZL4R+lsIGJyMDxloE0ZMAT1bxKdZe0dGF+U6TxsG6Fv6fhzpvKMieNH1Ah5Oi1lMk6W8RARPU=
X-Received: by 2002:aa7:dc42:: with SMTP id g2mr16365775edu.362.1623670873184;
 Mon, 14 Jun 2021 04:41:13 -0700 (PDT)
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
Date:   Mon, 14 Jun 2021 04:41:01 -0700
Message-ID: <CAGG=3QVqbuhocgx0sJmqEkTkHo0Q=K5+7+2X6ONvcX7cVZc1+w@mail.gmail.com>
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
>
> > > Because having GCOV, KCOV and PGO all do essentially the same thing
> > > differently, makes heaps of sense?
> > >
> > It does when you're dealing with one toolchain without access to another.
>
> Here's a sekrit, don't tell anyone, but you can get a free copy of GCC
> right here:
>
>   https://gcc.gnu.org/
>
> We also have this linux-toolchains list (Cc'ed now) that contains folks
> from both sides.
>
Your sarcasm is not useful.

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
> > > I'm thinking it might be about time to build _one_ infrastructure for
> > > that and define a kernel arc format and call it a day.
> > >
> > That may be nice, but it's a rather large request.
>
> Given GCOV just died, perhaps you can look at what KCOV does and see if
> that can be extended to do as you want. KCOV is actively used and
> we actually tripped over all the fun little noinstr bugs at the time.
