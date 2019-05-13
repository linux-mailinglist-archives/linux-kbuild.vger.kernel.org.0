Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9221AEE9
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbfEMC2X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:28:23 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:59012 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfEMC2X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:28:23 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x4D2S32G020024;
        Mon, 13 May 2019 11:28:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4D2S32G020024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557714483;
        bh=mKVTMOpXJZy0RBYuveQeK3SC7Jv9ekJhYPaluqciiaU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=P+lQyPvTAMnh+TzsBqaX0nwerSmK/DrRoaAELUB/2lFhf783YzpA0qJNOliC72ihA
         6MisFcer9iU5mDrM6fkbJG/MftKW49dRuXoXPgbcZaKpCWkRFPeEQPRf8OV+ciZlmy
         9daiw6LuktXkJrXz7YUbSWrEjH2WfzEBYA255Phcjd1maYZDpPWbexSKsgP0RCyOFC
         bLBCKagTcYNt8mxXn4Zz4NaIyUQmHawLX5BjjgeMSjFcnJl2WCJ+QaDUiPpS0mlnF6
         Jc6NimZmEclYsB6xpchyHWeL/PRw8Y9HbLUvdmxFPTZbtlXMpw20EV4bTG0xQzexHX
         z67nqQXql4tDQ==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id v9so7046410vse.5;
        Sun, 12 May 2019 19:28:03 -0700 (PDT)
X-Gm-Message-State: APjAAAWGmqEvUFvGAAQAdspRTqtwWJUKEo56BV4FLTsQn+VZpRcrkpjy
        /Oi8KMzqurjEGqAtLfx3XxzMbHVNq2fdMJwJsYY=
X-Google-Smtp-Source: APXvYqyAkrFnURFlA7U3xveznlZxTCNXWwXEiVNn7STSnMKFZ7bossR+ykdWC8HLMnT9NAp8kXh8D19ost6K0aNHYzs=
X-Received: by 2002:a67:fc4:: with SMTP id 187mr12256595vsp.215.1557714482609;
 Sun, 12 May 2019 19:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190509073555.15545-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509073555.15545-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 13 May 2019 11:27:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARotATDnShT-80Ect9XvSM98wYEbQRKHdUTuQBtvxG8aw@mail.gmail.com>
Message-ID: <CAK7LNARotATDnShT-80Ect9XvSM98wYEbQRKHdUTuQBtvxG8aw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: terminate Kconfig when $(CC) or $(LD) is missing
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Joel Stanley <joel@jms.id.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 4:36 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> If the compiler specified by $(CC) is not present, the Kconfig stage
> sprinkles 'not found' messages, then succeeds.
>
>   $ make CROSS_COMPILE=foo defconfig
>   /bin/sh: 1: foogcc: not found
>   /bin/sh: 1: foogcc: not found
>   *** Default configuration is based on 'x86_64_defconfig'
>   ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
>   ./scripts/clang-version.sh: 11: ./scripts/clang-version.sh: foogcc: not found
>   ./scripts/gcc-plugin.sh: 11: ./scripts/gcc-plugin.sh: foogcc: not found
>   init/Kconfig:16:warning: 'GCC_VERSION': number is invalid
>   #
>   # configuration written to .config
>   #
>
> Terminate parsing files immediately if $(CC) or $(LD) is not found.
> "make *config" will fail more nicely.
>
>   $ make CROSS_COMPILE=foo defconfig
>   *** Default configuration is based on 'x86_64_defconfig'
>   scripts/Kconfig.include:34: compiler 'foogcc' not found
>   make[1]: *** [scripts/kconfig/Makefile;82: defconfig] Error 1
>   make: *** [Makefile;557: defconfig] Error 2
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  Makefile                | 2 +-
>  scripts/Kconfig.include | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 28965187c528..bd7ae11947cb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -537,7 +537,7 @@ endif
>  # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
>  # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
>  # and from include/config/auto.conf.cmd to detect the compiler upgrade.
> -CC_VERSION_TEXT = $(shell $(CC) --version | head -n 1)
> +CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
>
>  ifeq ($(config-targets),1)
>  # ===========================================================================
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 87ff1dcc6bd5..0b267fb27f07 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -18,6 +18,10 @@ if-success = $(shell,{ $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
>  # Return y if <command> exits with 0, n otherwise
>  success = $(if-success,$(1),y,n)
>
> +# $(failure,<command>)
> +# Return n if <command> exits with 0, y otherwise
> +failure = $(if-success,$(1),n,y)
> +
>  # $(cc-option,<flag>)
>  # Return y if the compiler supports <flag>, n otherwise
>  cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
> @@ -26,5 +30,9 @@ cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
>  # Return y if the linker supports <flag>, n otherwise
>  ld-option = $(success,$(LD) -v $(1))
>
> +# check if $(CC) and $(LD) exist
> +$(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> +$(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
> +
>  # gcc version including patch level
>  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
