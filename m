Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D947510BFB
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Apr 2022 00:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347064AbiDZW0H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Apr 2022 18:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355391AbiDZW0G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Apr 2022 18:26:06 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F29A1FA47
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 15:22:58 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id q14so275300ljc.12
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 15:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bS50lQ+OCnAE3LR20TF2MlIX6nS7SmzMK5zhjqJwW1A=;
        b=skNN1ENqxn48xeTenWLfDiuBIJ/QllraVvrOnfNSw5nT4HsnWSgzy+Kas89MKS9vmB
         vlQD75x+lWvG7xZSxfl7T2xTPDEvlnexhx8AAj5zZ1amr1bS3kXFJoi+Llu/u1uePGLd
         P86rj8yok9Wxid7PdtVwVQ4thku210YQ6nffO5h8KCyTwm+n4qZS0IkgcDAUhskGvLsi
         vxVxXqg89iP0BH34xcKCs2guRPYAb/lBGejXo0yFyu4z5Dp3RZgVepaNpz2q6rvZXMVX
         IcYLybKP+zgU15sAzrkCWyHdLTqfsOrfi/nFxEk4rcA1JiZ0A0/y+ldj+aVmeWhbYDpW
         HTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bS50lQ+OCnAE3LR20TF2MlIX6nS7SmzMK5zhjqJwW1A=;
        b=tE7ZQEdjnCmkJNlsa/yfxlFMYBqpaGBnFVDg9zbLIKcjq2ljW2OQzXZHlR47x9ZAwE
         rd+FjJm+ba6jsIfzxj4lg+mCNmYtxCVvD7MBByEGnygn0/PwQXvMOS58mDtB0gCNdS3P
         xP7IMB1HyKhUeyMT0OdN/YWWBcWDu9WkBHeKk+Poqwpb3GTJy3mMHGdb00R9sa8ldMiN
         qp3oPPIFAflDZVppK7Vz3MCXHOsNztwwkNXmP8HiO1j3GLjXMAkqo44UpBxxf0/axBnx
         PsVFviE6l+o0E7DmkozWSN8R9P+FlXPeRa3/22VTHXkyVNkTKHJg8Yb503MRb2adTD+l
         MEpw==
X-Gm-Message-State: AOAM530LjT/RY7CE9Jc13kCUQv5i12n6XqAEXLSpbfTQHdjrD/bm7FRw
        tgjlrWxBMN/2hDOfZ5BOQcYAZUO7WVF4YQDQEiuL3HwsANM=
X-Google-Smtp-Source: ABdhPJyGJ3ao0WCxHGbRsehAR+RqhO62U8fOTlSepU+SrB9lfZMJtcq2Y4TdkEKBv7B8Ifj5eOqDuP8e8p3ag6IrleU=
X-Received: by 2002:a2e:9ec4:0:b0:24b:115c:aedb with SMTP id
 h4-20020a2e9ec4000000b0024b115caedbmr15508080ljk.235.1651011776144; Tue, 26
 Apr 2022 15:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-15-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-15-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Apr 2022 15:22:44 -0700
Message-ID: <CAKwvOdmH3pqf5WHtdv-6eJgQvWQOz1BTMA33QLL7t1wGzOxNnA@mail.gmail.com>
Subject: Re: [PATCH 14/27] modpost: dump Module.symvers in the same order of modules.order
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
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

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> modpost dumps the exported symbols into Module.symvers, but currently
> in random order because it iterates in the hash table.
>
> Add a linked list of exported symbols in struct module, so we can
> iterate on symbols per module.
>
> This commit makes Module.symvers much more readable; the outer loop in
> write_dump() iterates over the modules in the order of modules.order,
> and the inner loop dumps symbols in each module.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 27 ++++++++++++---------------
>  scripts/mod/modpost.h |  1 +
>  2 files changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index e23e416213bf..1793396e1323 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -185,6 +185,7 @@ static struct module *new_module(const char *modname)
>         mod = NOFAIL(malloc(sizeof(*mod) + strlen(modname) + 1));
>         memset(mod, 0, sizeof(*mod));
>
> +       INIT_LIST_HEAD(&mod->exported_symbols);
>         INIT_LIST_HEAD(&mod->unresolved_symbols);
>         INIT_LIST_HEAD(&mod->missing_namespaces);
>         INIT_LIST_HEAD(&mod->imported_namespaces);
> @@ -407,6 +408,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>
>         if (!s) {
>                 s = new_symbol(name, mod, export);
> +               list_add_tail(&s->list, &mod->exported_symbols);
>         } else if (!external_module || s->module->is_vmlinux ||
>                    s->module == mod) {
>                 warn("%s: '%s' exported twice. Previous export was in %s%s\n",
> @@ -2452,22 +2454,17 @@ static void read_dump(const char *fname)
>  static void write_dump(const char *fname)
>  {
>         struct buffer buf = { };
> -       struct symbol *symbol;
> -       const char *namespace;
> -       int n;
> +       struct module *mod;
> +       struct symbol *sym;
>
> -       for (n = 0; n < SYMBOL_HASH_SIZE ; n++) {
> -               symbol = symbolhash[n];
> -               while (symbol) {
> -                       if (!symbol->module->from_dump) {
> -                               namespace = symbol->namespace;
> -                               buf_printf(&buf, "0x%08x\t%s\t%s\t%s\t%s\n",
> -                                          symbol->crc, symbol->name,
> -                                          symbol->module->name,
> -                                          export_str(symbol->export),
> -                                          namespace ? namespace : "");
> -                       }
> -                       symbol = symbol->next;
> +       list_for_each_entry(mod, &modules, list) {
> +               if (mod->from_dump)
> +                       continue;
> +               list_for_each_entry(sym, &mod->exported_symbols, list) {
> +                       buf_printf(&buf, "0x%08x\t%s\t%s\t%s\t%s\n",
> +                                  sym->crc, sym->name, mod->name,
> +                                  export_str(sym->export),
> +                                  sym->namespace ?: "");
>                 }
>         }
>         write_buf(&buf, fname);
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 4cb955dda83f..5922b0c39bb7 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -112,6 +112,7 @@ buf_write(struct buffer *buf, const char *s, int len);
>  struct module {
>         struct list_head list;
>         int gpl_compatible;
> +       struct list_head exported_symbols;
>         struct list_head unresolved_symbols;
>         bool from_dump;         /* true if module was loaded from *.symvers */
>         bool is_vmlinux;
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
