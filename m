Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4CF4F1CC4
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Apr 2022 23:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376399AbiDDV2y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Apr 2022 17:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379351AbiDDRCS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Apr 2022 13:02:18 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4B040A1E
        for <linux-kbuild@vger.kernel.org>; Mon,  4 Apr 2022 10:00:20 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bu29so18580711lfb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Apr 2022 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lpp/ozNVnLdvnoTjipCF69sWorB9Ss1eoVxFTqOHzco=;
        b=qAhAC/REUCwi7i3+1Gzc40RTeFOiNy1TlboqLpEisLYhnCJAXa/9lqOZs0rTOp+HJE
         QoU2M14FdHiKF46PXJpMy1tdEME2DFFpHWb7R01Fa04jlSB8cySJIUtzZoqBqslP6nmr
         yKULXcsaq4XnX1xzQAML0+xQc/vc6at+3asgvxssszq0WDVIRxlQU8KubeeFk3eA/Ll2
         Mg0PXahhIMhtmt+u0ePYuOvJaiVjbD9xDfxtjauRZBKq+4VFE3uVKNqz2FvjJ2q27T49
         M2EFZ0XvWrd3dWcLtLtIXVHHA6KTPWHYNIB/IwiG3jfccSUrfHKl+CaSCriKsjK9BF9v
         s5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lpp/ozNVnLdvnoTjipCF69sWorB9Ss1eoVxFTqOHzco=;
        b=2qhRu7Ng+Jl3ETeCnzokN3qR9lsLw2xxz9viJFNaftKVN1joYEiYHnLbhth2i6hGG2
         48qlKvFKWaIJ2lsWdbYMb5DV5xzVBXR1iOYTvCQYMIPDWsO1/DjbXnA4DDjv8OzwY3st
         Pb+RMbK+jc3xdeO0ckpUhfOnkoUKXO1wMQsoy5NZ6pTgs6lQbHKngJdgPuF6myFplpz+
         etyFntP/yDFCyKzOtA2C4i/q+xucLVCIfIJ9bGwkdlIkWqORF3VzIVOkLocZtt0Ew6m7
         DUSce4th83ssfjrRdQUurAVxIUNhOSwXVW78tCoAHhHRHtYo3zW9RnkIlLizUZBeLZIh
         Ljvw==
X-Gm-Message-State: AOAM532YRMBDHztxnC3bXjYeh4wJhXrDjzu63F72XPxicTzKDa55iugc
        JXCkcNgh/5EEUIJskbg9xSzOdUNK7vMJ4h0wZFufdt+NHRXPoQ==
X-Google-Smtp-Source: ABdhPJyfnr321gXYxKVcADF7Mg84CJzjSsJG4frp9zc4ju7G/kp2QnXbgnN2lQQYDP3G7rnSfh9tJ0Rm+JoS9AD+qKE=
X-Received: by 2002:a05:6512:3092:b0:44a:e7bb:e961 with SMTP id
 z18-20020a056512309200b0044ae7bbe961mr303801lfd.190.1649091618372; Mon, 04
 Apr 2022 10:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220402130014.1417773-1-masahiroy@kernel.org>
In-Reply-To: <20220402130014.1417773-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 4 Apr 2022 10:00:07 -0700
Message-ID: <CAKwvOd=0-dka3RwFSZoizccotYkYZjZf3eyj1nQGKJu65M+S3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] modpost: remove useless export_from_sec()
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

On Sat, Apr 2, 2022 at 6:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> With commit 1743694eb235 ("modpost: stop symbol preloading for
> modversion CRC") applied, now export_from_sec() is useless.
>
> handle_symbol() is called for every symbol in the ELF.
>
> When 'symname' does not start with "__ksymtab", export_from_sec() is
> called, and the returned value is stored in 'export'.
>
> It is used in the last part of handle_symbol():
>
>                 if (strstarts(symname, "__ksymtab_")) {
>                         name = symname + strlen("__ksymtab_");
>                         sym_add_exported(name, mod, export);
>                 }
>
> 'export' is used only when 'symname' starts with "__ksymtab_".
>
> So, the value returned by export_from_sec() is never used.
>
> Remove this useless function. This makes further cleanups possible.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 17 +----------------
>  scripts/mod/modpost.h |  4 ----
>  2 files changed, 1 insertion(+), 20 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index ed9d056d2108..194ca9083c7a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -369,16 +369,6 @@ static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
>                 return export_unknown;
>  }
>
> -static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
> -{
> -       if (sec == elf->export_sec)
> -               return export_plain;
> -       else if (sec == elf->export_gpl_sec)
> -               return export_gpl;
> -       else
> -               return export_unknown;
> -}
> -
>  static const char *namespace_from_kstrtabns(const struct elf_info *info,
>                                             const Elf_Sym *sym)
>  {
> @@ -576,10 +566,7 @@ static int parse_elf(struct elf_info *info, const char *filename)
>                                 fatal("%s has NOBITS .modinfo\n", filename);
>                         info->modinfo = (void *)hdr + sechdrs[i].sh_offset;
>                         info->modinfo_len = sechdrs[i].sh_size;
> -               } else if (strcmp(secname, "__ksymtab") == 0)
> -                       info->export_sec = i;
> -               else if (strcmp(secname, "__ksymtab_gpl") == 0)
> -                       info->export_gpl_sec = i;
> +               }
>
>                 if (sechdrs[i].sh_type == SHT_SYMTAB) {
>                         unsigned int sh_link_idx;
> @@ -702,8 +689,6 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
>
>         if (strstarts(symname, "__ksymtab"))
>                 export = export_from_secname(info, get_secindex(info, sym));
> -       else
> -               export = export_from_sec(info, get_secindex(info, sym));
>
>         switch (sym->st_shndx) {
>         case SHN_COMMON:
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 0c47ff95c0e2..a85dcec3669a 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -25,7 +25,6 @@
>  #define Elf_Sym     Elf32_Sym
>  #define Elf_Addr    Elf32_Addr
>  #define Elf_Sword   Elf64_Sword
> -#define Elf_Section Elf32_Half
>  #define ELF_ST_BIND ELF32_ST_BIND
>  #define ELF_ST_TYPE ELF32_ST_TYPE
>
> @@ -40,7 +39,6 @@
>  #define Elf_Sym     Elf64_Sym
>  #define Elf_Addr    Elf64_Addr
>  #define Elf_Sword   Elf64_Sxword
> -#define Elf_Section Elf64_Half
>  #define ELF_ST_BIND ELF64_ST_BIND
>  #define ELF_ST_TYPE ELF64_ST_TYPE
>
> @@ -138,8 +136,6 @@ struct elf_info {
>         Elf_Shdr     *sechdrs;
>         Elf_Sym      *symtab_start;
>         Elf_Sym      *symtab_stop;
> -       Elf_Section  export_sec;
> -       Elf_Section  export_gpl_sec;
>         char         *strtab;
>         char         *modinfo;
>         unsigned int modinfo_len;
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
