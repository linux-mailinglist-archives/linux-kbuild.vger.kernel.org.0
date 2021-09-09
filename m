Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A444054BF
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Sep 2021 15:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346048AbhIINDW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 09:03:22 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42041 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355440AbhIIM5i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 08:57:38 -0400
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 189Ctxrs017658;
        Thu, 9 Sep 2021 21:56:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 189Ctxrs017658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631192160;
        bh=idheoIgIrv/lF93LCJVOs0O0F1nSRv+x/ovwQV+76Q8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w99uOF+TWqC9pi6ydnyLDJ8VXcctrDeloY+BV8lbRv5mxN0Up3tge7YBUn3uVTOUX
         FIoolWyUBoHY9jNhLxtL27Fi1Tx42lxThI2mAwnQtPmu9ttdp2AKBTQQv7vWBidw/e
         93xJCutZH6ErJLeAiqLVihqbytQic/+JasdHlfMu6W89tfzUGDJZPDYU0Nb8mt1P2Q
         Kcuf4Kt4CdGv12KESGg9fGj9bq944nUw7QzUDUiqcXSeMrzv+eOhEbCYC9LDrNyDnQ
         2A9ED4esQsP4IWALQYXx4vaDRGguzBv7YhjoKSlxlgLjOqSypf+0Jq/H1nBNXTArj+
         gAFFh0tOGhK5w==
X-Nifty-SrcIP: [209.85.215.172]
Received: by mail-pg1-f172.google.com with SMTP id t1so1694956pgv.3;
        Thu, 09 Sep 2021 05:55:59 -0700 (PDT)
X-Gm-Message-State: AOAM533uQDcWDvisVmZ8AM8npWwrYg8T2RFOCIpeBO4L4UzwjjqnrjMT
        chEolWZnHjBZphgpGFr+p4gVErAAmr+ZS3SeGIM=
X-Google-Smtp-Source: ABdhPJw+eFQHXKpHRrvFQxhnRyXVLXwhl5YiQlvBq5LeedDONR5Bw4hGTamNb3MeJx52ULWvAP3xaDgnm9kzH2wY2cI=
X-Received: by 2002:a65:40c4:: with SMTP id u4mr2566440pgp.186.1631192159159;
 Thu, 09 Sep 2021 05:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210903155201.3004567-1-robh@kernel.org>
In-Reply-To: <20210903155201.3004567-1-robh@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 9 Sep 2021 21:55:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNATxdf0o90C--qwumTbLyiSjt4m3m7-QSKYB31ZJ0ARA6w@mail.gmail.com>
Message-ID: <CAK7LNATxdf0o90C--qwumTbLyiSjt4m3m7-QSKYB31ZJ0ARA6w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable DT schema checks for %.dtb targets
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tom Rini <trini@konsulko.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 4, 2021 at 12:52 AM Rob Herring <robh@kernel.org> wrote:
>
> It is possible to build a single dtb, but not with DT schema validation
> enabled. Enable the schema validation to run for %.dtb targets. Anyone
> building a dtb for a specific platform *should* pay attention to schema
> warnings.
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
> ---
>  Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ec9e8a0fe298..01b888cfe1dc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1399,8 +1399,8 @@ endif
>
>  ifneq ($(dtstree),)
>
> -%.dtb: include/config/kernel.release scripts_dtc
> -       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> +%.dtb: dt_binding_check include/config/kernel.release scripts_dtc
> +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(dtstree)/$*.dt.yaml
>
>  %.dtbo: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@


Why didn't you change the %.dtbo part?




> @@ -1409,7 +1409,7 @@ PHONY += dtbs dtbs_install dtbs_check
>  dtbs: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree)
>
> -ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
> +ifneq ($(filter dtbs_check %.dtb, $(MAKECMDGOALS)),)
>  export CHECK_DTBS=y
>  dtbs: dt_binding_check
>  endif
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
