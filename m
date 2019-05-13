Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF4671AF8C
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 06:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfEMEr0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 May 2019 00:47:26 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33785 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfEMEr0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 May 2019 00:47:26 -0400
Received: by mail-ed1-f65.google.com with SMTP id n17so15549228edb.0;
        Sun, 12 May 2019 21:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FA5E6NOev0QQKJHqxM+mOJ18kvc3P88WlEmpFL4U3X0=;
        b=B7xffNQ6DCXVMsSvW7BDHS0aI5PfgPlSgy+Qc2MlKg5pMK8TeuwnOpiZZcjtXcHper
         9tJzuh7CV4U3RU7+iah9ms4p7gU7i1PilVLWw+Kyr7T/s4F6HiqjncxQLoTWD04wxfRw
         /1U49mji0w3FxJeYVKJAMfL5gesqs9VxEH+ATKSML9IrQQp/4/g+BgElAS71MGh91exY
         aS4N8bW4GQU7yH+VrRQ24lzwZIivbZDu7e/o2bcSYMX1Jf+iOKAHHa8aZ5Ut+XlxhU0P
         v3k7fvBJ3aP3vy+RWu+0g2SsBO/AfG6TYoFK/Dfh2K0MwTWgiVxuC70+SLRQ+YvMxqAv
         uwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FA5E6NOev0QQKJHqxM+mOJ18kvc3P88WlEmpFL4U3X0=;
        b=F7vb9/pg4XojfZl8GrXg9ZezTUJghbwOU79edNShDPCK0cNCxgazUNNfSjfPzaXOw/
         omfrKSQ7uwxuNHxX2UAGIdGS6S69+lMIUpMhqKsjJCUWUd+nHgohY6n0mf3aVEgXnuIO
         UJPS1+ZoVgVORCBddtGxSfx7EGKtGKpRwgF9B8o4GGkEyTJlPceUV1xwxUBMxczt/44U
         dxmvwvg0bQHo/WT5WcyCFxZjaQ8+xNbZhXLnnZibEIBMybnb7C+eWEQfQPFE1GCcb7+2
         7M2DnHlKL/FtqShduO8hPqn0wu+mmqzrmHEyPYuXi/9g4Z9hbyFSGlCs7thv09EZPxmN
         tWog==
X-Gm-Message-State: APjAAAUNJW1ZpyU6K6aMgG4dGhRyd7okEuaoIc8CNFRPfvIPDybmorAK
        Uq3Rv+M82ggvetw5zUqQPDM=
X-Google-Smtp-Source: APXvYqxWhD7a4zl0KB1O41BDkIiBQucUhfgBKOc+g4OO2fUTTRnV/sUuRNCYMNqpQPc57OlY712tkQ==
X-Received: by 2002:a17:906:18a1:: with SMTP id c1mr20381140ejf.116.1557722844280;
        Sun, 12 May 2019 21:47:24 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id b42sm3473568edd.83.2019.05.12.21.47.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 12 May 2019 21:47:22 -0700 (PDT)
Date:   Sun, 12 May 2019 21:47:21 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] kbuild: terminate Kconfig when $(CC) or $(LD) is missing
Message-ID: <20190513044721.GA3664@archlinux-i9>
References: <20190509073555.15545-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509073555.15545-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 09, 2019 at 04:35:55PM +0900, Masahiro Yamada wrote:
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
> 
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

As mentioned in the other thread, $(AS) should be checked as well since
it's possible that neither $(CC) nor $(LD) will involve $(CROSS_COMPILE),
like the combination of clang + ld.lld, whereas $(AS) will (currently)
always involve $(CROSS_COMPILE).

> +
>  # gcc version including patch level
>  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
> -- 
> 2.17.1
> 
