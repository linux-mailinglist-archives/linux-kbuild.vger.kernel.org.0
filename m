Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4D71562E5
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2020 06:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgBHFIz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 8 Feb 2020 00:08:55 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:40195 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgBHFIz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Feb 2020 00:08:55 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 01858i1i026887;
        Sat, 8 Feb 2020 14:08:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01858i1i026887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581138526;
        bh=97ghWMwsTSeLCvlHRl0XU3eSnjbQTX38ag5GiUt60lw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CqrAdxv4BND1qTcUnlhOu9A3xUJLIWoa3D0xwsJceyR6fmh5qu9hbHi5eh+zKpPGh
         Y5pTO/26oaqFahHCaKzqZMIInZ0ohfWc1vfkjcIstCuopRGS1Y2TwEClvaLFK4dlsA
         U/LD3xfOAeQt+uyCR8A2YJhMlA/R8Feh90xf8DZ3bu8ggUJJCVcYAoENGHZ8ehoWO8
         3+gD8keDO3fAVEpvyz1zj6tjGSfVzNI+XVkal3tyw7Jc489F4UXX8ENRC6PxG2h0qB
         5Dp8LKy8XRfJZ0TGc6J8mMVrotOqEJG/WrLU9wH5NTTSoFNrdM99h9HWSavO9Ctfhr
         E8Mqb026fAVkA==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id t12so969823vso.13;
        Fri, 07 Feb 2020 21:08:45 -0800 (PST)
X-Gm-Message-State: APjAAAV2J08180nFJ6bQcL4M2lPktuRTEmArjSKDuRYGK+EYB4lzpyjN
        qc6Edc4EwySotyzKoRxm1htSiofcIP2C2pFURfs=
X-Google-Smtp-Source: APXvYqzXwzpnFlzFudw+7vA91s9TWrjWBXOxZeckVhnDAst6Ns8EXIwtomQG+IZwCc7N8cCgqSg6IjPbiw7UN62Hegg=
X-Received: by 2002:a05:6102:3102:: with SMTP id e2mr1050508vsh.179.1581138524059;
 Fri, 07 Feb 2020 21:08:44 -0800 (PST)
MIME-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com> <20200207180755.100561-3-qperret@google.com>
In-Reply-To: <20200207180755.100561-3-qperret@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 8 Feb 2020 06:08:08 +0100
X-Gmail-Original-Message-ID: <CAK7LNARaEjo7g4=3o-F29Extru8+mYCDqY1i_Gzvra=JB-eZhw@mail.gmail.com>
Message-ID: <CAK7LNARaEjo7g4=3o-F29Extru8+mYCDqY1i_Gzvra=JB-eZhw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kbuild: split adjust_autoksyms.sh in two parts
To:     Quentin Perret <qperret@google.com>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 7, 2020 at 7:08 PM Quentin Perret <qperret@google.com> wrote:
>
> In order to prepare the ground for a build-time optimization, split
> adjust_autoksyms.sh into two scripts: one that generates autoksyms.h
> based on all currently available information (whitelist, and .mod
> files), and the other to inspect the diff between two versions of
> autoksyms.h and trigger appropriate rebuilds.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  scripts/adjust_autoksyms.sh | 32 ++++-----------------------
>  scripts/gen_autoksyms.sh    | 44 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 28 deletions(-)
>  create mode 100755 scripts/gen_autoksyms.sh
>
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index 58335eee4b38..ae1e65e9009c 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -1,14 +1,13 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-only
>
> -# Script to create/update include/generated/autoksyms.h and dependency files
> +# Script to update include/generated/autoksyms.h and dependency files
>  #
>  # Copyright:   (C) 2016  Linaro Limited
>  # Created by:  Nicolas Pitre, January 2016
>  #
>
> -# Create/update the include/generated/autoksyms.h file from the list
> -# of all module's needed symbols as recorded on the second line of *.mod files.
> +# Update the include/generated/autoksyms.h file.
>  #
>  # For each symbol being added or removed, the corresponding dependency
>  # file's timestamp is updated to force a rebuild of the affected source
> @@ -35,31 +34,8 @@ case "$KBUILD_VERBOSE" in
>         ;;
>  esac
>
> -# We need access to CONFIG_ symbols
> -. include/config/auto.conf
> -
> -# The symbol whitelist, relative to the source tree
> -eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
> -[[ "$ksym_wl" =~ ^/ ]] || ksym_wl="$abs_srctree/$ksym_wl"
> -
> -# Generate a new ksym list file with symbols needed by the current
> -# set of modules.
> -cat > "$new_ksyms_file" << EOT
> -/*
> - * Automatically generated file; DO NOT EDIT.
> - */
> -
> -EOT
> -sed 's/ko$/mod/' modules.order |
> -xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> -cat - "$ksym_wl" |
> -sort -u |
> -sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
> -
> -# Special case for modversions (see modpost.c)
> -if [ -n "$CONFIG_MODVERSIONS" ]; then
> -       echo "#define __KSYM_module_layout 1" >> "$new_ksyms_file"
> -fi
> +# Generate a new symbol list file
> +$srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"

In 3/3, you will call this script with $(CONFIG_SHELL) from Makefile.

For consistency,

$CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"

is better.


Thanks.




>
>  # Extract changes between old and new list and touch corresponding
>  # dependency files.
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> new file mode 100755
> index 000000000000..ce0919c3791a
> --- /dev/null
> +++ b/scripts/gen_autoksyms.sh
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +# Create an autoksyms.h header file from the list of all module's needed symbols
> +# as recorded on the second line of *.mod files and the user-provided symbol
> +# whitelist.
> +
> +set -e
> +
> +output_file="$1"
> +
> +# Use "make V=1" to debug this script.
> +case "$KBUILD_VERBOSE" in
> +*1*)
> +       set -x
> +       ;;
> +esac
> +
> +# We need access to CONFIG_ symbols
> +. include/config/auto.conf
> +
> +# The symbol whitelist, relative to the source tree
> +eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
> +[[ "$ksym_wl" =~ ^/ ]] || ksym_wl="$abs_srctree/$ksym_wl"
> +
> +# Generate a new ksym list file with symbols needed by the current
> +# set of modules.
> +cat > "$output_file" << EOT
> +/*
> + * Automatically generated file; DO NOT EDIT.
> + */
> +
> +EOT
> +
> +sed 's/ko$/mod/' modules.order |
> +xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> +cat - "$ksym_wl" |
> +sort -u |
> +sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
> +
> +# Special case for modversions (see modpost.c)
> +if [ -n "$CONFIG_MODVERSIONS" ]; then
> +       echo "#define __KSYM_module_layout 1" >> "$output_file"
> +fi
> --
> 2.25.0.341.g760bfbb309-goog
>


--
Best Regards
Masahiro Yamada
