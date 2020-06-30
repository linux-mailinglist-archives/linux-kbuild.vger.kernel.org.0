Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CBD20EC40
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 05:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgF3D4B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 23:56:01 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61891 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgF3D4A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 23:56:00 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 05U3tg65028988;
        Tue, 30 Jun 2020 12:55:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 05U3tg65028988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593489343;
        bh=gq5TKVsbMe0XkrK/QPet5QFotvaiYBvUAKndW6BqD2g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G2ZW6ilrRRT9QALZsHGMnWs+pKpNu4Ebj8GLGJ6jMWxsyLG4c/7pTgZLCyUhTThQl
         5ZeJtirkqH6JRrQD/kDS74WBwOevFUDs/0oJyChqTWaeOgt8IrZrv3yecK2XndUx2C
         Uo8HcKuYQT3w2KFl6ggKANuZxLPIqwJ2e40eVA/hMrJAkefoWgkF7LKK0kZJxEsfTA
         JQ9L/1Is4vw2SB7nIwihlUgVAETRubx2HUCO71TcXzLDQahoM6SYLrx6+N+mPev0pY
         vD+VEJ1Wxw+YVnsc0K/5IO8BfPR5RBtbJm6Qkj2t85aSDNw6VecVx603rChjZ1hTPh
         0id3HNGxtItnQ==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id m25so10421534vsp.8;
        Mon, 29 Jun 2020 20:55:43 -0700 (PDT)
X-Gm-Message-State: AOAM530PKE5cP2KBoQjZWcSmlQ0MoVpH3mmYmYhpcqUvkesiZyyPmXTD
        K3nO78w4V1E6qSCNMbt8cLd3guIf/U6p9OqxKHI=
X-Google-Smtp-Source: ABdhPJxu+ZaYh/A09rtSaQOXZ0dgclwlALoWR1ft0hQTBsskUU6p3xjJNI/Pv+KsWwqUQGp3hMKlIivYYW/H+qqbXxU=
X-Received: by 2002:a67:694d:: with SMTP id e74mr14014925vsc.155.1593489341992;
 Mon, 29 Jun 2020 20:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593444492.git.mchehab+huawei@kernel.org> <781cc3dc06dfe179f19c8aca8068c14890bace52.1593444492.git.mchehab+huawei@kernel.org>
In-Reply-To: <781cc3dc06dfe179f19c8aca8068c14890bace52.1593444492.git.mchehab+huawei@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 30 Jun 2020 12:55:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQg8g7ad6SvZBQaq69+fcXLofV5WzRiFc8B3m6Rdy2vg@mail.gmail.com>
Message-ID: <CAK7LNASQg8g7ad6SvZBQaq69+fcXLofV5WzRiFc8B3m6Rdy2vg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: qconf: don't show goback button on splitMode
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 30, 2020 at 12:30 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> the goback button does nothing on splitMode. So, why display
> it?


Hmm, I still see the goback button
on all of the three modes...



> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kconfig/qconf.cc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index d0bcc0b717f0..f49fbac91995 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -437,9 +437,10 @@ void ConfigList::updateList(ConfigItem* item)
>         if (rootEntry != &rootmenu && (mode == singleMode ||
>             (mode == symbolMode && rootEntry->parent != &rootmenu))) {
>                 item = (ConfigItem *)topLevelItem(0);
> -               if (!item)
> +               if (!item && mode != symbolMode) {
>                         item = new ConfigItem(this, 0, true);
> -               last = item;
> +                       last = item;
> +               }
>         }
>         if ((mode == singleMode || (mode == symbolMode && !(rootEntry->flags & MENU_ROOT))) &&
>             rootEntry->sym && rootEntry->prompt) {
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
