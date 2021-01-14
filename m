Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879D42F6C71
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 21:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbhANUpt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 15:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728307AbhANUpt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 15:45:49 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC549C061575;
        Thu, 14 Jan 2021 12:45:08 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id w18so14001403iot.0;
        Thu, 14 Jan 2021 12:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=qMjTCiZSGbUw9jzjMEpe7nFKlPtvgkQsUv6Wc9RBu0A=;
        b=pRoMF7DsxYlKJmmnHSQ1CRD3htxZj+GohS9aAiIAqHWCC8yr/s/UhcwQMAexe341GO
         WEASzQPb64gZcRFmL9MYowL3LDpudCmpb8C3oAmLjku2+hv3WDIgnGXKltFx73F5aU7w
         AdRyKToxe7giIPOkw8iGJRj7JXUn95BdtsR4uWV7y1xIrs7Altv9vNfHR4JZPm3x4lfd
         bEgbuHb1CtykJZfBOpG+TYsaEbvGVzV/mqd8exw3hkt5ASa1Ht4cLU2QurLKGp3Y43Xi
         D8k0c0io/hfzqkC7/JvjDyd3G2tW2N9L0NQoUqCj/8uCQGGsz9PZpq67UjYvFGJQSPTq
         nVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=qMjTCiZSGbUw9jzjMEpe7nFKlPtvgkQsUv6Wc9RBu0A=;
        b=A21KoKsn5Lh21XhZ8h6aVpzahH4K/kuNgI86IMUA/e6g2oGvePUYvXwM1uFJWdmE/b
         JnYFlgLL+dpGJXlLyHfP0kX8AFY1JM+OjBGvQw0baJ9bNY4PzxrfExoeExn/VC9P8mNx
         vcW+zYzu0HoobrLbFFEYJvx7Ex+H6ZYrSAh+tNHhHZQDPf/ucZesKFeKzLZx7SwKsO3p
         /7NqCaZJF/EHMV52kX7t8BLHLQJR4A2ur39HqrTUaB1PXG3gmMgeGg1fm0VDRTV1Mzih
         1Mz6TeQoAXppycpNeDjfvo23Qn2scIBbbyWwNwOdOL4C5J0btqanePJ93q4A5hVVJLsZ
         bgYg==
X-Gm-Message-State: AOAM532ok2ZTI9OFsM4iweniqzXYSft/BhHwvx4hNitDJa98NXQSEU27
        2Ua04uD4S2ynwlr69CjrSHe5BDo2hD63mfVt8Wu59sXIVHdeOGeM
X-Google-Smtp-Source: ABdhPJx6pfqEqylaZd4qP4S/n0BKyST6BvXYHnsBWsuBhTCkHPy2Rk0ZONPs+w8rNCmqR7SNMUjHj0TodEPqQdWDP6s=
X-Received: by 2002:a05:6638:48:: with SMTP id a8mr7720947jap.138.1610657108068;
 Thu, 14 Jan 2021 12:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20210114185354.308083-1-masahiroy@kernel.org> <CA+icZUUE4yL24-LEO5hkoPLDtCTyx8iiSng2SWf7uWx0TJypvA@mail.gmail.com>
