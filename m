Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE52533296
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 May 2022 22:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241694AbiEXUsK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 May 2022 16:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238638AbiEXUsK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 May 2022 16:48:10 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A3374DD2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:48:08 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q1so12611851ljb.5
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7VF1h9VoAjTirhiTdduIUPLKqTj+n1pCpzbChlFIzhY=;
        b=n2Ms+d/2wyZrpq84XEvd1spFFzFVV5DC3dX27H3EnH0INSQBrRkDaGGliChTegAiRT
         MjFhrlI2Ssk5UuDUrM3ymBYmD10lwCG2p/vtWqksDNh/rfjqsWKR4bS7uaR6+a+0W1fo
         k4TlnYdpXaYMoNoDKdo4nhjKPYicW3iyx/UqkA5mphCFj7/IMhDcHdGAIOHqrkBGanAO
         FrWi+bV5nxmNlS6jUMryeebiHsx6TY+aymnM6giAfAZGgA3vSWfWRjBJhKymugS7Cns8
         0TV83mKGRjUI5EgOGXVPmT3cs4xPXyf0q4bQTFeRKFin5iwXgmhMD2ivzK5By/j1x/1V
         JRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7VF1h9VoAjTirhiTdduIUPLKqTj+n1pCpzbChlFIzhY=;
        b=eZe0GN/BrSAW1xaCrJxD2eMpxpUfUU9ZJb41igsh/Gwtxlb58Vhb9XlAUaXz7PRCzx
         PdpGRkOxlmVw0xR11JGYLz+IiBi4kZatYRq8MVERgDoinuiN1TGU4xEsxX/hWGToeZR6
         bShu8nTXCyWhNPH7QY+/zjS8TL1zFOmukWjN+3NqIRBbuxHL+HrcsbSgvZN/JezN+3x8
         o5ZGe3MoEPrZe/1SV2qKamhIesNfagPq8XlNC4ER3Mw2mtJ2pTbE9YzWwNwqo/2ro4gF
         ARXUZMRmfbwnpE1/gm8RPXa9orTP50arxnMh8bLgXfKLe7XRK2SAIB4JaO8xHq3om2Uu
         N5RQ==
X-Gm-Message-State: AOAM531npEvf0KlmC78hESjylFChrHtNMktBqlIdLOLG9f9gIqllXB5J
        2VgT6HxBJT0Okp2teYZv7W5Wya8DA0+PfA5Nil/o2A==
X-Google-Smtp-Source: ABdhPJyQO8qS6aGD8XnCH+3Zo+UOwCbzqSC96vwlTbaTtq667oU9uZ0xjiA6D4lx6SD4k6nIcMbrxGib2ITUyM88tn4=
X-Received: by 2002:a2e:b04d:0:b0:253:e5e3:ec1c with SMTP id
 d13-20020a2eb04d000000b00253e5e3ec1cmr9600787ljl.360.1653425286864; Tue, 24
 May 2022 13:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220523164626.858340-1-masahiroy@kernel.org> <20220523164626.858340-3-masahiroy@kernel.org>
In-Reply-To: <20220523164626.858340-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 May 2022 13:47:55 -0700
Message-ID: <CAKwvOdnCQUSOUHqL20nAFJ1FcUGQOSz9DWkyS5UU-8C9M-wcNA@mail.gmail.com>
Subject: Re: [PATCH 3/5] modpost: simplify mod->name allocation
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 23, 2022 at 9:48 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> mod->name is set to the ELF filename with the suffix ".o" stripped.
>
> The current code calls strdup() and free() to manipulate the string,
> but a simpler approach is to pass new_module() with the name length
> subtracted by 2.
>
> Also, check if the passed filename ends with ".o" before stripping it.
>
> The current code blindly chops the suffix
>
>     tmp[strlen(tmp) - 2] = '\0'
>
> but it will cause buffer under-run if strlen(tmp) < 2;
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 843c64eebe8b..77c315dea1a3 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -172,11 +172,11 @@ static struct module *find_module(const char *modname)
>         return NULL;
>  }
>
> -static struct module *new_module(const char *modname)
> +static struct module *new_module(const char *name, size_t namelen)
>  {
>         struct module *mod;
>
> -       mod = NOFAIL(malloc(sizeof(*mod) + strlen(modname) + 1));
> +       mod = NOFAIL(malloc(sizeof(*mod) + namelen + 1));
>         memset(mod, 0, sizeof(*mod));
>
>         INIT_LIST_HEAD(&mod->exported_symbols);
> @@ -184,8 +184,9 @@ static struct module *new_module(const char *modname)
>         INIT_LIST_HEAD(&mod->missing_namespaces);
>         INIT_LIST_HEAD(&mod->imported_namespaces);
>
> -       strcpy(mod->name, modname);
> -       mod->is_vmlinux = (strcmp(modname, "vmlinux") == 0);
> +       memcpy(mod->name, name, namelen);
> +       mod->name[namelen] = '\0';
> +       mod->is_vmlinux = (strcmp(mod->name, "vmlinux") == 0);
>
>         /*
>          * Set mod->is_gpl_compatible to true by default. If MODULE_LICENSE()
> @@ -2022,16 +2023,14 @@ static void read_symbols(const char *modname)
>         if (!parse_elf(&info, modname))
>                 return;
>
> -       {
> -               char *tmp;
> -
> -               /* strip trailing .o */
> -               tmp = NOFAIL(strdup(modname));
> -               tmp[strlen(tmp) - 2] = '\0';
> -               mod = new_module(tmp);
> -               free(tmp);
> +       if (!strends(modname, ".o")) {
> +               error("%s: filename must be suffixed with .o\n", modname);
> +               return;
>         }
>
> +       /* strip trailing .o */
> +       mod = new_module(modname, strlen(modname) - strlen(".o"));
> +
>         if (!mod->is_vmlinux) {
>                 license = get_modinfo(&info, "license");
>                 if (!license)
> @@ -2493,7 +2492,7 @@ static void read_dump(const char *fname)
>
>                 mod = find_module(modname);
>                 if (!mod) {
> -                       mod = new_module(modname);
> +                       mod = new_module(modname, strlen(modname));
>                         mod->from_dump = true;
>                 }
>                 s = sym_add_exported(symname, mod, gpl_only);
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
