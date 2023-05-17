Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01FE707381
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 23:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjEQVFX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 17:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjEQVFS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 17:05:18 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E0783D8
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:05:16 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-75795493bceso78994485a.3
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684357515; x=1686949515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cLxniotM/EM+5BVdPmo+voqQOwKYEzqgr0Ov5V8b34=;
        b=4hZ9r77l9hrxNktL3aLUI/qION3B1JjNoLQV76nV0wiyU7DX+YLRtd+I0NVUwHPfrP
         tb+5PuZn++o+y+55YXY9amWouZyqUuQ74Ez85oM8UHTFGndkKbX/RcJbCOiK9vb12rXa
         jSeZ2r2pIiJed6sOfpPDgItv8nS7CyFPkjLYPD3Qb34WXtz/GIBmXGYrBey1vrBwX1/y
         s46qa4IKqu/K/xyAzbMX7aMKiH97c1JNTThopU4NH0ZrcUnLFVJ2PY7Rju0hnNWCrtTr
         6Z8i1p3a6hdV8ADFcxoM2Hlk/jLKpkMEcriykwVzq8saTc9bBKPS6vtJhvY2JlKW7Gg3
         3ySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684357515; x=1686949515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cLxniotM/EM+5BVdPmo+voqQOwKYEzqgr0Ov5V8b34=;
        b=czIzF6w0Edmh4BO3ASe/LSn4MGVKi20b4uegd3ARpcesBGxQXOThtM8MfEWKbWvDDB
         +76ftcX51Dzker3h+5bbnjScNy//Tf9uhpSbDD2oY3OUp6ERgFmVshnR7I1SB+eqLUyb
         Uw2ObuxQAGg3AaLiK1eAqU3/TuZqMzzWzKz4SxCxFiROm/cVSf6RcGoA7qzKcxlKvq0U
         m1yqDgiCBSyZXlFLJHHftRqUWd6g+onHOvLZMWnpvIUqvDBYgLwzfz/+9mot30O+uHts
         MhH1L0NifJw7cQiajAalPK0Ngf7F+1IQGkJmGgJNUxpQKreTSzPcb/w2huIWcIkNFxR/
         0IqQ==
X-Gm-Message-State: AC+VfDyjcnTpi1o503MV7TPglTlPdFSwsURclVcUeSupcZz/Wmc/GNR1
        /FfYUe4YdMuBfmTV9Z4eIugM9mkwX/4jnTOhSyFpn3oSrCIReX4vdtk=
X-Google-Smtp-Source: ACHHUZ6YYuugFD1xROaho1IOfKDzyxOkZA8yoc2xmX64HCezJmw7RFImfaKeymZz/w1YG/fUCQz42DswiisyxamXTVE=
X-Received: by 2002:a05:6214:19cd:b0:623:832f:8b19 with SMTP id
 j13-20020a05621419cd00b00623832f8b19mr1873658qvc.20.1684357515156; Wed, 17
 May 2023 14:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230514152739.962109-1-masahiroy@kernel.org> <20230514152739.962109-10-masahiroy@kernel.org>
In-Reply-To: <20230514152739.962109-10-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 14:05:04 -0700
Message-ID: <CAKwvOd=4hN7niwmL5EmkwGASPJtqZwzHqqpcDSWOu5Lhx4yn8Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/21] modpost: pass section index to find_elf_symbol2()
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 14, 2023 at 8:28=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> find_elf_symbol2() converts the section index to the section name,
> then compares the two section names in each iteration. This is slow.
>
> It is faster to compare the section indices (i.e. integers) directly.

