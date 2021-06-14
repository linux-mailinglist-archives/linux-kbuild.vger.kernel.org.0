Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8B53A68CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 16:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbhFNOSb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 10:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbhFNOSb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 10:18:31 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD96C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jun 2021 07:16:28 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id p5-20020a9d45450000b029043ee61dce6bso3843882oti.8
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jun 2021 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FBYjVJRS+b/w4pnsYesBjbYpCL3m16xVdTBky4XS4D0=;
        b=VbC94GJ4DfIQmAwxyQpCMvzQjzFuU7+D96764TvBV0xOZvHK0y2l/Cv22fZQPkrEjS
         Qhyzk/QT78EnsWos8WsffbqHz2A9eXnuu9JjXR9X+PdLxj3P+VAlPexiym38RrHeNnlf
         ldwldkgVcse3rIHvqVk12WtjOTiLZvFYxlP/VhoR8TgEE6f2GZ5vajgk3RCMOyChf2w2
         x6nfojz2FJML9kA+MUQuA1B+XfxLIOmSZUhsvhpLPjkbDYhdmnTVTXMqNsfiZoseRKt9
         3OI9nkfmzPaKVoJXOIY3OARtrt/EUJJ2MDRU2fvV8/Q1D8MJqAjr8v4sXg6evBPl70/e
         k5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FBYjVJRS+b/w4pnsYesBjbYpCL3m16xVdTBky4XS4D0=;
        b=cdwomJharXccyc+fk8NpCp9jLKauRV4lg2P5TxmaBv0JmOwvHy5Ue6dlmvkTScy9JS
         6lidbMbjuRjKYn64cXuWiieowRFZ7hKM/Ge+NfoMtgCpfSw6w4e0WesdL3bPptbEOu1Y
         CorhyKbWiHR0ERa4CgVjtjSHVHKAaRXqJ6oTzAIkmh8zWpfjbahNaGeHorSD9AKZpF5Q
         XMPgXbjSS3Oq2piqfr5d9V5Dyym77dX5klTlyMTyT2ZbgJBcrLGjU/ytb50dPMOo7TKw
         Ch/XblnCoe6ublkBpY3rzyFJOsA+AAs0Q3W60NzMM4IOCHI3rJqo+kZwoKEeZvLd1w9k
         L/kg==
X-Gm-Message-State: AOAM533ZbYHp6qAQy07Ol4+My8j8C1rnhf8gmwRkUPH1Pv0q77LKb2JY
        JMl6Tdy8ZCALclQL1Tl0HehmwoINT2vKrdjm5ZquLw==
X-Google-Smtp-Source: ABdhPJy04P/W+yfF08gJxtdwOnS1uTLYOi8I+vr2HeO5DdS0IbVsX1i5lctRMUeHT7e5lJIJbrs7J3CK8E/LTjN9VHc=
X-Received: by 2002:a05:6830:93:: with SMTP id a19mr13523515oto.17.1623680187940;
 Mon, 14 Jun 2021 07:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net> <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net> <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net> <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
 <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net>
In-Reply-To: <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Mon, 14 Jun 2021 16:16:16 +0200
Message-ID: <CANpmjNNnZv7DHYaJBL7knn9P+50F+SOCvis==Utaf-avENnVsw@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Bill Wendling <morbo@google.com>, Kees Cook <keescook@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>, johannes.berg@intel.com,
        oberpar@linux.vnet.ibm.com, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 14 Jun 2021 at 12:45, Peter Zijlstra <peterz@infradead.org> wrote:
[...]
> I've also been led to believe that the KCOV data format is not in fact
> dependent on which toolchain is used.

Correct, we use KCOV with both gcc and clang. Both gcc and clang emit
the same instrumentation for -fsanitize-coverage. Thus, the user-space
portion and interface is indeed identical:
https://www.kernel.org/doc/html/latest/dev-tools/kcov.html

> > > I'm thinking it might be about time to build _one_ infrastructure for
> > > that and define a kernel arc format and call it a day.
> > >
> > That may be nice, but it's a rather large request.
>
> Given GCOV just died, perhaps you can look at what KCOV does and see if
> that can be extended to do as you want. KCOV is actively used and
> we actually tripped over all the fun little noinstr bugs at the time.

There might be a subtle mismatch between coverage instrumentation for
testing/fuzzing and for profiling. (Disclaimer: I'm not too familiar
with Clang-PGO's requirements.) For example, while for testing/fuzzing
we may only require information if a code-path has been visited, for
profiling the "hotness" might be of interest. Therefore, the
user-space exported data format can make several trade-offs in
complexity.

In theory, I imagine there's a limit to how generic one could make
profiling information, because one compiler's optimizations are not
another compiler's optimizations. On the other hand, it may be doable
to collect unified profiling information for common stuff, but I guess
there's little motivation for figuring out the common ground given the
producer and consumer of the PGO data is the same compiler by design
(unlike coverage info for testing/fuzzing).

Therefore, if KCOV's exposed information does not match PGO's
requirements today, I'm not sure what realistically can be done
without turning KCOV into a monster. Because KCOV is optimized for
testing/fuzzing coverage, and I'm not sure how complex we can or want
to make it to cater to a new use-case.

My intuition is that the simpler design is to have 2 subsystems for
instrumentation-based coverage collection: one for testing/fuzzing,
and the other for profiling.

Alas, there's the problem of GCOV, which should be replaceable by KCOV
for most use cases. But it would be good to hear from a GCOV user if
there are some.

But as we learned GCOV is broken on x86 now, I see these options:

1. Remove GCOV, make KCOV the de-facto test-coverage collection
subsystem. Introduce PGO-instrumentation subsystem for profile
collection only, and make it _very_ clear that KCOV != PGO data as
hinted above. A pre-requisite is that compiler-support for PGO
instrumentation adds selective instrumentation support, likely just
making attribute no_instrument_function do the right thing.

2. Like (1) but also keep GCOV, given proper support for attribute
no_instrument_function would probably fix it (?).

3. Keep GCOV (and KCOV of course). Somehow extract PGO profiles from KCOV.

4. Somehow extract PGO profiles from GCOV, or modify kernel/gcov to do so.

Thanks.
