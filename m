Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7368A3A50B7
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 22:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbhFLVAI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 17:00:08 -0400
Received: from mail-ed1-f47.google.com ([209.85.208.47]:34418 "EHLO
        mail-ed1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhFLVAI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 17:00:08 -0400
Received: by mail-ed1-f47.google.com with SMTP id cb9so41309479edb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Jun 2021 13:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OSnBn94ZP8p/1/buUtxgjO9fzVQ2s0+6fGFuy2vE7IA=;
        b=L8JRkLCoAJMOPS9X4wb9Vx9xV6mJeXX9OnrLLtLRj8v0O6TK1m6d3Q8IAUBuTVihqm
         Zr1Qnd26IEuwn8YxasVLvOa4MerfYNGg2/oBYidoU5xZitx7iFIEZCn/DreAIv9sGfzN
         QcmFY+jvINuN9oNXV0pfFvmnxTTgK70KhrTmn+U3JxmLtMkbrGjAKLG5QZdAyKz6fU4U
         xL6bxG9d1GFxenrPA8v32BZTHIyjHCh2JXfWr1pjHaoZ9gisaTtecsq9zHcDl38sxoJq
         iyTlaRLnjgAWXh05YQwRMC3/gwwS24HZ5ebqnqWuCuqdHeB41F++mXaSkBKOCF9u+fJD
         KgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSnBn94ZP8p/1/buUtxgjO9fzVQ2s0+6fGFuy2vE7IA=;
        b=hHD6nXe/p+rQpKonzXPKBDjjenm5kK3auRk32u1C2uzpJosAWZOrq2B0b+XQT05EWV
         4Kb4FfZGGnc767c4XAt7AVwlnlvtG3iLI07Li3Azx8q9cOPkMNAtlwaBlXCVhGjLcTKG
         qQDaFsPpaWsELKdxcHk3F3CpEjSsCgDJVkfanjAPWhEhQybDc/o6bDnG2et4uhzz2+MX
         sWV1ZPvQVaWMhAxYkDr75siizJfRgLNYDqf1dDp+Okuze1AQnClCS70CWPNEsPfjed3A
         oNnJxcpSz6eJudMxlfPycScrKJR6VMh2QKLjQhnka73G+Anruo1ksbO8heIAlMsTI0/I
         0/Sg==
X-Gm-Message-State: AOAM530lreUChKmdUXFjgc2Us8iuzcREfooZLwoDBzgMVOpGDekAC691
        PFZoBaPhJ122z6ezlLi0jIzKDER6wb5zF4GkApjF
X-Google-Smtp-Source: ABdhPJyYJE2ISa6cLinTCpUVNh0FFrEBCrHI/CzUhsFOm13Z/Pu1dGmJFBRBy3PzDSdVV0nIAMmEfnLQ3ipF5C9FdxA=
X-Received: by 2002:a05:6402:946:: with SMTP id h6mr9974082edz.261.1623531412092;
 Sat, 12 Jun 2021 13:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net> <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net> <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
In-Reply-To: <20210612202505.GG68208@worktop.programming.kicks-ass.net>
From:   Bill Wendling <morbo@google.com>
Date:   Sat, 12 Jun 2021 13:56:41 -0700
Message-ID: <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
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
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 12, 2021 at 1:25 PM Peter Zijlstra <peterz@infradead.org> wrote:
> On Sat, Jun 12, 2021 at 12:10:03PM -0700, Bill Wendling wrote:
> Yes it is, but is that sufficient in this case? It very much isn't for
> KASAN, UBSAN, and a whole host of other instrumentation crud. They all
> needed their own 'bugger-off' attributes.
>
> > > We've got KCOV and GCOV support already. Coverage is also not an
> > > argument mentioned anywhere else. Coverage can go pound sand, we really
> > > don't need a third means of getting that.
> > >
> > Those aren't useful for clang-based implementations. And I like to
> > look forward to potential improvements.
>
> I look forward to less things doing the same over and over. The obvious
> solution if of course to make clang use what we have, not the other way
> around.
>
That is not the obvious "solution".

> > > Do you have actual numbers that back up the sampling vs instrumented
> > > argument? Having the instrumentation will affect performance which can
> > > scew the profile just the same.
> > >
> > Instrumentation counts the number of times a branch is taken. Sampling
> > is at a gross level, where if the sampling time is fine enough, you
> > can get an idea of where the hot spots are, but it won't give you the
> > fine-grained information that clang finds useful. Essentially, while
> > sampling can "capture the hot spots very well", relying solely on
> > sampling is basically leaving optimization on the floor.
> >
> > Our optimizations experts here have determined, through data of
> > course, that instrumentation is the best option for PGO.
>
> It would be very good to post some of that data and explicit examples.
> Hear-say don't carry much weight.

Should I add measurements from waving a dead chicken over my keyboard?
I heard somewhere that that works as well. Or how about a feature that
hasn't been integrated yet, like using the perf tool apparently? I'm
sure that will be worth my time. You can't just come up with a
potential, unimplemented alternative (gcov is still a thing and not
using "perf") and expect people to dance to your tune.

I could give you numbers, but they would mean nothing to you, and I
suspect that you would reject them out of hand because it may not
benefit *everything*. The nature of FDO/PGO is that it's targeted to
specific tasks.

For example, Fangrui gave you numbers, and you rejected them out of
hand. I've explained to you why instrumentation is better than
sampling (at least for clang). Fangrui gave you numbers. Let's move on
to something else.

Now, for the "nointr" issue. I'll see if we need an additional change for that.

-bw
