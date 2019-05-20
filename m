Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 581EE23054
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2019 11:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731440AbfETJ2j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 May 2019 05:28:39 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39751 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731432AbfETJ2j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 05:28:39 -0400
Received: by mail-qk1-f195.google.com with SMTP id z128so8373128qkb.6;
        Mon, 20 May 2019 02:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+kdZnR5O8JiU3Pf1A/YdEoIBjaqE0FCtwtKzSb3tcg=;
        b=XOUaZ6tKPHB5e8NU0aRlRK0a8cEAN1B/O8hz2itl1/h6Qj/HI5irTsmM+Xagm4eTpw
         xWGwSb6YHehFFrP/lQLRsZWS5jC27HuEwoig8STsYiRjamO/fvhSpGaOaDQ7LhjQmmn3
         eIJCkEnOJAS8JGgz1HSUOidEuV2gmSFnRLIMaICbNtBdqlbM8BR+M4O39ysmJS6691Tp
         hGOu85Amk5zDeUr+Vfw5jrM5zNNWF7PBMU7T7hcqmww0xL/e+ZZji5G2cAajfToB9LIR
         asx9wRX90vac0nuSXsv7QLpGoPaXxIB6X8pvyLP86q0ZUweq1sm2t3EsklM2u4rtugSu
         HJrQ==
X-Gm-Message-State: APjAAAU683S2RMlcAEUBzfYJaoncp98mbC0OLjJPI3r3z0QjFppxM5BX
        hhVy99EqKJK5GqDC19aj3ZU3csTiloOoTqHbjKM=
X-Google-Smtp-Source: APXvYqzng8ZEkla+MZbzTUYbwhgNGW+KYBn7MR1JRscH3T5Z56wO65FYLg4J4qPz+H5lfMoc/JUf9DqLsjfY2F/VnDs=
X-Received: by 2002:a37:a8ce:: with SMTP id r197mr28099585qke.269.1558344518379;
 Mon, 20 May 2019 02:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190520025437.13825-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190520025437.13825-1-yamada.masahiro@socionext.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 20 May 2019 11:28:20 +0200
Message-ID: <CAK8P3a2nth2sNPT46_e8G=s=D-J8LtsrA4kO2esu804_pWVs-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not check name uniqueness of builtin modules
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 20, 2019 at 4:57 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I just thought it was a good idea to scan builtin.modules in the name
> uniqueness checking, but Stephen reported a false positive.
>
> ppc64_defconfig produces:
>
>   warning: same basename if the following are built as modules:
>     arch/powerpc/platforms/powermac/nvram.ko
>     drivers/char/nvram.ko
>
> ..., which is a false positive because the former is never built as
> a module as you see in arch/powerpc/platforms/powermac/Makefile:
>
>   # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
>   # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
>   # CONFIG_NVRAM=y
>   obj-$(CONFIG_NVRAM:m=y)         += nvram.o
>
> Since we cannot predict how tricky Makefiles are written in wild,
> builtin.modules may potentially contain false positives. I do not
> think it is a big deal as far as kmod is concerned, but false positive
> warnings in the kernel build makes people upset. It is better to not
> do it.
>
> Even without checking builtin.modules, we have enough (and more solid)
> test coverage with allmodconfig.
>
> While I touched this part, I replaced the sed code with neater one
> provided by Stephen.
>
> Link: https://lkml.org/lkml/2019/5/19/120
> Link: https://lkml.org/lkml/2019/5/19/123
> Fixes: 3a48a91901c5 ("kbuild: check uniqueness of module names")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Looks good to me

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>
>  scripts/modules-check.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> index 2f659530e1ec..39e8cb36ba19 100755
> --- a/scripts/modules-check.sh
> +++ b/scripts/modules-check.sh
> @@ -6,10 +6,10 @@ set -e
>  # Check uniqueness of module names
>  check_same_name_modules()
>  {
> -       for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
> +       for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
>         do
> -               echo "warning: same basename if the following are built as modules:" >&2
> -               sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2
> +               echo "warning: same module names found:" >&2
> +               sed -n "/\/$m/s:^kernel/:  :p" modules.order >&2
>         done
>  }
>
> --
> 2.17.1
>
