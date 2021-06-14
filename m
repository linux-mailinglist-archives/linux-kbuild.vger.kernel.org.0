Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84F73A6DFC
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 20:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbhFNSLa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 14:11:30 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:37539 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235299AbhFNSL3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 14:11:29 -0400
Received: by mail-lj1-f176.google.com with SMTP id k8so4477403lja.4
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Jun 2021 11:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q/XB3mh4kqA0R3Mq5xG+IQPk2u072QCh1Aa1N8SVimI=;
        b=gNoMBqwIekxVN4ZTQA2lb+R20pn6emj+cRv+063F8GUQEh+FfehSxGO7Xfa3xVcU3y
         JNiHA/bieZlQ0jgmetM3eerqFAtGCVDc8wlzQ3M/mwfNPBGiWljejiloap0qpolaWRwM
         zyFvn32ZAv4OTwgqbKcKUFRfB2w3GYsBl0Ohsk903f3S2aJ8ihqajen4jcWO3pTZeTl4
         m993LukbpLj1Ytei7kh8YWEerFqD3osLEVw7AF8D6GGia1vZCt8v8SzbH6rbqhKztVFJ
         7UMl8nAKNXJuvuZDmibTlloR0VSSNTu7UEsrHWjpM6yBK+GGIpZf5DhbG3UVlYNesjYH
         dONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q/XB3mh4kqA0R3Mq5xG+IQPk2u072QCh1Aa1N8SVimI=;
        b=ZUICL9C7NjizGf+ZWz3ODMNKyD4NUt/O9wihoKLwtwPzZ+hCrIEN40nhoCWMbOfpbY
         bMMSQ2XznhxFagOY+bT+otCTjw97Fn9tWQtX0i2pWlXrid32z69bKZncIOPi57zUlqnA
         tQB6kuNR/nj59GChnohlTjQmYZ1WBQ/zQ4j4ADoC5bs6UpHZJqdNfB51qg1wQqHmVpOF
         QQR7VEYfbqoyMceuLdDIySLUruRDghJJ6J9Vl7K6UGCrE8G3FUvzF2D4RWRdvXHFo6dQ
         1OiQYD8zxbqcsGnaa4Lsteflo6V+d/aeP9l0J6aiLyCGhlSn/3pM12ISo2nWW9G7garT
         cjug==
X-Gm-Message-State: AOAM531n2Pe+wz9Cd8l7HYrMRiD0ZFUqomR8fNbyh9LdmfKadXGuvLPG
        5jNb1AunOJaus9K8Ppk9d3+cn8cN5xUtSlFcB0wcLg==
X-Google-Smtp-Source: ABdhPJxKUKdlT+gTIv6tps2+MYGOK2jI4OTbw6VDol/+bdJyGm1oEKl+AJBHsonScc4F4P1rTyqrJq3Fw4OFoMUrzZ0=
X-Received: by 2002:a05:651c:1111:: with SMTP id d17mr14547090ljo.116.1623694091627;
 Mon, 14 Jun 2021 11:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net> <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
 <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net> <CANpmjNNnZv7DHYaJBL7knn9P+50F+SOCvis==Utaf-avENnVsw@mail.gmail.com>
 <202106140817.F584D2F@keescook> <20210614153545.GA68749@worktop.programming.kicks-ass.net>
 <202106140921.5E591BD@keescook>
In-Reply-To: <202106140921.5E591BD@keescook>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 14 Jun 2021 11:07:59 -0700
Message-ID: <CAKwvOdkiQCuWB7VrQ4T-OCdoNfqKhpLx_jtBQ_uyjVVwHSOc=A@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Marco Elver <elver@google.com>,
        Bill Wendling <morbo@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        oberpar@linux.vnet.ibm.com, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 14, 2021 at 9:23 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Jun 14, 2021 at 05:35:45PM +0200, Peter Zijlstra wrote:
> > On Mon, Jun 14, 2021 at 08:26:01AM -0700, Kees Cook wrote:
> > > So, AFAICT, the original blocking issue ("PGO does not respect noinstr")
> > > is not actually an issue (noinstr contains notrace, which IS respected
> > > by PGO[2]), I think this is fine to move forward.
> >
> > It is *NOT*: https://godbolt.org/z/9c7xdvGd9
> >
> > Look at how both compilers generate instrumentation in the no_instr()
> > function.
>
> Well that's disappointing. I'll put this on hold until Clang can grow an
> appropriate attribute (or similar work-around). Thanks for catching
> that.

Cross referencing since these two threads are related.
https://lore.kernel.org/lkml/CAKwvOdmPTi93n2L0_yQkrzLdmpxzrOR7zggSzonyaw2PGshApw@mail.gmail.com/
-- 
Thanks,
~Nick Desaulniers
