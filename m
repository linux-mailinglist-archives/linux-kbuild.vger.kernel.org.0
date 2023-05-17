Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9FD707390
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 23:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjEQVK5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 17:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjEQVK4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 17:10:56 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BAAA55A9
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:10:53 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-757720be6abso71051785a.2
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684357852; x=1686949852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqERm9D0bAwhmEJfRiK7Aoajdd6d1YgkqbCyKJqmn14=;
        b=KRPFoGhSsGP4yX2ZPSamXSULdO/c2anC/Wecy4VZNxqj79a9tkTEc6740fPBGNuD6J
         ezOTCWmjfLuHExjDPv9YEuVCzlUJ2+8Jalxe90dOW2rBCtGaxR31ZMvh5k4dfmN8BGem
         ySX1GmGQVPDkTIeFHlr7NKyoXglzzkOYMqGIH/Z4fpSOarGP+0HHj8FFnYjNbQpKEKJ7
         sbrW11v1jCl2nleOQEjc121fbOrrjLlfDQVfV2YzZUmENpjWsRNV6x1LacK0PO0CXg/8
         efJJFmKA3+Z3UR5ni8M2vuTDJynVLDn7NCKXApopLXf7tJYdeEwv1FSeAklsOT4TvsLj
         XxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684357852; x=1686949852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqERm9D0bAwhmEJfRiK7Aoajdd6d1YgkqbCyKJqmn14=;
        b=ec9rn6WxZzxVc5draXu67gq2MBN0CQimo5JfVQvISGcQUU60Le30eqs4mocKBtqbR5
         awRBUSFxwjYygOi4GShdEP6K/dI17trI2HfpfsJAv36y9CkwDaoB/RobFDGkD7sDFRct
         zEnE4IOYhifQOPDxB9+XBrmHGjg79NfgNqENkWTLqJcQxIjRYu9MchdlYaWeF5WmzFql
         kWdnb0/1I6GNaacyvPTmPhI0aywkFYmJ6uaS42b8TLK1WHL3ADRjNndlACTzgv2kNJN4
         +lmE7RHEnnk1ONQ9B0ZzSbQVof3iKVmMe3tzZKmiAHudLjJ/lHyy6ootBCZl6C6nCb0B
         oZWA==
X-Gm-Message-State: AC+VfDx2Dln6YkZuls7AfvREPKHcPMgr9YuV4JszWaNGgaHIye0r2H/6
        3y+Vph3iJ0x+1jMgFEXoexIeQ+17UgH9xqcRzJl8d6UHOZsN0qBeWeM=
X-Google-Smtp-Source: ACHHUZ40QLqdDak2IAPPwRo77g26z/rbhausWywt1FX2JKt5svhpTolsyKiF1aEc0uPHu7f4+3fWFPW1LbTQZkD0FQU=
X-Received: by 2002:ad4:5d6f:0:b0:623:8925:b225 with SMTP id
 fn15-20020ad45d6f000000b006238925b225mr2042840qvb.39.1684357852078; Wed, 17
 May 2023 14:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230514152739.962109-1-masahiroy@kernel.org> <20230514152739.962109-7-masahiroy@kernel.org>
In-Reply-To: <20230514152739.962109-7-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 14:10:41 -0700
Message-ID: <CAKwvOdkQex2H4iDLE-D=4_vFebhB86aya6zPEB8rhaQy-HwspQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/21] modpost: clean up is_executable_section()
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
> SHF_EXECINSTR is a bit flag (#define SHF_EXECINSTR 0x4).
> Compare the masked flag to '!=3D 0'.
>
> There is no good reason to stop modpost immediately even if a special
> section index is given. You will get a section mismatch error anyway.
>
> Also, change the return type to bool.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Moving the definition and renaming the parameter seems very
unnecessary, but whatever. Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index bb7d1d87bae7..0bda2f22c985 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1207,6 +1207,14 @@ static Elf_Sym *find_elf_symbol2(struct elf_info *=
elf, Elf_Addr addr,
>         return near;
>  }
>
> +static bool is_executable_section(struct elf_info *elf, unsigned int sec=
ndx)
> +{
> +       if (secndx > elf->num_sections)
> +               return false;
> +
> +       return (elf->sechdrs[secndx].sh_flags & SHF_EXECINSTR) !=3D 0;
> +}
> +
>  static void default_mismatch_handler(const char *modname, struct elf_inf=
o *elf,
>                                      const struct sectioncheck* const mis=
match,
>                                      Elf_Rela *r, Elf_Sym *sym, const cha=
r *fromsec)
> @@ -1252,14 +1260,6 @@ static void default_mismatch_handler(const char *m=
odname, struct elf_info *elf,
>         }
>  }
>
> -static int is_executable_section(struct elf_info* elf, unsigned int sect=
ion_index)
> -{
> -       if (section_index > elf->num_sections)
> -               fatal("section_index is outside elf->num_sections!\n");
> -
> -       return ((elf->sechdrs[section_index].sh_flags & SHF_EXECINSTR) =
=3D=3D SHF_EXECINSTR);
> -}
> -
>  static void extable_mismatch_handler(const char* modname, struct elf_inf=
o *elf,
>                                      const struct sectioncheck* const mis=
match,
>                                      Elf_Rela* r, Elf_Sym* sym,
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
