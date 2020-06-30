Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1204E20EC17
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 05:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgF3Dhn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 23:37:43 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:16508 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728930AbgF3Dhn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 23:37:43 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 05U3b4hN008783;
        Tue, 30 Jun 2020 12:37:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 05U3b4hN008783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593488225;
        bh=HQ6KnmOwOmCLPqo+IgJmQaK1v7heWShiK/BACFB0v+g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xXeJUSWuOMrr7z3lfv7Cday+TcjdR3ts3dYt/FdSZ6wQqlB3S/hsRU1lkbaX7JUs/
         QSJF/NzSRLj4+v/KkooT2i3Bb/5DhE8Uenl2bcGz2VgAvMc+e+qWRwPPwu4o7ZHmnt
         MdV9+QqZrSpBgHzFjJEs5Wxr49ypSeRli8krOpMtlQZ2kAFWWMQW3Az7/6q3FS1Ihq
         f8gnDPHQoNA3nnVmqVSG/SIO+v+gVAsON2T5DC0YCJ9XmHXz/9Xb/Y19dniR/z0ikU
         wOV7p4kt1gpLC4wYA+QyfZ0Anp3ECYSVUjdO5b0NEOu9IGULRLi6a04fVh4pxH6dO+
         BIg+qLSiYPjGw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id m25so10406617vsp.8;
        Mon, 29 Jun 2020 20:37:05 -0700 (PDT)
X-Gm-Message-State: AOAM531gwZvFfheLfc4in2cYkTCuERIw0JwiQ18b4tU5DBYcVwE6ALZf
        6k+ICfdO9YxI/JC5QPtrirT2+fw1YQNFOgMeu58=
X-Google-Smtp-Source: ABdhPJyos1ORrGzmRbsRpSUTJzytWNoRffnYrImYzuBLzAg+8UwkZPH2/UbDxOJw3n1p73IsJwOIwI/sy3tWJk7tOm4=
X-Received: by 2002:a67:2e4d:: with SMTP id u74mr4608864vsu.215.1593488224012;
 Mon, 29 Jun 2020 20:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593423060.git.mchehab+huawei@kernel.org> <45fa5ad583de1766de6169366df1df5837c5dc7c.1593423060.git.mchehab+huawei@kernel.org>
In-Reply-To: <45fa5ad583de1766de6169366df1df5837c5dc7c.1593423060.git.mchehab+huawei@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 30 Jun 2020 12:36:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASbWXkRZ3OrmDSXj4jfu6jGcMnjnOOJ4+cV22fweJ9OJA@mail.gmail.com>
Message-ID: <CAK7LNASbWXkRZ3OrmDSXj4jfu6jGcMnjnOOJ4+cV22fweJ9OJA@mail.gmail.com>
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
> ---


I noticed a regression.

Visit "Networking support",
and click "select: BPF"
from the window at the bottom.

Nothing happens except the following error message
in the console:

Clicked menu is invalid: ^BPF$


If I apply only 1-4 in this series,
this works fine.














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
