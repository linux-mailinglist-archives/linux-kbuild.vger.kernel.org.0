Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC267591D42
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Aug 2022 02:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiHNAYI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Aug 2022 20:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbiHNAYH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Aug 2022 20:24:07 -0400
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B381261111
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Aug 2022 17:24:04 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 27E0NgX0018284
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Aug 2022 09:23:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 27E0NgX0018284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1660436623;
        bh=4YmdIPvumDKsUURHenp6j8amd8HK2XcjfDTs8+TMmoQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ehBXFnSGqgnJN7rc/M/LMWSpxwd/h53C8v3fYgT+5kN/xrT0u0Gzyx85AQk4nQry2
         D5t0te1Wv/UH7R+kBHXdCx7ydYk+V9rTzeBcM2Dh9ZgFad70ay6QIokrlcmnuVodOV
         845Y4eEmQlj6hyv1BCr/hkPkou4L36s09DWQ19MFFOtLinS6zCQBjG954oaBb5oRZ5
         EnhGfWlBUTAhY8isu5tMIa0NkJWEv4AEw/S5Km8z2DMHejqAyz6ZJ4AJ57ZPv2jhf+
         RawqX0mIgpm98xXRW1QRaBfe2B3aHd1kQebeHkYAkvhpBBG6KaTPXMZ+oKIjiaghJM
         LX7tcQQsR8bag==
X-Nifty-SrcIP: [209.85.221.54]
Received: by mail-wr1-f54.google.com with SMTP id bv3so5046571wrb.5
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Aug 2022 17:23:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo2/oDBJTtD/g02TgCXhh0zng+LnkvBMAEamjAfw5vPBo/upw470
        8RhYaFBGfcTMekyeuWFugxGv3wIXhiigpCiaqzo=
X-Google-Smtp-Source: AA6agR4ipbEsDyCJn3iGcZUn47vhpmunGUom4eKDSAqPGiS583JX20D+dTDcWSM7SPQIyuIUcEWKIRuBWc2qZUP2szA=
X-Received: by 2002:a05:6000:168f:b0:220:748e:82c0 with SMTP id
 y15-20020a056000168f00b00220748e82c0mr5145626wrd.477.1660436621309; Sat, 13
 Aug 2022 17:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7.1660314650.git.owen@owenrafferty.com>
In-Reply-To: <a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7.1660314650.git.owen@owenrafferty.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 14 Aug 2022 09:23:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbLrc=s7=SOs7QUwcxchmEy4G8OXp3Mn_03a4_-xAf6A@mail.gmail.com>
Message-ID: <CAK7LNATbLrc=s7=SOs7QUwcxchmEy4G8OXp3Mn_03a4_-xAf6A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rewrite check-local-export in sh/awk
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

On Fri, Aug 12, 2022 at 11:36 PM Owen Rafferty <owen@owenrafferty.com> wrote:
>
> Remove the bash build dependency for those who otherwise do not
> have it installed. This also provides a significant speedup:
>
> $ make defconfig
> $ make yes2modconfig
>
> ...
>
> $ find  .  -name "*.o" | grep -v vmlinux | wc
>      3169      3169     89615
> $ export NM=nm
> $ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1
> ./scripts/check-local-export'
>
> Without patch:
>     0m15.90s real     0m12.17s user     0m05.28s system
>
> With patch:
> dash + nawk
>     0m02.16s real     0m02.92s user     0m00.34s system
>
> dash + busybox awk
>     0m02.36s real     0m03.36s user     0m00.34s system
>
> dash + gawk
>     0m02.07s real     0m03.26s user     0m00.32s system
>
> bash + gawk
>     0m03.55s real     0m05.00s user     0m00.54s system
>
> Signed-off-by: Owen Rafferty <owen@owenrafferty.com>




How did you get those small numbers?


The script invokes ${NM} internally,
so it is impossible to become faster than nm.

For me, it takes 55 sec just for running nm.




$ find . -name "*.o"  | wc
   3191    3191   90085

$ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1 nm >/dev/null'
nm: ./arch/x86/entry/vdso/vdso32/note.o: no symbols
nm: ./arch/x86/entry/vdso/vdso-note.o: no symbols

real 0m55.783s
user 0m24.887s
sys 0m30.905s











> ---
>
> Notes:
>     [v2] commit message updated
>
>  scripts/check-local-export | 95 ++++++++++++++++++--------------------
>  1 file changed, 46 insertions(+), 49 deletions(-)
>
> diff --git a/scripts/check-local-export b/scripts/check-local-export
> index 6ccc2f467416..67eaa7cf08c0 100755
> --- a/scripts/check-local-export
> +++ b/scripts/check-local-export
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env bash
> +#!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>  # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
> @@ -8,19 +8,6 @@
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
> @@ -29,43 +16,53 @@ exit_code=0
>  # TODO:
>  # Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
>  # binutils to 2.37, llvm to 13.0.0.
> -# Then, the following line will be really simple:
> -#   ${NM} --quiet ${1} |
> +# Then, the following line will be simpler:
> +#   { ${NM} --quiet ${1} || kill 0; } |
> +
> +{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
> +awk -v "file=${1}" '
> +BEGIN {
> +       exit_code = 0
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
