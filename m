Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D1A70C534
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 May 2023 20:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbjEVSbt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 May 2023 14:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbjEVSbs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 May 2023 14:31:48 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CCD95
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 11:31:46 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-623a6c15aacso27147586d6.0
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 11:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684780306; x=1687372306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2ePywhxddrmGkoVQNp8eKUSoyJ0B6HoMDE+8yYxha4=;
        b=MmWyskyzTT43BPxqcPEfyDJ+eoeCV4JL1ubuSmB5fq6M8J/mjqK6AA9lB8HNLNC8Qm
         CQ9FKYEutoJx25Py/XqgxjzCfEd9RsM1HDM2SVRfXnOEr+CXc02bIboTVeIeMnvvHy++
         tk51lcdvVniNufq6ifqYVGxuwqMb/8cM/EoAgiZ8pwhnCTFpF9gRTUrire98vP7cB4TM
         tEmysSr81JLoTSvJwBO++Az9+tUx09bg5G+X8bGlG68E64Zf97cqQ2efLtc03rjrF6TH
         RlyKk5wNZUrbDnBl4nAevN/hqDyzQ7SVBV6Vp95+7Yb1PTED1DbCG/a8l5VKBbOOISNe
         wFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684780306; x=1687372306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2ePywhxddrmGkoVQNp8eKUSoyJ0B6HoMDE+8yYxha4=;
        b=Tr1XtfBzPr/VdiOBcO6OYW/sqQXez3lbGAKSbaXkSAITPdNE/sHxAnFRKLbXehDPKF
         07TnYBxa/ihKAkX6GqXbhjAKz3bDjWi658A7kxO3ZVK56KRjLIj3+IsIlhwwyrDRp+Ca
         xUTIzelcThYLAsh9lmO90wzQ/itm6oDaZUJE8vPm2VFWwP5LLGtGxDQ/xi7BWkl9uauc
         1uqoXv4AM6YJxGqCuI2bGSlZccKMPTb9qmDdAEf0gj9CsMAaWDrMTky4bJGgdU67Sbjz
         KOza13ljjdYc2avsDnaztoNxbsJkmTvy7e7IbvtDTX5oPxbWAtmPnkbumrU109+VFyEJ
         zREA==
X-Gm-Message-State: AC+VfDzCDpqdBnWium6dBtC8h7Np8vpNUo9hf4Ro6dvvET8GZUIhhk8D
        EZOh93MrQz9t4no+F17N38LnZD+2FEbbMpV/7Z6ciA==
X-Google-Smtp-Source: ACHHUZ7NmQDjwE7vLXaFibglhxBUgur25eZyr+zh4oJc7IxqXfsG83P36hQ0Fmove4N0Z0thmX5az082DLGfPgQwQyI=
X-Received: by 2002:a05:6214:c4e:b0:5ef:6eb6:e26e with SMTP id
 r14-20020a0562140c4e00b005ef6eb6e26emr19398983qvj.6.1684780305960; Mon, 22
 May 2023 11:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-8-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-8-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 May 2023 11:31:35 -0700
Message-ID: <CAKwvOdkTW_uYqpEUODzL7Qyavo2LeOGVb6Mg3Lofdu12mjN1rA@mail.gmail.com>
Subject: Re: [PATCH v6 07/20] modpost: replace r->r_offset, r->r_addend with
 faddr, taddr
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
> r_offset/r_addend holds the offset address from/to which a symbol is
> referenced. It is unclear unless you are familiar with ELF.
>
> Rename them to faddr, taddr, respectively. The prefix 'f' means 'from',
> 't' means 'to'.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Do you care to rewrap the parameter lists?
```
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4da96746a03b..8a787521963d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1115,8 +1115,8 @@ static bool is_executable_section(struct
elf_info *elf, unsigned int secndx)

 static void default_mismatch_handler(const char *modname, struct elf_info =
*elf,
                                     const struct sectioncheck* const misma=
tch,
-                                    Elf_Sym *tsym,
-                                    unsigned int fsecndx, const char
*fromsec, Elf_Addr faddr,
+                                    Elf_Sym *tsym, unsigned int fsecndx,
+                                    const char *fromsec, Elf_Addr faddr,
                                     const char *tosec, Elf_Addr taddr)
 {
        Elf_Sym *from;
@@ -1217,9 +1217,9 @@ static void check_export_symbol(struct module
*mod, struct elf_info *elf,
 }

 static void check_section_mismatch(struct module *mod, struct elf_info *el=
f,
-                                  Elf_Sym *sym,
-                                  unsigned int fsecndx, const char *fromse=
c,
-                                  Elf_Addr faddr, Elf_Addr taddr)
+                                  Elf_Sym *sym, unsigned int fsecndx,
+                                  const char *fromsec, Elf_Addr faddr,
+                                  Elf_Addr taddr)
 {
        const char *tosec =3D sec_name(elf, get_secindex(elf, sym));
        const struct sectioncheck *mismatch;
```
Either way:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


> ---
>
>  scripts/mod/modpost.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 7848bacd4b42..f364738a236e 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1166,18 +1166,18 @@ static bool is_executable_section(struct elf_info=
 *elf, unsigned int secndx)
