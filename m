Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3EAE589301
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Aug 2022 22:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237045AbiHCUMv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Aug 2022 16:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236087AbiHCUMu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Aug 2022 16:12:50 -0400
Received: from mail.owenrafferty.com (owenrafferty.com [45.76.27.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F8543AB32
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Aug 2022 13:12:49 -0700 (PDT)
Received: from localhost (unknown [184.55.81.148])
        by mail.owenrafferty.com (Postfix) with ESMTPSA id 3DC4180D04;
        Wed,  3 Aug 2022 20:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=owenrafferty.com;
        s=mail; t=1659557568;
        bh=uOCYODqwo9hshoYvpiSaXspNrS36tHiJAqEetnXM060=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TXJd8CTSP0tUnc6/CLpF2+TezzZaW/CDoj2SHsG91is9FXdvQIvrmFTY3dMgPzPpu
         1A3OQuFdXSx/7h9GWmdUI1WY9+udxOn9WfduL/bOc4+W+mwgRxyvv3CU68/DMXX/Ms
         shNUG1Nb/Q+74PRH48k3GJlHrAmPbsMLuXlAQn7Ty4c+0bv2HIURuRVGEoNlUBAdGl
         wMH5cEzGNGEh0/gXtGqSp4gE60oDK/6sAbVa1Vuk1Cc42+MU+CNlfj/ueivRwpmMQh
         UcQ35Ve+1q99mjoUzmGxejxyXc8HHfsZtJLxe/BPrCR+4+uW2HXO6kxHLHRjPfSLgw
         xgrerN90ZV6Lg==
Date:   Wed, 3 Aug 2022 15:12:47 -0500
From:   Owen Rafferty <owen@owenrafferty.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] kbuild: rewrite check-local-export in posix shell
Message-ID: <YurWv4VQbMNICK8/@niobium.localdomain>
References: <18a919882d8aa7b8970888a565ebbbeefdce9f12.1659465303.git.owen@owenrafferty.com>
 <CAK7LNASEEU1-GqH1BiwU5P3L0kF5vwQ2WQ4njZrHQt0Z9ok47g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASEEU1-GqH1BiwU5P3L0kF5vwQ2WQ4njZrHQt0Z9ok47g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 22/08/03 12:40PM, Masahiro Yamada wrote:
> On Wed, Aug 3, 2022 at 3:49 AM Owen Rafferty <owen@owenrafferty.com> wrote:
> >
> > Remove the bash build dependency for those who otherwise do not have it
> > installed. This should also provide a slight speedup.
>
> I do not know if this is worth the effort,
> but do you have any benchmark on how fast it is?

To be clear, I'm not asking for every single bash script in the tree to be
rewritten in posix shell -- it was only this script that made bash a hard
dependency (on x86 at least).

For a configuration suitable for my system w/ 4 HT cores:

bash
    real8m 47.79s     user54m 30.91s    sys13m 56.88s

sh (dash)
    real7m 34.94s     user46m 42.63s    sys11m 54.02s

> >
> > Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
> > ---
> >  scripts/check-local-export | 62 +++++++++++++++++---------------------
> >  1 file changed, 28 insertions(+), 34 deletions(-)
> >
> > diff --git a/scripts/check-local-export b/scripts/check-local-export
> > index 6ccc2f467416..08fa4c989244 100755
> > --- a/scripts/check-local-export
> > +++ b/scripts/check-local-export
> > @@ -1,4 +1,4 @@
> > -#!/usr/bin/env bash
> > +#!/bin/sh
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  #
> >  # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
> > @@ -8,31 +8,11 @@
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
> > +symbol_types=""
> > +export_symbols=""
> >
> >  exit_code=0
> >
> > -# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> > -# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> > -# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> > -# hand-crafted error message here.
> > -#
> > -# TODO:
> > -# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> > -# binutils to 2.37, llvm to 13.0.0.
> > -# Then, the following line will be really simple:
> > -#   ${NM} --quiet ${1} |
> > -
> > -{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
> >  while read value type name
> >  do
> >         # Skip the line if the number of fields is less than 3.
> > @@ -46,26 +26,40 @@ do
> >         # case 2)
> >         #   For Clang LTO, llvm-nm outputs a line with type 't' but empty name:
> >         #     "---------------- t"
> > -       if [[ -z ${name} ]]; then
> > +       if [ -z ${name} ]; then
> >                 continue
> >         fi
> >
> > -       # save (name, type) in the associative array
> > -       symbol_types[${name}]=${type}
> > +       # save (name, type) in "associative array"
> > +       symbol_types="$symbol_types ${name},${type}"
> >
> >         # append the exported symbol to the array
> > -       if [[ ${name} == __ksymtab_* ]]; then
> > -               export_symbols+=(${name#__ksymtab_})
> > -       fi
> > -done
> > +       case ${name} in __ksymtab_*)
> > +               export_symbols="$export_symbols ${name#__ksymtab_}"
> > +       esac
> >
> > -for name in "${export_symbols[@]}"
> > +# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> > +# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> > +# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> > +# hand-crafted error message here.
> > +#
> > +# TODO:
> > +# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> > +# binutils to 2.37, llvm to 13.0.0.
> > +# Then, the following line will be simple:
> > +# $(${NM} --quiet ${1} || kill -INT $$)
> > +done <<EOF
> > +$( ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill -INT $$; })
> > +EOF
> > +
> > +for name in $export_symbols
> >  do
> > -       # nm(3) says "If lowercase, the symbol is usually local"
> > -       if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
> > +       type="${symbol_types##* $name,}"
> > +       type="${type%% *}"
> > +       case ${type} in [a-z])
> >                 echo "$@: error: local symbol '${name}' was exported" >&2
> >                 exit_code=1
> > -       fi
> > +       esac
> >  done
> >
> >  exit ${exit_code}
> > --
> > 2.37.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada
