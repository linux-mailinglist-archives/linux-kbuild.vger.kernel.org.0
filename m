Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E439732F1B6
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 18:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhCERtv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 12:49:51 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:23350 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCERte (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 12:49:34 -0500
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 125HnFsb006833;
        Sat, 6 Mar 2021 02:49:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 125HnFsb006833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614966556;
        bh=DI8u8e1TEbrLh1CZv1Kyzr9RTXeXBW1AzUz2gmbqhyo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1YVS7QEYohskHlOwp7+o7FHthB8r14uDOv1g0sm72+DR29D9uqtcrVtcOHX9G478h
         tg5V3R7WShm5PExBMpm8QKlHzKBPqQil/teCiqGT0IHDOEfHXXve+3dWgVLsJSf1lt
         64wsPUOSC9gKcv4KNe0XbULZeQQnqcqgNXeYskv3+Q+qmhj5t6mDgj+kY0Y8fHPXzh
         RytkeYLz2Lzpri/mYSox952XgB6cjDO3YWh5vmI692gT6RYqWhq8Qxv5175z7crSnm
         YcmE81H/Wm5GJLOTWtfUudhhFyy0kmIm9KLKsVgeuGNzq8e/Od/F21Lb2sztpk+4hK
         d7SZgQAaR6ZJg==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id x29so1878990pgk.6;
        Fri, 05 Mar 2021 09:49:15 -0800 (PST)
X-Gm-Message-State: AOAM5326iGbs62fZP2xscq4OEF+2aaaDX6+Mz7A/alisZpVZMAJ4Hfpt
        btdqFhvHivyQPo6BAvKJff/rBk54qBmrxhYObp0=
X-Google-Smtp-Source: ABdhPJz34ATK4+alZ3V7av9Cj3UhJTwtKVLjVZhg6TEmdmr3ycHNLyohUoWRW/op+EPpDHYyhc+iPnNpw9hQhY/uHW8=
X-Received: by 2002:a65:41c6:: with SMTP id b6mr9512661pgq.7.1614966555142;
 Fri, 05 Mar 2021 09:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20210303183333.46543-1-masahiroy@kernel.org> <20210303183333.46543-3-masahiroy@kernel.org>
 <CAKwvOdmdQvwDN6Bg2Kom1Nm+HrNfCqOqnDLYTYs+5sRSEuZsJg@mail.gmail.com>
In-Reply-To: <CAKwvOdmdQvwDN6Bg2Kom1Nm+HrNfCqOqnDLYTYs+5sRSEuZsJg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Mar 2021 02:48:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7E52H+f+Ref6JYqMnG1v78Wo2p+W__=52dw7EP=b0Ww@mail.gmail.com>
Message-ID: <CAK7LNAQ7E52H+f+Ref6JYqMnG1v78Wo2p+W__=52dw7EP=b0Ww@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: check the minimum assembler version in Kconfig
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jian Cai <jiancai@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 5, 2021 at 10:26 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Mar 3, 2021 at 10:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
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
> > we are still interested in the version of the assembler sitting behind.
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
>
> Was this a feature request to "please implement -Wa,--version for clang?" :-P
> https://github.com/ClangBuiltLinux/linux/issues/1320
>
> >
> > With all this in my mind, I implemented scripts/as-version.sh.
> >
> >   $ scripts/as-version.sh gcc
> >   GNU 23501
> >   $ scripts/as-version.sh clang -no-integrated-as
> >   GNU 23501
> >   $ scripts/as-version.sh clang -integrated-as
> >   LLVM 0
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/Kconfig            |  3 +-
> >  init/Kconfig            | 12 +++++++
> >  scripts/Kconfig.include |  6 ++++
> >  scripts/as-version.sh   | 77 +++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 96 insertions(+), 2 deletions(-)
> >  create mode 100755 scripts/as-version.sh
> >
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 2af10ebe5ed0..d7214f4ae1f7 100644
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
> > index 22946fe5ded9..f76e5a44e4fe 100644
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
> > +       # If it is integrated assembler, the version is the same as Clang's one.
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
> > index 000000000000..205d8b9fc4d4
> > --- /dev/null
> > +++ b/scripts/as-version.sh
> > @@ -0,0 +1,77 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Print the assembler name and its version in a 5 or 6-digit form.
> > +# Also, perform the minimum version check.
> > +# (If it is the integrated assembler, return 0 as the version, and
> > +# the version check is skipped.)
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
> > +orig_args="$@"
> > +
> > +# Get the first line of the --version output.
> > +IFS='
> > +'
> > +# Add 2>&1 to check both stdout and stderr.
> > +# If the backing assembler is binutils, we get the version string in stdout.
> > +# If it is clang's integrated assembler, we get the following error in stderr:
> > +#   clang: error: unsupported argument '--version' to option 'Wa,'
> > +# To avoid the error message affected by locale, set LC_MESSAGES=C just in case.
> > +set -- $(LC_MESSAGES=C "$@" -Wno-unused-command-line-argument -Wa,--version -c -x assembler /dev/null -o /dev/null 2>&1)
> > +line="$1"
> > +
> > +if [ "$line" = "clang: error: unsupported argument '--version' to option 'Wa,'" ]; then
>
> Checking the precise error message is too brittle; what if it changes?
> Why not check the return code a la cc-option and friends?  Is checking
> the return code of a subshell an issue here?

As Nathan pointed out, this is fragile.

I just tried my best to make this script work stand-alone.

With the only exit code chec,

 scripts/as-version.sh false

would return LLVM, which is false-positive.
Probably this is not a big deal
since completely wrong input was blocked by
scripts/cc-version.sh


If we give up making this script stand-alone,
another idea is to check LLVM_IAS=1, which
is passed from the top Makefile.

Yet another idea is to explicitly pass
-integrated-as as CLANG_FLAGS.
Then, this script can parse the presence
of -integrated-as.


BTW, is there any guarantee that the integrated assembler
is always enabled by default? Or, is it dependent on
the configuration?

The top Makefile adds -no-integrated-as if LLVM_IAS != 1,
but adds nothing if LLVM_IAS == 1.
So, -integrated-as must be always default.







>
> > +       # For the intergrated assembler, we do not check the version here.
>
> s/intergrated/integrated/
>
> > +       # It is the same as the clang version, and it has been already checked
> > +       # by scripts/cc-version.sh.
> > +       echo LLVM 0
> > +       exit 0
> > +fi
> > +
> > +# Split the line on spaces.
> > +IFS=' '
> > +set -- $line
> > +
> > +tool_version=$(dirname $0)/tool-version.sh
> > +
> > +if [ "$1" = GNU -a "$2" = assembler ]; then
> > +       shift $(($# - 1))
> > +       version=$1
> > +       min_version=$($tool_version binutils)
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
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