>
>  static void default_mismatch_handler(const char *modname, struct elf_inf=
o *elf,
>                                      const struct sectioncheck* const mis=
match,
> -                                    Elf_Rela *r, Elf_Sym *tsym,
> -                                    unsigned int fsecndx, const char *fr=
omsec,
> -                                    const char *tosec)
> +                                    Elf_Sym *tsym,
> +                                    unsigned int fsecndx, const char *fr=
omsec, Elf_Addr faddr,
> +                                    const char *tosec, Elf_Addr taddr)
>  {
>         Elf_Sym *from;
>         const char *tosym;
>         const char *fromsym;
>
> -       from =3D find_fromsym(elf, r->r_offset, fsecndx);
> +       from =3D find_fromsym(elf, faddr, fsecndx);
>         fromsym =3D sym_name(elf, from);
>
> -       tsym =3D find_tosym(elf, r->r_addend, tsym);
> +       tsym =3D find_tosym(elf, taddr, tsym);
>         tosym =3D sym_name(elf, tsym);
>
>         /* check whitelist - we may ignore it */
> @@ -1204,7 +1204,7 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>                 break;
>         case EXTABLE_TO_NON_TEXT:
>                 warn("%s(%s+0x%lx): Section mismatch in reference to the =
%s:%s\n",
> -                    modname, fromsec, (long)r->r_offset, tosec, tosym);
> +                    modname, fromsec, (long)faddr, tosec, tosym);
>
>                 if (match(tosec, mismatch->bad_tosec))
>                         fatal("The relocation at %s+0x%lx references\n"
> @@ -1212,7 +1212,7 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>                               "Something is seriously wrong and should be=
 fixed.\n"
>                               "You might get more information about where=
 this is\n"
>                               "coming from by using scripts/check_extable=
.sh %s\n",
> -                             fromsec, (long)r->r_offset, tosec, modname)=
;
> +                             fromsec, (long)faddr, tosec, modname);
>                 else if (is_executable_section(elf, get_secindex(elf, tsy=
m)))
>                         warn("The relocation at %s+0x%lx references\n"
>                              "section \"%s\" which is not in the list of\=
n"
> @@ -1221,17 +1221,18 @@ static void default_mismatch_handler(const char *=
modname, struct elf_info *elf,
>                              "list of authorized sections to jump to on f=
ault.\n"
>                              "This can be achieved by adding \"%s\" to\n"
>                              "OTHER_TEXT_SECTIONS in scripts/mod/modpost.=
c.\n",
> -                            fromsec, (long)r->r_offset, tosec, tosec, to=
sec);
> +                            fromsec, (long)faddr, tosec, tosec, tosec);
>                 else
>                         error("%s+0x%lx references non-executable section=
 '%s'\n",
> -                             fromsec, (long)r->r_offset, tosec);
> +                             fromsec, (long)faddr, tosec);
>                 break;
>         }
>  }
>
>  static void check_section_mismatch(const char *modname, struct elf_info =
*elf,
> -                                  Elf_Rela *r, Elf_Sym *sym,
> -                                  unsigned int fsecndx, const char *from=
sec)
> +                                  Elf_Sym *sym,
> +                                  unsigned int fsecndx, const char *from=
sec,
> +                                  Elf_Addr faddr, Elf_Addr taddr)
>  {
>         const char *tosec =3D sec_name(elf, get_secindex(elf, sym));
>         const struct sectioncheck *mismatch =3D section_mismatch(fromsec,=
 tosec);
> @@ -1239,8 +1240,9 @@ static void check_section_mismatch(const char *modn=
ame, struct elf_info *elf,
>         if (!mismatch)
>                 return;
>
> -       default_mismatch_handler(modname, elf, mismatch, r, sym, fsecndx,=
 fromsec,
> -                                tosec);
> +       default_mismatch_handler(modname, elf, mismatch, sym,
> +                                fsecndx, fromsec, faddr,
> +                                tosec, taddr);
>  }
>
>  static unsigned int *reloc_location(struct elf_info *elf,
> @@ -1406,7 +1408,8 @@ static void section_rela(const char *modname, struc=
t elf_info *elf,
>                 /* Skip special sections */
>                 if (is_shndx_special(sym->st_shndx))
>                         continue;
> -               check_section_mismatch(modname, elf, &r, sym, fsecndx, fr=
omsec);
> +               check_section_mismatch(modname, elf, sym,
> +                                      fsecndx, fromsec, r.r_offset, r.r_=
addend);
>         }
>  }
>
> @@ -1464,7 +1467,8 @@ static void section_rel(const char *modname, struct=
 elf_info *elf,
>                 /* Skip special sections */
>                 if (is_shndx_special(sym->st_shndx))
>                         continue;
> -               check_section_mismatch(modname, elf, &r, sym, fsecndx, fr=
omsec);
> +               check_section_mismatch(modname, elf, sym,
> +                                      fsecndx, fromsec, r.r_offset, r.r_=
addend);
>         }
>  }
>
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
