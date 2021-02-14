Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D66631B15D
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Feb 2021 18:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhBNRA6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Feb 2021 12:00:58 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:31207 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhBNRA5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Feb 2021 12:00:57 -0500
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 11EGxtaE032141
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Feb 2021 01:59:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 11EGxtaE032141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613321996;
        bh=lumSVRR3HltoCz8ZTbWk/WUDbY2zydhkNfQEbVAGebU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=THfVqND8DNNV154p3DZq7rgWRuA9PI7gnCwPY+V7ligWxYdcDie8b13npjYVVIJQg
         9ALBBOEo49UzDz8yxnpuNWEsUCgRL3AhKlGs2FwbimM7F6wm6zQt1HDO/FSFG7Ltq3
         mNu0EiUEWs46CN5SR2iRRCtH/wtCM0sp8Bza3OzfnXR32WO1yqmrkrsdU3o25sT/oR
         AA0hxjcYAArCUtR0hlw7OTKMtC0sXTAt7/K+0Cklej2dXi3N9IOTSxtX0lhioOEePe
         f//NL+JB8oOrPEKqusBBjT6RqirJYjjQtxj9g6oHiJQ11DqVQNJMdRHfoUO7jA8MVo
         018ceTf51aamw==
X-Nifty-SrcIP: [209.85.214.174]
Received: by mail-pl1-f174.google.com with SMTP id b8so2398534plh.12
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Feb 2021 08:59:56 -0800 (PST)
X-Gm-Message-State: AOAM530+oN0orBGOXOpqfp8vGCBtefRcjZ/AyK4SzinKCAatUCcSZFYZ
        Lx7C0bIOKhWsOj/reijrfHACMNVAhH5GFoGKVnE=
X-Google-Smtp-Source: ABdhPJwO8gL7vUTXbrEInSfyyOWVIZTPNFEvmomg2lzv/mhhKf7OwkIFYBqPP3OzCIiCeRsGJE9aJvIOW4wFwX1vOJ4=
X-Received: by 2002:a17:902:bb87:b029:e1:d1f:2736 with SMTP id
 m7-20020a170902bb87b02900e10d1f2736mr11667283pls.1.1613321995405; Sun, 14 Feb
 2021 08:59:55 -0800 (PST)
MIME-Version: 1.0
References: <17347583.e8QBZkc1Fl@mobilepool36.emlix.com>
In-Reply-To: <17347583.e8QBZkc1Fl@mobilepool36.emlix.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 15 Feb 2021 01:59:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQV+E9CG-2xwRGsLLxjaGN0sdd3hAHYtgD9RYq56WoGPg@mail.gmail.com>
Message-ID: <CAK7LNAQV+E9CG-2xwRGsLLxjaGN0sdd3hAHYtgD9RYq56WoGPg@mail.gmail.com>
Subject: Re: [PATCH] scripts: set proper OpenSSL include dir also for sign-file
To:     Rolf Eike Beer <eb@emlix.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 12, 2021 at 4:22 PM Rolf Eike Beer <eb@emlix.com> wrote:
>
> Fixes: 2cea4a7a1885bd0c765089afc14f7ff0eb77864e
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> Cc: stable@vger.kernel.org # 5.6.x
> ---


Applied to linux-kbuild/fixes. Thanks.


>  scripts/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 9de3c03b94aa..c36106bce80e 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -17,6 +17,7 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)   +=
=3D insert-sys-cert
>
>  HOSTCFLAGS_sorttable.o =3D -I$(srctree)/tools/include
>  HOSTCFLAGS_asn1_compiler.o =3D -I$(srctree)/include
> +HOSTCFLAGS_sign-file.o =3D $(CRYPTO_CFLAGS)
>  HOSTLDLIBS_sign-file =3D $(CRYPTO_LIBS)
>  HOSTCFLAGS_extract-cert.o =3D $(CRYPTO_CFLAGS)
>  HOSTLDLIBS_extract-cert =3D $(CRYPTO_LIBS)
> --
> 2.30.0
>
>
> --
> Rolf Eike Beer, emlix GmbH, http://www.emlix.com
> Fon +49 551 30664-0, Fax +49 551 30664-11
> Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
> Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 31=
60
> Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-Id=
Nr.: DE 205 198 055
>
> emlix - smart embedded open source
>
>


--=20
Best Regards
Masahiro Yamada
