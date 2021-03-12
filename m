Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A647338B4C
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 12:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbhCLLKy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Mar 2021 06:10:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbhCLLKm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Mar 2021 06:10:42 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A2AC061574;
        Fri, 12 Mar 2021 03:10:42 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id z13so25266202iox.8;
        Fri, 12 Mar 2021 03:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=jHSKMwCVuECIMwfsj98b2AuPQuN3R/pVWD1vdNz3H9E=;
        b=JpVVWQA0zqW5EwwAxEvhBqEFfR8gNwkWPKdXUw2qaTyJmI9erx9Ka+AARvtYCn5gVp
         yXzhoyjPFmWYarYWFz2CY1sx6Wy4cqsroutZinuxOTw9VLOofOuAlatLuZUdVNnvdiUL
         o31Z/hVqtq02PEVnLLWQXz36JaiH0hlKHT8gd34qA+d7chwptfOoMRdVVMpGRw3dYh0Q
         zcFovSyfwxFDeYIuDzFYRP8Z2u1deJ8KUZxVhyM/mOqFu7FsWBp8kxroa2LUCZztmDOs
         tXegtjLVv5UZMr3UWe/Ucuq64sRiHEhlaIUABq+vkAeRxYPYFZUh5J6RrmvNBCBvwSoR
         75xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=jHSKMwCVuECIMwfsj98b2AuPQuN3R/pVWD1vdNz3H9E=;
        b=jVb9CpASq2NGF2Mv1FNbt3/3CTIBcyhW8VNAY9YaasVB5hTFlSfdYEbQqkra7R0zss
         XpiWTt8hHcMT1+z2Ax/mo/jY/ZEa4Dc1BKGwsP+c9xaaBh/JdWLOi8fjmnpWAHMqSx7p
         Gikbe4itNMx1U76RFlCIK69sN3v/z3XVTM4PyywoqLithdYWhckPwdTqpESSx6d9HUuN
         xxP87BmM59ZXSqlaPueOYV1w3V8j0hu0+obNUt6NCnj3/k/raE4c0WAXdNt3B6rRwVBl
         cNvGr6xZU+ywwUvZVplQuw3b13/RLwaPPZ0kaa2E8UeJsn8GOsvQOuHqNE4NSXrg52Ud
         qNsw==
X-Gm-Message-State: AOAM533KJvdGE1HDNbla4Vr95SgFcQ92xT+Jm7mmRWtU387SRmYVki3q
        fv5obXFexhelH9GI4qEWxYxq4kuLax4AUsbooLk=
X-Google-Smtp-Source: ABdhPJzvqy+DFtFvS+zkVCXCsu/FldzwygcytT6CsCJyZUf5sM7aRNBH4iRHzRDHQM5hLtFg0GXLeYi1GGUk4NYqN5s=
X-Received: by 2002:a5e:8c16:: with SMTP id n22mr9711338ioj.156.1615547441554;
 Fri, 12 Mar 2021 03:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20210311094624.923913-1-masahiroy@kernel.org>
In-Reply-To: <20210311094624.923913-1-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 12 Mar 2021 12:10:05 +0100
Message-ID: <CA+icZUVehYw+jxF_n2+g7ReFfSXn8ZnMWCwY4w_HwNJxvX92xg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: collect minimum tool versions into scripts/min-tool-version.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
        Nathan Chancellor <nathan@kernel.org>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 10:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The kernel build uses various tools, many of which are provided by the
> same software suite, for example, LLVM and Binutils.
>
> When you raise the minimum version of Clang/LLVM, you need to update
> clang_min_version in scripts/cc-version.sh and also lld_min_version in
> scripts/ld-version.sh.
>
> Kbuild can handle CC=clang and LD=ld.lld independently, but it does not
> make much sense to maintain their versions separately.
>
> Let's make scripts/min-tool-version.sh a central place of minimum tool
> versions so you do not need to touch multiple files.
>
> This script prints the minimum version of the given tool.
>
>   $ scripts/min-tool-version.sh gcc
>   4.9.0
>   $ scripts/min-tool-version.sh llvm
>   10.0.1
>   $ scripts/min-tool-version.sh binutils
>   2.23.0
>   $ scripts/min-tool-version.sh foo
>   foo: unknown tool
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

