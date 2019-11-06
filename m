Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF4BF0BF5
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 03:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730426AbfKFCSH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 21:18:07 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18370 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730231AbfKFCSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 21:18:06 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xA62HqFq016699;
        Wed, 6 Nov 2019 11:17:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xA62HqFq016699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573006673;
        bh=MIIePTYxao8A7607DZxT7kKQKSrj+FcHtdTeYX/rXac=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZxrwjyFGkKh6aAKjgf2Q8c4hxpYZBoVhXN1Lc9DZJq3+UsULj5CD/cHygjzsz7dHn
         AtsssGaIafZL7PfexHsV8N79ipR54GjPz0uEbDomRAdg6P08mYmvjFfajHUtQ/bNP8
         Kxs61lE38NRGyg0LvKUbxiULMrxn4QDqUm//YrJTCXuFtYksHawhoUAaBvtNyviphr
         BDeV1LUYVAvx/6GWMEqqfAFUB9C2QmIwfDntCLQ9HBUB+VeUd4368konyjgCkr3qDE
         2KK23j9JRwmnlToT76cBqDqUfK4I8/8oaU4MQOPpaKOMSynoXU3Jm26DggvCdLuLro
         JHcKUVbxA8bjQ==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id y129so14907983vsc.6;
        Tue, 05 Nov 2019 18:17:53 -0800 (PST)
X-Gm-Message-State: APjAAAUmtSR3P2c9Yv0BVl+dVIsCjrz1aV/178IAXKMj3eQPkrxjWRR2
        S2clnYEnGvI7JBw6hU3H8zHiajwKdqufo5wzZVQ=
X-Google-Smtp-Source: APXvYqwXOXBx1mo4GWJNOySOsF7t7TP5Qq1gMhb8usdVvxM+cITLONKJ0TKdYDTH0swURTQGEHeM9gWOHcpKT1ls9mA=
X-Received: by 2002:a67:2d08:: with SMTP id t8mr105270vst.155.1573006672003;
 Tue, 05 Nov 2019 18:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20191105150415.13098-1-hi@alyssa.is> <20191105150735.17200-1-hi@alyssa.is>
In-Reply-To: <20191105150735.17200-1-hi@alyssa.is>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 6 Nov 2019 11:17:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFER=4bVMMB0SCViVMHrd1kQa-MQO2O4jAm_-zFBCXnA@mail.gmail.com>
Message-ID: <CAK7LNARFER=4bVMMB0SCViVMHrd1kQa-MQO2O4jAm_-zFBCXnA@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig: be more helpful if pkg-config is missing
To:     Alyssa Ross <hi@alyssa.is>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 6, 2019 at 12:08 AM Alyssa Ross <hi@alyssa.is> wrote:
>
> If ncurses is installed, but at a non-default location, the previous
> error message was not helpful in resolving the situation.  Now it will
> suggest that pkg-config might need to be installed in addition to
> ncurses.
>
> Signed-off-by: Alyssa Ross <hi@alyssa.is>

Applied to linux-kbuild.
Thanks.


> ---
> Apologies -- was a little too hasty in sending v2, and it only
> included the updated message in one of the two files that needed to be
> changed.
>
>  scripts/kconfig/mconf-cfg.sh | 3 +++
>  scripts/kconfig/nconf-cfg.sh | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> index c812872d7f9d..aa68ec95620d 100755
> --- a/scripts/kconfig/mconf-cfg.sh
> +++ b/scripts/kconfig/mconf-cfg.sh
> @@ -44,4 +44,7 @@ echo >&2 "* Unable to find the ncurses package."
>  echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
>  echo >&2 "* depending on your distribution)."
>  echo >&2 "*"
> +echo >&2 "* You may also need to install pkg-config to find the"
> +echo >&2 "* ncurses installed in a non-default location."
> +echo >&2 "*"
>  exit 1
> diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
> index 001559ef0a60..c212255070c0 100755
> --- a/scripts/kconfig/nconf-cfg.sh
> +++ b/scripts/kconfig/nconf-cfg.sh
> @@ -44,4 +44,7 @@ echo >&2 "* Unable to find the ncurses package."
>  echo >&2 "* Install ncurses (ncurses-devel or libncurses-dev"
>  echo >&2 "* depending on your distribution)."
>  echo >&2 "*"
> +echo >&2 "* You may also need to install pkg-config to find the"
> +echo >&2 "* ncurses installed in a non-default location."
> +echo >&2 "*"
>  exit 1
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
