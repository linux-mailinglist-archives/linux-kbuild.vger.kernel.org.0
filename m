Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4A732DF10
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 02:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhCEB0G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 20:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhCEB0G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 20:26:06 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FA6C061574
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Mar 2021 17:26:05 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id t9so505068ljt.8
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 17:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gCdvi4EBYLylFbGen12vcA3G3U87RxCMkiKYpd8th7E=;
        b=ooOhIrVcKvNt9mDlWlDCKRugZV2dg9/ICb43HokG0FTM7/lKfeOPEF2+v6vrkX6VWL
         M5HVAXZQeiPo12Xwyh19iCfXz3eAB89UEOjY2xiya1fgt/vzz5K5yPFUiRutMtZ/fcHi
         S3sleyA//OQSeK5CFhgttgwioQybCSynAElpe9HPbQmoUSgEzsO5NFBz6cUFb+Vl0OmG
         8k/7NPc47wP+Rk/WB135gEyiwzwJ9kUO/rQnzTDKORaKPKTvXsrQBK/7Pmkl76MCxCEZ
         ji0OY7WQXduluSdPW3SyybTl1zsagUDNsYWaQVQgMaoQ6v6r7DYNEKQ2wp6O/ROKIPBG
         e48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gCdvi4EBYLylFbGen12vcA3G3U87RxCMkiKYpd8th7E=;
        b=GgRfQ0BzV8/imXUR3igTMG8mqzT+0qQ873CXuQYk0C+Y1m/FMDpgVesfC2mm0Ao9Fs
         Jn07l8H5me3cpY79v6hOtYD4fua9TCMqY82KQ/nUxD2gH7Z7ggE1jggHbnryz1KQ2PVB
         rp3opGBOVWO8v4tp3NYaiiLyNm4yA62ZE7/ZD997cBmCxbhAvo06Hckl4Pqg+6Jt/MTq
         p+/PsZY6ZjaAxoElJUW+mTCIpazcwk1Q4t7Jf260eHiMlwVTV0XhUlyYGMweR7Gtz/i+
         WjeelT5xECRvyxxT8MQM7RSvyib2PtoKTuBfQA2WXM7OL5DLImy4guBc0bDCf4bTd19D
         3arA==
X-Gm-Message-State: AOAM533MEF04Nr0B55oyCa99hynkLVFzfxohM/DZIlsOoo6b0swLDJR2
        GMEpPBGaEJbyIg+VLeK6pUoqDiq07UtxAR+LdtqVIA==
X-Google-Smtp-Source: ABdhPJykfaeNWejnWlzbrHaxTgVacfivKo9k4qwm7pW06pbwgySzC5z80mJa2mL9WstwKpyfXjB4tAs76jeQIwtJdjM=
X-Received: by 2002:a19:5055:: with SMTP id z21mr3966267lfj.297.1614907563747;
 Thu, 04 Mar 2021 17:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20210303183333.46543-1-masahiroy@kernel.org> <20210303183333.46543-3-masahiroy@kernel.org>
In-Reply-To: <20210303183333.46543-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 4 Mar 2021 17:25:52 -0800
Message-ID: <CAKwvOdmdQvwDN6Bg2Kom1Nm+HrNfCqOqnDLYTYs+5sRSEuZsJg@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: check the minimum assembler version in Kconfig
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jian Cai <jiancai@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 3, 2021 at 10:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Documentation/process/changes.rst defines the minimum assembler version
> (binutils version), but we have never checked it in the build time.
>
> Kbuild never invokes 'as' directly because all assembly files in the
> kernel tree are *.S, hence must be preprocessed. I do not expect
> raw assembly source files (*.s) would be added to the kernel tree.
>
> Therefore, we always use $(CC) as the assembler driver, and commit
> aa824e0c962b ("kbuild: remove AS variable") removed 'AS'. However,
> we are still interested in the version of the assembler sitting behind.
>
> As usual, the --version option prints the version string.
>
>   $ as --version | head -n 1
>   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
>
> But, we do not have $(AS). So, we can add the -Wa prefix so that
> $(CC) passes --version down to the backing assembler.
>
>   $ gcc -Wa,--version | head -n 1
>   gcc: fatal error: no input files
>   compilation terminated.
>
> OK, we need to input something to satisfy gcc.
>
>   $ gcc -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
>   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
>
> The combination of Clang and GNU assembler works in the same way:
>
>   $ clang -no-integrated-as -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
>   GNU assembler (GNU Binutils for Ubuntu) 2.35.1
>
> Clang with the integrated assembler fails like this:
>
>   $ clang -integrated-as -Wa,--version -c -x assembler /dev/null -o /dev/null | head -n 1
>   clang: error: unsupported argument '--version' to option 'Wa,'

Was this a feature request to "please implement -Wa,--version for clang?" :-P
https://github.com/ClangBuiltLinux/linux/issues/1320

