Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4092C94E9
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 02:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgLAB55 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Nov 2020 20:57:57 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46739 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgLAB55 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Nov 2020 20:57:57 -0500
X-Greylist: delayed 28283 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Nov 2020 20:57:56 EST
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0B11uswA001093;
        Tue, 1 Dec 2020 10:56:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0B11uswA001093
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606787815;
        bh=eBmxAR7K2Jbfp4KHt3489WMG4z7PgIgZCJ+eBjBop4A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o59lXxne9HU0MBSkhL5X+CMfz5WG7gA9UqFXr7ANoeiOVmPi5KZ35D63E1umWv9Ly
         qCesk5Q1y3sXj7Oh7r1bqdWUtYBfPBYJW82rox1KK/C3PrZjYnILAQcF9v1TaD61wz
         k521PnjOiwkfALoHzZ3iHH3j8OSexqol8njVs7cp1WNNh//Ml8DvS4dn0dlSoGLExL
         EMpuJqmrOjOMU0uvQ+7YiMUzwBt21YItjSysCYhydyWNLdj/XM+MSQhg/l6HWyAT67
         rszy903/Ha6qEb93gfwFg8N3THmAH41tzSBuvq0cTmKkyMg/Oh95xDZWJCLZ7l5jMv
         o1iIHTqkqIoRQ==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id b12so256337pjl.0;
        Mon, 30 Nov 2020 17:56:54 -0800 (PST)
X-Gm-Message-State: AOAM530qg2t2s0pwXy7pq3ms7C3fXOX8ig3Puer990lm/zH5Ld1oen99
        Dc31YMC4GIBeK3UtGOTGL6h3fZU8pFf8z+PDFzE=
X-Google-Smtp-Source: ABdhPJzs/K4WAhOqjcW7rbHxPYRw4w+y9p3XcLwZSV8nNzLXgahqO+YMinhSGhaNSXVZI/MmcPmuqzg16tINVy6/GjQ=
X-Received: by 2002:a17:902:6949:b029:da:17d0:d10f with SMTP id
 k9-20020a1709026949b02900da17d0d10fmr453041plt.71.1606787813943; Mon, 30 Nov
 2020 17:56:53 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com> <20201104005343.4192504-5-ndesaulniers@google.com>
In-Reply-To: <20201104005343.4192504-5-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 10:56:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNARx36Go6pKsxh__e72RS-U4T0UJiVLXKW-gUfBHRzDzJA@mail.gmail.com>
Message-ID: <CAK7LNARx36Go6pKsxh__e72RS-U4T0UJiVLXKW-gUfBHRzDzJA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Kbuild: implement support for DWARF v5
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 4, 2020 at 9:54 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> DWARF v5 is the latest standard of the DWARF debug info format.
>
> Feature detection of DWARF5 is onerous, especially given that we've
> removed $(AS), so we must query $(CC) for DWARF5 assembler directive
> support.  GNU `as` only recently gained support for specifying
> -gdwarf-5.
>
> The DWARF version of a binary can be validated with:
> $ llvm-dwarfdump vmlinux | head -n 5 | grep version
> or
> $ readelf --debug-dump=info vmlinux 2>/dev/null | grep Version
>
> DWARF5 wins significantly in terms of size when mixed with compression
> (CONFIG_DEBUG_INFO_COMPRESSED).
>
> 363M    vmlinux.clang12.dwarf5.compressed
> 434M    vmlinux.clang12.dwarf4.compressed
> 439M    vmlinux.clang12.dwarf2.compressed
> 457M    vmlinux.clang12.dwarf5
> 536M    vmlinux.clang12.dwarf4
> 548M    vmlinux.clang12.dwarf2
>
> Link: http://www.dwarfstd.org/doc/DWARF5.pdf
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Suggested-by: Jakub Jelinek <jakub@redhat.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile                          | 1 +
>  include/asm-generic/vmlinux.lds.h | 6 +++++-
>  lib/Kconfig.debug                 | 8 ++++++++
>  scripts/test_dwarf5_support.sh    | 9 +++++++++
>  4 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/test_dwarf5_support.sh
>
> diff --git a/Makefile b/Makefile
> index e23786a4c1c7..9056bac0ff85 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -828,6 +828,7 @@ endif
>
>  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
>  dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
>  DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
>  ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
>  # Binutils 2.35+ required for -gdwarf-4+ support.
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index b2b3d81b1535..76ce62c77029 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -829,7 +829,11 @@
>                 .debug_types    0 : { *(.debug_types) }                 \
>                 /* DWARF 5 */                                           \
>                 .debug_macro    0 : { *(.debug_macro) }                 \
> -               .debug_addr     0 : { *(.debug_addr) }
> +               .debug_addr     0 : { *(.debug_addr) }                  \
> +               .debug_line_str 0 : { *(.debug_line_str) }              \
> +               .debug_loclists 0 : { *(.debug_loclists) }              \
> +               .debug_rnglists 0 : { *(.debug_rnglists) }              \
> +               .debug_str_offsets      0 : { *(.debug_str_offsets) }
>
>  /* Stabs debugging sections. */
>  #define STABS_DEBUG                                                    \
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 03c494eefabd..c5b54ba51060 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -274,6 +274,14 @@ config DEBUG_INFO_DWARF4
>           It makes the debug information larger, but it significantly
>           improves the success of resolving variables in gdb on optimized code.
>
> +config DEBUG_INFO_DWARF5
> +       bool "Generate DWARF5 debuginfo"


The choice menu looks like follows:

(X) Generate DWARF v2 debuginfo
( ) Generate dwarf4 debuginfo
( ) Generate DWARF5 debuginfo


Upper / Lower case inconsistency.










--
Best Regards
Masahiro Yamada
