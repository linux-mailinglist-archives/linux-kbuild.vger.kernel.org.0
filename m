Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8B2350AF1
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Apr 2021 01:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhCaXmY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 19:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhCaXl5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 19:41:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CC1C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 16:41:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 12so61679lfq.13
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 16:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PQOJPJU6O+1afGXxfahGg0HaWxknyTlDZ8qpEGtglYs=;
        b=rVxmOsOZMEZTR3MaN7sjh15l6PvLlky4M/i8IobOwTnKPMwVZ6ORJP30oGgMk8CPp6
         rTMsg9LrMPWzm7RGqCzznq+OQMI/CfH+paG4Tutp/TN8FsinMaiSYjiVwFbJACPwIdzY
         qJ9h4CR+ZpTd2fyXuOC5ydItjKyrR7kOg2ftqbCGF8GGQmXxGrfxa4gUvb61MbnNLTtG
         iwoI4KMsXi4+uOmhcCQB7gRxvxweECULcJQ1t7brfOynLTe39PB5UIzRU8nQR4vAjdlD
         JINpfrKFN9HPdN5g+hWuki6KSwK56WeBnN+xSouxndCX0QUQv5oKAElMsMTV/LC1m1bF
         SPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PQOJPJU6O+1afGXxfahGg0HaWxknyTlDZ8qpEGtglYs=;
        b=i/jMJsca1oHc3YOeBgVDdC2VVhXdX8JQjgWpv6/HZloWMxdUHMaLVYKmFB5T32AINE
         wsjcg+otL6x35T9YcVytSVxNbt4eI8OgaHsZNlbnj9hpIKXN0JxuPTqJZsCiw46oXrl/
         DxIGKTYN04qMT1PhH/35fuAiqFc9sm8cnJiLG+4fctek97cEmdMztocdaYBnonI6wZXX
         SgYyCgWWE4dgbqyJDxQZlArZIrRzGhXv9gDsgrWI3Fm5Ifg+zEJVyOO2J7NMx2YnP7ZB
         57H/Mea/YvFdFrdZX+ZCSAeURlRylBqHygKoELyPFxHWfnXepF2B+VCzrjPSuisruAL4
         Pryg==
X-Gm-Message-State: AOAM530w2SGv0i4gCCcEjTaXR4kmTXgVrdcyOly7eoKf/My0IDya+VXk
        FrsgWnO3cMfLi5+peAQ5fy7QQDXilwjcGCv7zoguoQ==
X-Google-Smtp-Source: ABdhPJycPkOC3bmpKcVK695KadJ4yRQxz6smgCb21URgEhG9MkeZePVMd2uUxy7ucFSqKvAvSn2GFevK3u8mk3ptZpM=
X-Received: by 2002:a19:5055:: with SMTP id z21mr3555755lfj.297.1617234114935;
 Wed, 31 Mar 2021 16:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210315161257.788477-1-masahiroy@kernel.org> <20210315161257.788477-2-masahiroy@kernel.org>
 <CAK7LNARgowfqPzz7mawQiJ7LLdWGyW3NaS21Jwp1qSzwek8f6w@mail.gmail.com>
In-Reply-To: <CAK7LNARgowfqPzz7mawQiJ7LLdWGyW3NaS21Jwp1qSzwek8f6w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 31 Mar 2021 16:41:43 -0700
Message-ID: <CAKwvOdkQko6scceqEYkVR-p4dHEHwVze=x6DkKea1SEqOTpeZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kbuild: check the minimum assembler version in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Colin Ian King <colin.king@canonical.com>,
        David Howells <dhowells@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Terrell <terrelln@fb.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        YiFei Zhu <yifeifz2@illinois.edu>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jian Cai <jiancai@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 16, 2021 at 12:14 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Mar 16, 2021 at 1:14 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Documentation/process/changes.rst defines the minimum assembler version
