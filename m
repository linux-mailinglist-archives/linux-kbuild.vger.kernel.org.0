Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC5C461D5C
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Nov 2021 19:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348732AbhK2SOj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Nov 2021 13:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236455AbhK2SMj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Nov 2021 13:12:39 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349FAC03AD7C
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Nov 2021 06:43:12 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id t19so35048747oij.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Nov 2021 06:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3mz1HPmHbMNrW+p+9eQAxOprfgUAji2Y3fPOhA732u0=;
        b=UYFA5+Kj7tvA2GXd53dZLzAwlSi6l7w/hTEzJ3H8A+QSaBrwkIe8WweXjIbXj3BELl
         eEBahNbVY5hxEA+m1Zsm/zHAH7vuo7iO9Gl/UAaFYO0N+uctB9MXeGvMxWld668gE72X
         ZpkrPa3wLVOeRFpp9PUS3nuus8d3b2MdtaCDRllfNTF1MiJRcjnyweEdXOB+gejWKaba
         rstv4lNGXUjQ1y0SH14O3YJdiUm9YqCn1bXP5QKKI+H7z3Pivs8/wkzEzplwbBGSVRfD
         q6IFlC/cNjnDA+eV1n9jQaWwaWtoxvLRocDUtogezJf9caNQXvpLif2bT2/FBaAkE/GO
         4eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3mz1HPmHbMNrW+p+9eQAxOprfgUAji2Y3fPOhA732u0=;
        b=c1AqOnVD20xEUw6+co8R5bn24AwbaOQ9kAmhZc0u8Zn8HkuorTQE3KQc17ncnsKAhC
         NEYBYWe0qeaFQb7XVEHoL4sdfwbTYtOCFDuTPVLR6HDEG/5khAX6/kNhPV+/ud3G+3FQ
         zQuzseUhC9DKQYpNxO8GITszIeuDQL6eJMcvB/HtT/tKYPiC4vd80YIN88Cn5ebdrk9i
         awvqxKrl0VwV+zAQTX+/MdoXcNz0jc5Upg8vwOzG2vh0lEJXcj92tDybHgtpYjAtgqVr
         rS240dLRghgFTLPmiPz4jGIwoBMxUi0+MBshWv/OHVgargb6ylZ/H2V6FuNNlbIoyNpL
         hWsw==
X-Gm-Message-State: AOAM5310q7SQtktBaUEmfIHRSP9YS6wrQZtQy6P/4gGrJHW3GE68tLZY
        +QtujBfFsfzbN7EUWjE5dgIkXffG67KXoBLXTnyEqQ==
X-Google-Smtp-Source: ABdhPJxzBms38b97VrAR+iOn0cM/VBioe+AWcYnISh3nXwb94CqvfvGOQZiwp9KrhWts1M5WTIvE6H8tN6RT2BjBeuQ=
X-Received: by 2002:a05:6808:1903:: with SMTP id bf3mr41684658oib.7.1638196991401;
 Mon, 29 Nov 2021 06:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20211118081027.3175699-1-elver@google.com> <20211118081027.3175699-4-elver@google.com>
 <YaSTn3JbkHsiV5Tm@boqun-archlinux> <YaSyGr4vW3yifWWC@elver.google.com> <YaTjJnl+Wc1qZbG/@boqun-archlinux>
In-Reply-To: <YaTjJnl+Wc1qZbG/@boqun-archlinux>
From:   Marco Elver <elver@google.com>
Date:   Mon, 29 Nov 2021 15:42:59 +0100
Message-ID: <CANpmjNMY7nhSq6aBLMusvbaMQ3LFJ=beHbDvbudg9B-NoFxEpA@mail.gmail.com>
Subject: Re: [PATCH v2 03/23] kcsan: Avoid checking scoped accesses from
 nested contexts
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 29 Nov 2021 at 15:27, Boqun Feng <boqun.feng@gmail.com> wrote:
[...]
> > This case is also possible:
> >
> >       static int v;
> >       static int x;
> >       int foo(..)
> >       {
> >               ASSERT_EXCLUSIVE_ACCESS_SCOPED(v);
> >               x++; // preempted during watchpoint for 'v' after checking x++
> >       }
> >
> > Here, all we need is for the scoped access to be checked after x++, end
> > up with a watchpoint for it, then enter scheduler code, which then
> > checked 'v', sees the conflicting watchpoint, and reports a nonsensical
> > race again.
> >
>
> Just to be clear, in both examples, the assumption is that 'v' is a
> variable that scheduler code doesn't access, right? Because if scheduler
> code does access 'v', then it's a problem that KCSAN should report. Yes,
> I don't know any variable that scheduler exports, just to make sure
> here.

Right. We might miss such cases where an ASSERT_EXCLUSIVE*_SCOPED()
could have pointed out a legitimate race with a nested context that
share ctx, like in scheduler, where the only time to detect it is if
some state change later in the scope makes a concurrent access
possible from that point in the scope. I'm willing to bet that there's
an extremely small chance we'll ever encounter such a case (famous
last words ;-)), i.e. the initial check_access() in
kcsan_begin_scoped_access() wouldn't detect it nor would the problem
manifest as a regular data race.

Thanks,
-- Marco
