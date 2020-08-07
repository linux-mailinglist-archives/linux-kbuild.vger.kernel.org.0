Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D32DE23EE7B
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 15:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgHGNzk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 09:55:40 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30773 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGNzk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 09:55:40 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 077DtHJ8010749;
        Fri, 7 Aug 2020 22:55:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 077DtHJ8010749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596808518;
        bh=kxd75shqpUDCrWO6tl08NjmmCC2WGIAYElGpbYzOIWM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JZIU+GWr4nr9BXEu654yyZx5GPzcPX5LduAigEvpw3RBvdjpChf9/IGhVsd4Y8HNH
         LqZdf4VY6McyRdtPIAKr0bqr1GzkTpZPHz0qG6HoLjcvvx8SRP9NjL365Mp5NoN2cz
         9/rHJiGiuU05UnSyjlp+AMZnMq7Tpf5pBN0qEBXDwm7Uu8PLSzpPJgubP4BegaQDs4
         q4hYKWWLfecNTxkzPiBo6+LV4mYTIi01fvlNtjk7DyFnNI/YmFzC3UJgUkzJwkgkYZ
         TQCgkpdNdFxC8xUp42lTcaZOnI93hevbxIGkLQD+TH0KjW/939vvgcZptdQxef4jVD
         fwlQFTZ1B1HNg==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id p8so866395vsm.12;
        Fri, 07 Aug 2020 06:55:18 -0700 (PDT)
X-Gm-Message-State: AOAM5314UcsxEh9oD2kycqOBxXvmjS/NpwO7ZcSDQy6bMLXZFb7gY3UF
        bo7G/w5qWwY+QpBe979gF873VdrrkXVP3kEFcvA=
X-Google-Smtp-Source: ABdhPJwGNgtHcxnjmriCTHVsk/7QbBL5IwjRVD6FQFxzFRVjRYM9C48mG/o5qZkvzESZE4GuK6e7x55JL3XE1e/O/AY=
X-Received: by 2002:a67:7c11:: with SMTP id x17mr10979837vsc.155.1596808516824;
 Fri, 07 Aug 2020 06:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200708133015.12286-1-maxime.chretien@bootlin.com>
In-Reply-To: <20200708133015.12286-1-maxime.chretien@bootlin.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 7 Aug 2020 22:54:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpZ=By_-5KKps_q3emHuLBNv7AneLh9eNwBqbZToivSA@mail.gmail.com>
Message-ID: <CAK7LNASpZ=By_-5KKps_q3emHuLBNv7AneLh9eNwBqbZToivSA@mail.gmail.com>
Subject: Re: [PATCH] kconfig qconf: Add grey background for hidden options
To:     Maxime Chretien <maxime.chretien@bootlin.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 8, 2020 at 10:30 PM Maxime Chretien
<maxime.chretien@bootlin.com> wrote:
>
> This is useful to see which configuration parameters can be edited
> or not when "Show All Options" is enabled.
>
> Signed-off-by: Maxime Chretien <maxime.chretien@bootlin.com>
> ---
>  scripts/kconfig/qconf.cc | 7 +++++++
>  scripts/kconfig/qconf.h  | 4 ++++
>  2 files changed, 11 insertions(+)


I like the idea, but
maybe this patch could be improved?

For example, in the following test code,
BAR is correctly painted grey when CONFIG_FOO=n,
but "my menu" is always white despite of
"depends on FOO"

----(test code)------

config FOO
       bool "foo"

config BAR
       bool "bar"
       depends on FOO

menu "my menu"
       depends on FOO

endmenu

-------(test code end)----







> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index c0ac8f7b5f1a..be9ff4651da1 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -208,6 +208,13 @@ void ConfigItem::updateMenu(void)
>         }
>         if (!sym_has_value(sym) && visible)
>                 prompt += " (NEW)";
> +
> +       if(!visible) {
> +               setBackground(promptColIdx, QBrush(QColor("#E0E0E0")));
> +       } else {
> +               setBackground(promptColIdx, QBrush());
> +       }
> +


I think all the columns should be grey-grounded.
Please note you can click other columns to
toggle y/m/n.


How about something like this?



QBrush brush;

if (visible)
        brush = QBrush()
else
        brush = QBrush(QColor("#E0E0E0"));

setBackground(promptColIdx, brush);
setBackground(nameColIdx, brush);
setBackground(noColIdx, brush);
setBackground(modColIdx, brush);
setBackground(yesColIdx, brush);
setBackground(dataColIdx, brush);




>  set_prompt:
>         setText(promptColIdx, prompt);
>  }
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index c879d79ce817..79e47e8c1ae7 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -174,6 +174,10 @@ class ConfigItem : public QTreeWidgetItem {
>         {
>                 return Parent::text(idx);
>         }
> +       void setBackground(colIdx idx, const QBrush& brush)
> +       {
> +               Parent::setBackground(idx, brush);
> +       }

I do not understand why this wrapper is useful...


>         void setPixmap(colIdx idx, const QIcon &icon)
>         {
>                 Parent::setIcon(idx, icon);
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
