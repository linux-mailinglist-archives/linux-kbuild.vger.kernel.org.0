Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59885FCC17
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 18:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfKNRqx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 12:46:53 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:25658 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfKNRqx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:46:53 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xAEHkiSr031689;
        Fri, 15 Nov 2019 02:46:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xAEHkiSr031689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573753605;
        bh=RnTRkKRmwGrZIBYmr069B+wqrpCe/TPtwzUT5A13c6o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mOd1jL63I1IWjvuwOJTk5mJ98bAC/VCGnSMZ9vQeKZbVGLs8m+DklEYoo7OXvW/0T
         gMkYeVfEw+aywiRTrgnWG9+ZW37Ic3dNrrDv+15fYWfejjeTeaHCpCdF1xc/sTUQGm
         Ak9F7vhf4dzIt/yEJCWt8RUWffKMJeyXPaVuymCQGYPuj6JJpNty59yk2GDhOB2TOv
         LPTZ1mFXXEB32wTB18b9KgP/C1C35ljt3AbhHpn3J6ODxTkwojCsk1uzEz6jSjxyOO
         cMYAq3PQF2duKLgVwlAdjoZVwQ8iBGNYGJgRI6yllbZ4DxatmdK2C4PntvuMRUgq+e
         x7Fff6887qXPQ==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id k24so1686098vko.7;
        Thu, 14 Nov 2019 09:46:45 -0800 (PST)
X-Gm-Message-State: APjAAAW2bEOnal2h2hF4vltCXy5GvupaacE/C/GAB7hH7IiMGP0wEVc6
        0yctYfzz4FxxMvAfbj3M8H6UgzfDd5JKViaf6fI=
X-Google-Smtp-Source: APXvYqxCgx2Cksxrrex4Puc8fMIMYoKNsrErgHs9rWSi3zoIQdoaUCWi/iM6SBNnJoOGhnNsL9yX+m4vTWvedDQgaM4=
X-Received: by 2002:a1f:7387:: with SMTP id o129mr5885230vkc.73.1573753604038;
 Thu, 14 Nov 2019 09:46:44 -0800 (PST)
MIME-Version: 1.0
References: <20191114174226.7201-1-yamada.masahiro@socionext.com> <20191114174226.7201-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191114174226.7201-2-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 15 Nov 2019 02:46:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGjv7_bmhGGpOupFpRRvvaGetvaTszE09MBKz3Ob06fQ@mail.gmail.com>
Message-ID: <CAK7LNATGjv7_bmhGGpOupFpRRvvaGetvaTszE09MBKz3Ob06fQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] modpost: refactor namespace_from_kstrtabns() to not
 hard-code section name
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(+CC: Matthias, who might be interested)


On Fri, Nov 15, 2019 at 2:42 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, namespace_from_kstrtabns() relies on the fact that
> namespace strings are recorded in the __ksymtab_strings section.
> Actually, it is coded in include/linux/export.h, but modpost does
> not need to hard-code the section name.
>
> Elf_Sym::st_shndx holds the section number of the relevant section.
> Using it is a more portable way to find the namespace string.
>
> sym_get_value() takes care of it, so namespace_from_kstrtabns() can
> simply wrap it. Delete the unneeded info->ksymtab_strings .
>
> While I was here, I added more 'const' qualifiers to pointers.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/mod/modpost.c | 10 +++-------
>  scripts/mod/modpost.h |  1 -
>  2 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index cd885573daaf..d9418c58a8c0 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -356,10 +356,10 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
>                 return export_unknown;
>  }
>
> -static const char *namespace_from_kstrtabns(struct elf_info *info,
> -                                           Elf_Sym *kstrtabns)
> +static const char *namespace_from_kstrtabns(const struct elf_info *info,
> +                                           const Elf_Sym *sym)
>  {
> -       char *value = info->ksymtab_strings + kstrtabns->st_value;
> +       const char *value = sym_get_data(info, sym);
>         return value[0] ? value : NULL;
>  }
>
> @@ -601,10 +601,6 @@ static int parse_elf(struct elf_info *info, const char *filename)
>                         info->export_unused_gpl_sec = i;
>                 else if (strcmp(secname, "__ksymtab_gpl_future") == 0)
>                         info->export_gpl_future_sec = i;
> -               else if (strcmp(secname, "__ksymtab_strings") == 0)
> -                       info->ksymtab_strings = (void *)hdr +
> -                                               sechdrs[i].sh_offset -
> -                                               sechdrs[i].sh_addr;
>
>                 if (sechdrs[i].sh_type == SHT_SYMTAB) {
>                         unsigned int sh_link_idx;
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index fe6652535e4b..64a82d2d85f6 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -143,7 +143,6 @@ struct elf_info {
>         Elf_Section  export_gpl_sec;
>         Elf_Section  export_unused_gpl_sec;
>         Elf_Section  export_gpl_future_sec;
> -       char         *ksymtab_strings;
>         char         *strtab;
>         char         *modinfo;
>         unsigned int modinfo_len;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
