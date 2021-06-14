Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203833A6A37
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 17:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbhFNP33 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 11:29:29 -0400
Received: from mail-pj1-f49.google.com ([209.85.216.49]:35699 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233724AbhFNP3G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 11:29:06 -0400
Received: by mail-pj1-f49.google.com with SMTP id fy24-20020a17090b0218b029016c5a59021fso10333985pjb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jun 2021 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bcx1hZnVCYvsuGOQgk+jA811yV1iF9Tsc5R2/Wvf6PA=;
        b=Y6OLntP0geemb8Nz9JjVtcKVBsdGG35jU3eYPpYS9bQJxQvbZkfcyMMlrh/HH04Y6w
         Oe9FQP4EGgS3kf3NpY+ClRZ2aqrnbmnPAjZv6s26ReE4xY8Uw6PLmIEgvwUnINHItGv1
         9DZJ5Y5UDiCTh8VBT3ntK5NI4YiWJcKYwKqYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bcx1hZnVCYvsuGOQgk+jA811yV1iF9Tsc5R2/Wvf6PA=;
        b=cKbXQfP2NwRpY9DP3tWwSBTSPPnid+Z4GqYpYL8srMw3ZUO5Rlmz60pPnbMjMAgeyo
         geiw2OuvtBYa4z6k6gjt8E+s1mDwkI8vLKpqbO3O2UzWkTCUqZbqHsbPfmALarQRS4m7
         3H0viYSdPvJ4twBwjLPpmRfYZsGwnETqg579JrA3N6W3SSP4T8paJO+B208Dls70hsWH
         Rsk9ojJ2XGrjgKuCpgnn66Y/YOoMKdz+IGk2n8QMItZEOtozCC6L64Yp7mkDcdy1+isT
         /ncVN2qvdhq4ZJEShYpkgMclwedRdQNBujSZ6vsy0qAgc7lWgBQfcGlWaE3xd6UGkUdI
         8IiQ==
X-Gm-Message-State: AOAM532S11RpCTiFGTxjXUdkoKWCCUg28340Mxy1t9VFnK9i2Bmzm0q5
        kXRHJCqaax+VnsfAUSPpMXyx0w==
X-Google-Smtp-Source: ABdhPJx5Kn+AoWunoG1/b1o7/X32QLfEpD4izGhpvHsO6yITGe/4DAt53UUWQHkjZd0DSnub82KSZw==
X-Received: by 2002:a17:90b:3709:: with SMTP id mg9mr11738509pjb.47.1623684363165;
        Mon, 14 Jun 2021 08:26:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m134sm13253034pfd.148.2021.06.14.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 08:26:02 -0700 (PDT)
Date:   Mon, 14 Jun 2021 08:26:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Marco Elver <elver@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <morbo@google.com>,
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
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <202106140817.F584D2F@keescook>
References: <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
 <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net>
 <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
 <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net>
 <CANpmjNNnZv7DHYaJBL7knn9P+50F+SOCvis==Utaf-avENnVsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNnZv7DHYaJBL7knn9P+50F+SOCvis==Utaf-avENnVsw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 14, 2021 at 04:16:16PM +0200, 'Marco Elver' via Clang Built Linux wrote:
> On Mon, 14 Jun 2021 at 12:45, Peter Zijlstra <peterz@infradead.org> wrote:
> [...]
> > I've also been led to believe that the KCOV data format is not in fact
> > dependent on which toolchain is used.
> 
> Correct, we use KCOV with both gcc and clang. Both gcc and clang emit
> the same instrumentation for -fsanitize-coverage. Thus, the user-space
> portion and interface is indeed identical:
> https://www.kernel.org/doc/html/latest/dev-tools/kcov.html
> 
> > > > I'm thinking it might be about time to build _one_ infrastructure for
> > > > that and define a kernel arc format and call it a day.
> > > >
> > > That may be nice, but it's a rather large request.
> >
> > Given GCOV just died, perhaps you can look at what KCOV does and see if
> > that can be extended to do as you want. KCOV is actively used and
> > we actually tripped over all the fun little noinstr bugs at the time.
> 
> There might be a subtle mismatch between coverage instrumentation for
> testing/fuzzing and for profiling. (Disclaimer: I'm not too familiar
> with Clang-PGO's requirements.) For example, while for testing/fuzzing
> we may only require information if a code-path has been visited, for
> profiling the "hotness" might be of interest. Therefore, the
> user-space exported data format can make several trade-offs in
> complexity.

This has been my primary take-away: given that Clang's PGO is different
enough from the other things and provides more specific/actionable
results, I think it's justified to exist on its own separate from the
other parts.

> In theory, I imagine there's a limit to how generic one could make
> profiling information, because one compiler's optimizations are not
> another compiler's optimizations. On the other hand, it may be doable
> to collect unified profiling information for common stuff, but I guess
> there's little motivation for figuring out the common ground given the
> producer and consumer of the PGO data is the same compiler by design
> (unlike coverage info for testing/fuzzing).
> 
> Therefore, if KCOV's exposed information does not match PGO's
> requirements today, I'm not sure what realistically can be done
> without turning KCOV into a monster. Because KCOV is optimized for
> testing/fuzzing coverage, and I'm not sure how complex we can or want
> to make it to cater to a new use-case.
> 
> My intuition is that the simpler design is to have 2 subsystems for
> instrumentation-based coverage collection: one for testing/fuzzing,
> and the other for profiling.
> 
> Alas, there's the problem of GCOV, which should be replaceable by KCOV
> for most use cases. But it would be good to hear from a GCOV user if
> there are some.
> 
> But as we learned GCOV is broken on x86 now, I see these options:
> 
> 1. Remove GCOV, make KCOV the de-facto test-coverage collection
> subsystem. Introduce PGO-instrumentation subsystem for profile
> collection only, and make it _very_ clear that KCOV != PGO data as
> hinted above. A pre-requisite is that compiler-support for PGO
> instrumentation adds selective instrumentation support, likely just
> making attribute no_instrument_function do the right thing.

Right. I can't speak to GCOV, but KCOV certainly isn't PGO.

> 2. Like (1) but also keep GCOV, given proper support for attribute
> no_instrument_function would probably fix it (?).
> 
> 3. Keep GCOV (and KCOV of course). Somehow extract PGO profiles from KCOV.
> 
> 4. Somehow extract PGO profiles from GCOV, or modify kernel/gcov to do so.

If there *is* a way to "combine" these, I don't think it makes sense
to do it now. PGO has users (and is expanding[1]), and trying to
optimize the design before even landing the first version seems like a
needless obstruction, and to likely not address currently undiscovered
requirements.

So, AFAICT, the original blocking issue ("PGO does not respect noinstr")
is not actually an issue (noinstr contains notrace, which IS respected
by PGO[2]), I think this is fine to move forward.

-Kees

[1] https://lore.kernel.org/lkml/20210612032425.11425-1-jarmo.tiitto@gmail.com/
[2] https://lore.kernel.org/lkml/CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com/

-- 
Kees Cook
