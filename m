Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3C4A2FAEA9
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 03:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394041AbhASCQF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 21:16:05 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:49966 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394033AbhASCQE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 21:16:04 -0500
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10J2Eq1g026178;
        Tue, 19 Jan 2021 11:14:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10J2Eq1g026178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611022493;
        bh=lFRLO4SOxuDA8AZCJxrZ+ZD2ELeuIiYDYNpVtDOtDUc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Uy8cHBcd9CWY5CHZlXx2fSdIm4f727g5nuCEPIaeUiVV1RF68737vBkLunrQDhNfc
         1pDpxzhd/GoE/27g+RrrLXp1XC/rWEk4KY9n/Cidxwn+hYcRRNBdY+VtP9jZzc1wjB
         qga5d4zaQWTNvmPYt15Ihv8r8xBxOXqeg46jCsYTVGd/PbOD4VRv6Verwilb8JsWnQ
         4Gw6IF7hdxHQ+szempzLwZMoVYJ8zSrK+aPz4lKN2aPzVVZ2Nobg930Rr7VFRtJOUm
         QVDfb6FqdNd1e1fZACTDJ6+at7r/bO9C06pjBGSUjtRjrMnTVWvq8XH6WoQfhj0O9I
         Wwm6YOcEJP1EA==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id md11so10752785pjb.0;
        Mon, 18 Jan 2021 18:14:52 -0800 (PST)
X-Gm-Message-State: AOAM533wlq6lvgxvc9z0G13f8HwpVkBDoXZPkfmeJ705m6kYuPm/eGng
        1jlN4KVOyyg020Yfv1xfDvEmWM8Jfpbn9G4efiw=
X-Google-Smtp-Source: ABdhPJxXZpgPFfp/ic5SU1zRW6x/BnEVgAQmdSa0OhR9yqFr6+QntBjJQh7Ydmanrp+mZcLAfWZZDdyjrpyrbSdWZNs=
X-Received: by 2002:a17:902:a5c5:b029:de:30b0:f1d with SMTP id
 t5-20020a170902a5c5b02900de30b00f1dmr2123483plq.1.1611022491761; Mon, 18 Jan
 2021 18:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20210115233542.70789-1-masahiroy@kernel.org>
In-Reply-To: <20210115233542.70789-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 19 Jan 2021 11:14:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUf88R=WM5H6Lg3iU85XW_vKxVEx8wf0uiMNe_bK2Osw@mail.gmail.com>
Message-ID: <CAK7LNARUf88R=WM5H6Lg3iU85XW_vKxVEx8wf0uiMNe_bK2Osw@mail.gmail.com>
Subject: Re: [PATCH v6] kbuild: check the minimum compiler version in Kconfig
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 16, 2021 at 8:36 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Paul Gortmaker reported a regression in the GCC version check. [1]
> If you use GCC 4.8, the build breaks before showing the error message
> "error Sorry, your version of GCC is too old - please use 4.9 or newer."
>
> I do not want to apply his fix-up since it implies we would not be able
> to remove any cc-option test. Anyway, I admit checking the GCC version
> in <linux/compiler-gcc.h> is too late.
>
> Almost at the same time, Linus also suggested to move the compiler
> version error to Kconfig time. [2]
>
> I unified the two similar scripts, gcc-version.sh and clang-version.sh
> into cc-version.sh. The old scripts invoked the compiler multiple times
> (3 times for gcc-version.sh, 4 times for clang-version.sh). I refactored
> the code so the new one invokes the compiler just once, and also tried
> my best to use shell-builtin commands where possible.
>
> The new script runs faster.
>
>   $ time ./scripts/clang-version.sh clang
>   120000
>
>   real    0m0.029s
>   user    0m0.012s
>   sys     0m0.021s
>
>   $ time ./scripts/cc-version.sh clang
>   Clang 120000
>
>   real    0m0.009s
>   user    0m0.006s
>   sys     0m0.004s
>
> cc-version.sh also shows the error if the compiler is too old:
>
>   $ make defconfig CC=clang-9
>   *** Default configuration is based on 'x86_64_defconfig'
>   ***
>   *** Compiler is too old.
>   ***   Your Clang version:    9.0.1
>   ***   Minimum Clang version: 10.0.1
>   ***
>   scripts/Kconfig.include:46: Sorry, this compiler is not supported.
>   make[1]: *** [scripts/kconfig/Makefile:81: defconfig] Error 1
>   make: *** [Makefile:602: defconfig] Error 2
>
> The new script takes care of ICC because we have <linux/compiler-intel.h>
> although I am not sure if building the kernel with ICC is well-supported.
>
> [1]: https://lore.kernel.org/r/20210110190807.134996-1-paul.gortmaker@windriver.com
> [2]: https://lore.kernel.org/r/CAHk-=wh-+TMHPTFo1qs-MYyK7tZh-OQovA=pP3=e06aCVp6_kA@mail.gmail.com
>
> Fixes: 87de84c9140e ("kbuild: remove cc-option test of -Werror=date-time")
> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


