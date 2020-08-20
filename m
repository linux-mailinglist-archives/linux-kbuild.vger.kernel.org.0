Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED6524C8B4
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 01:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728605AbgHTXjq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 19:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728746AbgHTXjm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 19:39:42 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527E7C061385
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 16:39:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m22so3990477ljj.5
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 16:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yLsHxNY14nYfsmOcH0Wmsm+uJTY/HQXjErhm/+DBOIM=;
        b=UYwaeNYbl6ONJY+uj1aPnbq4RonZdvr6c0g/dIaT7MEKE5ZHlUPU1a0W9mzWMnnlq0
         LYCnfmFVjndAWdQCVMEuvCifSqbfjsZQFpLH3BhJhZEqpjbz+hc/gbmL/ktiyv9mbSaJ
         jade3mOlBkspOHfdEfYJQRJvz3EL50Yw/xHsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yLsHxNY14nYfsmOcH0Wmsm+uJTY/HQXjErhm/+DBOIM=;
        b=mLlTaVDhPCFJha9INuXoufAhZdTCH7EilmIXu6ePTRu3f0lTdF7RtL82Z0zV9lgVgS
         oViEeMgtKzGQ1KgaJ+G42ZvxI/voi82auFZMhLIVZizDcHupkOoo0naD8ZWPOLbaGX64
         cDWLLLqVYXjSrehw86+qOBQtJjvi5npuArF+MkZtl5gRB3JXk/WfwRJ55ErrMpXRRCpP
         LCVlsHiGOiFdUnoclHsXLP+AWb3E4uxN+Lnwu3hNnMdF5z+FvOGK97kV9zGjtGTnhF/U
         3DNJJLJxYP/TGLxCIhULn5in6ppn29ib2T989CmCkFDAWlHc+hYiFZeTOm/pfHnyts2i
         66bQ==
X-Gm-Message-State: AOAM532W8jxHS/iInC6g5z5HWALR5bkSLDw3UmveDCifpsgS/xRZaAL0
        OYnnGcB0zYGWKFxBbJBG5ir9OEDpH2aniQ==
X-Google-Smtp-Source: ABdhPJx8QJjg9xcEYsNzpAxxNmx4iGqbSfDLvfpQMZkqvWh3LWUvbkZ29/jonTb0l55zBcxI1TR6bA==
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr160414lji.215.1597966780407;
        Thu, 20 Aug 2020 16:39:40 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id s30sm11793lfp.14.2020.08.20.16.39.39
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 16:39:40 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id i80so28221lfi.13
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 16:39:40 -0700 (PDT)
X-Received: by 2002:a2e:545:: with SMTP id 66mr168592ljf.285.1597966399329;
 Thu, 20 Aug 2020 16:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan>
In-Reply-To: <20200820175617.GA604994@rani.riverdale.lan>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 20 Aug 2020 16:33:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
Message-ID: <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
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

On Thu, Aug 20, 2020 at 10:56 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> Clang's interpretation is more useful for embedded, since you can use
> -fno-builtin-foo and avoid calling __builtin_foo directly, and be
> guaranteed that there will be no calls to foo that you didn't write
> explicitly (outside of memcpy/memset/memcmp). In this case you are free
> to implement foo with non-standard semantics, or avoid implementing it
> altogether, and be reasonably confident that it will all work.

Honestly, I think concentrating on whether __builtin_foo() works or
not misses the point entirely.

That has never _ever_ been a problem for us, and I doubt it has been a
problem for anybody else either.

If you use __builtin_memcpy() in your source tree, then why would you
possibly ever want to disable it? And if you _don't_ use it, then
again - why would you ever want to disable it?

No, the real (and only) problem has always been about the compilers
magically and silently "recognizing" certain source patterns, and
turning them into function calls behind the users back.

And that has nothing to do with __builtin_foo(). At least it
_shouldn't_ have anything to do with it.

So this is things like the compiler silently seeing "oh, you called
your function 'free()', so we know that the stores you did to it are
dead and we'll remove them".

Or this is the compiler doing "Oh, you did four stores of zero in a
row, and and you asked for size optimizations, so we'll turn those
into a 'bzero()' call".

Or the compiler doing completely broken things, and turning a
"!memcmp()" expression into a "!bcmp()" because the compilier
incorrectly assumes it's faster.

Notice? Not a single one of those had any __builtin_xyz() pattern in
them. Quite the reverse. The compiler took something completely
different, and assumed builtin semantics without us having told it to.

So I think "-fno-builtin-xyz" is barking *completely* up the wrong
tree. It's missing the problem. The problem is not "I have some
builtin patterns, here, you can use them".

It's the same as all the vector intrinsics. Those don't hurt anybody -
as long as they only get used when people use the intrinsics. If the
compiler starts to suddenly use vector intrinsics without being told
to, *THAT* can be a problem. But there is never any reson to turn off
any particular intrinsic otherwise.

If you don't want it used, don't use it. And if you do use it, the
compiler generates the vector code sequence. It's that simple.

So to me, a compiler flag like "-fno-builtin-memcpy" is completely
insane. The flag adds absolutely no value.

The real value would be "-fno-magic-bcmp" which turns off stupid
optimizations that magically turn non-bcmp things into bcmp. But it
should not turn off *actual* __builtin_bcmp() if such a thing exists
and people want to explicitly use it.

             Linus
