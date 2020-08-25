Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C051C251A69
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Aug 2020 16:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgHYODU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Aug 2020 10:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgHYOCy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Aug 2020 10:02:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2411DC061755
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2020 07:02:41 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ep8so1283489pjb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Aug 2020 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xqG3SdMvJx7GJfq2oMPF0l/P2B4bvHecimACRr3B0fs=;
        b=Xty7tLG+dU+cxDG1zwMKS7VBqkMFL9+oRQOgahH5nLpH5fKwJmyxlLLGWPIE2qVKv/
         1WwbucyxJlvoptqamR2wp5yW+q8nwJPfaxLUyMF41W6AcqPGCp6EtnVuhyGA5g5FQDks
         03aRQBsxVLXuf2neUQer3SDSQF27D9q28Gqj2wqXTxAAJpAQXlFw/kcTQU4asvyiHQD1
         e6kLw+s1TkzTpdMtM6yH7sFjUQDlFuYCWC5n4YfBmMbBzeWYUwm27164zB64OlOA7vub
         8J5wOPabyN/gRP5JsNrieFCOz7IDieTj+/nf+vBRHVgJ+RuMYXLMj6e1xT+4Y/nKQodl
         J0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xqG3SdMvJx7GJfq2oMPF0l/P2B4bvHecimACRr3B0fs=;
        b=A5N9CxOC/9nG4YZjVJrep6H9v0gvj5QubPBbC2iaQuh/Cf6N25rVQpOm1sjTwxyZsb
         7a+kWHwxXNs0sCBsEYo451bt4itn+IiBow9ZaxKbnl7ZJS6BNNcbH+Eg93f/YKlCuX2l
         OnrIM/pTNu/OeJHxiVpt+rlaQc7hg6/oR2pNs85zEMHQu3EDLfH62dxu9LVYKIozXVaN
         kWIdH0und1es3GpsFJB1Au76cgQjtRbM0wDMia7SF9SY6mh+9x8ML/qxhRDZc9uaFViS
         q5Nec3q6m6d9MYDOAvXiS5+lkqsP2eftYFDm+87sXk75vvTmHvz0rlKyPmhwSWRjCb4A
         5ftg==
X-Gm-Message-State: AOAM533wRWxV/IEFbnykdPy6Z0guK3U2T89oE5Q3tsRxXlukiVMGXYRn
        DHklPomcxA9S/CkgxuTraQ4LniEZUpWFyfAo6LC2Iw==
X-Google-Smtp-Source: ABdhPJzUqhQqxESaGZbNm2mQAUsBlc3kLUZjOmvdGUJ/EsAy326Ph9KQE7qDsFcEsO4sSNCfTk7UwfYZy4FBoFBySQk=
X-Received: by 2002:a17:90a:850b:: with SMTP id l11mr1672748pjn.25.1598364160101;
 Tue, 25 Aug 2020 07:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <CAK7LNAQmWBPV4nZ0xPdSHEt=DipHmR40co827voGOFN=2j47BQ@mail.gmail.com>
 <20200824173450.GA4157679@rani.riverdale.lan> <CAKwvOd=BEwuHFeuskJ4gPOGLoXm98oXA18U=tTw981g+HdVz-w@mail.gmail.com>
 <CAK7LNAQynuqqjhL1rqMf0YnRpQ0jsWrJ7fy51FM7d0xdxws5wQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQynuqqjhL1rqMf0YnRpQ0jsWrJ7fy51FM7d0xdxws5wQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 25 Aug 2020 07:02:28 -0700
Message-ID: <CAKwvOdk9gpKNmEAHLf9KtzmzxnSdmDdutu5Mpp39XEaxMywMFA@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
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

On Tue, Aug 25, 2020 at 5:30 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Aug 25, 2020 at 4:10 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Masahiro, are you implying that we shouldn't take the
> > -fno-builtin-stpcpy patch, because Clang is inconsistent? (That can be
> > fixed.) Even though -fno-builtin-stpcpy works here as intended?
> > https://lore.kernel.org/lkml/20200817220212.338670-2-ndesaulniers@google.com/
> >
> > Otherwise we need to provide an implementation of this symbol in the kernel.
> > https://lore.kernel.org/lkml/20200815020946.1538085-1-ndesaulniers@google.com/
> >
> > Please, pick your poison.
>
>
>
> I am not a compiler expert.
>
> Nor am I sure if I am the right person who makes this decision.
> But, if so, I would choose the latter.
> (implement stpcpy() in the kernel)
>
> I was addressed last night, so
> I should write up my thoughts.
>
> I do not think -fno-builtin-stpcpy is a
> general solution.
>
> -fno-builtin-stpcpy will work for now
> because only Clang implements the transformation
> from 'sprintf(dest, "%s", str)' into
> 'stpcpy(dest, str) - dest'.
>
> If GCC implements it some day,
> we would run into a problem because
> in GCC, it is not -fno-builtin-stpcpy, but
> -fno-builtin-sprintf that disables that optimization.
>
> In this regard, 'KBUILD_CFLAGS += -fno-builtin-sprintf'
> would be more future-proof, but it is potentially
> an overkill.
> We want to disable optimization from sprintf() to stpcpy(),
> but we may still benefit from the optimization from
> sprintf() into something else.
>
>
> Linus is uncomfortable with this kind of compiler magic.
> If we take compiler's freedom away,
> -ffreestanding is a big hammer to solve this problem.
>
> If we welcome the compiler's optimization,
> we should implement stpcpy(), bcmp(), and whatever
> until we solve all link errors.

Speculating that -ffreestanding is untenable, submitted v3:
https://lore.kernel.org/lkml/20200825135838.2938771-1-ndesaulniers@google.com/T/#u
-- 
Thanks,
~Nick Desaulniers
