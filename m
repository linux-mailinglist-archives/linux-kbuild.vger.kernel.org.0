Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BE63BB50F
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 04:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhGECGN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 22:06:13 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:45179 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhGECGN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 22:06:13 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 16523Jpt010664;
        Mon, 5 Jul 2021 11:03:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 16523Jpt010664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625450599;
        bh=i6TqbcfWRrqlvlGxRh4UhpNAO4m8Y8977j2FL6bcy68=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=atZdeBL7jys/wwkgQQFZEKxiLAamu7xob3+AEsxkRCRybp0KH98VV64yBSFXJ6e5D
         zV+kfJ+7WJj92SFM5wRmydPredWAAGIijBsNPadOXIwDIZbKN1j/S+mhD/biuCnjHm
         yzE+mALnys5LI9TXvv/qpauMkkDGmjJeIVYqHL56r15/veN7S+gKrzRWqjEdPOgRyV
         B9eigxV9XN4hT5i3py6L4C/U+7pWUy3Mtta0t5ioNqfWypoiNf3uf4qUfcjKfzGEvE
         0ww/+OO9oN0d+rAH48zWqKBc0DtGXhKYm038ptDg6Qxl6N3aifHGecLX8fYwiaSgy2
         s35VXQb6YryYQ==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id ie21so9069064pjb.0;
        Sun, 04 Jul 2021 19:03:19 -0700 (PDT)
X-Gm-Message-State: AOAM530t5a/8cLTrcIbl7eqJud8V9/CixpkvZW4CJe6GSljOla1GRBHM
        Dxt4LYk26vRFGbizozUymiGuOeLW66ncqZSXw5E=
X-Google-Smtp-Source: ABdhPJw4hd8V5x40kF8tSMckM9rvS2hMCQGd+tBctCYS3U9EgBBJKFlvgLbMvgriuyjosmayUyeC5qE8rTWLpOHXedU=
X-Received: by 2002:a17:90b:4d81:: with SMTP id oj1mr12215610pjb.153.1625450598996;
 Sun, 04 Jul 2021 19:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210702032943.7865-1-lecopzer.chen@mediatek.com> <20210702032943.7865-2-lecopzer.chen@mediatek.com>
In-Reply-To: <20210702032943.7865-2-lecopzer.chen@mediatek.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 5 Jul 2021 11:02:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqZdZy9mH2qbFJPGs81a0fEFGPutqmvrdz1U51zOvH3Q@mail.gmail.com>
Message-ID: <CAK7LNATqZdZy9mH2qbFJPGs81a0fEFGPutqmvrdz1U51zOvH3Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Kbuild: lto: add CONFIG_MAKE_VERSION
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        yj.chiang@mediatek.com, Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 2, 2021 at 12:29 PM Lecopzer Chen
<lecopzer.chen@mediatek.com> wrote:
>
> To check the GNU make version. Used by the LTO Kconfig.
>
> LTO with MODVERSIONS will fail in generating correct CRC because
> the makefile rule doesn't work for make with version 3.8X.[1]
>
> Thus we need to check make version during selecting on LTO Kconfig.
> Add CONFIG_MAKE_VERSION which means MAKE_VERSION in canonical digits
> for arithmetic comparisons.
>
> [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---


NACK.

"Let's add MAKE_VERSION >= 40200 restriction
just because I cannot write correct code that
works for older Make" is a horrible idea.

Also, Kconfig is supposed to check the compiler
(or toolchains) capability, not host tool versions.







>  Makefile                |  2 +-
>  init/Kconfig            |  4 ++++
>  scripts/make-version.sh | 13 +++++++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/make-version.sh
>
> diff --git a/Makefile b/Makefile
> index 88888fff4c62..2402745b2ba9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -516,7 +516,7 @@ CLANG_FLAGS :=
>
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> -export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> +export PERL PYTHON3 CHECK CHECKFLAGS MAKE MAKE_VERSION UTS_MACHINE HOSTCXX
>  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 55f9f7738ebb..ecc110504f87 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -86,6 +86,10 @@ config CC_HAS_ASM_INLINE
>  config CC_HAS_NO_PROFILE_FN_ATTR
>         def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
>
> +config MAKE_VERSION
> +       int
> +       default $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))
> +
>  config CONSTRUCTORS
>         bool
>
> diff --git a/scripts/make-version.sh b/scripts/make-version.sh
> new file mode 100755
> index 000000000000..3a451db3c067
> --- /dev/null
> +++ b/scripts/make-version.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Print the GNU make version in a 5 or 6-digit form.
> +
> +set -e
> +
> +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> +IFS=.
> +set -- $1
> +
> +# If the 2nd or 3rd field is missing, fill it with a zero.
> +echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> --
> 2.18.0
>


--
Best Regards
Masahiro Yamada