> Changes in v6:
>   - Now that https://lore.kernel.org/r/20210112224832.10980-1-will@kernel.org
>     landed in Linus' tree, I cleaned up <linux/compiler-gcc.h> as well.
>
> Changes in v5:
>   - double-quote $(cc-name) in the CC_IS_GCC and CC_IS_CLANG
>
> Changes in v4:
>   - use lore version of the links
>
> Changes in v3:
>   - add $(srctree)/ to fix out-of-tree build
>   - support ICC version
>
> Changes in v2:
>   - fix the function name
>
>  include/linux/compiler-clang.h | 10 -----
>  include/linux/compiler-gcc.h   | 11 -----
>  init/Kconfig                   |  9 ++--
>  scripts/Kconfig.include        |  6 +++
>  scripts/cc-version.sh          | 82 ++++++++++++++++++++++++++++++++++
>  scripts/clang-version.sh       | 19 --------
>  scripts/gcc-version.sh         | 20 ---------
>  7 files changed, 93 insertions(+), 64 deletions(-)
>  create mode 100755 scripts/cc-version.sh
>  delete mode 100755 scripts/clang-version.sh
>  delete mode 100755 scripts/gcc-version.sh
>
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index 98cff1b4b088..04c0a5a717f7 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -3,16 +3,6 @@
>  #error "Please don't include <linux/compiler-clang.h> directly, include <linux/compiler.h> instead."
>  #endif
>
> -#define CLANG_VERSION (__clang_major__ * 10000 \
> -                    + __clang_minor__ * 100    \
> -                    + __clang_patchlevel__)
> -
> -#if CLANG_VERSION < 100001
> -#ifndef __BPF_TRACING__
> -# error Sorry, your version of Clang is too old - please use 10.0.1 or newer.
> -#endif
> -#endif
> -
>  /* Compiler specific definitions for Clang compiler */
>
>  /* same as gcc, this was present in clang-2.6 so we can assume it works
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index 555ab0fddbef..48750243db4c 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -10,17 +10,6 @@
>                      + __GNUC_MINOR__ * 100     \
>                      + __GNUC_PATCHLEVEL__)
>
> -/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */
> -#if GCC_VERSION < 40900
> -# error Sorry, your version of GCC is too old - please use 4.9 or newer.
> -#elif defined(CONFIG_ARM64) && GCC_VERSION < 50100
> -/*
> - * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> - * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> - */
> -# error Sorry, your version of GCC is too old - please use 5.1 or newer.
> -#endif
> -
>  /*
>   * This macro obfuscates arithmetic on a variable address so that gcc
>   * shouldn't recognize the original var, and make assumptions about it.
> diff --git a/init/Kconfig b/init/Kconfig
> index b77c60f8b963..8f04e5db2001 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -26,11 +26,11 @@ config CC_VERSION_TEXT
>             and then every file will be rebuilt.
>
>  config CC_IS_GCC
> -       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q gcc)
> +       def_bool $(success,test "$(cc-name)" = GCC)
>
>  config GCC_VERSION
>         int
> -       default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> +       default $(cc-version) if CC_IS_GCC
>         default 0
>
>  config LD_VERSION
> @@ -38,14 +38,15 @@ config LD_VERSION
>         default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
>
>  config CC_IS_CLANG
> -       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> +       def_bool $(success,test "$(cc-name)" = Clang)
>
>  config LD_IS_LLD
>         def_bool $(success,$(LD) -v | head -n 1 | grep -q LLD)
>
>  config CLANG_VERSION
>         int
> -       default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> +       default $(cc-version) if CC_IS_CLANG
> +       default 0
>
>  config LLD_VERSION
>         int
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index a5fe72c504ff..0228cb9c74aa 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -39,6 +39,12 @@ as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler
>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
>
> +# Get the compiler name, version, and error out if it is not supported.
> +cc-info := $(shell,$(srctree)/scripts/cc-version.sh $(CC))
> +$(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not supported.)
> +cc-name := $(shell,set -- $(cc-info) && echo $1)
> +cc-version := $(shell,set -- $(cc-info) && echo $2)
> +
>  # Fail if the linker is gold as it's not capable of linking the kernel proper
>  $(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
>
> diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
> new file mode 100755
> index 000000000000..d1edbe4d140c
> --- /dev/null
> +++ b/scripts/cc-version.sh
> @@ -0,0 +1,82 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Print the compiler name and its version in a 5 or 6-digit form.
> +# Also, perform the minimum version check.
> +
> +set -e
> +
> +# When you raise the compiler version, please update
> +# Documentation/process/changes.rst as well.
> +gcc_min_version=4.9.0
> +clang_min_version=10.0.1
> +icc_min_version=16.0.3 # temporary
> +
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> +# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> +if [ "$SRCARCH" = arm64 ]; then
> +       gcc_min_version=5.1.0
> +fi
> +
> +# print the compiler name and versions
> +get_compiler_info()
> +{
> +       cat <<- EOF | "$@" -E -P -x c - 2>/dev/null
> +       #if defined(__clang__)
> +       Clang   __clang_major__  __clang_minor__  __clang_patchlevel__
> +       #elif defined(__INTEL_COMPILER)
> +       ICC     __INTEL_COMPILER  __INTEL_COMPILER_UPDATE
> +       #elif defined(__GNUC__)
> +       GCC     __GNUC__  __GNUC_MINOR__  __GNUC_PATCHLEVEL__
> +       #else
> +       unknown
> +       #endif
> +       EOF
> +}
> +
> +# convert the version string x.y.z to a canonical 5 or 6-digit form
> +get_canonical_version()
> +{
> +       IFS=.
> +       set -- $1
> +       echo $((10000 * $1 + 100 * $2 + $3))
> +}
> +
> +# $@ instead of $1 because multiple words might be given e.g. CC="ccache gcc"
> +orig_args="$@"
> +set -- $(get_compiler_info "$@")
> +
> +name=$1
> +
> +case "$name" in
> +GCC)
> +       version=$2.$3.$4
> +       min_version=$gcc_min_version
> +       ;;
> +Clang)
> +       version=$2.$3.$4
> +       min_version=$clang_min_version
> +       ;;
> +ICC)
> +       version=$(($2 / 100)).$(($2 % 100)).$3
> +       min_version=$icc_min_version
> +       ;;
> +*)
> +       echo "$orig_args: unknown compiler" >&2
> +       exit 1
> +       ;;
> +esac
> +
> +cversion=$(get_canonical_version $version)
> +min_cversion=$(get_canonical_version $min_version)
> +
> +if [ "$cversion" -lt "$min_cversion" ]; then
> +       echo >&2 "***"
> +       echo >&2 "*** Compiler is too old."
> +       echo >&2 "***   Your $name version:    $version"
> +       echo >&2 "***   Minimum $name version: $min_version"
> +       echo >&2 "***"
> +       exit 1
> +fi
> +
> +echo $name $cversion
> diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
> deleted file mode 100755
> index 6fabf0695761..000000000000
> --- a/scripts/clang-version.sh
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# clang-version clang-command
> -#
> -# Print the compiler version of `clang-command' in a 5 or 6-digit form
> -# such as `50001' for clang-5.0.1 etc.
> -
> -compiler="$*"
> -
> -if ! ( $compiler --version | grep -q clang) ; then
> -       echo 0
> -       exit 1
> -fi
> -
> -MAJOR=$(echo __clang_major__ | $compiler -E -x c - | tail -n 1)
> -MINOR=$(echo __clang_minor__ | $compiler -E -x c - | tail -n 1)
> -PATCHLEVEL=$(echo __clang_patchlevel__ | $compiler -E -x c - | tail -n 1)
> -printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> diff --git a/scripts/gcc-version.sh b/scripts/gcc-version.sh
> deleted file mode 100755
> index ae353432539b..000000000000
> --- a/scripts/gcc-version.sh
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# gcc-version gcc-command
> -#
> -# Print the gcc version of `gcc-command' in a 5 or 6-digit form
> -# such as `29503' for gcc-2.95.3, `30301' for gcc-3.3.1, etc.
> -
> -compiler="$*"
> -
> -if [ ${#compiler} -eq 0 ]; then
> -       echo "Error: No compiler specified." >&2
> -       printf "Usage:\n\t$0 <gcc-command>\n" >&2
> -       exit 1
> -fi
> -
> -MAJOR=$(echo __GNUC__ | $compiler -E -x c - | tail -n 1)
> -MINOR=$(echo __GNUC_MINOR__ | $compiler -E -x c - | tail -n 1)
> -PATCHLEVEL=$(echo __GNUC_PATCHLEVEL__ | $compiler -E -x c - | tail -n 1)
> -printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> --
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210115233542.70789-1-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
