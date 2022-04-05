Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C2A4F4F34
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Apr 2022 03:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444213AbiDFAmq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Apr 2022 20:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457660AbiDEQ23 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 12:28:29 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01DE7C166
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Apr 2022 09:26:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t25so24156157lfg.7
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Apr 2022 09:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9lWYY7De4WBUMiRj3mzR0cknXK+RlvIrzmLorqOc2As=;
        b=iTrCvQL9sM/MUivHYMPf4aKtiHgt6HV4/9ZxumavdEUbybx2Mmzfcw/oiSfdwl2Zrq
         EhD/G1ftARD2N/Y73EQR3VdBBRBM1j1TGf6b/V0CNMbJFcDDejOS2TPOPdF6bUKoRdd/
         7gNOYlS4qrA/eUNKW2E+uxCkxDs3ns4pTLN9k+vcChjjNvkW03CcLSzN/WmfM6/ohOtR
         5SRkfl97vN+215wkqt0YJ6VcHnqvaCD9K+8JqrAdaKCi5Expud2Nw9PXQZqYecntlWWg
         zv1exSe7AWGBQH3ORUB4oobs2mWIqmKVq21231/XSlykM7pqPzcetba6fb/VTDCumg0a
         Zh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9lWYY7De4WBUMiRj3mzR0cknXK+RlvIrzmLorqOc2As=;
        b=1p9rzhkuYjcXxTwz7Mc7oB1UzFXDoHo8+n1ikYm7piLKGOqCDL1grKfDURpfZenmII
         Zv5GLjS+5qnkZmlezqQ6NnCqNZJoVOAVZgQphihQOrAZtpqJDJC4PyOWjgOvlkh6hCWX
         BRLSvM0w6hZ0vtyxXCTEgZM4hsA6fwOQrF5xxwWum1NnsZQdCcgULc5L4kz3IPpxE+eP
         lH2doqJFtfjo79c1kb5bhFbACjDbakwub/8iOa738C3qlVKoHI+a5EOrcvQso4rz9UEc
         hfffpbGcvFXtvSLV0hLK1R0rzzyjyI40xw1q6hr0ETvFcEZTcT9HtjKRMRnmkX1rqsXe
         S4Kw==
X-Gm-Message-State: AOAM533rzX7UWA4R0OBz6qPaWfEntHwU+JyUEo78Yw7sFQjgu87degET
        3sHwmDESK2etOQu756I9cbYacA8Bis4gfS43is9giyWjqu+wiA==
X-Google-Smtp-Source: ABdhPJzm9QcSluyOhFjGMfELQHjTr0+RTq5+/AG1ZSda5FkvPasWSBysDU69ZMdlhv33y1Ls5e4uCGoXp6//pr3GG5Y=
X-Received: by 2002:a19:651d:0:b0:44a:b88a:b0b1 with SMTP id
 z29-20020a19651d000000b0044ab88ab0b1mr3328216lfb.380.1649175988738; Tue, 05
 Apr 2022 09:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220405113359.2880241-1-masahiroy@kernel.org> <20220405113359.2880241-7-masahiroy@kernel.org>
In-Reply-To: <20220405113359.2880241-7-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 5 Apr 2022 09:26:17 -0700
Message-ID: <CAKwvOdkC3RYjOPx-DS0fSCHsts1YGzotBOs4fTKTQk7WZWfBgg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] modpost: remove annoying namespace_from_kstrtabns()
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

On Tue, Apr 5, 2022 at 4:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> There are two call sites for sym_update_namespace().
>
> When the symbol has no namespace, s->namespace is set to NULL,
> but the conversion from "" to NULL is done in two different places.
>
> [1] read_symbols()
>
>   This gets the namespace from __kstrtabns_<symbol>. If the symbol has
>   no namespace, sym_get_data(info, sym) returns the empty string "".
>   namespace_from_kstrtabns() converts it to NULL before it is passed to
>   sym_update_namespace().
>
> [2] read_dump()
>
>   This gets the namespace from the dump file, *.symvers. If the symbol
>   has no namespace, the 'namespace' is the empty string "", which is
>   directly passed into sym_update_namespace(). The conversion from
>   "" to NULL is done in sym_update_namespace().
>
> namespace_from_kstrtabns() exists only for creating this inconsistency.
>
> By removing it, sym_update_namespace() is consistently passed with ""
> when the symbol has no namespace.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - new
>
>  scripts/mod/modpost.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 2a202764ff48..522d5249d196 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -369,13 +369,6 @@ static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
>                 return export_unknown;
>  }
>
> -static const char *namespace_from_kstrtabns(const struct elf_info *info,
> -                                           const Elf_Sym *sym)
> -{
> -       const char *value = sym_get_data(info, sym);
> -       return value[0] ? value : NULL;
> -}
> -
>  static void sym_update_namespace(const char *symname, const char *namespace)
>  {
>         struct symbol *s = find_symbol(symname);
> @@ -391,8 +384,7 @@ static void sym_update_namespace(const char *symname, const char *namespace)
>         }
>
>         free(s->namespace);
> -       s->namespace =
> -               namespace && namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
> +       s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
>  }
>
>  /**
> @@ -2049,9 +2041,7 @@ static void read_symbols(const char *modname)
>                 /* Apply symbol namespaces from __kstrtabns_<symbol> entries. */
>                 if (strstarts(symname, "__kstrtabns_"))
>                         sym_update_namespace(symname + strlen("__kstrtabns_"),
> -                                            namespace_from_kstrtabns(&info,
> -                                                                     sym));
> -
> +                                            sym_get_data(&info, sym));
>                 if (strstarts(symname, "__crc_"))
>                         handle_modversion(mod, &info, sym,
>                                           symname + strlen("__crc_"));
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