>
> With all this in my mind, I implemented scripts/as-version.sh.
>
>   $ scripts/as-version.sh gcc
>   GNU 23501
>   $ scripts/as-version.sh clang -no-integrated-as
>   GNU 23501
>   $ scripts/as-version.sh clang -integrated-as
>   LLVM 0
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/Kconfig            |  3 +-
>  init/Kconfig            | 12 +++++++
>  scripts/Kconfig.include |  6 ++++
>  scripts/as-version.sh   | 77 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 96 insertions(+), 2 deletions(-)
>  create mode 100755 scripts/as-version.sh
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 2af10ebe5ed0..d7214f4ae1f7 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -631,8 +631,7 @@ config ARCH_SUPPORTS_LTO_CLANG_THIN
>  config HAS_LTO_CLANG
>         def_bool y
>         # Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
> -       depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD
> -       depends on $(success,test $(LLVM_IAS) -eq 1)
> +       depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
>         depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
>         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
>         depends on ARCH_SUPPORTS_LTO_CLANG
> diff --git a/init/Kconfig b/init/Kconfig
> index 22946fe5ded9..f76e5a44e4fe 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -41,6 +41,18 @@ config CLANG_VERSION
>         default $(cc-version) if CC_IS_CLANG
>         default 0
>
> +config AS_IS_GNU
> +       def_bool $(success,test "$(as-name)" = GNU)
> +
> +config AS_IS_LLVM
> +       def_bool $(success,test "$(as-name)" = LLVM)
> +
> +config AS_VERSION
> +       int
> +       # If it is integrated assembler, the version is the same as Clang's one.
> +       default CLANG_VERSION if AS_IS_LLVM
> +       default $(as-version)
> +
>  config LD_IS_BFD
>         def_bool $(success,test "$(ld-name)" = BFD)
>
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 58fdb5308725..0496efd6e117 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -45,6 +45,12 @@ $(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this compiler is not su
>  cc-name := $(shell,set -- $(cc-info) && echo $1)
>  cc-version := $(shell,set -- $(cc-info) && echo $2)
>
> +# Get the assembler name, version, and error out if it is not supported.
> +as-info := $(shell,$(srctree)/scripts/as-version.sh $(CC) $(CLANG_FLAGS))
> +$(error-if,$(success,test -z "$(as-info)"),Sorry$(comma) this assembler is not supported.)
> +as-name := $(shell,set -- $(as-info) && echo $1)
> +as-version := $(shell,set -- $(as-info) && echo $2)
> +
>  # Get the linker name, version, and error out if it is not supported.
>  ld-info := $(shell,$(srctree)/scripts/ld-version.sh $(LD))
>  $(error-if,$(success,test -z "$(ld-info)"),Sorry$(comma) this linker is not supported.)
> diff --git a/scripts/as-version.sh b/scripts/as-version.sh
> new file mode 100755
> index 000000000000..205d8b9fc4d4
> --- /dev/null
> +++ b/scripts/as-version.sh
> @@ -0,0 +1,77 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Print the assembler name and its version in a 5 or 6-digit form.
> +# Also, perform the minimum version check.
> +# (If it is the integrated assembler, return 0 as the version, and
> +# the version check is skipped.)
> +
> +set -e
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
> +# Add 2>&1 to check both stdout and stderr.
> +# If the backing assembler is binutils, we get the version string in stdout.
> +# If it is clang's integrated assembler, we get the following error in stderr:
> +#   clang: error: unsupported argument '--version' to option 'Wa,'
> +# To avoid the error message affected by locale, set LC_MESSAGES=C just in case.
> +set -- $(LC_MESSAGES=C "$@" -Wno-unused-command-line-argument -Wa,--version -c -x assembler /dev/null -o /dev/null 2>&1)
> +line="$1"
> +
> +if [ "$line" = "clang: error: unsupported argument '--version' to option 'Wa,'" ]; then

Checking the precise error message is too brittle; what if it changes?
Why not check the return code a la cc-option and friends?  Is checking
the return code of a subshell an issue here?

> +       # For the intergrated assembler, we do not check the version here.

s/intergrated/integrated/

> +       # It is the same as the clang version, and it has been already checked
> +       # by scripts/cc-version.sh.
> +       echo LLVM 0
> +       exit 0
> +fi
> +
> +# Split the line on spaces.
> +IFS=' '
> +set -- $line
> +
> +tool_version=$(dirname $0)/tool-version.sh
> +
> +if [ "$1" = GNU -a "$2" = assembler ]; then
> +       shift $(($# - 1))
> +       version=$1
> +       min_version=$($tool_version binutils)
> +       name=GNU
> +else
> +       echo "$orig_args: unknown assembler invoked" >&2
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
> +       echo >&2 "*** Assembler is too old."
> +       echo >&2 "***   Your $name assembler version:    $version"
> +       echo >&2 "***   Minimum $name assembler version: $min_version"
> +       echo >&2 "***"
> +       exit 1
> +fi
> +
> +echo $name $cversion
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
