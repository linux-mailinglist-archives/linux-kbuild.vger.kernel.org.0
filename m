Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FB820C883
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 16:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgF1Omm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 10:42:42 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:59087 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgF1Omm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 10:42:42 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 05SEgN8B013205;
        Sun, 28 Jun 2020 23:42:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 05SEgN8B013205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593355344;
        bh=F4Ul3QwS5sq/Dagy2Itj+JgsQfyq68W59QMQSZwzORY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kYbFuW1AYplplAAR/JteIZWMrzXmRVP5XlnmIADQq+CwGimwA79fagIg6q50NURcQ
         wwNn++KQrj87ErhTOPeBpio/ne3K8msALwP9cPt9PXEDzFkiXnINqHqsonYc3zWMfJ
         DpRH76RRa3DDpejA3WCbxkEKrc7KxGoeXDwxLRJVg3pCVrXY3Da3OZlK7TmcvipVKE
         QtnjBYgU9yBAhMjsNHQIWWYfcV0Fgj4gJkcAbkSzOtHYOfkNBApDqNOa+DUnRnKV7C
         DMnXaT5uv1xGbt+wwG3Q51U4bfbaIQXizPwSoW6WANlmAqFhhuAeNOnuIM86APk6Ol
         Dzg44z4JL4HTw==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id e15so7914262vsc.7;
        Sun, 28 Jun 2020 07:42:24 -0700 (PDT)
X-Gm-Message-State: AOAM533I6lQm19KlKs9urf9CWul7f69vDZmtI7r2lCr6klOCzFZ1MrJq
        mXV2mhEndanl4zYAj4jZig1k8pn5r8Lw7noAe4E=
X-Google-Smtp-Source: ABdhPJzF/r3rcyvb5VTGteuguwuySEKuiM7j7thgi4p2kH4dIcDXyAs1NK15AruMzVLZSKBg0G3XPFfdoEBLnOSjm0o=
X-Received: by 2002:a67:22c7:: with SMTP id i190mr8320550vsi.179.1593355342898;
 Sun, 28 Jun 2020 07:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
In-Reply-To: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 23:41:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com>
Message-ID: <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: make debug links work again
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 28, 2020 at 9:21 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The Qt5 conversion broke support for debug info links.
>
> Restore the behaviour added by changeset
> ab45d190fd4a ("kconfig: create links in info window").
>
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


I tested this patch, but this caused
segmentation fault.


I enabled 'Show Debug Info',
and then clicked
dep: <symbol name>.

Then, xconfig crashed.

(without this patch, it did not cause
segfault at least)

Did you see this?











> ---
>  scripts/kconfig/qconf.cc | 35 ++++++++++++++++++++++++++++++++++-
>  scripts/kconfig/qconf.h  |  1 +
>  2 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 631e19659504..03cadf27a376 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1012,7 +1012,7 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
>         : Parent(parent), sym(0), _menu(0)
>  {
>         setObjectName(name);
> -
> +       setOpenLinks(false);
>
>         if (!objectName().isEmpty()) {
>                 configSettings->beginGroup(objectName());
> @@ -1224,6 +1224,36 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
>                 *text += str2;
>  }
>
> +void ConfigInfoView::clicked(const QUrl &url)
> +{
> +       QByteArray str = url.toEncoded();
> +       const std::size_t count = str.size();
> +       char *hex = new char[count];
> +       unsigned long p;
> +
> +       if (count < 1)
> +               return;
> +
> +       memcpy(hex, str.constData(), count);
> +       p = (int)strtol(hex + 1, NULL, 16);
> +
> +       if (!p)
> +               return;
> +
> +       if (hex[0] == 's') {
> +               struct symbol *s = (struct symbol *)p;
> +
> +               sym = s;
> +               symbolInfo();
> +       } else {
> +               struct menu *m = (struct menu *)p;
> +
> +               _menu = m;
> +               menuInfo();
> +       }
> +       emit showDebugChanged(true);
> +}
> +
>  QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
>  {
>         QMenu* popup = Parent::createStandardContextMenu(pos);
> @@ -1497,6 +1527,9 @@ ConfigMainWindow::ConfigMainWindow(void)
>         helpMenu->addAction(showIntroAction);
>         helpMenu->addAction(showAboutAction);
>
> +       connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
> +                helpText, SLOT (clicked (const QUrl &)) );
> +
>         connect(configList, SIGNAL(menuChanged(struct menu *)),
>                 helpText, SLOT(setInfo(struct menu *)));
>         connect(configList, SIGNAL(menuSelected(struct menu *)),
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index d913a02967ae..a193137f2314 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -250,6 +250,7 @@ public slots:
>         void setInfo(struct menu *menu);
>         void saveSettings(void);
>         void setShowDebug(bool);
> +       void clicked (const QUrl &url);
>
>  signals:
>         void showDebugChanged(bool);
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
