Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F53940630F
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Sep 2021 02:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233399AbhIJAqu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 20:46:50 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:56840 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236385AbhIJA3x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 20:29:53 -0400
X-Greylist: delayed 41542 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Sep 2021 20:29:52 EDT
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 18A0SMaI003027;
        Fri, 10 Sep 2021 09:28:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 18A0SMaI003027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631233703;
        bh=3BKQgzHIpldXuMHUJ6SaQQUNOmT0VJRr0GBhL34/P2c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SmQ8gJjUW5qCQBoxvKCfTgv+uQUgADXrxiSO193JbR71wEGJyRpeybxD2r0j1cPrk
         zVX9Fffjuuo7MIRpkPN83vlH2Q6gKuT9nAzta5B4BMvbx2xFEOOqFhg2oMjLcvjqTJ
         z6kDeJv+HUvKDXTVjkCDSAHsmvfZZ3piODTPpDaLPMwpM6+FNq71m7ItsS58WVagp9
         Au8s99s9lYkVD08kEo1Z+wis3O/T2OIBOFUux3Ip3Cdk3loqUJhDz6YAZIqu4bGMew
         /y8qfTMLvcSbizAjb3M2laEliIJ65HyyLIJZLCl6NiZEZOBQtxIXbePMFOh9TpA3mS
         PEDccKuURGdmg==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id gp20-20020a17090adf1400b00196b761920aso243508pjb.3;
        Thu, 09 Sep 2021 17:28:22 -0700 (PDT)
X-Gm-Message-State: AOAM531jWlcz5xXyH4LGxcSAgloLjkFMF3E7tV2CYi2ZwWQN4w0a1LIP
        mKcezbH7CXL9GfMCx4eaTgmgFdV9wnJ17WUC4bU=
X-Google-Smtp-Source: ABdhPJzD06aFs0p/r4Q9yVgjNgi9sLrgBCBxV2NQtWqdP6NM/aEatdL0eTrM0VaY63R0ni0GHq0J+dlHnIb5BVBDpwI=
X-Received: by 2002:a17:90a:192:: with SMTP id 18mr6573730pjc.119.1631233702032;
 Thu, 09 Sep 2021 17:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210909213118.1087083-1-robh@kernel.org> <20210909213118.1087083-9-robh@kernel.org>
In-Reply-To: <20210909213118.1087083-9-robh@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 10 Sep 2021 09:27:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQx8yqUdEWOmYqq2Mqk5BVuqc1w3rOcVm2Bb5wDSFRXaA@mail.gmail.com>
Message-ID: <CAK7LNAQx8yqUdEWOmYqq2Mqk5BVuqc1w3rOcVm2Bb5wDSFRXaA@mail.gmail.com>
Subject: Re: [PATCH 8/8] kbuild: Enable dtc 'unit_address_format' warning by default
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 10, 2021 at 6:31 AM Rob Herring <robh@kernel.org> wrote:
>
> With all the 'unit_address_format' warnings fixed, enable the warning by
> default.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Masahiro Yamada <masahiroy@kernel.org>

> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  scripts/Makefile.lib | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 54582673fc1a..56d50eb0cd80 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -310,7 +310,6 @@ DTC_FLAGS += -Wno-interrupt_provider
>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>  DTC_FLAGS += -Wno-unit_address_vs_reg \
> -       -Wno-unit_address_format \
>         -Wno-avoid_unnecessary_addr_size \
>         -Wno-alias_paths \
>         -Wno-graph_child_address \
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