In-Reply-To: <CA+icZUUE4yL24-LEO5hkoPLDtCTyx8iiSng2SWf7uWx0TJypvA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 14 Jan 2021 21:44:56 +0100
Message-ID: <CA+icZUWaUihK+kzs2q0aBhuuccXPfmq9BT_NCebjJdASDWTMsg@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: check the minimum compiler version in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 9:41 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Jan 14, 2021 at 7:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Paul Gortmaker reported a regression in the GCC version check [1].
> > If you use GCC 4.8, the build breaks before showing the error message
> > "error Sorry, your version of GCC is too old - please use 4.9 or newer."
> >
> > I do not want to apply his fix-up since it implies we would not be able
> > to remove any cc-option test. Anyway, I admit checking the GCC version
> > in <linux/compiler-gcc.h> is too late.
> >
> > Almost at the same time, Linus also suggested to move the compiler
> > version error to Kconfig time. [2]
> >
> > I unified the similar two scripts, gcc-version.sh and clang-version.sh
> > into the new cc-version.sh. The old scripts invoked the compiler multiple
> > times (3 times for gcc-version.sh, 4 times for clang-version.sh). I
> > refactored the code so the new one invokes the compiler just once, and
> > also tried my best to use shell-builtin commands where possible.
> >
> > The new script runs faster.
> >
> >   $ time ./scripts/clang-version.sh clang
> >   120000
> >
> >   real    0m0.029s
> >   user    0m0.012s
> >   sys     0m0.021s
> >
> >   $ time ./scripts/cc-version.sh clang
> >   Clang 120000
> >
> >   real    0m0.009s
> >   user    0m0.006s
> >   sys     0m0.004s
> >
> > The cc-version.sh also shows the error if the compiler is old:
> >
> >   $ make defconfig CC=clang-9
> >   *** Default configuration is based on 'x86_64_defconfig'
> >   ***
> >   *** Compiler is too old.
> >   ***   Your Clang version:    9.0.1
> >   ***   Minimum Clang version: 10.0.1
> >   ***
> >   scripts/Kconfig.include:46: Sorry, this compiler is not supported.
> >   make[1]: *** [scripts/kconfig/Makefile:81: defconfig] Error 1
> >   make: *** [Makefile:602: defconfig] Error 2
> >
> > I removed the clang version check from <linux/compiler-clang.h>
> >
> > For now, I did not touch <linux/compiler-gcc.h> in order to avoid
> > merge conflict with [3], which has been queued up in the arm64 tree.
> > We can clean it up later.
> >
> > The new script takes care of ICC because we have <linux/compiler-intel.h>
> > although I am not sure if building the kernel with ICC is well-supported.
> >
> > [1]: https://lore.kernel.org/r/20210110190807.134996-1-paul.gortmaker@windriver.com
> > [2]: https://lore.kernel.org/r/CAHk-=wh-+TMHPTFo1qs-MYyK7tZh-OQovA=pP3=e06aCVp6_kA@mail.gmail.com
> > [3]: https://lore.kernel.org/r/20210112224832.10980-1-will@kernel.org
> >
> > Fixes: 87de84c9140e ("kbuild: remove cc-option test of -Werror=date-time")
> > Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> > Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> > Tested-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Applied v4 to my custom clang-cfi patchset.
>
> Here I tested with all Clang compilers I have installed:
>
> [ Debian ]
>
> dileks@iniza:~/src/linux-kernel/git$ scripts/cc-version.sh clang-11
> Clang 110100

^^^ That's from my selfmade toolchain.

dileks@iniza:~/src/linux-kernel/git$ scripts/cc-version.sh /usr/bin/clang-11
Clang 110001

- Sedat -

