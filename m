Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E4C3AF5A7
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 20:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbhFUSwp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 14:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhFUSwo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 14:52:44 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE6CC061574
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 11:50:30 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id hz1so7926323ejc.1
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 11:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Su81jZ58rhgHEJ5xNq4SVnXH+2VzVF+NBRidhz73D1A=;
        b=fj1t9s647G21SEyRURvGSz0x9wtmxJ1tZ8/CUue9B6KUosAd6dSoUS60m96cQ+7eyu
         X+YDOnrvGr+bsP98c9Ca2GgLJ+1qdkFzpx1kZ4FjC9sSbmixe3cBrCy5j7iiA/8H78Ad
         qWzJYPTfCuC5c+PUdeApqrOKftevo3P8yumqzO/0U21y4euK6bSiWWRwcW6CnM20ymWn
         pngu/blLd7uK6hsKweTMDWkfmorb5VY9mnJDNM5UXnw3AqND/Bg88L0a/8/8CI1sTioU
         NjhPSc1Q63+MzLtw8gnM6sknXv0ioUMK76/Z/kE4nBov+x0xRP9UtXsfzDXe0v2gU9Kb
         N7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Su81jZ58rhgHEJ5xNq4SVnXH+2VzVF+NBRidhz73D1A=;
        b=H3RguIwDWf25u4b+eDn9gyAKsk3M38wXG2hYfFklP2krVqTO5/B41exQsjp3gGcn07
         hb4NSWihF9l1m6hGa7ir70dbnTz8lfMgghrKv85kBaHpruEoYie1ZykktNOMo7B8XY6m
         keGHgL7iejLud7CQReQ+N6uRhDouy+w3xvspdlTIOigGjRhz0beKH0uuYFN7ovwtZYit
         mkPZHU0kwI9hSKNU0oQsCbWHoTdvm9I9yfyffgplRhGu/AnmWXHbO/sLkpi/4tQIGFRO
         RrVXXgXzRv3awJrF3SbVvwoFaGwAXFKdV0ohLPMiPHnM8SjLB31x45ORnYndbO/pE+Wn
         RpEA==
X-Gm-Message-State: AOAM530gPYIgdJcTx5eGK+blyXUcWW47kFkhYQbl+UyXAun0nQ2PZElf
        0Kb0ofWPcg9iuAR8UQgD8JDwB3hnZEWMhi82dwsZ
X-Google-Smtp-Source: ABdhPJxQyvHqkYkNkWIsH1dHYcEpHGTwWmWGnD1nZJKmm5KPLeVDAC8o6xVf4JO7qmGgkAFyzuoFRp5TgnFiSAjuZZk=
X-Received: by 2002:a17:906:e108:: with SMTP id gj8mr25315960ejb.90.1624301428439;
 Mon, 21 Jun 2021 11:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210618233023.1360185-1-ndesaulniers@google.com>
 <20210618233023.1360185-3-ndesaulniers@google.com> <CANpmjNNK-iYXucjz7Degh1kJPF_Z_=8+2vNLtUW17x0UnfgtPg@mail.gmail.com>
 <CAKwvOdmxGt6nAj+dDZEPdQtXNbYb8N6y3XwoCvCD+Qazskh7zw@mail.gmail.com>
