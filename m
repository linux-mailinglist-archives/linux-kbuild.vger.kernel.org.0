Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2D65B0E40
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 13:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731050AbfILLtT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Sep 2019 07:49:19 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18090 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbfILLtS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 07:49:18 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x8CBn5nw001321;
        Thu, 12 Sep 2019 20:49:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x8CBn5nw001321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568288946;
        bh=0+B2s1BHeRtBzhZHTUV7cDcSQ77zkpQhfIda4L+RBiw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=o2SScnqef0V5KdEt6IWMpXhatQgQ6RbDBh9pu8kvH70twCSUsCdO9b6QNk8OKv6YW
         ZltvjfGliJrAN4rk3RD7yIXjOXfMqAOGRdiMDhwSLPNArsss/S2B5juyaWSqoyH5oN
         VzP35fLGx00J5dJp6ZlQ+FsnwqoKqQyKe7WqFFRtG82Z5eC8jdBUwm9IGVY30FsvyZ
         23FiExEoGxb50ZesGozWBAdcjkcTBIsCGnkcwJY5DIjOxuAoRlPyL35jHcn/Q4b67M
         HKrDuzyYovg3EdDSKHz4eNLMjYzFCQ4a/7ZqVaC84WCviktkBlXD7ghT3dXUmT7Nb/
         +GNIr4wy6nIrA==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id g14so10432092vsp.1;
        Thu, 12 Sep 2019 04:49:05 -0700 (PDT)
X-Gm-Message-State: APjAAAVkUEJ+sseSUTQBQdiB3Iu4pAjiKbJ2Y1LHXH2N4a8c/uP0yWSy
        xcBA7E9olPYg29AanTj5zhqShmxAyUZLNLqOU3Y=
X-Google-Smtp-Source: APXvYqz38P8c06z0HGmre7b1juWaisaJwWDXu5hS2WuvXZzJmlWexxqdCgtSsoxJxr8lJHMSz6YKef3TMTFKWywjUiQ=
X-Received: by 2002:a67:f496:: with SMTP id o22mr22508774vsn.179.1568288944787;
 Thu, 12 Sep 2019 04:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190909105317.20473-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190909105317.20473-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 12 Sep 2019 20:48:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQXRCYssihbriXjG4Y4GPnTShEw487qsb7VtjmyUHGGEQ@mail.gmail.com>
Message-ID: <CAK7LNAQXRCYssihbriXjG4Y4GPnTShEw487qsb7VtjmyUHGGEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 9, 2019 at 7:53 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This line was touched by commit f235541699bc ("export.h: allow for
> per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> not explain why.
>
> CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Both applied to linux-kbuild.


>  include/linux/export.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/export.h b/include/linux/export.h
> index fd8711ed9ac4..cdd98a0d918c 100644
> --- a/include/linux/export.h
> +++ b/include/linux/export.h
> @@ -20,7 +20,7 @@ extern struct module __this_module;
>
>  #ifdef CONFIG_MODULES
>
> -#if defined(__KERNEL__) && !defined(__GENKSYMS__)
> +#if !defined(__GENKSYMS__)
>  #ifdef CONFIG_MODVERSIONS
>  /* Mark the CRC weak since genksyms apparently decides not to
>   * generate a checksums for some symbols */
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
