Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9AD122CC1A
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 19:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgGXRYy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 13:24:54 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:29184 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726625AbgGXRYx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 13:24:53 -0400
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 06OHOW59016668;
        Sat, 25 Jul 2020 02:24:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 06OHOW59016668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595611473;
        bh=bIixnEMAR0jpu0bkdEKJIWnyzdVnCrMQLsfoauhy0fQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=W2EWm1cc14fkW4PNArDHqu1LBD4fe2IusZG6QPFRbSfzz7M0LtWyFqUKPCXA341TG
         il+FgP81GniPKySpqsmlALQ7tF3ymvtkKp+irMGUwWBDFz8uBtu1c2lYf8L5yiXEen
         djEjwIfRNocZm8GrbY6Nj6FL0WOtqvtBkfPGnH0tgw3AjXU71wlpkW04v38l1h1f/a
         4+k+uf95HOXf82wFxseyb+v6qUqX1saNnGkDK5p9/XrNdjYF9BZsezQoY9n1bSXBOX
         n5qUk2ZCeIkSzfkVA/060ujOfd1xyDDx/XPTxrNA1OVcrQ/UMYMnCtjCg/Z8GSoYBY
         5w5N0qbxCu2TQ==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id t187so2380024vke.5;
        Fri, 24 Jul 2020 10:24:32 -0700 (PDT)
X-Gm-Message-State: AOAM533yb3THXWA3i5czVZBw1Z7zqc9nwzEAps1a27/SGJJZ+10+KPpX
        /CqKpNb49QDlPKzYA8fcYyb1+LAdDA3QVAEpN1M=
X-Google-Smtp-Source: ABdhPJzGY41nFJFYVQa7SB+bfB7R68BKKKKuv/lpK6zpHu7T7ky83qZV94n9m68mlcZz5TCDSXepblY5pu3C5TEWURw=
X-Received: by 2002:ac5:c74b:: with SMTP id b11mr8651746vkn.73.1595611471380;
 Fri, 24 Jul 2020 10:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200718063847.919599-1-masahiroy@kernel.org>
