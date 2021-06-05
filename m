Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF3539C904
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Jun 2021 16:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhFEOWd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Jun 2021 10:22:33 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63595 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFEOWc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Jun 2021 10:22:32 -0400
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 155EKLls030434;
        Sat, 5 Jun 2021 23:20:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 155EKLls030434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622902822;
        bh=NwpVxotBB1+eReP6uTafyFIHCo1DYlGvVJA2yCxCOY8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=REox6QorF4HiAYznInvwPGp5kuWO5G7qbMbbYUe2wBY4evpD5wGFqeWdILewvSQqk
         rhV0LlPwRScs+6iH8YaTvActN0i0i+w4pd/PppbH6O4tPEXV+ie7fZwykF1j8clGiL
         Q1jUp7A6hOKayqd2G1JZ/3+wombSK1kuOCUITdeQcyB0/gBWNvJQwGDNAZ2IbPUFFO
         QYST9VqoU8EYQqe8MaS0koYmWmy1XzfrH3JxvnFfIq/PP91j5wqs0fKz//4UE+aI8X
         6MgVdWjqbPxhxpe2y2enwvqRqj8RpXS//UiVdf06hoc3Kw2dnhaYCtdZ/73XJJH89E
         ReNbMFlEPoG7g==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id u9so6045423plr.1;
        Sat, 05 Jun 2021 07:20:22 -0700 (PDT)
X-Gm-Message-State: AOAM532GXEas3O2BPV2Fom08Pn4vyYC6KX/hMKQ1XzaIYruNcAOa4EhC
        m6CZyutkFfqObdfV/jMMqUSKACH9neiiKiswpFY=
X-Google-Smtp-Source: ABdhPJxmE9o3oLqy6FZaVaCw++h+zw4+3hqfUaSdQC49qCVg8ZPcGCjTbD8wwPw+/fc+dbaqGOb2enZpV4RlnUPU20A=
X-Received: by 2002:a17:903:22c6:b029:10e:b813:eb37 with SMTP id
 y6-20020a17090322c6b029010eb813eb37mr9348017plg.47.1622902821349; Sat, 05 Jun
 2021 07:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210604153611.52209-1-broonie@kernel.org>
In-Reply-To: <20210604153611.52209-1-broonie@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 5 Jun 2021 23:19:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR6bXXk9-ZzZYpTqzFqdYbQsZHmiWspu27rtsFxvfRuVA@mail.gmail.com>
Message-ID: <CAK7LNAR6bXXk9-ZzZYpTqzFqdYbQsZHmiWspu27rtsFxvfRuVA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: modpost: Explicitly warn about unprototyped symbols
To:     Mark Brown <broonie@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 5, 2021 at 12:36 AM Mark Brown <broonie@kernel.org> wrote:
>
> One common cause of modpost version generation failures is is a failure to

double "is"

> prototype exported assembly functions - the tooling requires this for
> exported functions even if they are not and should not be called from C
> code in order to do the version mangling for symbols. Unfortunately the
> error message is currently rather abstruse, simply saying that "version
> generation failed" and even diving into the code doesn't directly show
> what's going on since there's several steps between the problem and it
> being observed.
>
> Provide an explicit hint as to the likely cause of a version generation
> failure to help anyone who runs into this in future more readily diagnose
> and fix the problem.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  scripts/mod/modpost.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 3e623ccc020b..78553f95c250 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -662,6 +662,8 @@ static void handle_modversion(const struct module *mod,
>         if (sym->st_shndx == SHN_UNDEF) {
>                 warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
>                      symname, mod->name, mod->is_vmlinux ? "" : ".ko");
> +               warn("Is \"%s\" prototyped in asm/asm-prototypes.h?\n",
> +                    symname);

May I ask for small changes?


Could you enclose the header with angle bralets, like this
<asm/asm-protytypes.h>  ?


These two sentences are related, so could you merge them
into a single warn() call, like this ?

warn("EXPORT symbol \"%s\" [%s%s] version ...\n",
         "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
          symname, mod->name, mod->is_vmlinux ? "" : ".ko", modname);



>                 return;
>         }

>
> --
> 2.20.1
>


--
Best Regards
Masahiro Yamada
