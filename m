Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB1CC12F2DD
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 03:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgACCLX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Jan 2020 21:11:23 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:35986 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgACCLX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jan 2020 21:11:23 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0032B5Qu012901;
        Fri, 3 Jan 2020 11:11:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0032B5Qu012901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578017466;
        bh=upu24NLE1snKcWgRNKQYCdPnQQGwl7WkIqIrlHt44Eo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xvepVGvn3EkNyg3i+MPWM3c0zBKeSLQY9QKYjEQ193fg1bjip52IcR0FA53DQkIFR
         GH+yzeFncw/NjlPj4B7sftoYfFbwXraETOBeG2Pbxb75l6wAjYWLm7O2nquIbcMQPB
         +m8THHLIykWhsV6qEvAYpnBvCFR6fr9/3RYH6W0d9d9Z+TYS3g6uqJlidUuK/9Gom8
         3PobKeufJ0CFnBwXK1srZ/BlB2aYW0C84TE9no4EYO/L1kfNFBqYXuPpYEPXg09v+R
         gaeAhv6tmVLZJbYSQ0dLsQa51wewlMoCr2DTNnPYTECv7mdajCU4taXHG2nhSJRr4/
         DL88I/FYmSIEQ==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id b79so26536439vsd.9;
        Thu, 02 Jan 2020 18:11:06 -0800 (PST)
X-Gm-Message-State: APjAAAWj8GNtQqUxV/j3olNMFZzOQpcEWzgpX5B0AAtv1ZZj8nenwsF2
        H5vHpogZysjTFpp6wLHoTFGzCEsv878gkKQziNs=
X-Google-Smtp-Source: APXvYqxUXxzk2ylRi3uyucM5C8UkFT1XXDp2HaEIM2ygRSLfj3P7OCHnevb/H2qniViihW71ZaLLUfyKMjW6t0Zppsg=
X-Received: by 2002:a67:f8ca:: with SMTP id c10mr37710313vsp.54.1578017464841;
 Thu, 02 Jan 2020 18:11:04 -0800 (PST)
MIME-Version: 1.0
References: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org> <20200102231402.1052657-1-nivedita@alum.mit.edu>
In-Reply-To: <20200102231402.1052657-1-nivedita@alum.mit.edu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Jan 2020 11:10:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQrD4wcjqFTendbBGA2TXkbmxccRbv31HBCXz+J82w47g@mail.gmail.com>
Message-ID: <CAK7LNAQrD4wcjqFTendbBGA2TXkbmxccRbv31HBCXz+J82w47g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: restore prompt dependencies in help text
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Rob Landley <rob@landley.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 3, 2020 at 8:14 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
> prompts") moved some code from get_prompt_str to get_symbol_str so that
> dependency information for symbols without prompts could be shown.
>
> This code would be better copied rather than moved, as the change had
> the side-effect of not showing any extra dependencies that the prompt
> might have over the symbol.
>
> Put back a copy of the dependency printing code in get_prompt_str.
>
> The following is an example for NAMESPACES:
>
> Before:
>         Symbol: NAMESPACES [=y]
>         Type  : bool
>         Prompt: Namespaces support
>           Location:
>         (2) -> General setup
>           Defined at init/Kconfig:1064
>           Depends on: MULTIUSER [=y]
>
> After:
>         Symbol: NAMESPACES [=y]
>         Type  : bool
>         Prompt: Namespaces support
>           Editable if: MULTIUSER [=y] && EXPERT [=y]
>           Location:
>         (2) -> General setup
>           Defined at init/Kconfig:1064
>           Depends on: MULTIUSER [=y]
>
> Fixes: bcdedcc1afd6 ("menuconfig: print more info for symbol without prompts")
> Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
> ---


I had already applied the following patch;
https://patchwork.kernel.org/patch/11298143/

It it available in linux-next.




>  scripts/kconfig/menu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index d9d16469859a..6fbbe41302dc 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -706,6 +706,12 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>         struct jump_key *jump = NULL;
>
>         str_printf(r, "Prompt: %s\n", prop->text);
> +       if (!expr_is_yes(prop->visible.expr)) {
> +               str_append(r, "  Editable if: ");
> +               expr_gstr_print(prop->visible.expr, r);
> +               str_append(r, "\n");
> +       }
> +
>         menu = prop->menu->parent;
>         for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
>                 bool accessible = menu_is_visible(menu);
> --
> 2.24.1
>


-- 
Best Regards
Masahiro Yamada
