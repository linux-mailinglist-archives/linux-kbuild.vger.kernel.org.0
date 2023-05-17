Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D05C7073D7
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 23:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjEQVP3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 17:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjEQVPD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 17:15:03 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABFDC8695
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:14:56 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-62381fe42b3so6072276d6.0
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684358090; x=1686950090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/UDshlYMhETGULfkRrgD+JuGa+CGdea1mThx2z5Su4=;
        b=aiZXg/57wbN2dPigF7ZEAnt1bLEr0+EkXv5tno+1mzBI8/2zm0ZRKZ6fXMm+/3JDxf
         pURP/paJyY2BFBZ/FVzV2avaqijUdeaw+7UxKKJswmA1o5VvWbgooVrEhF2YxdcejuuX
         /6zwiYFwdkcxoLiPrGAmvyTdf9Mr6a8j6R9lCbjYXC0Cc6F/eE1uSpWd70k45ET71mdb
         V//PtAoisuohwR02bPMc1AkMw6rBChzu8l9FBYQcIdGdhUfX7uN9jeD6N62HjYpofFDW
         tSkseF4+B0gbO4lP3XSbBxCqGpYgMTCeURCTDbKa+QyvySyTWOdC2rp69j4eHeQlfFAm
         nFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358090; x=1686950090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/UDshlYMhETGULfkRrgD+JuGa+CGdea1mThx2z5Su4=;
        b=mI6JTiDZC8p/IIbLHUBJWMKMNf2C8a+RYUTOnqptQVKEQG6/potT9MQrAo90KJesG9
         1NACw/fbpT3sURM3NxdsKgNPlD/QaFKRhJgjqbqQfekUo0TBNomlyyQcD9/c6WUU3M5e
         q5k8QMSSunUYzSd2nNf6PahrZwkjqW94Y1UVUooX3UNya4T613B1iqTl0HS5XvgdKQAa
         wye10btK85Yc5wRoVaGzGYttOcAyTcX1FWqraSgL3g/KkV/1D+IcYVqRbhkqflvAj5ww
         OLxzwkty4ATgqvKi2VNxcosNzkn1QkHEIS+6LV1mscoRl/zcv4HMTncpdKd/ufp/R3cq
         TTyg==
X-Gm-Message-State: AC+VfDwrC4FgzkvbpuZaocsjTDg4q0W81losUGx8/vvDYJDjvWDyGkLZ
        YA7XG9zq/2zgO24mkgw1+4hjx9/v/qSMCAETrzVUIw==
X-Google-Smtp-Source: ACHHUZ6SC7EHtBR33soA7BCb7guA5Vlem1U3ixeI40PoHt9yvur4P2vLV0m2njmTyr2W1PY32lNX/I8SXOMJOoixEcU=
X-Received: by 2002:a05:6214:2a86:b0:623:9218:58e1 with SMTP id
 jr6-20020a0562142a8600b00623921858e1mr66310qvb.31.1684358089847; Wed, 17 May
 2023 14:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230514152739.962109-1-masahiroy@kernel.org> <20230514152739.962109-11-masahiroy@kernel.org>
In-Reply-To: <20230514152739.962109-11-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 14:14:39 -0700
Message-ID: <CAKwvOdmA1q1ojTWq79VK4HJqKfMHA=8VB9q61xJoKyYsegv3tg@mail.gmail.com>
Subject: Re: [PATCH v5 10/21] modpost: rename find_elf_symbol() and find_elf_symbol2()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>,
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

On Sun, May 14, 2023 at 8:28=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> find_elf_symbol() and find_elf_symbol2() are not good names.
>
> Rename them to find_tosym(), find_fromsym(), respectively.

The comments maybe could be updated, too. The end of the comment looks
wrong for both.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v5:
>   - Change the names
>
>  scripts/mod/modpost.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 3b7b78e69137..0d2c2aff2c03 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1124,8 +1124,8 @@ static inline int is_valid_name(struct elf_info *el=
f, Elf_Sym *sym)
>   * In other cases the symbol needs to be looked up in the symbol table
>   * based on section and address.
>   *  **/
> -static Elf_Sym *find_elf_symbol(struct elf_info *elf, Elf64_Sword addr,
> -                               Elf_Sym *relsym)
> +static Elf_Sym *find_tosym(struct elf_info *elf, Elf64_Sword addr,
> +                          Elf_Sym *relsym)
>  {
>         Elf_Sym *sym;
>         Elf_Sym *near =3D NULL;
> @@ -1168,8 +1168,8 @@ static Elf_Sym *find_elf_symbol(struct elf_info *el=
f, Elf64_Sword addr,
>   * The ELF format may have a better way to detect what type of symbol
>   * it is, but this works for now.
>   **/
> -static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
> -                                unsigned int secndx)
> +static Elf_Sym *find_fromsym(struct elf_info *elf, Elf_Addr addr,
> +                            unsigned int secndx)
>  {
>         Elf_Sym *sym;
>         Elf_Sym *near =3D NULL;
> @@ -1207,10 +1207,10 @@ static void default_mismatch_handler(const char *=
modname, struct elf_info *elf,
>         const char *tosym;
>         const char *fromsym;
>
> -       from =3D find_elf_symbol2(elf, r->r_offset, fsecndx);
> +       from =3D find_fromsym(elf, r->r_offset, fsecndx);
>         fromsym =3D sym_name(elf, from);
>
> -       to =3D find_elf_symbol(elf, r->r_addend, sym);
> +       to =3D find_tosym(elf, r->r_addend, sym);
>         tosym =3D sym_name(elf, to);
>
>         /* check whitelist - we may ignore it */
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
