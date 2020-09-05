Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBE525E91C
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Sep 2020 18:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgIEQr2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Sep 2020 12:47:28 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33579 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgIEQrO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Sep 2020 12:47:14 -0400
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 085Gkmtp032650;
        Sun, 6 Sep 2020 01:46:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 085Gkmtp032650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599324408;
        bh=nedGK7syy4xWYLAIUicSEvsL6HxwQNEQw4VtYu98CcU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DqO4WZdo+W8HL7J3xG3o4qy20EDTVq1ra2YMnh4LIV5nh4bCU0+XxQI1ttuX2rvWx
         EMgqURbHJbVQLyE+1nw2iEWlOCw+Ym/sUHUzvCC2aZxC0Y9hx9jZe5TK7Yn2W+Vkv8
         yilAY55PvNvo4IQHuBEjvda21VYUs4fYgB6DnTI0ArfrdPvwL7BddRPOov5u/p7rwS
         yeXWazKP6xPu7giVx7q4Rp9eE6ItLw/c2JYplb3GHeCjojNVN60o3Q9eHGiNnJhgkb
         axMQktLTwHoBqDHBJBLgwV3GCFQmtLa5CpK69lFTIJ07m9V16D+EsgwyaHREBOEtIp
         jwslcj/kTzJgQ==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id e33so5943170pgm.0;
        Sat, 05 Sep 2020 09:46:48 -0700 (PDT)
X-Gm-Message-State: AOAM5322lRmIcuvqDLBbYu2t4koe9E/uC3NFORCb+Kzz47Hd7UY9DVjf
        jj1YXj0bRponCtXXR/q/C/7WvZEn9XoNYryab5g=
X-Google-Smtp-Source: ABdhPJzq4mv2RYH3ieWtiZKLwb33YdlkrwtanvICQqRyixCHxXJa7r8P5GW5TmXj2/3lzrbXjSL934NZJt6OdBDnl4E=
X-Received: by 2002:a05:6a00:7ca:: with SMTP id n10mr13524222pfu.129.1599324407714;
 Sat, 05 Sep 2020 09:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200904201258.795438-1-efremov@linux.com> <20200904201258.795438-2-efremov@linux.com>
In-Reply-To: <20200904201258.795438-2-efremov@linux.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 6 Sep 2020 01:46:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNATyitupGkjvff+cmi7s6zxe6STLUQtYCtPwm025PeUB9A@mail.gmail.com>
Message-ID: <CAK7LNATyitupGkjvff+cmi7s6zxe6STLUQtYCtPwm025PeUB9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: makefile: Drop GZFLAGS definition and export
To:     Denis Efremov <efremov@linux.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 5, 2020 at 5:14 AM Denis Efremov <efremov@linux.com> wrote:
>
> Drop the definition and export of GZFLAGS, because it's
> not used. GZFLAGS was dropped from arm64 in commit
> 4cf234943dcf ("arm64: drop GZFLAGS definition and export").
>
> Signed-off-by: Denis Efremov <efremov@linux.com>


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


BTW, if you want Russell to pick up this patch,
you need to send it to:

patches@arm.linux.org.uk



> ---
>  arch/arm/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 4e877354515f..3780063e0be0 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -20,7 +20,6 @@ ifeq ($(CONFIG_ARM_MODULE_PLTS),y)
>  KBUILD_LDS_MODULE      += $(srctree)/arch/arm/kernel/module.lds
>  endif
>
> -GZFLAGS                :=-9
>  #KBUILD_CFLAGS +=-pipe
>
>  # Never generate .eh_frame
> @@ -270,7 +269,7 @@ KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)/%include,$(machdirs) $(platdirs))
>  endif
>  endif
>
> -export TEXT_OFFSET GZFLAGS MMUEXT
> +export TEXT_OFFSET MMUEXT
>
>  core-y                         += arch/arm/
>  # If we have a machine-specific directory, then include it in the build.
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
