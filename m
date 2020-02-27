Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5311723BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2020 17:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730046AbgB0Qmj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 11:42:39 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46973 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbgB0Qmj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 11:42:39 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 01RGgSNn032144;
        Fri, 28 Feb 2020 01:42:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01RGgSNn032144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582821749;
        bh=Kl3TN2eh546ny6xXnVBhUNVM+StMJOTg1j6RbqQc4Yw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PM+jqTkZpUpTAOB6lgGVTHx6Fj9Bf+fM3Wlci2ZRT67lowavsmzO+OyCxjDdIfL78
         a0nLBrm0jbwjxNpxAbLuE9NzkDoylexss5kMITAEEQTCINS0QPEmFRb7aiwXkcXfnG
         ySpp+QiTxZkxgrmvOnt2kaIHugLDWoWPt8vx41+TEtnLlh0zBNSUOWvCfFbbJggvai
         PaH8TWUXAez2LvtdsJ6c3MRpnbWYQ1zWOtDxlX0FcPiftt4EumvTDPj33EDai8sjiA
         Yuk7Eg13x6738iXrFfSiTlTKI6g8XzwgMqcauqtP3WUyoY9mhdxPm+tLNGSV+t+ixG
         QsyM4NOY9LtdA==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id x18so37498vsq.4;
        Thu, 27 Feb 2020 08:42:28 -0800 (PST)
X-Gm-Message-State: ANhLgQ2bDfFPoLdb6Ce/vLifzLOR4fqy1bkCmz5gcXJSJpymmgLEQJuM
        B1VlxMzuMz+ZJfclpoUrCa3M7LIbB+YS9VhtqH0=
X-Google-Smtp-Source: ADFU+vsh4q8lDg7PVdz5KXpCZ22dWRT4Tb9aCU4TMqhfIxWdgL6cfnwmrm2xUTX+dIexC1qWCc52X5DuKMIq2GNBOC8=
X-Received: by 2002:a05:6102:190:: with SMTP id r16mr46746vsq.215.1582821747593;
 Thu, 27 Feb 2020 08:42:27 -0800 (PST)
MIME-Version: 1.0
References: <20200218094139.78835-1-qperret@google.com> <20200218094139.78835-3-qperret@google.com>
In-Reply-To: <20200218094139.78835-3-qperret@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Feb 2020 01:41:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS0D_1k8FUJ+Bre1jrtGvHu28psU_xCa=K24iD7BkcJeA@mail.gmail.com>
Message-ID: <CAK7LNAS0D_1k8FUJ+Bre1jrtGvHu28psU_xCa=K24iD7BkcJeA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] kbuild: split adjust_autoksyms.sh in two parts
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

Hi.

On Tue, Feb 18, 2020 at 6:41 PM Quentin Perret <qperret@google.com> wrote:
>
> In order to prepare the ground for a build-time optimization, split
> adjust_autoksyms.sh into two scripts: one that generates autoksyms.h
> based on all currently available information (whitelist, and .mod
> files), and the other to inspect the diff between two versions of
> autoksyms.h and trigger appropriate rebuilds.
>
> Acked-by: Nicolas Pitre <nico@fluxnic.net>
> Tested-by: Matthias Maennich <maennich@google.com>
> Reviewed-by: Matthias Maennich <maennich@google.com>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  scripts/adjust_autoksyms.sh | 36 +++-----------------------
>  scripts/gen_autoksyms.sh    | 51 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 32 deletions(-)
>  create mode 100755 scripts/gen_autoksyms.sh
>
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index ff46996525d3..2b366d945ccb 100755
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
> @@ -38,35 +37,8 @@ esac
>  # We need access to CONFIG_ symbols
>  . include/config/auto.conf
>
> -ksym_wl=/dev/null
> -if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
> -       # Use 'eval' to expand the whitelist path and check if it is relative
> -       eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
> -       [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
> -       if [ ! -f "$ksym_wl" ]; then


Just a Nit.

Maybe, is testing  -r better ?

'cat - "$ksym_wl"' is piped, so its error code is not checked.

So, checking the read permission here is robust, I think.




> -               echo "ERROR: '$ksym_wl' whitelist file not found" >&2
> -               exit 1
> -       fi
> -fi
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
> +$CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
>
>  # Extract changes between old and new list and touch corresponding
>  # dependency files.
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> new file mode 100755
> index 000000000000..6c625f52118f
> --- /dev/null
> +++ b/scripts/gen_autoksyms.sh
> @@ -0,0 +1,51 @@
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
> +ksym_wl=/dev/null
> +if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
> +       # Use 'eval' to expand the whitelist path and check if it is relative
> +       eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
> +       [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
> +       if [ ! -f "$ksym_wl" ]; then
> +               echo "ERROR: '$ksym_wl' whitelist file not found" >&2
> +               exit 1
> +       fi
> +fi
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
> 2.25.0.265.gbab2e86ba0-goog
>


-- 
Best Regards
Masahiro Yamada
