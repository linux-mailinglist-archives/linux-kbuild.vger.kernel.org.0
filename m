Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17B432F059
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 17:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhCEQsV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 11:48:21 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:55972 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhCEQrt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 11:47:49 -0500
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 125Gla9Z006407;
        Sat, 6 Mar 2021 01:47:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 125Gla9Z006407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614962857;
        bh=DMzhXf35G/Vhg/XE5s9dGyMbJ6jeBhMS6SJ1ZK9G1Po=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uUaihUDcC8do9r1x2bHIrTdRXehlEq+cPQ/ISuT9vTXb4uu1lVFkCux+F63iuWC6i
         eJTYTwbJGWFksbxs24hXn+OxCJQrkbR3IEi0XCE3IvJrTPFTGm9Hr5Qs33KFQAosMl
         qTVzUrgJEEvwL7lBgp3l0a84+rK1lw20W16ymB+XD38dL6cBByOKHs9F7jVD2pZI/H
         FgiTPImBEO6T187zOaJ3P6kFVjCQ910UlaJSGnn22omQ7qz+d+WRalUpTD4s5XPmbG
         ripAMd02aazWTP4J2wFY6VoZuOJOsOUOtbcBIeCCg3Vj7sdt31m0cLgTM5bQd7+M2Q
         VEt/YoSyHZr9Q==
X-Nifty-SrcIP: [209.85.167.42]
Received: by mail-lf1-f42.google.com with SMTP id z11so4673549lfb.9;
        Fri, 05 Mar 2021 08:47:37 -0800 (PST)
X-Gm-Message-State: AOAM533suCzt81fhahKiRLyIrvJYuG8kht91+mJxOEzpMy9hhNCqrekO
        k1OVhX4BulzX74h1aGW1xmHzP69msx9ywFNk4s8=
X-Google-Smtp-Source: ABdhPJwA2ZspEEabEb32G1y42RoNTxBmBovwMeaL2zGyROlot1JeF5F64Xxy/LSj51dP+Fd6NgN7ggE9+hb5Y2USZtQ=
X-Received: by 2002:ac2:5b9b:: with SMTP id o27mr6134485lfn.143.1614962855383;
 Fri, 05 Mar 2021 08:47:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614745266.git.viresh.kumar@linaro.org> <8e500ee41a7c3aac31920fbc5183d9f6e5a83260.1614745266.git.viresh.kumar@linaro.org>
In-Reply-To: <8e500ee41a7c3aac31920fbc5183d9f6e5a83260.1614745266.git.viresh.kumar@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Mar 2021 01:46:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfA5wFEvs+CBQ2mJVKiQ3zROd8qEqzT3coTyqGR_Xmeg@mail.gmail.com>
Message-ID: <CAK7LNAQfA5wFEvs+CBQ2mJVKiQ3zROd8qEqzT3coTyqGR_Xmeg@mail.gmail.com>
Subject: Re: [PATCH V9 1/4] kbuild: Simplify builds with CONFIG_OF_ALL_DTBS
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 3, 2021 at 1:36 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> We update 'extra-y' based on CONFIG_OF_ALL_DTBS three times. It would be
> far more straight forward if we rather update dtb-y to include all .dtb
> files if CONFIG_OF_ALL_DTBS is enabled.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Acked-by: Masahiro Yamada <masahiroy@kernel.org>


> ---
>  scripts/Makefile.lib | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index eee59184de64..a2658242d956 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -73,14 +73,13 @@ always-y += $(userprogs-always-y) $(userprogs-always-m)
>
>  # DTB
>  # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
> +dtb-$(CONFIG_OF_ALL_DTBS)       += $(dtb-)
> +
>  always-y                       += $(dtb-y)
> -always-$(CONFIG_OF_ALL_DTBS)   += $(dtb-)
>
>  ifneq ($(CHECK_DTBS),)
>  always-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
>  always-y += $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
> -always-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> -always-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
>  endif
>
>  # Add subdir path
> --
> 2.25.0.rc1.19.g042ed3e048af
>


-- 
Best Regards
Masahiro Yamada
