Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D94B6EF47C
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 05:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729711AbfKEE3x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 23:29:53 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50627 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbfKEE3x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 23:29:53 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xA54TYv4022085;
        Tue, 5 Nov 2019 13:29:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xA54TYv4022085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572928175;
        bh=HpBjnXtycyuUBqoDiy6HTDKw/kyjuph34USJqx070OQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gV4cBQswy31P/08Qno3Jf1ZhAmTi0BoaDBGaFAbZ8ZGPGJvwj2v/VEIIcGtjqwna1
         BZveN8iZYSEgiJRnwC8dzGAgPYviDo2vFlVGRIvo4NzMcfAdPqbPUiPZSWmdTLwzNc
         ciUwFdYxC21XkEgQYaJoiiCoFxXGSQuxFyvJ8/W4yGKYDgYr0Z7w3KlKBvfJKSIsvY
         dNazAGHSJ5whgPdhrxD1kUFsBo/xKMfW0blZ8+i5YqboJQSGco22fh3RmFLZ91CKif
         ObtVJCHO9EKR9tkK1ub/mra1mQX+2H+P0mJ0WwmKkpqju8ai5C5TKhPhEW3az1HZHH
         7d5FSgVuV52Jw==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id r22so3160206uam.11;
        Mon, 04 Nov 2019 20:29:35 -0800 (PST)
X-Gm-Message-State: APjAAAXfptWuUVCmdp1exZTwFqYJU611GKweeNBp6/lYPODEEuNx+xR4
        mVPlozqjZuNFmQcweSwmcONZVWwUKj0zCh8LcwQ=
X-Google-Smtp-Source: APXvYqzE9ATABV32hIOGbqh3ZJ8JHmXjnIBuTb9GFtVGeAAZ7TX/lX/fNTrhKO3xTUHHLKMyrF+dBDKgZ8F9oBjLcik=
X-Received: by 2002:ab0:3395:: with SMTP id y21mr6122191uap.25.1572928173771;
 Mon, 04 Nov 2019 20:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20191104204453.20115-1-hi@alyssa.is>
In-Reply-To: <20191104204453.20115-1-hi@alyssa.is>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 5 Nov 2019 13:28:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNATEUcoB8u-AYU6=hfS+NFbGEOV_9noCwGHWHNsqOK2e+g@mail.gmail.com>
Message-ID: <CAK7LNATEUcoB8u-AYU6=hfS+NFbGEOV_9noCwGHWHNsqOK2e+g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: be more helpful if pkg-config is missing
To:     Alyssa Ross <hi@alyssa.is>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 5, 2019 at 5:47 AM Alyssa Ross <hi@alyssa.is> wrote:
>
> If ncurses is installed, but at a non-default location, the previous
> error message was not helpful in resolving the situation.  Now, if
> ncurses can't be found, and pkg-config is not installed, it will
> suggest that pkg-config might need to be installed in addition to
> ncurses.
>
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> ---


I do not like to complicate the error message.

How about appending a little more info, like this?

*
* Unable to find the ncurses package.
* Install ncurses (ncurses-devel or libncurses-dev
* depending on your distribution).
*
* You may also need to install pkg-config to find the
* ncurses installed in a non-default location.
*


Thanks.




>  scripts/kconfig/mconf-cfg.sh | 14 ++++++++++++--
>  scripts/kconfig/nconf-cfg.sh | 14 ++++++++++++--
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> index c812872d7f9d..f547b13f77f6 100755
> --- a/scripts/kconfig/mconf-cfg.sh
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -41,7 +41,17 @@ fi
>
>  echo >&2 "*"
>  echo >&2 "* Unable to find the ncurses package."
> -echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
> -echo >&2 "* depending on your distribution)."
> +echo >&2 "*"
> +if [ -n "$(command -v pkg-config)" ]; then
> +       echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
> +       echo >&2 "* depending on your distribution)."
> +else
> +       echo >&2 "* You may need to install ncurses"
> +       echo >&2 "* (ncurses-devel or libncurses-dev"
> +       echo >&2 "* depending on your distribution)."
> +       echo >&2 "*"
> +       echo >&2 "* If you have ncurses installed,"
> +       echo >&2 "* you may also need to install pkg-config."
> +fi
>  echo >&2 "*"
>  exit 1
> diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
> index 001559ef0a60..569226f1b497 100755
> --- a/scripts/kconfig/nconf-cfg.sh
> +++ b/scripts/kconfig/nconf-cfg.sh
> @@ -41,7 +41,17 @@ fi
>
>  echo >&2 "*"
>  echo >&2 "* Unable to find the ncurses package."
> -echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
> -echo >&2 "* depending on your distribution)."
> +echo >&2 "*"
> +if [ -n "$(command -v pkg-config)" ]; then
> +       echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
> +       echo >&2 "* depending on your distribution)."
> +else
> +       echo >&2 "* You may need to install ncurses"
> +       echo >&2 "* (ncurses-devel or libncurses-dev"
> +       echo >&2 "* depending on your distribution)."
> +       echo >&2 "*"
> +       echo >&2 "* If you have ncurses installed,"
> +       echo >&2 "* you may also need to install pkg-config."
> +fi
>  echo >&2 "*"
>  exit 1
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
