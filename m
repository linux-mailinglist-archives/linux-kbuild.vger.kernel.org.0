Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3E87B5720
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Oct 2023 18:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238035AbjJBPzd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Oct 2023 11:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238061AbjJBPzc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2023 11:55:32 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7C0BD
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Oct 2023 08:55:29 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40566f8a093so136678785e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Oct 2023 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696262128; x=1696866928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYqu+Z03Xs4vwbPIqLMKJ2TemUcRXbZ6I5tCtedOo4s=;
        b=FWtggO99PQSK2nGMN3C5JHznPWC7lUUrN/x0Qe3/bqyLbnp4b7WViuxpaR7tApjNJj
         WjWuVtBg00l0e4vJQ/ADSARhOglIWpJiyK/oBEm+DmRMJVhXTveK8tAKONrP+/2sZlbP
         dO7T1MbZc8nXrout82zE9gxoB8E3y7+i5Pha/EgNjF+p43PRyk25hAdVVxYk0nO+fDeQ
         8Z95jZRHeAJgnLDGAl3AwSuJ8uQlaQzazyq8C7+t7+xV5ssIXdbXm5zC4VV68fRpgBte
         0flM+CF6tA/pmYxVoRxiYoFIJd6Dsea0uXMWi5tpBnKK/MhXm0JgM9kKk2zT7V1e/ZuP
         FAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696262128; x=1696866928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYqu+Z03Xs4vwbPIqLMKJ2TemUcRXbZ6I5tCtedOo4s=;
        b=dLBJl7DadFx0BtD7dRy8RBF1Wcx5ZXQhoRPVBmfXqPslfH4wMd40IfSaQ5ViZ8pdKL
         2adRwsFD2opi/rQyWp3K5/lSn9gYF4S2hXuamAECz3U2lzyUpBl2jDUhWSbrkJ/8EMSr
         8jWcfHA3tGQNkfyBRLYquve5B52j0qezBpnyowAfb4ckXUWOvMPYvsf0K7V0z/P/mPMV
         Pf4rJC1PwyXjQYGliYkLxJGiLS1nLmssgAJ1oP1Ag5xXS7eDL3oH94UPJUGzXgwWxsSn
         piwCONgRvinRhZcNX1C1z4RzlE9Ua6KtFsUlhg9YoaImCRC7Rp6fb/qgqGm+85vZrhw8
         0qRg==
X-Gm-Message-State: AOJu0YxljXkuErHTWplizQUl3I2lq3lh/daK1Z+a9/fiI22MDKaULw4m
        6l/3dRaOrPKsbHBFPAbKknR/VOQkM/oSiihWQBWJSflRr9MjrqdOTSc=
X-Google-Smtp-Source: AGHT+IFVXU7IFndvdZU7z42hZeKuGZo++DuxGIRlYbMuWWtegb7plk58/lpwS7uOgelf+I2qCurYgUPaHDWOngFOhBs=
X-Received: by 2002:a05:600c:2146:b0:405:458d:d54 with SMTP id
 v6-20020a05600c214600b00405458d0d54mr10914294wml.33.1696262127926; Mon, 02
 Oct 2023 08:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231001054736.1586001-1-masahiroy@kernel.org>
In-Reply-To: <20231001054736.1586001-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 2 Oct 2023 08:55:13 -0700
Message-ID: <CAKwvOd=9vxXWwtDxuAmhBO_-c9vhF1rwYyOo8e9EY2x2B1m-iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] modpost: refactor check_sec_ref()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Sep 30, 2023 at 10:47=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> We can replace &elf->sechdrs[i] with &sechdrs[i] to slightly shorten
> the code because we already have the local variable 'sechdrs'.
>
> However, defining 'sechdr' instead shortens the code further.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 2f3b0fe6f68d..15d78fe152ac 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1523,16 +1523,17 @@ static void section_rel(struct module *mod, struc=
t elf_info *elf,
>  static void check_sec_ref(struct module *mod, struct elf_info *elf)
>  {
>         int i;
> -       Elf_Shdr *sechdrs =3D elf->sechdrs;
>
>         /* Walk through all sections */
>         for (i =3D 0; i < elf->num_sections; i++) {
> -               check_section(mod->name, elf, &elf->sechdrs[i]);
> +               Elf_Shdr *sechdr =3D &elf->sechdrs[i];
> +
> +               check_section(mod->name, elf, sechdr);
>                 /* We want to process only relocation sections and not .i=
nit */
> -               if (sechdrs[i].sh_type =3D=3D SHT_RELA)
> -                       section_rela(mod, elf, &elf->sechdrs[i]);
> -               else if (sechdrs[i].sh_type =3D=3D SHT_REL)
> -                       section_rel(mod, elf, &elf->sechdrs[i]);
> +               if (sechdr->sh_type =3D=3D SHT_RELA)
> +                       section_rela(mod, elf, sechdr);
> +               else if (sechdr->sh_type =3D=3D SHT_REL)
> +                       section_rel(mod, elf, sechdr);
>         }
>  }
>
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
