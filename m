Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 182AE2512BC
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Aug 2020 09:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgHYHK5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Aug 2020 03:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729410AbgHYHKt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Aug 2020 03:10:49 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B53FC061755
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2020 00:10:49 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l191so4077381pgd.5
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2020 00:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TTgfUq1fGiGTBOtF7D+zM11uTAbbvBDC7L57nNCRjH8=;
        b=ThvdxAPM6oP8ehCOHc0veHlhphl+pbTwqIrZGdY8mZx6UJUhatbGlqTG6ZW9wJpOG3
         dQWBIobN+JUrlpnC+H9i9XMKmPsW+GiBL1JXmLRBx9BdCnuKpXgeKIRIIDlKJSALQBE9
         +PsUGOpRDrrWv+KAvlgl617R1C8YK6QldJ4NgfhXyWvoNJcibKfhqBizKaqoGNeWe51g
         u5U6YhxgA0gX4ZttwH9fWCvQXO3KpngSk4CcnHA1qFt4nDj2hQ1epL4dt9ZrUAsid5iG
         KegKpPqi7ihTRcES4oK8HIUiNXJnjkECq66ShWpkvzVD3Q57UBYgUnKQYzWYM7VgfXIN
         lzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TTgfUq1fGiGTBOtF7D+zM11uTAbbvBDC7L57nNCRjH8=;
        b=bT4pxyVYi8WADCuzeT+mNegow1n+xLiQDeiCpNFjmkrdCXWxbcqMaKrnkyq7Cjs3q2
         4v5B5maZqeiGhMs4amLHyKhv1FIB2xbveaVzMiMwHKAQgv8Dguxw4omQf2h5OpyzTDOG
         V2s2ti0vfDeWvKaYDItM3hsZaAtQ+i/suwDoBpS/WgyX0v5FyKAuYG1qtLvwWqfKFkVe
         7SLgAnsGNk5Lzec8jfpiooAPReRo7TngKh4fjKyRMTXvwtM1Bd2eRbRN+hqm2KkQPHlQ
         h1cWD56yHQXLRQlFDDmkji3WcKDSdb8J5BbPVOkCOVicvLcbJlZVd94EjA+x+QYEyKhK
         DKdw==
X-Gm-Message-State: AOAM532g4UUd6M0jeX8DPEigPkKVkKKwXQLSJKVweG9WqUXfsznomjuc
        iAvP5uiE3rx6zJLSuAYjDgj+JSVuKdAFOftbefCELA==
X-Google-Smtp-Source: ABdhPJzSuZY5BWe7wp+b6KHqIrIRtDa4pl6CE9TgqHhhfhWUNuUFAeqytbzFQspPt0QF1oEGRxEh+UY7X9p1+B6oMxs=
X-Received: by 2002:aa7:9f1b:: with SMTP id g27mr6899591pfr.215.1598339448477;
 Tue, 25 Aug 2020 00:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <CAK7LNAQmWBPV4nZ0xPdSHEt=DipHmR40co827voGOFN=2j47BQ@mail.gmail.com>
 <20200824173450.GA4157679@rani.riverdale.lan>
In-Reply-To: <20200824173450.GA4157679@rani.riverdale.lan>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 25 Aug 2020 00:10:37 -0700
Message-ID: <CAKwvOd=BEwuHFeuskJ4gPOGLoXm98oXA18U=tTw981g+HdVz-w@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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

On Mon, Aug 24, 2020 at 10:34 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Tue, Aug 25, 2020 at 12:57:22AM +0900, Masahiro Yamada wrote:
> >
> >
> > To prevent transformation from foo() into bar(),
> > there are two ways in Clang to do that;
> > -fno-builtin-foo, and -fno-builtin-bar.
> > There is only one in GCC; -fno-buitin-foo.
> >
> > Is this correct?
> >
>
> It looked that way from previous experimentation, but...
>
> >
> >
> > I just played the optimization
> > from printf("helloworld\n") to puts("helloworld").
> >
> > https://godbolt.org/z/5s4ded
> >
> >
> > -fno-builtin-puts cannot prevent clang
> > from emitting puts.
> > Is it because clang does not support
> > -fno-builtin-puts?
>
> Ugh. clang doesn't have __builtin_puts() but it optimizes printf() into
> puts(). It doesn't have __builtin_putchar() but will optimize
> printf("c") into putchar('c').

Bah, merely a <strikethrough>flesh
wound</strikethrough><strikethrough>compiler bug</strikethrough>rather
long TODO in the compiler.
https://github.com/llvm/llvm-project/blob/be2bc7d4cef2edd66c7fb74b70adf62fc68754db/clang/include/clang/Basic/Builtins.def#L943

Anyways, give me a week and I'll hack through the rest of them
https://reviews.llvm.org/D86508.  Certainly made HPA's point hit home,
that's a lot of functionality to implement or disable in an
environment.

Masahiro, are you implying that we shouldn't take the
-fno-builtin-stpcpy patch, because Clang is inconsistent? (That can be
fixed.) Even though -fno-builtin-stpcpy works here as intended?
https://lore.kernel.org/lkml/20200817220212.338670-2-ndesaulniers@google.com/

Otherwise we need to provide an implementation of this symbol in the kernel.
https://lore.kernel.org/lkml/20200815020946.1538085-1-ndesaulniers@google.com/

Please, pick your poison.
-- 
Thanks,
~Nick Desaulniers
