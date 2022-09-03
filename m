Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8FB85ABFA9
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Sep 2022 18:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiICQCQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Sep 2022 12:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbiICQCP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Sep 2022 12:02:15 -0400
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A79A543C9
        for <linux-kbuild@vger.kernel.org>; Sat,  3 Sep 2022 09:02:13 -0700 (PDT)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 283G1uNe019684
        for <linux-kbuild@vger.kernel.org>; Sun, 4 Sep 2022 01:01:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 283G1uNe019684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1662220917;
        bh=Wr95nlPDjKBcZDdyUmTZfGidpwdQVigm33DmaWH2s/I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xGmw0ReQUkTHuN5/UPzr6lEltUag7dYsQh0nYWPFJQsdr48kspD947Qj+6io04L8S
         JfyKAmgXR9Yc/7nH+laseiVJSbdbkHrVFaFLkYTk+q4IrjJPA2jFkvu41TA6ZNnho0
         1h7dz1aDbN7+QjvlTyWAC71j9YOiq4jCT0gXrZ+sFE2KMjnWDElJfZ0osU8MNaKWr5
         YvE5/Gqji2DLYTUbImw1okq6dHTpJHKMQJjV9MxDnBmdSalG7JLt5VvbPf1BRpUfop
         s4i7e0MAC08EzL0dn24BB7qRzKOOWIpVQUw7LfpSWQu+gBsawRZk8qfCmX3y1E22b1
         s4HDGv/VTyveQ==
X-Nifty-SrcIP: [209.85.160.53]
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-11e7e0a63e2so12050856fac.4
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Sep 2022 09:01:57 -0700 (PDT)
X-Gm-Message-State: ACgBeo23sC+gquKsKG5UAwDDXKiOhfWpZGdNOzWzfiePOwXrWx6/Ib0s
        a4Jt9fH0BJ58zUd5OAIh+dv9bLX+HfwjP2zffaQ=
X-Google-Smtp-Source: AA6agR40QCa5Hc21pfslo3NlIUrYOLUdrMmyeWQlnbsF675F5S92dvNM3DW+a9y/ElgAZdA4MDe0jjofujUsNYwv7R0=
X-Received: by 2002:a05:6870:f626:b0:10d:a798:f3aa with SMTP id
 ek38-20020a056870f62600b0010da798f3aamr4873371oab.194.1662220916075; Sat, 03
 Sep 2022 09:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
 <b0cf49ac1a3ece40e133fa80e3ceae7891d6ed8d.1661979510.git.owen@owenrafferty.com>
In-Reply-To: <b0cf49ac1a3ece40e133fa80e3ceae7891d6ed8d.1661979510.git.owen@owenrafferty.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 4 Sep 2022 01:01:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARYiJNiFKL2pQWCOocxkYWiJ66S4gBDE=54tFYJnfO--g@mail.gmail.com>
Message-ID: <CAK7LNARYiJNiFKL2pQWCOocxkYWiJ66S4gBDE=54tFYJnfO--g@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: rewrite check-local-export in sh/awk
To:     Owen Rafferty <owen@owenrafferty.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 1, 2022 at 6:03 AM Owen Rafferty <owen@owenrafferty.com> wrote:
>
> Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
> ---


Please input something in the commit log.

I think the benchmark in v2 is worth mentioning
because "awk is faster than bash" is one benefit
of applying this patch.







>  scripts/check-local-export | 96 +++++++++++++++++++-------------------
>  1 file changed, 47 insertions(+), 49 deletions(-)
>
> diff --git a/scripts/check-local-export b/scripts/check-local-export
> index 6ccc2f467416..0c049ff44aca 100755
> --- a/scripts/check-local-export
> +++ b/scripts/check-local-export
> @@ -1,26 +1,14 @@
> -#!/usr/bin/env bash
> +#!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>  # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
> +# Copyright (C) 2022 Owen Rafferty <owen@owenrafferty.com>
>  #
>  # Exit with error if a local exported symbol is found.
>  # EXPORT_SYMBOL should be used for global symbols.
>
>  set -e
>
> -# catch errors from ${NM}
> -set -o pipefail
> -
> -# Run the last element of a pipeline in the current shell.
> -# Without this, the while-loop would be executed in a subshell, and
> -# the changes made to 'symbol_types' and 'export_symbols' would be lost.
> -shopt -s lastpipe
> -
> -declare -A symbol_types
> -declare -a export_symbols
> -
> -exit_code=0
> -
>  # If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
>  # 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
>  # '2>/dev/null'. However, it suppresses real error messages as well. Add a
> @@ -29,43 +17,53 @@ exit_code=0
>  # TODO:
>  # Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
>  # binutils to 2.37, llvm to 13.0.0.
> -# Then, the following line will be really simple:
> -#   ${NM} --quiet ${1} |
> +# Then, the following line will be simpler:
> +#   { ${NM} --quiet ${1} || kill 0; } |
> +
> +{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
> +${AWK} -v "file=${1}" '
> +BEGIN {
> +       i = 0
> +}
> +
> +# Skip the line if the number of fields is less than 3.
> +#
> +# case 1)
> +#   For undefined symbols, the first field (value) is empty.
> +#   The outout looks like this:
> +#     "                 U _printk"
> +#   It is unneeded to record undefined symbols.
> +#
> +# case 2)
> +#   For Clang LTO, llvm-nm outputs a line with type t but empty name:
> +#     "---------------- t"
> +!length($3) {
> +       next
> +}
>
> -{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
> -while read value type name
> -do
> -       # Skip the line if the number of fields is less than 3.
> -       #
> -       # case 1)
> -       #   For undefined symbols, the first field (value) is empty.
> -       #   The outout looks like this:
> -       #     "                 U _printk"
> -       #   It is unneeded to record undefined symbols.
> -       #
> -       # case 2)
> -       #   For Clang LTO, llvm-nm outputs a line with type 't' but empty name:
> -       #     "---------------- t"
> -       if [[ -z ${name} ]]; then
> -               continue
> -       fi
> +# save (name, type) in the associative array
> +{ symbol_types[$3]=$2 }
>
> -       # save (name, type) in the associative array
> -       symbol_types[${name}]=${type}
> +# append the exported symbol to the array
> +($3 ~ /^__ksymtab_/) {
> +       export_symbols[i] = $3
> +       sub(/^__ksymtab_/, "", export_symbols[i])
> +       i++
> +}
>
> -       # append the exported symbol to the array
> -       if [[ ${name} == __ksymtab_* ]]; then
> -               export_symbols+=(${name#__ksymtab_})
> -       fi
> -done
> +END {
> +       exit_code = 0
> +       for (j = 0; j < i; ++j) {
> +               name = export_symbols[j]
> +               # nm(3) says "If lowercase, the symbol is usually local"
> +               if (symbol_types[name] ~ /[a-z]/) {
> +                       printf "%s: error: local symbol %s was exported\n",
> +                               file, name | "cat 1>&2"
> +                       exit_code = 1
> +               }
> +       }
>
> -for name in "${export_symbols[@]}"
> -do
> -       # nm(3) says "If lowercase, the symbol is usually local"
> -       if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
> -               echo "$@: error: local symbol '${name}' was exported" >&2
> -               exit_code=1
> -       fi
> -done
> +       exit exit_code
> +}'
>
> -exit ${exit_code}
> +exit $?
> --
> 2.37.3
>


-- 
Best Regards
Masahiro Yamada
