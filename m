Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6341C0DBB
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 07:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgEAFfD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 May 2020 01:35:03 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:37858 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFfD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:35:03 -0400
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0415YlWG006461;
        Fri, 1 May 2020 14:34:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0415YlWG006461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588311288;
        bh=UZWM7i0RZnnhTnaPc+bA3fPcd9baVcIj+Fep60CTyUs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xb1tWHX+qf/bEwuP5QwZN3txKaLAhrMlkqnWAq/VdLZk3v9AaHY25ESw83N3pY+gW
         16vjsuMzXn4l1aG1zjpGPugovTV9Cw7bH2pVfPg7YreyluxMei+Pw1Tm52uZ0Xdb7j
         Nh806VgdZWuFpFS/nOiHkTnzoRln9+/QIraTEUUjjeLcQKJTh5RhCIPWvjfrZf8zLW
         GyGGw+0tQYZW2/Kua6aLQjfLFvBjppDN9nPbCbCfZWG+7McRVuIFz6jgl6lYZqri29
         pJZa1qZ+up0ZIUAztW/edIXgtMWOvuV/+hlO3pRR1IHhKVtWQV2vov44+nKraio4dx
         fK5+CMDs8geMQ==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id j127so539900vke.4;
        Thu, 30 Apr 2020 22:34:48 -0700 (PDT)
X-Gm-Message-State: AGi0Puadh3i0+MzohG43G81E4Uo3gTuAK4v23oxlwscVEJFQhWy6p7WZ
        JuIDY4mviK+IcYR2+0hrhLyr/N/QJeNLfid5eII=
X-Google-Smtp-Source: APiQypK4SZZYkVLuWaMc9Uw+UZeiEdzKkKJRzZ9ZgTZ2v9epE8PC2KDbGf6W9JA1PKc3iWvYSQ0vKisDIVhrEpPLdDs=
X-Received: by 2002:a1f:d182:: with SMTP id i124mr1573782vkg.26.1588311287171;
 Thu, 30 Apr 2020 22:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200423142354.312088-1-masahiroy@kernel.org>
In-Reply-To: <20200423142354.312088-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 14:34:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQH07KvoCgv5B8jUs+EUsJ167omM1U2AWHKdaAB+nAMCQ@mail.gmail.com>
Message-ID: <CAK7LNAQH07KvoCgv5B8jUs+EUsJ167omM1U2AWHKdaAB+nAMCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] kbuild: use $(CC_VERSION_TEXT) to evaluate
 CC_IS_GCC and CC_IS_CLANG
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 23, 2020 at 11:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The result of '$(CC) --version | head -n 1' is already computed by the
> top Makefile, and stored in the environment variable, CC_VERSION_TEXT.
>
> 'echo' is probably less expensive than the two commands $(CC) and
> 'head' although this optimization is not noticeable level.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild.



> ---
>
> Changes in v2:
>   - new patch
>
>  init/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 9e22ee8fbd75..5f797df3f043 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -9,7 +9,7 @@ config DEFCONFIG_LIST
>         default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
>
>  config CC_IS_GCC
> -       def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)
> +       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q gcc)
>
>  config GCC_VERSION
>         int
> @@ -21,7 +21,7 @@ config LD_VERSION
>         default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
>
>  config CC_IS_CLANG
> -       def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
> +       def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
>
>  config CLANG_VERSION
>         int
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200423142354.312088-1-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
