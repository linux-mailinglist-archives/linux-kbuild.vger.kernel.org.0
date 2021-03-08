Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5067433107A
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Mar 2021 15:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhCHOLv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Mar 2021 09:11:51 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52177 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhCHOLp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Mar 2021 09:11:45 -0500
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 128EBCEd008128;
        Mon, 8 Mar 2021 23:11:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 128EBCEd008128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615212673;
        bh=D51j11IymRejYS1YLF4yZz4Lh5b4BqPafgD1kwn5RJg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zCWcxKelDXbybors9yzQBDjf5+p94w0syBSQUOUa13A8XAekVEfjcj48e/VH4n4Ho
         dv/+UUY7yp1w4kWt6pQhdNcIut/7PY0KhBFgxXer2PfvBX6ls9RRHSzsmZI2C9SMYl
         YMhIeLmdfR8pVOoJhytyVHDOBbtgUkEwoW1bvBDexDBDmMBalV/sIs1JV5rn8i7TgJ
         TKklT+UseZn2HuK/Vvgyc9VX6gS2t73kmkkdC+IhfVrv7thSXHE/XxLDuqj8clvDau
         Ogfn6UIGXqAC7tduNvimFo2xgUDezBFEyrvKter9tifu89DXR5UJn4+uekVXeybv6r
         qwoj1rUE1pzdA==
X-Nifty-SrcIP: [209.85.214.169]
Received: by mail-pl1-f169.google.com with SMTP id d8so4912400plg.10;
        Mon, 08 Mar 2021 06:11:12 -0800 (PST)
X-Gm-Message-State: AOAM531s+Bl6yBwpxxr9/8iDM7zoBm+2RWAebMAx+T7WL9nf8cQQ8GSQ
        eX0n9K3o4RKVAd7KhDdkAoC9LmVW9R3m/yUEeWg=
X-Google-Smtp-Source: ABdhPJzjO0JlIXfvM/rDoV2mA8vb4upZZOC6Gq/PGFayTYuG3LMswZd2grtIomBcWroCc1jaCt6fBpIIFu2UeRDVkYw=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr25203112pji.87.1615212672124;
 Mon, 08 Mar 2021 06:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20210228061028.239459-1-masahiroy@kernel.org>
In-Reply-To: <20210228061028.239459-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 8 Mar 2021 23:10:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNASQ6G+cspPanufSGdOVv9amHf91rao593W5J1FOKaeTxw@mail.gmail.com>
Message-ID: <CAK7LNASQ6G+cspPanufSGdOVv9amHf91rao593W5J1FOKaeTxw@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: add image_name to no-sync-config-targets
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 28, 2021 at 3:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'make image_name' needs include/config/auto.conf to show the correct
> output because KBUILD_IMAGE depends on CONFIG options, but should not
> attempt to resync the configuration.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

All applied to linux-kbuild.



>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 633d2769b6ec..c84a9311df29 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -263,7 +263,8 @@ no-dot-config-targets := $(clean-targets) \
>                          $(version_h) headers headers_% archheaders archscripts \
>                          %asm-generic kernelversion %src-pkg dt_binding_check \
>                          outputmakefile
> -no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease
> +no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease \
> +                         image_name
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
>
>  config-build   :=
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
