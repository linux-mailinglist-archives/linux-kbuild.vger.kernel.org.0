Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2681931CF9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Feb 2021 18:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhBPRuv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Feb 2021 12:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhBPRui (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Feb 2021 12:50:38 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADC2C06174A
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Feb 2021 09:49:58 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id e17so12937324ljl.8
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Feb 2021 09:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+VuxTCvHr9rQ2AHK8GZDJzh1+8H4dp2arkCyg3gMeg8=;
        b=mnssgDr5lMVggKTEcyrlW0q14dyawmgNnq9Z1DOh7cukiMIpCJf/4hAHmeBOlx9Pz3
         CpswzC/v0B4R9eDM5Lpw35by5Xthz3H7ppmoFiw29zhLSUJo9CQtB5tYUIulabiQiort
         46ariByAIlx9L8vjVthysGI3JjKuPw+h6y+CyGltKL6esI2oMDAIykq3LXJ3S2UngRvm
         v/DvS1+Qh32q2yH9ShKBvKwm0aGaYtvSPMK8OK7ncqypftH1AdXO2AeAwV7B4urmapV5
         z89kb9SmI4TCg//1+jB6eYOy5pvs9Qd9QXFpxhISPlg9dv0ZI4yBLT+YxAAgerMZbmNb
         NGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+VuxTCvHr9rQ2AHK8GZDJzh1+8H4dp2arkCyg3gMeg8=;
        b=MUZM+eqFSNpO5Bv5Tpf4K71tqYk1P+aAEwWQOJ7nd+hWDsCbe22vqZeH7DMQYamTpk
         qLSHJakNOq6rpiLj0MKCkbZuro2RitzLPLNeLAzkV5KO2gw/oVRzhwrPOtThp2zw36G/
         x1+4cKxg76h+HYcjh4f+aQhrZmWgpAG6cEy2FUaDQAivquGJu35aUykJCWGgaVq8HFY0
         xT/ZhsSEN/XG/Cu8Bv7uvewnilC/1W0xNygtyi+NRPfFTKmEB5E87CiQ9LG68ukwqQnr
         VFAOoZEmSl7TtKE5vjtrY3fRq4HUdiaJMp6J3e+EvYxpeSkuCYOsSVhfzXMb5L20qp/f
         HF0w==
X-Gm-Message-State: AOAM533Pbqcr+xvf6dRcZJbq49yOsINgameCBstsUwvZAtdP39L/geJC
        dCt3JjOfDIZN6lMUlMcyryvb/SIeeBeMbrCPpOsjr6Mx7l8=
X-Google-Smtp-Source: ABdhPJw82Q9n+a44TuyEIP/sqYc3OPVPhxwlkjhMcmNO++tsF+KkzgHD/oeyvfAXhc9oMQe+FRU5sOF0sMpKDj0eMZE=
X-Received: by 2002:a05:651c:301:: with SMTP id a1mr13054304ljp.116.1613497796500;
 Tue, 16 Feb 2021 09:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20210216031004.552417-1-masahiroy@kernel.org> <20210216031004.552417-2-masahiroy@kernel.org>
In-Reply-To: <20210216031004.552417-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 16 Feb 2021 09:49:44 -0800
Message-ID: <CAKwvOdn4rvTOQnHv+Xh1xMKFVH8885oRAL3cNchnDFcmQJZA+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: check the minimum linker version in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        David Laight <david.laight@aculab.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Johannes Weiner <hannes@cmpxchg.org>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Terrell <terrelln@fb.com>,
        Quentin Perret <qperret@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Will Deacon <will@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 15, 2021 at 7:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Unify the two scripts/ld-version.sh and scripts/lld-version.sh, and
> check the minimum linker version like scripts/cc-version.sh did.
>
> I tested this script for some corner cases reported in the past:
>
>  - GNU ld version 2.25-15.fc23
>    as reported by commit 8083013fc320 ("ld-version: Fix it on Fedora")
>
>  - GNU ld (GNU Binutils) 2.20.1.20100303
>    as reported by commit 0d61ed17dd30 ("ld-version: Drop the 4th and
>    5th version components")
>
> This script show an error message if the linker is too old:
>
>   $ make LD=ld.lld-9
>     SYNC    include/config/auto.conf
>   ***
>   *** Linker is too old.
>   ***   Your LLD version:    9.0.1
>   ***   Minimum LLD version: 10.0.1
>   ***
>   scripts/Kconfig.include:50: Sorry, this linker is not supported.
>   make[2]: *** [scripts/kconfig/Makefile:71: syncconfig] Error 1
>   make[1]: *** [Makefile:600: syncconfig] Error 2
>   make: *** [Makefile:708: include/config/auto.conf] Error 2
>
> I also moved the check for gold to this script, so gold is still rejected:
>
>   $ make LD=gold
>     SYNC    include/config/auto.conf
>   gold linker is not supported as it is not capable of linking the kernel proper.
>   scripts/Kconfig.include:50: Sorry, this linker is not supported.
>   make[2]: *** [scripts/kconfig/Makefile:71: syncconfig] Error 1
>   make[1]: *** [Makefile:600: syncconfig] Error 2
>   make: *** [Makefile:708: include/config/auto.conf] Error 2
>
> Thanks to David Laight for suggesting shell script improvements.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  MAINTAINERS             |  1 -
>  init/Kconfig            | 21 +++++++----
>  scripts/Kconfig.include |  7 +++-
>  scripts/ld-version.sh   | 82 ++++++++++++++++++++++++++++++++++++-----
>  scripts/lld-version.sh  | 20 ----------
>  5 files changed, 90 insertions(+), 41 deletions(-)
>  delete mode 100755 scripts/lld-version.sh
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df820969be1f..6b82ad6990b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4314,7 +4314,6 @@ C:        irc://chat.freenode.net/clangbuiltlinux
>  F:     Documentation/kbuild/llvm.rst
>  F:     include/linux/compiler-clang.h
>  F:     scripts/clang-tools/
> -F:     scripts/lld-version.sh
>  K:     \b(?i:clang|llvm)\b
>
>  CLEANCACHE API
> diff --git a/init/Kconfig b/init/Kconfig
> index 7bcfa24524c2..42b69ee29dca 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -33,24 +33,29 @@ config GCC_VERSION
>         default $(cc-version) if CC_IS_GCC
>         default 0
>
> -config LD_VERSION
> -       int
> -       default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> -
>  config CC_IS_CLANG
>         def_bool $(success,test "$(cc-name)" = Clang)
>
> -config LD_IS_LLD
> -       def_bool $(success,$(LD) -v | head -n 1 | grep -q LLD)
> -
>  config CLANG_VERSION
>         int
>         default $(cc-version) if CC_IS_CLANG
>         default 0
>
> +config LD_IS_BFD
> +       def_bool $(success,test "$(ld-name)" = BFD)
> +
> +config LD_VERSION
> +       int
> +       default $(ld-version) if LD_IS_BFD
> +       default 0
> +
> +config LD_IS_LLD
> +       def_bool $(success,test "$(ld-name)" = LLD)
> +
>  config LLD_VERSION
>         int
> -       default $(shell,$(srctree)/scripts/lld-version.sh $(LD))
> +       default $(ld-version) if LD_IS_LLD
> +       default 0
>
>  config CC_CAN_LINK
>         bool
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 0228cb9c74aa..58fdb5308725 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -45,8 +45,11 @@ $(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not su
>  cc-name := $(shell,set -- $(cc-info) && echo $1)
>  cc-version := $(shell,set -- $(cc-info) && echo $2)
>
> -# Fail if the linker is gold as it's not capable of linking the kernel proper
> -$(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
> +# Get the linker name, version, and error out if it is not supported.
> +ld-info := $(shell,$(srctree)/scripts/ld-version.sh $(LD))
> +$(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supported.)
> +ld-name := $(shell,set -- $(ld-info) && echo $1)
> +ld-version := $(shell,set -- $(ld-info) && echo $2)
>
>  # machine bit flags
>  #  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index 0f8a2c0f9502..a463273509b5 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -1,11 +1,73 @@
> -#!/usr/bin/awk -f
> +#!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
> -# extract linker version number from stdin and turn into single number
> -       {
> -       gsub(".*\\)", "");
> -       gsub(".*version ", "");
> -       gsub("-.*", "");
> -       split($1,a, ".");
> -       print a[1]*10000 + a[2]*100 + a[3];
> -       exit
> -       }
> +#
> +# Print the linker name and its version in a 5 or 6-digit form.
> +# Also, perform the minimum version check.
> +
> +set -e
> +
> +# When you raise the minimum linker version, please update
> +# Documentation/process/changes.rst as well.
> +bfd_min_version=2.23.0
> +lld_min_version=10.0.1
> +
> +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> +get_canonical_version()
> +{
> +       IFS=.
> +       set -- $1
> +
> +       # If the 2nd or 3rd field is missing, fill it with a zero.
> +       #
> +       # The 4th field, if present, is ignored.
> +       # This occurs in development snapshots as in 2.35.1.20201116
> +       echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> +}
> +
> +orig_args="$@"
> +
> +# Get the first line of the --version output.
> +IFS='
> +'
> +set -- $("$@" --version)
> +
> +# Split the line on spaces.
> +IFS=' '
> +set -- $1
> +
> +if [ "$1" = GNU -a "$2" = ld ]; then
> +       shift $(($# - 1))
> +       version=$1
> +       min_version=$bfd_min_version
> +       name=BFD
> +       disp_name="GNU ld"
> +elif [ "$1" = GNU -a "$2" = gold ]; then
> +       echo "gold linker is not supported as it is not capable of linking the kernel proper." >&2
> +       exit 1
> +elif [ "$1" = LLD ]; then
> +       version=$2
> +       min_version=$lld_min_version
> +       name=LLD
> +       disp_name=LLD
> +else
> +       echo "$orig_args: unknown linker" >&2
> +       exit 1
> +fi
> +
> +# Some distributions append a package release number, as in 2.34-4.fc32
> +# Trim the hyphen and any characters that follow.
> +version=${version%-*}
> +
> +cversion=$(get_canonical_version $version)
> +min_cversion=$(get_canonical_version $min_version)
> +
> +if [ "$cversion" -lt "$min_cversion" ]; then
> +       echo >&2 "***"
> +       echo >&2 "*** Linker is too old."
> +       echo >&2 "***   Your $disp_name version:    $version"
> +       echo >&2 "***   Minimum $disp_name version: $min_version"
> +       echo >&2 "***"
> +       exit 1
> +fi
> +
> +echo $name $cversion
> diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
> deleted file mode 100755
> index d70edb4d8a4f..000000000000
> --- a/scripts/lld-version.sh
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -#
> -# Usage: $ ./scripts/lld-version.sh ld.lld
> -#
> -# Print the linker version of `ld.lld' in a 5 or 6-digit form
> -# such as `100001' for ld.lld 10.0.1 etc.
> -
> -linker_string="$($* --version)"
> -
> -if ! ( echo $linker_string | grep -q LLD ); then
> -       echo 0
> -       exit 1
> -fi
> -
> -VERSION=$(echo $linker_string | cut -d ' ' -f 2)
> -MAJOR=$(echo $VERSION | cut -d . -f 1)
> -MINOR=$(echo $VERSION | cut -d . -f 2)
> -PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
> -printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
