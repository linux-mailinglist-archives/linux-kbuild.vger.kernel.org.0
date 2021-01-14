Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FB62F5B0A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 08:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbhANHIC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 02:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbhANHIB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 02:08:01 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CDCC061786;
        Wed, 13 Jan 2021 23:07:15 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id d13so6071625ioy.4;
        Wed, 13 Jan 2021 23:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=0stmh3NIYlgebx8Y/ofg9MESt0nCd9lK5OpOQ6ToFYE=;
        b=Q+oMooQ8Nco/VaEsMjiNiNVSt+tyZbYh4+9LlrcDisQX2JvNet34LLcwca93iFEtJT
         2/nnnDwgSK8SWT/paV1AQTSR8h7fLzamv5zRihNPQsx5MLaNwfe+XdmBYe3Jd2LkxqsP
         Yz5KECO0+d2VBG1mfoYSYOkaf7syoXZb8l4LPqtMoGx+gU4F0McM2jUImKsjZ27EpIc0
         m0oRagTfbU7YpVsjsTKHZY52zK+peR+wPnuAFEXXrv7pLBdDj5tnMrXmhjJD8SXyG61I
         XV15na7MVbPsmysSgdAGprFjz1JvIPFkH8SSr73XXEET2yaql7T5u6f4sUAxRGm6s07q
         0PDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=0stmh3NIYlgebx8Y/ofg9MESt0nCd9lK5OpOQ6ToFYE=;
        b=PmIm8q3N4Jlo0yQ5iDORxjmZq99rijuh1BCUWw3my2xM9INxnqzsJ8mIrEONFsaniI
         RAT+mFnJtL5KUS8S7z/pbEfl7GCdzx78tcVw2NHw4h0jyHfApQboZeeAb0xyFU2yF1l4
         nYYxTG2cdaJeUdVn+//QGYbFLaMKegU8IIqObdjR4xrWuCnUUNsAwt3ODRBsYXC/MD5M
         4wo87hRdgTPLrv49EeVHFMp59pPxPRqZTTuuV583oFM0AzHANzdKr5JLuWcwOcQiV9ta
         tM/3tTJcgdl5kzQEBhdcfJVtpwTFeZZeO6hJ4VT6mbqlZFDaCXUPynpoEbgyVu6pPSfw
         t9zg==
X-Gm-Message-State: AOAM532sjPHroFbkWDNpq0ga7oqk+n07kO2KWXo0wa4ikIT7huo+MWBm
        L9LN/mKuPHIou966umEHy/w1F+R/WIXzDis19JYN5vb+cydi0Q==
X-Google-Smtp-Source: ABdhPJwtdEHkgUWYWMrBsowDu9HmNX4yCYcvV+NazLEuwq/9mPinK1+t45e7zC8Gwt7/DC0dXev1Mn4jKCP++668Oxc=
X-Received: by 2002:a05:6e02:eb0:: with SMTP id u16mr5461148ilj.209.1610608029589;
 Wed, 13 Jan 2021 23:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20210114041623.226419-1-masahiroy@kernel.org>
In-Reply-To: <20210114041623.226419-1-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 14 Jan 2021 08:06:57 +0100
Message-ID: <CA+icZUXOk+tAWdH+sr6fj3NU+v8megZZFGL6ZxBXyt0Omf3tkQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check the minimum compiler version in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 5:17 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Paul Gortmaker reported a regression in the GCC version check [1].
> If you use GCC 4.8, the build breaks before showing the error message
> "error Sorry, your version of GCC is too old - please use 4.9 or newer."
>

Hi Masahiro,

This patch is really helpful and user-friendly.

I ran into an issue with pahole requirement seen when
scripts/link-vmlinux.sh is run (see [1])
That happened after 3 hours of build-time.
Such things make me really unhappy.

Nathan proposed a fix for the pahole issue (see [2]).

I definitely will enjoy testing your v2.

Regards,
- Sedat -

[1] https://marc.info/?t=161036949500004&r=1&w=2
[2] https://marc.info/?t=161038851500003&r=1&w=2

