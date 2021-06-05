Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C4139C93C
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Jun 2021 16:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFEOwt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Jun 2021 10:52:49 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:56576 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhFEOwt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Jun 2021 10:52:49 -0400
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 155EonWD011460;
        Sat, 5 Jun 2021 23:50:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 155EonWD011460
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622904650;
        bh=0R/kfUeR+gIHgRaI65q/lVZY4TzLH5HyqLuf8P5DTUU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pUldV/D7NzRnShJ2JXfvcYe0VVK2goCKAf672etZLdVrUiqQXYD4Ob2xqCcgRjnwi
         qAFeqUfOnUQVYz2zKGON2DQL6MBnljJ2YA7v+uQBfjTZD9Sp8UfmQndMABQTxShfdn
         SZs1sWcBzD1BD3LLXuVw2eO1io/yr62l5fktEFxGsNaMe93LPjgLmzpANcY+nLLhZ7
         UG6gDTiKmbrdkbS0X+0TGSVXr8STnPO/RRh4ZOw1+gGxhWALCsgfdB+sbZjGCOYrZu
         1mKstCs1+zFH+w1Ky2w6iscHbV4vvQ9KpjMmJT2A5l/XSH9arrdOfNtb8lJmUaZ2WY
         XSO7NG1zite/g==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id u126so5622206pfu.13;
        Sat, 05 Jun 2021 07:50:49 -0700 (PDT)
X-Gm-Message-State: AOAM531NqjXgMMiyAgjN05LhlmMBwo3BwSgp/Cr7JnEYI4HmuP1SA9vY
        VEqb3/l3KNQj2IRwvoZlVkl0DsgFUX5+4g+fHJA=
X-Google-Smtp-Source: ABdhPJy/lwWexxX5CzHKzO795nR5J+PtyS3sS3cKV8RqA/YF12TaCe+h+W5TNRq4ehP8sEZEbg91EC9hF+315lTNENs=
X-Received: by 2002:a62:2581:0:b029:2ea:228e:5a37 with SMTP id
 l123-20020a6225810000b02902ea228e5a37mr9499914pfl.63.1622904649006; Sat, 05
 Jun 2021 07:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210528171321.158586-1-masahiroy@kernel.org>
In-Reply-To: <20210528171321.158586-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 5 Jun 2021 23:50:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdUtUwuZdx6PfxVtnwZ9Yzde24xv2d7C_xjuYMUmRQxg@mail.gmail.com>
Message-ID: <CAK7LNAQdUtUwuZdx6PfxVtnwZ9Yzde24xv2d7C_xjuYMUmRQxg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: constify long_opts
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 29, 2021 at 2:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> getopt_long() does not modify the logopts structure.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.


>  scripts/kconfig/conf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index bfa1ea8f5f98..5d84b44a2a2a 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -678,7 +678,7 @@ static void check_conf(struct menu *menu)
>                 check_conf(child);
>  }
>
> -static struct option long_opts[] = {
> +static const struct option long_opts[] = {
>         {"help",          no_argument,       NULL,            'h'},
>         {"silent",        no_argument,       NULL,            's'},
>         {"oldaskconfig",  no_argument,       &input_mode_opt, oldaskconfig},
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
