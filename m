Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2065870C50A
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 May 2023 20:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbjEVSS4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 May 2023 14:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjEVSSv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 May 2023 14:18:51 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73020E0
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 11:18:50 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-62382e86f81so26901196d6.2
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 11:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684779529; x=1687371529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfCl/q0lnMFVzeoXQBHsRhgnAiGWVN45O+/4BXR2WFM=;
        b=F2XDZBBgaxtF0+nDlHaemGEgCHnxW+dkQ/vjjZ+Ycux+dwAojLXlUwODMKL7MNtnsa
         o0E/RaDtfVSRos68hWeFlqKqZCiJHMsPYDBP3+Mj1DX6jWTV1e7wQ/WTmdyABJ5aZYdS
         hON9+SMs/0P9sPeIkI5O7CawVYL10brM61TrobD13RJ/SSSVeRsdfC6xvEWnZLM8ybBH
         LsYM78rkCWvx4rJvzhzKU6iVSDVMrRLLdtCzjWUwgiSPIlEXrjQyYyy+GzNw/WSKTVXZ
         B9WTkqsapFRfBY90SXDRvJq9we6tUTryv/HLet+rVTHYii7m4jPubipZmTeEna9SR23Q
         nNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684779529; x=1687371529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfCl/q0lnMFVzeoXQBHsRhgnAiGWVN45O+/4BXR2WFM=;
        b=P9ljndEGUaHOmkoSEu6zN6OnJtytfDLntibdWzr7FZ7DBQfDU4nO4FGMaFmwgGaMN6
         xNnk8F3y0urvjgxq2gSNbd4Yoed8E5lVL0XuLOohsnea5qdn7T8NZ8Y83k7izgjtjCPG
         RicnLMTbjNuCG2p4sdbTIUK7Oaw0qDri5J+XEaDDGMYi6DJKnIWyRjBopLW8LottJJ2J
         SXL9sV+gmFuuAZt232OdWWoyeeVWmVe95jxaCxCanG2jy2ida4ELHjO7afTVni4ZiebN
         pSCj2/hPeEbL9Bf6jAQoC2v4KUyQgfQ0kgK1z6Oeznd0NMPtdRk1zIHEkK5cx8lWMhPA
         j/iQ==
X-Gm-Message-State: AC+VfDwTL7/CenxHYe8m67v3D6HVmISVvq+dUyD2/lvCiR8gfdkx+Ltg
        WvqAnu4H9G5pbtya7gVSnFENWTVNpcoEUxuX3hDCLg==
X-Google-Smtp-Source: ACHHUZ7pTSMHOPupaMD5J4b5EOMOvJ8vDBnSYmS4MoKp4n9x4mlF8FgpRHiR5atwD0NIC8fTKwDxuVZPunJYdxJTlhw=
X-Received: by 2002:ad4:5dcd:0:b0:620:a1be:c74d with SMTP id
 m13-20020ad45dcd000000b00620a1bec74dmr17806967qvh.37.1684779529395; Mon, 22
 May 2023 11:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-6-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-6-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 May 2023 11:18:38 -0700
