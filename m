Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4E43B0021
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 11:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhFVJ15 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Jun 2021 05:27:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:55128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhFVJ15 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Jun 2021 05:27:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7FB76128E;
        Tue, 22 Jun 2021 09:25:36 +0000 (UTC)
Date:   Tue, 22 Jun 2021 10:25:34 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Bill Wendling <morbo@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH 2/2] Kconfig: CC_HAS_NO_PROFILE_FN_ATTR, depend on for
 GCOV and PGO
Message-ID: <20210622092533.GB3555@arm.com>
References: <20210618233023.1360185-1-ndesaulniers@google.com>
 <20210618233023.1360185-3-ndesaulniers@google.com>
 <CANpmjNNK-iYXucjz7Degh1kJPF_Z_=8+2vNLtUW17x0UnfgtPg@mail.gmail.com>
 <CAKwvOdmxGt6nAj+dDZEPdQtXNbYb8N6y3XwoCvCD+Qazskh7zw@mail.gmail.com>
 <CAGG=3QXeAxaf0AhKsg8P1-j2uHOoXne2KCOCEhq9SKa-e2dnag@mail.gmail.com>
 <CAKwvOd=9oAGPeuQmWnAMOxZn2ii_CRmyWnheoyXGcd09-U_CwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=9oAGPeuQmWnAMOxZn2ii_CRmyWnheoyXGcd09-U_CwA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 21, 2021 at 01:43:54PM -0700, Nick Desaulniers wrote:
> On Mon, Jun 21, 2021 at 11:50 AM Bill Wendling <morbo@google.com> wrote:
> > On Mon, Jun 21, 2021 at 11:22 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > > On Fri, Jun 18, 2021 at 11:23 PM Marco Elver <elver@google.com> wrote:
> > > > On Sat, 19 Jun 2021 at 01:30, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > > > > We don't want compiler instrumentation to touch noinstr functions, which
> > > > > are annotated with the no_profile function attribute. Add a Kconfig test
> > > > > for this and make PGO and GCOV depend on it.
> > > > >
> > > > > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > > > > Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> > > > > Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
> > > > > Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
> > > > > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > > ---
> > > > >  init/Kconfig        | 3 +++
> > > > >  kernel/gcov/Kconfig | 1 +
> > > > >  kernel/pgo/Kconfig  | 3 ++-
> > > > >  3 files changed, 6 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > > index 1ea12c64e4c9..540f862b40c6 100644
> > > > > --- a/init/Kconfig
> > > > > +++ b/init/Kconfig
> > > > > @@ -83,6 +83,9 @@ config TOOLS_SUPPORT_RELR
> > > > >  config CC_HAS_ASM_INLINE
> > > > >         def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
> > > > >
> > > > > +config CC_HAS_NO_PROFILE_FN_ATTR
> > > > > +       def_bool $(success,echo '__attribute__((no_profile)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> > > > > +
> > > > >  config CONSTRUCTORS
> > > > >         bool
> > > > >
> > > > > diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> > > > > index 58f87a3092f3..19facd4289cd 100644
> > > > > --- a/kernel/gcov/Kconfig
> > > > > +++ b/kernel/gcov/Kconfig
> > > > > @@ -5,6 +5,7 @@ config GCOV_KERNEL
> > > > >         bool "Enable gcov-based kernel profiling"
> > > > >         depends on DEBUG_FS
> > > > >         depends on !CC_IS_CLANG || CLANG_VERSION >= 110000
> > > > > +       depends on !X86 || (X86 && CC_HAS_NO_PROFILE_FN_ATTR)
> > > >
> > > > [+Cc Mark]
> > > >
> > > > arm64 is also starting to rely on noinstr working properly.
> > >
> > > Sure,
> > > Will, Catalin, other arm64 folks:
> > > Any thoughts on requiring GCC 7.1+/Clang 13.0+ for GCOV support?  That
> > > way we can better guarantee that GCOV (and eventually, PGO) don't
> > > touch noinstr functions?
> > >
> > > If that's ok, I'll add modify the above like:
> > >
> > > + depends on !ARM64 || (ARM64 && CC_HAS_NO_PROFILE_FN_ATTR)
> >
> > Wouldn't "!ARM64 || CC_HAS_NO_PROFILE_FN_ATTR" be more succinct?
> 
> We need to be able to express via Kconfig "GCOV should not be enabled
> for architectures that use noinstr when the toolchain does not support
> __attribute__((no_profile_instrument_function))."
> 
> Where "architectures that use noinstr" are currently arm64, s390, and
> x86.  So I guess we could do:
> 
> + depends on !ARM64 || !S390 || !X86 || CC_HAS_NO_PROFILE_FN_ATTR

I think you want:

  depends on !(ARM64 || S390 || X86) || CC_HAS_NO_PROFILE_FN_ATTR

> (We could add a Kconfig for ARCH_WANTS_NO_INSTR, which might be more
> informative than listed out architectures which might be non-obvious
> to passers-by).

That would probably look better.

-- 
Catalin
