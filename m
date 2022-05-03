Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBE45190EC
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 May 2022 00:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbiECWEr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 May 2022 18:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243395AbiECWEq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 May 2022 18:04:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC92742499
        for <linux-kbuild@vger.kernel.org>; Tue,  3 May 2022 15:01:12 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p12so32584016lfs.5
        for <linux-kbuild@vger.kernel.org>; Tue, 03 May 2022 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ea8ABMqaP/3IfqgpahDhXKU84+lj+SYl6kFyqPQMceA=;
        b=AH9YPAUVmiz2iuZbjpPDKdkQt+022DCzOP92I7vUL/eT3+o5GOyAtgOPpmge4UuirC
         +sZfPDGGZDXm0e650LP8nnh9j+rbv5Ku1eAMTssdmyN0hpFcqLI8gJ0JoYh1dv9IWXLq
         XCTvoJ3kynbKyPb/u2a8sRVUfyNUMNw8MTQDFMBNo6eTl5mL/Xb6QXVUZV1HgRz79Lti
         0Sblnt6FrMDUskK3uxzZp8I051OTw+tHup8Q/T6Nk5L23l3yxDDS7LmNuFHryX56Gbsw
         wf/yPeZr/YrpgmEn4E3x2wCSDlB9kSLzXT0Kn7HrOk3IhLaBrVOYoTqhkP1aOZF8yQKr
         +AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ea8ABMqaP/3IfqgpahDhXKU84+lj+SYl6kFyqPQMceA=;
        b=YFmZ4KCKC+KC0ZwhZPXOxtoO8weGnWo2lE7ky/4tkNgLe5b1B1X27FtnXH5A2m97sk
         QS/hmTd1JxfPxN79w+mgGSDGz/S5FetAk4CSKGfPTYGsrmn0hce3efs/pOwVjsMeSy4y
         9TJ/BfTTwZilq9NmjDFUlI5b9cihTChhVA419tUZDN/FZHon0gg5fWDbjqAydXk3UsYO
         QcdvfJCb8rebXxwz1uDLMe7l2vKQGRoQFJ3uOxSvyvubDHQ+StzMI1hb26ohCWlGODPb
         FKqNXUYxsqLfm44Fk9Ua7eBhQ3JPshYB9AFWXml3y7uDU554Bp9pNb+rIjahEBh93ADK
         x2tg==
X-Gm-Message-State: AOAM533/X4s19tswSDAjLZlk4FKFlR8+Zuxnzh1TBoN9pPD2iWVqzcUH
        HIkRbgQ7XrOzHLcvJRfcXHda0Z/QQjEO7MW6GjOpb4Ny/7E=
X-Google-Smtp-Source: ABdhPJxffvAuirc/Yl0IwGJeECgS6lRo3GxrjgRfTe3QJT6Cq/EQz5ilVvqPJUGgejfuRbwcW6bIIUFaImDQFTdjRYY=
X-Received: by 2002:a05:6512:48f:b0:472:3c47:94a0 with SMTP id
 v15-20020a056512048f00b004723c4794a0mr12166240lfq.579.1651615270964; Tue, 03
 May 2022 15:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220501084032.1025918-1-masahiroy@kernel.org> <20220501084032.1025918-14-masahiroy@kernel.org>
In-Reply-To: <20220501084032.1025918-14-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 May 2022 15:00:59 -0700
Message-ID: <CAKwvOdkRpspJtgeH1ojhM6=twOZ+KJOQGmbEj7OoU+g=BMxSZw@mail.gmail.com>
Subject: Re: [PATCH v2 13/26] modpost: split new_symbol() to symbol allocation
 and hash table addition
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
> new_symbol() does two things; allocate a new symbol and register it
> to the hash table.
>
> Using a separate function for each is easier to understand.
>
> Replace new_symbol() with hash_add_symbol(). Remove the second parameter
> of alloc_symbol().
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - New patch
>
>  scripts/mod/modpost.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index c9b75697d0fc..b9f359d10968 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -242,34 +242,31 @@ static inline unsigned int tdb_hash(const char *name)
>   * Allocate a new symbols for use in the hash of exported symbols or
>   * the list of unresolved symbols per module
>   **/
> -static struct symbol *alloc_symbol(const char *name, struct symbol *next)
> +static struct symbol *alloc_symbol(const char *name)
>  {
>         struct symbol *s = NOFAIL(malloc(sizeof(*s) + strlen(name) + 1));
>
>         memset(s, 0, sizeof(*s));
>         strcpy(s->name, name);
> -       s->next = next;
>         s->is_static = true;
>         return s;
>  }
>
>  /* For the hash of exported symbols */
> -static struct symbol *new_symbol(const char *name, struct module *module,
> -                                enum export export)

`module` was also previously unused! Yuck. Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +static void hash_add_symbol(struct symbol *sym)
>  {
>         unsigned int hash;
>
> -       hash = tdb_hash(name) % SYMBOL_HASH_SIZE;
> -       symbolhash[hash] = alloc_symbol(name, symbolhash[hash]);
> -
> -       return symbolhash[hash];
> +       hash = tdb_hash(sym->name) % SYMBOL_HASH_SIZE;
> +       sym->next = symbolhash[hash];
> +       symbolhash[hash] = sym;
>  }
>
>  static void sym_add_unresolved(const char *name, struct module *mod, bool weak)
>  {
>         struct symbol *sym;
>
> -       sym = alloc_symbol(name, NULL);
> +       sym = alloc_symbol(name);
>         sym->weak = weak;
>
>         list_add_tail(&sym->list, &mod->unresolved_symbols);
> @@ -418,10 +415,11 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>                       s->module->is_vmlinux ? "" : ".ko");
>         }
>
> -       s = new_symbol(name, mod, export);
> +       s = alloc_symbol(name);
>         s->module = mod;
>         s->export    = export;
>         list_add_tail(&s->list, &mod->exported_symbols);
> +       hash_add_symbol(s);
>
>         return s;
>  }
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