In-Reply-To: <20200718063847.919599-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Jul 2020 02:23:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNASqquXzfcd8KWE7HDZepLu9Y8t0G77OgZTEVM4DL=JuNw@mail.gmail.com>
Message-ID: <CAK7LNASqquXzfcd8KWE7HDZepLu9Y8t0G77OgZTEVM4DL=JuNw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: constify XPM data
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 18, 2020 at 3:39 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Constify arrays as well as strings.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>  scripts/kconfig/images.c | 30 +++++++++++++++---------------
>  scripts/kconfig/images.h | 30 +++++++++++++++---------------
>  2 files changed, 30 insertions(+), 30 deletions(-)
>
> diff --git a/scripts/kconfig/images.c b/scripts/kconfig/images.c
> index b4fa0e4a63a5..2f9afffa5d79 100644
> --- a/scripts/kconfig/images.c
> +++ b/scripts/kconfig/images.c
> @@ -5,7 +5,7 @@
>
>  #include "images.h"
>
> -const char *xpm_load[] = {
> +const char * const xpm_load[] = {
>  "22 22 5 1",
>  ". c None",
>  "# c #000000",
> @@ -35,7 +35,7 @@ const char *xpm_load[] = {
>  "###############.......",
>  "......................"};
>
> -const char *xpm_save[] = {
> +const char * const xpm_save[] = {
>  "22 22 5 1",
>  ". c None",
>  "# c #000000",
> @@ -65,7 +65,7 @@ const char *xpm_save[] = {
>  "..##################..",
>  "......................"};
>
> -const char *xpm_back[] = {
> +const char * const xpm_back[] = {
>  "22 22 3 1",
>  ". c None",
>  "# c #000083",
> @@ -93,7 +93,7 @@ const char *xpm_back[] = {
>  "......................",
>  "......................"};
>
> -const char *xpm_tree_view[] = {
> +const char * const xpm_tree_view[] = {
>  "22 22 2 1",
>  ". c None",
>  "# c #000000",
> @@ -120,7 +120,7 @@ const char *xpm_tree_view[] = {
>  "......................",
>  "......................"};
>
> -const char *xpm_single_view[] = {
> +const char * const xpm_single_view[] = {
>  "22 22 2 1",
>  ". c None",
>  "# c #000000",
> @@ -147,7 +147,7 @@ const char *xpm_single_view[] = {
>  "......................",
>  "......................"};
>
> -const char *xpm_split_view[] = {
> +const char * const xpm_split_view[] = {
>  "22 22 2 1",
>  ". c None",
>  "# c #000000",
> @@ -174,7 +174,7 @@ const char *xpm_split_view[] = {
>  "......................",
>  "......................"};
>
> -const char *xpm_symbol_no[] = {
> +const char * const xpm_symbol_no[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> @@ -191,7 +191,7 @@ const char *xpm_symbol_no[] = {
>  " .......... ",
>  "            "};
>
> -const char *xpm_symbol_mod[] = {
> +const char * const xpm_symbol_mod[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> @@ -208,7 +208,7 @@ const char *xpm_symbol_mod[] = {
>  " .......... ",
>  "            "};
>
> -const char *xpm_symbol_yes[] = {
> +const char * const xpm_symbol_yes[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> @@ -225,7 +225,7 @@ const char *xpm_symbol_yes[] = {
>  " .......... ",
>  "            "};
>
> -const char *xpm_choice_no[] = {
> +const char * const xpm_choice_no[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> @@ -242,7 +242,7 @@ const char *xpm_choice_no[] = {
>  "    ....    ",
>  "            "};
>
> -const char *xpm_choice_yes[] = {
> +const char * const xpm_choice_yes[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> @@ -259,7 +259,7 @@ const char *xpm_choice_yes[] = {
>  "    ....    ",
>  "            "};
>
> -const char *xpm_menu[] = {
> +const char * const xpm_menu[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> @@ -276,7 +276,7 @@ const char *xpm_menu[] = {
>  " .......... ",
>  "            "};
>
> -const char *xpm_menu_inv[] = {
> +const char * const xpm_menu_inv[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> @@ -293,7 +293,7 @@ const char *xpm_menu_inv[] = {
>  " .......... ",
>  "            "};
>
> -const char *xpm_menuback[] = {
> +const char * const xpm_menuback[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> @@ -310,7 +310,7 @@ const char *xpm_menuback[] = {
>  " .......... ",
>  "            "};
>
> -const char *xpm_void[] = {
> +const char * const xpm_void[] = {
>  "12 12 2 1",
>  "  c white",
>  ". c black",
> diff --git a/scripts/kconfig/images.h b/scripts/kconfig/images.h
> index d8ff614bd087..7212dec2006c 100644
> --- a/scripts/kconfig/images.h
> +++ b/scripts/kconfig/images.h
> @@ -10,21 +10,21 @@
>  extern "C" {
>  #endif
>
> -extern const char *xpm_load[];
> -extern const char *xpm_save[];
> -extern const char *xpm_back[];
> -extern const char *xpm_tree_view[];
> -extern const char *xpm_single_view[];
> -extern const char *xpm_split_view[];
> -extern const char *xpm_symbol_no[];
> -extern const char *xpm_symbol_mod[];
> -extern const char *xpm_symbol_yes[];
> -extern const char *xpm_choice_no[];
> -extern const char *xpm_choice_yes[];
> -extern const char *xpm_menu[];
> -extern const char *xpm_menu_inv[];
> -extern const char *xpm_menuback[];
> -extern const char *xpm_void[];
> +extern const char * const xpm_load[];
> +extern const char * const xpm_save[];
> +extern const char * const xpm_back[];
> +extern const char * const xpm_tree_view[];
> +extern const char * const xpm_single_view[];
> +extern const char * const xpm_split_view[];
> +extern const char * const xpm_symbol_no[];
> +extern const char * const xpm_symbol_mod[];
> +extern const char * const xpm_symbol_yes[];
> +extern const char * const xpm_choice_no[];
> +extern const char * const xpm_choice_yes[];
> +extern const char * const xpm_menu[];
> +extern const char * const xpm_menu_inv[];
> +extern const char * const xpm_menuback[];
> +extern const char * const xpm_void[];
>
>  #ifdef __cplusplus
>  }
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
