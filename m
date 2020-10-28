Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F1C29D577
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Oct 2020 23:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbgJ1WDA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Oct 2020 18:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729568AbgJ1WCr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Oct 2020 18:02:47 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86299C0613D1
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Oct 2020 15:02:47 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id m188so485762ybf.2
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Oct 2020 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dp0UWTgUnOTXltTsDwB/n1hr3PG+m86O0km4OU6Mz58=;
        b=KkBE6NzBPX0WHXN81QI7hJmcF4lHAFotR1xempY3RoM8dvxb6wF7JIcysgDax4S0XE
         l+2Ufz4AAdxFbxcN3y5YxlGxKIcItRQtRf9+AVmgA5LsEcpfj4OFizaVPggxY1g37Nm7
         QBLGpfuSm/hu6Ues+5LMRNdi82NMJnTJfIUh9DDrVSVjBiwSxTSrAICUl2JtXMhzqPeH
         N31/LsB1YeLm0uVo5LzGYrQm1Pkx/BtxV0wgPsPAS3D1/LH/PyKfU3VLraaNoi6nOmNa
         YIRxDtCr94e80Y4VuFPd2XKSWT0j3svOukxEZFj4CtsOIwx769EqRrU0I2RJwxgMJ+p4
         /PSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dp0UWTgUnOTXltTsDwB/n1hr3PG+m86O0km4OU6Mz58=;
        b=rpGHRJ8mc2eSjhy2lNpNT09bcQ5/VOoiVqwJlWi/LE8V3ssbN71YsLO4/ld1OXVHsM
         mGId/OdC9KYpB4tRfj7ilUhnPMdsX8oGElLit7a6V0Qwf2XfCFmmPamHnFJ4ufZ4wZ4r
         yBhQLcO/ShADSGinI1FUuMIWD9w98Vhh9NE2+edtmpLUAxbUi/eeXzlFXFnBFsUPOmih
         pYzE9mgx6gqvhF6YD95A+L5/qTgRnxpd74/jjZzynrZzX+e1UeANE7c60SwM5RvUyb1B
         6MfeIln1wQ1LUu0T0JC1PDA3FFm97gT8s6wTxG6hbL7BoWpuNcC8e1/g+lLIi7V988Jc
         la9Q==
X-Gm-Message-State: AOAM533EsNWC2Umo2dJREhcYbqlI86e3nsguBuSX+AQlZ63VxFKkpA3C
        9sHu07NXgmq9+TbL6i4ua5z6v9vDCvyzNQ09w7ZJOLwJRbA=
X-Google-Smtp-Source: ABdhPJzVZLH9e5tW48GWH5ZrKyVlQpNAyXUK+ITzBEjl6vFw9ossQtQTqbICHeDQF9P9dMM1M1CN9jq5h2DrnFrfsEo=
X-Received: by 2002:ab0:335a:: with SMTP id h26mr747527uap.62.1603909138975;
 Wed, 28 Oct 2020 11:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201022012106.1875129-1-ndesaulniers@google.com>
In-Reply-To: <20201022012106.1875129-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Oct 2020 11:18:47 -0700
Message-ID: <CAKwvOdnudUv0Z4ai-6==M5fKjWEFQUb9_CEcRfQJeX4ZS5XFjw@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,
I plan to incorporate Fangrui's recommendation into a v2.  Do you have
additional thoughts on changes I should make in v2? Have you had the
chance to test the patch? Should I split it into a series?  What do
you think about the Kconfig `choice` changes?

