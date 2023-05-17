Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A2E707360
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 22:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjEQU4A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 16:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjEQU4A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 16:56:00 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88848103
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 13:55:57 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-62382464ca3so5778456d6.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 13:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684356956; x=1686948956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l9MfvQ1LbpXKb0qCojhn9qKDV5d5hFenRL1TmxbHH8=;
        b=Knz462xVkWE5uNYmipkdgk4VEdCivx4Qe9rwo5X/nUFyg3XrKKiIsmpK9yuhPMI9OU
         SKOqFs+UmuXugzt7fzDWL1C7sGJixkewhyWAiWjG79KCkHnz1XgjZB9aODSc/Q/x8Zg6
         Ukw5t2KggPdqUYH3KI+JEwh/llo4wyYE9o2TxRZd2mgToaZxzbNao0i9b+QfpfEeV1Py
         fzyKsRj55qKiaWa+7BLqkXhT+VaF/5FjRs6vwj7ByxlAlySX26GDQxXWDBQSXlGjGXH+
         WExe4ciAlr845r0mKibJudKWldba433Mr5WAI2W26R+vBchsaH/zkOjQomCB7X4NYtHg
         MG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684356956; x=1686948956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7l9MfvQ1LbpXKb0qCojhn9qKDV5d5hFenRL1TmxbHH8=;
        b=FBtvoDqAeSg75jIZh+AuhHVKaY9i4a0flEeq8RDOaR4EZA5VfbYknG0xfqb8QxHMWQ
         fQh2iBNte/NAj6QjYidh/hM6qNlyurqLRh2LQ2I2CHohyvNVFiKMTMj7yYEgLssbEMn9
         S+Bi6c/nWQqTP94GebsJcyMvHs2VRjKj55c8tFgYMaTYEGeCl2lHXFaGOZL2HD4MZzUP
         az8L5NuzhdEAbBuSqmZs9fnRWs9lr/4VutUIp01K37o/QFQvfTLMMyuPejHrh+Cb11L+
         QAZCDRW8XhOn97frfXJVAHgGpgOk2kpx0/fNyqFpanhpWDw2JNHDTzqqSRgi6yLYWvvn
         Ob/Q==
X-Gm-Message-State: AC+VfDwTI+pPC/SXtQ41tPFq1jhjjOyfIaqhYTpH9xHDfVsNMFNdwfub
        ZgJlEQSk1LX63AtMi9JT1vPvCc3eDuXdahYAZDlBRA==
X-Google-Smtp-Source: ACHHUZ7EzZ7+N7y4O+euuKGRkYMG6UCj/6BdUmLbOGmZXwRuqgxBnQv29cEUcaXtYHsAvKRarhyqSOUbj1gi/lQT7uQ=
X-Received: by 2002:a05:6214:29ec:b0:5ce:6636:a45 with SMTP id
 jv12-20020a05621429ec00b005ce66360a45mr1839851qvb.25.1684356956521; Wed, 17
 May 2023 13:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230514152739.962109-1-masahiroy@kernel.org> <20230514152739.962109-8-masahiroy@kernel.org>