> I do not want to apply his fix-up since it implies we would not be able
> to remove any cc-option test. Anyway, I admit checking the GCC version
> in <linux/compiler-gcc.h> is too late.
>
> Almost at the same time, Linus also suggested to move the compiler
> version error to Kconfig time. [2]
>
> I unified the similar two scripts, gcc-version.sh and clang-version.sh
> into the new cc-version.sh. The old scripts invoked the compiler multiple
> times (3 times for gcc-version.sh, 4 times for clang-version.sh). I
> refactored the code so the new one invokes the compiler just once, and
> also tried my best to use shell-builtin commands where possible.
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
> The cc-version.sh also shows the error if the compiler is old:
>
>   $ make defconfig CC=clang-9
>   *** Default configuration is based on 'x86_64_defconfig'
>   ***
>   *** Compiler is too old.
>   ***   Your Clang version:    9.0.1
>   ***   Minimum Clang version: 10.0.1
>   ***
>   scripts/Kconfig.include:46: Sorry, this compiler is unsupported.
>   make[1]: *** [scripts/kconfig/Makefile:81: defconfig] Error 1
>   make: *** [Makefile:602: defconfig] Error 2
>
> I removed the clang version check from <linux/compiler-clang.h>
>
> For now, I did not touch <linux/compiler-gcc.h> in order to avoid
> merge conflict with [3], which has been queued up in the arm64 tree.
> We will be able to clean it up later.
>
> I put the stub for ICC because I see <linux/compiler-intel.h> although
> I am not sure if building the kernel with ICC is well-supported.
>
> [1] https://lkml.org/lkml/2021/1/10/250
> [2] https://lkml.org/lkml/2021/1/12/1708
> [3] https://lkml.org/lkml/2021/1/12/1533
>
> Fixes: 87de84c9140e ("kbuild: remove cc-option test of -Werror=date-time")
> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  include/linux/compiler-clang.h | 10 -----
>  init/Kconfig                   |  9 +++--
>  scripts/Kconfig.include        |  6 +++
>  scripts/cc-version.sh          | 69 ++++++++++++++++++++++++++++++++++
>  scripts/clang-version.sh       | 19 ----------
>  scripts/gcc-version.sh         | 20 ----------
>  6 files changed, 80 insertions(+), 53 deletions(-)
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
> diff --git a/init/Kconfig b/init/Kconfig
> index b77c60f8b963..01108dd1318b 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -26,11 +26,11 @@ config CC_VERSION_TEXT
>             and then every file will be rebuilt.
>
>  config CC_IS_GCC
> -       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q gcc)
> +       def_bool $(success,test $(cc-name) = GCC)
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
> +       def_bool $(success,test $(cc-name) = Clang)
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
> index a5fe72c504ff..cdc8726d2904 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -39,6 +39,12 @@ as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler
>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
>
> +# Get the compiler name, version, and error out if it is unsupported.
> +cc-info := $(shell,scripts/cc-version.sh $(CC))
> +$(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is unsupported.)
> +cc-name := $(shell,set -- $(cc-info); echo $1)
> +cc-version := $(shell,set -- $(cc-info); echo $2)
> +
>  # Fail if the linker is gold as it's not capable of linking the kernel proper
>  $(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
>
> diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
> new file mode 100755
> index 000000000000..32df0e2940f5
> --- /dev/null
> +++ b/scripts/cc-version.sh
> @@ -0,0 +1,69 @@
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
> +
> +# print the compiler name, major version, minor version, patchlevel version
> +get_compiler_info()
> +{
> +       cat <<- EOF | "$@" -E -P -x c - 2>/dev/null
> +       #if defined(__clang__)
> +       Clang   __clang_major__ __clang_minor__ __clang_patchlevel__
> +       #elif defined(__INTEL_COMPILER)
> +       /* How to get the version of intel compiler? */
> +       ICC     0               0               0
> +       #elif defined(__GNUC__)
> +       GCC     __GNUC__        __GNUC_MINOR__  __GNUC_PATCHLEVEL__
> +       #else
> +       unsupported     0               0               0
> +       #endif
> +       EOF
> +}
> +
> +# convert the version to a canonical 5 or 6-digit form for numerical comparison
> +get_canonical_version()
> +{
> +       IFS=.
> +       set -- $1
> +       echo $((10000 * $1 + 100 * $2 + $3))
> +}
> +
> +# $@ instead of $1 because multiple words might be given e.g. CC="ccache gcc"
> +orig_args="$@"
> +set -- $(run_preprocessor "$@")
> +
> +name=$1
> +version=$2.$3.$4
> +
> +case "$name" in
> +GCC) min_version=$gcc_min_version;;
> +Clang) min_version=$clang_min_version;;
> +ICC) ;; # ICC min version undefined?
> +*) echo "$orig_args: unknown compiler" >&2; exit 1;;
> +esac
> +
> +cversion=$(get_canonical_version $version)
> +
> +if [ -n "$min_version" ]; then
> +
> +       min_cversion=$(get_canonical_version $min_version)
> +
> +       if [ "$cversion" -lt "$min_cversion" ]; then
> +               echo >&2 "***"
> +               echo >&2 "*** Compiler is too old."
> +               echo >&2 "***   Your $name version:    $version"
> +               echo >&2 "***   Minimum $name version: $min_version"
> +               echo >&2 "***"
> +               exit 1
> +       fi
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
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210114041623.226419-1-masahiroy%40kernel.org.
