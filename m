Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E68112492A
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2019 15:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfLROK6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 09:10:58 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49692 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfLROK6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 09:10:58 -0500
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id xBIEAaqO031760;
        Wed, 18 Dec 2019 23:10:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xBIEAaqO031760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576678237;
        bh=ZtHoWzlWv4Nggpiz4JYJ0ktQQgL8zQr082eHKmhq0sA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Y8IH6ikPKkZ91TfmMDmbLnCku2cKcFxE58DmglIwpn99HQzVP0ZgoP1YHXWG4K9tq
         Mt454eRcKY4Lo4HjJxr/lsGyAEMsFxOEZgakqmzincCPM7nmXAvOfJYHzciHJE8s2e
         6//kBXRQkxo/BuWPUiPDbkFb/5/l7rF8HHWJ0T6WtfnScNDNLfCGe4MXlpbYcNuDI0
         dTOvC3rlM1AGNbPHRWJO8KHLUzGxH+oOk4YN/Bn+nPwCWsMj1Ere+y+1uy5zDupZIm
         aBjpFvxpDPxs9QFY7/Ya4O8wJhWLEBgPbxqG/9/1Tgh8PRiSacy2R7I5qzMWgXxJkN
         9HWIChs8b86sQ==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id v18so668237uaq.7;
        Wed, 18 Dec 2019 06:10:36 -0800 (PST)
X-Gm-Message-State: APjAAAUH6tqw3rjpz5c1wjBiVbmiVdGACLsouF7QC5GsNcbNkvzk5+/v
        d3eTzE9a5HM1Q9c3tmroOS+5+gUtzyYNgUMAacs=
X-Google-Smtp-Source: APXvYqw9cT8Od3W7kctCPwiC5X53fct0hh2cQ9AwQ0K101fOwa4G9Y/YaVZbIWbz6ZgR4YnRDQddC6j+idk0VSoEamk=
X-Received: by 2002:ab0:63c7:: with SMTP id i7mr1393678uap.109.1576678235726;
 Wed, 18 Dec 2019 06:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20191217135539.17157-1-info@metux.net>
In-Reply-To: <20191217135539.17157-1-info@metux.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Dec 2019 23:09:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVmO3i3BVSHHLAE3p10E5+POhBn9m9HpYqG5VeR1_NAw@mail.gmail.com>
Message-ID: <CAK7LNASVmO3i3BVSHHLAE3p10E5+POhBn9m9HpYqG5VeR1_NAw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: package: mkdebian: add missing rsync dependency
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 17, 2019 at 10:56 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> We've missed the dependency to rsync, so build fails on
> minimal containers.
>
> Fixes: 59b2bd05f5f4 ("kbuild: add 'headers' target to build up uapi headers in usr/include")
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---

Applied to linux-kbuild .Thanks.

>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index e0750b70453f..7c230016b08d 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -174,7 +174,7 @@ Source: $sourcename
>  Section: kernel
>  Priority: optional
>  Maintainer: $maintainer
> -Build-Depends: bc, kmod, cpio, bison, flex | flex:native $extra_build_depends
> +Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
>  Homepage: http://www.kernel.org/
>
>  Package: $packagename
> --
> 2.11.0
>


-- 
Best Regards
Masahiro Yamada
