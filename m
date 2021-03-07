Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919DB32FEAE
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Mar 2021 05:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhCGEnb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Mar 2021 23:43:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:59984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230053AbhCGEm6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Mar 2021 23:42:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42A8D64FC5;
        Sun,  7 Mar 2021 04:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615092177;
        bh=J1vZuNjBBp2GJXwQ7PPfuAfME/ppPxBvc7UkWr7JKQo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UVTBeq5KThBL7CG35M46mR+EaHsrOq2s8Fl6XMKQd6WBsDQ9Ey+PE9Hp5Wh9SAifb
         bBcSoI0ZHhZF55gWgd+Am7nvnCjfgetmrPgQYe9fpAkUoGxf1YCKV6PKABZgVLw5IL
         J8wy1PU7J/du1GX33bQKUxuzGbxWfZHlkhjpZazjvNhrMDmawfLkBc8auP58J4Mwjy
         brZHsgE1GvpRB4K1OvTF+PzUEqvKUleZXl1RrnJD+4oIwGhmSgF1TMuCibqWkeeQiU
         s10us5FiKlc9vJuU4BgtQzzG2L+lTyQFtuRl+e77qv3nKZonFliUANqOD2s12su3zm
         y8CoXRVFKOqqA==
Date:   Sat, 6 Mar 2021 21:42:53 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jian Cai <jiancai@google.com>
Subject: Re: [PATCH 3/4] kbuild: check the minimum assembler version in
 Kconfig
Message-ID: <20210307044253.v3h47ucq6ng25iay@archlinux-ax161>
References: <20210303183333.46543-1-masahiroy@kernel.org>
 <20210303183333.46543-3-masahiroy@kernel.org>
 <CAKwvOdmdQvwDN6Bg2Kom1Nm+HrNfCqOqnDLYTYs+5sRSEuZsJg@mail.gmail.com>
 <CAK7LNAQ7E52H+f+Ref6JYqMnG1v78Wo2p+W__=52dw7EP=b0Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ7E52H+f+Ref6JYqMnG1v78Wo2p+W__=52dw7EP=b0Ww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 06, 2021 at 02:48:38AM +0900, Masahiro Yamada wrote:
