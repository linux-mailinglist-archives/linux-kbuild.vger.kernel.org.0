Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86DE053328E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 May 2022 22:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238651AbiEXUoW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 May 2022 16:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiEXUoW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 May 2022 16:44:22 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B74D712FB
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:44:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u30so32765914lfm.9
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=huOMfVzBuyOiVvdK/MBgTa5e2DlFi34FRjwinoAWhQw=;
        b=Leyfu+q2cQs4X+VAh9p7WyspRKKN9AajJaaq7iBUfrbCZulu0O4xpeTE64b8HnVfG8
         j/21YiT8ew0xb5w01SCrsWNkESNi62Og5SzruUCLHoUEkglIUoB4dCF1/rMrQUFEVFqL
         zI2gv8ybJRlKj051tfrHUr+1fF000YOYKH2XO1pp2yI+OMvZTee/FlRkkfu9QNPnI8Dv
         +ifzCPUHnbEoPVNJffqxyJRbUXQenKiIbmUQyMegTUxdBQkJdjn+5pIgCnAwW138HSic
         mfrUEeFSwJEFxT91eV2+vK8MmB1H6ek/Fhh6EehALQIfVbWZUjW4al+SabsE1u/vw2hw
         1sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=huOMfVzBuyOiVvdK/MBgTa5e2DlFi34FRjwinoAWhQw=;
        b=CKpPFYST9zxHfUROmEPWCZcf/0tjoWMqdOKf17DKOP2/VdovHaX4m6fhHNvP9PUx1Z
         23pcvb2cdE+fgLjMZsMV9yu6Sbubi6J5Hdcmi2FsPmroW+sRLbatUdOF8EmBCYTP2BH+
         NRMrstNnfweQsfP46EFxJwlf6dBq6Fmf/kILOKHauknFLBRqnAhDR2s/deLffzkwqyRD
         wCOmR94Ji1s31O6R8L8pNo/wCINwpraSn+pNxFUsPNfenZeBHvoHVCoMGQqFzp0UtAN7
         kvo9Nl+yKayPfR1DZ4dO6CY03lkFV07QYLEeEUfTV+ZmRCFf5/1KZ+l2axscl6VkeJbO
         C83w==
X-Gm-Message-State: AOAM531P3equJlJK/sdGM5zSYBmY8FA5rb9/Kr9W1bmQPa7XTkGCRnlz
        I6McxDwenvhBHIhZe20sRartboMEoAFGMzYBnpDV1sjgeJk=
X-Google-Smtp-Source: ABdhPJy6wop+fJ1n1TfLcrlKDthzTmtCj1Moa3LBd4CNE7whT6h8sZrF+BORjFxjY5h93F1+C9hs16t8wpGpStygs7s=
X-Received: by 2002:a05:6512:ace:b0:478:9af3:d9cb with SMTP id
 n14-20020a0565120ace00b004789af3d9cbmr1122823lfu.103.1653425058264; Tue, 24
 May 2022 13:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220523164626.858340-1-masahiroy@kernel.org> <20220523164626.858340-2-masahiroy@kernel.org>
In-Reply-To: <20220523164626.858340-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 May 2022 13:44:07 -0700
Message-ID: <CAKwvOd=fZ=V52fOc47O1=0wy36b8q_LO54J0099_GkouzH0SZA@mail.gmail.com>
Subject: Re: [PATCH 2/5] modpost: remove the unused argument of check_sec_ref()
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

On Mon, May 23, 2022 at 9:48 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> check_sec_ref() does not use the first parameter 'mod'.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Perhaps we could enable some -W flags for scripts/mod/?
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 845bc438ca49..843c64eebe8b 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1883,8 +1883,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
>   * to find all references to a section that reference a section that will
>   * be discarded and warns about it.
>   **/
> -static void check_sec_ref(struct module *mod, const char *modname,
> -                         struct elf_info *elf)
> +static void check_sec_ref(const char *modname, struct elf_info *elf)
>  {
>         int i;
>         Elf_Shdr *sechdrs = elf->sechdrs;
> @@ -2069,7 +2068,7 @@ static void read_symbols(const char *modname)
>                                              sym_get_data(&info, sym));
>         }
>
> -       check_sec_ref(mod, modname, &info);
> +       check_sec_ref(modname, &info);
>
>         if (!mod->is_vmlinux) {
>                 version = get_modinfo(&info, "version");
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
