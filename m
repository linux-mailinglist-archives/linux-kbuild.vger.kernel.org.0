Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 115795A87DB
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Aug 2022 23:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbiHaVDI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Aug 2022 17:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbiHaVDG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Aug 2022 17:03:06 -0400
Received: from mail.owenrafferty.com (owenrafferty.com [45.76.27.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E76F2C9D
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2022 14:03:05 -0700 (PDT)
Received: from localhost (unknown [184.55.81.148])
        by mail.owenrafferty.com (Postfix) with ESMTPSA id EA1C980BD5;
        Wed, 31 Aug 2022 21:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=owenrafferty.com;
        s=mail; t=1661979783;
        bh=Xl02WVWojWHxVOeu3sBt6MF1rwXKF0Ex5Av3wzAvRvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nvyrl5oAi6LfoN3U1XfqGdtPxxF5vBjjYCV+SnM2Re2GjpUEPwwOVIAxynASBmfyI
         +em3UTc58c0AnlUO3wPfTKcz+kwKAu6+aoMFW6dpJANv8zhwQle3vUXl23XM+sBNgm
         47ShsOZdteaCKspeRre668YewfXSEAH9oowuYb3qbIoHbVy+wWii3yt9aGs3E4cG5+
         9Cc8hArBhHVZA0EH/VPjXqcs/M0qivK8VBP7EoxoP/Xo/F128jX+VFhG5ekpV9jIS8
         V6s4I7gGyMog0porRKNqXN44b5QwnW/ATRylfDFhHGsVGcd+2Z3w8Rz0oXODKdd+io
         ZL0b85Lk4fdOw==
Date:   Wed, 31 Aug 2022 16:03:00 -0500
From:   Owen Rafferty <owen@owenrafferty.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: rewrite check-local-export in sh/awk
Message-ID: <Yw/MhFFJZuqwVW+/@niobium.localdomain>
References: <CAK7LNAR+Lp2g1kzGNALoge7_51_PKcOd37ebZTV=X-QJEwCn5w@mail.gmail.com>
 <0e70974912f6b2cd95a18192418a438f9c57f690.1661730960.git.owen@owenrafferty.com>
 <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 22/08/31 03:44PM, Masahiro Yamada wrote:
> On Mon, Aug 29, 2022 at 8:57 AM Owen Rafferty <owen@owenrafferty.com> wrote:
> >
> > ---
> >  scripts/check-local-export | 96 +++++++++++++++++++-------------------
> >  1 file changed, 47 insertions(+), 49 deletions(-)
>
>
>
>
> V3 improved the code, but the entire commit log disappeared.
> I guess it is by accident.
>
>
>
> v2:
> https://patchwork.kernel.org/project/linux-kbuild/patch/a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7.1660314650.git.owen@owenrafferty.com/
>
> v3:
> https://patchwork.kernel.org/project/linux-kbuild/patch/0e70974912f6b2cd95a18192418a438f9c57f690.1661730960.git.owen@owenrafferty.com/
>
>
>
> Do you want me to restore the log from v2?
>

I'll submit v4, applied atop your kbuild branch and with a proper
signoff. Thanks for bearing with me.

>
> > diff --git a/scripts/check-local-export b/scripts/check-local-export
> > index 6ccc2f467416..0c049ff44aca 100755
> > --- a/scripts/check-local-export
> > +++ b/scripts/check-local-export
> > @@ -1,26 +1,14 @@
> > -#!/usr/bin/env bash
> > +#!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  #
> >  # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
> > +# Copyright (C) 2022 Owen Rafferty <owen@owenrafferty.com>
> >  #
> >  # Exit with error if a local exported symbol is found.
> >  # EXPORT_SYMBOL should be used for global symbols.
> >
> >  set -e
> >
> > -# catch errors from ${NM}
> > -set -o pipefail
> > -
> > -# Run the last element of a pipeline in the current shell.
> > -# Without this, the while-loop would be executed in a subshell, and
> > -# the changes made to 'symbol_types' and 'export_symbols' would be lost.
> > -shopt -s lastpipe
> > -
> > -declare -A symbol_types
> > -declare -a export_symbols
> > -
> > -exit_code=0
> > -
> >  # If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> >  # 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> >  # '2>/dev/null'. However, it suppresses real error messages as well. Add a
> > @@ -29,43 +17,53 @@ exit_code=0
> >  # TODO:
> >  # Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> >  # binutils to 2.37, llvm to 13.0.0.
> > -# Then, the following line will be really simple:
> > -#   ${NM} --quiet ${1} |
> > +# Then, the following line will be simpler:
> > +#   { ${NM} --quiet ${1} || kill 0; } |
> > +
> > +{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
> > +${AWK} -v "file=${1}" '
> > +BEGIN {
> > +       i = 0
> > +}
> > +
> > +# Skip the line if the number of fields is less than 3.
> > +#
> > +# case 1)
> > +#   For undefined symbols, the first field (value) is empty.
> > +#   The outout looks like this:
> > +#     "                 U _printk"
> > +#   It is unneeded to record undefined symbols.
> > +#
> > +# case 2)
> > +#   For Clang LTO, llvm-nm outputs a line with type t but empty name:
> > +#     "---------------- t"
> > +!length($3) {
> > +       next
> > +}
> >
> > -{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
> > -while read value type name
> > -do
> > -       # Skip the line if the number of fields is less than 3.
> > -       #
> > -       # case 1)
> > -       #   For undefined symbols, the first field (value) is empty.
> > -       #   The outout looks like this:
> > -       #     "                 U _printk"
> > -       #   It is unneeded to record undefined symbols.
> > -       #
> > -       # case 2)
> > -       #   For Clang LTO, llvm-nm outputs a line with type 't' but empty name:
> > -       #     "---------------- t"
> > -       if [[ -z ${name} ]]; then
> > -               continue
> > -       fi
> > +# save (name, type) in the associative array
> > +{ symbol_types[$3]=$2 }
> >
> > -       # save (name, type) in the associative array
> > -       symbol_types[${name}]=${type}
> > +# append the exported symbol to the array
> > +($3 ~ /^__ksymtab_/) {
> > +       export_symbols[i] = $3
> > +       sub(/^__ksymtab_/, "", export_symbols[i])
> > +       i++
> > +}
> >
> > -       # append the exported symbol to the array
> > -       if [[ ${name} == __ksymtab_* ]]; then
> > -               export_symbols+=(${name#__ksymtab_})
> > -       fi
> > -done
> > +END {
> > +       exit_code = 0
> > +       for (j = 0; j < i; ++j) {
> > +               name = export_symbols[j]
> > +               # nm(3) says "If lowercase, the symbol is usually local"
> > +               if (symbol_types[name] ~ /[a-z]/) {
> > +                       printf "%s: error: local symbol %s was exported\n",
> > +                               file, name | "cat 1>&2"
> > +                       exit_code = 1
> > +               }
> > +       }
> >
> > -for name in "${export_symbols[@]}"
> > -do
> > -       # nm(3) says "If lowercase, the symbol is usually local"
> > -       if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
> > -               echo "$@: error: local symbol '${name}' was exported" >&2
> > -               exit_code=1
> > -       fi
> > -done
> > +       exit exit_code
> > +}'
> >
> > -exit ${exit_code}
> > +exit $?
> > --
> > 2.37.2
> >
>
>
> --
> Best Regards
> Masahiro Yamada
