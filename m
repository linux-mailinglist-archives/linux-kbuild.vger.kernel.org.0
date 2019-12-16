Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1DCF11FDAF
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2019 05:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbfLPEvq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 15 Dec 2019 23:51:46 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:21257 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfLPEvq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Dec 2019 23:51:46 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xBG4pRWG032169;
        Mon, 16 Dec 2019 13:51:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xBG4pRWG032169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576471888;
        bh=6LB9JX5u9pNojk2+Km2rVNYq+Xn8ESikPl8Zon4CPgg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e7VDOjpeBricUP/3td5eqDEasGLNdbXilA3H5/tSY2XaddDGa6w5dXE23R5YfXowN
         nULVPfiXSjY1pIkRk+PECpHejIPdI69wfkWO0AnzZL8mc//bAF1Jm6FMGkeu90CrdM
         rj+zAHcZ5LJANvySkZHwyBwCEfeb4fPBfSO9AcEeshXYbkmP2+raeJWgq/UNCwrbZw
         0SWOsZScyFPfk+zA9aTfNj6LvnqELtHisjWEfeJFePe+qYhlaziZXXvyj83E7hjYA6
         kPzKAX6BLxmvvcu3iDzU4Ss1qZoDy519gNAkhNMODphH4Rc6OfHtR2CWyzyGsOYUZG
         H8my0ikK1YaVg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id p6so3313589vsj.11;
        Sun, 15 Dec 2019 20:51:28 -0800 (PST)
X-Gm-Message-State: APjAAAXj0p0nQm1Y4X9VSkJtCdSomBuv2lP0daUxkCoDnuV+bSL5/343
        VjS93hw4/8unl5K0iOOcp1YMZgKr1/rZ1Dsc8oA=
X-Google-Smtp-Source: APXvYqyKu66A8VDllEdF/QRMjRmV9/NzixNZFUU1mkroxmDMqBPCkVdsyXl/FGBozMrbhcSwAZ95oAxKfSa2b1sJphM=
X-Received: by 2002:a67:b648:: with SMTP id e8mr14104264vsm.54.1576471887217;
 Sun, 15 Dec 2019 20:51:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575879069.git.tommyhebb@gmail.com> <9d43c96787ecbe2a3f2917483bbc61e378a1a7cf.1575879069.git.tommyhebb@gmail.com>
In-Reply-To: <9d43c96787ecbe2a3f2917483bbc61e378a1a7cf.1575879069.git.tommyhebb@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 16 Dec 2019 13:50:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSJ7kgmcLed7tFj774Lpn7hp94273h71Y8xrTvGoRY+A@mail.gmail.com>
Message-ID: <CAK7LNARSJ7kgmcLed7tFj774Lpn7hp94273h71Y8xrTvGoRY+A@mail.gmail.com>
Subject: Re: [PATCH 3/4] kconfig: distinguish between dependencies and
 visibility in help text
