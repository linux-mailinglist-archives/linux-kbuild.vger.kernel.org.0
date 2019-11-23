Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D52107D6C
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 08:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfKWHXC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 02:23:02 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:31571 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfKWHXC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 02:23:02 -0500
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id xAN7MvX8001395;
        Sat, 23 Nov 2019 16:22:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xAN7MvX8001395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574493777;
        bh=aM/gT4Oo9cCOwyO64fFZR4tsOde+IsTLsovdWiIejes=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=umt6GBmC22i+BZ03uEvybsl8X4EF0dekZ7/JBsNKiPp20sDX+wf6tMa2HCM1OARNR
         H4aq+t+A/dvEvKN7D1TsBZZUJA72v4v2l1CIsT/F2Z8Xs4RUZ7RVpucnX7F0cAS9i7
         nh5tR8ryQ9X7xMY1klgCJ4g2Kgqfp54uAKMXjaK6CJzYtOKdoTc+GBevRqwsxm6sMZ
         xLV6pzkrSw9rrojS4d6Uerwje7fP+rV473NegGjkyJNLScuqe78zHfZjNLfZZnla+a
         a6Q0L3O/Dy9zHlS2Mw6FC0H5bZXbbwUaw/WMkkwykPxcO+tsCi38DUN2h+XKpnHoHd
         j6q3WG8fXjnmw==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id x21so6474465vsp.6;
        Fri, 22 Nov 2019 23:22:57 -0800 (PST)
X-Gm-Message-State: APjAAAV+zguUwzppt7gOCjQ4RENU1SOvbYV/7divOhPftuU+sHhm2zG0
        9drH82KNYjEFeGWknpIodGcy4/TRAdbhLVXqERE=
X-Google-Smtp-Source: APXvYqyRCIiXOEAQxBgxAIj6rT5ZG0zj/+XGfeuOkhMhpz/RkkNCGna6kguEX6CAQwXhWEtnjRvPXQluti9Dl8jmL3E=
X-Received: by 2002:a05:6102:726:: with SMTP id u6mr12605479vsg.179.1574493776235;
 Fri, 22 Nov 2019 23:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 23 Nov 2019 16:22:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNATk-D2g0FJ_TVVxXQZ-m2uzdHYVaDxzuZKVX9WA+VWOKA@mail.gmail.com>
Message-ID: <CAK7LNATk-D2g0FJ_TVVxXQZ-m2uzdHYVaDxzuZKVX9WA+VWOKA@mail.gmail.com>
Subject: Re: [PATCH 1/6] modpost: add a helper to get data pointed by a symbol
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 2:42 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When CONFIG_MODULE_REL_CRCS is enabled, the value of __crc_* is not
> an absolute value, but the address to the CRC data embedded in the
> .rodata section.
>
> Getting the data pointed by the symbol value is somewhat complex.
> Split it out into a new helper, sym_get_data().
>
> I will reuse it to refactor namespace_from_kstrtabns() in the next
> commit.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>
>  scripts/mod/modpost.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 46d7f695fe7f..cd885573daaf 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -308,6 +308,18 @@ static const char *sec_name(struct elf_info *elf, int secindex)
>         return sech_name(elf, &elf->sechdrs[secindex]);
>  }
>
> +static void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym)
> +{
> +       Elf_Shdr *sechdr = &info->sechdrs[sym->st_shndx];
> +       unsigned long offset;
> +
> +       offset = sym->st_value;
> +       if (info->hdr->e_type != ET_REL)
> +               offset -= sechdr->sh_addr;
> +
> +       return (void *)info->hdr + sechdr->sh_offset + offset;
> +}
> +
>  #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
>
>  static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
> @@ -697,10 +709,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>                         unsigned int *crcp;
>
>                         /* symbol points to the CRC in the ELF object */
> -                       crcp = (void *)info->hdr + sym->st_value +
> -                              info->sechdrs[sym->st_shndx].sh_offset -
> -                              (info->hdr->e_type != ET_REL ?
> -                               info->sechdrs[sym->st_shndx].sh_addr : 0);
> +                       crcp = sym_get_data(info, sym);
>                         crc = TO_NATIVE(*crcp);
>                 }
>                 sym_update_crc(symname + strlen("__crc_"), mod, crc,
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