> On Fri, Mar 5, 2021 at 10:26 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Mar 3, 2021 at 10:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Documentation/process/changes.rst defines the minimum assembler version
> > > (binutils version), but we have never checked it in the build time.
> > >
> > > Kbuild never invokes 'as' directly because all assembly files in the
> > > kernel tree are *.S, hence must be preprocessed. I do not expect
> > > raw assembly source files (*.s) would be added to the kernel tree.
> > >
> > > Therefore, we always use $(CC) as the assembler driver, and commit
> > > aa824e0c962b ("kbuild: remove AS variable") removed 'AS'. However,
> > > we are still interested in the version of the assembler sitting behind.
> > >
> > > As usual, the --version option prints the version string.
> > >
> > >   $ as --version | head -n 1
> > >   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
> > >
> > > But, we do not have $(AS). So, we can add the -Wa prefix so that
> > > $(CC) passes --version down to the backing assembler.
> > >
> > >   $ gcc -Wa,--version | head -n 1
> > >   gcc: fatal error: no input files
> > >   compilation terminated.
> > >
> > > OK, we need to input something to satisfy gcc.
> > >
> > >   $ gcc -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
> > >   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
> > >
> > > The combination of Clang and GNU assembler works in the same way:
> > >
> > >   $ clang -no-integrated-as -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
> > >   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
> > >
> > > Clang with the integrated assembler fails like this:
> > >
> > >   $ clang -integrated-as -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
> > >   clang: error: unsupported argument '--version' to option 'Wa,'
> >
> > Was this a feature request to "please implement -Wa,--version for clang?" :-P
> > https://github.com/ClangBuiltLinux/linux/issues/1320
> >
> > >
> > > With all this in my mind, I implemented scripts/as-version.sh.
> > >
> > >   $ scripts/as-version.sh gcc
> > >   GNU 23501
> > >   $ scripts/as-version.sh clang -no-integrated-as
> > >   GNU 23501
> > >   $ scripts/as-version.sh clang -integrated-as
> > >   LLVM 0
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  arch/Kconfig            |  3 +-
> > >  init/Kconfig            | 12 +++++++
> > >  scripts/Kconfig.include |  6 ++++
> > >  scripts/as-version.sh   | 77 +++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 96 insertions(+), 2 deletions(-)
> > >  create mode 100755 scripts/as-version.sh
> > >
> > > diff --git a/arch/Kconfig b/arch/Kconfig
> > > index 2af10ebe5ed0..d7214f4ae1f7 100644
> > > --- a/arch/Kconfig
> > > +++ b/arch/Kconfig
> > > @@ -631,8 +631,7 @@ config ARCH_SUPPORTS_LTO_CLANG_THIN
> > >  config HAS_LTO_CLANG
> > >         def_bool y
> > >         # Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
> > > -       depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD
> > > -       depends on $(success,test $(LLVM_IAS) -eq 1)
> > > +       depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
> > >         depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
> > >         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
> > >         depends on ARCH_SUPPORTS_LTO_CLANG
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index 22946fe5ded9..f76e5a44e4fe 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -41,6 +41,18 @@ config CLANG_VERSION
> > >         default $(cc-version) if CC_IS_CLANG
> > >         default 0
> > >
> > > +config AS_IS_GNU
> > > +       def_bool $(success,test "$(as-name)" = GNU)
> > > +
> > > +config AS_IS_LLVM
> > > +       def_bool $(success,test "$(as-name)" = LLVM)
> > > +
> > > +config AS_VERSION
> > > +       int
> > > +       # If it is integrated assembler, the version is the same as Clang's one.
> > > +       default CLANG_VERSION if AS_IS_LLVM
> > > +       default $(as-version)
> > > +
> > >  config LD_IS_BFD
> > >         def_bool $(success,test "$(ld-name)" = BFD)
> > >
> > > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > > index 58fdb5308725..0496efd6e117 100644
> > > --- a/scripts/Kconfig.include
> > > +++ b/scripts/Kconfig.include
> > > @@ -45,6 +45,12 @@ $(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not su
> > >  cc-name := $(shell,set -- $(cc-info) && echo $1)
> > >  cc-version := $(shell,set -- $(cc-info) && echo $2)
> > >
> > > +# Get the assembler name, version, and error out if it is not supported.
> > > +as-info := $(shell,$(srctree)/scripts/as-version.sh $(CC) $(CLANG_FLAGS))
> > > +$(error-if,$(success,test -z "$(as-info)"),Sorry$(comma) this assembler is not supported.)
> > > +as-name := $(shell,set -- $(as-info) && echo $1)
> > > +as-version := $(shell,set -- $(as-info) && echo $2)
> > > +
> > >  # Get the linker name, version, and error out if it is not supported.
> > >  ld-info := $(shell,$(srctree)/scripts/ld-version.sh $(LD))
> > >  $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supported.)
> > > diff --git a/scripts/as-version.sh b/scripts/as-version.sh
> > > new file mode 100755
> > > index 000000000000..205d8b9fc4d4
> > > --- /dev/null
> > > +++ b/scripts/as-version.sh
> > > @@ -0,0 +1,77 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Print the assembler name and its version in a 5 or 6-digit form.
> > > +# Also, perform the minimum version check.
> > > +# (If it is the integrated assembler, return 0 as the version, and
> > > +# the version check is skipped.)
> > > +
> > > +set -e
> > > +
> > > +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> > > +get_canonical_version()
> > > +{
> > > +       IFS=.
> > > +       set -- $1
> > > +
> > > +       # If the 2nd or 3rd field is missing, fill it with a zero.
> > > +       #
> > > +       # The 4th field, if present, is ignored.
> > > +       # This occurs in development snapshots as in 2.35.1.20201116
> > > +       echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> > > +}
> > > +
> > > +orig_args="$@"
> > > +
> > > +# Get the first line of the --version output.
> > > +IFS='
> > > +'
> > > +# Add 2>&1 to check both stdout and stderr.
> > > +# If the backing assembler is binutils, we get the version string in stdout.
> > > +# If it is clang's integrated assembler, we get the following error in stderr:
> > > +#   clang: error: unsupported argument '--version' to option 'Wa,'
> > > +# To avoid the error message affected by locale, set LC_MESSAGES=C just in case.
> > > +set -- $(LC_MESSAGES=C "$@" -Wno-unused-command-line-argument -Wa,--version -c -x assembler /dev/null -o /dev/null 2>&1)
> > > +line="$1"
> > > +
> > > +if [ "$line" = "clang: error: unsupported argument '--version' to option 'Wa,'" ]; then
> >
> > Checking the precise error message is too brittle; what if it changes?
> > Why not check the return code a la cc-option and friends?  Is checking
> > the return code of a subshell an issue here?
> 
> As Nathan pointed out, this is fragile.
> 
> I just tried my best to make this script work stand-alone.
> 
> With the only exit code chec,
> 
>  scripts/as-version.sh false
> 
> would return LLVM, which is false-positive.
> Probably this is not a big deal
> since completely wrong input was blocked by
> scripts/cc-version.sh
> 
> 
> If we give up making this script stand-alone,
> another idea is to check LLVM_IAS=1, which
> is passed from the top Makefile.
> 
> Yet another idea is to explicitly pass
> -integrated-as as CLANG_FLAGS.
> Then, this script can parse the presence
> of -integrated-as.