To:     Thomas Hebb <tommyhebb@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 9, 2019 at 5:19 PM Thomas Hebb <tommyhebb@gmail.com> wrote:
>
> Kconfig makes a distinction between dependencies (defined by "depends
> on" expressions and enclosing "if" blocks) and visibility (which
> includes all dependencies, but also includes inline "if" expressions of
> individual properties as well as, for prompts, "visible if" expressions
> of enclosing menus).
>
> Before bcdedcc1afd6 ("menuconfig: print more info for symbol without
> prompts", the "Depends on" lines of a symbol's help text indicated the
> visibility of the prompt property they appeared under. After
> bcdedcc1afd, there was always only a single "Depends on" line, which
> indicated the visibility of the first P_SYMBOL property of the symbol.
> Since P_SYMBOLs never have inline if expressions, this was in effect the
> same as the dependencies of the menu item that the P_SYMBOL was attached
> to.
>
> Neither of these situations accurately conveyed the dependencies of a
> symbol--the first because it was actually the visibility, and the second
> because it only showed the dependencies from a single definition.

Hmm, OK.

Commit bcdedcc1afd6 seemed to fix it as a side-effect,
but you broke it by 1/4, then fixed it again by 3/4.


Sample code:

menu "bar"
       visible if BAR
       depends on BAZ

config FOO
       bool "foo"

endmenu


Help of FOO:

Before bcdedcc1afd6  ->Depends on: BAZ && BAR
After    bcdedcc1afd6 -> Depends on: BAZ
After   1/4                   -> Depends on: BAZ && BAR
After   3/4                   -> Depends on: BAZ



I think "Depends on BAZ" is correct
since BAR only affects the visibility of the prompt.


In order to not break anything,
maybe, does it make sense to re-order, like this?

2/4, 3/4, 1/4, 4/4



> Now that we print a "Depends on" line for every definition (regardless
> of whether or not it has a prompt), we can do better: this patch
> switches the "Depends on" line for prompts to show the real dependencies
> of the corresponding menu item and additionally adds a "Visible if" line
> that shows the visibility only if the visibility is different from the
> dependencies (which it isn't for most prompts in Linux).
>
> Before:
>
>   Symbol: THUMB2_KERNEL [=n]
>   Type  : bool
>   Defined with prompt at arch/arm/Kconfig:1417
>     Prompt: Compile the kernel in Thumb-2 mode
>     Depends on: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n] && !CPU_THUMBONLY [=n]
>     Location:
>       -> Kernel Features
>     Selects: ARM_UNWIND [=n]
>
> After:
>
>    Symbol: THUMB2_KERNEL [=n]
>    Type  : bool
>    Defined with prompt at arch/arm/Kconfig:1417
>      Prompt: Compile the kernel in Thumb-2 mode
>      Depends on: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n]
>      Visible if: (CPU_V7 [=y] || CPU_V7M [=n]) && !CPU_V6 [=n] && !CPU_V6K [=n] && !CPU_THUMBONLY [=n]
>      Location:
>        -> Kernel Features
>      Selects: ARM_UNWIND [=n]
>
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> ---
>  scripts/kconfig/expr.c |  3 +--
>  scripts/kconfig/expr.h |  1 +
>  scripts/kconfig/menu.c | 12 +++++++++++-
>  3 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index 8284444cc3fa..849c574a28d5 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -13,7 +13,6 @@
>
>  #define DEBUG_EXPR     0
>
> -static int expr_eq(struct expr *e1, struct expr *e2);
>  static struct expr *expr_eliminate_yn(struct expr *e);
>
>  struct expr *expr_alloc_symbol(struct symbol *sym)
> @@ -250,7 +249,7 @@ void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
>   * equals some operand in the other (operands do not need to appear in the same
>   * order), recursively.
>   */
> -static int expr_eq(struct expr *e1, struct expr *e2)
> +int expr_eq(struct expr *e1, struct expr *e2)
>  {
>         int res, old_count;
>
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 017843c9a4f4..d0f17bc9c4ef 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -301,6 +301,7 @@ struct expr *expr_alloc_or(struct expr *e1, struct expr *e2);
>  struct expr *expr_copy(const struct expr *org);
>  void expr_free(struct expr *e);
>  void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
> +int expr_eq(struct expr *e1, struct expr *e2);
>  tristate expr_calc_value(struct expr *e);
>  struct expr *expr_trans_bool(struct expr *e);
>  struct expr *expr_eliminate_dups(struct expr *e);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 59fead4b8823..4d0542875d70 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -718,7 +718,17 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>                    prop->menu->file->name, prop->menu->lineno);
>         str_printf(r, "  Prompt: %s\n", prop->text);
>
> -       get_dep_str(r, prop->visible.expr, "  Depends on: ");
> +       get_dep_str(r, prop->menu->dep, "  Depends on: ");
> +       /* Most prompts in Linux have visibility that exactly matches their
> +        * dependencies. For these, we print only the dependencies to improve
> +        * readability. However, prompts with inline "if" expressions and
> +        * prompts with a parent that has a "visible if" expression have
> +        * differing dependencies and visibility. In these rare cases, we
> +        * print both. */
> +       if (!expr_eq(prop->menu->dep, prop->visible.expr)) {
> +               get_dep_str(r, prop->visible.expr, "  Visible if: ");
> +       }
> +


The code looks correct to me.

Just a nit: could you fix up the block comment style?


    /*
     *  Blah, blah...
     *  Blah, blah...
     */




>         menu = prop->menu->parent;
>         for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
>                 bool accessible = menu_is_visible(menu);
> --
> 2.24.0
>


--
Best Regards

Masahiro Yamada
