Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D30A9707423
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 23:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjEQVX7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 17:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjEQVX6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 17:23:58 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A37C65B9
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:23:31 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7577f03e131so81661485a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684358607; x=1686950607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqgJlmwIXkTICqIpwDKe5dbo23K/PgW7Vz+EkzokQ/E=;
        b=zCt7Ns3wvLsRfRS0hPXguBKjz7lh9PNocy4BrgojqKbFg2M0tPd8MRij7VWDf4OEVs
         KoowVoYQCFyRvUqDrLd77tjADIS29U7//SbObv04kPojUzIZnMFBcdMUc5Aw9r4wuEpl
         UM8/j6K/wGycm+mZSlAViY82nUjK3msUl2jmL543kp20c3gib66gHkG7JgOomtHGLyoR
         LlSSC2uTCuROmC6u+SuFJgk2T0hT/Ku2hJErmQRTRoxKuC3p2uqe8k3XC8CnntEzX6jV
         auttIOvqv40wpVE5tgBXDx6jqGFZPLZFlazrumLC+0O2XwTtNojPKYLmqokxexlf0G+w
         K8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358607; x=1686950607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqgJlmwIXkTICqIpwDKe5dbo23K/PgW7Vz+EkzokQ/E=;
        b=Jk73FB9ybHMi36p//rJNfM0BoWAW9JugFchXvHMWY3Xt5suRysFgsCmXgjni8DZA2X
         lTRq39xbNnu2Ko0pEw/UwC7/702zz7BLoGotrlIL4RjTLVTF/u6nnJar1+a7pgO8HDsD
         VU+aloLrxQIXFnrywfRDBjfxzfj21Iitt0u7SP3GhEQeHAuncvwjrNRXxD8t6NkrLq2O
         rV6+JRaRpzSJJhThfdJhBqehoCpRwqPOSH+jxfWE+k1odYyElZBqmEjrIfXOnlkmLne2
         B5TX0hrnJrtejQ/cT6kRIY6Njcf21XDtUoJynoUWS8Z9/CI9w1gdoLMdF/53Xm/4TcCy
         aMOQ==
X-Gm-Message-State: AC+VfDxcJR/OWwnbeXyAJODRT0ers8X207mGujHS2ZwHz0rLSfJIJ7w2
        DW4Hf+gnPXN21ySTVBxr0QaUAsCyrgIM/Fe9F27SXA==
X-Google-Smtp-Source: ACHHUZ5o+I6t6r81eQDA2GYLW8Ia0+9haRmUAHiADVlt4Ju1dGrw9pNePobAVdPY+SpWfMxt5uhl0dl9at2I5PeHxjw=
X-Received: by 2002:ad4:5baa:0:b0:623:4ca9:5b25 with SMTP id
 10-20020ad45baa000000b006234ca95b25mr1492600qvq.31.1684358606724; Wed, 17 May
 2023 14:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230514152739.962109-1-masahiroy@kernel.org> <20230514152739.962109-15-masahiroy@kernel.org>
In-Reply-To: <20230514152739.962109-15-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 14:23:16 -0700
Message-ID: <CAKwvOdkZgu7wmaxFMKKjY1WscWto=vU=KAEO-pVmJ8+zegWG4g@mail.gmail.com>
Subject: Re: [PATCH v5 14/21] modpost: remove is_shndx_special() check from section_rel(a)
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
> This check is unneeded. Without it, sec_name() will returns the null
> string "", then section_mismatch() will return immediately.
>
> Anyway, special section indices do not appear quite often in these
> loops.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Could almost eliminate is_shndx_special after this. I think there's
only one callsite after this? (I should check with the series applied;
this patch fails to apply on mainline if that's relevant for potential
merge conflicts).

Does doing that additional work speed things up though?

> ---
>
>  scripts/mod/modpost.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0ef9d6964b6a..28db215ecc71 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1370,7 +1370,6 @@ static int addend_mips_rel(struct elf_info *elf, El=
f_Shdr *sechdr, Elf_Rela *r)
>  static void section_rela(const char *modname, struct elf_info *elf,
>                          Elf_Shdr *sechdr)
>  {
> -       Elf_Sym  *sym;
>         Elf_Rela *rela;
>         Elf_Rela r;
>         unsigned int r_sym;
> @@ -1413,11 +1412,8 @@ static void section_rela(const char *modname, stru=
ct elf_info *elf,
>                                 continue;
>                         break;
>                 }
> -               sym =3D elf->symtab_start + r_sym;
> -               /* Skip special sections */
> -               if (is_shndx_special(sym->st_shndx))
> -                       continue;
> -               check_section_mismatch(modname, elf, sym,
> +
> +               check_section_mismatch(modname, elf, elf->symtab_start + =
r_sym,
>                                        fsecndx, fromsec, r.r_offset, r.r_=
addend);
>         }
>  }
> @@ -1425,7 +1421,6 @@ static void section_rela(const char *modname, struc=
t elf_info *elf,
>  static void section_rel(const char *modname, struct elf_info *elf,
>                         Elf_Shdr *sechdr)
>  {
> -       Elf_Sym *sym;
>         Elf_Rel *rel;
>         Elf_Rela r;
>         unsigned int r_sym;
> @@ -1472,11 +1467,8 @@ static void section_rel(const char *modname, struc=
t elf_info *elf,
>                 default:
>                         fatal("Please add code to calculate addend for th=
is architecture\n");
>                 }
> -               sym =3D elf->symtab_start + r_sym;
> -               /* Skip special sections */
> -               if (is_shndx_special(sym->st_shndx))
> -                       continue;
> -               check_section_mismatch(modname, elf, sym,
> +
> +               check_section_mismatch(modname, elf, elf->symtab_start + =
r_sym,
>                                        fsecndx, fromsec, r.r_offset, r.r_=
addend);
>         }
>  }
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
