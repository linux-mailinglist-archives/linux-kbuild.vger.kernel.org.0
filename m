Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEAA20EBA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 04:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgF3Cub (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 22:50:31 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62879 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728816AbgF3Cua (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 22:50:30 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05U2o19Z021640;
        Tue, 30 Jun 2020 11:50:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 05U2o19Z021640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593485402;
        bh=BA2eIyq2Y+jYf/ti3GO+cZXuKicFpz1r5ISiK8LSAvY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tMce/cNtrkGVxiWEh8CgHYjMe0oRiNnwcAzc0t/BMSkUwoG6qtrSCb2eugH6xo+5u
         nYlgB9VwjZUyqp8oB3qUkliBy5rwmil62gyP8b5Bn4XwBxNXzZoL8QsfUKe/YQ2l/1
         HN/aOaSupth3Af3yhfCw6TqazE84KWco1P7JMVwVbKppqZBmn2TNhv1odNIc08fA/j
         IsImtGcPcn6pbujzxkae4oJ5OCbmtPd78jqiyPcBp9dpwaBxyIyOI4fYNs7QUFNX6C
         eubo58ZQHzSXpjShKNDj73Hb0GrusMcr+WhZcmlr3qjp1FRMJlBdPNcj2DgD7Gbsyn
         2P2kaKbDOyW+A==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id v1so10363731vsb.10;
        Mon, 29 Jun 2020 19:50:02 -0700 (PDT)
X-Gm-Message-State: AOAM532+/WLMl6dA5bq+hBim2bZlT63mCImoRIZLvdCuR6/szAhPiYNt
        BU1hIH0pjYK8PzOdHEaQFXE4wAYIEmET964F7ps=
X-Google-Smtp-Source: ABdhPJxUjiFgHFY42gUiJ+UxJkAVVtD4/yV/4lUjDX13AR+eCOVO2Q7jks6yDec71QFY4h0OZ7PuDegZhK6fvQ1g5bg=
X-Received: by 2002:a67:1342:: with SMTP id 63mr1729209vst.54.1593485400898;
 Mon, 29 Jun 2020 19:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593423060.git.mchehab+huawei@kernel.org> <45fa5ad583de1766de6169366df1df5837c5dc7c.1593423060.git.mchehab+huawei@kernel.org>
In-Reply-To: <45fa5ad583de1766de6169366df1df5837c5dc7c.1593423060.git.mchehab+huawei@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 30 Jun 2020 11:49:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASSeZiod0i1205_HrWNOb5BLb9FNbK2Y4ekx0sZ7QRLpQ@mail.gmail.com>
Message-ID: <CAK7LNASSeZiod0i1205_HrWNOb5BLb9FNbK2Y4ekx0sZ7QRLpQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] kconfig: qconf: navigate menus on hyperlinks
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 29, 2020 at 6:35 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Instead of just changing the helper window to show a
> dependency, also navigate to it at the config and menu
> widgets.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


Thanks, I think this is a nice improvement.

When I click a link, both the previous config
and the new one are highlighted.
Is this intentional behavior?

For example, put the following simple Kconfig
at the top-level.

From the info window of FOO,
click the 'select BAR' link,
and then both FOO and BAR are highlighted.

------------>8---------------
config FOO
       bool "foo"
       select BAR
       default y

config BAR
       bool "bar"
       default y
------------>8-----------------








> ---
>  scripts/kconfig/qconf.cc | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 49f0688fceb8..d8870b15a178 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1232,7 +1232,6 @@ void ConfigInfoView::clicked(const QUrl &url)
>         char *data = new char[count + 1];
>         struct symbol **result;
>         struct menu *m = NULL;
> -       char type;
>
>         if (count < 1) {
>                 qInfo() << "Clicked link is empty";
> @@ -1242,7 +1241,6 @@ void ConfigInfoView::clicked(const QUrl &url)
>
>         memcpy(data, str.constData(), count);
>         data[count] = '\0';
> -       type = data[0];
>
>         /* Seek for exact match */
>         data[0] = '^';
> @@ -1255,15 +1253,8 @@ void ConfigInfoView::clicked(const QUrl &url)
>         }
>
>         sym = *result;
> -       if (type == 's') {
> -               symbolInfo();
> -               emit showDebugChanged(true);
> -               free(result);
> -               delete data;
> -               return;
> -       }
>
> -       /* URL is a menu */
> +       /* Seek for the menu which holds the symbol */
>         for (struct property *prop = sym->prop; prop; prop = prop->next) {
>                     if (prop->type != P_PROMPT && prop->type != P_MENU)
>                             continue;
> @@ -1271,17 +1262,11 @@ void ConfigInfoView::clicked(const QUrl &url)
>                     break;
>         }
>
> -       if (!m) {
> +       if (!m)
>                 qInfo() << "Clicked menu is invalid:" << data;
> -               free(result);
> -               delete data;
> -               return;
> -       }
> +       else
> +               emit menuSelected(m);
>
> -       _menu = m;
> -       menuInfo();
> -
> -       emit showDebugChanged(true);
>         free(result);
>         delete data;
>  }
> @@ -1750,6 +1735,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
>                         item->setSelected(true);
>                         list->scrollToItem(item);
>                         list->setFocus();
> +                       helpText->setInfo(menu);
>                 }
>         }
>  }
> --
> 2.26.2
>


--
Best Regards
Masahiro Yamada
