Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9CE580307
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jul 2022 18:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbiGYQnK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jul 2022 12:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236299AbiGYQnJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jul 2022 12:43:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E635DA1
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 09:43:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q23so5701095lfr.3
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 09:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GXN4LpbvWNFX8wB7bFkXQ9JIKeCsqQJeuvH6j+VamE=;
        b=TPKDQMzbZgN6H+Ftdpl/d2CbZ3dOR41Yd+IPC/laL4QqRJjOysTqT8QIwhZbrffX7X
         5Z7F/PBdnMSca6lEOHBKW5d1OFdVCsXJ+SGNbiHfhaWfICEfLuKqNRPT4O1sYTpAh4Wb
         v/4TCGjMp//GWe26w2moqZaozrOgRarYBe5oeosA15mAGVDZ8SM2IgcvUsaUeDrhMSoh
         A19vzL8jV4t7yfANUFrDgaDTGD6xJw3S20Jw5mtAFWztKOoft6+Lhg6jRnWcJayWJcDd
         ss0oUhDETHNFMojUC9KfVhIPJHHFm5RYRa8xQtG9LAv3X939LJ3z1RpsI/8MyHw4XY9Z
         Wkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GXN4LpbvWNFX8wB7bFkXQ9JIKeCsqQJeuvH6j+VamE=;
        b=yKPT0m+piqGJPSb2x0cxo6SD60WyNusrR/2MAHeA9ktEEojdikeH8OjqeEVuYsQEFC
         x0vDO/vv8kO/DEM7OX29mPPNZY2ZJ/xBiAr5c82khBUmEcTEOO4hTrnwV5hu6p9KmDXq
         tVmn0yJfDSkrGG33pglOLzvCPk3xi3fWS2z/se9DKiOfR3SMkaIEt13cD+5ndZYCHNSB
         sdoGi9ZTG9kjrqxtwwcnCSiptJahLS7lePcR8HpDJeuZ41OJCuWn6BeL3jX9lpsjZQNC
         iO26P24JM8X5hHVQs2RDgKdSoQLmt8izL1JgGHa82FkvZKcidrcGobtL/hPj/6yUiIsX
         lrFA==
X-Gm-Message-State: AJIora9owaBzi4PJK3HadDVXamyze/xwZobhseJwlFax3n5b6PvFagxm
        mkaKEdFwXxJXPR3kzlF16SRywB+Zb4fztrSa0OCMO3A/ui8=
X-Google-Smtp-Source: AGRyM1u4LwpNuQcu1clupnA8Af/UahPp2RV+KMGfCQyROw4AGJp8En2cKS+W4Z+fOHQP0sy6Gu3dzkyLOpdpNlLaNXw=
X-Received: by 2002:a05:6512:3e24:b0:48a:97af:d76e with SMTP id
 i36-20020a0565123e2400b0048a97afd76emr985048lfv.432.1658767386174; Mon, 25
 Jul 2022 09:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220610183236.1272216-1-masahiroy@kernel.org> <20220610183236.1272216-8-masahiroy@kernel.org>
In-Reply-To: <20220610183236.1272216-8-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 25 Jul 2022 09:42:53 -0700
Message-ID: <CAKwvOd=TCSWmG_sca9e49V-h3ZRdtP+cEazoO26vf475mJfyzg@mail.gmail.com>
Subject: Re: [PATCH 7/7] modpost: use null string instead of NULL pointer for
 default namespace
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Nicolas Pitre <npitre@baylibre.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 10, 2022 at 11:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The default namespace is the null string, "".
>
> When set, the null string "" is converted to NULL:
>
>   s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
>
> When printed, the NULL pointer is get back to the null string:
>
>   sym->namespace ?: ""
>
> This saves 1 byte memory allocated for "", but loses the readability.
>
> In kernel-space, we strive to save memory, but modpost is a userspace
> tool used to build the kernel. On modern systems, such small piece of
> memory is not a big deal.
>
> Handle the namespace string as is.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Sorry for the late review.  If this is still useful:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Feel free to ping me via mail if I'm falling behind. Otherwise you
should join us on IRC. (#clangbuiltlinux on libera)

> ---
>
>  scripts/mod/modpost.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0db2cbb74a2a..5a1785645943 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -296,6 +296,13 @@ static bool contains_namespace(struct list_head *head, const char *namespace)
>  {
>         struct namespace_list *list;
>
> +       /*
> +        * The default namespace is null string "", which is always implicitly
> +        * contained.
> +        */
> +       if (!namespace[0])
> +               return true;
> +
>         list_for_each_entry(list, head, list) {
>                 if (!strcmp(list->namespace, namespace))
>                         return true;
> @@ -371,7 +378,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>         s = alloc_symbol(name);
>         s->module = mod;
>         s->is_gpl_only = gpl_only;
> -       s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
> +       s->namespace = NOFAIL(strdup(namespace));
>         list_add_tail(&s->list, &mod->exported_symbols);
>         hash_add_symbol(s);
>
> @@ -2117,8 +2124,7 @@ static void check_exports(struct module *mod)
>                 else
>                         basename = mod->name;
>
> -               if (exp->namespace &&
> -                   !contains_namespace(&mod->imported_namespaces, exp->namespace)) {
> +               if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
>                         modpost_log(allow_missing_ns_imports ? LOG_WARN : LOG_ERROR,
>                                     "module %s uses symbol %s from namespace %s, but does not import it.\n",
>                                     basename, exp->name, exp->namespace);
> @@ -2201,7 +2207,7 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
>         list_for_each_entry(sym, &mod->exported_symbols, list)
>                 buf_printf(buf, "KSYMTAB_ENTRY(%s, \"%s\", \"%s\");\n",
>                            sym->name, sym->is_gpl_only ? "_gpl" : "",
> -                          sym->namespace ?: "");
> +                          sym->namespace);
>
>         if (!modversions)
>                 return;
> @@ -2471,7 +2477,7 @@ static void write_dump(const char *fname)
>                         buf_printf(&buf, "0x%08x\t%s\t%s\tEXPORT_SYMBOL%s\t%s\n",
>                                    sym->crc, sym->name, mod->name,
>                                    sym->is_gpl_only ? "_GPL" : "",
> -                                  sym->namespace ?: "");
> +                                  sym->namespace);
>                 }
>         }
>         write_buf(&buf, fname);
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
