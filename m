Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7BE546F5E
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jun 2022 23:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349206AbiFJVmJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Jun 2022 17:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350949AbiFJVmH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Jun 2022 17:42:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D777A441
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jun 2022 14:42:06 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a2so447887lfg.5
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jun 2022 14:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hTuTxAMjCajC/1vYQQYpCYbbAjPzudqNWU9h993rD9s=;
        b=tis3vvo11BQYB2E6Oe6sgEpUUdvySDAEHAmTA5sN8t8hLwD8OrV0zl1LSRWVLNGBQD
         2ms4/NuoNN8d7c85d6BAhws1lHMrlYszE0croUX07GJTqn+1kEsE/MKQ8NRGOEC9B1PV
         m6a4SCGWXQVDnFFDBEr9nV9FQ+1UbkIfonwAUumofP4MtAje4cDnmK7yjpDxLZ0XF0tJ
         0JkV3WnWO8LGE195rkgmfWcx6Xa9h82pJLsfQVRvRv3RBXhnylIhWF2YmSIMbz681N/R
         m09Hy+6t9JbACCnW3S4Low0Bs9RnwmtHhc0NKxR/oemYeRCskBMbpxduBdBsHGiPt0yX
         4B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hTuTxAMjCajC/1vYQQYpCYbbAjPzudqNWU9h993rD9s=;
        b=wcW3IXYV0wi5QdMI1x+80H7JinbEBxZTcqYCjVP9c8+F1+OADdie6/JnzMmaNQsWOc
         H8n2kP7DYAMS5tqQzIafIP1TmsXNvWS+VioH69oDs5FQ6unyEvylwKabBsDNz9+QTQeV
         N85sI9UNXqDU3yfIpuVLrA7NOvzd+H0aH/KpgdiwgwhewPQuV99VsihVe0epuEpBhGxk
         q3xU1Eg1JDejB9kEsyh+KGdJ2qnbc38C+RIcMs8tydV8lX1tu1Vcq/T0asTEjaNYzJRY
         v5MS95A3vVXsEYguYbjWYvui/AWk9x8JSMV36pPu5SglDQ5TQF2LB4wX+a77F80MqZ8a
         Z3Cw==
X-Gm-Message-State: AOAM532E13n/FGosFH6INCrr8Pil+jiYlfMkqImJ0DrFl8+a0XP0pEsm
        pKbFSm1FpQu0NtqXLnP1AJg+ad7VfLdY1zdmsihU2BozxNs=
X-Google-Smtp-Source: ABdhPJwU+oIxHw35O4RStA/C+Kb3V+Ogfc+yp0teH8QGDM6HLjVR4XKGUpms34V5zg5NaaQcgcd4YD0Z5qjPR/Ppdns=
X-Received: by 2002:ac2:5c44:0:b0:479:11e1:36f7 with SMTP id
 s4-20020ac25c44000000b0047911e136f7mr26779320lfp.432.1654897324408; Fri, 10
 Jun 2022 14:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220610183236.1272216-1-masahiroy@kernel.org> <20220610183236.1272216-3-masahiroy@kernel.org>
In-Reply-To: <20220610183236.1272216-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 10 Jun 2022 14:41:52 -0700
Message-ID: <CAKwvOdn+fYiiU=x7tqxp68Zkb3E88suEg6oNNucom3AehqayJA@mail.gmail.com>
Subject: Re: [PATCH 2/7] modpost: put get_secindex() call inside sec_name()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nicolas Pitre <npitre@baylibre.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
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

On Fri, Jun 10, 2022 at 11:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> There are 5 callsites of sec_name(). In all the places, sec_name() is
> used together with get_secindex().
>
> So, it is simpler to merge two function calls
>
>     sec_name(elf, get_secindex(elf, sym))
>
> into one call:
>
>     sec_name_of_symbol(elf, sym)
>
> While I was here, I also inserted this array range check:
>
>     if (secindex >= info->num_sections)
>             return "";
>
> This will make the code robust against info->sechdrs[] overrun.
>
> sym->st_shndx is 2 bytes (for both 32 and 64 bit systems), and the
> range 0xff00..0xffff is reserved for special sections.
>
> For example, a symbol specifies an absolute value, sym->st_shndx==0xfff1.
> get_secindex() remaps it to 0xfffffff1.
>
> There is no corresponding section header for such special sections.
>
> The existing code does not hit this issue, but it is better to check
> the array range.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 620dc8c4c814..b9f2a040f185 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -339,8 +339,19 @@ static const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr)
>                                       sechdr->sh_name);
>  }
>
> -static const char *sec_name(const struct elf_info *info, int secindex)
> +static const char *sec_name_of_symbol(const struct elf_info *info,
> +                                     const Elf_Sym *sym)
>  {
> +       unsigned int secindex = get_secindex(info, sym);
> +
> +       /*
> +        * If sym->st_shndx is within the special section range, get_secindex()
> +        * will remapit to a big number.
> +        * Bail out here, otherwise info->sechdrs[secindex] would overrun.
> +        */
> +       if (secindex >= info->num_sections)
> +               return "";
> +
>         return sech_name(info, &info->sechdrs[secindex]);
>  }
>
> @@ -649,7 +660,7 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
>                         const char *name, *secname;
>
>                         name = symname + strlen("__ksymtab_");
> -                       secname = sec_name(info, get_secindex(info, sym));
> +                       secname = sec_name_of_symbol(info, sym);
>
>                         if (strstarts(secname, "___ksymtab_gpl+"))
>                                 sym_add_exported(name, mod, true);
> @@ -1217,7 +1228,7 @@ static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
>
>                 if (is_shndx_special(sym->st_shndx))
>                         continue;
> -               symsec = sec_name(elf, get_secindex(elf, sym));
> +               symsec = sec_name_of_symbol(elf, sym);
>                 if (strcmp(symsec, sec) != 0)
>                         continue;
>                 if (!is_valid_name(elf, sym))
> @@ -1457,7 +1468,7 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
>         if (strstarts(fromsym, "reference___initcall"))
>                 return;
>
> -       tosec = sec_name(elf, get_secindex(elf, sym));
> +       tosec = sec_name_of_symbol(elf, sym);
>         to = find_elf_symbol(elf, r->r_addend, sym);
>         tosym = sym_name(elf, to);
>
> @@ -1559,7 +1570,7 @@ static void extable_mismatch_handler(const char* modname, struct elf_info *elf,
>                                      Elf_Rela* r, Elf_Sym* sym,
>                                      const char *fromsec)
>  {
> -       const char* tosec = sec_name(elf, get_secindex(elf, sym));
> +       const char *tosec = sec_name_of_symbol(elf, sym);
>
>         sec_mismatch_count++;
>
> @@ -1593,7 +1604,7 @@ static void extable_mismatch_handler(const char* modname, struct elf_info *elf,
>  static void check_section_mismatch(const char *modname, struct elf_info *elf,
>                                    Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
>  {
> -       const char *tosec = sec_name(elf, get_secindex(elf, sym));
> +       const char *tosec = sec_name_of_symbol(elf, sym);
>         const struct sectioncheck *mismatch = section_mismatch(fromsec, tosec);
>
>         if (mismatch) {
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
