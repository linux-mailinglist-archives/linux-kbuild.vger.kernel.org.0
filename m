Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2D73A6AD6
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 17:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbhFNPs7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 11:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233591AbhFNPsy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 11:48:54 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2777C061574;
        Mon, 14 Jun 2021 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=QYZbYwbmFAlPHZAyueGumfXzbFC24Yyq8ZlF/TwUjkw=; b=ng9emBskU15gYywjflfBygUUYq
        eZHcqnywd14BX7LrL+alDCm0LnySQDWq4iU5112HvNNg8M9WeWAFpHtcnCNy1m7/RAtd3uoU5kHqx
        3n7b//QR34Ya51Ibwh7AL+Hrg5Pu9c8AXHQ1J48AC8yPEdDxiXY1NDtNuxvlJyClCAibpqq0jSpgX
        T8ugRG9ZgSkfhlWL07cp8RL/10viIyiH/mJg0UtzLFLJJ17JbOW5q4EEFgngzlM4uWdx4u8Lf7A3m
        l9AOVyLGrfjESKUHcACVgTEINhvOvr3+gjTRoIw3OE0eUSuUFnG5NKtzvzGFg6XQqqV5mOnWnT/Ft
        Dh/UFbWw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lsonJ-0074ny-On; Mon, 14 Jun 2021 15:46:40 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id CF1C59831CA; Mon, 14 Jun 2021 17:46:39 +0200 (CEST)
Date:   Mon, 14 Jun 2021 17:46:39 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Marco Elver <elver@google.com>, Bill Wendling <morbo@google.com>,
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
Message-ID: <20210614154639.GB68749@worktop.programming.kicks-ass.net>
References: <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net>
 <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
 <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net>
 <CANpmjNNnZv7DHYaJBL7knn9P+50F+SOCvis==Utaf-avENnVsw@mail.gmail.com>
 <202106140817.F584D2F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106140817.F584D2F@keescook>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 14, 2021 at 08:26:01AM -0700, Kees Cook wrote:
> > 2. Like (1) but also keep GCOV, given proper support for attribute
> > no_instrument_function would probably fix it (?).
> > 
> > 3. Keep GCOV (and KCOV of course). Somehow extract PGO profiles from KCOV.
> > 
> > 4. Somehow extract PGO profiles from GCOV, or modify kernel/gcov to do so.
> 
> If there *is* a way to "combine" these, I don't think it makes sense
> to do it now. PGO has users (and is expanding[1]), and trying to
> optimize the design before even landing the first version seems like a
> needless obstruction, and to likely not address currently undiscovered
> requirements.

Even if that were so (and I'm not yet convinced), the current proposal
is wedded to llvm-pgo, there is no way gcc-pgo could reuse any of this
code afaict, which then means they have to create yet another variant.

Sorting this *before* the first version is exactly the right time.

Since when are we merging code when the requirements are not clear?

Just to clarify:

Nacked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

For all this PGO crud.
