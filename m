Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB1050E8AB
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Apr 2022 20:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236675AbiDYSvb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Apr 2022 14:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244701AbiDYSv0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Apr 2022 14:51:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6E88231A
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2022 11:48:13 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id c15so18972716ljr.9
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2022 11:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97ircpnTlmecwY/7O+f+s+rA+JVviEWlUCrBMQWwcqc=;
        b=LH4UVHiUiNGOVOcy7rAkGBU3Uqijf2xz8x8fGioIs4FMpDBYDJDYsxQ4gXJWDt8tfu
         dwjmc/QpOAieK8jh5b7FvvuDCYeaq4DtbzxgIrRdc67VTCz9BySBqpmuxXCrZww5DB8w
         XK6LIxQeNZSx+s4gqELNTw+jZfOl+Gk4bHKWi3OPz6cRDjIHy6lZF5V4dmEeOv7zoWi7
         FRenu0w1vcqmdL2GmM6mWp6jrcGS3PjoT2HxJUb1vl4GL1Ejjij3xYg3bIJVV2LnhoTE
         FcboLj+ify+UEdkej5pwo4FHilN2jpNz2s3FMrc/y8KpjeNdd6GYgNIfDUHKEziP3YW0
         K95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97ircpnTlmecwY/7O+f+s+rA+JVviEWlUCrBMQWwcqc=;
        b=67OrC1WsZ6uOGfQB89x5rUzPgL+gP8Gbkt3t7GPkJy1vc30MdIowxWMl86DeI1+2Ae
         Mv38T4azXCLjVQlJ2Xb6CKDB4DgmXQhqT9SBmuqRSR+y6alRUg/RyQQ5ae27WSmL7LIl
         jtuOwxTNxvSizYj+Gwnd2zsLfjYesN9GnHh2SmwzAh2xiPOeqHT+F0okXNcG1eaOcukC
         GJ2ysO+cgs4VBQhtqCbt1sJIn3pk/aZguLFJFQs3rnbyfhknK2746fR5zr9eBTE3j07o
         hD5ICJuNBDwPEXMMsuOW6Z7TNUYF4NXc81SYwkxyNPepTiiHUBpEqPga9CCx37EiBFph
         H74A==
X-Gm-Message-State: AOAM533zd5ubGDw9e8gb9jrL6kv4tleUaaAapqHkxxdbD6zVbb5H9J5X
        vZd/18qBAWcXJG252YUqL1BF+uxEne/TQKrPKTUGTBZbeJo=
X-Google-Smtp-Source: ABdhPJxRXmciVkJZwv+akqFKplpsCGdSmQLA0b/s/4YsRcp1++XrM7F1dp5IgDYIENLS8+9Tz0OajwOk7Oy9xPvk5bg=
X-Received: by 2002:a05:651c:553:b0:24f:18c1:d2a1 with SMTP id
 q19-20020a05651c055300b0024f18c1d2a1mr472938ljp.239.1650912491821; Mon, 25
 Apr 2022 11:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-17-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-17-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 25 Apr 2022 11:48:00 -0700
Message-ID: <CAKwvOdk1nt4b9am=_BP=U3igkSRBN14nx+5oS8iaaw9zhbH5JA@mail.gmail.com>
Subject: Re: [PATCH 16/27] modpost: make multiple export error
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is currently a warning, but I think modpost should stop building
> in this case.
>
> If the same symbol is exported multiple times and we let it keep going,
> the sanity check becomes difficult.
>
> Only the legitimate case is that an external module overrides the
> corresponding in-tree module to provide a different implementation
> with the same interface.

Could the same module export a weak version of a symbol, and a strong one?

Can kernel modules override in-kernel strong symbols?

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 14044cd94aaa..73f0b98e3b5a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -411,9 +411,9 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>                 list_add_tail(&s->list, &mod->exported_symbols);
>         } else if (!external_module || s->module->is_vmlinux ||
>                    s->module == mod) {
> -               warn("%s: '%s' exported twice. Previous export was in %s%s\n",
> -                    mod->name, name, s->module->name,
> -                    s->module->is_vmlinux ? "" : ".ko");
> +               error("%s: '%s' exported twice. Previous export was in %s%s\n",
> +                     mod->name, name, s->module->name,
> +                     s->module->is_vmlinux ? "" : ".ko");
>                 return s;
>         }
>
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
