Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E7920C563
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 04:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgF1CSt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jun 2020 22:18:49 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:28455 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgF1CSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 22:18:49 -0400
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 05S2IF5R014511;
        Sun, 28 Jun 2020 11:18:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 05S2IF5R014511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593310696;
        bh=6nvSCZKgkSJRyOOL82y2TRTdtu1aiaXtPkDzZF6Q9a8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PTiU+/MRUJ5OV+C7PlUZ4txzwhc6C0FaGVp2AVTZHN3EUTfeb6NYUEuErQBz+b9bD
         2vx4WwkYi0Yolm1a6CThSJXQqun1GBvCDqtJ00S7MsHVVwkBSNk2RlWoBAMv8I3oi/
         q4hiDaYuuG8Ra/98cc4mfIqa6DYKA0E2mGCXYbgha6iG6XB/T1Za+dDKka7FP9MkDK
         1LEXVGdqFV3nWwk/gf11C6d6WTFg7JSFLaEzbCs/Lphae5RNW45Q9F3U5d6Vc+4EUR
         pAdUtK4ck/gnjNBOr551nCZgZ1PQk8zs9G/FgMg7/aSxBli/bvy4byLnCIf8eyWPkd
         w6GsI3TGBjLaQ==
X-Nifty-SrcIP: [209.85.221.177]
Received: by mail-vk1-f177.google.com with SMTP id y3so2734424vkg.11;
        Sat, 27 Jun 2020 19:18:15 -0700 (PDT)
X-Gm-Message-State: AOAM530B4eBGNQjQamUYAb3CKA7lz6x2sA+4ftrqOH1PpfpMyTyapU3e
        doCvqk3Gc9ykl/czniod9u9mcyUxpKPyA5uo+YQ=
X-Google-Smtp-Source: ABdhPJzgTi8azbc4a3f8X2gUvA8Ha7z1rp4U9K4tpTgt2UGT3iOyuj3g/DdCEiLwtPOX7FysnTkCBAfJeTKPqoTpW5w=
X-Received: by 2002:a1f:e841:: with SMTP id f62mr6814168vkh.66.1593310694811;
 Sat, 27 Jun 2020 19:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200625154226.25692cd1@coco.lan> <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
In-Reply-To: <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 11:17:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnariwQ14w7dDKRS76yXKzLn6pSbk02zQF6LHm4i=ppw@mail.gmail.com>
Message-ID: <CAK7LNATnariwQ14w7dDKRS76yXKzLn6pSbk02zQF6LHm4i=ppw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: Fix find on split mode
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 25, 2020 at 11:53 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The logic handling find on split mode is currently broken.
> Fix it, making it work again as expected.
>
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---


Applied to linux-kbuild.
Thanks.


>  scripts/kconfig/qconf.cc | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index c0ac8f7b5f1a..b8f577c6e8aa 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1645,22 +1645,21 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
>                         return;
>                 list->setRootMenu(parent);
>                 break;
> -       case symbolMode:
> +       case menuMode:
>                 if (menu->flags & MENU_ROOT) {
> -                       configList->setRootMenu(menu);
> +                       menuList->setRootMenu(menu);
>                         configList->clearSelection();
> -                       list = menuList;
> -               } else {
>                         list = configList;
> +               } else {
> +                       configList->setRootMenu(menu);
> +                       configList->clearSelection();
> +
>                         parent = menu_get_parent_menu(menu->parent);
>                         if (!parent)
>                                 return;
> -                       item = menuList->findConfigItem(parent);
> -                       if (item) {
> -                               item->setSelected(true);
> -                               menuList->scrollToItem(item);
> -                       }
> -                       list->setRootMenu(parent);
> +                       menuList->setRootMenu(parent);
> +
> +                       list = menuList;
>                 }
>                 break;
>         case fullMode:
> --
> 2.26.2
>
>


-- 
Best Regards
Masahiro Yamada