In-Reply-To: <CAKwvOdmxGt6nAj+dDZEPdQtXNbYb8N6y3XwoCvCD+Qazskh7zw@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Mon, 21 Jun 2021 11:50:17 -0700
Message-ID: <CAGG=3QXeAxaf0AhKsg8P1-j2uHOoXne2KCOCEhq9SKa-e2dnag@mail.gmail.com>
Subject: Re: [PATCH 2/2] Kconfig: CC_HAS_NO_PROFILE_FN_ATTR, depend on for
 GCOV and PGO
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Martin Liska <mliska@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        linux-toolchains@vger.kernel.org, Marco Elver <elver@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 21, 2021 at 11:22 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Jun 18, 2021 at 11:23 PM Marco Elver <elver@google.com> wrote:
> >
> > On Sat, 19 Jun 2021 at 01:30, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > We don't want compiler instrumentation to touch noinstr functions, which
> > > are annotated with the no_profile function attribute. Add a Kconfig test
> > > for this and make PGO and GCOV depend on it.
> > >
> > > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > > Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> > > Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
> > > Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
> > > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  init/Kconfig        | 3 +++
> > >  kernel/gcov/Kconfig | 1 +
> > >  kernel/pgo/Kconfig  | 3 ++-
> > >  3 files changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index 1ea12c64e4c9..540f862b40c6 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -83,6 +83,9 @@ config TOOLS_SUPPORT_RELR
> > >  config CC_HAS_ASM_INLINE
> > >         def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
> > >
> > > +config CC_HAS_NO_PROFILE_FN_ATTR
> > > +       def_bool $(success,echo '__attribute__((no_profile)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> > > +
> > >  config CONSTRUCTORS
> > >         bool
> > >
> > > diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> > > index 58f87a3092f3..19facd4289cd 100644
> > > --- a/kernel/gcov/Kconfig
> > > +++ b/kernel/gcov/Kconfig
> > > @@ -5,6 +5,7 @@ config GCOV_KERNEL
> > >         bool "Enable gcov-based kernel profiling"
> > >         depends on DEBUG_FS
> > >         depends on !CC_IS_CLANG || CLANG_VERSION >= 110000
> > > +       depends on !X86 || (X86 && CC_HAS_NO_PROFILE_FN_ATTR)
> >
> > [+Cc Mark]
> >
> > arm64 is also starting to rely on noinstr working properly.
>
> Sure,
> Will, Catalin, other arm64 folks:
> Any thoughts on requiring GCC 7.1+/Clang 13.0+ for GCOV support?  That
> way we can better guarantee that GCOV (and eventually, PGO) don't
> touch noinstr functions?
>
> If that's ok, I'll add modify the above like:
>
> + depends on !ARM64 || (ARM64 && CC_HAS_NO_PROFILE_FN_ATTR)
>
Wouldn't "!ARM64 || CC_HAS_NO_PROFILE_FN_ATTR" be more succinct?

> to the above hunk in v2.  Oh, looks like arch/s390 also uses noinstr.
> Same question applies then:
>
> + depends on !S390 || (S390 && CC_HAS_NO_PROFILE_FN_ATTR)
>
> Or, we could just do
>
> + depends on CC_HAS_NO_PROFILE_FN_ATTR
>
> Though that will penalize architectures not using noinstr, that still
> would like to use GCOV with versions of GCC older than 7.1.  Perhaps
> there are no such such users, or they should consider upgrading their
> tools to we can stick with the simpler Kconfig? Thoughts?
>
> >
> > This should probably be a 'select ARCH_HAS_GCOV_PROFILE_ALL if
> > CC_HAS_NO_PROFILE_FN_ATTR' in the relevant arch/../Kconfig.
> >
> > Alternatively, using:
> > https://lkml.kernel.org/r/YMcssV/n5IBGv4f0@hirez.programming.kicks-ass.net
> >
> > But I'd probably not overcomplicate things at this point and just use
> > ARCH_HAS_GCOV_PROFILE_ALL, because GCOV seems to be a) rarely used,
> > and b) if someone decides to selectively instrument stuff like entry
> > code, we can just say it's user error.
> >
> >
> > >         select CONSTRUCTORS
> > >         default n
> > >         help
> > > diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
> > > index d2053df1111c..26f75ac4c6c1 100644
> > > --- a/kernel/pgo/Kconfig
> > > +++ b/kernel/pgo/Kconfig
> > > @@ -8,7 +8,8 @@ config PGO_CLANG
> > >         bool "Enable clang's PGO-based kernel profiling"
> > >         depends on DEBUG_FS
> > >         depends on ARCH_SUPPORTS_PGO_CLANG
> > > -       depends on CC_IS_CLANG && CLANG_VERSION >= 120000
> > > +       depends on CC_IS_CLANG
> > > +       depends on CC_HAS_NO_PROFILE_FN_ATTR
> > >         help
> > >           This option enables clang's PGO (Profile Guided Optimization) based
> > >           code profiling to better optimize the kernel.
> > > --
> > > 2.32.0.288.g62a8d224e6-goog
> > >
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
