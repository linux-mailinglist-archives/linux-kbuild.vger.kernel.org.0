Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835D232E1EF
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 07:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhCEGAW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 01:00:22 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:48628 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhCEGAW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 01:00:22 -0500
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 125605Ox002584;
        Fri, 5 Mar 2021 15:00:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 125605Ox002584
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614924006;
        bh=8j+Joi2P3uXrOj9ujoo+ykWpnsA3cqH4DLBOMX+P6Qk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tFSMsKK+FeCi6TtSglrHBgWf4EDpf0dJV2yuFdI/IowUYzS3/SiOlf94RAZV9Tx3S
         JHvW2UPlTiOAlIxWopcoZGwhEYO0+SulkJTBgpjTfhsS5keyYm5MVY1qHm4WeSDwmJ
         q64c+is4VpJBipB3d2T6zzvYxKu2Ap+BFzgl7D62Smg3j5iaHzIoCSEocrJjdnufdt
         1gwJBMS06bTCpI1YJfHp6Du6BhnQ9lsNA7FMmWE7Z82DVM9sumJEBoEcW62Gh9b2Rp
         xh1ZcpQNV22H6UGssEFF7SVInsLoNAvo5UdCJ6A54aL0b0qj36kES8cs1LdJR6Im14
         gb5VFP840BQYA==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id i14so1196416pjz.4;
        Thu, 04 Mar 2021 22:00:05 -0800 (PST)
X-Gm-Message-State: AOAM531gqB5TPCztnSYu2Xck4H/XIrJeoAQx29j7xJHgQEPGwSxcI8wk
        3vJOgzTBkNyafmtjyG4TnPyF2pUIE7yFlBqvk9M=
X-Google-Smtp-Source: ABdhPJyeDYP67T+HLQkv+caNyXm14Vo3nBuF2Gdb7qRitrAc9YMbOQ1+JXI6gxPV4mFgHClGVxq09GuyNpm1L1+Aft4=
X-Received: by 2002:a17:902:c48c:b029:e4:c093:593a with SMTP id
 n12-20020a170902c48cb02900e4c093593amr7216851plx.1.1614924004952; Thu, 04 Mar
 2021 22:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20210224105256.1939169-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20210224105256.1939169-1-linux@rasmusvillemoes.dk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Mar 2021 14:59:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_CuUOH7mY8Rf3kxLxXKm0oxBsK=XgAS9ScMaW-55OuQ@mail.gmail.com>
Message-ID: <CAK7LNAQ_CuUOH7mY8Rf3kxLxXKm0oxBsK=XgAS9ScMaW-55OuQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add CONFIG_VMLINUX_MAP expert option
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 24, 2021 at 7:53 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> It can be quite useful to have ld emit a link map file, in order to
> debug or verify that special sections end up where they are supposed
> to, and to see what LD_DEAD_CODE_DATA_ELIMINATION manages to get rid
> of.
>
> The only reason I'm not just adding this unconditionally is that the
> .map file can be rather large (several MB), and that's a waste of
> space when one isn't interested in these things. Also hide the prompt
> behind CONFIG_EXPERT.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  .gitignore              | 1 +
>  Makefile                | 3 ++-
>  lib/Kconfig.debug       | 9 +++++++++
>  scripts/link-vmlinux.sh | 9 +++++++++
>  4 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/.gitignore b/.gitignore
> index 3af66272d6f1..d3038aff4485 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -58,6 +58,7 @@ modules.order
>  /TAGS
>  /linux
>  /vmlinux
> +/vmlinux.map

Could you move this one line below
so that vmlinux.map is placed between
vmlinux.32 and vmlinux.symvers ?

I know this list is not sorted...




>  /vmlinux.32
>  /vmlinux.symvers
>  /vmlinux-gdb.py


Please add this to Documentation/dontdiff as well.




> diff --git a/Makefile b/Makefile
> index b18dbc634690..be6fbd99a214 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1501,7 +1501,8 @@ endif # CONFIG_MODULES
>  # Directories & files removed with 'make clean'
>  CLEAN_FILES += include/ksym vmlinux.symvers \
>                modules.builtin modules.builtin.modinfo modules.nsdeps \
> -              compile_commands.json
> +              compile_commands.json \
> +              vmlinux.map


Do you need this ?

You already added this to cleanup() of scripts/link-vmlinux.sh,
which is invoked from 'make clean'.





>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 5ea0c1773b0a..d6af084c11ae 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -412,6 +412,15 @@ config VMLINUX_VALIDATION
>         depends on STACK_VALIDATION && DEBUG_ENTRY && !PARAVIRT
>         default y
>
> +config VMLINUX_MAP
> +       bool "Generate vmlinux.map file when linking" if EXPERT


Please use depends on EXPERT
because VMLINUX_MAP is not select or implied by anyone.




> +       help
> +         Selecting this option will pass "-Map=vmlinux.map" to ld
> +         when linking vmlinux. That file can be useful for verifying
> +         and debugging magic section games, and for seeing which
> +         pieces of code get eliminated with
> +         CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
> +
>  config DEBUG_FORCE_WEAK_PER_CPU
>         bool "Force weak per-cpu definitions"
>         depends on DEBUG_KERNEL
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 3b261b0f74f0..bba58839db40 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -166,6 +166,12 @@ vmlinux_link()
>                 strip_debug=-Wl,--strip-debug
>         fi
>
> +       if [ -n "${CONFIG_VMLINUX_MAP}" ]; then
> +               map_option="-Map=${output}.map"
> +       else
> +               map_option=""
> +       fi
> +


For consistency, please do like strip_debug, that is,
define this as a local variable, and
set the value of  the 'if' case.



>         if [ "${SRCARCH}" != "um" ]; then
>                 if [ -n "${CONFIG_LTO_CLANG}" ]; then
>                         # Use vmlinux.o instead of performing the slow LTO
> @@ -187,6 +193,7 @@ vmlinux_link()
>                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
>                         ${strip_debug#-Wl,}                     \
>                         -o ${output}                            \
> +                       ${map_option}                           \
>                         -T ${lds} ${objects}
>         else
>                 objects="-Wl,--whole-archive                    \
> @@ -200,6 +207,7 @@ vmlinux_link()
>                 ${CC} ${CFLAGS_vmlinux}                         \
>                         ${strip_debug}                          \
>                         -o ${output}                            \
> +                       ${map_option:+-Wl,${map_option}}        \
>                         -Wl,-T,${lds}                           \
>                         ${objects}                              \
>                         -lutil -lrt -lpthread
> @@ -303,6 +311,7 @@ cleanup()
>         rm -f .tmp_vmlinux*
>         rm -f System.map
>         rm -f vmlinux
> +       rm -f vmlinux.map
>         rm -f vmlinux.o
>  }
>
> --
> 2.29.2
>


-- 
Best Regards
Masahiro Yamada
