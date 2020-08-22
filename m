Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837C124E413
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 02:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgHVAMj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 20:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgHVAMg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 20:12:36 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58B7C061574
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:12:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 74so1834275pfx.13
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8s688KoZxryWBri/Ybpi1A7SGlEThSLqWoaty4kYg0c=;
        b=pliY5fueHpr0mfqh5IExqAIqLw47d7YXsrz+dL7f3lv7TxV6ISyFx1VfOvN5YwPQzS
         koZVpF0XpR03lKkCVynFGRhEl9PwxlWSBHs5ZkQNG/oiyqcYHCTH21iD5IajYe1I5AB2
         HmFHks1vubeDTItYred4nHLKUodffZZiVrsPAMns+Fwv94PmhOOcmPVVWZuvrR5OUOgH
         4KGAylLrzDGXzNsn3+A1IO/tL3ANsqkko9jpDOZtsgjMo6xQrO02Cmig9TLzPhqOUJE5
         Dr9aRItUMgFqomMEc3viE/hVmcN5OsmVtJhThfyk3tt8giaXObtKBvxCm7tt+Cl2ig7G
         gXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8s688KoZxryWBri/Ybpi1A7SGlEThSLqWoaty4kYg0c=;
        b=Cs8qwfiM9FjQJDDRl3SriUrmP/CmCZHLyWyiFTcsdCyTvP8tqiFnSsqsmu5oyLnrt/
         hQVSUNplV6GzFONFEpvpig88xG3ZDdVUmNlopyEAfFLaKmdH0jzL3RrskNRST3awmGum
         gh2ScZ05kL0VaVdmIi5bvq2+MoFIio5GbM6mLbzP6TF1jnh8t5jLnz9F8sKRDSPwQ0WX
         tWOpktmvBOkZmtREj+yXKEBtfkqDEFaV68LbzjERHhyLGT8/bDdygbHsyzscWp0jEOC8
         ePRFFbzwQpkbQ+RxBvShf/D/1EbdaqNHnb0FYIgHU9wEb8BRmKYbfNm+SDPg4hnjdZGa
         T+gg==
X-Gm-Message-State: AOAM533BNHNZck75KPeHbWmMbQNeckPCwidsJuwu0oXuXTl9FC9meMgt
        5QF9FXG/+NtJDI6fT3acxGE9wECMa5bnhJSeK7ekLQ==
X-Google-Smtp-Source: ABdhPJx4OQ2oIaUfD6b7Hk/E00DXpsa2ZvocLwAvK2YDA5XelW2Vz0L5gc1FXk572L3kyPJNj/iwA2A3rBu+1Cpmww8=
X-Received: by 2002:a63:7d8:: with SMTP id 207mr4088742pgh.263.1598055155611;
 Fri, 21 Aug 2020 17:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan> <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
 <20200821172935.GA1411923@rani.riverdale.lan> <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
 <20200821195712.GB1475504@rani.riverdale.lan> <CAHk-=wgXHhN5MSOLeE_7rMPoGknrSxmOOJVLBa4jkz38J4gHgg@mail.gmail.com>
In-Reply-To: <CAHk-=wgXHhN5MSOLeE_7rMPoGknrSxmOOJVLBa4jkz38J4gHgg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 21 Aug 2020 17:12:23 -0700
Message-ID: <CAKwvOdnHZfVz8grK-SD6jTT1ggQNQ-RRduRdAG0nShqeitpgpg@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 2:39 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Aug 21, 2020 at 12:57 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > Look, four stores into memset(), yeah that's a bit weird. I didn't think
> > you meant "four" literally. But in any case, that has nothing to do with
> > the topic at hand. It would be just as bad if it was a 16-byte structure
> > being initialized with an out-of-line memset() call.
>
> Actually, I mis-remembered. It wasn't four stores.
>
> It was two.
>
> We have this lovely "sas_ss_reset()" function that initializes three
> fields in a structure (two to zero, one to '2').
>
> And we used it in a critical place that didn't allow function calls
> (because we have magic rules with the SMAP instructions).
>
> And clang turned the initalization into a memset().  Which then
> triggered our "you can't do that here" check on the generated code.
>
> This is the kind of special rules we sometimes can have for code
> generation, where the compiler really doesn't understand that no, you
> can't just replace this code sequence with a function call, because
> there are things going on around it that really mean that the code
> should be generated the way we wrote it.

For more context for folks at home eating popcorn and enjoying the
show: https://github.com/ClangBuiltLinux/linux/issues/876#issuecomment-613049480.
And that was specifically with KASAN enabled and doesn't appear to be
common behavior in clang otherwise (higher threshold). Why the
heuristics change for when it seems to be more profitable to roll
assignment of contiguous members of the same struct to the same value
into a memset, and 2 longs seems to be the threshold for KASAN, I
don't know.  But I agree that should be fixed on the compiler side,
which is why I haven't been pushing the kernel workaround.

Everyone's just too busy right now; folks working on kernel sanitizers
have their hands full with KCSAN or MTE (on armv8.5) or default
initialization, and I'm trying to keep the build green (ie. this
series, well the v2 below, and
https://lore.kernel.org/lkml/20200812004308.1448603-1-nivedita@alum.mit.edu/
would be much appreciated), and get ready for plumbers, and wrap up my
intern's project, and do yearly performance reviews at my day job, and
million other things.

I've filed https://bugs.llvm.org/show_bug.cgi?id=47280 to discuss more
the ability to opt into builtins from a freestanding environment.

Now that Arvind has provided an excellent analysis of how the builtin
functionality works (bookmarked:
https://lore.kernel.org/lkml/20200821172935.GA1411923@rani.riverdale.lan/),
were there still objections to add the -fno-builtin-stpcpy flags for
clang to the Makefile?  I would like to get
https://lore.kernel.org/lkml/20200819191654.1130563-1-ndesaulniers@google.com/T/#m76c445f9645f62bc6ffc48ca26949725235688a0
landed so the build is not red for another week.
-- 
Thanks,
~Nick Desaulniers
