Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772945A76DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Aug 2022 08:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiHaGqW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Aug 2022 02:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiHaGqS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Aug 2022 02:46:18 -0400
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB77C51A17
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Aug 2022 23:46:03 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 27V6jm1e028889
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2022 15:45:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 27V6jm1e028889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1661928349;
        bh=Q/OFPqOYoZLfkrMHdaNW5FRyOpRPIi4WS61Pu69uYCs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p4HR8QjMEAXlkZzVFbrCe0bcwCg3Yvsr6KcuDO+bBZco5MTMPR3r7ieR7xBbpCwIY
         5TzkpjIBoZoDRkP2HaslXXNhdSIYDpP5Eqz5F7NRvOGgcdOqAdwFU9addaFPBJUce5
         l0UI1l9VZZVlSymqqMzozEyh2XrFmA3bmv4DwlIz/AqfLay5E2rdgeH4Jv4AhgyksZ
         5bCR0C8Sv54O61C/rKJME5RD0BY6VBMYuqWYiBYIcA4/Sko/4w9no6OZvGl+nEahq5
         +Q15VN+Dh1n0AqryoPld9ONc3Mks+ylG1/OWmRcvChJMZAFdQ3B7nkHw4ANR8tRJNo
         b+9D2VWkXM+PQ==
X-Nifty-SrcIP: [209.85.160.52]
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-11c4d7d4683so22076960fac.8
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Aug 2022 23:45:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo09+jFYxGlktPSIRfsY+yaMj5wU6xYjt7Ltl84w3b81WFaP8nSJ
        VGp+LDZDaATniB2pu3Quz4La0SD6cOKLEmRAGXk=
X-Google-Smtp-Source: AA6agR4Ch2wBMF6Felj0kvay2oleS/eDRihJzRoklSzOQkis8zFGJa5nHPOcC4/382yKukltEOZ2xKPTBrM16RVcnbU=
X-Received: by 2002:a05:6808:2099:b0:343:49f5:5300 with SMTP id
 s25-20020a056808209900b0034349f55300mr608082oiw.287.1661928348350; Tue, 30
 Aug 2022 23:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAR+Lp2g1kzGNALoge7_51_PKcOd37ebZTV=X-QJEwCn5w@mail.gmail.com>
 <0e70974912f6b2cd95a18192418a438f9c57f690.1661730960.git.owen@owenrafferty.com>
In-Reply-To: <0e70974912f6b2cd95a18192418a438f9c57f690.1661730960.git.owen@owenrafferty.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 31 Aug 2022 15:44:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
Message-ID: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rewrite check-local-export in sh/awk
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

On Mon, Aug 29, 2022 at 8:57 AM Owen Rafferty <owen@owenrafferty.com> wrote:
>
> ---
>  scripts/check-local-export | 96 +++++++++++++++++++-------------------
>  1 file changed, 47 insertions(+), 49 deletions(-)




V3 improved the code, but the entire commit log disappeared.
I guess it is by accident.



v2:
https://patchwork.kernel.org/project/linux-kbuild/patch/a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7.1660314650.git.owen@owenrafferty.com/

v3:
https://patchwork.kernel.org/project/linux-kbuild/patch/0e70974912f6b2cd95a18192418a438f9c57f690.1661730960.git.owen@owenrafferty.com/



Do you want me to restore the log from v2?







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
> 2.37.2
>


-- 
Best Regards
Masahiro Yamada
