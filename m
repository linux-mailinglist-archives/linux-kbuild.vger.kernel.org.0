Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C5A2A22FF
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 03:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgKBCVp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 1 Nov 2020 21:21:45 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28085 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbgKBCVo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Nov 2020 21:21:44 -0500
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0A22LJcF015112;
        Mon, 2 Nov 2020 11:21:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0A22LJcF015112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1604283680;
        bh=7kufdqB6w12vbwLH1sg8pmQm6IPoKcemYRUDaLJV+OQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pgw8zH44Kmy4yph/TQktn+eMDKV+dRjbPC5vvxdrbAMLtwmaChZjySfF/0BX1KIfw
         Eme/4WMScLq+ocfKhkZhNTfnBNLt8/UWPaAJjF6frQ8RbYvvWvHn4IqYup/TbNYlNR
         FbA3eUm7pQvLdujLziTg94VmAK+5oQTAYRFlevPH0HsC+25z4Ldg+a712gPq3jgAh4
         KdvKbfgHw0frp2xSv8lf+ORLf/VqSXmgVewiwSWUXU5WPnhGjFY6SRiA7HVEJOu78N
         Ets6vhkXKWBezj748QTnkgNsRHyL0in003BFG4+Dp5h81ENxG/JJeMoAC1CxXFvcwy
         nLlQO01qCmieA==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id 72so3056283pfv.7;
        Sun, 01 Nov 2020 18:21:19 -0800 (PST)
X-Gm-Message-State: AOAM5323zcfVSDYJHcFbycl6HYgEASC2G14QEA/xN4NiKeobXcuUgEsM
        E4/G4ry0HDadi5h+TJC23WJMZJEUsYWXetmmZM4=
X-Google-Smtp-Source: ABdhPJwKvv1jTcmKbI6fzojWq0jfb6TK+06Kp4aELIM1e5V2LrbzLbfIIzX0RCGnd5XwbCPC+JOd223Xl/m+TAKEmSs=
X-Received: by 2002:a17:90a:aa91:: with SMTP id l17mr14663133pjq.198.1604283678819;
 Sun, 01 Nov 2020 18:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20201022012106.1875129-1-ndesaulniers@google.com>
In-Reply-To: <20201022012106.1875129-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 2 Nov 2020 11:20:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
Message-ID: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 22, 2020 at 10:21 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
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

This is not a shell script.
You can add spaces around '='



>  ifdef CONFIG_DEBUG_INFO_DWARF4
> -DEBUG_CFLAGS   += -gdwarf-4
> +DWARF_VERSION=4
> +endif
> +ifdef CONFIG_DEBUG_INFO_DWARF5
> +DWARF_VERSION=5
> +endif


This might be a bit tricky, but you can do like this if you like:


dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
dwarf-version-$(CONFIG_DEBUG_INFO_DWARF3) := 3
dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5

DEBUG_CFLAGS  += -gdwarf-$(dwarf-version-y)






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

Indentation for 'prompt'.


> +       depends on DEBUG_INFO

Unneeded.

This block resides inside 'if DEBUG_INFO'



> +       default DEBUG_INFO_DWARF2


This is unneeded because the first entry
is the default.


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



Please tell me how this script detects the dwarf-5 capability.


This script fails for GCC 10.


masahiro@grover:~/workspace/linux-kbuild$
./scripts/test_dwarf5_support.sh  clang
masahiro@grover:~/workspace/linux-kbuild$ echo $?
0
masahiro@grover:~/workspace/linux-kbuild$
./scripts/test_dwarf5_support.sh gcc-10
{standard input}: Assembler messages:
{standard input}:1: Error: file number less than one
masahiro@grover:~/workspace/linux-kbuild$ echo $?
1




The manual says the fileno should be "a positive integer".


  .file fileno filename

  When emitting dwarf2 line number information .file assigns filenames
to the .debug_line file name table.
  The fileno operand should be a unique positive integer to use as the
index of the entry in the table.
  The filename operand is a C string literal.

  The detail of filename indices is exposed to the user because the
filename table is shared with the
  .debug_info section of the dwarf2 debugging information, and thus
the user must know the exact indices
  that table entries will have.



So, I modified the script as follows:


masahiro@grover:~/workspace/linux-kbuild$ git diff
diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
index 82c0eea45845..8d7213e8e51f 100755
--- a/scripts/test_dwarf5_support.sh
+++ b/scripts/test_dwarf5_support.sh
@@ -1,4 +1,4 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 set -eu
-echo ".file 0 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
+echo ".file 1 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -




masahiro@grover:~/workspace/linux-kbuild$ ./scripts/test_dwarf5_support.sh  gcc
masahiro@grover:~/workspace/linux-kbuild$ echo $?
0



But, GCC 4.9 also passes this check.

masahiro@grover:~/workspace/linux-kbuild$
~/tools/aarch64-linaro-4.9/bin/aarch64-linux-gnu-gcc --version
aarch64-linux-gnu-gcc (Linaro GCC 4.9-2016.02) 4.9.4 20151028 (prerelease)
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

masahiro@grover:~/workspace/linux-kbuild$
./scripts/test_dwarf5_support.sh
~/tools/aarch64-linaro-4.9/bin/aarch64-linux-gnu-gcc
masahiro@grover:~/workspace/linux-kbuild$ echo $?
0






Some nit-pickings.


echo '.file 0 "asdf"'

... might look cleaner because you do not need to
use escaping inside the single-quotes.



'set -u' seems to have no effect because "$*"
is the only variable expansion in this script.


              -u      Treat  unset variables and parameters other than
the special parameters "@" and
                      "*" as an error when performing parameter
expansion.  If expansion is attempted
                      on  an  unset variable or parameter, the shell
prints an error message, and, if
                      not interactive, exits with a non-zero status.






> --
> 2.29.0.rc1.297.gfa9743e501-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20201022012106.1875129-1-ndesaulniers%40google.com.



--
Best Regards

Masahiro Yamada
