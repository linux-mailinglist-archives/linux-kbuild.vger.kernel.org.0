Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EE12DF062
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Dec 2020 17:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgLSQLv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Dec 2020 11:11:51 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:33572 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgLSQLu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Dec 2020 11:11:50 -0500
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0BJGAkbb006938;
        Sun, 20 Dec 2020 01:10:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0BJGAkbb006938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608394246;
        bh=lat0uiKUxd5PoVSVwVF/yONoUq8DBc+FK9c1SgCz/n4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mN4C+UlvPyWVROLtQYBaVIGJTFno0D1HTuJigrBgw1Y+9k/LpMVnmpN5kfuDxc8LL
         1BoNjEwBjwsbkVV8C0pL8XPfHXH8R4rIls4Ie+B/gSYKYVr5d7Z+LD+/aNY2B+FkJj
         jUIHVlEKcBJlUYb5zwWnf+kC07BgNlKNNPElpuV1nmiE6sfLZzmkGoR/c/B26Z4w6X
         jN6myWNfrpLHrrphylNIBXFQSfuqLg6wXEOZYWDwn35Xdv+cwageYjAfPee+DfXX0W
         WE9hb3OufpXJAkkmG64O3mHznEfVXMVPiYApv3eAMvICz/C4Jtkr2FZDouaZZ0ltvx
         NDcdFl99WC+dA==
X-Nifty-SrcIP: [209.85.215.171]
Received: by mail-pg1-f171.google.com with SMTP id c22so3301456pgg.13;
        Sat, 19 Dec 2020 08:10:46 -0800 (PST)
X-Gm-Message-State: AOAM532H1dp9qTDW+1iC5Ai9pw2hKzkUegewoltQ4ASHtvBnNBUL3J8f
        Q2N2Jt97Et3XxUfPE5VElQaK8STg4bmy6UpWeN4=
X-Google-Smtp-Source: ABdhPJwaEL9DTLqbByNHyNky+r+lwsQWV2jCOg6YIv+t30w3ce0Brb7UMAn92ciokoZuz9KFvbJK2M3faC60G0jRKIw=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr8779173pgu.175.1608394245527;
 Sat, 19 Dec 2020 08:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20201208152857.2162093-1-geert+renesas@glider.be> <20201208152857.2162093-2-geert+renesas@glider.be>
In-Reply-To: <20201208152857.2162093-2-geert+renesas@glider.be>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 20 Dec 2020 01:10:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASteax8oDjNopYw00=VFMaM9LNNWej7bXGC-+Fs9-96BA@mail.gmail.com>
Message-ID: <CAK7LNASteax8oDjNopYw00=VFMaM9LNNWej7bXGC-+Fs9-96BA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/kbuild: Document COMPILE_TEST dependencies
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 9, 2020 at 12:29 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Document best practises for using COMPILE_TEST dependencies.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/kbuild/kconfig-language.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 1cf1aebdd6cdf8fa..2b746332d8aa6bce 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -553,6 +553,17 @@ with "depends on m".  E.g.::


Both applied to linux-kbuild. Thanks.

I replaced the two-spaces between sentences
because the majority in this file adopts
one-space between sentences.
(I still see some inconsistencies, though.)






>
>  limits FOO to module (=m) or disabled (=n).
>
> +Compile-testing
> +~~~~~~~~~~~~~~~
> +If a config symbol has a dependency, but the code controlled by the config
> +symbol can still be compiled if the dependency is not met, it is encouraged to
> +increase build coverage by adding an "|| COMPILE_TEST" clause to the
> +dependency.  This is especially useful for drivers for more exotic hardware, as
> +it allows continuous-integration systems to compile-test the code on a more
> +common system, and detect bugs that way.
> +Note that compile-tested code should avoid crashing when run on a system where
> +the dependency is not met.
> +
>  Kconfig recursive dependency limitations
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
