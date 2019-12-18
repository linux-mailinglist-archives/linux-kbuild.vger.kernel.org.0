Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 717B812486A
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2019 14:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfLRNcq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 08:32:46 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:51142 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfLRNcq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 08:32:46 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xBIDWVF5028366;
        Wed, 18 Dec 2019 22:32:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xBIDWVF5028366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576675951;
        bh=sJfQjaTus20ylQDX0Cy8AyUDwzQ/sDxSwafJAeS0dW8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ewUTghOTNbp6FUijZ0ydQ/7BMXDJn73aICVydSSmw+YQm07OeoDuT2lYBtrSdBGyi
         TQtz/xQYmIXHblwyPyZIHVHUF8X5Qch8E800CKOWhUDNxhlCeIUZmkW550mYcsEaJK
         DzmsG+gZOxw7Qmy6AoTpX7ytE7I8lMZEoCUc+ofzvmkRkfeSQIRVT5GdusgFOTEBzX
         K/uvPxST1wa9Cq6vfJqKALq+1Y8OZ0nYkA3Q0Mp0gzqDsIZ5DrZ2pMrcunX/L/tXij
         AYnTCeR6N1epefHLhLMxF5xqs45SndDivao8l+kuD+nU/qJJAeGBK4ec0ufVZZ8XRg
         Vk/iFDLYMGnjg==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id v18so623103uaq.7;
        Wed, 18 Dec 2019 05:32:31 -0800 (PST)
X-Gm-Message-State: APjAAAW7xBGd/4RwjgGxnbVtwt0shjdsOjAgdsDMNIRMJAyCLw+2SDs/
        J/+P5dfaecSLc75i+R3xmJpCIx+StDkLgMgLjeY=
X-Google-Smtp-Source: APXvYqxxjVi8o034BoDDFSeFD+Tm1JEagxh0tvPpKE6k0Q2UpqZUUow1nFHPcAEPvJZa8lDsptDoDHzRcrQ2e3+59BQ=
X-Received: by 2002:ab0:6418:: with SMTP id x24mr1334768uao.40.1576675950239;
 Wed, 18 Dec 2019 05:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20191218114625.28438-1-frank-w@public-files.de>
In-Reply-To: <20191218114625.28438-1-frank-w@public-files.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Dec 2019 22:31:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
Message-ID: <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
To:     Frank Wunderlich <frank-w@public-files.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(+CC: DT maintainers)

On Wed, Dec 18, 2019 at 8:55 PM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> With this Patch we are able to change cpp-preprocessor options
> (e.g. -D...) for using conditions (#ifdef) in devicetree files
> and dynamically add include searchpaths

I think this is questionable
since DT is supposed to describe hardware.
Does it depends on #ifdef or some external defines?

If you want to add variations,
you can add a new DTS which includes other DTS(I) files.



>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3fa32f83b2d7..c722a6c7786a 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -177,7 +177,7 @@ DTC_INCLUDE    := $(srctree)/scripts/dtc/include-prefixes
>
>  dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
>                  $(addprefix -I,$(DTC_INCLUDE))                          \
> -                -undef -D__DTS__
> +                -undef -D__DTS__ $(DTC_CPP_FLAGS)
>
>  # Useful for describing the dependency of composite objects
>  # Usage:
> --
> 2.17.1
>


--
Best Regards


Masahiro Yamada
