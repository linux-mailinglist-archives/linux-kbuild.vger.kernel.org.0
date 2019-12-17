Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7B9122262
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 04:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLQDJG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 22:09:06 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:52790 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQDJG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 22:09:06 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id xBH391vL025060;
        Tue, 17 Dec 2019 12:09:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xBH391vL025060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576552142;
        bh=4t1lCV0uWZvKt43orN1gNW8W91nH0lua6ZWQXcaYvuY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Okp9a2bsp2PE72C9azsPCEhDvyTKuZzrLL9qYM4UOUvM9Lqq7GDc6koCQy2LAW3p+
         BwekroqObQIlECBE9QGr1guw59AoB5EFvRS8JsUIbL6OoM9xuzmhlhPrG7gnRgSVZW
         +3T6oCTNAXxh/QmepGVH2gC0UwgljFv/nChErL1BxdxCdPcmGbzw1oEA91MaV0PbwI
         03DOlkW3O9lN6Am2MIZzbOzFodeeRZZgLQx4JMP5bLLJBAdd8EYqB+JIXyMOQKawIU
         VpBbvPxCOAhmms+zsTqxpndgP7PGGcLhQWCSdXYpFKmbvklTfm6F7yTUGdou9Arhbo
         YTOD/KskdfLKA==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id p21so5560532vsq.6;
        Mon, 16 Dec 2019 19:09:01 -0800 (PST)
X-Gm-Message-State: APjAAAWVOvrD6JeUYyR6wMYeAFRa4O/exZQuQeEvShSMWmQu1W3+kgv1
        JIFLw1Xt05+kvmEgu/fldZbmS4qAKfagw/7wO1w=
X-Google-Smtp-Source: APXvYqyxsQBhb4rqdB6hYYCI8STz/7ZBGLNUTopGUs82CcGBl57Zvd0YwyiZlj3ZcI5buNlmMDb+RJY4DfSApGLxRYs=
X-Received: by 2002:a67:7ac4:: with SMTP id v187mr1511012vsc.181.1576552140771;
 Mon, 16 Dec 2019 19:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20191209035148.17048-1-masahiroy@kernel.org>
In-Reply-To: <20191209035148.17048-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Dec 2019 12:08:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWqr_kJhCs7Eohxe-QSU3A+Ebh7w88zXjYK_=V6xG8Pg@mail.gmail.com>
Message-ID: <CAK7LNATWqr_kJhCs7Eohxe-QSU3A+Ebh7w88zXjYK_=V6xG8Pg@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix offset overflow of kallsyms_relative_base
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 9, 2019 at 12:52 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 5e5c4fa78745 ("scripts/kallsyms: shrink table before
> sorting it"), kallsyms_relative_base can be larger than _text, which
> causes overflow when building the 32-bit kernel.
>
> https://lkml.org/lkml/2019/12/7/156
>
> This is because _text is, unless --all-symbols is specified, now
> trimmed from the symbol table before record_relative_base() is called.
>
> Handle the offset signedness also for kallsyms_relative_base. Introduce
> a new helper, output_address(), to reduce the code duplication.
>
> Fixes: 5e5c4fa78745 ("scripts/kallsyms: shrink table before sorting it")
> Reported-by: Olof Johansson <olof@lixom.net>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

Applied to linux-kbuid.

>  scripts/kallsyms.c | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index fb55f262f42d..94153732ec00 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -310,6 +310,15 @@ static void output_label(const char *label)
>         printf("%s:\n", label);
>  }
>
> +/* Provide proper symbols relocatability by their '_text' relativeness. */
> +static void output_address(unsigned long long addr)
> +{
> +       if (_text <= addr)
> +               printf("\tPTR\t_text + %#llx\n", addr - _text);
> +       else
> +               printf("\tPTR\t_text - %#llx\n", _text - addr);
> +}
> +
>  /* uncompress a compressed symbol. When this function is called, the best table
>   * might still be compressed itself, so the function needs to be recursive */
>  static int expand_symbol(const unsigned char *data, int len, char *result)
> @@ -360,19 +369,6 @@ static void write_src(void)
>
>         printf("\t.section .rodata, \"a\"\n");
>
> -       /* Provide proper symbols relocatability by their relativeness
> -        * to a fixed anchor point in the runtime image, either '_text'
> -        * for absolute address tables, in which case the linker will
> -        * emit the final addresses at build time. Otherwise, use the
> -        * offset relative to the lowest value encountered of all relative
> -        * symbols, and emit non-relocatable fixed offsets that will be fixed
> -        * up at runtime.
> -        *
> -        * The symbol names cannot be used to construct normal symbol
> -        * references as the list of symbols contains symbols that are
> -        * declared static and are private to their .o files.  This prevents
> -        * .tmp_kallsyms.o or any other object from referencing them.
> -        */
>         if (!base_relative)
>                 output_label("kallsyms_addresses");
>         else
> @@ -380,6 +376,13 @@ static void write_src(void)
>
>         for (i = 0; i < table_cnt; i++) {
>                 if (base_relative) {
> +                       /*
> +                        * Use the offset relative to the lowest value
> +                        * encountered of all relative symbols, and emit
> +                        * non-relocatable fixed offsets that will be fixed
> +                        * up at runtime.
> +                        */
> +
>                         long long offset;
>                         int overflow;
>
> @@ -402,12 +405,7 @@ static void write_src(void)
>                         }
>                         printf("\t.long\t%#x\n", (int)offset);
>                 } else if (!symbol_absolute(&table[i])) {
> -                       if (_text <= table[i].addr)
> -                               printf("\tPTR\t_text + %#llx\n",
> -                                       table[i].addr - _text);
> -                       else
> -                               printf("\tPTR\t_text - %#llx\n",
> -                                       _text - table[i].addr);
> +                       output_address(table[i].addr);
>                 } else {
>                         printf("\tPTR\t%#llx\n", table[i].addr);
>                 }
> @@ -416,7 +414,7 @@ static void write_src(void)
>
>         if (base_relative) {
>                 output_label("kallsyms_relative_base");
> -               printf("\tPTR\t_text - %#llx\n", _text - relative_base);
> +               output_address(relative_base);
>                 printf("\n");
>         }
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
