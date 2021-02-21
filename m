Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91A632093A
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 09:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhBUIsp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 03:48:45 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:63306 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhBUIso (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 03:48:44 -0500
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 11L8loiM000725;
        Sun, 21 Feb 2021 17:47:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 11L8loiM000725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613897270;
        bh=BSS3eTDyWT62pmJg+UVM56P/z1CrT+hpZLIdyuBm+wQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j52JnoT5lZSElu5nDxytNVEn5XtetIjD9OGyZf9zm+uhgvvi3wm93mKIzORDkfgqq
         18qcnVzCaJJKLa6D9hzvikzb54L6job8erIgBhuWor5xrQhj8V0UG1qb3akKqLmQpr
         4mHeixYXbawguhPOYMmlyfrw8tuxBkgS174Gl2lQSMlfS/fPByIQ5Eno02cNGcPSbC
         Uqk4sPMOt0vjqA6BLuVqbounFQDda79UfFaTB2BXA2Xk7psi0ZNcUqN0ndokpS2FD7
         OUBrS6V27W3AszszTtcOQHnHbczeoDBv4SrIoJIaCID/9a2DwZVc7W4uZiS9R038kP
         dEeuTOY+SKngw==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id t29so4680272pfg.11;
        Sun, 21 Feb 2021 00:47:50 -0800 (PST)
X-Gm-Message-State: AOAM533PFAh4eaRxUJzatmyQ3YO6JfYSAPGkqlhC5GeoMpsSkzmJwOwU
        fEJAZWpJguubOJZYIbwqCv4NpT5Zzz2r8NkE9p8=
X-Google-Smtp-Source: ABdhPJxRKKiy9YhFkAfJpv7h4IxQUBo8J1lripgDyCT+Wqo7p8qegE1QQmUhLvaeyGip+oHGvEB6IkfMyLLApjs0yDM=
X-Received: by 2002:a63:cc4f:: with SMTP id q15mr617682pgi.47.1613897269658;
 Sun, 21 Feb 2021 00:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20210215181511.2840674-1-mic@digikod.net> <20210215181511.2840674-3-mic@digikod.net>
In-Reply-To: <20210215181511.2840674-3-mic@digikod.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 21 Feb 2021 17:47:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS54Zw7d8Lp5BNs1JVktSLTFx0dNbLMA7W0U_sH2712_A@mail.gmail.com>
Message-ID: <CAK7LNAS54Zw7d8Lp5BNs1JVktSLTFx0dNbLMA7W0U_sH2712_A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kconfig: Ask user if string needs to be changed
 when dependency changed
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 16, 2021 at 3:14 AM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> Content of string configuration may depend on related kernel
> configurations.  Modify oldconfig and syncconfig to inform users about
> possible required configuration update and give them the opportunity to
> update it:
> * if dependencies of this string has changed (e.g. enabled or disabled),
> * and if the current value of this string is different than the (new)
>   default one.
>
> This is particularly relevant for CONFIG_LSM which contains a list of
> LSMs enabled at boot, but users will not have a chance to update this
> list with a make oldconfig.

If CONFIG_LSM already exists in the .config,
oldconfig does not show a prompt.
This is the expected behavior.

You are trying to fix your problem in a wrong way.
NACK.



>
> Cc: Casey Schaufler <casey@schaufler-ca.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Serge E. Hallyn <serge@hallyn.com>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20210215181511.2840674-3-mic@digikod.net
> ---
>  scripts/kconfig/conf.c | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 18a233d27a8d..8633dacd39a9 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -82,6 +82,26 @@ static void xfgets(char *str, int size, FILE *in)
>                 printf("%s", str);
>  }
>
> +static bool may_need_string_update(struct symbol *sym, const char *def)
> +{
> +       const struct symbol *dep_sym;
> +       const struct expr *e;
> +
> +       if (sym->type !=3D S_STRING)
> +               return false;
> +       if (strcmp(def, sym_get_string_default(sym)) =3D=3D 0)
> +               return false;
> +       /*
> +        * The user may want to synchronize the content of a string relat=
ed to
> +        * changed dependencies (e.g. CONFIG_LSM).
> +        */
> +       expr_list_for_each_sym(sym->dir_dep.expr, e, dep_sym) {
> +               if (dep_sym->flags & SYMBOL_CHANGED)
> +                       return true;
> +       }
> +       return false;
> +}
> +
>  static int conf_askvalue(struct symbol *sym, const char *def)
>  {
>         enum symbol_type type =3D sym_get_type(sym);
> @@ -102,7 +122,7 @@ static int conf_askvalue(struct symbol *sym, const ch=
ar *def)
>         switch (input_mode) {
>         case oldconfig:
>         case syncconfig:
> -               if (sym_has_value(sym)) {
> +               if (sym_has_value(sym) && !may_need_string_update(sym, de=
f)) {
>                         printf("%s\n", def);
>                         return 0;
>                 }
> @@ -137,8 +157,19 @@ static int conf_string(struct menu *menu)
>                 printf("%*s%s ", indent - 1, "", menu->prompt->text);
>                 printf("(%s) ", sym->name);
>                 def =3D sym_get_string_value(sym);
> -               if (def)
> -                       printf("[%s] ", def);
> +               if (def) {
> +                       if (may_need_string_update(sym, def)) {
> +                               indent +=3D 2;
> +                               printf("\n%*sDefault value is [%s]\n",
> +                                               indent - 1, "",
> +                                               sym_get_string_default(sy=
m));
> +                               printf("%*sCurrent value is [%s] ",
> +                                               indent - 1, "", def);
> +                               indent -=3D 2;
> +                       } else {
> +                               printf("[%s] ", def);
> +                       }
> +               }
>                 if (!conf_askvalue(sym, def))
>                         return 0;
>                 switch (line[0]) {
> --
> 2.30.0
>


--=20
Best Regards
Masahiro Yamada
