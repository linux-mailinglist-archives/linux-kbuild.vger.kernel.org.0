Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51DC320C0D
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 18:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhBURUE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 12:20:04 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45981 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhBURUD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 12:20:03 -0500
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 11LHIkDx022911;
        Mon, 22 Feb 2021 02:18:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 11LHIkDx022911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613927927;
        bh=Eqx+VxxafaM9Oj7G/aUK4ZQYypo41uDdqDY/LZ3A/iw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tISy0uiFEkFoH5+1mpc3ZVAv0F3Yc6p89kW9iYoj6mv9+E5gdjqI260Z6DUoy8zjB
         sgH4w8OrSnaZll1SQQ2YFNB4eb5Crb2X/1TpLuHQYxJPSQ8GQo7Dxij7GOdADkBNKW
         KDEGV1YPwA1N3H96ESC3NT+0pqmL3n/9aXo95xQxvG1w8vuUWOnNBNA8JCu0thb/Ek
         0soONOBKPbDfi7aYYHaZjf6+gIIw9nMh+lk1tSUygGbeCVyjqo68JNfFCoH7ryNuf0
         D55rY9HYQz+nNc99bREU2hB4cplo9ePoJHwrYBGGCeco+aCH1UNrJ/oPt9cFuqkyey
         9PPdHX1sj56Hw==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id q20so5101233pfu.8;
        Sun, 21 Feb 2021 09:18:46 -0800 (PST)
X-Gm-Message-State: AOAM533cO5IjCiOYo/pW6YnR/2o78RZl1BwUOv0D1uOTG+D2lmk+WFUo
        8SNFavhXuIiqUMEYQGBm5NMWaQNCocAQ15sw22Q=
X-Google-Smtp-Source: ABdhPJwalkhBCvkAjpNZJFeiZ5ZMA3YgxFFO4ZhIHD73HQFbK2IonNyYIgbkcXcRNDfT2GEbgAIwQ7RygvbUP7eWxss=
X-Received: by 2002:a63:575e:: with SMTP id h30mr16552262pgm.7.1613927926094;
 Sun, 21 Feb 2021 09:18:46 -0800 (PST)
MIME-Version: 1.0
References: <20210216020412.800836-1-masahiroy@kernel.org>
In-Reply-To: <20210216020412.800836-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 22 Feb 2021 02:18:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNASaAX4VAO9ky+nAQ-BViFJxJkOJa7791bMcqC7Ev8PySQ@mail.gmail.com>
Message-ID: <CAK7LNASaAX4VAO9ky+nAQ-BViFJxJkOJa7791bMcqC7Ev8PySQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add generic syscalltbl.sh
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 16, 2021 at 11:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Most of architectures generate syscall headers at the compile time
> in a similar way.
>
> The syscall table has the same format for all architectures. Each line
> has up to 5 fields; syscall number, ABI, syscall name, native entry
> point, and compat entry point. The syscall table is processed by
> syscalltbl.sh script into header files.
>
> Despite the same pattern, scripts are maintained per architecture,
> which results in code duplication and bad maintainability.
>
> As of v5.11-rc1, 12 architectures duplicate similar shell scripts:
>
>   $ find arch -name syscalltbl.sh | sort
>   arch/alpha/kernel/syscalls/syscalltbl.sh
>   arch/arm/tools/syscalltbl.sh
>   arch/ia64/kernel/syscalls/syscalltbl.sh
>   arch/m68k/kernel/syscalls/syscalltbl.sh
>   arch/microblaze/kernel/syscalls/syscalltbl.sh
>   arch/mips/kernel/syscalls/syscalltbl.sh
>   arch/parisc/kernel/syscalls/syscalltbl.sh
>   arch/powerpc/kernel/syscalls/syscalltbl.sh
>   arch/sh/kernel/syscalls/syscalltbl.sh
>   arch/sparc/kernel/syscalls/syscalltbl.sh
>   arch/x86/entry/syscalls/syscalltbl.sh
>   arch/xtensa/kernel/syscalls/syscalltbl.sh
>
> My goal is to unify them into scripts/syscalltbl.sh.
>
> __SYSCALL_WITH_COMPAT should be defined as follows:
>
> 32-bit kernel:
>   #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)
>
> 64-bit kernel:
>
>   #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, compat)
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

Both applied to linux-kbuild.


>  scripts/syscalltbl.sh | 73 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100755 scripts/syscalltbl.sh
>
> diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
> new file mode 100755
> index 000000000000..aa6ab156301c
> --- /dev/null
> +++ b/scripts/syscalltbl.sh
> @@ -0,0 +1,73 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Generate a syscall table header.
> +#
> +# Each line of the syscall table should have the following format:
> +#
> +# NR ABI NAME [NATIVE] [COMPAT]
> +#
> +# NR       syscall number
> +# ABI      ABI name
> +# NAME     syscall name
> +# NATIVE   native entry point (optional)
> +# COMPAT   compat entry point (optional)
> +
> +set -e
> +
> +usage() {
> +       echo >&2 "usage: $0 [--abis ABIS] INFILE OUTFILE" >&2
> +       echo >&2
> +       echo >&2 "  INFILE    input syscall table"
> +       echo >&2 "  OUTFILE   output header file"
> +       echo >&2
> +       echo >&2 "options:"
> +       echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all lines are handled)"
> +       exit 1
> +}
> +
> +# default unless specified by options
> +abis=
> +
> +while [ $# -gt 0 ]
> +do
> +       case $1 in
> +       --abis)
> +               abis=$(echo "($2)" | tr ',' '|')
> +               shift 2;;
> +       -*)
> +               echo "$1: unknown option" >&2
> +               usage;;
> +       *)
> +               break;;
> +       esac
> +done
> +
> +if [ $# -ne 2 ]; then
> +       usage
> +fi
> +
> +infile="$1"
> +outfile="$2"
> +
> +nxt=0
> +
> +grep -E "^[0-9]+[[:space:]]+$abis" "$infile" | sort -n | {
> +
> +       while read nr abi name native compat ; do
> +
> +               while [ $nxt -lt $nr ]; do
> +                       echo "__SYSCALL($nxt, sys_ni_syscall)"
> +                       nxt=$((nxt + 1))
> +               done
> +
> +               if [ -n "$compat" ]; then
> +                       echo "__SYSCALL_WITH_COMPAT($nr, $native, $compat)"
> +               elif [ -n "$native" ]; then
> +                       echo "__SYSCALL($nr, $native)"
> +               else
> +                       echo "__SYSCALL($nr, sys_ni_syscall)"
> +               fi
> +               nxt=$((nr + 1))
> +       done
> +} > "$outfile"
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
