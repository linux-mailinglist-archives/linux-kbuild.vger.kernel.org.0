Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8630640971E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 17:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237922AbhIMPWO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 11:22:14 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39185 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344321AbhIMPVS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 11:21:18 -0400
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 18DFJjur009829;
        Tue, 14 Sep 2021 00:19:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 18DFJjur009829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631546386;
        bh=9tkpEAQTgOYECJkodf3bBcA+DlQRDxUU5URTsoIGHEc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=enY7UwR1GWlkiqwaIBsuEsPRySwM66UrPaw/gbrtiwfidf6MnPE8hfVwx2bIpNrmr
         r5BPuoyInF9Y4Spw+hYJpdNtu5K2i5JeJWFb7tQB+4vx1OdrMRdTJBNKuJYglcg2DN
         4KPgMgFZ67xgEW2sntRrzvkxU0Q0SULu6JSDL8+hjgLSwKF5LgernOZDGh9BTPlanh
         Qw/OajB3edPth1AL9WvicphLVHDV71GfLnbYFROrZS9t31WShb635LowrUgWuyKN2j
         bPJTrZGDq7R6hHRmldz/Le5f6P8U7jA69wYK6Divt+WnqqZr/KIPokNIuEB8uO0VO3
         UpY9a23Xb8PZg==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id gp20-20020a17090adf1400b00196b761920aso267913pjb.3;
        Mon, 13 Sep 2021 08:19:46 -0700 (PDT)
X-Gm-Message-State: AOAM533d5WjOqj/7L6ES0qEsfeZ6y98DAHecKOh6Lq0OwAZh48K47b9R
        6e5MnWor4VH4J0Cm10TtLJ3kMKMGr+3iA0FkK3A=
X-Google-Smtp-Source: ABdhPJzoLczNF57pRBlUYbj/z5YyMBwTXNCEn0gI+kfwrPZWeLFbcYkh+plyYVpHUun4H4T1+bxItEtw6lj9oIlGX/0=
X-Received: by 2002:a17:902:6b42:b0:13a:54d0:39c4 with SMTP id
 g2-20020a1709026b4200b0013a54d039c4mr10862011plt.42.1631546385152; Mon, 13
 Sep 2021 08:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210913145146.766080-1-robh@kernel.org>
In-Reply-To: <20210913145146.766080-1-robh@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 14 Sep 2021 00:19:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARwWazaMErsgUB7C8gLbnD5hQhvoCVO=aanPCCj4sqTgA@mail.gmail.com>
Message-ID: <CAK7LNARwWazaMErsgUB7C8gLbnD5hQhvoCVO=aanPCCj4sqTgA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable DT schema checks for %.dtb targets
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tom Rini <trini@konsulko.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 13, 2021 at 11:51 PM Rob Herring <robh@kernel.org> wrote:
>
> It is possible to build a single dtb, but not with DT schema validation
> enabled. Enable the schema validation to run for %.dtb and %.dtbo
> targets. Anyone building a dtb for a specific platform *should* pay
> attention to schema warnings.
>
> This could be supported with a separate %.dt.yaml target instead.
> However, the .dt.yaml format is considered an intermediate format and
> could possibly go away at some point if schema checking is integrated
> into dtc. Also, the plan is to enable the schema checks by default once
> platforms are free of warnings, and this is a move in that direction.
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Masahiro Yamada <masahiroy@kernel.org>


> ---
> v2:
>  - Also enable schema checks on %.dtbo targets
> ---
>  Makefile | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 7cfe4ff36f44..c57a7657c8dd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1402,17 +1402,17 @@ endif
>
>  ifneq ($(dtstree),)
>
> -%.dtb: include/config/kernel.release scripts_dtc
> -       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> +%.dtb: dt_binding_check include/config/kernel.release scripts_dtc
> +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(dtstree)/$*.dt.yaml
>
> -%.dtbo: include/config/kernel.release scripts_dtc
> -       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> +%.dtbo: dt_binding_check include/config/kernel.release scripts_dtc
> +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(dtstree)/$*.dt.yaml
>
>  PHONY += dtbs dtbs_install dtbs_check
>  dtbs: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree)
>
> -ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
> +ifneq ($(filter dtbs_check %.dtb %.dtbo, $(MAKECMDGOALS)),)
>  export CHECK_DTBS=y
>  dtbs: dt_binding_check
>  endif
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
