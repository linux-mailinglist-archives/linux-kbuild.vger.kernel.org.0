Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4941A3A4FE7
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 19:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhFLR2Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 13:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhFLR2Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 13:28:24 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27787C061767
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Jun 2021 10:26:11 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ci15so9362386ejc.10
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Jun 2021 10:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K87q3ygNLZInfR0ONZVqvHllcQ29xNPoiT8D9b1JLuw=;
        b=ZOkHFj6hSeWLUzU5sviAC8WsxV93dSuuwZ93byQQ+gjSihsf73nYF355no0qktkSba
         NoyiypLwIjK48xpyeDXoZn3i3Scdlr3KC+NB+jfAm/F021o+wt/xGmLWO82eqGCyBOSf
         LVIwxd8piswNkxPOnbivae67ddppYOLaVXMBYY5sR92J5bMSqqpHLZyD3QoOIH2yKD10
         mMqBlzigrfqANNEEoyCkfjui49nI48BnVqcEhk44QYDLnhPmLTmsnkUV25aDxOzSAzGJ
         ZSzQ9Sm8hk6NtEqRAgFWIGOlNvSzgMnln5ALbLw0EPaHHKGikF1PIi3bMqyQtx8vBxM2
         ohmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K87q3ygNLZInfR0ONZVqvHllcQ29xNPoiT8D9b1JLuw=;
        b=KCWU9b4r6IbWcYd6Uq5/Z3UYq7ILQ0mh/90dhg5+4MC9I5QoNKfUzY1Z/5k4CUi79s
         QkQQWA7udy2XDGqmP2SgRfCDVHNajTcoIvu26yp0O+tb88IIi+22c3uXfEqh6576siRZ
         GdFdigSfAhdglGr9ws7QamdPGvbyhB16NS/l+VGPaD+Co95M8oXMPsrXhQS33Z0o/pH4
         loCQhh8+EOc0JBeEDOwJHi5lZ7NZUbuOhjCUPK9QL3GVrjp1FmbE5BTYJFY7id1Vn6B1
         40O0LJjT3u/wR/EQuiofs85xnAi46WFxuPhVXc6B7vVv9ttKClqb3bqkHu1tOft6aHi4
         ckSQ==
X-Gm-Message-State: AOAM531aUrNTGY1cDJtzFgzXHI0WNV5lbO1D0oHH7TVBul44yPH0fTLw
        xrzW/75Xb/Uav9bj0TSNiV+FYgCqBd6zeJLRZn4t
X-Google-Smtp-Source: ABdhPJzcY3PJ0i0kRZsXmsHSJkM2+xDm70FOyUiKPcUcD26i/kuZ5RA6kAtb5kTg/ogkCIII1l69j+DJn/YKYIB/yzQ=
X-Received: by 2002:a17:906:7188:: with SMTP id h8mr8574666ejk.529.1623518769255;
 Sat, 12 Jun 2021 10:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
In-Reply-To: <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
From:   Bill Wendling <morbo@google.com>
Date:   Sat, 12 Jun 2021 10:25:57 -0700
Message-ID: <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization infrastructure
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Kees Cook <keescook@google.com>, Jonathan Corbet <corbet@lwn.net>,
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
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 12, 2021 at 9:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Apr 07, 2021 at 02:17:04PM -0700, Bill Wendling wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > profile, the kernel is instrumented with PGO counters, a representative
> > workload is run, and the raw profile data is collected from
> > /sys/kernel/debug/pgo/profraw.
> >
> > The raw profile data must be processed by clang's "llvm-profdata" tool
> > before it can be used during recompilation:
> >
> >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> >   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> >
> > Multiple raw profiles may be merged during this step.
> >
> > The data can now be used by the compiler:
> >
> >   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> >
> > This initial submission is restricted to x86, as that's the platform we
> > know works. This restriction can be lifted once other platforms have
> > been verified to work with PGO.
>
> *sigh*, and not a single x86 person on Cc, how nice :-/
>
This tool is generic and, despite the fact that it's first enabled for
x86, it contains no x86-specific code. The reason we're restricting it
to x86 is because it's the platform we tested on.

> > Note that this method of profiling the kernel is clang-native, unlike
> > the clang support in kernel/gcov.
> >
> > [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
>
> Also, and I don't see this answered *anywhere*, why are you not using
> perf for this? Your link even mentions Sampling Profilers (and I happen
> to know there's been significant effort to make perf output work as
> input for the PGO passes of the various compilers).
>
Instruction-based (non-sampling) profiling gives us a better
context-sensitive profile, making PGO more impactful. It's also useful
for coverage whereas sampling profiles cannot.

> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Co-developed-by: Bill Wendling <morbo@google.com>
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reviewed-by: Fangrui Song <maskray@google.com>
> > ---
> >  Documentation/dev-tools/index.rst     |   1 +
> >  Documentation/dev-tools/pgo.rst       | 127 +++++++++
> >  MAINTAINERS                           |   9 +
> >  Makefile                              |   3 +
> >  arch/Kconfig                          |   1 +
> >  arch/x86/Kconfig                      |   1 +
> >  arch/x86/boot/Makefile                |   1 +
> >  arch/x86/boot/compressed/Makefile     |   1 +
> >  arch/x86/crypto/Makefile              |   4 +
> >  arch/x86/entry/vdso/Makefile          |   1 +
> >  arch/x86/kernel/vmlinux.lds.S         |   2 +
> >  arch/x86/platform/efi/Makefile        |   1 +
> >  arch/x86/purgatory/Makefile           |   1 +
> >  arch/x86/realmode/rm/Makefile         |   1 +
> >  arch/x86/um/vdso/Makefile             |   1 +
> >  drivers/firmware/efi/libstub/Makefile |   1 +
> >  include/asm-generic/vmlinux.lds.h     |  34 +++
> >  kernel/Makefile                       |   1 +
> >  kernel/pgo/Kconfig                    |  35 +++
> >  kernel/pgo/Makefile                   |   5 +
> >  kernel/pgo/fs.c                       | 389 ++++++++++++++++++++++++++
> >  kernel/pgo/instrument.c               | 189 +++++++++++++
> >  kernel/pgo/pgo.h                      | 203 ++++++++++++++
> >  scripts/Makefile.lib                  |  10 +
> >  24 files changed, 1022 insertions(+)
> >  create mode 100644 Documentation/dev-tools/pgo.rst
> >  create mode 100644 kernel/pgo/Kconfig
> >  create mode 100644 kernel/pgo/Makefile
> >  create mode 100644 kernel/pgo/fs.c
> >  create mode 100644 kernel/pgo/instrument.c
> >  create mode 100644 kernel/pgo/pgo.h
>
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -660,6 +660,9 @@ endif # KBUILD_EXTMOD
> >  # Defaults to vmlinux, but the arch makefile usually adds further targets
> >  all: vmlinux
> >
> > +CFLAGS_PGO_CLANG := -fprofile-generate
> > +export CFLAGS_PGO_CLANG
> > +
> >  CFLAGS_GCOV  := -fprofile-arcs -ftest-coverage \
> >       $(call cc-option,-fno-tree-loop-im) \
> >       $(call cc-disable-warning,maybe-uninitialized,)
>
> And which of the many flags in noinstr disables this?
>
These flags aren't used with PGO. So there's no need to disable them.

> Basically I would like to NAK this whole thing until someone can
> adequately explain the interaction with noinstr and why we need those
> many lines of kernel code and can't simply use perf for this.

-bw
