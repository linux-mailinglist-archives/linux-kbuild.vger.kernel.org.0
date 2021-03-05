Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC02A32EC87
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 14:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhCENw3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 08:52:29 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61423 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbhCENwD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 08:52:03 -0500
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 125DpRxZ009590;
        Fri, 5 Mar 2021 22:51:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 125DpRxZ009590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614952288;
        bh=gorpGuAhtEpGkHjUmP5bgqI3IOdhshyc5dAFbcNCONc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BnZKt7MUMSs13+J/je9z+lkmhYhSyhyFPKASu9/bT58+zQ+NodOft1gJLwBl2bJJf
         nhHpLRF+PtvVCJDsv2i7temB/Pqm7zr7/8yfQKeXWBoiB4h3MWIqR8XHrjYQoDGZg/
         bRANLS/yp5IaiLr9Vm4Z2WjTlHdqzdAVYS+xM5bCwGB3Sw5wbM5zwWYtGt/hg1g1y0
         m9FaMaS+fAB9C861fs4SAH/NBJJtWmEqsV8OgkSo7eJjp3FLJviNzP7sMyuCFEDUEw
         E1Vob0jU+CpBCbIM45sy4EJNi7fCXNeoNs7GevfXZCW6/0E2ARcqAxmQ795WYFxQEB
         txVSXcsWzPPyA==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id w18so2101604pfu.9;
        Fri, 05 Mar 2021 05:51:27 -0800 (PST)
X-Gm-Message-State: AOAM530BfW4dE6ZCKdF5rcMS/Y8gdOqqt22uDJ3ZddRo8p+4MpbqYDs5
        VJkBNtmtaEWDOauciLDr+st2s0MXpSSulzwnpA4=
X-Google-Smtp-Source: ABdhPJw0v5OmNJJRTYxc0T7EIOOpLecdIIY6KABEFw40ODJyJe8gKx+THVoP1YARGX6sLNFQZ0SOri1zyjZIMC9DBUQ=
X-Received: by 2002:a63:dd49:: with SMTP id g9mr8934181pgj.175.1614952286939;
 Fri, 05 Mar 2021 05:51:26 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAQ_CuUOH7mY8Rf3kxLxXKm0oxBsK=XgAS9ScMaW-55OuQ@mail.gmail.com>
 <20210305092707.740539-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20210305092707.740539-1-linux@rasmusvillemoes.dk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Mar 2021 22:50:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATD3M4YCnWB=70cUaV+GsCX0MibtKof6yCYw_N2XotLPA@mail.gmail.com>
Message-ID: <CAK7LNATD3M4YCnWB=70cUaV+GsCX0MibtKof6yCYw_N2XotLPA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add CONFIG_VMLINUX_MAP expert option
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 5, 2021 at 6:27 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> It can be quite useful to have ld emit a link map file, in order to
> debug or verify that special sections end up where they are supposed
> to, and to see what LD_DEAD_CODE_DATA_ELIMINATION manages to get rid
> of.
>
> The only reason I'm not just adding this unconditionally is that the
> .map file can be rather large (several MB), and that's a waste of
> space when one isn't interested in these things. Also make it depend
> on CONFIG_EXPERT.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---

Applied to linux-kbuild.
Thanks.




>  .gitignore              |  1 +
>  Documentation/dontdiff  |  1 +
>  lib/Kconfig.debug       | 10 ++++++++++
>  scripts/link-vmlinux.sh |  8 ++++++++
>  4 files changed, 20 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index 3af66272d6f1..3adea59847ce 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -59,6 +59,7 @@ modules.order
>  /linux
>  /vmlinux
>  /vmlinux.32
> +/vmlinux.map
>  /vmlinux.symvers
>  /vmlinux-gdb.py
>  /vmlinuz
> diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> index e361fc95ca29..ac42ad8d430d 100644
> --- a/Documentation/dontdiff
> +++ b/Documentation/dontdiff
> @@ -252,6 +252,7 @@ vmlinux-*
>  vmlinux.aout
>  vmlinux.bin.all
>  vmlinux.lds
> +vmlinux.map
>  vmlinux.symvers
>  vmlinuz
>  voffset.h
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 5ea0c1773b0a..663c1cd5018c 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -412,6 +412,16 @@ config VMLINUX_VALIDATION
>         depends on STACK_VALIDATION && DEBUG_ENTRY && !PARAVIRT
>         default y
>
> +config VMLINUX_MAP
> +       bool "Generate vmlinux.map file when linking"
> +       depends on EXPERT
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
> index 3b261b0f74f0..855fd4e6f03e 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -155,6 +155,7 @@ vmlinux_link()
>         local output=${1}
>         local objects
>         local strip_debug
> +       local map_option
>
>         info LD ${output}
>
> @@ -166,6 +167,10 @@ vmlinux_link()
>                 strip_debug=-Wl,--strip-debug
>         fi
>
> +       if [ -n "${CONFIG_VMLINUX_MAP}" ]; then
> +               map_option="-Map=${output}.map"
> +       fi
> +
>         if [ "${SRCARCH}" != "um" ]; then
>                 if [ -n "${CONFIG_LTO_CLANG}" ]; then
>                         # Use vmlinux.o instead of performing the slow LTO
> @@ -187,6 +192,7 @@ vmlinux_link()
>                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
>                         ${strip_debug#-Wl,}                     \
>                         -o ${output}                            \
> +                       ${map_option}                           \
>                         -T ${lds} ${objects}
>         else
>                 objects="-Wl,--whole-archive                    \
> @@ -200,6 +206,7 @@ vmlinux_link()
>                 ${CC} ${CFLAGS_vmlinux}                         \
>                         ${strip_debug}                          \
>                         -o ${output}                            \
> +                       ${map_option:+-Wl,${map_option}}        \
>                         -Wl,-T,${lds}                           \
>                         ${objects}                              \
>                         -lutil -lrt -lpthread
> @@ -303,6 +310,7 @@ cleanup()
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
