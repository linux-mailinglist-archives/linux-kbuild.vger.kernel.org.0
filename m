Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAC6A0DA9
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2019 00:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfH1Wi2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 18:38:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41450 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbfH1Wi2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 18:38:28 -0400
Received: by mail-pg1-f194.google.com with SMTP id x15so463612pgg.8
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 15:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bu9OOhELnfJg8/oQexJ+kW+4EUent3eZnfgOh/MjmqQ=;
        b=IKxFKuX/GZTqj5EV2CQW8Wx38kfPXRfcWO0Uf0CObqMOk/HyWrpeHaaHHpvfp3CFC+
         vmFKfoaTXgWaFECgKo7iadeIZWC3dIrTKP0mQrVT7sOUyHacxqeWpRZH4+qsHmZMfyaU
         E6k1z+9q/f7+hNO9ql3XoNUKTC+FkXkL3CZLK2HiLfFhBbAMULY7wiUWckD/6j59EvPG
         R63tGsTxB1VtzXyR6SlvpMVDT2XGgPS9sckJXtjeHdnIkUgFX0MX/+bSPVozligUwKET
         XHIF3/tQzufRIKl47FlfiqWPpJFuBb92gEApiEVUEIUU3czbnwCzEMjPYIkAuNH6M/kg
         C99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bu9OOhELnfJg8/oQexJ+kW+4EUent3eZnfgOh/MjmqQ=;
        b=XNaqNb+oQ87KdrXo/THooJWyi1/4HRVijCZxk0PjB4IXMD/QrfSPeXfiS9fHttzQAi
         /7exinUDwl5gt9LOq+zk/Oqh2ydTHLqsTnpH1J69YFFbO4tlL7i3CrPE/38uLkQjdTR8
         4faaQTsn8nyLn4fNeZ3icbVyNCrF9hMEN8DuQ3tjljbtfiHgCUCBG8tEXk+p8Ot51wgK
         s16EJAVh2NG4OdHBOo//mls+pqn73v6+43oWfwR10Yx6sHG6XVFDfXR0S9Fm7oJAChig
         mFac/dOmG4R7HdDKOESjAk9cLlskehUUhgy15lbZCqD4X3fZ+GMsOQ8ZTeKfvqzJtoBa
         SMFQ==
X-Gm-Message-State: APjAAAWg0+EJnO75YHgU4oYiRaQRDqiNN9xy1jleHAxzHGHOEbXa08L9
        1UQtEvoZy0HsSKXd0OJ9+gxEY23iJTjq6X3H+KiZwA==
X-Google-Smtp-Source: APXvYqwHxhiS9wsjG54PQ9xC1PTvqk3/zM3ihCxVnjaSLUcCWnaavYDtv+WiHRJ1CYcNPTpIbErlzSbUHJZXGa/+EXQ=
X-Received: by 2002:a63:60a:: with SMTP id 10mr5401454pgg.381.1567031907022;
 Wed, 28 Aug 2019 15:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190828055425.24765-1-yamada.masahiro@socionext.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Aug 2019 15:38:15 -0700