On Wed, Oct 21, 2020 at 6:21 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> DWARF5 is the latest standard of the DWARF debug info format.
>
> Feature detection of DWARF5 is onerous, especially given that we've
> removed $(AS), so we must query $(CC) for DWARF5 assembler directive
> support. Further -gdwarf-X where X is an unsupported value doesn't
> produce an error in $(CC). GNU `as` only recently gained support for
> specifying -gdwarf-5.
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
> Make CONFIG_DEBUG_INFO_DWARF4 part of a Kconfig choice to preserve
> forward compatibility.
>
> Link: http://www.dwarfstd.org/doc/DWARF5.pdf
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> RFC because this patch is super half baked, but I'm looking for
> feedback.
>
> I would logically split this into a series of patches;
> 1. disable -Wa,gdwarf-2 for LLVM_IAS=1, see also
>   https://github.com/ClangBuiltLinux/linux/issues/716
>   https://github.com/ClangBuiltLinux/continuous-integration/blob/master/patches/llvm-all/linux-next/arm64/silence-dwarf2-warnings.patch
>   that way we can backport for improved LLVM_IAS support.
> 2. move CONFIG_DEBUG_INFO_DWARF4 to choice.
> 3. implement the rest on top.
>
> I'm pretty sure GNU `as` only recently gained the ability to specify
> -gdwarf-4 without erroring in binutils 2.35, so that part likely needs
> to be fixed.
>
>  Makefile                          | 19 ++++++++++++++++---
>  include/asm-generic/vmlinux.lds.h |  6 +++++-
>  lib/Kconfig.debug                 | 29 +++++++++++++++++++++++++----
>  scripts/test_dwarf5_support.sh    |  4 ++++
>  4 files changed, 50 insertions(+), 8 deletions(-)
>  create mode 100755 scripts/test_dwarf5_support.sh
>
> diff --git a/Makefile b/Makefile
> index e71979882e4f..0862df5b1a24 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -828,10 +828,23 @@ else
>  DEBUG_CFLAGS   += -g
>  endif
>
> -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> -
> +DWARF_VERSION=2
>  ifdef CONFIG_DEBUG_INFO_DWARF4
> -DEBUG_CFLAGS   += -gdwarf-4
> +DWARF_VERSION=4
> +endif
> +ifdef CONFIG_DEBUG_INFO_DWARF5
> +DWARF_VERSION=5
> +endif
> +DEBUG_CFLAGS   += -gdwarf-$(DWARF_VERSION)
> +
> +ifneq ($(DWARF_VERSION)$(LLVM_IAS),21)
> +KBUILD_AFLAGS  += -Wa,-gdwarf-$(DWARF_VERSION)
> +endif
> +
> +ifdef CONFIG_CC_IS_CLANG
> +ifneq ($(LLVM_IAS),1)
> +KBUILD_CFLAGS  += -Wa,-gdwarf-$(DWARF_VERSION)
> +endif
>  endif
>
>  ifdef CONFIG_DEBUG_INFO_REDUCED
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index cd14444bf600..0382808ef9fe 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -828,7 +828,11 @@
>                 .debug_types    0 : { *(.debug_types) }                 \
>                 /* DWARF 5 */                                           \
>                 .debug_macro    0 : { *(.debug_macro) }                 \
> -               .debug_addr     0 : { *(.debug_addr) }
> +               .debug_addr     0 : { *(.debug_addr) }                  \
> +               .debug_line_str 0 : { *(.debug_line_str) }              \
> +               .debug_loclists 0 : { *(.debug_loclists) }              \
> +               .debug_rnglists 0 : { *(.debug_rnglists) }              \
> +               .debug_str_offsets 0 : { *(.debug_str_offsets) }
>
>  /* Stabs debugging sections. */
>  #define STABS_DEBUG                                                    \
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 537cf3c2937d..6b01f0e2dad8 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -256,14 +256,35 @@ config DEBUG_INFO_SPLIT
>           to know about the .dwo files and include them.
>           Incompatible with older versions of ccache.
>
> +choice
> +prompt "DWARF version"
> +       depends on DEBUG_INFO
> +       default DEBUG_INFO_DWARF2
> +       help
> +         Which version of DWARF debug info to emit.
> +
> +config DEBUG_INFO_DWARF2
> +       bool "Generate dwarf2 debuginfo"
> +       help
> +         Generate dwarf2 debug info.
> +
>  config DEBUG_INFO_DWARF4
>         bool "Generate dwarf4 debuginfo"
>         depends on $(cc-option,-gdwarf-4)
>         help
> -         Generate dwarf4 debug info. This requires recent versions
> -         of gcc and gdb. It makes the debug information larger.
> -         But it significantly improves the success of resolving
> -         variables in gdb on optimized code.
> +         Generate dwarf4 debug info. This requires gcc 4.5+ and gdb 7.0+.
> +         It makes the debug information larger, but it significantly
> +         improves the success of resolving variables in gdb on optimized code.
> +
> +config DEBUG_INFO_DWARF5
> +       bool "Generate dwarf5 debuginfo"
> +       depends on DEBUG_INFO
> +       depends on $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
> +       help
> +         Genereate dwarf5 debug info. Requires binutils 2.35+, gcc 5.1+, and
> +         gdb 8.0+.
> +
> +endchoice # "DWARF version"
>
>  config DEBUG_INFO_BTF
>         bool "Generate BTF typeinfo"
> diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> new file mode 100755
> index 000000000000..82c0eea45845
> --- /dev/null
> +++ b/scripts/test_dwarf5_support.sh
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +set -eu
> +echo ".file 0 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>


-- 
Thanks,
~Nick Desaulniers
