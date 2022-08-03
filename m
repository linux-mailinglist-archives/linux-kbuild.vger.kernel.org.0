Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C7D58860F
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Aug 2022 05:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbiHCDli (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Aug 2022 23:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbiHCDlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Aug 2022 23:41:37 -0400
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8055142E
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Aug 2022 20:41:36 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 2733fKWN002173
        for <linux-kbuild@vger.kernel.org>; Wed, 3 Aug 2022 12:41:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 2733fKWN002173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1659498081;
        bh=II3xSu2EOwQ/vw7HQsjOeX+wEyX5Dtzw2ZqVa5NyoFo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MNk450CMga/Z+zVtphd339Vp5cGAANZYFMLNB4fcQbyDrw5fQ1mWaRYmDMNwGk45+
         5UakvObATAuc67i32hJpZ9LaUiHEWFXJgNhEVJb3xuWZbWMBJk7Wg2gU3v7cUCEi76
         YA0lF3n16H1MOSySBXDR6ipl9Ab+pluBmKRvZvzH2uBQ1AkRX3NLP3OHkmy2HSLxGf
         pjCaypz4WKApG2mQlOiKXljqQI0s3L5BzqwSb75QOPC0mgabUtAgoJYLNnU9DwO1nJ
         /gpsfs0HGtovpVMXfwtlHYOsWAl/sV739RnhVQIWeSHhGHLQccV29Ed0LbzKiseiCC
         pLl5FCZis2A7Q==
X-Nifty-SrcIP: [209.85.128.46]
Received: by mail-wm1-f46.google.com with SMTP id v131-20020a1cac89000000b003a4bb3f786bso309414wme.0
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Aug 2022 20:41:21 -0700 (PDT)
X-Gm-Message-State: ACgBeo3AOeM2ZJp/L2LFmBbuSQPt+QuwUxbK4WBfrc5/f8uw4dlNNmip
        TQGhx48C3XLwqm05zulh1hkzF4fm+vMZ/0L7qKU=
X-Google-Smtp-Source: AA6agR5WmahEU+S6mJqeM64OnrJ4qrl6TfgJRM+5398Klsa1ihAIye7yB2A7+pgWuE0XlKSYLSrrLlR/dki4MK5RM/E=
X-Received: by 2002:a05:600c:a18e:b0:3a3:10ef:672a with SMTP id
 id14-20020a05600ca18e00b003a310ef672amr1335584wmb.14.1659498079740; Tue, 02
 Aug 2022 20:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <18a919882d8aa7b8970888a565ebbbeefdce9f12.1659465303.git.owen@owenrafferty.com>
In-Reply-To: <18a919882d8aa7b8970888a565ebbbeefdce9f12.1659465303.git.owen@owenrafferty.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 3 Aug 2022 12:40:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNASEEU1-GqH1BiwU5P3L0kF5vwQ2WQ4njZrHQt0Z9ok47g@mail.gmail.com>
Message-ID: <CAK7LNASEEU1-GqH1BiwU5P3L0kF5vwQ2WQ4njZrHQt0Z9ok47g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rewrite check-local-export in posix shell
To:     Owen Rafferty <owen@owenrafferty.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 3, 2022 at 3:49 AM Owen Rafferty <owen@owenrafferty.com> wrote:
>
> Remove the bash build dependency for those who otherwise do not have it
> installed. This should also provide a slight speedup.

I do not know if this is worth the effort,
but do you have any benchmark on how fast it is?


>
> Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
> ---
>  scripts/check-local-export | 62 +++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 34 deletions(-)
>
> diff --git a/scripts/check-local-export b/scripts/check-local-export
> index 6ccc2f467416..08fa4c989244 100755
> --- a/scripts/check-local-export
> +++ b/scripts/check-local-export
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env bash
> +#!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>  # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>
> @@ -8,31 +8,11 @@
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
> +symbol_types=""
> +export_symbols=""
>
>  exit_code=0
>
> -# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> -# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> -# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> -# hand-crafted error message here.
> -#
> -# TODO:
> -# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> -# binutils to 2.37, llvm to 13.0.0.
> -# Then, the following line will be really simple:
> -#   ${NM} --quiet ${1} |
> -
> -{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; false; } } |
>  while read value type name
>  do
>         # Skip the line if the number of fields is less than 3.
> @@ -46,26 +26,40 @@ do
>         # case 2)
>         #   For Clang LTO, llvm-nm outputs a line with type 't' but empty name:
>         #     "---------------- t"
> -       if [[ -z ${name} ]]; then
> +       if [ -z ${name} ]; then
>                 continue
>         fi
>
> -       # save (name, type) in the associative array
> -       symbol_types[${name}]=${type}
> +       # save (name, type) in "associative array"
> +       symbol_types="$symbol_types ${name},${type}"
>
>         # append the exported symbol to the array
> -       if [[ ${name} == __ksymtab_* ]]; then
> -               export_symbols+=(${name#__ksymtab_})
> -       fi
> -done
> +       case ${name} in __ksymtab_*)
> +               export_symbols="$export_symbols ${name#__ksymtab_}"
> +       esac
>
> -for name in "${export_symbols[@]}"
> +# If there is no symbol in the object, ${NM} (both GNU nm and llvm-nm) shows
> +# 'no symbols' diagnostic (but exits with 0). It is harmless and hidden by
> +# '2>/dev/null'. However, it suppresses real error messages as well. Add a
> +# hand-crafted error message here.
> +#
> +# TODO:
> +# Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
> +# binutils to 2.37, llvm to 13.0.0.
> +# Then, the following line will be simple:
> +# $(${NM} --quiet ${1} || kill -INT $$)
> +done <<EOF
> +$( ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill -INT $$; })
> +EOF
> +
> +for name in $export_symbols
>  do
> -       # nm(3) says "If lowercase, the symbol is usually local"
> -       if [[ ${symbol_types[$name]} =~ [a-z] ]]; then
> +       type="${symbol_types##* $name,}"
> +       type="${type%% *}"
> +       case ${type} in [a-z])
>                 echo "$@: error: local symbol '${name}' was exported" >&2
>                 exit_code=1
> -       fi
> +       esac
>  done
>
>  exit ${exit_code}
> --
> 2.37.1
>


-- 
Best Regards
Masahiro Yamada