Message-ID: <CAKwvOdmFjOMPW3_V+2ZnYFUyjWWuW2919cCk=ePn30f2szsi2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 27, 2019 at 10:54 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Instead of the warning-[123] magic, let's accumulate compiler options
> to KBUILD_CFLAGS directly as the top Makefile does. I think this makes
> easier to understand what is going on in this file.
>
> This commit slightly changes the behavior, I think all of which are OK.
>
> [1] Currently, cc-option calls are needlessly evaluated. For example,
>       warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
>     needs evaluating only when W=3, but it is actually evaluated for
>     W=1, W=2 as well. With this commit, only relevant cc-option calls
>     will be evaluated. This is a slight optimization.
>
> [2] Currently, unsupported level like W=4 is checked by:
>       $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
>     This will no longer be checked, but I do not think it is a big
>     deal.
>
> [3] Currently, 4 Clang warnings (Winitializer-overrides, Wformat,
>     Wsign-compare, Wformat-zero-length) are shown by any of W=1, W=2,
>     and W=3. With this commit, they will be warned only by W=1. I
>     think this is a more correct behavior since each warning belongs
>     to only one warning level.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/Makefile.extrawarn | 104 +++++++++++++++++++------------------
>  1 file changed, 53 insertions(+), 51 deletions(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index a74ce2e3c33e..1fa53968e292 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -1,14 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # ==========================================================================
> -#
>  # make W=... settings
> -#
> -# W=1 - warnings that may be relevant and does not occur too often
> -# W=2 - warnings that occur quite often but may still be relevant
> -# W=3 - the more obscure warnings, can most likely be ignored
> -#
> -# $(call cc-option, -W...) handles gcc -W.. options which
> -# are not supported by all versions of the compiler
>  # ==========================================================================
>
>  KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
> @@ -17,58 +9,68 @@ ifeq ("$(origin W)", "command line")
>    export KBUILD_ENABLE_EXTRA_GCC_CHECKS := $(W)
>  endif
>
> -ifdef KBUILD_ENABLE_EXTRA_GCC_CHECKS
> -warning-  := $(empty)
> +#
> +# W=1 - warnings that may be relevant and does not occur too often
> +#
> +ifneq ($(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
>
> -warning-1 := -Wextra -Wunused -Wno-unused-parameter
> -warning-1 += -Wmissing-declarations
> -warning-1 += -Wmissing-format-attribute
> -warning-1 += -Wmissing-prototypes
> -warning-1 += -Wold-style-definition
> -warning-1 += -Wmissing-include-dirs
> -warning-1 += $(call cc-option, -Wunused-but-set-variable)
> -warning-1 += $(call cc-option, -Wunused-const-variable)
> -warning-1 += $(call cc-option, -Wpacked-not-aligned)
> -warning-1 += $(call cc-option, -Wstringop-truncation)
> +KBUILD_CFLAGS += -Wextra -Wunused -Wno-unused-parameter
> +KBUILD_CFLAGS += -Wmissing-declarations
> +KBUILD_CFLAGS += -Wmissing-format-attribute
> +KBUILD_CFLAGS += -Wmissing-prototypes
> +KBUILD_CFLAGS += -Wold-style-definition
> +KBUILD_CFLAGS += -Wmissing-include-dirs
> +KBUILD_CFLAGS += $(call cc-option, -Wunused-but-set-variable)
> +KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
> +KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
> +KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
>  # The following turn off the warnings enabled by -Wextra
> -warning-1 += -Wno-missing-field-initializers
> -warning-1 += -Wno-sign-compare
> -
> -warning-2 += -Wcast-align
> -warning-2 += -Wdisabled-optimization
> -warning-2 += -Wnested-externs
> -warning-2 += -Wshadow
> -warning-2 += $(call cc-option, -Wlogical-op)
> -warning-2 += -Wmissing-field-initializers
> -warning-2 += -Wsign-compare
> -warning-2 += $(call cc-option, -Wmaybe-uninitialized)
> -warning-2 += $(call cc-option, -Wunused-macros)
> -
> -warning-3 := -Wbad-function-cast
> -warning-3 += -Wcast-qual
> -warning-3 += -Wconversion
> -warning-3 += -Wpacked
> -warning-3 += -Wpadded
> -warning-3 += -Wpointer-arith
> -warning-3 += -Wredundant-decls
> -warning-3 += -Wswitch-default
> -warning-3 += $(call cc-option, -Wpacked-bitfield-compat)
> -
> -warning := $(warning-$(findstring 1, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
> -warning += $(warning-$(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
> -warning += $(warning-$(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)))
> -
> -ifeq ("$(strip $(warning))","")
> -        $(error W=$(KBUILD_ENABLE_EXTRA_GCC_CHECKS) is unknown)
> -endif
> +KBUILD_CFLAGS += -Wno-missing-field-initializers
> +KBUILD_CFLAGS += -Wno-sign-compare
>
> -KBUILD_CFLAGS += $(warning)
>  else
>
> +# W=1 also stops suppressing some warnings
> +
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-initializer-overrides
>  KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
>  endif

I find this part of the patch exceedingly confusing, and I think it
mistakenly changes the behavior of W=2, W=3, and W=4.  If W != 1 && CC
== clang, then disable some flags?  What?  So W=2,3,4 those are
disabled, but at W=1 are not?  Didn't the previous version set these
unless any W= was set?

> +
> +endif
> +
> +#
> +# W=2 - warnings that occur quite often but may still be relevant
> +#
> +ifneq ($(findstring 2, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> +
> +KBUILD_CFLAGS += -Wcast-align
> +KBUILD_CFLAGS += -Wdisabled-optimization
> +KBUILD_CFLAGS += -Wnested-externs
> +KBUILD_CFLAGS += -Wshadow
> +KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
> +KBUILD_CFLAGS += -Wmissing-field-initializers
> +KBUILD_CFLAGS += -Wsign-compare
> +KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
> +KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
> +
> +endif
> +
> +#
> +# W=3 - the more obscure warnings, can most likely be ignored
> +#
> +ifneq ($(findstring 3, $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)),)
> +
> +KBUILD_CFLAGS += -Wbad-function-cast
> +KBUILD_CFLAGS += -Wcast-qual
> +KBUILD_CFLAGS += -Wconversion
> +KBUILD_CFLAGS += -Wpacked
> +KBUILD_CFLAGS += -Wpadded
> +KBUILD_CFLAGS += -Wpointer-arith
> +KBUILD_CFLAGS += -Wredundant-decls
> +KBUILD_CFLAGS += -Wswitch-default
> +KBUILD_CFLAGS += $(call cc-option, -Wpacked-bitfield-compat)
> +
>  endif
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