In-Reply-To: <20230514152739.962109-8-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 13:55:45 -0700
Message-ID: <CAKwvOdnve7EAPzdTy1eMnGwYgXpNj+dFAwB-t+7PFASDiaM_iw@mail.gmail.com>
Subject: Re: [PATCH v5 07/21] modpost: squash extable_mismatch_handler() into default_mismatch_handler()
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
> Merging these two reduces several lines of code. The extable section
> mismatch is already distinguished by EXTABLE_TO_NON_TEXT.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 84 ++++++++++++++-----------------------------
>  1 file changed, 26 insertions(+), 58 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0bda2f22c985..49357a716519 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -881,27 +881,14 @@ enum mismatch {
>   * targeting sections in this array (white-list).  Can be empty.
>   *
>   * @mismatch: Type of mismatch.
> - *
> - * @handler: Specific handler to call when a match is found.  If NULL,
> - * default_mismatch_handler() will be called.
> - *
>   */
>  struct sectioncheck {
>         const char *fromsec[20];
>         const char *bad_tosec[20];
>         const char *good_tosec[20];
>         enum mismatch mismatch;
> -       void (*handler)(const char *modname, struct elf_info *elf,
> -                       const struct sectioncheck* const mismatch,
> -                       Elf_Rela *r, Elf_Sym *sym, const char *fromsec);
> -
>  };
>
> -static void extable_mismatch_handler(const char *modname, struct elf_inf=
o *elf,
> -                                    const struct sectioncheck* const mis=
match,
> -                                    Elf_Rela *r, Elf_Sym *sym,
> -                                    const char *fromsec);
> -
>  static const struct sectioncheck sectioncheck[] =3D {
>  /* Do not reference init/exit code/data from
>   * normal code and data
> @@ -974,7 +961,6 @@ static const struct sectioncheck sectioncheck[] =3D {
>         .bad_tosec =3D { ".altinstr_replacement", NULL },
>         .good_tosec =3D {ALL_TEXT_SECTIONS , NULL},
>         .mismatch =3D EXTABLE_TO_NON_TEXT,
> -       .handler =3D extable_mismatch_handler,
>  }
>  };
>
> @@ -1255,60 +1241,42 @@ static void default_mismatch_handler(const char *=
modname, struct elf_info *elf,
>                      modname, tosym, tosec);
>                 break;
>         case EXTABLE_TO_NON_TEXT:
> -               fatal("There's a special handler for this mismatch type, =
we should never get here.\n");
> +               warn("%s(%s+0x%lx): Section mismatch in reference to the =
%s:%s\n",
> +                    modname, fromsec, (long)r->r_offset, tosec, tosym);
> +
> +               if (match(tosec, mismatch->bad_tosec))
> +                       fatal("The relocation at %s+0x%lx references\n"
> +                             "section \"%s\" which is black-listed.\n"
> +                             "Something is seriously wrong and should be=
 fixed.\n"
> +                             "You might get more information about where=
 this is\n"
> +                             "coming from by using scripts/check_extable=
.sh %s\n",
> +                             fromsec, (long)r->r_offset, tosec, modname)=
;
> +               else if (is_executable_section(elf, get_secindex(elf, sym=
)))
> +                       warn("The relocation at %s+0x%lx references\n"
> +                            "section \"%s\" which is not in the list of\=
n"
> +                            "authorized sections.  If you're adding a ne=
w section\n"
> +                            "and/or if this reference is valid, add \"%s=
\" to the\n"
> +                            "list of authorized sections to jump to on f=
ault.\n"
> +                            "This can be achieved by adding \"%s\" to\n"
> +                            "OTHER_TEXT_SECTIONS in scripts/mod/modpost.=
c.\n",
> +                            fromsec, (long)r->r_offset, tosec, tosec, to=
sec);
> +               else
> +                       error("%s+0x%lx references non-executable section=
 '%s'\n",
> +                             fromsec, (long)r->r_offset, tosec);
>                 break;
>         }
>  }
>
> -static void extable_mismatch_handler(const char* modname, struct elf_inf=
o *elf,
> -                                    const struct sectioncheck* const mis=
match,
> -                                    Elf_Rela* r, Elf_Sym* sym,
> -                                    const char *fromsec)
> -{
> -       const char* tosec =3D sec_name(elf, get_secindex(elf, sym));
> -       Elf_Sym *tosym =3D find_elf_symbol(elf, r->r_addend, sym);
> -       const char *tosym_name =3D sym_name(elf, tosym);
> -
> -       sec_mismatch_count++;
> -
> -       warn("%s(%s+0x%lx): Section mismatch in reference to the %s:%s\n"=
,
> -            modname, fromsec, (long)r->r_offset, tosec, tosym_name);
> -
> -       if (match(tosec, mismatch->bad_tosec))
> -               fatal("The relocation at %s+0x%lx references\n"
> -                     "section \"%s\" which is black-listed.\n"
> -                     "Something is seriously wrong and should be fixed.\=
n"
> -                     "You might get more information about where this is=
\n"
> -                     "coming from by using scripts/check_extable.sh %s\n=
",
> -                     fromsec, (long)r->r_offset, tosec, modname);
> -       else if (is_executable_section(elf, get_secindex(elf, sym)))
> -               warn("The relocation at %s+0x%lx references\n"
> -                    "section \"%s\" which is not in the list of\n"
> -                    "authorized sections.  If you're adding a new sectio=
n\n"
> -                    "and/or if this reference is valid, add \"%s\" to th=
e\n"
> -                    "list of authorized sections to jump to on fault.\n"
> -                    "This can be achieved by adding \"%s\" to\n"
> -                    "OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.\n",
> -                    fromsec, (long)r->r_offset, tosec, tosec, tosec);
> -       else
> -               error("%s+0x%lx references non-executable section '%s'\n"=
,
> -                     fromsec, (long)r->r_offset, tosec);
> -}
> -
>  static void check_section_mismatch(const char *modname, struct elf_info =
*elf,
>                                    Elf_Rela *r, Elf_Sym *sym, const char =
*fromsec)
>  {
>         const char *tosec =3D sec_name(elf, get_secindex(elf, sym));
>         const struct sectioncheck *mismatch =3D section_mismatch(fromsec,=
 tosec);
>
> -       if (mismatch) {
> -               if (mismatch->handler)
> -                       mismatch->handler(modname, elf,  mismatch,
> -                                         r, sym, fromsec);
> -               else
> -                       default_mismatch_handler(modname, elf, mismatch,
> -                                                r, sym, fromsec);
> -       }
> +       if (!mismatch)
> +               return;
> +
> +       default_mismatch_handler(modname, elf, mismatch, r, sym, fromsec)=
;
>  }
>
>  static unsigned int *reloc_location(struct elf_info *elf,
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