Good idea!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 2cc9c2a4aadc..3b7b78e69137 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1169,19 +1169,14 @@ static Elf_Sym *find_elf_symbol(struct elf_info *=
elf, Elf64_Sword addr,
>   * it is, but this works for now.
>   **/
>  static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
> -                                const char *sec)
> +                                unsigned int secndx)
>  {
>         Elf_Sym *sym;
>         Elf_Sym *near =3D NULL;
>         Elf_Addr distance =3D ~0;
>
>         for (sym =3D elf->symtab_start; sym < elf->symtab_stop; sym++) {
> -               const char *symsec;
> -
> -               if (is_shndx_special(sym->st_shndx))
> -                       continue;
> -               symsec =3D sec_name(elf, get_secindex(elf, sym));
> -               if (strcmp(symsec, sec) !=3D 0)
> +               if (get_secindex(elf, sym) !=3D secndx)
>                         continue;
>                 if (!is_valid_name(elf, sym))
>                         continue;
> @@ -1203,7 +1198,8 @@ static bool is_executable_section(struct elf_info *=
elf, unsigned int secndx)
>
>  static void default_mismatch_handler(const char *modname, struct elf_inf=
o *elf,
>                                      const struct sectioncheck* const mis=
match,
> -                                    Elf_Rela *r, Elf_Sym *sym, const cha=
r *fromsec,
> +                                    Elf_Rela *r, Elf_Sym *sym,
> +                                    unsigned int fsecndx, const char *fr=
omsec,
>                                      const char *tosec)
>  {
>         Elf_Sym *to;
> @@ -1211,7 +1207,7 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>         const char *tosym;
>         const char *fromsym;
>
> -       from =3D find_elf_symbol2(elf, r->r_offset, fromsec);
> +       from =3D find_elf_symbol2(elf, r->r_offset, fsecndx);
>         fromsym =3D sym_name(elf, from);
>
>         to =3D find_elf_symbol(elf, r->r_addend, sym);
> @@ -1267,7 +1263,8 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>  }
>
>  static void check_section_mismatch(const char *modname, struct elf_info =
*elf,
> -                                  Elf_Rela *r, Elf_Sym *sym, const char =
*fromsec)
> +                                  Elf_Rela *r, Elf_Sym *sym,
> +                                  unsigned int fsecndx, const char *from=
sec)
>  {
>         const char *tosec =3D sec_name(elf, get_secindex(elf, sym));
>         const struct sectioncheck *mismatch =3D section_mismatch(fromsec,=
 tosec);
> @@ -1275,7 +1272,8 @@ static void check_section_mismatch(const char *modn=
ame, struct elf_info *elf,
>         if (!mismatch)
>                 return;
>
> -       default_mismatch_handler(modname, elf, mismatch, r, sym, fromsec,=
 tosec);
> +       default_mismatch_handler(modname, elf, mismatch, r, sym, fsecndx,=
 fromsec,
> +                                tosec);
>  }
>
>  static unsigned int *reloc_location(struct elf_info *elf,
> @@ -1390,12 +1388,11 @@ static void section_rela(const char *modname, str=
uct elf_info *elf,
>         Elf_Rela *rela;
>         Elf_Rela r;
>         unsigned int r_sym;
> -       const char *fromsec;
> -
> +       unsigned int fsecndx =3D sechdr->sh_info;
> +       const char *fromsec =3D sec_name(elf, fsecndx);
>         Elf_Rela *start =3D (void *)elf->hdr + sechdr->sh_offset;
>         Elf_Rela *stop  =3D (void *)start + sechdr->sh_size;
>
> -       fromsec =3D sec_name(elf, sechdr->sh_info);
>         /* if from section (name) is know good then skip it */
>         if (match(fromsec, section_white_list))
>                 return;
> @@ -1434,7 +1431,7 @@ static void section_rela(const char *modname, struc=
t elf_info *elf,
>                 /* Skip special sections */
>                 if (is_shndx_special(sym->st_shndx))
>                         continue;
> -               check_section_mismatch(modname, elf, &r, sym, fromsec);
> +               check_section_mismatch(modname, elf, &r, sym, fsecndx, fr=
omsec);
>         }
>  }
>
> @@ -1445,12 +1442,11 @@ static void section_rel(const char *modname, stru=
ct elf_info *elf,
>         Elf_Rel *rel;
>         Elf_Rela r;
>         unsigned int r_sym;
> -       const char *fromsec;
> -
> +       unsigned int fsecndx =3D sechdr->sh_info;
> +       const char *fromsec =3D sec_name(elf, fsecndx);
>         Elf_Rel *start =3D (void *)elf->hdr + sechdr->sh_offset;
>         Elf_Rel *stop  =3D (void *)start + sechdr->sh_size;
>
> -       fromsec =3D sec_name(elf, sechdr->sh_info);
>         /* if from section (name) is know good then skip it */
>         if (match(fromsec, section_white_list))
>                 return;
> @@ -1493,7 +1489,7 @@ static void section_rel(const char *modname, struct=
 elf_info *elf,
>                 /* Skip special sections */
>                 if (is_shndx_special(sym->st_shndx))
>                         continue;
> -               check_section_mismatch(modname, elf, &r, sym, fromsec);
> +               check_section_mismatch(modname, elf, &r, sym, fsecndx, fr=
omsec);
>         }
>  }
>
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
