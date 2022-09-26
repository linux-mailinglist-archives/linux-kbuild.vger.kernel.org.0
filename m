Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D865EB36C
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Sep 2022 23:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiIZVpI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Sep 2022 17:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiIZVpB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Sep 2022 17:45:01 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515A3A4B37
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Sep 2022 14:44:59 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id b75so7984891pfb.7
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Sep 2022 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cUAhqALEYiUXv3Zebu/ZG3Ne7/xgpixkjK+wB3Qg6gw=;
        b=bEmZYNoOPfUOtLUXhjWagv3T/8qLpqKlf904MOD8uU41zx2KRJTvsVU89JlIXk9Zbx
         UodCPBJxCMTHJALH+cvvijMiSyyD7GopoKiG7jGPVlouMCoTKOaHJjSY5fe4ioTHR/2S
         ffG9k+G41w983K6fPLPDHYE3EKUYa4XgxMWAadLd6AyiQJjNcDzlIH1dmHp+iyqC7xvM
         F74FDZN7T7gT0h/7m1hqBcwlXvSAGBNZ/hvMeOdgtmjIIm7d4NCyyE8wGkO5ZjRkrnyT
         LJs5kRm80cYlzRHSdjDmsIyoFkvpQ2zAYZhymxbIZl1BlxPY2hFcPeHwIDMlR2qufm1R
         qq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cUAhqALEYiUXv3Zebu/ZG3Ne7/xgpixkjK+wB3Qg6gw=;
        b=QBY5aiQbqQ7KfQKjOGlLYvjnTcqtMKTg2nwaT1K58sPRBYb2jaiXonEf2MqMWSZpAj
         xeW45UqVWHpGFHfUxGdUNh5YZnTzgTCdfasr0jO6SNk53TtA2KQhWW5a9GegyCABOULB
         EFAsu/HTCJqQpob3/XuRaVRbz8Vm+W+QYFFONYbwz0hoFQ9OnQ6++rpYMkmlOMUWKHY3
         0un3djNNLcJmekkdH5Nkn9d8yJG7IlzPcx6KDXPA2/EzwPSmHTHynCN40G2Vo142f3iz
         Fv9+E9/0pyooKYuhtgKRUnL6rRV0dfkl1fvJ3k7GdvEDATJDgMbqp5y9u2xT2NBGsfKL
         Hc3A==
X-Gm-Message-State: ACrzQf2Ko/k41hOZ8RvOFe/CUOg7tPjkCONvf05Hh0a/PxVhjgSNtITq
        lj+8NQ46WrsZNX352T1g1rVmZ/lo7uXU4letbwBrY1s9aec=
X-Google-Smtp-Source: AMsMyM6QmcD1KbLT6/X7nBM0XJ7xTiM9QgN0CqNAnhRmDVr7kcrvOyczLw8uPWXrvN/0yWwmiCUEq9/9UEzcvynqr3s=
X-Received: by 2002:a05:6a02:205:b0:420:8b7e:3ff with SMTP id
 bh5-20020a056a02020500b004208b7e03ffmr20895224pgb.427.1664228698203; Mon, 26
 Sep 2022 14:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220924082425.3116757-1-masahiroy@kernel.org>
In-Reply-To: <20220924082425.3116757-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 26 Sep 2022 14:44:46 -0700
Message-ID: <CAKwvOd=RkYuiEJ1Kz+JnLSsLi_X-G22YPeqwLtZrwC+s8awfrA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: hide error checker logs for V=1 builds
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 24, 2022 at 1:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> V=1 (verbose build) shows commands executed by Make, but it may cause
> misunderstanding.
>
> For example, the following command shows the outstanding error message.
>
>   $ make V=1 INSTALL_PATH=/tmp install
>   test -e include/generated/autoconf.h -a -e include/config/auto.conf || (                \
>   echo >&2;                                                       \
>   echo >&2 "  ERROR: Kernel configuration is invalid.";           \
>   echo >&2 "         include/generated/autoconf.h or include/config/auto.conf are missing.";\
>   echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to fix it.";      \
>   echo >&2 ;                                                      \
>   /bin/false)
>     unset sub_make_done; ./scripts/install.sh
>
> It is not an error. Make just showed the recipe lines it has executed,
> but people may think that 'make install' has failed.
>
> Likewise, the combination of V=1 and O= shows confusing
> "*** The source tree is not clean, please run 'make mrproper'".
>
> Suppress such misleading logs.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a5e9d9388649..833052fcf48a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -583,7 +583,7 @@ quiet_cmd_makefile = GEN     Makefile
>         } > Makefile
>
>  outputmakefile:
> -       $(Q)if [ -f $(srctree)/.config -o \
> +       @if [ -f $(srctree)/.config -o \
>                  -d $(srctree)/include/config -o \
>                  -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
>                 echo >&2 "***"; \
> @@ -739,7 +739,7 @@ else # !may-sync-config
>  PHONY += include/config/auto.conf
>
>  include/config/auto.conf:
> -       $(Q)test -e include/generated/autoconf.h -a -e $@ || (          \
> +       @test -e include/generated/autoconf.h -a -e $@ || (             \
>         echo >&2;                                                       \
>         echo >&2 "  ERROR: Kernel configuration is invalid.";           \
>         echo >&2 "         include/generated/autoconf.h or $@ are missing.";\
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
