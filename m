Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0871B5190E2
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 May 2022 00:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiECVzo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 May 2022 17:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243198AbiECVxf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 May 2022 17:53:35 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4075143497
        for <linux-kbuild@vger.kernel.org>; Tue,  3 May 2022 14:49:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j4so32485878lfh.8
        for <linux-kbuild@vger.kernel.org>; Tue, 03 May 2022 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o/vmxG0uAXm0MMXIv9+PUj4CzFiP52VYBcjCVzFbqfs=;
        b=QqpYLBQkvKbTcScaIrIMqEcoF75/DW7SltbNSDorOxo0UUpKxbYfZoaeW1qxe/iM/O
         VhUzaYiKX+xxVAaGwsecbB0zGxKGzg4EUXj2PHY7GRi3QvOO/Du61FQZEAV88BvJy6/s
         LKn/141lYN/evptWnTby5G3MTXILI8hDJlp1hHqgLPxRzUr1VWWMdCQfzxWi8Woo6lHg
         yQ89PED1pUcjnZiRpN7lgbMH4pcTgidXBewABtjacc7at8gZz0TGBzDKdGM1p3W6IRJz
         2ld8bDmxBXt1IimXWR1SH9yIv1beIFfLizSfS+API9LCaJqrnI782LXEf2hLdzT6yeex
         6Azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o/vmxG0uAXm0MMXIv9+PUj4CzFiP52VYBcjCVzFbqfs=;
        b=361ABZq/PshAFQGsx33VlFz/LfB+mentK9+y7YYYOA/RXcwXvnBIexv6OlRT5koxNa
         5UnDGfaejjjBnkyRp9Rdt/EqFYVB/PyJOwHKsnJZNAylol2lZ3eJG3IXVG5j15CqIgY5
         ZdykW2kZwVzbVTIsQJu/AWY228hOrSoHILg2vwCk/ivVkiMr+ux2fTPuM3rej42JDJrg
         X5PvurdrvOcSrmRwl9IIJEf4l3bKukis8GYAfVkGlI6RiLt6z3oRgDTA1V/+Uc9B2Sdu
         /6Muuu+qoptLZvpIoJxxy2K2qoC2rRy8cKuV5OjVUqQisYg8YWMBT+ouBTGVdX0XeWiz
         LpLw==
X-Gm-Message-State: AOAM531daDnv/6tXcQvHCDdJyJ7oDeu0MdkoztC7bL/BFZQWnEt4XzaY
        3X+MjOhPLvY62DBZuELwORgKsGT+ja0bslUSxKDdXw==
X-Google-Smtp-Source: ABdhPJzaagsuObxjwUJRCDznJNJKNO2WIFr/aIqKEAmCY4cEL2E6lJ8k4xnH+nmBEJkR8X7VfTVYutq4tFRvMcd2s6c=
X-Received: by 2002:ac2:4646:0:b0:472:108e:51af with SMTP id
 s6-20020ac24646000000b00472108e51afmr12654280lfo.184.1651614576161; Tue, 03
 May 2022 14:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220501084032.1025918-1-masahiroy@kernel.org> <20220501084032.1025918-7-masahiroy@kernel.org>
In-Reply-To: <20220501084032.1025918-7-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 May 2022 14:49:24 -0700
Message-ID: <CAKwvOdnaFo6uvMEcKwX_jy610XymkMc9GczokYWYWBqeP8zQ2A@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] modpost: traverse unresolved symbols in order
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 1, 2022 at 1:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, modpost manages unresolved in a singly linked list; it adds
> a new node to the head, and traverses the list from new to old.
>
> Use a doubly linked list to keep the order in the symbol table in the
> ELF file.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> (no changes since v1)

Technically, you added a comment. :P
https://lore.kernel.org/linux-kbuild/20220424190811.1678416-11-masahiroy@kernel.org/

>
>  scripts/mod/modpost.c | 20 ++++++++++++++------
>  scripts/mod/modpost.h |  2 +-
>  2 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index abcdb0677775..c7dda4cfa497 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -185,6 +185,8 @@ static struct module *new_module(const char *modname)
>         mod = NOFAIL(malloc(sizeof(*mod) + strlen(modname) + 1));
>         memset(mod, 0, sizeof(*mod));
>
> +       INIT_LIST_HEAD(&mod->unresolved_symbols);
> +
>         strcpy(mod->name, modname);
>         mod->is_vmlinux = (strcmp(modname, "vmlinux") == 0);
>
> @@ -207,6 +209,7 @@ static struct module *new_module(const char *modname)
>
>  struct symbol {
>         struct symbol *next;
> +       struct list_head list;  /* link to module::unresolved_symbols */

Thanks. ;)
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