> > (binutils version), but we have never checked it in the build time.
> >
> > Kbuild never invokes 'as' directly because all assembly files in the
> > kernel tree are *.S, hence must be preprocessed. I do not expect
> > raw assembly source files (*.s) would be added to the kernel tree.
> >
> > Therefore, we always use $(CC) as the assembler driver, and commit
> > aa824e0c962b ("kbuild: remove AS variable") removed 'AS'. However,
> > we are still interested in the version of the assembler acting behind.
> >
> > As usual, the --version option prints the version string.
> >
> >   $ as --version | head -n 1
> >   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
> >
> > But, we do not have $(AS). So, we can add the -Wa prefix so that
> > $(CC) passes --version down to the backing assembler.
> >
> >   $ gcc -Wa,--version | head -n 1
> >   gcc: fatal error: no input files
> >   compilation terminated.
> >
> > OK, we need to input something to satisfy gcc.
> >
> >   $ gcc -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
> >   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
> >
> > The combination of Clang and GNU assembler works in the same way:
> >
> >   $ clang -no-integrated-as -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
> >   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
> >
> > Clang with the integrated assembler fails like this:
> >
> >   $ clang -integrated-as -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
> >   clang: error: unsupported argument '--version' to option 'Wa,'

Jian just landed support for this, it will ship in clang-13:
https://reviews.llvm.org/rG3cc3c0f8352ec33ca2f2636f94cb1d85fc57ac16
https://github.com/ClangBuiltLinux/linux/issues/1320
Thanks Jian!