The idea with creating gcc, llvm, binutils etc. files containing the
minimum version-string sounds good to me.

This version here tested on Debian/testing AMD64.

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v12.0.0-rc3

- Sedat -

> ---
>
>  scripts/cc-version.sh       | 20 +++++---------------
>  scripts/ld-version.sh       | 11 ++++-------
>  scripts/min-tool-version.sh | 27 +++++++++++++++++++++++++++
>  3 files changed, 36 insertions(+), 22 deletions(-)
>  create mode 100755 scripts/min-tool-version.sh
>
> diff --git a/scripts/cc-version.sh b/scripts/cc-version.sh
> index 3f2ee885b116..f1952c522466 100755
> --- a/scripts/cc-version.sh
> +++ b/scripts/cc-version.sh
> @@ -6,18 +6,6 @@
>
>  set -e
>
> -# When you raise the minimum compiler version, please update
> -# Documentation/process/changes.rst as well.
> -gcc_min_version=4.9.0
> -clang_min_version=10.0.1
> -icc_min_version=16.0.3 # temporary
> -
> -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> -# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> -if [ "$SRCARCH" = arm64 ]; then
> -       gcc_min_version=5.1.0
> -fi
> -
>  # Print the compiler name and some version components.
>  get_compiler_info()
>  {
> @@ -48,18 +36,20 @@ set -- $(get_compiler_info "$@")
>
>  name=$1
>
> +min_tool_version=$(dirname $0)/min-tool-version.sh
> +
>  case "$name" in
>  GCC)
>         version=$2.$3.$4
> -       min_version=$gcc_min_version
> +       min_version=$($min_tool_version gcc)
>         ;;
>  Clang)
>         version=$2.$3.$4
> -       min_version=$clang_min_version
> +       min_version=$($min_tool_version llvm)
>         ;;
>  ICC)
>         version=$(($2 / 100)).$(($2 % 100)).$3
> -       min_version=$icc_min_version
> +       min_version=$($min_tool_version icc)
>         ;;
>  *)
>         echo "$orig_args: unknown compiler" >&2
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index 30debf78aa09..5b9481e98b4f 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -6,11 +6,6 @@
>
>  set -e
>
> -# When you raise the minimum linker version, please update
> -# Documentation/process/changes.rst as well.
> -bfd_min_version=2.23.0
> -lld_min_version=10.0.1
> -
>  # Convert the version string x.y.z to a canonical 5 or 6-digit form.
>  get_canonical_version()
>  {
> @@ -35,10 +30,12 @@ set -- $("$@" --version)
>  IFS=' '
>  set -- $1
>
> +min_tool_version=$(dirname $0)/min-tool-version.sh
> +
>  if [ "$1" = GNU -a "$2" = ld ]; then
>         shift $(($# - 1))
>         version=$1
> -       min_version=$bfd_min_version
> +       min_version=$($min_tool_version binutils)
>         name=BFD
>         disp_name="GNU ld"
>  elif [ "$1" = GNU -a "$2" = gold ]; then
> @@ -51,7 +48,7 @@ else
>
>         if [ "$1" = LLD ]; then
>                 version=$2
> -               min_version=$lld_min_version
> +               min_version=$($min_tool_version llvm)
>                 name=LLD
>                 disp_name=LLD
>         else
> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> new file mode 100755
> index 000000000000..37c438d766d7
> --- /dev/null
> +++ b/scripts/min-tool-version.sh
> @@ -0,0 +1,27 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Print the minimum supported version of the given tool.
> +
> +set -e
> +
> +# When you raise the minimum version, please update
> +# Documentation/process/changes.rst as well.
> +min_gcc_version=4.9.0
> +min_llvm_version=10.0.1
> +min_icc_version=16.0.3 # temporary
> +min_binutils_version=2.23.0
> +
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> +# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> +if [ "$SRCARCH" = arm64 ]; then
> +       min_gcc_version=5.1.0
> +fi
> +
> +eval min_version="\$min_${1}_version"
> +if [ -z "$min_version" ]; then
> +       echo "$1: unknown tool" >&2
> +       exit 1
> +fi
> +
> +echo "$min_version"
> --
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210311094624.923913-1-masahiroy%40kernel.org.
