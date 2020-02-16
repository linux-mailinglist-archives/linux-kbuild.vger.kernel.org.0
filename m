Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9E7D16069D
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2020 22:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgBPVHQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Feb 2020 16:07:16 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:53309 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgBPVHQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 16:07:16 -0500
Received: by mail-pj1-f66.google.com with SMTP id n96so6240762pjc.3
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Feb 2020 13:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KhAM2IxlCEEPIX5FUelQ2p4r+M1/1BoV7HhLLv/Wars=;
        b=DFUsTe4N9PeqrtCcAy98sLURhDACcBsq0vYO1OlQuWTTB4du7OIg6tfqXCR7IYTKlB
         0SM8H3R1SEMYdm7PtY75xZ1sCBjeXfU01r1lCUCjKXusIx6MO+20Slsi59wajLU7ba76
         5WE/XBpJ+goKDwXrWa8p0Ho/xclaGJtHl+HElU4qjjDyPFf0wyBhha1mm8SEYqmrqVLS
         FNANhl8aVvReqg4jkWPZG4s1hc8JbelR895QR1ppq4Bka7nQmdrX4DAaydirBx/oCljg
         J6+F896H3Sy6bwUfpfmSDIvRwga+KcBmg9X/RnqKZLM5FQ8SJwUExRhdodjVZ4gkFKZe
         xr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KhAM2IxlCEEPIX5FUelQ2p4r+M1/1BoV7HhLLv/Wars=;
        b=Zmd86saHTAAKi/Byd1hRMLudKjE64BIm5ByECQIteht+HFDtSWUiAJiqw7OCNQP0fK
         OBjGxr7QebsOXhckxc1CjA7zfLMjfvwEcfHOIKbBLwbOpSA6Wh6c8VSIueTD1n0pKsCm
         Aa9d1DDQnUNfHRL7xsdAfRCI7NHa2WDa0v+iWMbWLqLIUAnfFE7ld3s1SAtBKo7LL8fg
         jf50NUYCSjavqdCGQh7tcSNV21Lzg5V5iGGzy7+xG3IkgA/jg9J2fwXi0wBlzXUTnwdD
         k1dtQYrRO+LU0fIPaHFfJ9F2F0g6a7X4bvicGo2EPtrzG0WRFiCYknLJfPdCTdF2IVcx
         RnEw==
X-Gm-Message-State: APjAAAXBeLwGSMjYiVAdFiKJ/+U9urqoDblOKcmXxGGSY93w51DlzHSj
        IIgtcYdUCKbIN6hmYqEznJUhq6M+Fg+jnmnBYvQB/50V
X-Google-Smtp-Source: APXvYqydNCUs83fM5DQQUkHwEQFte1dnvZ/0MM8PNv/aV/dD3TxsSAuG7YYMCh9fwmDimG4PGpc99Asw+D3/vhjE3NU=
X-Received: by 2002:a17:90a:7784:: with SMTP id v4mr16473278pjk.134.1581887235046;
 Sun, 16 Feb 2020 13:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20200216151936.23778-1-masahiroy@kernel.org>
In-Reply-To: <20200216151936.23778-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Sun, 16 Feb 2020 13:07:02 -0800
Message-ID: <CAKwvOdkqZ2UpykUh-=axErZAVb8AjBGdPORSgVXqJtiv=tB05g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove cc-option switch from -Wframe-larger-than=
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 16, 2020 at 7:20 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This CONFIG option was added by commit 35bb5b1e0e84 ("Add option to
> enable -Wframe-larger-than= on gcc 4.4"). At that time, the cc-option
> check was needed.

Indeed, the oldest version of GCC 4.4 on godbolt.org; GCC 4.4.7 supports it.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> According to Documentation/process/changes.rst, the current minimal
> supported version of GCC is 4.6, so you can assume GCC supports it.
> Clang supports it as well.
>
> Remove the cc-option switch and redundant comments.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile          | 2 +-
>  lib/Kconfig.debug | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 84b71845c43f..8f15926b83bb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -728,7 +728,7 @@ KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
>  endif
>
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -KBUILD_CFLAGS += $(call cc-option,-Wframe-larger-than=${CONFIG_FRAME_WARN})
> +KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
>  endif
>
>  stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 69def4a9df00..fb6b93ffdf77 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -266,7 +266,7 @@ config ENABLE_MUST_CHECK
>           attribute warn_unused_result" messages.
>
>  config FRAME_WARN
> -       int "Warn for stack frames larger than (needs gcc 4.4)"
> +       int "Warn for stack frames larger than"
>         range 0 8192
>         default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>         default 1280 if (!64BIT && PARISC)
> @@ -276,7 +276,6 @@ config FRAME_WARN
>           Tell gcc to warn at build time for stack frames larger than this.
>           Setting this too low will cause a lot of warnings.
>           Setting it to 0 disables the warning.
> -         Requires gcc 4.4
>
>  config STRIP_ASM_SYMS
>         bool "Strip assembler-generated symbols during link"
> --
> 2.17.1
>

-- 
Thanks,
~Nick Desaulniers