> dileks@iniza:~/src/linux-kernel/git$ scripts/cc-version.sh clang-10
> Clang 100001
> dileks@iniza:~/src/linux-kernel/git$ scripts/cc-version.sh clang-9***
> *** Compiler is too old.
> ***   Your Clang version:    9.0.1
> ***   Minimum Clang version: 10.0.1
> ***
>
> [ Selfmade LLVM toolchain v11.1.0-rc1 ]
>
> dileks@iniza:~/src/linux-kernel/git$ which clang
> /opt/llvm-toolchain/bin/clang
> dileks@iniza:~/src/linux-kernel/git$ scripts/cc-version.sh clang
> Clang 110100
>
> [ LLVM-12 from <apt.llvm.org> ]
>
> dileks@iniza:~/src/linux-kernel/git$ scripts/cc-version.sh clang-12
> Clang 120000
>
> Feel free to add my:
>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> - Sedat -
>
> > ---
> >
> > Changes in v4:
> >   - use lore version of the links
> >
> > Changes in v3:
> >   - add $(srctree)/ to fix out-of-tree build
> >   - support ICC version
> >
> > Changes in v2:
> >   - fix the function name
> >
> >  include/linux/compiler-clang.h | 10 -----
> >  init/Kconfig                   |  9 ++--
> >  scripts/Kconfig.include        |  6 +++
> >  scripts/cc-version.sh          | 76 ++++++++++++++++++++++++++++++++++
> >  scripts/clang-version.sh       | 19 ---------
> >  scripts/gcc-version.sh         | 20 ---------
> >  6 files changed, 87 insertions(+), 53 deletions(-)
> >  create mode 100755 scripts/cc-version.sh
> >  delete mode 100755 scripts/clang-version.sh
> >  delete mode 100755 scripts/gcc-version.sh
> >
> > diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> > index 98cff1b4b088..04c0a5a717f7 100644
> > --- a/include/linux/compiler-clang.h
> > +++ b/include/linux/compiler-clang.h
> > @@ -3,16 +3,6 @@
> >  #error "Please don't include <linux/compiler-clang.h> directly, include <linux/compiler.h> instead."
> >  #endif
> >
> > -#define CLANG_VERSION (__clang_major__ * 10000 \
> > -                    + __clang_minor__ * 100    \
> > -                    + __clang_patchlevel__)
> > -
> > -#if CLANG_VERSION < 100001
> > -#ifndef __BPF_TRACING__
> > -# error Sorry, your version of Clang is too old - please use 10.0.1 or newer.
> > -#endif
> > -#endif
> > -
> >  /* Compiler specific definitions for Clang compiler */
> >
> >  /* same as gcc, this was present in clang-2.6 so we can assume it works
> > diff --git a/init/Kconfig b/init/Kconfig
> > index b77c60f8b963..01108dd1318b 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -26,11 +26,11 @@ config CC_VERSION_TEXT
> >             and then every file will be rebuilt.
> >
> >  config CC_IS_GCC
> > -       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q gcc)
> > +       def_bool $(success,test $(cc-name) = GCC)
> >
> >  config GCC_VERSION
> >         int
> > -       default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> > +       default $(cc-version) if CC_IS_GCC
> >         default 0
> >
> >  config LD_VERSION
> > @@ -38,14 +38,15 @@ config LD_VERSION
> >         default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> >
> >  config CC_IS_CLANG
> > -       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> > +       def_bool $(success,test $(cc-name) = Clang)
> >
> >  config LD_IS_LLD
> >         def_bool $(success,$(LD) -v | head -n 1 | grep -q LLD)
> >
> >  config CLANG_VERSION
> >         int
> > -       default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> > +       default $(cc-version) if CC_IS_CLANG
> > +       default 0
> >
> >  config LLD_VERSION
> >         int
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index a5fe72c504ff..0228cb9c74aa 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -39,6 +39,12 @@ as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler
> >  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> >  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
> >
> > +# Get the compiler name, version, and error out if it is not supported.
> > +cc-info := $(shell,$(srctree)/scripts/cc-version.sh $(CC))
> > +$(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not supported.)
> > +cc-name := $(shell,set -- $(cc-info) && echo $1)
> > +cc-version := $(shell,set -- $(cc-info) && echo $2)
> > +
> >  # Fail if the linker is gold as it's not capable of linking the kernel proper
> >  $(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
> >
> > diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
> > new file mode 100755
> > index 000000000000..818d233bb0ad
> > --- /dev/null
> > +++ b/scripts/cc-version.sh
> > @@ -0,0 +1,76 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Print the compiler name and its version in a 5 or 6-digit form.
> > +# Also, perform the minimum version check.
> > +
> > +set -e
> > +
> > +# When you raise the compiler version, please update
> > +# Documentation/process/changes.rst as well.
> > +gcc_min_version=4.9.0
> > +clang_min_version=10.0.1
> > +icc_min_version=16.0.3 # temporary
> > +
> > +# print the compiler name and versions
> > +get_compiler_info()
> > +{
> > +       cat <<- EOF | "$@" -E -P -x c - 2>/dev/null
> > +       #if defined(__clang__)
> > +       Clang   __clang_major__  __clang_minor__  __clang_patchlevel__
> > +       #elif defined(__INTEL_COMPILER)
> > +       ICC     __INTEL_COMPILER  __INTEL_COMPILER_UPDATE
> > +       #elif defined(__GNUC__)
> > +       GCC     __GNUC__  __GNUC_MINOR__  __GNUC_PATCHLEVEL__
> > +       #else
> > +       unknown
> > +       #endif
> > +       EOF
> > +}
> > +
> > +# convert the version string x.y.z to a canonical 5 or 6-digit form
> > +get_canonical_version()
> > +{
> > +       IFS=.
> > +       set -- $1
> > +       echo $((10000 * $1 + 100 * $2 + $3))
> > +}
> > +
> > +# $@ instead of $1 because multiple words might be given e.g. CC="ccache gcc"
> > +orig_args="$@"
> > +set -- $(get_compiler_info "$@")
> > +
> > +name=$1
> > +
> > +case "$name" in
> > +GCC)
> > +       version=$2.$3.$4
> > +       min_version=$gcc_min_version
> > +       ;;
> > +Clang)
> > +       version=$2.$3.$4
> > +       min_version=$clang_min_version
> > +       ;;
> > +ICC)
> > +       version=$(($2 / 100)).$(($2 % 100)).$3
> > +       min_version=$icc_min_version
> > +       ;;
> > +*)
> > +       echo "$orig_args: unknown compiler" >&2
> > +       exit 1
> > +       ;;
> > +esac
> > +
> > +cversion=$(get_canonical_version $version)
> > +min_cversion=$(get_canonical_version $min_version)
> > +
> > +if [ "$cversion" -lt "$min_cversion" ]; then
> > +       echo >&2 "***"
> > +       echo >&2 "*** Compiler is too old."
> > +       echo >&2 "***   Your $name version:    $version"
> > +       echo >&2 "***   Minimum $name version: $min_version"
> > +       echo >&2 "***"
> > +       exit 1
> > +fi
> > +
> > +echo $name $cversion
> > diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
> > deleted file mode 100755
> > index 6fabf0695761..000000000000
> > --- a/scripts/clang-version.sh
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -#!/bin/sh
> > -# SPDX-License-Identifier: GPL-2.0
> > -#
> > -# clang-version clang-command
> > -#
> > -# Print the compiler version of `clang-command' in a 5 or 6-digit form
> > -# such as `50001' for clang-5.0.1 etc.
> > -
> > -compiler="$*"
> > -
> > -if ! ( $compiler --version | grep -q clang) ; then
> > -       echo 0
> > -       exit 1
> > -fi
> > -
> > -MAJOR=$(echo __clang_major__ | $compiler -E -x c - | tail -n 1)
> > -MINOR=$(echo __clang_minor__ | $compiler -E -x c - | tail -n 1)
> > -PATCHLEVEL=$(echo __clang_patchlevel__ | $compiler -E -x c - | tail -n 1)
> > -printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> > diff --git a/scripts/gcc-version.sh b/scripts/gcc-version.sh
> > deleted file mode 100755
> > index ae353432539b..000000000000
> > --- a/scripts/gcc-version.sh
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -#!/bin/sh
> > -# SPDX-License-Identifier: GPL-2.0
> > -#
> > -# gcc-version gcc-command
> > -#
> > -# Print the gcc version of `gcc-command' in a 5 or 6-digit form
> > -# such as `29503' for gcc-2.95.3, `30301' for gcc-3.3.1, etc.
> > -
> > -compiler="$*"
> > -
> > -if [ ${#compiler} -eq 0 ]; then
> > -       echo "Error: No compiler specified." >&2
> > -       printf "Usage:\n\t$0 <gcc-command>\n" >&2
> > -       exit 1
> > -fi
> > -
> > -MAJOR=$(echo __GNUC__ | $compiler -E -x c - | tail -n 1)
> > -MINOR=$(echo __GNUC_MINOR__ | $compiler -E -x c - | tail -n 1)
> > -PATCHLEVEL=$(echo __GNUC_PATCHLEVEL__ | $compiler -E -x c - | tail -n 1)
> > -printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> > --
> > 2.27.0
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210114185354.308083-1-masahiroy%40kernel.org.
