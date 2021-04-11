Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F15035B578
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 15:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235338AbhDKNv4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 09:51:56 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42077 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbhDKNv4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 09:51:56 -0400
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 13BDpEVu015022;
        Sun, 11 Apr 2021 22:51:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 13BDpEVu015022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618149075;
        bh=AUMd6BK5O6LL/TwQF5XqGPOwC70Q/DJa4qD42hFee0Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qz917CWBdWZURqfpP9e3AffZwEhwkjzM7rm9f5h9zSKKdJd0p5X9+XmX/+wgnNDTv
         NaMfHgTv9xMWtSEAoNNzVY02tlh2W2IY5uKa9OpKv/1MeXhnd5oyKyQtLa36XJiU7X
         qbEdmoq8YJG8uFO/qIfZdKXCtHbF9iafQUSi+lFpYPS1v7fCzwlE11Xwsx3UrcrQ3h
         d19A5mak6QzYNtB4cTlpmVMXO4TXdY45/wMA1bN1eyB4+cgq10qP0lDB09N7VWS8qx
         1lDMKoQ/3qIRNpjxu61eLz7MluqPexS3qcBn3Bh3Juo5+Lki1xepWZidkGlcETTkIF
         KsFCkJgCaNVAg==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id p12so7327027pgj.10;
        Sun, 11 Apr 2021 06:51:14 -0700 (PDT)
X-Gm-Message-State: AOAM531R5nMxOz/JwFqhKMNGD5JlkbyA/4QpyweotzDEvHfa6NJsZ4zp
        CgsQpzJk1/5SWUjoTbmmBRlOjQ430d6s6ndImlo=
X-Google-Smtp-Source: ABdhPJy6YZYs05u7FT217tpuMhc9eGbZLPcyXC7I04yXNnzGB9xD6pqf1gIUL2Z1iGTGmY9mgtGDhcfU846pC+ku4ME=
X-Received: by 2002:a05:6a00:2303:b029:249:b91e:72f0 with SMTP id
 h3-20020a056a002303b0290249b91e72f0mr5952650pfh.80.1618149073951; Sun, 11 Apr
 2021 06:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210301141937.342604-1-masahiroy@kernel.org>
In-Reply-To: <20210301141937.342604-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 11 Apr 2021 22:50:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNARzOvCr4-+r-MMZ_zdaSR3JUVU=wmuKj4HQPwQDej=vHg@mail.gmail.com>
Message-ID: <CAK7LNARzOvCr4-+r-MMZ_zdaSR3JUVU=wmuKj4HQPwQDej=vHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ia64: syscalls: switch to generic syscalltbl.sh
To:     linux-ia64@vger.kernel.org
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 1, 2021 at 11:20 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Many architectures duplicate similar shell scripts.
>
> This commit converts ia64 to use scripts/syscalltbl.sh.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.



>
>  arch/ia64/kernel/entry.S                |  3 +--
>  arch/ia64/kernel/syscalls/Makefile      |  8 ++-----
>  arch/ia64/kernel/syscalls/syscalltbl.sh | 32 -------------------------
>  3 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 arch/ia64/kernel/syscalls/syscalltbl.sh
>
> diff --git a/arch/ia64/kernel/entry.S b/arch/ia64/kernel/entry.S
> index e98e3dafffd8..5eba3fb2e311 100644
> --- a/arch/ia64/kernel/entry.S
> +++ b/arch/ia64/kernel/entry.S
> @@ -1420,10 +1420,9 @@ END(ftrace_stub)
>
>  #endif /* CONFIG_FUNCTION_TRACER */
>
> -#define __SYSCALL(nr, entry, nargs) data8 entry
> +#define __SYSCALL(nr, entry) data8 entry
>         .rodata
>         .align 8
>         .globl sys_call_table
>  sys_call_table:
>  #include <asm/syscall_table.h>
> -#undef __SYSCALL
> diff --git a/arch/ia64/kernel/syscalls/Makefile b/arch/ia64/kernel/syscalls/Makefile
> index bf4bda0f63eb..2d2e420749b0 100644
> --- a/arch/ia64/kernel/syscalls/Makefile
> +++ b/arch/ia64/kernel/syscalls/Makefile
> @@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')       \
>
>  syscall := $(src)/syscall.tbl
>  syshdr := $(srctree)/$(src)/syscallhdr.sh
> -systbl := $(srctree)/$(src)/syscalltbl.sh
> +systbl := $(srctree)/scripts/syscalltbl.sh
>
>  quiet_cmd_syshdr = SYSHDR  $@
>        cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'       \
> @@ -16,16 +16,12 @@ quiet_cmd_syshdr = SYSHDR  $@
>                    '$(syshdr_offset_$(basetarget))'
>
>  quiet_cmd_systbl = SYSTBL  $@
> -      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'       \
> -                  '$(systbl_abis_$(basetarget))'               \
> -                  '$(systbl_abi_$(basetarget))'                \
> -                  '$(systbl_offset_$(basetarget))'
> +      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
>
>  syshdr_offset_unistd_64 := __NR_Linux
>  $(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
>         $(call if_changed,syshdr)
>
> -systbl_offset_syscall_table := 1024
>  $(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
>         $(call if_changed,systbl)
>
> diff --git a/arch/ia64/kernel/syscalls/syscalltbl.sh b/arch/ia64/kernel/syscalls/syscalltbl.sh
> deleted file mode 100644
> index 85d78d9309ad..000000000000
> --- a/arch/ia64/kernel/syscalls/syscalltbl.sh
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -in="$1"
> -out="$2"
> -my_abis=`echo "($3)" | tr ',' '|'`
> -my_abi="$4"
> -offset="$5"
> -
> -emit() {
> -       t_nxt="$1"
> -       t_nr="$2"
> -       t_entry="$3"
> -
> -       while [ $t_nxt -lt $t_nr ]; do
> -               printf "__SYSCALL(%s, sys_ni_syscall, )\n" "${t_nxt}"
> -               t_nxt=$((t_nxt+1))
> -       done
> -       printf "__SYSCALL(%s, %s, )\n" "${t_nxt}" "${t_entry}"
> -}
> -
> -grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
> -       nxt=0
> -       if [ -z "$offset" ]; then
> -               offset=0
> -       fi
> -
> -       while read nr abi name entry ; do
> -               emit $((nxt+offset)) $((nr+offset)) $entry
> -               nxt=$((nr+1))
> -       done
> -) > "$out"
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