This is probably the easiest thing to do for all versions of LLVM
(adding -Wa,--version support to the integrated assembler as Nick
suggests only fixes future versions of LLVM) and goes along with the
"explicit is better than implicit" policy, which I tend to align with.
It makes easy to quickly see what assembler was used when looking at a
clang invocation as well.

> BTW, is there any guarantee that the integrated assembler
> is always enabled by default? Or, is it dependent on
> the configuration?

There is a virtual method called IsIntegratedAssemblerDefault(), which
defaults to false but is overridden to true by various targets. For all
of the architectures/targets that the kernel cares about, this appears
to be true.

https://github.com/llvm/llvm-project/blob/45f949ee469f3e59d30a88c97aa7c1139069b261/clang/lib/Driver/ToolChains/Gnu.cpp#L2738-L2774

Cheers,
Nathan

> The top Makefile adds -no-integrated-as if LLVM_IAS != 1,
> but adds nothing if LLVM_IAS == 1.
> So, -integrated-as must be always default.
> 
> 
> 
> 
> 
> 
> 
> >
> > > +       # For the intergrated assembler, we do not check the version here.
> >
> > s/intergrated/integrated/
> >
> > > +       # It is the same as the clang version, and it has been already checked
> > > +       # by scripts/cc-version.sh.
> > > +       echo LLVM 0
> > > +       exit 0
> > > +fi
> > > +
> > > +# Split the line on spaces.
> > > +IFS=' '
> > > +set -- $line
> > > +
> > > +tool_version=$(dirname $0)/tool-version.sh
> > > +
> > > +if [ "$1" = GNU -a "$2" = assembler ]; then
> > > +       shift $(($# - 1))
> > > +       version=$1
> > > +       min_version=$($tool_version binutils)
> > > +       name=GNU
> > > +else
> > > +       echo "$orig_args: unknown assembler invoked" >&2
> > > +       exit 1
> > > +fi
> > > +
> > > +# Some distributions append a package release number, as in 2.34-4.fc32
> > > +# Trim the hyphen and any characters that follow.
> > > +version=${version%-*}
> > > +
> > > +cversion=$(get_canonical_version $version)
> > > +min_cversion=$(get_canonical_version $min_version)
> > > +
> > > +if [ "$cversion" -lt "$min_cversion" ]; then
> > > +       echo >&2 "***"
> > > +       echo >&2 "*** Assembler is too old."
> > > +       echo >&2 "***   Your $name assembler version:    $version"
> > > +       echo >&2 "***   Minimum $name assembler version: $min_version"
> > > +       echo >&2 "***"
> > > +       exit 1
> > > +fi
> > > +
> > > +echo $name $cversion
> > > --
> > > 2.27.0
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
