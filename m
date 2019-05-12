Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881D41AA00
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2019 04:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfELCWV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 May 2019 22:22:21 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:23179 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfELCWV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 May 2019 22:22:21 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x4C2M4FK014894;
        Sun, 12 May 2019 11:22:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x4C2M4FK014894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557627725;
        bh=lfg0f7CiJ/M/MWOtpc77XsFmyWs8nRsmtFFkEP38Alc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gii8HwZrWXS3kbRnWgG0ogvi0JLDsUhhRkfLHJrDCoc+6IWJ2MPIB2sU1XLOfzuqm
         WXr9+r+Bi5kjoaO8OZwtqruW4vxzv8c9HFfybXdv0l5AlubjfYkGHDZJoEgb4IVBUW
         x/qQEszDRA7o1EABfGeVACvYwL7Svh6iuKaoAvAcE7mM1nW6S9R9h+VWDuNEATkU5A
         NFI/JGRmfYUDQE1+qUW9A0nRZMOAjBH1JDeU+qI9A4ROSvGUl1B0P1RmNR6foPu0p+
         qc0Ko+B6+T0moYPzU3yvaIeRzXVgMrtRVc263uyeWp7hFosOAnGQs9OAU1FiXJgGLg
         PKwk18B1NQAaQ==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id q64so5943957vsd.1;
        Sat, 11 May 2019 19:22:05 -0700 (PDT)
X-Gm-Message-State: APjAAAXu4gvlxKS0/F0r5g4TUV3LCEzfdcFVUWbDOxdz58Uj4M015TrM
        3Z/ZRmQZIb25BSox93fMNX7M1fQAJNv4F0VlGMc=
X-Google-Smtp-Source: APXvYqxGVczohIJ8fXJ6TLdrh9pH0m6fs8KnPyrqO5XlFwXZ806eu2NgrFWRaqoNIRmib80kjlmh4c0YsCS4xNU1he0=
X-Received: by 2002:a67:fd89:: with SMTP id k9mr10402714vsq.54.1557627723830;
 Sat, 11 May 2019 19:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190509201925.189615-1-ndesaulniers@google.com>
In-Reply-To: <20190509201925.189615-1-ndesaulniers@google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 12 May 2019 11:21:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQA7YdtnuTKzO2UZdUqXvn+zxcU-GUD5RBQkMHYs7ZY3Q@mail.gmail.com>
Message-ID: <CAK7LNAQA7YdtnuTKzO2UZdUqXvn+zxcU-GUD5RBQkMHYs7ZY3Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add script check for cross compilation utilities
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Fri, May 10, 2019 at 5:19 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> When cross compiling via setting CROSS_COMPILE, if the prefixed tools
> are not found, then the host utilities are often instead invoked, and
> produce often difficult to understand errors.  This is most commonly the
> case for developers new to cross compiling the kernel that have yet to
> install the proper cross compilation toolchain. Rather than charge
> headlong into a build that will fail obscurely, check that the tools
> exist before starting to compile, and fail with a friendly error
> message.

I see one drawback in adding the check script
so early in the top Makefile.

Make targets that do not require toolchain at all
("make clean", "make headers_install", etc.)
would fail too.


>
> Before:
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
> ...
> /usr/bin/as: unrecognized option '-EL'
> clang: error: assembler command failed with exit code 1 (use -v to see
> invocation)
> make[2]: *** [../scripts/Makefile.build:279: scripts/mod/empty.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/linux/Makefile:1118:
> prepare0] Error 2
> make: *** [Makefile:179: sub-make] Error 2


What a coincidence, I had sent this patch before:
https://patchwork.kernel.org/patch/10936811/


With my patch applied, the command above would be failed like this:


$ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-  CC=clang defconfig all
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.h
  HOSTCC  scripts/kconfig/lexer.lex.o
  YACC    scripts/kconfig/parser.tab.c
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'multi_v7_defconfig'
scripts/Kconfig.include:35: linker 'arm-linux-gnueabihf-ld' not found
make[2]: *** [scripts/kconfig/Makefile;82: defconfig] Error 1
make[1]: *** [Makefile;557: defconfig] Error 2
make: *** [Makefile;325: __build_one_by_one] Error 2




The presence $(CC) and $(LD) are checked in the Kconfig stage.
If it is not enough, it is OK to add $(AS) check.

$(error-if,$(failure,command -v $(AS)),assembler '$(AS)' not found)


But, I do not want to add all of $(AR), $(NM), ... etc.


Thanks.



> After:
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
> $CROSS_COMPILE set to arm-linux-gnueabihf-, but unable to find
> arm-linux-gnueabihf-as.
> Makefile:522: recipe for target 'outputmakefile' failed
> make: *** [outputmakefile] Error 1
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Note: this is probably more generally useful, but after a few minutes
> wrestling with Make errors related to "recipe commences before first
> target" and "missing separator," I came to understand my hatred of GNU
> Make. Open to sugguestions for where better to invoke this from the top
> level Makefile.
>
>  Makefile                      |  1 +
>  scripts/check_crosscompile.sh | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100755 scripts/check_crosscompile.sh
>
> diff --git a/Makefile b/Makefile
> index a61a95b6b38f..774339674b59 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -519,6 +519,7 @@ endif
>
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
> +       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/check_crosscompile.sh
>  CLANG_FLAGS    := --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)
> diff --git a/scripts/check_crosscompile.sh b/scripts/check_crosscompile.sh
> new file mode 100755
> index 000000000000..f4586fbfee18
> --- /dev/null
> +++ b/scripts/check_crosscompile.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# (c) 2019, Nick Desaulniers <ndesaulniers@google.com>
> +function check () {
> +  # Remove trailing commands, for example arch/arm/Makefile may add `-EL`.
> +  utility=$(echo ${1} | awk '{print $1;}')
> +  command -v "${utility}" &> /dev/null
> +  if [[ $? != 0 ]]; then
> +    echo "\$CROSS_COMPILE set to ${CROSS_COMPILE}," \
> +      "but unable to find ${utility}."
> +    exit 1
> +  fi
> +}
> +utilities=("${AS}" "${LD}" "${CC}" "${AR}" "${NM}" "${STRIP}" "${OBJCOPY}"
> +  "${OBJDUMP}")
> +for utility in "${utilities[@]}"; do
> +  check "${utility}"
> +done
> --
> 2.21.0.1020.gf2820cf01a-goog
>


--
Best Regards
Masahiro Yamada
