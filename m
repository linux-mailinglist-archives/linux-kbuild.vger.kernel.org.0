Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80145DA28A
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 02:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389057AbfJQABh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 20:01:37 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46580 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbfJQABh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 20:01:37 -0400
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x9H01SqF029001;
        Thu, 17 Oct 2019 09:01:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x9H01SqF029001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571270489;
        bh=ePR8/62tTCV9RgFvpCZdnwGUvBiPGJw/lxcq6lSwPM4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dzbRP1Y31JzhX9BNHKICCH6zsVtJmG82lxYJpYOb+3NC7vVZM3X8lvOTtkNyR2kqV
         mQo5yi7s/mjTM/Mmfb+GNVJO1/9dPkmrntIbupNDmqnr2IALvgmo+tQMw3o6Zj+kal
         ID7GZR4kLSGYyVCUKfBN14YkdSbLpoUgFL0XNkAd9VC0GYjDjxjge74wDakY7CXwvU
         drzIiInnKCXKIfFlS53jEu9LM1mZK4bp9T71NT/Fe3fgaF0IXiKSHbKpnV0BBfkdtH
         SsVIbO7Rslu6nl30AJruW+gswIequS+z2l5NLAUTWePZi8y3b26/R5INVwwuqYiyki
         len2PZ/LJAmcQ==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id w3so110240vkm.3;
        Wed, 16 Oct 2019 17:01:29 -0700 (PDT)
X-Gm-Message-State: APjAAAX7574wub97hpEIxzT+UrBKIiOZA0/9W0q4QkzQszp05NTwyYGU
        pohmTyL1BzjmzPNH8mQ8QS9838gGgOtfmXca25s=
X-Google-Smtp-Source: APXvYqxOKQo7+/EYmjvOrOWieFNkZ8gbZ2aF2PsHAio8Amlr0gcqt1WR0T3ky/yS2Q/fy1HG7YLp4MhVvSVOBGoCD5o=
X-Received: by 2002:a1f:1881:: with SMTP id 123mr464954vky.26.1571270488067;
 Wed, 16 Oct 2019 17:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191015064906.13833-1-efremov@linux.com>
In-Reply-To: <20191015064906.13833-1-efremov@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 17 Oct 2019 09:00:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATn62wLjwEFSVESRNXJAVHkcJ2hFFPbR8xbVHjXwONrcw@mail.gmail.com>
Message-ID: <CAK7LNATn62wLjwEFSVESRNXJAVHkcJ2hFFPbR8xbVHjXwONrcw@mail.gmail.com>
Subject: Re: [PATCH] modpost: add NOFAIL to strdup call
To:     Denis Efremov <efremov@linux.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 15, 2019 at 3:49 PM Denis Efremov <efremov@linux.com> wrote:
>
> Add NOFAIL check for the strdup call, since the function
> allocates memory and can return NULL. All strdup calls in
> modpost are checked with NOFAIL.
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 936d3ad23c83..8e8975065cbc 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -384,7 +384,7 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
>                 }
>         }
>         free(s->namespace);
> -       s->namespace = namespace ? strdup(namespace) : NULL;
> +       s->namespace = namespace ? NOFAIL(strdup(namespace)) : NULL;

This is correct, but I will put it off
because otherwise if would cause a conflict against this patch:

https://lore.kernel.org/patchwork/patch/1138151/

That patch is adding NOFAIL().




>         s->preloaded = 0;
>         s->vmlinux   = is_vmlinux(mod->name);
>         s->kernel    = 0;
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