Message-ID: <CAKwvOdnXYrDf5zuv4_NZcbay7Bckd8d-MadX43Ek3Nhb1AKpaw@mail.gmail.com>
Subject: Re: [PATCH v6 05/20] modpost: refactor find_fromsym() and find_tosym()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, May 21, 2023 at 9:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> find_fromsym() and find_tosym() are similar - both of them iterate
> in the .symtab section and return the nearest symbol.
>
> The difference between them is that find_tosym() allows a negative
> distance, but the distance must be less than 20.
>
> Factor out the common part into find_nearest_sym().
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v6:
>   - Revive the check for distance less than 20
>
>  scripts/mod/modpost.c | 95 ++++++++++++++++---------------------------
>  1 file changed, 36 insertions(+), 59 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d2329ac32177..6ac0d571542c 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1104,81 +1104,58 @@ static inline int is_valid_name(struct elf_info *=
elf, Elf_Sym *sym)
>         return !is_mapping_symbol(name);
>  }
>
> -/**
> - * Find symbol based on relocation record info.
> - * In some cases the symbol supplied is a valid symbol so
> - * return refsym. If is_valid_name() =3D=3D true, we assume this is a va=
lid symbol.
> - * In other cases the symbol needs to be looked up in the symbol table
> - * based on section and address.
> - *  **/
> -static Elf_Sym *find_tosym(struct elf_info *elf, Elf64_Sword addr,
> -                          Elf_Sym *relsym)
> +/* Look up the nearest symbol based on the section and the address */
> +static Elf_Sym *find_nearest_sym(struct elf_info *elf, Elf_Addr addr,
> +                                unsigned int secndx, bool allow_negative=
,
> +                                Elf_Addr min_distance)
>  {
>         Elf_Sym *sym;
>         Elf_Sym *near =3D NULL;
> -       Elf64_Sword distance =3D 20;
> -       Elf64_Sword d;
> -       unsigned int relsym_secindex;
> -
> -       if (is_valid_name(elf, relsym))
> -               return relsym;
> -
> -       /*
> -        * Strive to find a better symbol name, but the resulting name do=
es not
> -        * always match the symbol referenced in the original code.
> -        */
> -       relsym_secindex =3D get_secindex(elf, relsym);
> -       for (sym =3D elf->symtab_start; sym < elf->symtab_stop; sym++) {
> -               if (get_secindex(elf, sym) !=3D relsym_secindex)
> -                       continue;
> -               if (ELF_ST_TYPE(sym->st_info) =3D=3D STT_SECTION)
> -                       continue;
> -               if (!is_valid_name(elf, sym))
> -                       continue;
> -               if (sym->st_value =3D=3D addr)
> -                       return sym;
> -               /* Find a symbol nearby - addr are maybe negative */
> -               d =3D sym->st_value - addr;
> -               if (d < 0)
> -                       d =3D addr - sym->st_value;
> -               if (d < distance) {
> -                       distance =3D d;
> -                       near =3D sym;
> -               }
> -       }
> -       /* We need a close match */
> -       if (distance < 20)
> -               return near;
> -       else
> -               return NULL;
> -}
> -
> -/*
> - * Find symbols before or equal addr and after addr - in the section sec=
.
> - * If we find two symbols with equal offset prefer one with a valid name=
.
> - * The ELF format may have a better way to detect what type of symbol
> - * it is, but this works for now.
> - **/
> -static Elf_Sym *find_fromsym(struct elf_info *elf, Elf_Addr addr,
> -                            unsigned int secndx)
> -{
> -       Elf_Sym *sym;
> -       Elf_Sym *near =3D NULL;
> -       Elf_Addr distance =3D ~0;
> +       Elf_Addr distance;
>
>         for (sym =3D elf->symtab_start; sym < elf->symtab_stop; sym++) {
>                 if (get_secindex(elf, sym) !=3D secndx)
>                         continue;
>                 if (!is_valid_name(elf, sym))
>                         continue;
> -               if (sym->st_value <=3D addr && addr - sym->st_value <=3D =
distance) {
> +
> +               if (addr >=3D sym->st_value)
>                         distance =3D addr - sym->st_value;
> +               else if (allow_negative)
> +                       distance =3D sym->st_value - addr;
> +               else
> +                       continue;
> +
> +               if (distance <=3D min_distance) {
> +                       min_distance =3D distance;
>                         near =3D sym;
>                 }
> +
> +               if (min_distance =3D=3D 0)
> +                       break;
>         }
>         return near;
>  }
>
> +static Elf_Sym *find_fromsym(struct elf_info *elf, Elf_Addr addr,
> +                            unsigned int secndx)
> +{
> +       return find_nearest_sym(elf, addr, secndx, false, ~0);
> +}
> +
> +static Elf_Sym *find_tosym(struct elf_info *elf, Elf_Addr addr, Elf_Sym =
*sym)
> +{
> +       /* If the supplied symbol has a valid name, return it */
> +       if (is_valid_name(elf, sym))
> +               return sym;
> +
> +       /*
> +        * Strive to find a better symbol name, but the resulting name do=
es not
> +        * always match the symbol referenced in the original code.
> +        */
> +       return find_nearest_sym(elf, addr, get_secindex(elf, sym), true, =
20);
> +}
> +
>  static bool is_executable_section(struct elf_info *elf, unsigned int sec=
ndx)
>  {
>         if (secndx > elf->num_sections)
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
