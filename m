Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA895AE441
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Sep 2022 11:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239498AbiIFJ3z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Sep 2022 05:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239484AbiIFJ3t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Sep 2022 05:29:49 -0400
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0D312AB7
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Sep 2022 02:29:47 -0700 (PDT)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 2869TRjQ006017
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Sep 2022 18:29:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 2869TRjQ006017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1662456568;
        bh=H+21qNEGLuxUuq0sM8Gohx7kNSojog61151/k2ssuT0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=f1GCDorD3St5zJBJ3NOo+Xx17ef2A+6b3dO7UQE2BuF5x9YFveScPF7fhat477MBc
         xl8H5IktuOOH9XA6Z2Hzzi9F9pmuDeJKaAN8Rhncp5/beAsxaML0VFHhVW4KRX8DaQ
         YBxfw2wr+n7qNHdIq9VSADOjxPDPg+bbBbMij4UmbFwNe8yOK7XwEx7WlzLF/rkXN/
         t3H8hplJTdjYqlCT+ZEGI+wNX+TR+44k4lXlvE0J9isgJ/16TAnfp9K7MUTS7iStRA
         I9IpCFcyl+h7yvjub7dbUF+94TxOU+MNphUwrChWcr3Xl6Jd1edPLk+NbTItY50VZx
         /b1gd7x+Ou4zw==
X-Nifty-SrcIP: [209.85.160.41]
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1278a61bd57so8203896fac.7
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Sep 2022 02:29:28 -0700 (PDT)
X-Gm-Message-State: ACgBeo1zp267sKMbZ+5C1yMocrilYLNmfdTnDv02dAgcbQYF2PA/dxh2
        5HQdSyNrwRCoJmWmB22yLswwqmfikF6Yo/VDdVU=
X-Google-Smtp-Source: AA6agR4Azq/rqYQ6zzPN4X3mBFbMhtsHTxseAsJF2g7/gLlng/epDpSWmZ7WyboRJm7eBTlwmWZmaFDqUCZ+RI7T8gc=
X-Received: by 2002:a05:6870:f626:b0:10d:a798:f3aa with SMTP id
 ek38-20020a056870f62600b0010da798f3aamr11153267oab.194.1662456567205; Tue, 06
 Sep 2022 02:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATtFv9C4ppgxBWD+R5JtHUtCMb5yqvP1Vxsr2Ki7U466Q@mail.gmail.com>
 <b0cf49ac1a3ece40e133fa80e3ceae7891d6ed8d.1661979510.git.owen@owenrafferty.com>
 <CAK7LNARYiJNiFKL2pQWCOocxkYWiJ66S4gBDE=54tFYJnfO--g@mail.gmail.com>
In-Reply-To: <CAK7LNARYiJNiFKL2pQWCOocxkYWiJ66S4gBDE=54tFYJnfO--g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 6 Sep 2022 18:28:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBijdVUVE3zpLCp2wXJ6FeC9Ar7ii_bMTPYWvGKgJJTQ@mail.gmail.com>
Message-ID: <CAK7LNAQBijdVUVE3zpLCp2wXJ6FeC9Ar7ii_bMTPYWvGKgJJTQ@mail.gmail.com>
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

On Sun, Sep 4, 2022 at 1:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Sep 1, 2022 at 6:03 AM Owen Rafferty <owen@owenrafferty.com> wrote:
> >
> > Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
> > ---
>
>
> Please input something in the commit log.
>
> I think the benchmark in v2 is worth mentioning
> because "awk is faster than bash" is one benefit
> of applying this patch.
>
>



Applied to linux-kbuild. Thanks.


(V5 was not delivered to ML somehow,
but I found it in my mailbox.)









>
>
>
>
> >  scripts/check-local-export | 96 +++++++++++++++++++-------------------
> >  1 file changed, 47 insertions(+), 49 deletions(-)
> >
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
> > 2.37.3
> >
>
>
> --
> Best Regards
> Masahiro Yamada



--
Best Regards
Masahiro Yamada