> >
> > For the last case, checking the error message is fragile. If the
> > proposal for -Wa,--version support [1] is accepted, this may not be
> > even an error in the future.
> >
> > One easy way is to check if -integrated-as is present in the passed
> > arguments. We did not pass -integrated-as to CLANG_FLAGS before, but
> > we can make it explicit.
> >
> > Nathan pointed out -integrated-as is the default for all of the
> > architectures/targets that the kernel cares about, but it goes
> > along with "explicit is better than implicit" policy. [2]
> >
> > With all this in my mind, I implemented scripts/as-version.sh to
> > check the assembler version in Kconfig time.
> >
> >   $ scripts/as-version.sh gcc
> >   GNU 23501
> >   $ scripts/as-version.sh clang -no-integrated-as
> >   GNU 23501
> >   $ scripts/as-version.sh clang -integrated-as
> >   LLVM 0
> >
> > [1]: https://github.com/ClangBuiltLinux/linux/issues/1320
> > [2]: https://lore.kernel.org/linux-kbuild/20210307044253.v3h47ucq6ng25iay@archlinux-ax161/
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >   - Check -integrated-as option instead of error message.
> >   - Add LC_ALL=C just in case.
> >
> >   The Italian locale did not tweak the message from 'as --version'
> >   but we never know what would happen on locale.
> >
> >   $ LC_MESSAGES=it_IT.UTF-8 ld --version | head -n 1
> >   ld di GNU (GNU Binutils for Debian) 2.35.2
> >   $ LC_MESSAGES=it_IT.UTF-8 as --version | head -n 1
> >   GNU assembler (GNU Binutils for Debian) 2.35.2
> >
> >  Makefile                |  4 +-
> >  arch/Kconfig            |  3 +-
> >  init/Kconfig            | 12 ++++++
> >  scripts/Kconfig.include |  6 +++
> >  scripts/as-version.sh   | 82 +++++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 104 insertions(+), 3 deletions(-)
> >  create mode 100755 scripts/as-version.sh
> >
> > diff --git a/Makefile b/Makefile
> > index cc5b7e39fde4..2b161f5a5a66 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -580,7 +580,9 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> >  ifneq ($(CROSS_COMPILE),)
> >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> >  endif
> > -ifneq ($(LLVM_IAS),1)
> > +ifeq ($(LLVM_IAS),1)
> > +CLANG_FLAGS    += -integrated-as
> > +else
> >  CLANG_FLAGS    += -no-integrated-as
> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> >  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index ecfd3520b676..555b4f09a9b2 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -631,8 +631,7 @@ config ARCH_SUPPORTS_LTO_CLANG_THIN
> >  config HAS_LTO_CLANG
> >         def_bool y
> >         # Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
> > -       depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD
> > -       depends on $(success,test $(LLVM_IAS) -eq 1)
> > +       depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
> >         depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
> >         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
> >         depends on ARCH_SUPPORTS_LTO_CLANG
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 5f5c776ef192..019c1874e609 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -41,6 +41,18 @@ config CLANG_VERSION
> >         default $(cc-version) if CC_IS_CLANG
> >         default 0
> >
> > +config AS_IS_GNU
> > +       def_bool $(success,test "$(as-name)" = GNU)
> > +
> > +config AS_IS_LLVM
> > +       def_bool $(success,test "$(as-name)" = LLVM)
> > +
> > +config AS_VERSION
> > +       int
> > +       # Use clang version if this is the integrated assembler
> > +       default CLANG_VERSION if AS_IS_LLVM
> > +       default $(as-version)
> > +
> >  config LD_IS_BFD
> >         def_bool $(success,test "$(ld-name)" = BFD)
> >
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index 58fdb5308725..0496efd6e117 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -45,6 +45,12 @@ $(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not su
> >  cc-name := $(shell,set -- $(cc-info) && echo $1)
> >  cc-version := $(shell,set -- $(cc-info) && echo $2)
> >
> > +# Get the assembler name, version, and error out if it is not supported.
> > +as-info := $(shell,$(srctree)/scripts/as-version.sh $(CC) $(CLANG_FLAGS))
> > +$(error-if,$(success,test -z "$(as-info)"),Sorry$(comma) this assembler is not supported.)
> > +as-name := $(shell,set -- $(as-info) && echo $1)
> > +as-version := $(shell,set -- $(as-info) && echo $2)
> > +
> >  # Get the linker name, version, and error out if it is not supported.
> >  ld-info := $(shell,$(srctree)/scripts/ld-version.sh $(LD))
> >  $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supported.)
> > diff --git a/scripts/as-version.sh b/scripts/as-version.sh
> > new file mode 100755
> > index 000000000000..953ff000bcbc
> > --- /dev/null
> > +++ b/scripts/as-version.sh
> > @@ -0,0 +1,82 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Print the assembler name and its version in a 5 or 6-digit form.
> > +# Also, perform the minimum version check.
> > +# (If it is the integrated assembler, return 0 as the version, and
> > +# skip the version check.)
> > +
> > +set -e
> > +
> > +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> > +get_canonical_version()
> > +{
> > +       IFS=.
> > +       set -- $1
> > +
> > +       # If the 2nd or 3rd field is missing, fill it with a zero.
> > +       #
> > +       # The 4th field, if present, is ignored.
> > +       # This occurs in development snapshots as in 2.35.1.20201116
> > +       echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> > +}
> > +
> > +# Clang failes to handle -Wa,--version fails unless -no-integrated-as is given.
>
> This line got strange after some editing.
>
> I will rephrase it to:
>
>   Clang fails to handle -Wa,--version unless -no-integrated-as is given.
>
>
>
>
>
> > +# We check -(f)integrated-as, expecting it is explicitly passed in for the
> > +# integrated assembler case.
> > +check_integrated_as()
> > +{
> > +       while [ $# -gt 0 ]; do
> > +               if [ "$1" = -integrated-as -o "$1" = -fintegrated-as ]; then
> > +                       # For the intergrated assembler, we do not check the
> > +                       # version here. It is the same as the clang version, and
> > +                       # it has been already checked by scripts/cc-version.sh.
> > +                       echo LLVM 0
> > +                       exit 0
> > +               fi
> > +               shift
> > +       done
> > +}
> > +
> > +check_integrated_as "$@"
> > +
> > +orig_args="$@"
> > +
> > +# Get the first line of the --version output.
> > +IFS='
> > +'
> > +set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler /dev/null -o /dev/null 2>&1)
> > +
> > +# Split the line on spaces.
> > +IFS=' '
> > +set -- $1
> > +
> > +min_tool_version=$(dirname $0)/min-tool-version.sh
> > +
> > +if [ "$1" = GNU -a "$2" = assembler ]; then
> > +       shift $(($# - 1))
> > +       version=$1
> > +       min_version=$($min_tool_version binutils)
> > +       name=GNU
> > +else
> > +       echo "$orig_args: unknown assembler invoked" >&2
> > +       exit 1
> > +fi
> > +
> > +# Some distributions append a package release number, as in 2.34-4.fc32
> > +# Trim the hyphen and any characters that follow.
> > +version=${version%-*}
> > +
> > +cversion=$(get_canonical_version $version)
> > +min_cversion=$(get_canonical_version $min_version)
> > +
> > +if [ "$cversion" -lt "$min_cversion" ]; then
> > +       echo >&2 "***"
> > +       echo >&2 "*** Assembler is too old."
> > +       echo >&2 "***   Your $name assembler version:    $version"
> > +       echo >&2 "***   Minimum $name assembler version: $min_version"
> > +       echo >&2 "***"
> > +       exit 1
> > +fi
> > +
> > +echo $name $cversion
> > --
> > 2.27.0
> >
> > --

-- 
Thanks,
~Nick Desaulniers
