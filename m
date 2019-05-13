Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB2131AEEE
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbfEMCcD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:32:03 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38236 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfEMCcC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:32:02 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x4D2Vgp9013775;
        Mon, 13 May 2019 11:31:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4D2Vgp9013775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557714703;
        bh=W9GYTuaPHqjHXdseIcrX12U5sDf8wKMuY9W7aBqNfOk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Yxq2ej9WzCAWLlwgLm7NSTPyKKaZ6Yt4kuhMsatUEKBJpWnswrByOU/BjEcCoAE4D
         4gLJh3vYAvNxstt04ruBFhsYCD2YsSPOaQiSo6JNAqYuEsCyTITGA0JI1NY/uJVVan
         ph/PcNLz69UP5zJoL7GiME95GfaGDWbq/US6ONY0fnN7D5sVaRUy5CE0wqoAHI1R7x
         oXU/yuavqdPl6+NGeAM48c3AprBeu+Rnxi6qncXvhq4b7E1Zx3c/gXrHBQUdQfTi/c
         x7oAZS8smkySjYnkthlPGduDRTwbDdnx6GulECY9tR0fZV1PkafymkSm1vHxlclpmj
         r9GPnmehmptKA==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id c76so7044437vsd.3;
        Sun, 12 May 2019 19:31:43 -0700 (PDT)
X-Gm-Message-State: APjAAAWS54HvVcBnOZXn60dkuJiB1HVUf9YC6banL3wUoNdpOD1Yr1fZ
        uC8Uu/Sja+bUMKsID82BitYV2XeO4VOaUGuKVjo=
X-Google-Smtp-Source: APXvYqx59+/1xjFl8L6tTusMImhznI9KGWNhUlzCQ3eh6FM0mB0tDQo/Y0+Ocn+zrn3tatoLWAklyt6joUwwsfz3HG8=
X-Received: by 2002:a67:f443:: with SMTP id r3mr12379271vsn.179.1557714702338;
 Sun, 12 May 2019 19:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <1557507408-7992-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557507408-7992-1-git-send-email-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 13 May 2019 11:31:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFntzRDbqK=-hnbW7LkCtqgFN7804d=PsRxkFS4tjdyA@mail.gmail.com>
Message-ID: <CAK7LNARFntzRDbqK=-hnbW7LkCtqgFN7804d=PsRxkFS4tjdyA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove useless pointer check in conf_write_dep()
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 11, 2019 at 1:56 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> conf_write_dep() has just one caller:
>
>     conf_write_dep("include/config/auto.conf.cmd");
>
> "name" always points to a valid string.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/kconfig/confdata.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 399973e..431b805 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -961,8 +961,6 @@ static int conf_write_dep(const char *name)
>         struct file *file;
>         FILE *out;
>
> -       if (!name)
> -               name = ".kconfig.d";
>         out = fopen("..config.tmp", "w");
>         if (!out)
>                 return 1;
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
